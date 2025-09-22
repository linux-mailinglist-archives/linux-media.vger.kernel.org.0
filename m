Return-Path: <linux-media+bounces-42858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE4BB8EBB8
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 04:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E724189703C
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 02:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74832EE261;
	Mon, 22 Sep 2025 02:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q7Y9Fpxq"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013018.outbound.protection.outlook.com [52.101.83.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1452ED85D;
	Mon, 22 Sep 2025 02:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758506632; cv=fail; b=U0c/fViGM6xhQaABo1JvJWZRKFu+1BMFLYJKMVwrj22aJi6eNh6YgRwljv3osi7ZZyEae4IVgjqyVoT6clfTmbfkmzHAPMLjNsrOdQwCTYBHmFOtd/Trkwe1/NCCNnniJUmgcwXjHeiJjOFVGbwdfSkgXve4qvwEc5pGQALXmsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758506632; c=relaxed/simple;
	bh=CtjupkDMNY+PmxC0CzWzB9FrVNqGhlin9tU//fb/fcU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sC5qMxwSclO0O+zl9RunsNae2OEDnuQIUQJ0fXC+2IONeXDroNcDQnebBr0gtOnpflRr7uQvrgdqiK2vIEpJANiC1ionJT1471wXHJlEvwxGo06EUg1U5p/xwMpCpRX2P//Dj78EgGmYVDCFEt9pV0NRgeaWMaw7OMn21y4kTbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q7Y9Fpxq; arc=fail smtp.client-ip=52.101.83.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ce5G5jBpmXjYxR2TfMT14w6xmbEhFOje25o/1gYdDIcVAZWPqGvA76mJEm69OzvBvQ3MvHMgozZqUZmiJnHCWVcEuoUEwH3jjE4Si4IW56xEN18eVyCLwgXHa9kx22rbyXUko7IyfiqZu75yaxFSg1vPMZaJorPusvw8ivnB+Cr3Td2jGrfPD4NBnFGTk7gXsSLoCQRAX1sJdvKtW2iNT9gqZ4Kz1x6qvkvfmoM2kDJNt8GnRSBANFNr/X3YqzkUFe3cRN2S6cO3t7bgMc3zu1NXtSRuOyRsGKPJKJo1mONOi9SLVEwC6fk7ta9S/fmeFNaBXoeMKAWZhYNq7bXHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3BAgFWXo/AYuCEifkvdW+WBQgySUobE7ORlkjXMyac=;
 b=HlLzFZPlnYvv37uNHCAKU0nV6UnEhghmkz5E2c2Tb41z+xJ8m4WgzY+n+o2Z/KBaVhJBrhSwAkJS+d4DkLJmuYd2acZwaY9XZAO19zhS8OlIlyBwhgMm5udbpxvbNppzriP6JbSyhC9NyRfTPQylyOYqjnIQ9Kd4YS21UXUt0scxmTDDNvcmhzbEgiXOWjnLPccEOd6Iho5uLbDGCwXSSmTu1FBbXqp+Qc2esndfUKLfudlt2QHXR1fTOHDr1lAhAR8Flg9kgfNuq+6TOJXbip4N9Vc5coRlRt3m8XBbwyaKk6AZZVkZwNfYCnv0mHV3Ddtevh3fPg5sQEZ6+aL1JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3BAgFWXo/AYuCEifkvdW+WBQgySUobE7ORlkjXMyac=;
 b=Q7Y9FpxqCgR/fbN/G/kOPdRrVcfA3nh5jK+on6LkYj+OluyQwiM/LahdmDU/0AZvVygTkPXeRAZbB4Rsw0Fw4/WYe9Jj/b4LbtsSH2ydglxLvesfoJS83eBp5y0QhVHJ/YZQbtGwud/MLyWM9g2sytXh2Aepkf1bWIWoeLZQDttPeWRgvhFN1ntO+sen1IHVH64lui6JU/S6btIMDo+A6kwXbZOsZxJ6uO/zElJKnZs33w7EcFR2DjS9fXWDTy9ulSCGHBeNt/2dQgOrG4ktdvM9/5EB+PLvravhAvDu6DwTpPXdmvzQ+B1n2WfXoX7QQBM7l6YWQDY+gn2RK3JSpg==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI0PR04MB10640.eurprd04.prod.outlook.com (2603:10a6:800:26b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 02:03:44 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%7]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 02:03:44 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v2 2/5] media: nxp: imx8-isi: Simplify code by
 using helper macro
