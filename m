Return-Path: <linux-media+bounces-36622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C48AF60B8
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 20:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D796A1C46652
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 18:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82D930E835;
	Wed,  2 Jul 2025 18:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X0t5Gjca"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012020.outbound.protection.outlook.com [52.101.71.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDACE1C1F12;
	Wed,  2 Jul 2025 18:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751479340; cv=fail; b=J7vUH47cFycFB/hxMbKaaxuXi5H6KDLtYyRFvF/IRTcf98IZhQ3po9ti8a7tzfN6yhoT3RWBaeKUz3g3PSKC72d7oaRPJbedMvQVK8Iejg4HR/Dbyh1TCI1YPi1U1PM8mt/zTwE5M1TtDDVLPeEzPF/JbpWBaa03mIH4BQfkMBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751479340; c=relaxed/simple;
	bh=ahBVFiKyg/ckLbTcMjBlyLyT+Nnm+2lu1r9LQkyhkME=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JCBUaVM4uQCfL/3m5fg7qg8Z0bTdnqzK0beNGp0364nHHOT15Icnyi0jVbV7XDB0x44o2wUcXLqQwRkEAdLUVpAANbReS9X4LXw5x7bMYQHWUCF5oRSoLJIPFNNfKWWpvihT7EwUQ0WVcGx7+t7Xx+hs84ley9IGTy+fBmNkrRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X0t5Gjca; arc=fail smtp.client-ip=52.101.71.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvVw2MhtKt0oFzRLPEC0LIWXgg7C2k1YpwXAcJXqPN3MpcTIYFLur8pvk0H7AVIyv2wpqTe9gZXavQMR1xJOjWV+jE+8pEAIp1poem9AtuMmFwvGIOVu7ah2EmhSrcucpODm3/tbGdXVej4feBopAZJkkwd+JCAa4FSkw3nQUddStcX+gYOUtWkrXE9i/vyDy8wJgrOVeIZVR5E/D2l27nBymny3g0/7yKMprmuxvE6DTWhWnvGDON4hX0nl+3985EMHxmKP9+2k6DuE9IyK6Jv6oL0d9Gzbf10rds1WyHWINpgy0epxEzTOB1u1Kb1ww2xiQSNN8AMtUUjgxeYKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahBVFiKyg/ckLbTcMjBlyLyT+Nnm+2lu1r9LQkyhkME=;
 b=XjjOKQKmvbb8raPzu9stCpHCK+KYhetir39VSCDcYl3zBy2iELL/XLI4WR4hlYT1IT8g09IvaGDCZFcHskfaKovnkeJr5UjEOrs534LBfhnzyJe0yCFQoAsz9fN/VW/Q+TukKABPrfbHI7OKFF5q/EQjWWjJEDWgc4JpODzHpWFdpBatSC9CTeb+0YbSMzWCqS6QXBWysy9rjwiyuunWYtHBBOqZt86M4lxajZzOGd7nEhJFmxIzp1dmAlJVWCpLxm26baxuPOU47UC6GLPJfXaBqOeb0We5MpabVlZD6S0dPC7s4cjv+E4vTaejO3AXhjnbK7e2eQqmV987c+TCnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahBVFiKyg/ckLbTcMjBlyLyT+Nnm+2lu1r9LQkyhkME=;
 b=X0t5Gjca5pmNLddco0VvzMrbcE4g/33efFCC/qjE8yIkCQ/+9bWzqNxmY2OR4Ou4SVhZQEs9F3YPEGypu5yHOhsDVtb8W2SA7LqgQlA+kUszya3U8vXBW4dG8JzHCNKOH2fPbFQPm4+E7jnPLzxyO0X//b++aEEZwLjTzGZP2uacAznz3W4cn8sSFLFJU6zTfirCwtVCQW1Ub5bq2TJJtPwQnTPsyrbiewqeNU5nPDlqT+3GXu9Ox1AP5kfSVwM091U/YpxhMrz+STlSLNP2N431sGMTnGRt3tFXQzfHX0oNzn+vtViuusKbbBze3PBN39Gh8st2/PRb6zPNlhSmKg==
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB6780.eurprd04.prod.outlook.com (2603:10a6:10:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 18:02:14 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 18:02:14 +0000
From: Frank Li <frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rui Miguel Silva
	<rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, Alice Yuan <alice.yuan@nxp.com>, Vinod Koul
	<vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>
Subject: Re: [PATCH 2/7] dt-bindings: soc: imx-blk-ctrl: add MIPI CSI2 dphy
 support
Thread-Topic: [PATCH 2/7] dt-bindings: soc: imx-blk-ctrl: add MIPI CSI2 dphy
 support
Thread-Index: AQHb63tw2CUR9oKD+kayCfa0exzFlg==
Date: Wed, 2 Jul 2025 18:02:14 +0000
Message-ID:
 <PAXPR04MB9642848BFCA791A634D276A18840A@PAXPR04MB9642.eurprd04.prod.outlook.com>
References: <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
 <20250701-95_cam-v1-2-c5172bab387b@nxp.com>
 <f0c8c043-9c9d-427c-94a6-f46f6b7d0c50@kernel.org>
In-Reply-To: <f0c8c043-9c9d-427c-94a6-f46f6b7d0c50@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9642:EE_|DB8PR04MB6780:EE_
x-ms-office365-filtering-correlation-id: 6edd57f8-d152-48d7-5904-08ddb992933e
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NYfnRZ5wDak3KVJuS2FgS5X/UEArWdUIJAqC7BkZygYo5Sndsmi3UeywxX0F?=
 =?us-ascii?Q?73o+nyHIVDsDAR02H2sqn+3Kpg363ez76y6XnRXpHud1nJTHKLP6KWADEda5?=
 =?us-ascii?Q?FoB5nNUgkzWUCakOZPDUu8xVZOnMj2smy4fgFgk1LKnHpFt9DvoseOxKaBzo?=
 =?us-ascii?Q?CVCrOTChz0YhC1QdOwJ7eLBEBtnJ1h20w11RnNqFOugBaMzS7UEJdKwGRg1n?=
 =?us-ascii?Q?8ir5eEZlG2Zv5UmBiGhUj3N9/ApmkKtnEjTWnRHffGGUrordwqjL/WgcYGMb?=
 =?us-ascii?Q?gFytR5Ri+tOm4spwIXst3SvrPlZzfl08pTGPOiXZuc9Q6R1im3pj8zifbF4d?=
 =?us-ascii?Q?YY23ZqbccmI1GBydedtMFO0xtkKUdrhCjvWiU/iXix9BPSi+4sA7KkdItgO2?=
 =?us-ascii?Q?qJ31Ijc0n2BwozNyEs4ea/7u0+m9dZhJThFTTJxbBGlxk8G9U0AjRPEbwMp7?=
 =?us-ascii?Q?pCjDUNjTshRgVEmWbjA9u6z7BDVhQvgKL1NVRoQJezlZHAvSWjnWmgjtW2xm?=
 =?us-ascii?Q?IZtZz+FPsdh+9VfZVeS6z0bJ2rDNnvTZjhVq6odJFb3wv/6fPffyvnV67mPA?=
 =?us-ascii?Q?vBc3tyvAVNH3oqyzu1um5shEM3MevMxNbvXRI4AbRaRb4Xnfi+G363W+xnam?=
 =?us-ascii?Q?liTAPuBUWCyGaCzwqaDbKNFKTIE9LJx6BW5nUjf1o0vLwl8Wy8JIGw/RfDWD?=
 =?us-ascii?Q?oKT94yT4jSiP98b8qptMjv+24MQrx0AfHZUXUxF0TUlMTMVLV7aAV+GtIbvR?=
 =?us-ascii?Q?4IryM+8a2WpnVHs95CneiK1AV/DlccfLRiLndlHA+yyeeQsZY0LN8d16jkzF?=
 =?us-ascii?Q?GOt3RHDlEQSxocvXFXg9T1G1HcQLIJQlEbaR48dh0RHbqFtvF+7xb2tHIdZk?=
 =?us-ascii?Q?+EuRxcYVdD91ps8DvQvpq4jLDF4ytHvBRgUWglZdA+KbMg1udgL21eEYv3YS?=
 =?us-ascii?Q?8aRN8WMcVGYtt13fqtHTfFxUDhG3aTHdOsPjfIvWKdtkE4ICCt3p+/oX1ldb?=
 =?us-ascii?Q?VtQUcaguQW1oFsHieYkhLrAo3j03SPWacK/3X/pJQz75/g9pVm3ETr+VIfRo?=
 =?us-ascii?Q?fh6lLd/mn8ITTXBWUkButqMGJto1ajFADyVu6gsO+5eaS2IEt5SijG/WKI9K?=
 =?us-ascii?Q?qGRhtjEbEDiGiyiDtiVPjFnP5wFRN03rDppSxw9mA95E1+mWpKsYgkvHdFQU?=
 =?us-ascii?Q?yYQa3bR6gB7atIggp72iKTAuizs0H6NhCgD8hFJbhr23o4IThHGQ/3M6rKTd?=
 =?us-ascii?Q?jMYRL9BvK34Tw8Ur7D+3MYNdsbKiWY07XdsVIwK5E2AoGZKtL0ov41Bv68qr?=
 =?us-ascii?Q?c3E3nXjveSNuE7xprdpuriounNp1otSRfgaCnbiOFDvl7EFgL2CJBqsPufpU?=
 =?us-ascii?Q?kc5yaG8eu/0awYrSP2Hyz3r8cWnIlZqM4hROfIJIfHcbowm1bmB5ZomGkhPa?=
 =?us-ascii?Q?yJKKh/3vvTQjYAFPEf5rP/auOqorYeGO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+BlPLXR0g7dcNtSlrOMCVXqcsIh3EmAUU9n8rPcq9uTZozsqAYdbwEKSgEV8?=
 =?us-ascii?Q?nqsSL8yTjr5qnmgqVyBOqxi3dcrV/ZEcCCr33p7Ra9ZaZsNw+yl98MpjuWm3?=
 =?us-ascii?Q?nMnYCIihfVp4O0VwASyvJrCsTzRu4HgFY4boHN5eUlfHIY53AjrTkBVULRoV?=
 =?us-ascii?Q?84pP/9qDG2CCRapvjrwcVQnhD2mm1CKYYzQ3++9H5+k+7tSBYaaHc/rKbC7E?=
 =?us-ascii?Q?z+VnbREDTiqgNwbKfWwxDa12+/sIMVui3RQZiWQNkNzmpGSD0SNNuD9oOBT7?=
 =?us-ascii?Q?bO9D+eDso9ALE9OuSWIFUwORA6EyNDgc7Ba47TLprQBo9WibuN6JzJkRc2Xq?=
 =?us-ascii?Q?nuGKjKtQ9s3vvr6dGBz9uIBAPCjvwNyPn6dFYE0t0JJD7RnI7N83+qpcMkhL?=
 =?us-ascii?Q?inNZSN/XlmnaEPwJJ5yl7hLJzxCYIt1Rtx7Wwla7Sytq5ZnoeHYV3tXVmT8v?=
 =?us-ascii?Q?rsYWqHwiAw7dFr6vpeBvLABhUhrdVO93UecIGvjZ7Nb/eiSYxJEiLBENX6D1?=
 =?us-ascii?Q?TR1EfjBpjYSZY0b1cnoDKXcZCZr5WeXFpaIRxqXXJBfOU5RI3Ky3GpI101xQ?=
 =?us-ascii?Q?Rh7NKvjfdAz7Lnw8cXsJQtL2qqjnDQMhoXkUzdyZIc8FRLF4wkW5pYhMa50L?=
 =?us-ascii?Q?8TyJjIU1P35CdtvI0VDeZCLkoRTTsvc/v4glxTSMjQ8eKZe4ppdPRNr6EuXH?=
 =?us-ascii?Q?HdjwyS2J0IGYra6EvAkcNjIUwL1qZWwK2wnjGS+vbZXpKDFB11QEUUj/P3+h?=
 =?us-ascii?Q?VbgXbiSmPO1kgUJKBP07raNE+8Zu7UD6kg/Nm2XB2LrgDlmp/eTu3w+1qLZ5?=
 =?us-ascii?Q?J+qrftqWb/H789Wopx3KxNJ7+icDdRvGobg3K8m2jW6FdBR5D8aLoe8EuVbs?=
 =?us-ascii?Q?LAFsMti3rKnulwgYSOFkDo2gYy9fU3ksbS6/loh27LKpB4SZNMyBnnuV/Uo+?=
 =?us-ascii?Q?fRAQir2gXzw2ArC2J7oWknBnK6Y7yJ5uEDilSMOJov7ADj8avNAKeghfQgMV?=
 =?us-ascii?Q?9PdJ+kRgYhizPlyb6KmfjDeJ0X+gtpgc8xEGAQwwLSzGDnt9yV1wKV6t5cE7?=
 =?us-ascii?Q?YG7a0fCpgXXetiRSFdF/oseaq5iFJJmj5+r7RXpkVQbyG/4+YVPGqCfwp+N/?=
 =?us-ascii?Q?h9hjoK+HHgbpxuXlHhCgCtTUmcsCZcpihKiowaz9PrUFjVhXbf9hY1A/uYnt?=
 =?us-ascii?Q?I2xojjVm+Gek76HQ+Lt4fYr6WPF1I4OGAZNDa7MrVObVIBu/VcXQahKK5z/t?=
 =?us-ascii?Q?LA0df5qrZ6KOw7QpQ+6zz6GZQebrCJ1xIpGCQ61Dy4SABcieo6rUxmurA9w3?=
 =?us-ascii?Q?AgSmA4iUv1szAjDf6veq3Yu77jo0NOM0oVHPIzQQdrxzUjl5TsyYCdaM0K2V?=
 =?us-ascii?Q?hVzYjkUId0DIlOT1sh8o56b4CqmQmVcHczNBbC+4DHinWHF80mDak1jHUplz?=
 =?us-ascii?Q?/o0dzbk+q0u98smSJopFYXIK8jw62QrIQ9h/pqt+bD/dEwSzSTwDCS9WgXWr?=
 =?us-ascii?Q?FTWnBO2RWcSl7koQKGtOtRKlf5q4EKqULR4Dh059+1ntTUsRArezc5s/eZ4D?=
 =?us-ascii?Q?ENver3oDlzR83yyY2AI=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6edd57f8-d152-48d7-5904-08ddb992933e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 18:02:14.2714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LuQ/Ltnr2as7+yCir18mMiOflWkC+ZV311QYYv52Jbr5StHrWNNdgR/72dG1KY+nxcR5VtW5vkl5paCW69krsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6780

>
> On 02/07/2025 00:06, Frank Li wrote:
> > Add child node dphy-rx, which export phys interface to MIPI CSI2
> > controller.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > imx media blk ctrl combined many small glue logic registers for display
> > , camera, power, clk and reset.
> >
> > There are some discussion at
> >
> https://lore.k/
> ernel.org%2Fall%2F4414669.ejJDZkT8p0%40steina-
> w%2F&data=3D05%7C02%7CFrank.Li%40nxp.com%7C7ade0a318b37496d628
> 608ddb93398af%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C
> 638870353425054747%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGk
> iOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIj
> oyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D1gHgVYaxpYxqwBoJVSRJKzbtG3WY
> E%2Beb1BqkaGEctUA%3D&reserved=3D0

Sorry, I have to use stupid outlook reply this email because my git send em=
ail
always report failure, not sure if company block it. I am trying to fix it.

> > to define whole schema for this.
> >
> > But there are some difficults to cover whole once.
> >
> > Plan use two steps to complete it
> > - add all camera related property and subnode
> > - add all display related property and subnode
> And what was the comment there?
>
> "Binding is supposed to be complete. We have several examples when people
> added children one-by-one, everytime with different reasoning about
> child addressing."
>
> NAK. At least try to read previous discussion.

I read previous your comments, otherwise, I can't put this in cover letter.
"to define whole schema for this".

I understand what your point. But I met some difficult and want to discuss
with you and provided implement path for this.

unlike other individual ip (like UART), there are clearly abstraction for
reg clock ...

CSR bindle some miscellaneous control for difference IPs. Some is easy to
abstract, such reset, clock ... Some is not. It is hard to ensure full
subnodes with good, workable abstraction to for all devices, which used
this module once.

For example: driver need touch a bit of this CSR, but we missed at begin.
We need find new interfaces, some time it is disaster for whole subnode
binding. We don't want to wrong use a reset interface to work around driver
need touch a bits of CSR.

So I try to upstream "confidence" part gradually.

Frank

>
> Best regards,
> Krzysztof

