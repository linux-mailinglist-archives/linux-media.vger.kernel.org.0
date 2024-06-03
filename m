Return-Path: <linux-media+bounces-12460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3208D8391
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 15:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 550B628257D
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 13:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20E512C816;
	Mon,  3 Jun 2024 13:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Bm30Qw21"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2059.outbound.protection.outlook.com [40.107.113.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D60A129A7E;
	Mon,  3 Jun 2024 13:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717420351; cv=fail; b=rbT7xRpcUr5sb7Q3ajLMop20+LutgZ6Kz3RAmB7mTICUtWagodhP78kNYvmXGBHY0BaqGrmY7iDEjAPp0kLX3KI+lf6nuqPBulJyqd38BNzLsdE4rp4HjQl77ENsZyIjOJ85/U59nKdzxls79sHlusGb8N+jY1IN6wc3mibOSlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717420351; c=relaxed/simple;
	bh=K8bcDlL5sesc5oQofqOFtBb75ObWJiL7pw3o+I3Ln8Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P/NOk3ooZH04cPhGVUQIoXbA8mPPgbtWAPVJ073T6hmYBXU8fMMtJYDbSCgvkKAd31oXx3OP1UcZBvoEJ4k3sDM2eqObnaTvWvwElQcas7VHyWdIwZWJhurY9EGdIV9l0BdVks57xckNht3YOI1PA4c2hpIV3g7qqzxFrBXOszQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Bm30Qw21; arc=fail smtp.client-ip=40.107.113.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLC1+oRlwqDoXzl0vuiUwPxUx+xCcUF/vSve7R+PTi7oav72mEDZXzfUib4LCm0BZi79YTot/ZNvMhM+mn7wMc69Kc9S9I2PZERWvYDtRa2RymoFlk88vEoaq+sQKa58daWr1qggJyQFLfWP83zB9BAV96amtPVIORfo3GJCQwBELmrh/umTD1dGWXRbyUXjuiszAjZPeNjLbtWJm/R+RwuIX0s3IT67QuLDb3ugflAYWye+c7XJBQKb08H14MqvHGs0qWvAZpdwhmNYUJRkDWH3jXf297wEDI4w8PY5xNMO0YjspXzn1c0mNKNg3p7rA7xyvLgYf2i9waw51U3Dkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiWz/t+Svr8/74WhhcfGFBlztPUxA6PF0/zTivov+yQ=;
 b=TDrWK9KJNDDCz/UdfeS/pDIaWk5FwY7wXMAfIP7zcVz9xsI8Mux1PXAAmSeQds/URxuJdi7+1UvV8OGd0G3EIU81zEox5F09I6599nE2C2OEr3uvo2erMfoq/Jh+8bqGO53cO98/E+JLtM5JD2sHU213nofTHyNSZQtYesPbvPTLsolc5CuBYwRhUW9ZELcm4O3GVWvGz+Hv1WwiqZIqQ9mm9FOUjsDotDDySM0lJ3nUs3hS+pCmAO92vuTFNe6Su3vtTtX6uooY789NxzMQggdkaaqMOVUl58dQqoXO2sULxMg4ub6afkJ2QP9MgaNk4sd46kal96PdTnpH5JkceQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiWz/t+Svr8/74WhhcfGFBlztPUxA6PF0/zTivov+yQ=;
 b=Bm30Qw21XL4Va54qjuEzS6gO/T2m26EPs+NWWach/D/aFb8XUu0ulUl0aUbCyAvTiA6qlQ2mKpIPY4vkUT6I3nFV9icBl3ja6ZHA5AwGy4NAPfb0OLSuGqhBGiO7k+0BmRKy13tnyTRVt1qvYiOU/+fg2T40KrJAil1UCOgvAyI=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OSZPR01MB8663.jpnprd01.prod.outlook.com (2603:1096:604:16c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Mon, 3 Jun
 2024 13:12:24 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 13:12:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, biju.das.au <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v3 2/2] media: dt-bindings: renesas,rzg2l-cru: Document
 Renesas RZ/G2UL CRU block
Thread-Topic: [PATCH v3 2/2] media: dt-bindings: renesas,rzg2l-cru: Document
 Renesas RZ/G2UL CRU block