Thread-Topic: [EXT] Re: [PATCH v2 2/5] media: nxp: imx8-isi: Simplify code by
 using helper macro
Thread-Index: AQHcHjIzAx8GBuTeC0eoL870oKvfoLSeTYGAgAA8otA=
Date: Mon, 22 Sep 2025 02:03:44 +0000
Message-ID:
 <AS8PR04MB9080158655C3EA188BE7FE7AFA12A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <20250905-isi_imx93-v2-2-37db5f768c57@nxp.com>
 <20250921221325.GB10540@pendragon.ideasonboard.com>
In-Reply-To: <20250921221325.GB10540@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|VI0PR04MB10640:EE_
x-ms-office365-filtering-correlation-id: 8ee3774a-4d37-44ef-3014-08ddf97c4292
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?kzQQ7odIRk8pXA+FyTzMg12CZ1vefCkmbZ2obVrh+kibOddFxIPYKFXa7GFP?=
 =?us-ascii?Q?FnOLf7cZDx3W0Atc+ayINZvlbzVGCsmIPC78oILVLcDh3YKPFFRn5b28NUr8?=
 =?us-ascii?Q?jVMdbogmUVRh3ZTJDGOuRrOeNa+VbA+fQDkfjzTKrHeSqM4unnSKfmQASuTa?=
 =?us-ascii?Q?RhAMZ7CCiah8eztorao9Cre6/kLkB6xWu96T/Y5E+L2nwwsOOrfmJM4WLiUR?=
 =?us-ascii?Q?5se0Z3Vgt2WC+jnS3a+CZ4uxRaFstY2lwkXB6VuieiqTUVQ3zGJ9eBHOPRsG?=
 =?us-ascii?Q?gX9S8YQJhP9iXdk3uBZZj6AtsivVxwcSnzfdS6IAk8S8H5Gn9kBo5yadv5ro?=
 =?us-ascii?Q?gMq0ISm8ijuLvjokh8yWzoZF+ledbGFGQoYKHSzRgo/Yj1pgxPGyxCIlbW00?=
 =?us-ascii?Q?xPGB4S4EzyxQNVDCLPun3yCUOs0boh6VfDHm2GVuwq3YDwxa0xGdv3MRxL3A?=
 =?us-ascii?Q?Uk7DSixbYPb/Aj5VWbLMC0cm59urw/fApmRLQ5JBJsq+m9zRE+oVI5JbZ8RG?=
 =?us-ascii?Q?0sTmF8+g+xaZ4wyxE+SQMsT6lyCYMO7wDxvo9K2FjQVJpv/8GtmBl9LOgsUh?=
 =?us-ascii?Q?CSzzgR09PCv/TMUXuOlDBXz1mKgO5CjTlKOXWQpJmiskCgZXo08DtmIg/Upz?=
 =?us-ascii?Q?XcWukwkWGKSZecEPYMGz6Bk0/sSz3cX6DBr+xcCn9XxlU4zEcGbORZpMJfhk?=
 =?us-ascii?Q?x7TkiXf2bYmT8LNlEBCCBSqg7NWWyMhC0lknKTpYuMaTMHMWY//kXhhLpf4G?=
 =?us-ascii?Q?eoTIqMMCNjG09c53yFN2at2YJxmhnXekiQzHPmAkqKjr0j4R0J4U4b19F35f?=
 =?us-ascii?Q?J1uLvz340usLTKO4VgV7hK9Mm4XL1wsXH/G+8sh+p6lW6TcNVVkDk4tAb1/0?=
 =?us-ascii?Q?9iVKNFqHX8dhWUPhyOwbQ8HpJTPHB8gClWqYnrPo4DF1+KUuhsHsPD+tBhuR?=
 =?us-ascii?Q?obZ59MtFz1hFPk9itOhq1eoD8sUZ3kUXiaqj4iSujYUJBTe73Jqs7ImZUDJc?=
 =?us-ascii?Q?HRaxsJt6Js/mLrnQI8vuxHtjYl2nYrF6G8yPzksGAnkzrHTn1RbJTpzbMyGC?=
 =?us-ascii?Q?rN+ztX/VOyXwJLJ7NOWWB++B9AvAivo1+Pou4rl3uzn2pKoQeMypctpNMAvH?=
 =?us-ascii?Q?effASm4afvzMgkIMhFxmI0aRXB4OP0YNoThuuJqis9VdZHtiFwtZO1iWRcWI?=
 =?us-ascii?Q?Km8OP5+pPHe7J4kOupO3smR7ZrLbP/7wOxzoOUkr/yYMGSqgdY9mBsupNO5J?=
 =?us-ascii?Q?6MnseghV5R56AOFjMlKkkqwZRqY92LjWucnvYHtjVkotPc+fdoVXNI49aBk4?=
 =?us-ascii?Q?XpykN78bw7uq10iDcgv6ePW+9NC2FSQstMqs02R752JoekH+InQuSoCfF1+r?=
 =?us-ascii?Q?XsS44IYkzsu3oEhC+Mg7i8zAgMNwTO8ADgQRNPPbNINTlyRFPRyPjyF/IcUt?=
 =?us-ascii?Q?GJfzvZGf4GxoWPrP9sXKl3Uvb2zOSNM6G48PsqtOET0z1daQsemCt0bH5frd?=
 =?us-ascii?Q?FF7oEl3ykcp9HqI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5QAtWJQriZK7Q/MVX6kwcUHbfc1GMdJvz8C3naK3eHX9qYzdXw/MFAx038Ws?=
 =?us-ascii?Q?E8EZCw5A6pRKRuqmNzDPwOIT3E2jLmUW/Cj/kD/O3MXDGmr72ftVHMTO1wfI?=
 =?us-ascii?Q?62pkfa/APro2GrV5WTOcZjvNUTlB3xr2R5WxXsGwg/dmJ5xDroUt15Jdf2lH?=
 =?us-ascii?Q?OmXB5EQKP4Nk/JJzKYaZbQ0zUPa72DxcmKg3N4zWMVGms6v7RXJzfxX0aljD?=
 =?us-ascii?Q?Nu13fhES+vlw4RhPw+/bxUgu6JQlNFvRrInd3Fvv/USdtIBT61iNhbVDJ7zp?=
 =?us-ascii?Q?bU8LdW5nwAd40zwzzPTJp9cSuEVHEUADEGBUfZXGdRUcY2uf0Rg1mAqzKsfq?=
 =?us-ascii?Q?56vYKnbUBPBjV1hMoYHUjmuu7avP4ySgiPf61LXLlqv9DzyVTjQXBsYr8utg?=
 =?us-ascii?Q?X9LNaYwoV4YiCGjsOt5qtRhvJRZFkVfSzyKwFWHd+UneXEFQ7L7ErX/PNGce?=
 =?us-ascii?Q?2ucQ14iUWDFniWG4NLUj2fH0CwFnOhRzZ9ftGrrR+CNoBMNo73LIbtrOyeQt?=
 =?us-ascii?Q?eEwEr+w7AWtJrdG6VAiIlzDRdp4UWaq6Uzr/6UW+XLJ8EaNX161MKfpM2TAk?=
 =?us-ascii?Q?zDbAU7leLub8CKmyZI4Muf2ir5+Ehh+HOY+o39IwcM33JsnrSbslXYefk85h?=
 =?us-ascii?Q?o9bukGvkP6/tqmbtdFJs/hwjlbqP2bgcJMY+MDBg0BEoOCodLyLlyqkuw9Ll?=
 =?us-ascii?Q?heYrzyzjrhdhm1BOIM7OnynYoT+ncVVFpFqkm0LfQioegVtyeT5k3ezv9iiM?=
 =?us-ascii?Q?n0ehPV0P1mRl88lZN03Kq+koymbOXeD7u21U/RtmutZ54lrj7sN+dEozwhDh?=
 =?us-ascii?Q?aYaSAVQdOjRckl5+/G3gBbM+RWsPemTU2+vCC4nO8QgivA0JSKEc0+QDTa0p?=
 =?us-ascii?Q?rbY1OKS5ulziYtrSAEOeT0pXXcmOFZD5OwVon0dfYrDTWc5TwDssBqq63Ax0?=
 =?us-ascii?Q?HCR72rEHxBUlmn7cuF373XPF8cbdRMBHgrGwOrHQPzdriCSrpR7xZgg/tI77?=
 =?us-ascii?Q?KIRrkSoUM6k5tDF/plxYCJDOK45RiD5G/scUA0agduIEOfjzw3fryUxb1WdK?=
 =?us-ascii?Q?m/gdFM2bRwnDMYGmiaeTtGed15PXmvcvVBvkICHVsCWZM89bYBH8RFxH4FP1?=
 =?us-ascii?Q?JKVDJBTD0YaIzEyjyDMIWsTH0VZQxgffz7l8FcRxsCxNXbhMLPEgjUNL+EMJ?=
 =?us-ascii?Q?21F4Ezmu6Yi6P2y+FRolvrZwYpDdXpxNCwuD8+BBf2+KJz9KnOeHXtsiId7J?=
 =?us-ascii?Q?nuU0vC8S+np8E0TBV5A4kr341gLMO+3B7lSHZsRY57JzLQd0r9NAJ6iHhBBp?=
 =?us-ascii?Q?5uN6NF4DI2DC4QXK4EQ4P6/9nuERx0NMSOYIFqzVCJ/PAa4nq4wUebgaFDyx?=
 =?us-ascii?Q?N/Y6efQNwLeM06AZWbmIzxVcA+7PUlSBgthtxsw7RQNhorr782hJ/fe0jrqi?=
 =?us-ascii?Q?r8vtf1/Q0Gi7o5KuoYxgz1S1rV9nQ/tNaoGE6qnhQH0QL3q93FYMWKv+0G/I?=
 =?us-ascii?Q?hpWU7ki4KmHRYtkFvOvhNs0yAK+KB4rrYgy5TdWnp+95Wru8sfe+MIxq/d/u?=
 =?us-ascii?Q?q5BUImj4WuXfFjIrcUo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee3774a-4d37-44ef-3014-08ddf97c4292
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 02:03:44.4283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /z9b43GMc73dR5ks+9dsb8AtUR3ntmQLlpRAnTGqY/uO+NPLKFGKUvOZ0wo/Objpu/yhsiJqKOYeXJNamYSafg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10640

