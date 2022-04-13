import Image from "next/image";
import Link from "next/link";

const SellCard = (props: any) => {
  return (
    <Link as={`/marketplace/sell/${props.item.itemId}`} href={`/marketplace/?tokenId=${props.item.itemId}`}>
      <a>
        <div className="bg-white overflow-hidden text-gray-900">
          <div className="bg-gray-300 h-72 overflow-hidden relative">
            <Image
              className="rounded-tr-md rounded-tl-md max-h-56"
              src={props.item.data.image}
              alt={props.item.data.name}
              title={props.item.data.name}
              layout="fill"
              quality={100}
              placeholder="empty"
            />
          </div>
          {/* <div className="my-2 p-2">
            <h3>
              {props.item.data.name} #{props.item.tokenId}
            </h3>
            <p className="text-smm text-gray-600">{props.item.price /(10 ** 8)} BNB</p>
          </div> */}
        </div>
      </a>
    </Link>
  );
};

export default SellCard;
