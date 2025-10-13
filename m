Return-Path: <linux-media+bounces-44325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 412E5BD52E7
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 18:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31BAD542DF8
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 15:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F3431B81D;
	Mon, 13 Oct 2025 15:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kHe81I4Y"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010031.outbound.protection.outlook.com [52.101.84.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75343101C7;
	Mon, 13 Oct 2025 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369786; cv=fail; b=cjL/GYcOxnYJp4pTiFhe1z9+SQxqom8NWM0YxcUZtWaUavq1xXc1zn829gxwOL5yPqmWmzY8CZPCioWWITUXdt9ZrFopAVLIKvjyAts4q9Fpli+VzDY4QEyeRJSLFgQI2Mou+bVFF69se8zkl/8A3KUjzhysLRnAn7TisIMAuho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369786; c=relaxed/simple;
	bh=GYYQ0IYHEhGSuiQjZsh7xZCw7uMS9dWiGan/41/QH4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=saMFJDkypRjSMcJok2auVJl4aa/HaYQ4PigsO53jqC+BYHU8alurIO7qv29uQj+dRDIdomGtqpruE8JQjdnCMomwaQBgFGxDt2rS8Ba+SwgqzERb5I4ys3aIQJc3Re07t4Vt//6FdPwh00xwrX/BrlXHl6RvxFeRGmbgElhymWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kHe81I4Y; arc=fail smtp.client-ip=52.101.84.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvFbMS0G1RgYH2o4BqDC144TgwGfPI7KYzq81ttQXiIIIbzySnPnOSkqOv7m9IDeGSEz5QNdsWklJcRIlEfyD3XgAPIAbA99rpmEDvZxpU+QJn4H0is8/XOePDYXYBAawKKx2trV+g1zeZOst7XV6XMtypg8qaCZL+aYbG5/f3U7Fmaety3ETyWSuBUByPCxoIQB+V86wmlO1YdqBNIBKFv0iJUT+l3rthr5KUqPYPoa3Z+irgag+gglzUU/61YUqdQrYLFfOZMwC/pp/qbrCzyU6qehH2LQe7UobKEX+YPVSLWqDkBH+Sqs8jxrkMHTzLlEKH5yh9Fqj3D3i2Mn8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBENrIHmIHt95N2pwdrDNGTpnC/htu9Q4US9FUAtQ/k=;
 b=mQSnTQp8IlNPRrYgO3vMryLOt7Cpoth8EQDYHgn/QztSQAVNntCW5oVcqDdHHJj+LkxpAkdQI81NP2+hyb+M0xQB36EgLf+Tbmp0Zp25OcWY5UIl39FxQnJr3Xw7JkdDSvuXo2nfEsQ7dDHaDhsQH1kiRwnkUxAz048k9o+LftdkPqnFihwAQ9/3k0IIlyftIideqfLndgW6TOsRD0kYGzUH/xiZpOuLPRvGbn1mNYiUBp704J7AprLs0cgWnEIhxjmSHN4ANUZmHopEVZS8um7wITc9MaCiyIszUZA2q/ex7IqbLt3y7xySIrahBBbCeL7edNeczQpVsp+dOd9+sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBENrIHmIHt95N2pwdrDNGTpnC/htu9Q4US9FUAtQ/k=;
 b=kHe81I4Ya09QfLcjIRkuXEz183YDEmphDoK+G2rmARRyq9EFuAOwKgvFtIgSNaHvm/2z2qRXTVBelq+yCU74P6bObzVxoQkVoUJ9FBdFQwiYB01FXGuqih553FpTfYi5y5cUw22G/KtcpKUTKQshGkE3VF4TiV54tiDj0KYchfrJ/x4YOjDXL2sP4kLS/2GAHxMU6uHRRNM1ag0VysrDDghDV2iieaDXfEOXZLeGpyqF9yCjTDF2rlSTDJOU9QrKqJ9k7UZwd8kJzd6VeJQ+xkhJBLkUm6FmHssIKuVZgjfr8IHeVv8bfE6agap81g6csqsRSEZ54WCWE19WNuYiUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by GV2PR04MB11375.eurprd04.prod.outlook.com (2603:10a6:150:2b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 15:36:16 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 15:36:16 +0000
Date: Mon, 13 Oct 2025 11:35:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Leon Luo <leonl@leopardimaging.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Daniel Scally <djrscally@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 01/32] Input: cyttsp5 - Use %pe format specifier
Message-ID: <aO0cXYeGLwwDABP6@lizhi-Precision-Tower-5810>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org>
X-ClientProxiedBy: BYAPR06CA0060.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::37) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|GV2PR04MB11375:EE_
X-MS-Office365-Filtering-Correlation-Id: d7953d7b-1796-4b60-4f5e-08de0a6e3fd0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ia6W8a3Ozr+m4W9WupCmEbLavJhV3zayvWSi3rKzpTnT//9KPREd4fKqOTFq?=
 =?us-ascii?Q?Z9Nz6akrA63QktegdjMw4eRWSJIcQOprkPx9WUaRkQIYsMvSqzqZ61db0W2B?=
 =?us-ascii?Q?5lgxDepKOk40lX76bf1G9WefiT3AsKrsma6I+zKCuxTp/IMZCnbS8g9JpyPx?=
 =?us-ascii?Q?pVa6XToPhTXMnTtCk9hMO5UXymP6Jqov61LYTQj+QjIwfinHTrrfMM570+ST?=
 =?us-ascii?Q?HGjNEvfnsjsPqLHejgnQX3YilqsPr2RSUvXovMFL6LVGQZyk5DR5seIKhPNU?=
 =?us-ascii?Q?kVSjwG1culdP/ZpSrCUUOhcQsoYSsVJ7PBzWsPO09M0XJdA/mY/2OG9CIQMQ?=
 =?us-ascii?Q?ncYVkcSlt2aUs/KVPv8zAGPoNgUcnWd8XvRr+XOiV2J+qFYNSfNIJckkaB3+?=
 =?us-ascii?Q?zb+cd1AFd48GbwPB+9wYSTB9kINarGqUomhAJkzafH6zsn+4G9zMJuJ+wnYn?=
 =?us-ascii?Q?IgcK+7o43SG4fro3vRKku1oGenRW+nJ9ZXx7uda+qpa+2uvAQmowL/jJkNAL?=
 =?us-ascii?Q?2pddu+SCCmKUXvn7VBqRG6Dhfz598K8fDiia7mhcwsNKLO/uT/qk4dRop81P?=
 =?us-ascii?Q?RWYSEwq9GYN9zzOrhXhZNLNOHZ3u5maTnBy5DPbxTSoFfxA+3USOUR5+Magk?=
 =?us-ascii?Q?zX1qEICBmJCN56tPk0ieq472eJjfvte75k7MZP/4ZCQjw/UGArvr85oTbuO9?=
 =?us-ascii?Q?I//6qCJA2uZzWfYErCU1rgaK7sd8r9bBW5tvAgyC/e0QBktC6W1WyUv2bCf2?=
 =?us-ascii?Q?PqNAjqYGXAw2crSstXhy23Wuoba5X2pDc8lC/3zjDkgjyMfamzsqtCfUnGe1?=
 =?us-ascii?Q?KpZ5qzYhSn2UfLALYvZSAb8OxRyCmkcSLBktNPVNxCOXDOyrjtyXjdqLuzOL?=
 =?us-ascii?Q?ADxKZOPgDQ5rzw8XDMWdWhDjop1zUfbfnISDEK2VrW5PWDcJ3KErdYWsUYyC?=
 =?us-ascii?Q?3ioFSViHTwIGCb1y3lQglzNmeUUl70c+H9/cWve4X5AIOdVBHjpGlwr/hexx?=
 =?us-ascii?Q?oDlgQAY12+/ky1SNwGO+JSET70yf7VWp+FkVNJCf+VafWZnF1JajDWQsgwSD?=
 =?us-ascii?Q?x4d1FJvLp0H4S5aCnKWag1yzL6zEKjReMC91g8uhC/d1apXZBNeMooKJeRDg?=
 =?us-ascii?Q?N+hptILcnGP26YLRGgcVhamkpjJtzOmdD+ltIb1fxUON4dezjdnqXh+LVdM4?=
 =?us-ascii?Q?WyYOUEKH46wNAWPhrrOMsDl2h5iFFEApjyiEjpaZH86hU6EyggAySf413Qqp?=
 =?us-ascii?Q?kuCYrSLelNeuXMsklKCgwe5OiQOIhV30FeoBXmbDg0xbwv5R0QRpBYaDCStT?=
 =?us-ascii?Q?FOV0PPDvRjN4HGyDLya5w9mJxYbT7V6LvsMDOew3jKuFfzeLdhAXItOCs/1M?=
 =?us-ascii?Q?Q4mhOSsf4+kWzFphqjxQTAUPSCGQltesy8qKhMUQ0q916hkNIWS/DiVubonH?=
 =?us-ascii?Q?sa30tKG5AJiW6aVqZ4ZVZ4j5zoAhri5q7EgNmi9alvg4iiuZQ7rvaLDoNbm7?=
 =?us-ascii?Q?qAcJ91mkSHcVz++48TKRJGe2vCdasnJ+Pfez?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?LSaCJHGtdYoafO+artHRlfOjJkj3g02QuNc4h/UF7Vs060354+BEkyWpE8wa?=
 =?us-ascii?Q?Q/z0EXXddMo64wTPXz8io5OYTQMViDuBrac4mTE+J3/y1CvJx0RxiR4xyBuP?=
 =?us-ascii?Q?AqcSwUSg3Yaxj9B7GuN4fDKs9TD8amsmloz/j15aqh/mbHOUssh0VN2sMcA2?=
 =?us-ascii?Q?ECXPhL+P9HOD1l/JJsh2Iu0CQvdrLGBzZ+HA9jbeQN96omk8oCRcEubJSLWJ?=
 =?us-ascii?Q?R88nSrMku10JI0m1qE1RRpJ5bBL6Wo5f7mfYlSs2mDJ1xSzv70cTx2N8hivn?=
 =?us-ascii?Q?zq9E28U7tCADdrwXdsplolYhY2tazl2EYIhK7rq/Mn3TGaFLStn2JUfWJqwg?=
 =?us-ascii?Q?xr4vAlz7bHWPAFshFpwXYFYURBKkb9PfgsU7bmLcYVFJxA/RKDbLvFokuinD?=
 =?us-ascii?Q?egT2elGTy144oAODMmeCphCyhF79xVXLo86Mhbtb1LEMyziKI/y9sW3xtmH2?=
 =?us-ascii?Q?MHkzSjWcl1cGenE6C6SK2ZHev+X5ZUq6LV2Wqh/3yK13RZOhK+Y+XxBm81Wb?=
 =?us-ascii?Q?oZtMb8qJ0zNi1x9xgrciPs+09RN3uwpMTFrLY/x7qosqm3NvAI6cQyweZ6j/?=
 =?us-ascii?Q?ADCSlzTF3Li/2Q+/k691As6l1XpDpb6ifzH9qQ0iu66gOTWOnwvXTltDDdHM?=
 =?us-ascii?Q?54RINW+aR3WnhDE6MRiEDSYpFuAFUNfQx9qYL5a9eif5Jh0hqroRLDMN4viH?=
 =?us-ascii?Q?Vnx/PhyxJxu7jQPcKhEF/FlUojnx+AFY6vUieook+2etxoZ/V2HaIG63fF8h?=
 =?us-ascii?Q?/Cy4bgsXImEGJXbxbOzg6YrQ5dbrg1Yc0T2NRfDdhEfumpdXlJHFHSBUJe6t?=
 =?us-ascii?Q?cKuERws2u+z+5+iW/stgXZIWUx5emSHTryZATtrkexMIRjr0iFcccc7w55yD?=
 =?us-ascii?Q?dNQzMgaJic69rZrMSwzwYMczjSHOXR9Rg6pSj+Zn8AB3SJsNvcnX5tlhC4/K?=
 =?us-ascii?Q?+/b7Av0/4sKFHd1ugzAcJMRK/A+R15pS+N5RR5zKnANCTAN5niwP8l+qmjiG?=
 =?us-ascii?Q?kC9XHF9DwxP4FW+VHWxDyP79NGPPeu77/yc9w3GEhCrspG4DuEAJ3k26XIwN?=
 =?us-ascii?Q?MJ6sYfO0wF3G/w0gY0tUQLqDc+ZlRdomCP/D770GfdNlknWi6gK2e4F5Vrz6?=
 =?us-ascii?Q?3liSYJ49JtCuB+2HBJM6u/n0QMvNJG9XSLGPOM1yc8ZOe2vjAZ7b9y1F559U?=
 =?us-ascii?Q?ytHRfNtJgGS7/GeKDP1qVH0pbBPPPklB5LlX3TyxPRph/vzjJAjnVp20BG7C?=
 =?us-ascii?Q?9tqk/mZiaVisJfFCHdq7l56FUadi+p1/djT/9BJD8lMcu7cLs107CdIXVuXj?=
 =?us-ascii?Q?aWiAI8wY8/u/aVmwNT8xgB/klvRQtrFVZ73QTVkG7NVx4DOBxnRRmNN+ho0R?=
 =?us-ascii?Q?CFsNnRIQHRwGDIlU4AwKbAwf3cmB7BvbbkLWcW8XToCj+2J2MHL7/mibFlu+?=
 =?us-ascii?Q?hP65n4lgw8PEXDYTbopoTkXcycMydIPjk1Csh8jzi5rELien0t2acoLb6m+s?=
 =?us-ascii?Q?aYvXoHLNpyD7LPNIlnNy2tyA/+jau+uX4IEZqncuIq2ln26I7hOEe7+ZfO2w?=
 =?us-ascii?Q?muPuOI2EXr8ZJX5MoKg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7953d7b-1796-4b60-4f5e-08de0a6e3fd0
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 15:36:16.8280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UcMBGOMpHemRBPMDZ46SFhhar0pauNNAID4ajRxmutNQJZPvQL6Lh327dNeUeS1gpMM+ACX8PaJeyA7DNRoZuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11375

On Mon, Oct 13, 2025 at 02:14:41PM +0000, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR()
>
> This patch fixes this cocci report:
> ./cyttsp5.c:927:3-10: WARNING: Consider using %pe to print PTR_ERR()
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/input/touchscreen/cyttsp5.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Suppose it will go though input subsystem intead of media.
Need post seperated at difference thread?

Frank

>
> diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
> index 071b7c9bf566eb0b58e302a941ec085be1eb5683..47f4271395a69b8350f9be7266b57fe11d442ee3 100644
> --- a/drivers/input/touchscreen/cyttsp5.c
> +++ b/drivers/input/touchscreen/cyttsp5.c
> @@ -923,8 +923,8 @@ static int cyttsp5_i2c_probe(struct i2c_client *client)
>
>  	regmap = devm_regmap_init_i2c(client, &config);
>  	if (IS_ERR(regmap)) {
> -		dev_err(&client->dev, "regmap allocation failed: %ld\n",
> -			PTR_ERR(regmap));
> +		dev_err(&client->dev, "regmap allocation failed: %pe\n",
> +			regmap);
>  		return PTR_ERR(regmap);
>  	}
>
>
> --
> 2.51.0.760.g7b8bcc2412-goog
>