Hi Laurent,

Thanks for your reviewing.

> -----Original Message-----
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Sent: Monday, September 22, 2025 6:13 AM
> To: G.N. Zhou <guoniu.zhou@nxp.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Frank Li
> <frank.li@nxp.com>; linux-media@vger.kernel.org; devicetree@vger.kernel.o=
rg;
> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH v2 2/5] media: nxp: imx8-isi: Simplify code by =
using
> helper macro
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> Hi Guoniu,
>=20
> Thank you for the patch.
>=20
> On Fri, Sep 05, 2025 at 02:55:59PM +0800, Guoniu Zhou wrote:
> > Simplify code by using helper macro FIELD_PREP() and GENMASK().
>=20
> I'm not necessarily against this change, but how does it "simplify code"
> ? There's no change in the code beside the macros, and they don't look
> particularly simpler.

How about the message body change to " Make code more readable and easier t=
o maintain by
using the FIELD_PREP and GENMASK(). macro" and title change to "Refine code=
 by using helper macro"?
If you agree, I could apply it in next version.

>=20
> > No functions changed.
> >
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > ---
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > index
> >
> f69c3b5d478209c083738477edf380e3f280c471..2f5e7299b537d612fb1fe668
> 8c1b
> > 75bfd2d6049b 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > @@ -3,6 +3,8 @@
> >   * Copyright 2019-2023 NXP
> >   */
> >
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> >  #include <linux/regmap.h>
> >
> >  #include <media/mipi-csi2.h>
> > @@ -16,8 +18,7 @@
> >  #define GASKET_BASE(n)                               (0x0060 + (n) * 0=
x30)
> >
> >  #define GASKET_CTRL                          0x0000
> > -#define GASKET_CTRL_DATA_TYPE(dt)            ((dt) << 8)
> > -#define GASKET_CTRL_DATA_TYPE_MASK           (0x3f << 8)
> > +#define GASKET_CTRL_DATA_TYPE(dt)            FIELD_PREP(GENMASK(13, 8)=
,
> (dt))
>=20
> I think you can omit the parentheses around dt here, and around x below.

Ok, will apply in next version.

>=20
> >  #define GASKET_CTRL_DUAL_COMP_ENABLE         BIT(1)
> >  #define GASKET_CTRL_ENABLE                   BIT(0)
> >
> > @@ -58,7 +59,7 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops =3D {
> >   */
> >
> >  #define DISP_MIX_CAMERA_MUX                     0x30
> > -#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
> > +#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)
> FIELD_PREP(GENMASK(8, 3), (x))
> >  #define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
> >
> >  static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
>=20
> --
> Regards,
>=20
> Laurent Pinchart

