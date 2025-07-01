Return-Path: <linux-media+bounces-36444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE08AEFDA6
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 17:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 525937A4DF4
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 15:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBFE277CA6;
	Tue,  1 Jul 2025 15:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SvgdSYin"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010026.outbound.protection.outlook.com [52.101.84.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9814D140E34;
	Tue,  1 Jul 2025 15:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382516; cv=fail; b=nE2tzieUqdgi1gmhbUy4G8L8sZVxMCmavZmFS7ZFoTnXKlGuapHb1/M8rOsqldt/WLkAcMxSko2abHcBIrojoNSbocWz7SQ2MJsbnPs6VSamgUtauunGJ0yArgeEMYIPZvK2a1mkXi6zB4iHKLMU7rj5bdswiVBvRnSvD/ORe60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382516; c=relaxed/simple;
	bh=zWPU2gD/gMCTvQW8nBSJJze1FuxagOXkT7Gqa51zAt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S+4NrUHLwEAH4WsLHcLx8EqPU2urNIaweWjOdUP6z9Zz/fpTiuo8fPnSyGbV5b6AxZEHQS9hYkV0UytnxmDForMUS+GxZ4ymZYErbyi3bM5Hbm7WjZxfBa9arqx2+2xsKo8oVGa39l+rKoEAGMKG1R423ifXJJbiBNlenJCWaKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SvgdSYin; arc=fail smtp.client-ip=52.101.84.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8oO/VLP4xNO1V80xONrDQYvRgPovIaURxkKXm6IzWFTQ/R4KvOJ3VH3rj80tF7FbX3Ibnlk++AWdLbRooIYGpS5a4qF73+91MOoKoX/jaf3aolseL07y7ClwMvnNS73EtJSxxpXZm/iB2D1QMrbIKsNP4CB1B9ZtlxVi8NJALme5IYAUnjLNjOnR8Wh2YkzWnlHujgrFVottLcvZmSC71yNWtpFdbjxh3FXSwdeoSYb2GxYrHv+LrB2f0hkSBPOBu44mqPHvuNnASBm5iG6QrJ0lANLsLwITL9FdhCkAx/qoRwz5owNj00FdP5S75Ofbrz+5GN2hv4AkB/bWM5pIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ne+Fi5hcy9Tt5RQqP7EO+50PgL+njZaBQYYHaZRyT3w=;
 b=Ah88t9ZD5bi8zP57ryO0OGoWYxSBp/KI1NxYosuqrKWisVc5JlB+bCM8c040lpr0UJ7B6JMBfdxlOYUhXYKUViFtlw6/jDWgiLYKK0H8II8uHoWpDJqvCupj/EGjmGH8fRd93pIiwVkdMdg/ZhpnDNrnWIfPaPmAmpHelbgXYhERk7gUtdpNJvi0xGdMPRXR9r0I3+gmdkJjU2Qt14MAj5WV4qcHt4iFTBXyA1rbQPZO0QyjWOoQaX5semV8UHu0OJ7GQQvpQgLh4e0iXLcNMHgUn5PmaNDnvw9wSIsiIMuRAkOkKHbnBiJDx/gKimtcJHYSXRDjzRYvZzJG0LiHow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ne+Fi5hcy9Tt5RQqP7EO+50PgL+njZaBQYYHaZRyT3w=;
 b=SvgdSYinAogq1b5C4zCj7qUSd786BjtcHBSqF5hBJY8zE9zscL0OAiad+JwxcMfuiojZI3ivuS779CO3pmwyd3kRpQa3pArxQXwCftqmQGhAUtejS9OkhuaXxVnb9eG3ekWgS0UmJK40bMUvqv3BBC9Ba32qzgkqSiWQq5IkbNGPgZDRWGauAYLKiWl5XM5COAHgQEPiVK6111XJBOfnlzuw/Mg7+6n+h3UKyEEKg8+HCfbQfSjHcPRodF5lRiOkLizbB91BOcEQQhYw5Tr2xo05UKn2qL7npICdYzRYP1W1X2QhBbkFANWXEHu6p4uL+ViD5Z2KSatI3lvme1j51w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9173.eurprd04.prod.outlook.com (2603:10a6:20b:448::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Tue, 1 Jul
 2025 15:08:31 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 15:08:31 +0000
Date: Tue, 1 Jul 2025 11:08:24 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: imx8qxp-mek: add parallel ov5640 camera
 support
Message-ID: <aGP56BUXrNnBCQu/@lizhi-Precision-Tower-5810>
References: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
 <20250630-imx8qxp_pcam-v1-5-eccd38d99201@nxp.com>
 <20250630230651.GG15184@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630230651.GG15184@pendragon.ideasonboard.com>
X-ClientProxiedBy: AS4P189CA0040.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9173:EE_
X-MS-Office365-Filtering-Correlation-Id: b5386002-f80d-4415-84f5-08ddb8b12402
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?U8Edyl8hEMy0y1zGQZlcKMkque1Av7dBKSp+iqjfgJR2t+PMOYSNqbK/Yf9z?=
 =?us-ascii?Q?jxzNPjGg/WCTw/Mo52d1k3x7xfdXIl4ljsascaNOz2hoN9ixgxLqdUxb3OQ2?=
 =?us-ascii?Q?B8DSg6cpvoot2H6Y74LzHNt7YBUTPCslK3d9cJNYAmgIkN2dVsKDB++ddg/b?=
 =?us-ascii?Q?YsFkm2GxFIJfnxuXDMoYOaORBvk5so2hrnsXuzSZmZn9j0MITIxjbj+OBPcB?=
 =?us-ascii?Q?g9wBbzKLYJyTfHB0an3xHoP0+JyEt2GfiDxb1ONK/FQ1+NFQAiBOgO8Lni8j?=
 =?us-ascii?Q?EIyKRDY6RkuYDntImgDo8mqbuEVXbhzNaKowmAyzbOyqCueeD4w3yK40e+ML?=
 =?us-ascii?Q?RrKlimbySes7O1fgNnvb/20BymsKti4hLXdcxPiQBBKCahQVqXNMVKFKqlxd?=
 =?us-ascii?Q?zQzuQZM1zN4NCFpGOmQUtJFyWQi9U9WCat4H/6NM+R80pGYol4hCfOqryn4Q?=
 =?us-ascii?Q?QUIKCz16AtiRhPAiiXEoExUT6Ed46NVw6XlbLM0HtkcAW1tW7JGbL5tIuWiO?=
 =?us-ascii?Q?uUhZ9C+tKGf5x38XkrN6bLi0J5sBMu/Pn1DNT+9d/n4EXYgvG+TGUlLcEt9H?=
 =?us-ascii?Q?IOnhVpQ25IiQhdVYS3IgYxtklEd3VwNkZUSLhwJg3yrvqBB6YkfJZGya3VL6?=
 =?us-ascii?Q?ZHY1CMPG4I1UNs8UsB2kRgSHK93C9ohmMl8gNyi8ilNS/6oilDjPzXQhWwca?=
 =?us-ascii?Q?OWz/0lTNP0vzkOjVwPie65qfw+Kfj76LBQFlI2wWBWlwyZLLqmNghP6tlke0?=
 =?us-ascii?Q?SXbLxeXd12r2XQyqTtlCet01T/xf18dzxc7bh1zilHZxYZ6LM4HpGBoHgN9i?=
 =?us-ascii?Q?xbCVdDdnEV/pxC5DcE2pxgZ84O1EVCYFuzV+4UNTp/zWy3bMywBfAynUB2yV?=
 =?us-ascii?Q?+iTym639wSvAbdpu/Tx/U0oaOwsOoHjlKaOrzw0d+RWC5VJwdgBE6Zn7PBoH?=
 =?us-ascii?Q?cK4aPiBn4W6Y0IEc2rA4PTdfSsENRO04m0ua1DWvJU0s77YOokMZ251aXluX?=
 =?us-ascii?Q?uQ4ORrMF3629wsPJQUH4UJINSDQYDrT47LEsjJ8dz0pkqYjT5AOy2wJggxZt?=
 =?us-ascii?Q?XSNMZfrFYLwMWRYgWWj+gwpg21THkjZzQ4wCSo5hROnSXjnQl/bXNhP54yTk?=
 =?us-ascii?Q?3zjpivjcigYPsQyYnKFXSWLrmxRbrb/w8oo3WZiuy9dNNfYt/1Sptb76pIPC?=
 =?us-ascii?Q?ZjQqzpWKt8KDZXmCVLUu6+15C65x5TKLkIcHtG5LefrI1+sHjhCo/lYLyOWo?=
 =?us-ascii?Q?65xlCCzdOZrdNrH/wxvvDj8yOPHQ+Ybw8fQyyUnqR9qqKfQZ4M3AljLxQaT8?=
 =?us-ascii?Q?XO6AaSyo8mdp5VvO1tqen5ILQVzKHY5h9vnP7Z2PtOQOrNSABG3kYlB6N0wn?=
 =?us-ascii?Q?FW4pS7FpKKtdSJBWmOEfCQRVRVUREvUkb1gHKRL5nu7UWeeNIT18+UrxsSpX?=
 =?us-ascii?Q?gasNtseElykMqn9hPuT9/ciW3m/k1RjmIx43M/JWWD5xElQFTv1wP6YnxTj4?=
 =?us-ascii?Q?dNCs1mygt0a1MPw=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Pph/YILpDm5rMmLQWlt927OmPRowOVefG00BBvIXqz6n2X5WEcrlV2cx65AB?=
 =?us-ascii?Q?CpQM89UWfkFZ96X+9G/I6TZXKpZ//m1HAhuQktDeQwvatGVGU9ztHs0ltAPC?=
 =?us-ascii?Q?TNWUdYXP9KheAGs+XRwpd3vlvugOc/KUotX+ExxGU1dkT+1osY2YFyhikHWL?=
 =?us-ascii?Q?s1poVWubd9Jksl1B8AmAWfnqcU5bWcFRWeNnPLJzo1LbNEpjsDUUfK5Ts0hR?=
 =?us-ascii?Q?FB3mosm8+o68DlZ4qCpdu6JpVNd0yU6RPHShJwdiPy7BiDSQIYxGWcfgsRCh?=
 =?us-ascii?Q?ezNXJPBAWh2ae/vTqKBwdgWYnjK98z4j0J2z64z7BuCPAsx0IMCCDiPwy0L0?=
 =?us-ascii?Q?bcqGcx3m7TQvk3rsRLMqLBMD3x9MKhiQ6FmMnsSdUl/yvUi4BcvnNnz83Ohu?=
 =?us-ascii?Q?teuAbfv0LIrS807txu1gzVNQjpLZgSnhyDl4CYvLKOa1GKKDU1Nn+clyooIb?=
 =?us-ascii?Q?Kfy9m550mZ67YWzNN1ppOmeDbRzgeSOnSZ5q/n6lxBLanF+ov3zYkdKSv1tJ?=
 =?us-ascii?Q?8fk7i79TYzzESjpEUDSD32ZJSsYoQMAl/DWd6rfEKQycZckynOKtWj8fmDIb?=
 =?us-ascii?Q?duUJxxwjkmcbR5qI5EyR7Ud5CJbs0u80K0rS73aM8z6C1oODpl1kT9TT84Zh?=
 =?us-ascii?Q?y3YuE2Qm2vTq5K6VSOAoIhuvWfK7s45A9vTicGfhyoUk3Y6lp8kzFHHFRO7S?=
 =?us-ascii?Q?G/gIWqVRKSmEvuwhISDXA1LqZ6IP2Uh9/K1j8VwqfbCJI8AL8aCDC6EsGj5q?=
 =?us-ascii?Q?KuCjVvcAdP/YgXpuXkedrWe4Y5mXYhg0eblhQAB6+IT6OWWBirqeMhe2I+q6?=
 =?us-ascii?Q?znZ31KdajSHOlTz/40brENx13MCgl65uND34PcC5gUA0dufab56VHPALuCJX?=
 =?us-ascii?Q?xE2Vd7pnH94PjKAMeDUCkOgMedsaCe8zcFTY9oKoQPo4Wtt5vu/xWfQ/APPL?=
 =?us-ascii?Q?9qXpIsms5ZECs8u5k5iXqIqko94XiUEEfM7BWDW9JkyaFp/kiLyKKbx+bPEx?=
 =?us-ascii?Q?qxCSBLh/xNphfzMlvCnHRe/9y2jIj9rWBu9PJRBZ0aSZNHmkcnGh9JfA4g4P?=
 =?us-ascii?Q?fVaLtqqoOAbr7mGewUkbMSwqzqQTwrS0z3rrwg8znaiJjaL5y7dL9bi4HOlI?=
 =?us-ascii?Q?xUpe8Xn8csz3PQhEVp4JGOXxioitFADQ6g1q9Zs1GApokobxtE7G/OarfFHf?=
 =?us-ascii?Q?Kr+408c/vcHOOKLdNUGpFXmcPynT1LToBj0s/RyouQmKIqj+2zX+qsmeVnP0?=
 =?us-ascii?Q?rQDEB5M65mbEXU0pDOyn6TyqQHS6kYa04rC/cdvxp9Kvfc4VVbe/aJP0yxYm?=
 =?us-ascii?Q?DEPXlhsJ7w5EjpDgqslVq7N/bA3pubdkfZ/JDcnqJT7RBsKXz5HMQT9orFgR?=
 =?us-ascii?Q?1C131bLY7JjaQZ10J75HEOf3DUwxMEjPMFmKTSR//Msl/XzSel/8cufmN2e5?=
 =?us-ascii?Q?9aU0tQtWl87z95oWt7fNBxBVeDFRIjDKs9WDEVwdp5m2P0m1IMm2gD4AANz/?=
 =?us-ascii?Q?qUqTSTtp1vMYq1eeEpbhBnHlFqhv8v9iBngyew8aRQsGIwhHkI90rXMFvxx5?=
 =?us-ascii?Q?g9U/FRUPrXE7EUWoxyhNrZKQimnzVQhwSZI83b5g?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5386002-f80d-4415-84f5-08ddb8b12402
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:08:31.2550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ksq/SQHHNZLdX+wD0/ltQB9NufijiAWQdPLDw7mmTKtLhigdl/8NXvzo6I19cVkC+Wqw4Nzyw/fTd0Qr8VNSQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9173

On Tue, Jul 01, 2025 at 02:06:51AM +0300, Laurent Pinchart wrote:
> Hi Frank,
>
> Thank you for the patch.
>
> On Mon, Jun 30, 2025 at 06:28:21PM -0400, Frank Li wrote:
> > Add parallel ov5640 nodes in imx8qxp-mek and create overlay file to enable
> > it because it can work at two mode: MIPI and parallel mode.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile             |  3 ++
> >  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 37 +++++++++++++++++++
> >  .../dts/freescale/imx8x-mek-ov5640-parallel.dtso   | 43 ++++++++++++++++++++++
> >  3 files changed, 83 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index 02ef35578dbc7..a9fb11ccd3dea 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -330,6 +330,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
> >  imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
> >  dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
> >
> > +imx8qxp-mek-ov5640-parallel-dtbs := imx8qxp-mek.dtb imx8x-mek-ov5640-parallel.dtbo
> > +dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-parallel.dtb
> > +
> >  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> > index c95cb8acc360a..09eb85a9759e2 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> > @@ -487,6 +487,23 @@ pca6416: gpio@20 {
> >  		#gpio-cells = <2>;
> >  	};
> >
> > +	ov5640_pi: camera@3c {
> > +		compatible = "ovti,ov5640";
> > +		reg = <0x3c>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_parallel_csi>;
> > +		clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
> > +		assigned-clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
> > +		assigned-clock-rates = <24000000>;
> > +		clock-names = "xclk";
> > +		powerdown-gpios = <&lsio_gpio3 2 GPIO_ACTIVE_HIGH>;
> > +		reset-gpios = <&lsio_gpio3 3 GPIO_ACTIVE_LOW>;
> > +		AVDD-supply = <&reg_2v8>;
> > +		DVDD-supply = <&reg_1v5>;
> > +		DOVDD-supply = <&reg_1v8>;
> > +		status = "disabled"; /* Overlay enable it */
> > +	};
> > +
>
> As far as I can tell, the sensor isn't soldered on the board, but is an
> external module connected through a cable. This DT node should therefore
> be moved to the overlay.

It is fine for i.MX8QXP. I put here try to reuse overlay file as much as
possible.

For example, imx93 have, 9x9, 11x11, 14x14 boards ...

Each board's reset-gpios have slice difference. If move whole to overlay
files, we have to create difference overlay for each boards.

If keep here and set "status = okay" and update graphic links in overlay,
we can reuse this overlay file for different boards.

for example: imx93-pcam.dtso, which simialr with imx8x-mek-ov5640-parallel.dtso.

So we simple use
imx93-9x9-qsb.dtb + imx93-pcam.dtbo.
imx93-11x11-evk.dtb + imx93-pcam.dtbo.
imx93-14x14-evk.dtb + imx93-pcam.dtbo.

even for imx91 boards in future.

>
> >  	cs42888: audio-codec@48 {
> >  		compatible = "cirrus,cs42888";
> >  		reg = <0x48>;
> > @@ -865,6 +882,26 @@ IMX8QXP_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xC0000041
> >  		>;
> >  	};
> >
> > +	pinctrl_parallel_csi: parallelcsigrp {
> > +		fsl,pins = <
> > +			IMX8QXP_CSI_D00_CI_PI_D02				0xc0000041
> > +			IMX8QXP_CSI_D01_CI_PI_D03				0xc0000041
> > +			IMX8QXP_CSI_D02_CI_PI_D04				0xc0000041
> > +			IMX8QXP_CSI_D03_CI_PI_D05				0xc0000041
> > +			IMX8QXP_CSI_D04_CI_PI_D06				0xc0000041
> > +			IMX8QXP_CSI_D05_CI_PI_D07				0xc0000041
> > +			IMX8QXP_CSI_D06_CI_PI_D08				0xc0000041
> > +			IMX8QXP_CSI_D07_CI_PI_D09				0xc0000041
> > +
> > +			IMX8QXP_CSI_MCLK_CI_PI_MCLK				0xc0000041
> > +			IMX8QXP_CSI_PCLK_CI_PI_PCLK				0xc0000041
> > +			IMX8QXP_CSI_HSYNC_CI_PI_HSYNC				0xc0000041
> > +			IMX8QXP_CSI_VSYNC_CI_PI_VSYNC				0xc0000041
> > +			IMX8QXP_CSI_EN_LSIO_GPIO3_IO02				0xc0000041
> > +			IMX8QXP_CSI_RESET_LSIO_GPIO3_IO03			0xc0000041
> > +		>;
> > +	};
>
> Same for this one.
>
> > +
> >  	pinctrl_pcieb: pcieagrp {
> >  		fsl,pins = <
> >  			IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00		0x06000021
> > diff --git a/arch/arm64/boot/dts/freescale/imx8x-mek-ov5640-parallel.dtso b/arch/arm64/boot/dts/freescale/imx8x-mek-ov5640-parallel.dtso
> > new file mode 100644
> > index 0000000000000..927d6640662f3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8x-mek-ov5640-parallel.dtso
> > @@ -0,0 +1,43 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2025 NXP
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/media/video-interfaces.h>
> > +
> > +&ov5640_pi {
> > +	status = "okay";
> > +
> > +	port {
> > +		ov5640_pi_ep: endpoint {
> > +			remote-endpoint = <&parallel_csi_in>;
> > +			data-lanes = <1 2>;
>
> data-lanes is not allowed for parallel buses.

Do you know there are method in dt_binding to restrict this?

Frank

>
> > +			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
> > +			bus-width = <8>;
> > +			vsync-active = <0>;
> > +			hsync-active = <1>;
> > +			pclk-sample = <1>;
> > +		};
> > +	};
> > +};
> > +
> > +&parallel_csi {
> > +	status = "okay";
> > +
> > +	ports {
> > +		port@0 {
> > +			parallel_csi_in: endpoint {
> > +				remote-endpoint = <&ov5640_pi_ep>;
> > +			};
> > +		};
> > +
> > +	};
> > +};
> > +
> > +&isi {
> > +	status = "okay";
> > +};
>
> --
> Regards,
>
> Laurent Pinchart

