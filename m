Return-Path: <linux-media+bounces-49643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD3FCE6E1A
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 14:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAC88300D420
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 13:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF1F3164DE;
	Mon, 29 Dec 2025 13:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="F/Yq/Orw"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020087.outbound.protection.outlook.com [52.101.225.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EC43164C3;
	Mon, 29 Dec 2025 13:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767014786; cv=fail; b=WUkF4/zKge9BVYanAOsMvJl3SGsvXp2YhXJE1hdPOvEOWsuOil36Tlflr138543FcDITNZKL/x/0rrtzwqnvcQXpsLRdb77+zw835fAx6IXMkR+2A5wPiVYgoE9/Sr10GDo7vK0nwmr+HJCbqdtnVLAo/JSPX1XmqLqG4w+ZBVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767014786; c=relaxed/simple;
	bh=gcesGHTXCu0y6Asw82XNW4O4fS1csQ5qhMmP77NvDrU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jAoJQF/tXd925EOvKwbPtTFEMTR1nu6fxQW8iJLqfcBGxQf9WdUruks2hrkBTMpE92a22v4Dpda4qMEKfaZhzTKMZophBSHuU6MpiCA/F2NF28rya19GEvsNA6e0sOjFUYrutNlJpEvHu863pRVhbuUstX4DqbXZvjc0X3djL08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=F/Yq/Orw; arc=fail smtp.client-ip=52.101.225.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6E69db9iXQRy5jIAYYou1VQUspsVpItgK2K1tUmVjBoni6PdVXKI8R4B5wl31+IONGKF8OyopxRu95dsreNydUrqS/mfxQTy8e67jqtYt4nfp/sUjOoDdpEAc14xORwdfAaHmkhzjeNbo5hRVU9cCxt5UaV3IkyViuGgJx8BbECDRqQbgChGKtXon5VTnac3OglY5zCBlvn6qi98psJeuTP3/t8mrXEuj/ZwFBlocYNalbtrRTP423F5NlpvyZCUMlA1x6pagbTlC+BWZCK1VcHLaAALLZTPgakX9I4YVraT8hW0aBqZpI2Zgxd8rPmzUKroaR1fTCkWm6aoAGYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcesGHTXCu0y6Asw82XNW4O4fS1csQ5qhMmP77NvDrU=;
 b=mWh6ACezD4I4MasrpnE9QFcW9CMccMYhlajthROc4CP2MexQHqK3gsyK3+OXBEGgCqmZR/uVutczUFQfi9ClxvrRuYaPm6/NTyWgLgskDT4avyAygvGKXx4FVecU0zSfZeBl78xNoCpmRXUlDH0XVbdGBjtop3NlQO6jp7W65VA93t/gAaWL1y0cEQmjMILlOd1TpEx8QtHM6qb756N26YciB4oDITnRg3OK4LogVbArwgXp2USHKPdF74aU1r++Wmkr5dwzQquOsBjBjF/TiCWt5QThKfi5FKViFCCOu7vErJbj3sbuYb3OOUj0ORwa5yO+xZJDIzV+CfA+QZskpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcesGHTXCu0y6Asw82XNW4O4fS1csQ5qhMmP77NvDrU=;
 b=F/Yq/OrwrjwBz5N1B9+7R6DOiiSOAuKx9UQ1ITIzxb5XoZ50OUP0fPTYD5YdZ7YLd+bO2JE9khJ/2HyoyECVklFcA8glUD/F0myAbTwxoCcwICnDs6rUB22BjW2kCc3spF6q8U31YM3gGHhd/L9b8zes8n5+3Glw5GKNmHHLnWPCRZc1vM3413NfeZa5PoBLfv7izczvWnd3Zr9gNE7OfSh8Zpu8iABh56zjIQtsWj/ZTDvHCDIdrGUXZCZ7oQk83niKFmEGIJMZ6/R+jEA6hXbT816/eEGhUhJCI+8K1nxBfDAiWetw4NlBEg5oTtWogIR+XSe0spn8tzV+YbC2WQ==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAZP287MB0608.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:10e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 13:26:20 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 13:26:20 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Xiaolei Wang
	<xiaolei.wang@windriver.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
	"jacopo@jmondi.org" <jacopo@jmondi.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "prabhakar.mahadev-lad.rj@bp.renesas.com"
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "hverkuil+cisco@kernel.org"
	<hverkuil+cisco@kernel.org>, "johannes.goede@oss.qualcomm.com"
	<johannes.goede@oss.qualcomm.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "jai.luthra@ideasonboard.com"
	<jai.luthra@ideasonboard.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] media: i2c: ov5647: Convert to CCI register access
 helpers
