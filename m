Return-Path: <linux-media+bounces-49279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C531CD4A05
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 04:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7E9330062D8
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 03:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1635B325716;
	Mon, 22 Dec 2025 03:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jfThC+G8"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19AA19992C;
	Mon, 22 Dec 2025 03:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766374156; cv=fail; b=pO6PkACQvhyRmiJKUOdLyi3vxzoD9AQO8zUH7rm6C9vUV2I+ojLE9G5QZ+6949IL1bsPDDDn7PJBzfa1ffbU+SnCuhniVmteE6gH0o9WN3I1f0JP72HZzBEr/n63ilpeIbg26o+UlKF5WU19hlIOz+ZINy8ovYPS5MxPXa57z8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766374156; c=relaxed/simple;
	bh=H1MRLbiUi2OG34tAzVJKRAOWbp9ALs3LNlMLQYqVh2E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RTCU09X4Cbg1jvCYUTZtpYlvmhNOa8UutqBRMkBd3NQydDpUha90XEdKL3SeSlqaCRBiOqyDeAEOvKo+dww0rvhWqpWAxNFVQDoP4gRlZrlTthc6xuSllaiWKaJe1DNiLoQIMmr7QSVQ+FQrhID8/tr/IaL5XuB3RBWJyhswER8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jfThC+G8; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R71gvFZnpZvyqJpfcNb4TQtsQ0MfgdquNY6vhVUHvvNb3o5JWpT8t6p2q7kKtUwdmP3YraXQL7ZtdVxoEfp0npqW4HpqTm1yuU42ba58ByLQc476n4cC55VEb1mhFpKU/sVSVeH8k3bkKE0GkYUWDCxipyF6X0bdBh0S5n81qlUy91DpRggJiJjIVmDLxXd1CD7P9AwCpxzKUdaAZq6o7D/ftp9+BPKfknKludnWLqH4Wg8+S/N5Qg/7xx3r+Mfb3d7GO4kxrfQqLVq/ZBO+VxNE7yb3Lflnpjk3fFRS9+i17YYCZ9Ome2JspOEt157xq8WstLniygSRHFOkJSHtdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOiLhxKFxxRBmyFXTygn78fe4iyTx+2WdySSp/pO71A=;
 b=XTkt6t5sFWgjfTGlygklHAgnppVTvIMcI+31IYsTNKVad60bZ/lRai4wBpXwKVQ885vt8QRIDaiDvImy5/2X6nWWA9zG6WB2GLyKT/Qohc8HK5Dkk45mlrork637Ksh792gNJRCguwdluOuEVQRL7RgA2qV/cWMfWIlutZuWXKGjOtgV3zaeAZOLz6zGRVUoL/WwWpsMY/j/49Qe857sWl9P8Vk7VrFxBEDXYURnjoNuH5l45sXTvvKzOUh34488QbGgTRfqZIQiwr0h26s7LTWo/1IMe/BKjC26Y9wUq/7CayMZ38g9q/RkegWKZqCwdXEgDLsXsU52Fbh6xnga2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOiLhxKFxxRBmyFXTygn78fe4iyTx+2WdySSp/pO71A=;
 b=jfThC+G8wgc6PEgi2GvmF+AHYschNYUElFbwr8ddEH5pR2Xo7Gui+jSWB66RnHmsA9Ra9GdIGfu2chRJht30t7MT6wpLN+rbqabV8GeBCqhwcuZzeUlEHYgFbLQeRft2q8rUpCzaNSJi7EKTH4SAYoh1ae8FInZgZmVlQLvqH4uVD47GYYYJ5MtZx92d6gKo261yyWNMI6bU2/OtaC1Xmrf+BIwsxf0nxV/QW1xelTl1+ndqHZXTy0Ue2F5ptP/5NyVP0MlKbRoC8a1kLxWnMwO9tZ9ObEFqpXOIeTrq9YxQl3AEZB6Rq3cLA9gmTld7XUm95WeolEfUeImYG6/CwA==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA4PR04MB7807.eurprd04.prod.outlook.com (2603:10a6:102:b8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 03:29:10 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 03:29:10 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: Frank Li <frank.li@nxp.com>, "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2
 driver
Thread-Topic: [PATCH v3 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2
 driver
Thread-Index: AQHccInHGoXUhNNkNEWHIol6MJo8LrUpIlYAgAPhdAA=
Date: Mon, 22 Dec 2025 03:29:10 +0000
Message-ID:
 <AS8PR04MB9080817D9A557B9D96F55066FAB4A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20251219-csi_formatter-v3-0-8680d6d87091@nxp.com>
 <20251219-csi_formatter-v3-2-8680d6d87091@nxp.com>
 <aUV4enryGRDdIkIb@lizhi-Precision-Tower-5810>
In-Reply-To: <aUV4enryGRDdIkIb@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PA4PR04MB7807:EE_
x-ms-office365-filtering-correlation-id: e7d5e9f4-8082-41f4-6cf6-08de410a456b
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gU8OtqjjefLyFFzeh7nnfo4iYbwkJwk5ZG9VHK9809x9fxjQlac9dw75Ce6j?=
 =?us-ascii?Q?VWFlR/fQNHdLiShPUJJtnKuY4QHGkVZOclIFJSdYzsjyQnlTZKB6kYvNOSrE?=
 =?us-ascii?Q?Tt4OlP4pi2ovG69e5o4jrsYKwjWhnRY0CGLYoN37BBfPZN+1lew94IUHo34L?=
 =?us-ascii?Q?xu6Of35jTHrjtWcZt0AE6feevSiTLI7kg8d0VmwOgRD2kFdSjeBZ8nzbEZQ2?=
 =?us-ascii?Q?lnUS8v+hbfnzDzGc1SpFEKd+U8nOg88mIDeiJs7TBaljg1CAL3WXvt3O2nX3?=
 =?us-ascii?Q?GLGTIeVzRYCihcKH1zaV8ViaLHcVeT5LGGF11kVfVzjdiG24QIZnnyV3p+Dy?=
 =?us-ascii?Q?ZyCz0kWzCRkEdFx7QZgrvANI06ELUivHBsd3sxC7OU4yu5LfkkUbDq7D4lG8?=
 =?us-ascii?Q?JKd8IsHNiNqGzcQS8+F8TKbp2y1pWtpith9CeWmVc/Q3cOM0XwUzZY09n3qR?=
 =?us-ascii?Q?2t/ejapZ5kbe9IE3PMjQaYeuN3AcgHQZW2UKw7GxBeHNhe/Htpksi2jrDpMy?=
 =?us-ascii?Q?kW5lfKWvp8wxKbe5hjBQ2IJVQ811i7KwvOuXa2Z6xiGMtfhS2QbTUWOvmEAJ?=
 =?us-ascii?Q?gaCfovFeQupoifBKyOi6EpwwXg2BhZ4W70RnzOjp33/hX66dKa5z6yNkuv4Z?=
 =?us-ascii?Q?L0jnRWqRVxFOEzo+GPejkLOj/7IAy4FFZiQrUqnbGsbgTy+93Bz3n6VDckJO?=
 =?us-ascii?Q?3g30m1XQnqHaGtYerKAVq15Of3r4koLbHCHvTli9OHzyY4vV6HbwEeDhCWB2?=
 =?us-ascii?Q?2DAN7tpsRiptitL+y33K3myj/JVn7MiX762AGoWWv+Pfp4/EXQY4wMtzrc+f?=
 =?us-ascii?Q?pso34QNqK4+4rUdz6W/ogRSqGyGVKAn6RLa8QjR9dm1gX1I2rNDH15SVputi?=
 =?us-ascii?Q?SkQmR5jNDNT//I+Wh7J4dADrYU4qmzmxD/SfomU0xUXkNeO7zqQT/5Rmnyb7?=
 =?us-ascii?Q?klHNdeEvas29HBMYGUPAoMSAjue/eS/aNjqkWF4mzYHDQQauOwfq/JnTsDD+?=
 =?us-ascii?Q?sbgitl+8MxVUxtzoOB4ZDaiztDmLmJd5bJJRqmwGl7vR2m8ElXw6Swa8/2uG?=
 =?us-ascii?Q?ZlnuIHscUSlJdKc1H+TJf74giAZGuJbBODX8bW7o1vf1r7cB0TZPITdrNQ1n?=
 =?us-ascii?Q?SbE+EZ9L6XW1rm1zwY5DQ8ZpvNZJKz80VVn6gitItWx0snW4DgXdvwgm3K1x?=
 =?us-ascii?Q?ZoOos18RoNMfEnv8h5M2AHOQI4hQn13olnKgvbshGIB7iZzpWi/nGkPPnIUh?=
 =?us-ascii?Q?gD/tECmuocUAN++MqzO2tUWc1ynHQRpgiRxDFShtlUGuHp+UxP1yFoiraGtK?=
 =?us-ascii?Q?eEyi3HDjc1x7e2Wlp/4s+evDLu2o0/JE/8LTI+vONZdFm1yj0ySMcjRv91PQ?=
 =?us-ascii?Q?374wFZyzsnjuVReMK1e9I1IsBR/t/h0RScI6L0K1TNWNBYXq+3VK/L365/+k?=
 =?us-ascii?Q?D4CcXMuESjgIAvQfMtHoGZ19R2ugnq+1ZB/F2O/q+8dyvOftS/YMCvkPTImF?=
 =?us-ascii?Q?QTKTefuj6/joxQTCi8zl2l0PuCWqGnRClX/t?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xgU1ogMVb8OjRPInY8tTGWdOvC/Puz1p2A0DoH1d4KkChnE5sOBFlSVbbono?=
 =?us-ascii?Q?JpxLHTfd6SLr1y1jF5j6tByfi+WczzcrFkbmtAkiZjFkEX02kV8pj+PAppvH?=
 =?us-ascii?Q?ccFTbEPuiVHiNoCkSvkSM+sOWTyb7Yv6pxEh6S1z6lUp2ns4D31YptS2loKK?=
 =?us-ascii?Q?zMTpBq3rpJE03kIxwBU3dgcbFrnBoAZwZBekRBHBiQa1s0ygZpGAsVC8sSd4?=
 =?us-ascii?Q?hrPStlmpnybSLQ/nEmYr/l82/cfGu+HJEX/UhCkHMFAVU8S1CDVd8yi1jZPR?=
 =?us-ascii?Q?DZJxtsBnkLt5SqcIin96q2ZS8qs764PRfg9Ec52KYo1eWCcDkbwuUb1zceRc?=
 =?us-ascii?Q?m9+/DyqfG1626GYGBE7kOtVIjfBlWdklwWdTAmrR/lPllE3mAqkv3VeiVzt/?=
 =?us-ascii?Q?CNAmCIlVUfQ0rxAZSQF6zJ/7FnyDD+HQFvMpZLY3JmM6xVONsqQqpORghB5B?=
 =?us-ascii?Q?UhEC6zb004h7QTGY8hEoQi2nvOaVs+0sZsiNCZdxnUlczDU3+NCeHF/EgIii?=
 =?us-ascii?Q?znRIkyy/DtBXeeuzYC86DFrwL0oBTft7wnmsUwkmVUY7MUrTpQaUJ9pN0XVZ?=
 =?us-ascii?Q?Cx3nrTPIweYFvZliqt7RWkFDvAQtix/cfyduyzWhL3CNjPEajOsb8wdDohKA?=
 =?us-ascii?Q?L1v9LlLU9sM5828Ah8fwHsfBA7dxkwa/TkzaFyoYnXHxJvQk3QwOKE6jAYq6?=
 =?us-ascii?Q?6SuXC0nQYX23WZAUvMRC0GbpQZycw3fLGezs/A1dsW3O9k0zY3k5wAwZmZZC?=
 =?us-ascii?Q?/BotqEVAB8QMVn0+dKpHEPcI09trAS+Y78fwCT0uLWa4IhXi7wHkRjdXXpSM?=
 =?us-ascii?Q?poHMKAfkrv0pXS3ijQFaf/7M5nA9kXknjVyhdZTNAwcd70S2On6R0/8hd5Sv?=
 =?us-ascii?Q?ZYAF69mMvm0EMVzHQ9xmOhTfvBC01PH5+jrkI42iiYx/P6g7FQ8Vn9zA+T3o?=
 =?us-ascii?Q?YJ5fLJNF/2Tv5Qol5SpsjxFJ5IGAd9cfdz6YginnpNDbnZtped8pUEJN6G+h?=
 =?us-ascii?Q?Hx6TAFmz43uIs3Cy4SqOIZ3Snuhfz2t+p+VnxEVclXcP6caz8pfv1CoYIQrf?=
 =?us-ascii?Q?wkpjJ0wkBNFM/Tj6R/eLL8mgYbB2DYgxAg53YCo7OjOiYj5IeiuBXgUroT2+?=
 =?us-ascii?Q?W7+qqVkLvDKDm4ZCWpUIZH5u+8h1s9ksgiQ9Ss+5swCI7fn8gPnac5QNpoWk?=
 =?us-ascii?Q?sTaxSneKyPsuaRTQqPJNWwQHq98ltsTA5c9mfw4OjlBvPlY3RzRHPMnacf40?=
 =?us-ascii?Q?OQ+QHdVPS9ZiwhwqpDqFuntDooGm4pMq/Tzpq3PCZpADfwj/mLvli7m5MUIA?=
 =?us-ascii?Q?AdCt374Zx4IUawYCLdazEUPGLGzBW/+F8CaqExVgdvIkTvUaRMUx0K82bHW6?=
 =?us-ascii?Q?Qm6wdswvzvLlN8F07ZGMloNUsmL/fDBlL9HLRUEh1hv8xHvwFBnXs4wV93uX?=
 =?us-ascii?Q?6mCd98/fU67jsz2tRUeQkp2zv5O/ruHPQRzbXHnnkj/oUhZl/W9yCgoAXH8x?=
 =?us-ascii?Q?Caz8saPvHnvo0qC8QcMasnlj7a5jnAQt18LUbj8FDDTj9FgZFT8mnnZvtx8r?=
 =?us-ascii?Q?je4xAmg0ZkUKGz7yoogez6UJ70YLO/46MaqiVX91mlXC8sDTgYTUE16u0qH/?=
 =?us-ascii?Q?zBiwomlPBezVYW9dn1YLJ/ZKiOn29qGED+A4ulDqQPsyyjcuM7JV+iC5G2eb?=
 =?us-ascii?Q?H4yg+AQCRmegdmTGGTtB5DnvSMQ768HqZxQuj4Z3qFW2mX2C?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d5e9f4-8082-41f4-6cf6-08de410a456b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2025 03:29:10.3068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pux2Avc3OuRMrec0zN+QZmdAXZ0D0BXi677SVXbE9pwrumKrNt7mqy69x9Z+Ar+uu2iY1S/mSGiLnZa/duE6Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7807

Hi Frank,

Thanks for your review.

> -----Original Message-----
> From: Frank Li <frank.li@nxp.com>
> Sent: Saturday, December 20, 2025 12:08 AM
> To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Laurent
> Pinchart <laurent.pinchart@ideasonboard.com>; imx@lists.linux.dev; linux-
> media@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; G.N. Zhou
> <guoniu.zhou@nxp.com>
> Subject: Re: [PATCH v3 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l=
2
> driver
>=20
> On Fri, Dec 19, 2025 at 09:50:58AM +0800, Guoniu Zhou wrote:
> > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> >
> > The CSI pixel formatter is a module found on i.MX95 used to reformat
> > packet info, pixel and non-pixel data from CSI-2 host controller to
> > match Pixel Link(PL) definition.
> >
> > Add data formatting support.
> >
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > ---
> >  MAINTAINERS                                     |   8 +
> >  drivers/media/platform/nxp/Kconfig              |  14 +
> >  drivers/media/platform/nxp/Makefile             |   1 +
> >  drivers/media/platform/nxp/imx9-csi-formatter.c | 880
> > ++++++++++++++++++++++++
> >  4 files changed, 903 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> >
> 4205ca007e076f869613032b51e8cc5bff06b98e..3878957b81156e5cb41da26
> 99b2f
> > 588e49521724 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -18626,6 +18626,14 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
> >  F:	drivers/media/platform/nxp/imx-jpeg
> >
> > +NXP i.MX 9 CSI PIXEL FORMATTER V4L2 DRIVER
> > +M:	Guoniu Zhou <guoniu.zhou@nxp.com>
> > +L:	imx@lists.linux.dev
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
> > +F:	drivers/media/platform/nxp/imx9-csi-formatter.c
> > +
> >  NXP i.MX CLOCK DRIVERS
> >  M:	Abel Vesa <abelvesa@kernel.org>
> >  R:	Peng Fan <peng.fan@nxp.com>
> > diff --git a/drivers/media/platform/nxp/Kconfig
> > b/drivers/media/platform/nxp/Kconfig
> > index
> >
> 40e3436669e213fdc5da70821dc0b420e1821f4f..a7bb62a2b0249659ffdfeac50
> fa4
> > 88aee9590a87 100644
> > --- a/drivers/media/platform/nxp/Kconfig
> > +++ b/drivers/media/platform/nxp/Kconfig
> > @@ -28,6 +28,20 @@ config VIDEO_IMX8MQ_MIPI_CSI2
> >  	  Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.MX8M=
Q
> >  	  SoC.
> >
> > +config VIDEO_IMX9_CSI_FORMATTER
> > +	tristate "NXP i.MX9 CSI Pixel Formatter driver"
> > +	depends on ARCH_MXC || COMPILE_TEST
> > +	depends on VIDEO_DEV
> > +	select MEDIA_CONTROLLER
> > +	select V4L2_FWNODE
> > +	select VIDEO_V4L2_SUBDEV_API
> > +	help
> > +	  This driver provides support for the CSI Pixel Formatter found on
> > +	  i.MX9 series SoC. This module unpacks the pixels received by the
> > +	  formatter and reformats them to meet the pixel link format
> requirement.
> > +
> > +	  Say Y here to enable CSI Pixel Formater module for i.MX9 SoC.
> > +
> >  config VIDEO_IMX_MIPI_CSIS
> >  	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8
> models"
> >  	depends on ARCH_MXC || COMPILE_TEST
> > diff --git a/drivers/media/platform/nxp/Makefile
> > b/drivers/media/platform/nxp/Makefile
> > index
> >
> 4d90eb71365259ebdda84ea58483e1c4131d3ac7..39ba5660ba923141e7637b
> 01b5b3
> > 4a021dad7bb3 100644
> > --- a/drivers/media/platform/nxp/Makefile
> > +++ b/drivers/media/platform/nxp/Makefile
> > @@ -6,6 +6,7 @@ obj-y +=3D imx8-isi/
> >
> >  obj-$(CONFIG_VIDEO_IMX7_CSI) +=3D imx7-media-csi.o
> >  obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) +=3D imx8mq-mipi-csi2.o
> > +obj-$(CONFIG_VIDEO_IMX9_CSI_FORMATTER) +=3D imx9-csi-formatter.o
> >  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) +=3D imx-mipi-csis.o
> >  obj-$(CONFIG_VIDEO_IMX_PXP) +=3D imx-pxp.o
> >  obj-$(CONFIG_VIDEO_MX2_EMMAPRP) +=3D mx2_emmaprp.o diff --git
> > a/drivers/media/platform/nxp/imx9-csi-formatter.c
> > b/drivers/media/platform/nxp/imx9-csi-formatter.c
> > new file mode 100644
> > index
> >
> 0000000000000000000000000000000000000000..5786e4690e31ee471caf82
> 01329c
> > 8e02a2cc0ee6
> > --- /dev/null
> > +++ b/drivers/media/platform/nxp/imx9-csi-formatter.c
> > @@ -0,0 +1,880 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright 2025 NXP
> > + */
> > +
> ...
> > +
> > +static const struct dt_index formatter_dt_to_index_map[] =3D {
> > +	{ .dtype =3D MIPI_CSI2_DT_YUV420_8B,        .index =3D 0 },
> > +	{ .dtype =3D MIPI_CSI2_DT_YUV420_8B_LEGACY, .index =3D 2 },
> > +	{ .dtype =3D MIPI_CSI2_DT_YUV422_8B,        .index =3D 6 },
> > +	{ .dtype =3D MIPI_CSI2_DT_RGB444,		  .index =3D 8 },
> > +	{ .dtype =3D MIPI_CSI2_DT_RGB555,           .index =3D 9 },
> > +	{ .dtype =3D MIPI_CSI2_DT_RGB565,           .index =3D 10 },
> > +	{ .dtype =3D MIPI_CSI2_DT_RGB666,           .index =3D 11 },
> > +	{ .dtype =3D MIPI_CSI2_DT_RGB888,           .index =3D 12 },
> > +	{ .dtype =3D MIPI_CSI2_DT_RAW6,             .index =3D 16 },
> > +	{ .dtype =3D MIPI_CSI2_DT_RAW7,             .index =3D 17 },
> > +	{ .dtype =3D MIPI_CSI2_DT_RAW8,             .index =3D 18 },
> > +	{ .dtype =3D MIPI_CSI2_DT_RAW10,            .index =3D 19 },
> > +	{ .dtype =3D MIPI_CSI2_DT_RAW12,            .index =3D 20 },
> > +	{ .dtype =3D MIPI_CSI2_DT_RAW14,            .index =3D 21 },
> > +	{ .dtype =3D MIPI_CSI2_DT_RAW16,            .index =3D 22 },
>=20
> what's these index value from? register bit?

Yes, they represent pixel data type for each virtual channel. You could ref=
er to
i.MX95 RM Rev2 section "142.5.1.55 Table 913" for more details.

Best Regards
G.N Zhou


>=20
> Frank
> > +
> > +static u8 get_index_by_dt(u8 data_type) {
> > +	unsigned int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(formatter_dt_to_index_map); ++i)
> > +		if (data_type =3D=3D formatter_dt_to_index_map[i].dtype)
> > +			break;
> > +
> > +	if (i =3D=3D ARRAY_SIZE(formatter_dt_to_index_map))
> > +		return formatter_dt_to_index_map[0].index;
> > +
> > +	return formatter_dt_to_index_map[i].index;
> > +}
> > +
> ...
> >
> > --
> > 2.34.1
> >

