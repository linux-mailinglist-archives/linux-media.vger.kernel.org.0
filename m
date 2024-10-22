Return-Path: <linux-media+bounces-20033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C59139A9D2A
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 10:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4579E1F22F6E
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 08:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28DF17BB3F;
	Tue, 22 Oct 2024 08:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KHTc4qQo"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF6E27735;
	Tue, 22 Oct 2024 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729586471; cv=fail; b=SMe2YwRsarMqr3L0yhi7OUZ155idxRuVxThvoaIKNQ3e5cnkY7ZeZyK1B8r/HpVOkcBbNum3axfwCwIc1JK0z5yvpwziNuTBVJa8HHzuw6aDCQJxR3ZhPr892clqCInTiWLspbXWBtSbtOrPCrsJVf2DtqCWSTv6KtmrGZK8sG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729586471; c=relaxed/simple;
	bh=FOw6CxVHK0jpzdLXOkr9j7EgRq4zlzREECkEyZnKMRA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=d1CGXxWxfhHXXxy+QINGUtHwJjWxhEIT32/aEVcYaYSO3yqEztWh02FHeLP9Srq5JZLLwmyZ/iOyXsu994izkqFmnhF2K0446J5gLxoYq0UhEaEyfIIdNRGQwdgMHAwe8N3v6X6XkJKDDEh8ICqhluh62K7ILxeHHyBobYr5tcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KHTc4qQo; arc=fail smtp.client-ip=52.101.66.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qa7uPxqLdyw+M8tWe2gCmrh7nODRwCuIqRd+1SZL0FBTGs5wD/lFPG4cl3UyE/uEQZ0DJfilI18lMLIgDwOmp7W3Xb1UIhAQPy9yTjVPMLBgquu1FWSYWf5ToJ1Z6Y8VKq1KhiqkAzbqRbKBxxgaBtPJvVMEQYd/dxqO6uHXd7Rdk5qhvPpamyNDPTegFY1OhMaS35klH1bH1yJ+B0sqJGtbQDRBE8GsiPq4RC3zbhHWHAadzaWYPgtb931liNIP3kas78+mGBWA9jxhdBUYAaI4aNA6wLmCT3SDci6u4i+UqOJwQ5IembSCami8tk79asZ7kjoJuBsWa22FZRk7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PzC/SLr00KRRMxUbP7bMhLcwPvcGunnB2TADIWUYAw=;
 b=PzFDj+S6nKVLVpx5USbucYJMR7DrXQhDkXyrObF12HDdX3Dtm25OqUxx+jnAqsgfARvlNsFoOWElmV/9XpM4SmaWD7sfhkVzYDZCDsqB91xdArzGo2JyjI6UXP0KU1Nt8xV4S3Dq7zMTGUw6xeZLoLPEYiu/MIT1C0njhWW7A71Vde0M/hfXEjVRkIgw/vy1Oi4lcT8rJdyR/VBNNIjh+53q+14xHibXv4zGeZqJzJs/+zIbFhgNDxsC5KLzKyWQqD/W3W5rl9sHTohi5NQNqmRNE0Nu09vBW5BDOI9Y7m2TA67wR8WbbLU3S24Uv6bbYoyD/KdjrQAK750mNgInDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PzC/SLr00KRRMxUbP7bMhLcwPvcGunnB2TADIWUYAw=;
 b=KHTc4qQordKiBR76aDiodeOnZHNXfxMNzBtYFEvT3MonDH7QdKFkM5vFYy2V85c7cZ4mxrOLx1+6+9llRN4vJQi5cqGXXT0dsbZZShUQFlxpoN1jmq1RDoMiFmfF7HXCcHqmxw0Nl3M8djs89ny/w9noSeBC5vYWD8KQJW3E68cwrF7dBYI3RzlVPZL+m0MOdCFTJP9OZq3f+Iw3zXaa1fnadRIXqTVa0XxmDwXNn0FOOUFdKCdOFCFlZKKClEmD6jp/AqNcP6zGTeWPVxT9KVLG058EknkYg5j3npka4TUtuh3VyQir9LH5zIH+9fGF9kImjM+QUBFFv5S/9UBX8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB7831.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 08:41:05 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 08:41:05 +0000
