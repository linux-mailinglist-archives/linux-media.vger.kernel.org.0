Return-Path: <linux-media+bounces-62703-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAWDIiEEFGpSIwcAu9opvQ
	(envelope-from <linux-media+bounces-62703-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 10:11:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 888075C77BE
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 10:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0C06300404C
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 08:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AB23DD52D;
	Mon, 25 May 2026 08:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Okake7co"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010069.outbound.protection.outlook.com [52.101.69.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5033DCDA0;
	Mon, 25 May 2026 08:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696661; cv=fail; b=TyXenAsaxCaNU9r2LAHPThSmOEKhZ71ZnZDsj/EqzQoXt3geFb+2yhuxVbBImv9CYbj3m/QE2r02K+4JK6VqpsxLuNLBzlijSxJYtMA2G7PWQj8Ev6zLwli4FUnGN2+58esvL03b4NiAQq4Bof/UpWX1SKTML0ZUmG8SWQyc5lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696661; c=relaxed/simple;
	bh=6igy+fMrh/y+6RZ1iMcVBar57A8ZpwpiamSn2LhhU0Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FrjehkiX0ABCEMtrdTEXvgh6cPaklqYSqzkkuPajVz7pet0+yBlC1AoHlZ9JRAuWZ3AT0dJ5M8uQZ7NOz5Lq0AXEZq0tTRDTKNuGwIYWntR0khlKai4zP1xQKPhUCgnjxdNwXfSJy5JIcDoDV4bf0nCSoNFSGiPi3iBuJsuRr7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Okake7co; arc=fail smtp.client-ip=52.101.69.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7imcruqqe4mHQgb+0J1E+2GRBI0Fi151cX5C23EHr46MhBlwOpkIFBQUsWQGLiGjcuVHFlJ4WHdFIAlFxNfkKY/oV5iJhi+cJw8wKjyB3Hq8iwR2dCkSaVyGmltdNMtN55AYDFACA009U9a9c3R61YYHDTIPLsduyvuuKtHmGh1z9RCS+QtZLIaG/sQCd1RscGzXtJ8JsuVHR39+0v0gWoX317FLkDTnv42yqqAnJi385NaCSCYODaGoKJeccab3mwfclw3smXza9JKRKRZ3+FVoYGIFpIZIF1gGUcEgR4Zu2qR3wGDNH1MgRChNiSl8VgXi2QJqegMfXEwIWgPQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8Fdrizxx5ed/cGLwhnZTGHDPgUoypXXB2cB33NaVdY=;
 b=M/WOrhc9RGf9xn5FLmf8jnSvEHkj/TVsDO2HWIVCoQtO2B7ktc7JJIBVwp/yL0GHMvX6tSlYpGkH1pq0fwQxyCSgBJyQdyg0puwIHVWnkwkMmYzFZUpWEjZHDETyZF/d0oXhY1rTbA41W8e+JKwB+ps+zSXAVbsOSfNywadVdeEGdAU0AWiNP/hcIwCIDtiMtiYg0XLSothwUIfMAHhaXNLu8lP4HyQCPd8ie0x0O2afsPIAL+mWAjOL74UIZ3bOMmP6kX2qzgPqTpsUDD2DAhu9m4+kNuEWYE9V14HqA2Sa5Nvk4jfJEH00dx09BHweLjWRQXKnigrNxT1N++S+dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8Fdrizxx5ed/cGLwhnZTGHDPgUoypXXB2cB33NaVdY=;
 b=Okake7co8TEg9eS9DUy0Si7KhWmyWqpdUgdAQlxK6gKYQ9uPTULc1JlxKIuXFdy+9FaTUXWtsknWtmS30assnzo+Gf2DeSWfiZLPzUBuJLWJ68SbJYIq6RJJJEC3UogqRTcCgSUv1cO/3d9TS5op29AgK8SaVc99wRhfylfl5sqTVpeXDY+wypAMuGeCMYv8nxizosQ0fUGx1XQ5Ug84Ju/XFDmTerjn2iLI+U2FMBqndpQ2WCpjvIJGyC/1PYyk2EIXf6Gm9v5MRxzWZcd/rCdJJPRdAdWMsgv8HLprskudyS/+eSvvGaZ+rFRpeCOATiyPjaN46zp5U9EgfyBTMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVXPR04MB12265.eurprd04.prod.outlook.com (2603:10a6:150:30f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 08:10:16 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 08:10:16 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 25 May 2026 16:12:23 +0800
Subject: [PATCH v8 2/2] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-csi_formatter-v8-2-6b646231224b@oss.nxp.com>
References: <20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com>
In-Reply-To: <20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779696771; l=27144;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=JL7w7oaO7hqHcuR8qlVRM2YXzXRvN3qmtD9yEC/OPxs=;
 b=eUgdctRvahEq98L5w7F9HgHBuYH2qA9GTVAAMq5gjS1BC/RZ8ou774jA4Bgslsvc6Hvl6AMTS
 7iKyZUfRlSLCmn+Awy0x1bg0GNoKSwt2/VedVXGKumf3v8atNQJyXMq
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI3PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:295::9) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GVXPR04MB12265:EE_
X-MS-Office365-Filtering-Correlation-Id: 396d309a-5d27-444a-2587-08deba350dd7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|921020|38350700014|6133799003|11063799006|3023799007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 O/rCO+M7WFOc7zBC01SmNZ3+5TKMWbezWmlgsNZlvWNKU+Llr5cpmMSlcTwDY5l9DBdLn2zDCfZf7BRWQGjkdhsifRzApW5gw6m/GLfLW9fbJ+pqhUWEZIqpZpdiSN7CfEo/UJQ0K26epCsrVU0O5Ih1cn/1cLeyh3WMZQFr/aaa1IVzUDrCdxUntE6MfMbCH7ZklaV+0cijm1vchtW9G+Yyfc7CWM902ubtV6+PmZyMSnJhrJD1Wun29X7SlyLLv00p7qrmroEVUgt9MWObuQke7iWCXhJrLXYv7oXSajbGbKklIkfGZd32mCsB8plQZt05lxIq0Uvu77+PlikU+VzlUR3ot17BWs1GidbsrSoBi7Y+iM5YL0xil3omh3YZDBje+TS9cDa8E3+6MvbmvrUD9RupjYofOJSYnSF9l6Wsfj+KZ1yHmnTQpzOkYvlMZyGgAuCxLsBO419XbOwqP+yRVpRI1aKQdcX9beU3Xe5E53paP4AlBihUn4yWHXMUUzAbOBtymAmm41fHrjzllz7rSfH9U/oMolUGkgk34TzxTxbmJ4X8wP8RtHuvETwQ+128Sp4YccFTNwcGqJOXBitKPKaK7egn+zGXy0Cvqyf7Ugr014O53QYfU4MipSq19HFHgR+Pc9VTEBiyDEzqm4GiUDrtqDOSQdspOPP5u8h2BWnoquy+hc/tHI5j6QhMQ8IR+hY/UHr2emydYY3pORAjXgdeWsbNNerpAMv+HLpYwZyjp0KmHsmAsDlAFC5wYx163cAisTjORAuvWdpCsg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(921020)(38350700014)(6133799003)(11063799006)(3023799007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QkdVOHh2NjlhUXcxL0gzMFRXeDRrZmxPRUZsRmRHQ0o0cUVOWjZSZXV1UUMv?=
 =?utf-8?B?cmtNSGg2QzJoRXNySmtVSE9xVFFKWi9Nb1lpY3k5TCttVE9PNjJpUXp5bkhu?=
 =?utf-8?B?b3pjQmRHVGViOXQ0TURiL0FjY1NHMVVSZVRzZHhBZWZ6T3hBaEtweWtzaHEr?=
 =?utf-8?B?bkV4UWlFNGw0dzU3Q2tlc2VObUdkWW5WT0ZpRGRtcXFCSlgrUEF4R2w2V0Jw?=
 =?utf-8?B?VzYwaW1oL0F4Y2p1bmFGek5jL21pNXVwM3lvOXduTzVoN0dVc254QjhGdnZv?=
 =?utf-8?B?cnZua2RQV0ZKUktlMlkyVEpjcWgwandZYmpzNTducVkrSFNpNVZWTTdvNm0y?=
 =?utf-8?B?bDBIQkZHdjIxSTJ6NlNDQUJ0azBrVXZxeHU2TWE2ay9NU1BpSkV4bndJRlhY?=
 =?utf-8?B?ZUs0V1ExOCtiWmU4dnZnRzdPRFQzM1U2VEFGZFFnZCtyT1BYTjR1aURjcm9W?=
 =?utf-8?B?Tk1MWkJRbHVFeDFtNmhMM0lYQzJSL1JNazgrVmZuSXVVRCtNVVNOUlJvcWNN?=
 =?utf-8?B?Z0U2Q0hDbCtUNlcrRkxMYXF1OHNwVjk4cC9nSjVxRTNTQUNjN1AzWFhudENh?=
 =?utf-8?B?ZjdCQ3F5R3BPMk5ld3VraXBEMmlwRTJWRWZMeUt2WG1TNjlsVStQK1RZOGpx?=
 =?utf-8?B?UXVBM2FpRkdMRGNkK2cwVlVaY3VselNMaVg5MEVabUxwMHZJQlk0MTdjeFND?=
 =?utf-8?B?ZjlTc1crOXBHNzZKMkY3bWgvR2U3OFl5SlczaVN5Sms5YUkyR3NacnhTTW9z?=
 =?utf-8?B?TkxjTTRxMjVxQ3VGa2REOVRUL3V3b2J4b0Y1SE5HQU51VWNjVjg3YlhYZEN0?=
 =?utf-8?B?S3FydVNTd3lCVzYxdjJ0NWVlQUVGS3U3VVRxd1Q1ckx2TlhJL0hmTWFHL2M1?=
 =?utf-8?B?bHNua3lyeXNvckZ3aEx5Wmw2M2VFMXRnQ2N6SW1rY3ZMVHJFTDh2Mm4vWkhi?=
 =?utf-8?B?VGpmNmhnWHZkZ2t3Z2UyVVU4TUlDSktNYWw1dkxNNEhpVjdIVCtXU3BCaVlY?=
 =?utf-8?B?QWxVWHBGbVFjNkFDcnA1YmdIb1hoYW9UMEZoTm83bTJSYnNkbC93aFY0dEEz?=
 =?utf-8?B?b1dJaWkvRHhoS1JrbTQzQlorYjVEWEdSOWplcDlsZVBQVzJhZHN2TDlvaWpj?=
 =?utf-8?B?K3o0Snc0MksvcGdyWnBHelYyQWJyRUZSam5obzNHV21nbFNOTU9VbWlUeDVy?=
 =?utf-8?B?STgvOXB1U2NmUEl5M1BQak9FMjJVYmhYcnlvU05YRHFBdWx1d2NtbDE1TGdX?=
 =?utf-8?B?dlFOQU4xYUEvODYrYTl1ZDE1UmI2NUZENDQzb0hia0k2RUgwcWZubS9rbnRV?=
 =?utf-8?B?ZDVtVTV6ZmlYYTR4U2ExZExuU0VhZW5GMWZNNVcvT01uMmIvd1JyeXFKNWty?=
 =?utf-8?B?Y1htQWI1UFBzMWtEVm9RbUtYY2svb2d1bk5CWUZZNUtoWXY5M291MFNYelVz?=
 =?utf-8?B?VzVlZE1tR0tPT1FQdjBYYXNlZjJYd2NvdUJ3ZCtlZFVqSjczU1JpZWZocGEw?=
 =?utf-8?B?VDVDWGFWTmFkcnpSaU0zZm9ZZFFmeTNEdEJZS2NLSnlXc25rOWFQei9MM0RM?=
 =?utf-8?B?WUJLUUVtTEZyb3RPYWt5b1J5Qkh5RFAvTkJ4aUhaVXYzK2Q2dmowNmMrVzdT?=
 =?utf-8?B?MktIQXk3eVNHTnEycnFpTDAranVORVJ0Q0FUVHpkbXZ5QWx2UTdQTHVMMEtm?=
 =?utf-8?B?Nm1RSE1hUU5ESmJYM0dkVTdFTjdpUkRLZUhZWWtOSU9PSTRDZFR4NDlSRjg5?=
 =?utf-8?B?RUNXQThBQmZxMDR6Um5teVRBSnVtRDREQ3U0cGVtSldPeEp2dmJtaDBxLzdN?=
 =?utf-8?B?SThmS3BSdlpQaXpPU0VmZEtYTlNBNEVQcmJtSGZHR0xRSjFCbDhoK1lScVln?=
 =?utf-8?B?RElLNzlDZmtwZEZOcGRWVzMyZTJoQzc5OW5JKy9ZWnE3L2xsVWlLeElScmRl?=
 =?utf-8?B?ejBFaWd0aFRoMzJkMW0wYXc3MW96WlZiTjlXQTM4MGNXNnB0ZkV1TzFtS0Zl?=
 =?utf-8?B?M1BWcTVVcElud2dMNWlLeVMrbTE2TUo5RDI3M1E2TDY0Q2R2RjhNdk5qVjhL?=
 =?utf-8?B?UXFBM2kvbjJhVGVQMEFreHJsRGxqT0VmWXZ4NEYzWmNRL05kU2Jya3pxWmZ3?=
 =?utf-8?B?dGxyc0pjQzdpLzFKWWxvcExVWXhlTWJXWDF2OHZNdVliUDJyMzJheU9NUThD?=
 =?utf-8?B?L2xFdWRDK1ljTXZWZlluQ0xzK1doZnRNQWRIbmxPL1ZPYW1mQlAzS2k0bnpa?=
 =?utf-8?B?M3dVTDNjaDZseG05WExodzMxUHNyM1ZTUHlWUEdyNmhJNDdXNHlhczBUN1R6?=
 =?utf-8?B?bmZLZWNReDVsVW5LdmR6SjBRaXVXMlRSUGx6QVJEaXdGUkhxVjVUQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396d309a-5d27-444a-2587-08deba350dd7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 08:10:16.4716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrWwgVArsTWEKCGU2RIyrzDr7qwvZrXSEFxuPsdzyU+8KnL5P4kq8hzGwodA8fBfTVEdidGW/kdCbL0oTC5DKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12265
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62703-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,i.mx:url,NXP1.onmicrosoft.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.nxp.com:mid]
X-Rspamd-Queue-Id: 888075C77BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI pixel formatter is a module found on i.MX95 used to reformat
packet info, pixel and non-pixel data from CSI-2 host controller to
match Pixel Link(PL) definition.

Add data formatting support.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v8:
- Remove fmt field and look up format from subdev state instead
- Unify function and structure naming to use csi_formatter_ prefix
- Remove misleading alignment comment from set_fmt function
- Optimize get_frame_desc to call once per start_stream
- Replace V4L2_FRAME_DESC_ENTRY_MAX with CSI_FORMATTER_VC_NUM in loops
- Remove redundant debug message in enable_streams
- Use MEDIA_PAD_FL_MUST_CONNECT flag instead of manual link check
- Fix typo: Formater -> Formatter in Kconfig help text
- Improve grammar in data type index mapping comment

Changes in v7:
- Update references from imx9 to imx95 for consistency with dt-bindings
- Enable PM runtime before async registration

Changes in v6:
- Remove unused header includes
- Unify macro naming: VCx/VCX -> VC and parameter x -> vc
- Remove unused format field from csi_formatter struct
- Use compact initialization for formats array
- Make find_csi_format() return NULL instead of default format
- Use unsigned int for array index in find_csi_format()
- Add err_ prefix to error handling labels
- Add v4l2_subdev_cleanup() and reorder cleanup sequence
- Update enable_streams debug output format
- Rename VC_MAX to VC_NUM and fix boundary check
- Update CSI formatter Kconfig description
- Use v4l2_subdev_get_frame_desc_passthrough() helper
- Fix error paths in async registration and probe
- Add mutex to protect enabled_streams
- Switch to devm_pm_runtime_enable()
- Remove redundant num_routes check in set_routing
- Optimize get_index_by_dt() and add warning for unsupported type
- csi_formatter_start/stop_stream: Process all streams in mask
---
 MAINTAINERS                                      |   8 +
 drivers/media/platform/nxp/Kconfig               |  14 +
 drivers/media/platform/nxp/Makefile              |   1 +
 drivers/media/platform/nxp/imx95-csi-formatter.c | 757 +++++++++++++++++++++++
 4 files changed, 780 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3124500ff432..5229b75d930a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19269,6 +19269,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 F:	drivers/media/platform/nxp/imx-jpeg
 
+NXP i.MX 95 CSI PIXEL FORMATTER V4L2 DRIVER
+M:	Guoniu Zhou <guoniu.zhou@nxp.com>
+L:	imx@lists.linux.dev
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
+F:	drivers/media/platform/nxp/imx95-csi-formatter.c
+
 NXP i.MX CLOCK DRIVERS
 M:	Abel Vesa <abelvesa@kernel.org>
 R:	Peng Fan <peng.fan@nxp.com>
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 40e3436669e2..1eccf128d149 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -28,6 +28,20 @@ config VIDEO_IMX8MQ_MIPI_CSI2
 	  Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.MX8MQ
 	  SoC.
 
+config VIDEO_IMX95_CSI_FORMATTER
+	tristate "NXP i.MX95 CSI Pixel Formatter driver"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  This driver provides support for the CSI Pixel Formatter found on
+	  i.MX95 series SoCs. This module unpacks the pixels received from the
+	  CSI-2 interface and reformats them to meet pixel link requirements.
+
+	  Say Y here to enable CSI Pixel Formatter module for i.MX95 SoC.
+
 config VIDEO_IMX_MIPI_CSIS
 	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index 4d90eb713652..6410115d870e 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -6,6 +6,7 @@ obj-y += imx8-isi/
 
 obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
 obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
+obj-$(CONFIG_VIDEO_IMX95_CSI_FORMATTER) += imx95-csi-formatter.o
 obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
 obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
 obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/media/platform/nxp/imx95-csi-formatter.c
new file mode 100644
index 000000000000..671979444d48
--- /dev/null
+++ b/drivers/media/platform/nxp/imx95-csi-formatter.c
@@ -0,0 +1,757 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+/* CSI Pixel Formatter registers map */
+
+#define CSI_VC_INTERLACED_LINE_CNT(vc)		(0x00 + (vc) * 0x04)
+#define INTERLACED_ODD_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(13, 0), (x))
+#define INTERLACED_EVEN_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(29, 16), (x))
+
+#define CSI_VC_INTERLACED_CTRL			0x20
+
+#define CSI_VC_INTERLACED_ERR			0x24
+#define CSI_VC_ERR_MASK				GENMASK(7, 0)
+#define CSI_VC_ERR(vc)				BIT((vc))
+
+#define CSI_VC_YUV420_FIRST_LINE_EVEN		0x28
+#define YUV420_FIRST_LINE_EVEN(vc)		BIT((vc))
+
+#define CSI_RAW32_CTRL				0x30
+#define CSI_VC_RAW32_MODE(vc)			BIT((vc))
+#define CSI_VC_RAW32_SWAP_MODE(vc)		BIT((vc) + 8)
+
+#define CSI_STREAM_FENCING_CTRL			0x34
+#define CSI_VC_STREAM_FENCING(vc)		BIT((vc))
+#define CSI_VC_STREAM_FENCING_RST(vc)		BIT((vc) + 8)
+
+#define CSI_STREAM_FENCING_STS			0x38
+#define CSI_STREAM_FENCING_STS_MASK		GENMASK(7, 0)
+
+#define CSI_VC_NON_PIXEL_DATA_TYPE(vc)		(0x40 + (vc) * 0x04)
+
+#define CSI_VC_PIXEL_DATA_CTRL(vc)		(0x60 + (vc) * 0x04)
+#define NEW_VC(vc)				FIELD_PREP(GENMASK(3, 1), vc)
+#define REROUTE_VC_ENABLE			BIT(0)
+
+#define CSI_VC_ROUTE_PIXEL_DATA_TYPE(vc)	(0x80 + (vc) * 0x04)
+
+#define CSI_VC_NON_PIXEL_DATA_CTRL(vc)		(0xa0 + (vc) * 0x04)
+
+#define CSI_VC_PIXEL_DATA_TYPE(vc)		(0xc0 + (vc) * 0x04)
+
+#define CSI_VC_PIXEL_DATA_TYPE_ERR(vc)		(0xe0 + (vc) * 0x04)
+
+#define CSI_FORMATTER_PAD_SINK			0
+#define CSI_FORMATTER_PAD_SOURCE		1
+#define CSI_FORMATTER_PAD_NUM			2
+
+#define CSI_FORMATTER_VC_NUM			8 /* Number of virtual channels */
+
+struct csi_formatter_pix_format {
+	u32 code;
+	u32 data_type;
+};
+
+struct csi_formatter {
+	struct device *dev;
+	struct regmap *regs;
+	struct clk *clk;
+
+	struct v4l2_subdev sd;
+	struct v4l2_subdev *csi_sd;
+	struct v4l2_async_notifier notifier;
+	struct media_pad pads[CSI_FORMATTER_PAD_NUM];
+
+	u32 remote_pad;
+	u32 reg_offset;
+
+	/* Protects enabled_streams */
+	struct mutex lock;
+	u64 enabled_streams;
+};
+
+struct csi_formatter_dt_index {
+	u8 dtype;
+	u8 index;
+};
+
+/*
+ * The index corresponds to the bit index in the register that enables
+ * the data type of pixel data transported by the Formatter.
+ */
+static const struct csi_formatter_dt_index formatter_dt_to_index_map[] = {
+	{ .dtype = MIPI_CSI2_DT_YUV420_8B,        .index = 0 },
+	{ .dtype = MIPI_CSI2_DT_YUV420_8B_LEGACY, .index = 2 },
+	{ .dtype = MIPI_CSI2_DT_YUV422_8B,        .index = 6 },
+	{ .dtype = MIPI_CSI2_DT_RGB444,		  .index = 8 },
+	{ .dtype = MIPI_CSI2_DT_RGB555,           .index = 9 },
+	{ .dtype = MIPI_CSI2_DT_RGB565,           .index = 10 },
+	{ .dtype = MIPI_CSI2_DT_RGB666,           .index = 11 },
+	{ .dtype = MIPI_CSI2_DT_RGB888,           .index = 12 },
+	{ .dtype = MIPI_CSI2_DT_RAW6,             .index = 16 },
+	{ .dtype = MIPI_CSI2_DT_RAW7,             .index = 17 },
+	{ .dtype = MIPI_CSI2_DT_RAW8,             .index = 18 },
+	{ .dtype = MIPI_CSI2_DT_RAW10,            .index = 19 },
+	{ .dtype = MIPI_CSI2_DT_RAW12,            .index = 20 },
+	{ .dtype = MIPI_CSI2_DT_RAW14,            .index = 21 },
+	{ .dtype = MIPI_CSI2_DT_RAW16,            .index = 22 },
+};
+
+static const struct csi_formatter_pix_format formats[] = {
+	/* YUV formats */
+	{ MEDIA_BUS_FMT_UYVY8_1X16,	MIPI_CSI2_DT_YUV422_8B },
+	/* RGB formats */
+	{ MEDIA_BUS_FMT_RGB565_1X16,	MIPI_CSI2_DT_RGB565 },
+	{ MEDIA_BUS_FMT_RGB888_1X24,	MIPI_CSI2_DT_RGB888 },
+	/* RAW (Bayer and greyscale) formats */
+	{ MEDIA_BUS_FMT_SBGGR8_1X8,	MIPI_CSI2_DT_RAW8 },
+	{ MEDIA_BUS_FMT_SGBRG8_1X8,	MIPI_CSI2_DT_RAW8 },
+	{ MEDIA_BUS_FMT_SGRBG8_1X8,	MIPI_CSI2_DT_RAW8 },
+	{ MEDIA_BUS_FMT_SRGGB8_1X8,	MIPI_CSI2_DT_RAW8 },
+	{ MEDIA_BUS_FMT_Y8_1X8,		MIPI_CSI2_DT_RAW8 },
+	{ MEDIA_BUS_FMT_SBGGR10_1X10,	MIPI_CSI2_DT_RAW10 },
+	{ MEDIA_BUS_FMT_SGBRG10_1X10,	MIPI_CSI2_DT_RAW10 },
+	{ MEDIA_BUS_FMT_SGRBG10_1X10,	MIPI_CSI2_DT_RAW10 },
+	{ MEDIA_BUS_FMT_SRGGB10_1X10,	MIPI_CSI2_DT_RAW10 },
+	{ MEDIA_BUS_FMT_Y10_1X10,	MIPI_CSI2_DT_RAW10 },
+	{ MEDIA_BUS_FMT_SBGGR12_1X12,	MIPI_CSI2_DT_RAW12 },
+	{ MEDIA_BUS_FMT_SGBRG12_1X12,	MIPI_CSI2_DT_RAW12 },
+	{ MEDIA_BUS_FMT_SGRBG12_1X12,	MIPI_CSI2_DT_RAW12 },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12,	MIPI_CSI2_DT_RAW12 },
+	{ MEDIA_BUS_FMT_Y12_1X12,	MIPI_CSI2_DT_RAW12 },
+	{ MEDIA_BUS_FMT_SBGGR14_1X14,	MIPI_CSI2_DT_RAW14 },
+	{ MEDIA_BUS_FMT_SGBRG14_1X14,	MIPI_CSI2_DT_RAW14 },
+	{ MEDIA_BUS_FMT_SGRBG14_1X14,	MIPI_CSI2_DT_RAW14 },
+	{ MEDIA_BUS_FMT_SRGGB14_1X14,	MIPI_CSI2_DT_RAW14 },
+	{ MEDIA_BUS_FMT_SBGGR16_1X16,	MIPI_CSI2_DT_RAW16 },
+	{ MEDIA_BUS_FMT_SGBRG16_1X16,	MIPI_CSI2_DT_RAW16 },
+	{ MEDIA_BUS_FMT_SGRBG16_1X16,	MIPI_CSI2_DT_RAW16 },
+	{ MEDIA_BUS_FMT_SRGGB16_1X16,	MIPI_CSI2_DT_RAW16 },
+};
+
+static const struct v4l2_mbus_framefmt formatter_default_fmt = {
+	.code = MEDIA_BUS_FMT_UYVY8_1X16,
+	.width = 1920U,
+	.height = 1080U,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SMPTE170M,
+	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+};
+
+static const struct csi_formatter_pix_format *csi_formatter_find_format(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(formats); i++)
+		if (code == formats[i].code)
+			return &formats[i];
+
+	return NULL;
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 subdev operations
+ */
+
+static inline struct csi_formatter *sd_to_formatter(struct v4l2_subdev *sdev)
+{
+	return container_of(sdev, struct csi_formatter, sd);
+}
+
+static int __csi_formatter_subdev_set_routing(struct v4l2_subdev *sd,
+					      struct v4l2_subdev_state *state,
+					      struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+						&formatter_default_fmt);
+}
+
+static int csi_formatter_subdev_init_state(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = CSI_FORMATTER_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = CSI_FORMATTER_PAD_SOURCE,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return __csi_formatter_subdev_set_routing(sd, sd_state, &routing);
+}
+
+static int csi_formatter_subdev_enum_mbus_code(struct v4l2_subdev *sd,
+					       struct v4l2_subdev_state *sd_state,
+					       struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->pad == CSI_FORMATTER_PAD_SOURCE) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_format(sd_state, code->pad,
+						   code->stream);
+		code->code = fmt->code;
+		return 0;
+	}
+
+	if (code->index >= ARRAY_SIZE(formats))
+		return -EINVAL;
+
+	code->code = formats[code->index].code;
+
+	return 0;
+}
+
+static int csi_formatter_subdev_set_fmt(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *sd_state,
+					struct v4l2_subdev_format *sdformat)
+{
+	struct csi_formatter_pix_format const *format;
+	struct v4l2_mbus_framefmt *fmt;
+
+	if (sdformat->pad == CSI_FORMATTER_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
+
+	format = csi_formatter_find_format(sdformat->format.code);
+	if (!format)
+		format = &formats[0];
+
+	v4l_bound_align_image(&sdformat->format.width, 1, 0xffff, 2,
+			      &sdformat->format.height, 1, 0xffff, 0, 0);
+
+	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad,
+					   sdformat->stream);
+	*fmt = sdformat->format;
+
+	/* Set default code if user set an invalid value */
+	fmt->code = format->code;
+
+	/* Propagate the format from sink stream to source stream */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat->pad,
+							   sdformat->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = sdformat->format;
+
+	return 0;
+}
+
+static int csi_formatter_subdev_set_routing(struct v4l2_subdev *sd,
+					    struct v4l2_subdev_state *state,
+					    enum v4l2_subdev_format_whence which,
+					    struct v4l2_subdev_krouting *routing)
+{
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_entity_is_streaming(&sd->entity))
+		return -EBUSY;
+
+	return __csi_formatter_subdev_set_routing(sd, state, routing);
+}
+
+static inline void csi_formatter_write(struct csi_formatter *formatter,
+				       unsigned int reg, unsigned int value)
+{
+	u32 offset = formatter->reg_offset;
+
+	regmap_write(formatter->regs, reg + offset, value);
+}
+
+static u8 csi_formatter_get_index_by_dt(u8 data_type)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(formatter_dt_to_index_map); ++i) {
+		const struct csi_formatter_dt_index *entry =
+			&formatter_dt_to_index_map[i];
+
+		if (data_type == entry->dtype)
+			return entry->index;
+	}
+
+	pr_warn_once("Unsupported data type 0x%x, using default\n", data_type);
+
+	return formatter_dt_to_index_map[0].index;
+}
+
+static int csi_formatter_get_vc(struct csi_formatter *formatter,
+				struct v4l2_mbus_frame_desc *fd,
+				unsigned int stream)
+{
+	struct v4l2_mbus_frame_desc_entry *entry = NULL;
+	unsigned int i;
+	int vc;
+
+	for (i = 0; i < fd->num_entries; ++i) {
+		if (fd->entry[i].stream == stream) {
+			entry = &fd->entry[i];
+			break;
+		}
+	}
+
+	if (!entry) {
+		dev_err(formatter->dev,
+			"No frame desc entry for stream %u\n", stream);
+		return -EPIPE;
+	}
+
+	vc = entry->bus.csi2.vc;
+
+	if (vc < 0 || vc >= CSI_FORMATTER_VC_NUM) {
+		dev_err(formatter->dev, "Invalid virtual channel %d\n", vc);
+		return -EINVAL;
+	}
+
+	return vc;
+}
+
+static void csi_formatter_stop_stream(struct csi_formatter *formatter,
+				      u64 stream_mask)
+{
+	unsigned int i;
+
+	for (i = 0; i < CSI_FORMATTER_VC_NUM; ++i) {
+		if (!(stream_mask & BIT(i)))
+			continue;
+
+		csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(i), 0);
+	}
+}
+
+static int csi_formatter_start_stream(struct csi_formatter *formatter,
+				      struct v4l2_subdev_state *state,
+				      u64 stream_mask)
+{
+	const struct csi_formatter_pix_format *pix_fmt;
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_mbus_frame_desc fd = {};
+	u64 configured_streams = 0;
+	unsigned int i;
+	u32 val;
+	int vc;
+	int ret;
+
+	ret = v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
+			       formatter->remote_pad, &fd);
+	if (ret < 0 && ret != -ENOIOCTLCMD) {
+		dev_err(formatter->dev, "Failed to get frame desc: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < CSI_FORMATTER_VC_NUM; ++i) {
+		if (!(stream_mask & BIT(i)))
+			continue;
+
+		fmt = v4l2_subdev_state_get_format(state,
+						   CSI_FORMATTER_PAD_SINK, i);
+
+		pix_fmt = csi_formatter_find_format(fmt->code);
+
+		val = BIT(csi_formatter_get_index_by_dt(pix_fmt->data_type));
+
+		if (ret == -ENOIOCTLCMD) {
+			/*
+			 * Source doesn't implement get_frame_desc, use
+			 * default VC 0
+			 */
+			vc = 0;
+		} else {
+			vc = csi_formatter_get_vc(formatter, &fd, i);
+			if (vc < 0) {
+				ret = vc;
+				goto err_cleanup;
+			}
+		}
+
+		csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), val);
+		configured_streams |= BIT(i);
+	}
+
+	return 0;
+
+err_cleanup:
+	csi_formatter_stop_stream(formatter, configured_streams);
+	return ret;
+}
+
+static int csi_formatter_subdev_enable_streams(struct v4l2_subdev *sd,
+					       struct v4l2_subdev_state *state,
+					       u32 pad, u64 streams_mask)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	struct device *dev = formatter->dev;
+	u64 sink_streams;
+	int ret;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       CSI_FORMATTER_PAD_SOURCE,
+						       CSI_FORMATTER_PAD_SINK,
+						       &streams_mask);
+	if (!sink_streams || !streams_mask)
+		return -EINVAL;
+
+	guard(mutex)(&formatter->lock);
+
+	if (!formatter->enabled_streams) {
+		ret = pm_runtime_resume_and_get(formatter->dev);
+		if (ret < 0) {
+			dev_err(dev, "Failed to resume runtime PM: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = csi_formatter_start_stream(formatter, state, streams_mask);
+	if (ret)
+		goto err_runtime_put;
+
+	ret = v4l2_subdev_enable_streams(formatter->csi_sd,
+					 formatter->remote_pad,
+					 sink_streams);
+	if (ret)
+		goto err_stop_stream;
+
+	formatter->enabled_streams |= streams_mask;
+
+	return 0;
+
+err_stop_stream:
+	csi_formatter_stop_stream(formatter, streams_mask);
+err_runtime_put:
+	if (!formatter->enabled_streams)
+		pm_runtime_put(formatter->dev);
+	return ret;
+}
+
+static int csi_formatter_subdev_disable_streams(struct v4l2_subdev *sd,
+						struct v4l2_subdev_state *state,
+						u32 pad, u64 streams_mask)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	u64 sink_streams;
+	int ret;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       CSI_FORMATTER_PAD_SOURCE,
+						       CSI_FORMATTER_PAD_SINK,
+						       &streams_mask);
+	if (!sink_streams || !streams_mask)
+		return -EINVAL;
+
+	guard(mutex)(&formatter->lock);
+
+	ret = v4l2_subdev_disable_streams(formatter->csi_sd, formatter->remote_pad,
+					  sink_streams);
+	if (ret)
+		dev_err(formatter->dev, "Failed to disable streams: %d\n", ret);
+
+	csi_formatter_stop_stream(formatter, streams_mask);
+
+	formatter->enabled_streams &= ~streams_mask;
+
+	if (!formatter->enabled_streams)
+		pm_runtime_put(formatter->dev);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops formatter_subdev_pad_ops = {
+	.enum_mbus_code		= csi_formatter_subdev_enum_mbus_code,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= csi_formatter_subdev_set_fmt,
+	.get_frame_desc		= v4l2_subdev_get_frame_desc_passthrough,
+	.set_routing		= csi_formatter_subdev_set_routing,
+	.enable_streams		= csi_formatter_subdev_enable_streams,
+	.disable_streams	= csi_formatter_subdev_disable_streams,
+};
+
+static const struct v4l2_subdev_ops formatter_subdev_ops = {
+	.pad = &formatter_subdev_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops formatter_internal_ops = {
+	.init_state = csi_formatter_subdev_init_state,
+};
+
+/* -----------------------------------------------------------------------------
+ * Media entity operations
+ */
+
+static const struct media_entity_operations formatter_entity_ops = {
+	.link_validate	= v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+};
+
+static int csi_formatter_subdev_init(struct csi_formatter *formatter)
+{
+	struct v4l2_subdev *sd = &formatter->sd;
+	int ret;
+
+	v4l2_subdev_init(sd, &formatter_subdev_ops);
+
+	snprintf(sd->name, sizeof(sd->name), "%s", dev_name(formatter->dev));
+	sd->internal_ops = &formatter_internal_ops;
+
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+		     V4L2_SUBDEV_FL_HAS_EVENTS |
+		     V4L2_SUBDEV_FL_STREAMS;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	sd->entity.ops = &formatter_entity_ops;
+	sd->dev = formatter->dev;
+
+	formatter->pads[CSI_FORMATTER_PAD_SINK].flags = MEDIA_PAD_FL_SINK
+						      | MEDIA_PAD_FL_MUST_CONNECT;
+	formatter->pads[CSI_FORMATTER_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, CSI_FORMATTER_PAD_NUM,
+				     formatter->pads);
+	if (ret) {
+		dev_err(formatter->dev, "Failed to init pads\n");
+		return ret;
+	}
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		media_entity_cleanup(&sd->entity);
+
+	return ret;
+}
+
+static inline struct csi_formatter *
+notifier_to_csi_formatter(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct csi_formatter, notifier);
+}
+
+static int csi_formatter_notify_bound(struct v4l2_async_notifier *notifier,
+				      struct v4l2_subdev *sd,
+				      struct v4l2_async_connection *asc)
+{
+	const unsigned int link_flags = MEDIA_LNK_FL_IMMUTABLE
+				      | MEDIA_LNK_FL_ENABLED;
+	struct csi_formatter *formatter = notifier_to_csi_formatter(notifier);
+	struct v4l2_subdev *sdev = &formatter->sd;
+	struct media_pad *sink = &sdev->entity.pads[CSI_FORMATTER_PAD_SINK];
+	struct media_pad *remote_pad;
+	int ret;
+
+	formatter->csi_sd = sd;
+
+	dev_dbg(formatter->dev, "Bound subdev: %s pad\n", sd->name);
+
+	ret = v4l2_create_fwnode_links_to_pad(sd, sink, link_flags);
+	if (ret < 0)
+		return ret;
+
+	remote_pad = media_pad_remote_pad_first(sink);
+	if (!remote_pad) {
+		dev_err(formatter->dev, "Pipe not setup correctly\n");
+		return -EPIPE;
+	}
+	formatter->remote_pad = remote_pad->index;
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations formatter_notify_ops = {
+	.bound = csi_formatter_notify_bound,
+};
+
+static int csi_formatter_async_register(struct csi_formatter *formatter)
+{
+	struct device *dev = formatter->dev;
+	struct v4l2_async_connection *asc;
+	int ret;
+
+	struct fwnode_handle *ep __free(fwnode_handle) =
+		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
+						FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return -ENOTCONN;
+
+	v4l2_async_subdev_nf_init(&formatter->notifier, &formatter->sd);
+
+	asc = v4l2_async_nf_add_fwnode_remote(&formatter->notifier, ep,
+					      struct v4l2_async_connection);
+	if (IS_ERR(asc)) {
+		ret = PTR_ERR(asc);
+		goto err_cleanup_notifier;
+	}
+
+	formatter->notifier.ops = &formatter_notify_ops;
+
+	ret = v4l2_async_nf_register(&formatter->notifier);
+	if (ret)
+		goto err_cleanup_notifier;
+
+	ret = v4l2_async_register_subdev(&formatter->sd);
+	if (ret)
+		goto err_unregister_notifier;
+
+	return 0;
+
+err_unregister_notifier:
+	v4l2_async_nf_unregister(&formatter->notifier);
+err_cleanup_notifier:
+	v4l2_async_nf_cleanup(&formatter->notifier);
+	return ret;
+}
+
+static void csi_formatter_async_unregister(struct csi_formatter *formatter)
+{
+	v4l2_async_unregister_subdev(&formatter->sd);
+	v4l2_async_nf_unregister(&formatter->notifier);
+	v4l2_async_nf_cleanup(&formatter->notifier);
+}
+
+/* -----------------------------------------------------------------------------
+ * Suspend/resume
+ */
+
+static int csi_formatter_runtime_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+
+	clk_disable_unprepare(formatter->clk);
+
+	return 0;
+}
+
+static int csi_formatter_runtime_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+
+	return clk_prepare_enable(formatter->clk);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(csi_formatter_pm_ops,
+				 csi_formatter_runtime_suspend,
+				 csi_formatter_runtime_resume, NULL);
+
+static int csi_formatter_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct csi_formatter *formatter;
+	u32 val;
+	int ret;
+
+	formatter = devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
+	if (!formatter)
+		return -ENOMEM;
+
+	formatter->dev = dev;
+
+	ret = devm_mutex_init(dev, &formatter->lock);
+	if (ret)
+		return ret;
+
+	formatter->regs = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(formatter->regs))
+		return dev_err_probe(dev, PTR_ERR(formatter->regs),
+				     "Failed to get csi formatter regmap\n");
+
+	ret = of_property_read_u32(dev->of_node, "reg", &val);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get csi formatter reg property\n");
+
+	formatter->reg_offset = val;
+
+	formatter->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(formatter->clk))
+		return dev_err_probe(dev, PTR_ERR(formatter->clk),
+				     "Failed to get pixel clock\n");
+
+	ret = csi_formatter_subdev_init(formatter);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to initialize formatter subdev\n");
+
+	platform_set_drvdata(pdev, &formatter->sd);
+
+	/* Enable runtime PM. */
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto err_cleanup_subdev;
+
+	ret = csi_formatter_async_register(formatter);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to register async subdevice\n");
+		goto err_cleanup_subdev;
+	}
+
+	return 0;
+
+err_cleanup_subdev:
+	v4l2_subdev_cleanup(&formatter->sd);
+	media_entity_cleanup(&formatter->sd.entity);
+	return ret;
+}
+
+static void csi_formatter_remove(struct platform_device *pdev)
+{
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+
+	csi_formatter_async_unregister(formatter);
+
+	v4l2_subdev_cleanup(&formatter->sd);
+	media_entity_cleanup(&formatter->sd.entity);
+}
+
+static const struct of_device_id csi_formatter_of_match[] = {
+	{ .compatible = "fsl,imx95-csi-formatter" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, csi_formatter_of_match);
+
+static struct platform_driver csi_formatter_device_driver = {
+	.driver = {
+		.name           = "csi-pixel-formatter",
+		.of_match_table = csi_formatter_of_match,
+		.pm             = pm_ptr(&csi_formatter_pm_ops),
+	},
+	.probe  = csi_formatter_probe,
+	.remove = csi_formatter_remove,
+};
+
+module_platform_driver(csi_formatter_device_driver);
+
+MODULE_AUTHOR("NXP Semiconductor, Inc.");
+MODULE_DESCRIPTION("NXP i.MX95 CSI Pixel Formatter driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


