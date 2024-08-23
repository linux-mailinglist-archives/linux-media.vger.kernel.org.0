Return-Path: <linux-media+bounces-16639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 967DA95C8B0
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 10:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 242791F2469C
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 08:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B6F143879;
	Fri, 23 Aug 2024 08:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="uhS2MfWc"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0091494CD;
	Fri, 23 Aug 2024 08:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403497; cv=fail; b=fSGOHXpi+pp4xP+9u12/4Bc/ywrNWwzFys3GSpY2gOrKe2f5k//RMXKIyjBm2cpG1eCgxfcXEsnOW8ICyC/9vivczyV0NIYUWOY+SyoL//1p95ZrjT0cN9zONXcy6Ff84ch0+x0p/rHIcIx5rWnWIMratKen5BJgg2hUJ5Rz98E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403497; c=relaxed/simple;
	bh=gUhx5dhHO8NV1Nbuff3ztMch4GgEIFtsgwTEkBnx8E8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CgCFYzOthz/9qkg9BeJ8RtpKtvIzuD3jROqt4T3YnjEiEzv800f2Xo1eR+kJvYKphd7p3df+wHU7PaiHwjnCghJsh7ZJsdCBfsfrq1raJqacQTzi1/BJcb859j4mHygMHTVfn4f0SaZdpqkOiG4lQjwFinOkmAZdTtyflK5NZg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=uhS2MfWc; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dm13Re9EuQCrxGosXGKCan4YPkW3SbfZ1aFPV6n3R7yIPfsiROTOAW9xNh58ZC32trukyzmYj4hrk9qOgvluwn7f2hhjlAlI88W1V9CWwz6PgtehCIcWZ40uEcG4TVzm0xKQIiBkTI61e/t6JIkzW1IFfumsKaz7b+Fw9HllV4Y0og4Z+DGo5tJODWdbtsdORrIsL3CB4ybT5xTe4++bf3BRO/22a6CV0sE8RC2OloINi3AAhRypcvRS7kO3sq5Km53DlaI7T24jRdp+cUrxJXObcRZ1yoZUUse3XbIy8zdu/10f3J3/gLF7cWjp1z+X0w8qnoF28QIBTO7qB1eODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PU9CUGsPipPn3YS7ov180pCB423oSDbS0d/MnwmiqXg=;
 b=xPF5aQIt5zo8cD2SAtUSvY2EOR7FNjsJT+Es1RNUsJrEZT0p0MCXRBgglLdVgw7LlLrFxC0aQ+WHPuvRRwXmTk8U7LQuaUSklXkb0pVroKu2y6yuyUWj8PtdCZAcZQTJ8hWSJRDS63rUrgbmn9J8W+WsAyKx4oyXgtqV7tEJLkIiyN1ofAKBKwN4UvKypW1onfw/ApnNOPlndcb2qcNnnBHsDwvJ77SXxpULFqUQFaPc2x9/k7ly5iJYV+Ny0A8gmMs4JwLgkc6/OGK/NdhoRWrHOWV5ZNKnsNByG8nD8TMVjfn727Lv3rVfHBRs6aANY9aNjHCbFfJsFrnkyaEoqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PU9CUGsPipPn3YS7ov180pCB423oSDbS0d/MnwmiqXg=;
 b=uhS2MfWcsT8pwtbgfOZ3sv4+Sp3yW3hExonnfHstdAsLHCdQi1NA64sqqBat3bFszazDbeArIY1lI6dQKuES/HR3hqqu4HbC4ekfdDfPfUD5LcdAelRNb0rQkvUykUEAf/cXz87GyQO6LS6gMAD6ucibHSOnFmeysim9yxTh370=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8333.jpnprd01.prod.outlook.com (2603:1096:604:1a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 08:58:09 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 08:58:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	biju.das.au <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] media: platform: rzg2l-cru: rzg2l-csi2: Add missing
 MODULE_DEVICE_TABLE
Thread-Topic: [PATCH] media: platform: rzg2l-cru: rzg2l-csi2: Add missing
 MODULE_DEVICE_TABLE
Thread-Index: AQHa42mkAJms48AuFkCGFoSH/88IgLI0reDQ
Date: Fri, 23 Aug 2024 08:58:09 +0000
Message-ID:
 <TY3PR01MB113469C7FEF9FAB6394992ACF86882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240731164935.308994-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240731164935.308994-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8333:EE_