Thread-Index: AQHaXokelDhLAFX23keERFMch9PldbGEQB4wgDJxlwA=
Date: Mon, 3 Jun 2024 13:12:24 +0000
Message-ID:
 <TYCPR01MB1133201863366F8F1B6F17D6F86FF2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20240213142941.161217-1-biju.das.jz@bp.renesas.com>
 <20240213142941.161217-3-biju.das.jz@bp.renesas.com>
 <TYCPR01MB113324049EB71B18E63A075DF86182@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB113324049EB71B18E63A075DF86182@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OSZPR01MB8663:EE_
x-ms-office365-filtering-correlation-id: d2842e0a-8afa-496f-e817-08dc83cecf28
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|376005|7416005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?RFz4a0Vwn7OuuQDpf53X8t2KUhogxpMTYIkqsigahzkjaIwBh34Deeb1xUMc?=
 =?us-ascii?Q?QiGJiuEAmMuSnwfl4cDq2O3bV7i8C+mUQnwnLk7PiWzzZju6D8C1d7aheiwd?=
 =?us-ascii?Q?HqnxjLIJVicNk+vpwJmY8FLZ9nOjGpmYmKl/paCdDaVTEdNJR9d9F55B5YaC?=
 =?us-ascii?Q?ALWxhA7fQoUbFSTKASpRi+A8OPTsKKy13S8AJ747oPFTWU7OKuzwX3Vrasyh?=
 =?us-ascii?Q?+gsQ/gHFSBZ/5zc79efNIZ5FOwdIWKQz1nRYAmF9idHdFVQrNIF17PMgY4et?=
 =?us-ascii?Q?nnBqWAb8SPGM73RFJgU1EEb81DwjGL2boof/4p57/GvA/00tnVHH4irbZcRJ?=
 =?us-ascii?Q?Xqt42wij7HlQY2QRjxbJYu4f4iebEFY7sDenI8z/BpU6b35OXaMBgGzKF7Xk?=
 =?us-ascii?Q?ZOwJjDItWGMrbSRgYKKzYaIu+oe3CpFH9l4o8DBDS3e+oqUhl9vl4DMnyhUn?=
 =?us-ascii?Q?1fByg7UxqtqWe9VyPnDgc9qOc4tmyxHsi2WywQqpkYvN8y95tRXH6vXLsJ/g?=
 =?us-ascii?Q?890lODndvBgZpf0XcyKrK7NvyjBbt43M8z/b5ebggYO9FeCeiceNBxhI/nS9?=
 =?us-ascii?Q?3q6i+Ms5PBuMNtai6UEXyuxr1Uhcy5FOVKCOJyBDZ19w4/kP9E/QhNYdP73i?=
 =?us-ascii?Q?SVHFhqh+wFw2Z9eTTFDMF6k2CKlOTSNKqHf4Uzm75zOsZaGOxFoFGWNjRYWx?=
 =?us-ascii?Q?zU+9Dl4LknxpIVd88Uj7QnokGXGzvtTr1B0mjZs6Q5okJcPrN/1RHunmELo7?=
 =?us-ascii?Q?YUXOjUmZF5izAnr6dX0Qzsifkd+Xn9h2QiAHns0QetMd/+/05IzFIqkyN8br?=
 =?us-ascii?Q?0OTdEZ91CnNSuvnuxihb9PScATDm4eaRxTyRqJrqaVe4+L+9A+GNVvvDU/Xm?=
 =?us-ascii?Q?32W8LYFwu0Qc8HwyVXMnR6MBY/PUz10HLMq1BJ0tYASmxPwwCZptkyLlTfcK?=
 =?us-ascii?Q?Vqzao7FWqWECYIrqrYgxcCWimU1KM4d6ys0Pd80LyF8DGgMsylyLKdnszWw+?=
 =?us-ascii?Q?vvQ1Eld7DRuILdMgrbSp2WVvLv86fN901/AxnZecaXob+Dc1910grlBSNZ9V?=
 =?us-ascii?Q?Fc+QyrnKkKTzGHIlNNP081KF3KwaFY0/cp6DcYlCFTWmfqqWV8EFHFdRM35j?=
 =?us-ascii?Q?AUySJXUN19xrljSfMCsCQQvbn7BxwFs8/YZws+PEQw3db5GNzOjDybzH3mpy?=
 =?us-ascii?Q?vG5HfgD29/C52UbXNUaId+fc74w8zKzf6xl8sfnnqgmeKQRn6pIORJpCOT0m?=
 =?us-ascii?Q?OpI+VgRQlaCn8Qfpla1gVQLrJrVqMR9BeEFq5o2yDghISup3MaMA0ubtkiYO?=
 =?us-ascii?Q?gIYU63asHIvUV6DM0faw/dzTuOOePV9h2X5VP9jjz5caqA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0T+/XAD+zcNo3CjfmxmDiVdtgFla7w4wnVrzHF7Z5bb41UFTS5nwnvI6sY0v?=
 =?us-ascii?Q?VXUPMDqb4EZUGb9A9KDaPEz0qJyuU7Gkm55jTfYfZOs0iHxcuKbWi+C8f9Se?=
 =?us-ascii?Q?8r5Q/6zYW9svqZaCCG3fU3i9BJhngz8eZObXD1QYhhnyKDq34ru1RSe83ypv?=
 =?us-ascii?Q?60DiUm/TzykZ/IoFqBF/ovfnG1JKGF90B1K7e3FNlxslpUD9OOzpWZfTcqG1?=
 =?us-ascii?Q?MTbSijJfGj+bJCs5uHllcv+2oSSDRgOHXYKoqe9j45upZVrxtjFCt8NTFhTG?=
 =?us-ascii?Q?b0UJKgiqlqGlZnVMDnuljTKgOVj+A3XYRQS/igXfcsNRDTVirPsT3NqU7hde?=
 =?us-ascii?Q?2nlChtBZYv1NgwFUFlacG79QApUv3GXCrBRr2QAghU6RxvBxOspnZoykJ55E?=
 =?us-ascii?Q?B09e3uCo4R7yDL/3CWxpdXq4S9zuKTljRkJ6atU1LOh8VWrTwsSrcPhLqg5S?=
 =?us-ascii?Q?bz+9BpnVXdTb36BSNTuTJWyzONj12rxVEZW9JAPf4UiuBlFEoKeSzW2rXcuu?=
 =?us-ascii?Q?WI1gxuy9xwazjMPug3AQpOy/XaTtaVxx344svU87lOTu6y1Vr7KDzu0TskYF?=
 =?us-ascii?Q?BV39bIlDgfWKSuInf0Y5XjFpS9m4AIi0acSs4cLwiybTRDTeQilVmpN3/oKr?=
 =?us-ascii?Q?auv7IdqWkDqvdC2sWcDGJleUNNE9g0jZxWLBSwyU0SQVghyvnYCMU6L6J0lM?=
 =?us-ascii?Q?/nM5GOD9utYprndL8X7eLgM3U/XfOVhLWlIgeQ70t0dpOK8pPbVPodR+cubg?=
 =?us-ascii?Q?n7cZD1TXfjDJrBUo6oR2YA4qK4U4Q2kCaKRMGffUzClkx53eXhx8qjvsO2DC?=
 =?us-ascii?Q?G0Er7Zs3pfC1F8JhW6XLcavgbNytDjuC73V3w+zQ9ED3zIK266kT7B3RAH3b?=
 =?us-ascii?Q?3J/5m21iKQrGX2Va2l/ubRMilko3+HxOKaEXUDs7hKjchwHt3BldnWX9FiUz?=
 =?us-ascii?Q?F79OenJqaeEi+atZN7OFtmcQOuo9J+6dQ3JK61w4qQkNad5qdgFZT/w7mQYH?=
 =?us-ascii?Q?bO7WbQUhY+Sbxoet9u6ZvgbLfFiHcYzuddlTcWkdW1eZECOQwVV30XBgFXeE?=
 =?us-ascii?Q?Q5Fj7a7iGYYgQj8yyUqyVxRS+o/30AubInHmUOQ/GCRUlpMTuNY69IUVvmEW?=
 =?us-ascii?Q?+uZbjFdb8LMLmICM4C3AUqjF6obEjRP/EJxJzaoorrmnqqLHrumYm83qDS7h?=
 =?us-ascii?Q?KyM5yx76r6r9dXgyXYwkrJId+2xB8UTEmGUVbMx43hkPK4AMY7AQxyvYTTZ5?=
 =?us-ascii?Q?b9QIDKfmHAbri2MZBPVr72vX21amar+GJ6LuItkpft7YlZNjKha1M5IMOJ6V?=
 =?us-ascii?Q?TiDEerYuWjh/H2anJOluIDloJUD5DeMYdeZq+RRA1zvtFsNGpg9QQ02zeo4R?=
 =?us-ascii?Q?G0ACqaHMJ+qQERF8M6MSFuWGoZ5Zq90H42pxRzrUyqvN0Ehfkp7fr+SJkvgR?=
 =?us-ascii?Q?t12QZoHgqI1WC/BFLUXYcB1yf+h5hhznYoo5254BJna0NUlWiJxYenN1GBGS?=
 =?us-ascii?Q?r6ZUefHMpgblxq00h5KqGG9fh0yAnuC1aqx3jru/NA9KUyhY7sFlYbxin1WQ?=
 =?us-ascii?Q?rBi/u/gXbQM0Q5WIi9q5hCFEQrxM1siYh7s0ibGIHLsbamu8PKYwliVxuCKu?=
 =?us-ascii?Q?CQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2842e0a-8afa-496f-e817-08dc83cecf28
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 13:12:24.1269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rzawpd5EFGyLCdVBzuZh9x+8WvTiby8jKZbrzX/oLu/299k9DyYbN44u7ILx1MguwzmC8oPwCliOOgLrezi/AG2wLMer5OCwGMtDlmWWpVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8663