From: Ming Qian <ming.qian@nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: yunkec@google.com,
	nicolas@ndufresne.ca,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC v3 0/4] Add video encoder ROI ctrls
Date: Tue, 22 Oct 2024 17:40:36 +0900
Message-ID: <20241022084040.3390878-1-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096::17) To
 PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 5314754a-a696-4257-22dc-08dcf2754478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RKbrb9S5gwdvBATclWWU28iBMrpZfXoP4XDv+bZypqUHLQ+Te31/QIb8dR32?=
 =?us-ascii?Q?tqnqVyHk6tdUjIjWIH9VJJ4ZUQ+mCSXKBiqeXRYbnKK86nB6BhBuxY6bORaf?=
 =?us-ascii?Q?zBRNqAwNA5sLqJxvYnDkNQ2MT9N8DAZ4S6udH9qAcro6SaahSYO9ZCyNQdVn?=
 =?us-ascii?Q?vXBDJyFt8MGChNEdXf3dJ7J+Xn/bNBl+NXWo2+K9x7SNasomWAOfTNQlt5Eu?=
 =?us-ascii?Q?G6YKG8Z9XCDO6VvHuzpsOnv/VwBfN40F4WVRDCUM48hhmoY2GV621dQ4f7W9?=
 =?us-ascii?Q?3U4zMPDQB04yWmN5YFbhfNIir86Oou3jGggEMI1wp0rCRWAeAxNkYUgBYxpE?=
 =?us-ascii?Q?i35aveK5mLDVHrjPJYxE5hWWNZqJgHIrvdPPMnTATZbpo0WG5hDWxyvSJkxB?=
 =?us-ascii?Q?ejKNw+BCf6bDeNLKpD3ZZ27/WgLk5AkJ8GI39DjMHchMo4+K4HMoHOEtXYkE?=
 =?us-ascii?Q?akCCyQ27BBcs2JqDX98ANvlU+UK8XOOcHDDIC16B31u0qUBKV/9W8/8rELGs?=
 =?us-ascii?Q?yqtXMglUcApo9a06xmI5WEL4aau11mWPbm71JXJfBLqYseKkgEj8LyPZIPyR?=
 =?us-ascii?Q?CnvmaOIapH/0u6zS5qjD062sqAxaxgwargbzHf9/Z2IjD7e2zr8V5hF34dPU?=
 =?us-ascii?Q?NoH4BpQPvvib5RSb9eJU/jSGA6qxdu0xDCSQH8RFd+HhubeRtJ3wynktKBRl?=
 =?us-ascii?Q?2a3dyIwyEx7nHdTNUGFG+/wgaNuWnYQ/y4RfIh8LSA94w6KLFFFYxBXIHf32?=
 =?us-ascii?Q?lZ9eRVvbyMH/My8pBcMm/0eCrWgxaDugtst5OZ5czsccY+nmjlRqh6J3/p85?=
 =?us-ascii?Q?4fcY4NLq+BXG45CjpJUtqbNns84u491xNtTNoteHYfNpWwwTIxOMLFivO8KZ?=
 =?us-ascii?Q?Ydum2u5CVSLjPSDoptRsiuacQqGil2WMZ7dsSrRlxPFB0MpKpyI1dRLC+Jhw?=
 =?us-ascii?Q?h3uhM0BZnh7fVYDuS5VapaEC1SLu7vXcsCMlm7X57E5k7WC3rt/btMjty9Hk?=
 =?us-ascii?Q?qd7Ci81CKzae+DWnT566e1QW2T1ssulcPx+3rcQTmeFKAkGIgQnPtqSe8IBx?=
 =?us-ascii?Q?pXFhVKWjIYlrW9AUAZAWJYlL2rGUdbt849C+7DDr7VCY9eU8DPHqlsHc6J2R?=
 =?us-ascii?Q?l5bSkkE1RUtpOQTomzAlKNvShGlIIYAgCQGxupGDJ0Sox00BaSsGRsHOaw5L?=
 =?us-ascii?Q?GMaDPO6pQiHYPZHcrhMfqExe8Cpic58EJ+GcYsNnBccRlv2WU85gqUO6XXTb?=
 =?us-ascii?Q?im8xO3R8txAgZEnQkjVOPJuVyyFzT+6/kr1mmkv/lpwfRh8YMlntak3oPpgZ?=
 =?us-ascii?Q?gQdr8FWp92Npb98S6m2P+Aa/+WPyPjtl2zgl0gn69BnzU7J4w4krLAIkURk5?=
 =?us-ascii?Q?tO/OF1UfwdzXxwP4H87nXMrZY/Ce?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CfLkZghtHyBanKeiCc7jdz/XRilu1NWMRUuuimLP5lzXdcScAhye35BXa5z5?=
 =?us-ascii?Q?+e4RkLwG41F9Ud4AHP90+ke+mmwzC2tAaVzfCIQfH9RfMybo3EjNtQnfE2R/?=
 =?us-ascii?Q?rdWvjZvk+XZOLgELFJr3TNSjwlRbqEr3sukgK7pPOcJ8H1acYYRgoColrWh1?=
 =?us-ascii?Q?XhkfGgAbYUca9yooQabowTdNPsZW4r9jkwEFGHhZR8Wr6Sf7kl7EUXsMOhhw?=
 =?us-ascii?Q?IXk+rmrWr0cvIH7j40s+akOS+F2m9SsZysfWEJ3G+en9OguBzwgD8qR5ZLz5?=
 =?us-ascii?Q?HzKqpz77SaEUflXKIU8gNN0CULqUiGiKMnUWCx5RTIR+19zuUXPL2sHzFNd7?=
 =?us-ascii?Q?SXDKINQ316isn2fEelH7qiKDZwSX30yqPdBhO2J/46qSLp9+ZJaUDybITlC6?=
 =?us-ascii?Q?coXMbG4/hAjWtRX/QzypxOcpRjV7Cdc3VCCmwqC3bWh+5A6o3RNFm8pPAJle?=
 =?us-ascii?Q?OMMqWP7ZaUuVdZMG4mkPvLOk0FcdwL/ssWgbLTJASnj/JJ1Gt4PQK3vWt81I?=
 =?us-ascii?Q?2SJ0o9eQF5YP4oeaumaW/z00049bqjCJuVZ8ai5MHaDiDWaQZImy5N1d0vy/?=
 =?us-ascii?Q?roZXz35GAtBZ+GT8Oy6FWAW0va1ToZFFJfMyonrs39+PtBsmhl7o0xgHBbl9?=
 =?us-ascii?Q?Hj3EKcXxhnaFaeMxh0u8KA2UlRVjIc+/RDMSMIuo/0J5BSigS30jvCW3t9u1?=
 =?us-ascii?Q?R7zmlbHkg/QspnmH7C27Sx6j4knNZilDMxHBMLd5xT92hMswxf2JVGkX16Iw?=
 =?us-ascii?Q?vjYYnrcMljUK8BhPa28zaa9jQw0IoK8F27EWPdvp6J2mdP7bUv/sPL1vamJ2?=
 =?us-ascii?Q?hQYX1WDjxqPacWVM5STUcsSx3XfL5LWFuYHWgiOOLE0Q476Bpa+vHPJrW8jd?=
 =?us-ascii?Q?N+TG/pNC1+r81zOmkL4dc239cbJyhlz0H+egYmw49azz3xPX/r+2guPH0cu9?=
 =?us-ascii?Q?tZr3OE+QS+4rutBNQ0468rBgHqEm7vrmEFIrY3SLeFNqc4PKl1VBMRaDhEEJ?=
 =?us-ascii?Q?ZRTFAcmYVdwhnxtQNtmqFsIcG+Xf7gr373usD3f1db99+/v7Y4FwoDZoXwFP?=
 =?us-ascii?Q?Gea6XHdNwH4Pt9Nb8lufxPYRdAvQcZjUP26wjambCYyUQLZuXafXWTuZbqXq?=
 =?us-ascii?Q?b3nbHftJ8hI3oJUC3FBQfrroF2xfsTRdZsHURCEqOODFwKCYJuSJ3R8kfz4D?=
 =?us-ascii?Q?wVGvqG70v1bDu8VaoecWZOBriCD1b5f8WMzu3hyg/HXJF9ps3gTSv6+t0bGs?=
 =?us-ascii?Q?OQ29Q5Kcnl3X1cydB4UNcPn17K/qh+z/WJN/2zDI3pLPL+yFaYbBIy8LTgBh?=
 =?us-ascii?Q?+gl7YXGXRKYEUUVVMHFuD2Fe2Qk4NYgJXxVGV/zNBVziQK027fi8rl6NiqkA?=
 =?us-ascii?Q?4UIp+GX5UAXFkbFFs7nDRo8Dtx61bQvSur+u/1PrRwkD9Ta0ISp7iNL2CnPy?=
 =?us-ascii?Q?YIhZVJ40drW/GLpw7QmvzHupDhBKVx3TW5tGVqC5jzHlT1GDpbRveHCrA47+?=
 =?us-ascii?Q?rQkSf0AW9anSgoQY74kamGpwcgKil9aBlHmPUH8kIYLqUHtzOm46bd9fv9sQ?=
 =?us-ascii?Q?rMqVK7xpFISLdl30hwsW0HaBENKCLwkV6EZCgns+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5314754a-a696-4257-22dc-08dcf2754478
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 08:41:05.5370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: veRf+/6lrhIqMODz1i/jFIxgdBKN+/J8vePmyhocQLK45xoP1IMepsyRpOLMiaI6jZTCbt1tX9ID9uCRhw0Rug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7831