x-ms-office365-filtering-correlation-id: 9afbbd9f-96fb-431d-8b45-08dcc351b604
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?MS1LXCTSnoBlHz907G6d9DOCxtjzM8dueRzm1pHSaRkKVHzn7sB1FeImG/qW?=
 =?us-ascii?Q?Hn2t4z+GqSGYZiirxg1E3ZJqqzuweF94cHJPlomcndQi6jjz6Jt8JywpJ3rU?=
 =?us-ascii?Q?pg4cl4PJ/FeKQkk4g+v2FTI498Me8dIVZCcwJklUK/VATJ4esdXteg0q+X3G?=
 =?us-ascii?Q?TChaD1BUFCJQR89m1JYqSPcM0avdWkdc3CWTfude1k6b7qQOpxwGpq/1SLGm?=
 =?us-ascii?Q?sLAmx8Iti+ghrBSApzJ1HUMkaQXe2kRFUbwVva2v6OD+khB/t/IBdYblhUvR?=
 =?us-ascii?Q?p4KYMoJo4/jKs2AfrhbnjccN4bprn89CcI4LqGDlavNaUWkTvnyQ+j2SO35u?=
 =?us-ascii?Q?S1o2bCxU6+KTag5Xh1b74b7AWZr0LVgQUvemBtUYf8CnsClArZY9fU9RV5rd?=
 =?us-ascii?Q?V26WQPY74IIdmQ+EgDy4JTHhbV06Uioye6lgVxxtP8hKiD1qjvHrHrmqMQuw?=
 =?us-ascii?Q?2L5GIOCxhwhpLkwSpVdGfsykaOnyOH+gzmD2G/oX6/SlLrLyCOG0JJdbf+vX?=
 =?us-ascii?Q?ZErfFb88QrsgnAzgoui+jSjLRDKtC/1MrSibA/lf11Dahm4b/EB1H+Lr88EB?=
 =?us-ascii?Q?dPjg9AKfmqytANjZ9A1MV002eMuckJ3Y0iw1RNfbrs2EL2k6sGfADtaGDCdA?=
 =?us-ascii?Q?T3rRVPQ5jLAvzLDsCzVPOaKC5pdrMX6KaqpGzK6yC2F/VShlHOL0OA2+ql88?=
 =?us-ascii?Q?NVaM859R5dlOkCOtip4k5HrB/2MpuDNWdi3btrpnDHmEKb+d9gGj2FGUYyY0?=
 =?us-ascii?Q?NOgpCPQGedQn+MB3jAyBciFRs01GYKxipbKE+mzw2E2bUI+Azkm7wv1ADFEZ?=
 =?us-ascii?Q?CpuGp0r2eMaX79PUvaSdoRBalQU8gVvGyYbrfA8DFK57+OdEnBlx+9DDI6Bh?=
 =?us-ascii?Q?20U52/WdE98U9YKbwQemXiZ3VsP6ka3hXoAoEC0FznVDrXEP+7FPxHDuObZz?=
 =?us-ascii?Q?NO6BvOLpRNUSvDg8xoCyWI2S/9TmcdY+5EK/3OAX9kHJKhJv3pzblesL6Xmd?=
 =?us-ascii?Q?gLVfiqVBDJhKguutPV0mlaWkdZYUnAvwLOj+w8ztSAOrJ10Zk4ES2X8KyH1q?=
 =?us-ascii?Q?rv5/ys41bXHd55TEoKLB0TE13fmHK6QHKIXj6MAD6RGRXaj9KMco+DByLs1e?=
 =?us-ascii?Q?T5p72v09i+Z+KeTMa4O8xsDKxLoJknSLUakGVYprlnTHR2LOuIZyE4A4PBkP?=
 =?us-ascii?Q?KthqQAnLPfu/1h87LQwZQ1S0lUGvOhj1wCToQJ3ZO5Ftlr/8HXFtEWRhSsUJ?=
 =?us-ascii?Q?JLeOU2DeWCyAnbonWnr+lODw8bdQCE1pxNKjalW05G7U5x7jfX2OTRO11pLx?=
 =?us-ascii?Q?t93s0oXKMqN1uZL8DEWksr4HwcWkwdOKjxiwvzE67nVzMsav9p4tJyDXfDls?=
 =?us-ascii?Q?PO2SFmocyaCOkMlA0/r+LwylzexfUluc+OjFViJWRmve6c+zqQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qVLJv9mFrMP0dVLqvyogf++NyJwDoLmmolO+Jpjf8sPE0Lga87KPAH9T5ol/?=
 =?us-ascii?Q?bcT8kJX9COwTr+uGeq6K9QpirLUAdXFJFh4LKpl4xKc8C+RL/9EZbuLYnKe4?=
 =?us-ascii?Q?oLEWuZoKoxf7ngpPvITlDld1bvi2s87mITuQ61L1R8CxwpyP1VUqP3YpADuB?=
 =?us-ascii?Q?g+kHid+inc5vL9FqLI7bY5hz9RnDp4Q81AXilkqMKj7HSekH3kjLTHqSAQTB?=
 =?us-ascii?Q?XCx4CTxq2Vmg+QjTAfQ97UqA166N3450RQ2q8GK+JNSmpusTgwLfLV8qBk+r?=
 =?us-ascii?Q?qhofoXFTC1G4jAfBqgoZbjvsjHjJTTXHaCgHQH8A41JEbFiTcdgGmrcuAfmd?=
 =?us-ascii?Q?Gvkp/CZVjCMCUd80y1pEFgPHSBXXLnBj0uSRXUAhdqnEs9HRMBuhJyVLsgWF?=
 =?us-ascii?Q?d0+i9xbyJ6UK910bQAK/LJtFxteRy/g6jNHH/NGZM39EWYowTI4uNJXr711B?=
 =?us-ascii?Q?02yMKXybju36vWS32C5K+gEabC5gpOFMVr4bB2UWBe9PRHFJpOMZS4SdA/Io?=
 =?us-ascii?Q?5CKOcDgKL+S5AvgXhrQbST5GS32sZqiKjYlSvhBPDG942P5IKUWSUwh4b4Pv?=
 =?us-ascii?Q?VlnaatjrZnKHQSXjjE/rz/4SfMYQhaSGAFlSNCSB8J+TNH++udSFGakgPv0t?=
 =?us-ascii?Q?5VmTravzfN4oH5Q+DKQlW64pTEudl9iyZ4R8V01isOO7OtSZQg9iGaBUFC6o?=
 =?us-ascii?Q?q09Qmao6W+S+8jZPXP1QMiymJ/Ci05tTQMko7kvfRdndwhslgAhFT4gImVzL?=
 =?us-ascii?Q?jQi3pmdBHw9NOaDyyZgcXnt5VioFlclxnzyM3NnPtNonSLUbANTcFKOUgfz8?=
 =?us-ascii?Q?hSHluYwelX7qqjxsNF1WNuh0bJXFaD1emHsZiujeoAMTDG49Veeel8aEEM12?=
 =?us-ascii?Q?zuZHcJuOJqDQVCOGnMOTGEraPKcJEZ77dZSnobpmkLIg1/uHKc9txM0VvNAs?=
 =?us-ascii?Q?NZsB4bTc9g5hhjDjDDkwy6EN1jJeOCQ8OYQAKot0Z96bOACr7WQ2zv7PiS7E?=
 =?us-ascii?Q?pmWltOSbFdOnt92QYr+v8omotYh/BL4CALX6z2mlwnnvzNzvO2YYj4r3vLBb?=
 =?us-ascii?Q?fBHdQp71Up9iFAUnN/YFwDn41q4zBbZs1wr4xGKlaT6BE6fVSSTyq3W6Ev7T?=
 =?us-ascii?Q?2eVoSxUrrl1pzyiUTC851yP+uq9EcE+lKoi7t3lN7+1AtV0kd2gq8rh2uaW/?=
 =?us-ascii?Q?xtNNMCDuOgBaKT+A9oK5nTEm+goorA2RmgxSjrx1j6GagKXJjbVFkkYBXq95?=
 =?us-ascii?Q?LYx25jKHV+9bEJKTOG4kYYoVyuFwoJnyJVKZtjNh1JMbmGsBPd7xPiyuY7bk?=
 =?us-ascii?Q?ueCAxDrraP5mlOJg0PvVwY0d6iRi8PosKBbXMZXplfYz47RpM8a7uEZnpyLp?=
 =?us-ascii?Q?dubOvt57lA3RMZxLRkhENLImuqAdqwWPPcWolFLyB1bBLctyEbhQpXR74XrO?=
 =?us-ascii?Q?P6Pc/kcrCoAt0jSJ8UNJtvqDWflnRJD3c1fFHDrW/l9Pj2D5ojcDlBQmJGi1?=
 =?us-ascii?Q?ugE1CQyNGUqVKTDJpUVlZnHi3vKowGVM67hd6PrLu4hDBE2okcJWIgCv/mT6?=
 =?us-ascii?Q?r80eDoiTkzJTA3sTu3l1ednEP8UVlPNw8gPzX+OGDbDScH6rbZszu9nsnr0Y?=
 =?us-ascii?Q?vw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afbbd9f-96fb-431d-8b45-08dcc351b604
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 08:58:09.3180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wEUS+7HEbJQkgaKyFH85awSIgFKhw+BH8DwXqgjojaymuRrofVY+8OCx2PK+ySw9eSsMQH/owrdzZKOABqJ8aUlxrbzO1ILyYAIo2yZzVRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8333

Hi Media folks,

Gentle ping. Is this simple fix OK to everyone?

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Wednesday, July 31, 2024 5:50 PM
> Subject: [PATCH] media: platform: rzg2l-cru: rzg2l-csi2: Add missing MODU=
LE_DEVICE_TABLE
>=20
> The rzg2l-csi2 driver can be compiled as a module, but lacks
> MODULE_DEVICE_TABLE() and will therefore not be loaded automatically.
> Fix this.
>=20
> Fixes: 51e8415e39a9 ("media: platform: Add Renesas RZ/G2L MIPI CSI-2 rece=
iver driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index e68fcdaea207..c7fdee347ac8 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -865,6 +865,7 @@ static const struct of_device_id rzg2l_csi2_of_table[=
] =3D {
>  	{ .compatible =3D "renesas,rzg2l-csi2", },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, rzg2l_csi2_of_table);
>=20
>  static struct platform_driver rzg2l_csi2_pdrv =3D {
>  	.remove_new =3D rzg2l_csi2_remove,
> --
> 2.43.0