Thread-Topic: [PATCH v2 1/3] media: i2c: ov5647: Convert to CCI register
 access helpers
Thread-Index: AQHceGtVPBdG+t2I+kKz5/UzjeME2LU4iZqAgAAL/gCAAADWyw==
Date: Mon, 29 Dec 2025 13:26:20 +0000
Message-ID:
 <PN3P287MB1829C61C82B611DB6013B10F8BBFA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20251229023018.2933405-1-xiaolei.wang@windriver.com>
 <20251229023018.2933405-2-xiaolei.wang@windriver.com>
 <PN3P287MB18291169FABF1E8A01AA88B88BBFA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20251229130116.GC6598@pendragon.ideasonboard.com>
In-Reply-To: <20251229130116.GC6598@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAZP287MB0608:EE_
x-ms-office365-filtering-correlation-id: 0c851091-3ddc-48ad-607a-08de46ddda81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/uRKzhm+uBuqP9Xn7uTL5IKJoAYuL294OUDJIvdxZJUzviZv8CkcK1sMe/?=
 =?iso-8859-1?Q?YJ1ASnIwHyv6QvVAaA2xJmqOQ7ChjTjsirKFy/B1Jalslc9OXHkgKufzt0?=
 =?iso-8859-1?Q?52EOCtgMgnxmSzWkQQoBqNZ4m+pEp20RJhYPW6z7wyUV+3H/fSy5HYgMtE?=
 =?iso-8859-1?Q?ySpZa21XZfmBklrWNCuJNEHCqbq8z1WNewF1Uf4uVrX+SS3KOLLfFJYzrX?=
 =?iso-8859-1?Q?m0aIOI94MGOa2nyIr7XVXbeux1LH7/Iq7UWLU6H+Sn2fCoaFJLlPNoN7AK?=
 =?iso-8859-1?Q?c9FbwZ+3oe49FJ/v98PrEAcbBK6JJx5ECwjdls49hQoO64loogTtiPzBp9?=
 =?iso-8859-1?Q?ZwoPntIxYpEiy5v3fdcNBmfhllTRIzdC582LmrDbu2qP02rGh5YfOFtzOl?=
 =?iso-8859-1?Q?pBVQ9CLMSmZY1iiNGsOEn+vszwNxVZF5AAoX7gpAqDmcVn9eqZklOKerTr?=
 =?iso-8859-1?Q?AXn4pyr7rPqdrxGtBI9YJ6qsnT4bPPmcG+4vmWnEg4AA0/Ay3/02tITFB2?=
 =?iso-8859-1?Q?TzazrVw1H13xSu4J2aJUn+OksOXRD/eI0lBzQ2a+ilKrG5RoZc1j6NGVpY?=
 =?iso-8859-1?Q?Qb5Mu0O5XgegvTnbMuAOjiLmpUDYGMkwi8lqvs/KWenzenyhTBoSTN9Z2W?=
 =?iso-8859-1?Q?KneqiL4+5ZiNVnfyKJjCkhJr/UmEmNsaQVT9xpkhUrYsWoWWpCAcxVkxFy?=
 =?iso-8859-1?Q?k6MTM6tU1HMeXe1Whe3QzpQ47RtAPLZQZ5DRPWdWAVm7uvf33cLjNxW4K8?=
 =?iso-8859-1?Q?Par7+tSQUw1O48ZZvINvxObQTNesqebZUDvThXh6JXnRMJvuWH0TDj8XqB?=
 =?iso-8859-1?Q?zoLamTA/Ix8244evp5C9HdDe9MR5gG1xK/ZTLT1zCm6WqXeYzHdbFpLA6L?=
 =?iso-8859-1?Q?STvvKcgh8gXQHAQ6/fTm1I/xIv7mg8gCt7mYIAykzSdbaLWpQrvmYw3XzY?=
 =?iso-8859-1?Q?ji/dXgF5Em/QCcNdOJw6MJ5KmnVw2zT/OIPVG1rJwBjK9fCAXPLQw2gnkN?=
 =?iso-8859-1?Q?g+Mn1czc/m6QcqIxnBvxzTnrmul89m7nOsJvH1DIDnnUTHqlT0ldMD4dwk?=
 =?iso-8859-1?Q?NlCkdvR6L8yUpxn2dOarJolfjSKeMvobZaSkdQp8zbvy6e9q7g924typAa?=
 =?iso-8859-1?Q?Mfl4L/8liZEJaXmaJdnCo0EzJ75AYS8aWaZZueap/HF66EBnjK6eqfMVMt?=
 =?iso-8859-1?Q?XYOikuBr6tijvpdJv1DOFpOoNVfim+yzPBtVVe3/GTALpFy+IJtSpwCEN1?=
 =?iso-8859-1?Q?69SEnKGq1ZjI7Db1W2ufbNw4avmpEt6EJSd7d2WwOpPJCFffbSXILliKzF?=
 =?iso-8859-1?Q?hwC4/GV6eihLOGd+pUc+5uuiikjZxc8xT6IM0/HrMWC97CJa5w/HBmQmup?=
 =?iso-8859-1?Q?tv708U+/SISMkjPSnsuOOx9Lpkb6zVSupR686I/1zP/wFf0tXrA3+EJYVj?=
 =?iso-8859-1?Q?FVOUGS6gNppY2jrlZl5RbNPueZGsda9MQ7sNoU+aOZ/0fTgjRs0WTdzsdl?=
 =?iso-8859-1?Q?Hh8L6+OVPH6zTmjsNptLddbmzXgE79B5U9HZCD0swB5rUUEyY2aKN+V2Pw?=
 =?iso-8859-1?Q?tWHiBRDe2VMgIYvqYgwq8rno64AJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3YsDPNR2GKfrdTHypPCAeVL+0H/hdbdPXopLSHW2iWVV/xxgJPL+UXp/ld?=
 =?iso-8859-1?Q?6EMKT0ezwD8oYZ+U2e6ENZEkEKHTq51eHWjo56RPRFGzWp01YA6hf2KT2y?=
 =?iso-8859-1?Q?EZ+Bb5X2MLj78ueeV2OH01tN5nj9Y6XwoiKGQpkwvH5ltlJlE5G8GLIjnz?=
 =?iso-8859-1?Q?I+BN42Snbd7vx95BSKB26dG1KglGvDzLrBs3tJSrtaNh74WdIUNa9mrbR4?=
 =?iso-8859-1?Q?lP7jGgzgzrKLk75+FGldUw9WoUmzbuOgMOuhsWA8w1G8faywEIKGJfvYjP?=
 =?iso-8859-1?Q?w9sTLjyU7akVu0r6uwn9aljkoonG9ENvhT49M+3E3icpmcZUwwtfLQaBqW?=
 =?iso-8859-1?Q?l8yijnxJraofo8lL7aFtnH8W1JqQLbDmsVxM1CB/q36hg8d6II9i6Jg3Yt?=
 =?iso-8859-1?Q?/oeW47g5Qm+NCQ0l5Ar+RjBU0Hu4KDVUzRGBK6p5/Obn/rrCiCg7L54sjA?=
 =?iso-8859-1?Q?eEu8Yfo+f7XEF22gvrf9uPim3Hb6fKWF+NAQTKrudeUZJI4bSzK/Sb1Bjm?=
 =?iso-8859-1?Q?gByr6kqc0ZBp96iWPuy0Lhwc3iaVuu7zqjPhyDjtdz1ZSw4fzZ1hgjdZMT?=
 =?iso-8859-1?Q?xzmONm5Re9o3UGaNyT/PBH2qGOBF5P+YAZsNfwYByUwGlCZiJrUntLxA3X?=
 =?iso-8859-1?Q?llIyjUqxt11PeUztgwKbXsxJEvQ/XFwEePvulhA9mH234GrWgYcMcCj+oi?=
 =?iso-8859-1?Q?IKQpKSl/5JuepOX0ZYajGCq1ZSUqfqR88JEy3qjprF0el/xtgrCgWQFole?=
 =?iso-8859-1?Q?3kq/yN3uX256zJECCHSAhvRum+FA9WGb7YmcJEt69ywVDw5s17nWLs1V6p?=
 =?iso-8859-1?Q?ktez82pdG7QNCtYGv6xbLERt6QFVMbK4ALvrcWHy+8c8Ve4bEHxpLRys5f?=
 =?iso-8859-1?Q?qwYp1EU7z6UBdnq1+IxIanUcNuzwwWxgsnYGtaZ9uLk378BIstpsUBKfJA?=
 =?iso-8859-1?Q?jW+xqjwB+9/8MMYupBJ++aMeSVfRfHP9YmIZZ/ftiUQpQH+Qsj+M95SB0q?=
 =?iso-8859-1?Q?mCK68Di79va5HiF/cS8jlNGk+BzgbqnQh/ZxlQ65uoxWIR8DE7WjfzOapU?=
 =?iso-8859-1?Q?He361xUp76zUwN4+mvhbQY2HXetEuC7LHlND+yamFE/Hjyu5MvjYK1p2VD?=
 =?iso-8859-1?Q?PYZsokpLzBDge9aeQECXy4GZuAbm+pilMCcgxSGtffDUEqvKC9yyqHjjwL?=
 =?iso-8859-1?Q?N8e00N59yIjvvJ/qp335W6x2ludWEPSQgr4NA8+uRHNKQgOKZ/EBBdibfd?=
 =?iso-8859-1?Q?Ylb/aEfGWiBYDCsSNks9klzaWBgGvS43Qx+QgVbwwFVytS5dRWl4DxTSEY?=
 =?iso-8859-1?Q?10GcMJ2kemzCq3im819swclch+EeJ/VrtkRYZXGCre9+K7HZeANNRsYpFf?=
 =?iso-8859-1?Q?LFfPVdWr2wcFsWnAsqwI/zIkrDojrfLkXWzGSa3KjhVd0ga9htFssutxg3?=
 =?iso-8859-1?Q?Xw35V25hJe5nNEuL3iz1S/Sr7hr/IAYCWHfjFmYQmGlvhQej27yfH4pvCl?=
 =?iso-8859-1?Q?Ae3pdzFRYrugWncLaYpekvCCHauX/fdv1rcUoW3L07WhKErZu6fVYB82z2?=
 =?iso-8859-1?Q?Ils63yz9i2yWVuDJmwMDZLICXe6pWUbmuQ6Uj13d5t4ohmytichMrF7SQj?=
 =?iso-8859-1?Q?9ePdeOMrNQCM85poAfvF/JPT2PCIrvqGIPbZh3hmdmVHlmi1khi+Ki+U3b?=
 =?iso-8859-1?Q?pV3uKv84Y55icMmF2uZQ4gfYMZRCdRm565TymJERHxRSERQNf+zijZABbM?=
 =?iso-8859-1?Q?bPnuS0r3VhmD6yhJ2r7XzpMFWsnXSEPSoIm2ZG2qMlQRU9VWYEFiex314F?=
 =?iso-8859-1?Q?osdvWW9RfQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c851091-3ddc-48ad-607a-08de46ddda81
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2025 13:26:20.0753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zQ8NUFp1TdNAqDGHa5Ip2zQVi/1aDGR5I8gcGh6/Ej/Ok2FA4M1BsKLS+0kUx3khFbx4JHfMHzSnqkRJ27p9vRPi+3AVm8OtuOxDJlnFViw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0608