Hi All,

Gentle ping. This patch has been Reviewed by DT/Renesas SoC maintainer. Sti=
ll not in the tree.

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Thursday, May 2, 2024 11:51 AM
> Subject: RE: [PATCH v3 2/2] media: dt-bindings: renesas,rzg2l-cru: Docume=
nt Renesas RZ/G2UL CRU
> block
>=20
> Hi All,
>=20
> Gentle ping. Looks like it missed out in previous kernel cycle.
>=20
> Are we happy with this patch?
>=20
> Cheers,
> Biju
>=20
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Tuesday, February 13, 2024 2:30 PM
> > Subject: [PATCH v3 2/2] media: dt-bindings: renesas,rzg2l-cru:
> > Document Renesas RZ/G2UL CRU block
> >
> > Document the CRU IP found in Renesas RZ/G2UL SoC.
> >
> > The CRU block on the RZ/G2UL SoC is identical to one found on the
> > RZ/G2L SoC, but it does not support parallel input.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2->v3:
> >  * Added Ack from Conor Dooley and Rb tag from Geert.
> > v1->v2:
> >  * Dropped the description from if/else block.
> >  * Dropped driver reference from commit description.
> > ---
> >  .../bindings/media/renesas,rzg2l-cru.yaml     | 35 ++++++++++++++++---
> >  1 file changed, 31 insertions(+), 4 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> > b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> > index 1e72b8808d24..bc1245127025 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> > @@ -19,6 +19,7 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > +          - renesas,r9a07g043-cru       # RZ/G2UL
> >            - renesas,r9a07g044-cru       # RZ/G2{L,LC}
> >            - renesas,r9a07g054-cru       # RZ/V2L
> >        - const: renesas,rzg2l-cru
> > @@ -87,10 +88,6 @@ properties:
> >            Input port node, describing the Image Processing module conn=
ected to the
> >            CSI-2 receiver.
> >
> > -    required:
> > -      - port@0
> > -      - port@1
> > -
> >  required:
> >    - compatible
> >    - reg
> > @@ -102,6 +99,36 @@ required:
> >    - reset-names
> >    - power-domains
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,r9a07g044-cru
> > +              - renesas,r9a07g054-cru
> > +    then:
> > +      properties:
> > +        ports:
> > +          required:
> > +            - port@0
> > +            - port@1
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,r9a07g043-cru
> > +    then:
> > +      properties:
> > +        ports:
> > +          properties:
> > +            port@0: false
> > +
> > +          required:
> > +            - port@1
> > +
> >  additionalProperties: false
> >
> >  examples:
> > --
> > 2.25.1