Hi,

This patch set implements region of interest (ROI) ctrls for video
encoder.

One video encoder IP may support the following two ROI configurations or
one of them:
    1. configure ROI as a rectangular region, and set a delta QP parameter.
    2. configure ROI as a rectangular region, and set a priority parameter.
    3. configure ROI as a QP map as an array. Each value represents the delta QP
of a block in raster scan order. The block size is determined by
the specific IP.
    4. configure ROI as a QP map as an array. Each value represents the absolute QP
of a block in raster scan order. The block size is determined by
the specific IP.

To achieve this, I made the following change:
    1. I reuse the type V4L2_CTRL_TYPE_RECT that is defined in the UVC ROI patchset
    2. Define a ctrl V4L2_CID_MPEG_VIDEO_ROI_MODE to choose ROI configuration
    3. Define some ctrl to configure ROI
    4. Define a ctrl V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE to query block size

I referred the patchset "Implement UVC v1.5 ROI" (https://lwn.net/Articles/953532/)
and pick some patches from it.

changelog:

v3
- Drop the type V4L2_CTRL_TYPE_REGION
- Split the compound control into 2 ctrls
- Define 4 ROI mode

v2
- export symbol of v4l2_ctrl_type_op_minimum
- export symbol of v4l2_ctrl_type_op_maximum

Hans Verkuil (1):
  media: v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL

Ming Qian (1):
  media: v4l2-ctrls: Add video encoder ROI ctrls

Yunke Cao (2):
  media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
  media: vivid: Add an rectangle control

 .../media/v4l/ext-ctrls-codec.rst             |  95 ++++++++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  26 ++-
 .../media/v4l/vidioc-queryctrl.rst            |  14 ++
 .../media/videodev2.h.rst.exceptions          |   4 +
 drivers/media/i2c/imx214.c                    |   4 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
 .../media/test-drivers/vivid/vivid-ctrls.c    |  34 ++++
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  54 ++++--
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 169 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  46 +++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  62 ++++++-
 include/uapi/linux/v4l2-controls.h            |  16 ++
 include/uapi/linux/videodev2.h                |   5 +
 14 files changed, 493 insertions(+), 49 deletions(-)

-- 
2.43.0-rc1