> On Mon, Dec 29, 2025 at 12:37:41PM +0000, Tarang Raval wrote:=0A=
> > > Use the new common CCI register access helpers to replace the private=
=0A=
> > > register access helpers in the ov5647 driver. This simplifies the dri=
ver=0A=
> > > by reducing the amount of code.=0A=
> > >=0A=
> > > Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>=0A=
> > > ---=0A=
> > >=A0 drivers/media/i2c/Kconfig=A0 |=A0=A0 1 +=0A=
> > >=A0 drivers/media/i2c/ov5647.c | 997 +++++++++++++++++----------------=
----=0A=
> > >=A0 2 files changed, 453 insertions(+), 545 deletions(-)=0A=
> > >=0A=
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig=0A=
> > > index 4b4db8c4f496..cce63349e71e 100644=0A=
> > > --- a/drivers/media/i2c/Kconfig=0A=
> > > +++ b/drivers/media/i2c/Kconfig=0A=
> > > @@ -529,6 +529,7 @@ config VIDEO_OV5645=0A=
> > >=0A=
> > >=A0 config VIDEO_OV5647=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0 tristate "OmniVision OV5647 sensor support"=
=0A=
> > > +=A0=A0=A0=A0=A0=A0 select V4L2_CCI_I2C=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0 help=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 This is a Video4Linux2 sensor driver fo=
r the OmniVision=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV5647 camera.=0A=
> > > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c=
=0A=
> > > index e193fef4fced..fd69f1616794 100644=0A=
> > > --- a/drivers/media/i2c/ov5647.c=0A=
> > > +++ b/drivers/media/i2c/ov5647.c=0A=
> > > @@ -22,6 +22,7 @@=0A=
> > >=A0 #include <linux/pm_runtime.h>=0A=
> > >=A0 #include <linux/slab.h>=0A=
> > >=A0 #include <linux/videodev2.h>=0A=
> > > +#include <media/v4l2-cci.h>=0A=
> > >=A0 #include <media/v4l2-ctrls.h>=0A=
> > >=A0 #include <media/v4l2-device.h>=0A=
> > >=A0 #include <media/v4l2-event.h>=0A=
> > > @@ -41,24 +42,19 @@=0A=
> > >=A0 #define MIPI_CTRL00_BUS_IDLE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 BIT(2)=0A=
> > >=A0 #define MIPI_CTRL00_CLOCK_LANE_DISABLE=A0=A0=A0=A0=A0=A0=A0=A0 BIT=
(0)=0A=
> > >=0A=
> > > -#define OV5647_SW_STANDBY=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x0=
100=0A=
> > > -#define OV5647_SW_RESET=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 0x0103=0A=
> > > -#define OV5647_REG_CHIPID_H=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x300a=
=0A=
> > > -#define OV5647_REG_CHIPID_L=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x300b=
=0A=
> > > -#define OV5640_REG_PAD_OUT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x300=
d=0A=
> > > -#define OV5647_REG_EXP_HI=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x3=
500=0A=
> > > -#define OV5647_REG_EXP_MID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x350=
1=0A=
> > > -#define OV5647_REG_EXP_LO=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x3=
502=0A=
> > > -#define OV5647_REG_AEC_AGC=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x350=
3=0A=
> > > -#define OV5647_REG_GAIN_HI=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x350=
a=0A=
> > > -#define OV5647_REG_GAIN_LO=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x350=
b=0A=
> > > -#define OV5647_REG_VTS_HI=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x3=
80e=0A=
> > > -#define OV5647_REG_VTS_LO=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x3=
80f=0A=
> > > -#define OV5647_REG_FRAME_OFF_NUMBER=A0=A0=A0 0x4202=0A=
> > > -#define OV5647_REG_MIPI_CTRL00=A0=A0=A0=A0=A0=A0=A0=A0 0x4800=0A=
> > > -#define OV5647_REG_MIPI_CTRL14=A0=A0=A0=A0=A0=A0=A0=A0 0x4814=0A=
> > > -#define OV5647_REG_AWB=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 0x5001=0A=
> > > -#define OV5647_REG_ISPCTRL3D=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x503d=0A=
> > > +#define OV5647_SW_STANDBY=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI=
_REG8(0x0100)=0A=
> > > +#define OV5647_SW_RESET=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x0103)=0A=
> > > +#define OV5647_REG_CHIPID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI=
_REG16(0x300a)=0A=
> > > +#define OV5640_REG_PAD_OUT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_R=
EG8(0x300d)=0A=
> > > +#define OV5647_REG_EXPOSURE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG=
24(0x3500)=0A=
> > > +#define OV5647_REG_AEC_AGC=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_R=
EG8(0x3503)=0A=
> > > +#define OV5647_REG_GAIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x350b)=0A=
> >=0A=
> > It should be 0x350a, not 0x350b.=0A=
> >=0A=
> > > +#define OV5647_REG_VTS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 CCI_REG16(0x380e)=0A=
> > > +#define OV5647_REG_FRAME_OFF_NUMBER=A0=A0=A0 CCI_REG8(0x4202)=0A=
> > > +#define OV5647_REG_MIPI_CTRL00=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x48=
00)=0A=
> > > +#define OV5647_REG_MIPI_CTRL14=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x48=
14)=0A=
> > > +#define OV5647_REG_AWB=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 CCI_REG8(0x5001)=0A=
> > > +#define OV5647_REG_ISPCTRL3D=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(=
0x503d)=0A=
> > >=0A=
> > >=A0 #define REG_TERM 0xfffe=0A=
> > >=A0 #define VAL_TERM 0xfe=0A=
> > > @@ -81,23 +77,19 @@=0A=
> > >=A0 #define OV5647_EXPOSURE_DEFAULT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 1000=0A=
> > >=A0 #define OV5647_EXPOSURE_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 65535=
=0A=
> >=0A=
> > ...=0A=
> >=0A=
> > > @@ -1435,6 +1335,13 @@ static int ov5647_probe(struct i2c_client *cli=
ent)=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0 if (ret < 0)=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto ctrl_handler_fre=
e;=0A=
> > >=0A=
> > > +=A0=A0=A0=A0=A0=A0 sensor->regmap =3D devm_cci_regmap_init_i2c(clien=
t, 16);=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (IS_ERR(sensor->regmap)) {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D PTR_ERR(sensor->r=
egmap);=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(dev, "failed to i=
nitialize CCI: %d\n", ret);=0A=
> >=0A=
> > Use return dev_err_probe();=0A=
>=A0=0A=
> dev_err_probe() is fine, but goto entity_cleanup is needed.=0A=
=0A=
Yes, my bad. =0A=
=0A=
Keep the existing return path.=A0=0A=
=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto entity_cleanup;=0A=
> > > +=A0=A0=A0=A0=A0=A0 }=0A=
> > > +=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D ov5647_power_on(dev);=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto entity_cleanup;=
=0A=
>=A0=0A=
> --=0A=
> Regards,=0A=
>=A0=0A=
> Laurent Pinchart=

