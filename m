Return-Path: <linux-media+bounces-32251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B31CAB2D55
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 04:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7127C16F292
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 02:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7921917F9;
	Mon, 12 May 2025 02:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gnZBkS3N"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2046.outbound.protection.outlook.com [40.107.22.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5830E944F;
	Mon, 12 May 2025 02:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747015360; cv=fail; b=rViN4zWPlX7yKFzTEaGdtK8cqENyjbSOnfbadXfrCn4WGtqiegeqCamfyN2toqMf+XS+vZBuqMxYUZesocRImUxmWyKEzWbpH/PugebuMoPXBT2CYqfFRIubjbKGbPtBEwKfa4pP3OLbOO/EAnGZbzq0cZQjiX83+U5Hg5nI2tA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747015360; c=relaxed/simple;
	bh=aOHBbrjWwb1/vjiAxZdDj/QyTLfBY5RN1IYaqxuYLlE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gTiOY6QPbwJECuFZw6u0c/PetNB3MtttmaDQbuvk0De028v2OXqRlI/hoG5WQ+SfF4hpBoJAXMohd1w54JyGUcC+w5Qs3UMR8u8Q4nWCLvRCv1pX8zHspdbh62Ld0ss7FdeVpL3SBbEVPbYDTh8hZzOmGHzxRu5U7oFQsboW4IU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gnZBkS3N; arc=fail smtp.client-ip=40.107.22.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VO1gFQ2+ndmruW/MRHAQdWuA9sBcWDvCAhYZ26YO9nFUIexyJEW7BgdHny0VxDZT+vzMQFLq1ghYSS9daY4lvX+EC6GxrXYbxlNROKVN2QgxUlS32E+BLL3kUASIAC4UtK/Ld0qX2mh8vnhDD2EqkagHZt6bL6QIuRa/493JOSeuhtrGvQGyAJPqtgI2odsdNxuAYmx9v9LsdwNrSrRJtBWnXmkNk3b18xA78/6EMlgBNbhGQWxpnREcSn3mf3PRzsXJV9AuFJEZAwSpAE1NWMicJ3zsWtFzqeohr0aMGiaFFqnMCUvFziZux1x+qp4084IS3yQ7OOSiu/qch7fPFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEFvcPhqTe3Tu3yifFuRtV59t0yPCPBZbmzH94nDWkU=;
 b=AIMJ4q7a+bIPabTACezthrDi6o3Fc8pUq+AgAYgTBWjqOe1F2x4PlSOYyH+juPwhDJeGKonIwTbf+OIWfV0bFndUy5niKq8pYEAj7JSkHm00Cw93DZpwxr6o419+HomGSixa1tr9Hq7meJTnVeQiHw75tHzHDQeX4tJ3xvEy78IsSGZCrUhQSykydAIx0Hdr+wdiTzb+d90rEsUyksPe9wdKi6nHAYzrKa1i0mawpn+CFqgRXxnHNzkPSqfR4MdaxWmMxJVz2Zykc1afli7+nSbiLXFvEIwWQc1JIoe/LPaTQA7k7SOPKT5n6TkHrD0fNYnTUbY3qG01yK72WF9oUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEFvcPhqTe3Tu3yifFuRtV59t0yPCPBZbmzH94nDWkU=;
 b=gnZBkS3NZ9movt6Bq8yriv/wvVEu7vRqp3iZbI1xI4NK/fiv+xwAl6/UkvS6sGwaj/5hjxtXIMPiBDpnjENEgFUKvr8VsS49V9XCM3ktcckUMWSovBL5wCbYMo2tFdHBtLkr+hxqWt5HVmuX6KJWs/U5/re/YDA+TUdj/zf51EcUxqFdOCEP4RxUJv7vMQyiy0CkcNgSb2cAR5ezYtYvI7TH4as6VvleymwYFYGnqeMChXndhoXwU7HtMtigQrfEEKCRlIQXExZ6cuNzzbagtFmkmUaXnb3jUtDMxUV6M9Ir1B93kMQ80CsFIrLBMAqGdNS1JmXJh0W6d3BrkKqqOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAXPR04MB9229.eurprd04.prod.outlook.com (2603:10a6:102:2bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 02:02:34 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8722.024; Mon, 12 May 2025
 02:02:34 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4] media: amphion: Add H264 and HEVC profile and level control
Date: Mon, 12 May 2025 10:01:36 +0800
Message-ID: <20250512020137.211-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0181.apcprd06.prod.outlook.com (2603:1096:4:1::13)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAXPR04MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 79689685-d8c5-41ce-65aa-08dd90f90f74
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ro79S5xVRQtLCXWWpzs+frJHlWiiXupqWalCb26K6qgfQ5NN1WnpzDBedg9E?=
 =?us-ascii?Q?7sLLxq6DinBsMJgUWseG5T73U96PUWMgTtuLmza1Kr8zgZoD6tb87P0OH4mB?=
 =?us-ascii?Q?8oY+iaiwGnwqTdAz7SLQoSHXgfcJzEqPXU5hmI7Q6ol5Wcnav3FWLtAOw9Yn?=
 =?us-ascii?Q?rsRzO6k+4qTGnNGNtHpv/pytlTg+qviDVU7bROD3FzwyATbnlBDBledQjl29?=
 =?us-ascii?Q?HNAQqJJMb1/jayi/boWuZWjF8uWPsmdoWkZCyrkJj4DUPvVNP2I9Rr5yWIE6?=
 =?us-ascii?Q?zriW0W2r2QhgJncuSgnk0ojrIQ6GF1cM9gl6sG8Wnum2VVYvuEmbB9gh0qUW?=
 =?us-ascii?Q?PKGi6UBfMyuvCx2tixUKS0Z5SaLp4/3+lOK2QiXaBLCVJiQ0ap1eSAz3+e1s?=
 =?us-ascii?Q?gQ5ldnhwtlPzTGTjka0saREgJ2XVg/2TRZJLZ0S1Bv3atQDhpQ4od3CABfXM?=
 =?us-ascii?Q?2YX/McrV/VeCDI0m9EFz1joqcB2M+dbKSCzwfuhypDg4/voXX2MVVWNeZZCa?=
 =?us-ascii?Q?grq7ilVFfQunqiwVH4+Te7Wy1yqhcsvZ00uC9WVjKsHQsZb3pMH3VjoNFU2z?=
 =?us-ascii?Q?PKp4DTVxfNmUpDaC21QFKdnoNPaWjdbnHqmzWcQkiYTseu5o+RyTxihF7Kty?=
 =?us-ascii?Q?ULLUxnPUNoKASzbKABgLiOw6qDePmKfhm3Q3wt16PbRklxOzyGuWglguEhZs?=
 =?us-ascii?Q?VN3EqHKF8CGgDqtFuFA5+PFiJYu15ukqFmkEXG2T9+HOCtvcsNDqgZrxMEvs?=
 =?us-ascii?Q?1IlWl0snGdM6h9Jc4wednxuxxTlugKj3p7SQD+obnIp7+4Ix7AZXAm6AEBDs?=
 =?us-ascii?Q?eNKXfRDBiqOUPFj8kTtQNWZW619dWZAXzR/UM4JmJCBGXhdliNupyJSm9QyO?=
 =?us-ascii?Q?4mar1nkG766h7kasW4wHQoLhZwSsNum8Njs1COlD8jzlWJUD5gqUMAbxAqbC?=
 =?us-ascii?Q?iftf5OLZbe7DXlGbRnqLoaO1hF8939cAFgYW1HcmqINk9VkR4AlpX3yHqAAT?=
 =?us-ascii?Q?8O1tNlq08xBkVMC0nOVDbgPgFwmS17T8X64jq7VDNpGI+SYj76HV/WAJQXlh?=
 =?us-ascii?Q?fZC05jlIfR0a5AHAUXCisQ9rc+CjcopRxm9zXTFGulS5zmXF0MSdoaikCKsf?=
 =?us-ascii?Q?2Fxg+XGGcmEPQJRf0Yl4d4x/3qpyMNYR4tFooFaGtc7O+mpFrXACz1MlEJzr?=
 =?us-ascii?Q?Fa3JS3YFakHRVIkPVZTyP8KBQk7/HIvEcr/xxp0VDHp2blPu3eR7LrdkbKxg?=
 =?us-ascii?Q?Z1ac8iBmy/zvBrwmTsruv4imAIDDLBP5yTICODiGqcsH9+95kvOHcIoVmvJd?=
 =?us-ascii?Q?Mqa2TdPZYsi40gqwUDg61DrHCOz5MnJc2wowYo2bVlHuFqup4WHzm9MmMp3v?=
 =?us-ascii?Q?+rGGa+7rsj3bQXmvgxW5Sl/a9r2HQdzMFGc1EbXeVGgqqF5ojg2VqjCVJKLI?=
 =?us-ascii?Q?BjMUUTc6LRph7GkmHa+zSnQ5MkLuuGNdcY7A0copars3kXBENcfUSA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6l5YPGzBKFuw1v2PJZmrjKIOVe3UPhVx45Jx5tGWKQSamJ4H2p+HNRTwxzF5?=
 =?us-ascii?Q?2sGE4JOmpIpg8WUZkRPVEMXM6Thqy0HFs+Nfd7mYmRq9+Cnx8ZDwMSuhLLgq?=
 =?us-ascii?Q?m+SMbYPiNP/5kVcsB2SJvtGZTrhhlauVPzNZxPXpKgDIDB06f0HR9l2CUI54?=
 =?us-ascii?Q?fV9o6xAQ2um1v+NeBiYDYDxXZwQ6C7TAYCrIRCwQ41rcqGs/ZJYM9A7/Ksli?=
 =?us-ascii?Q?GMB/mPN06cqeC5ddpoH9tyrWUJgFk/TRf1z//Kc9yBrz6lRWMPgEHoR+kyGj?=
 =?us-ascii?Q?um0/yVy2NvuR6VeMI/uak2dAEwLhjoNZuqXXTRBwHbx/aSyF1rRBk92ZkTSl?=
 =?us-ascii?Q?/88MyeF4jbzckI8qffrsobn4INgA9xOzdxzLWEmJgQIAo5HXZ3sXsPJjyhpM?=
 =?us-ascii?Q?q3JHEAnDn7G5vOkE9Vr2WRqBPxVfOp6WQ1a6h5DUhkJDOF+ZgEibwL3I6Ki+?=
 =?us-ascii?Q?AuwQOrbNDWbCV9OTuerNxNevqBr016YYDX0BzK5252TVZA7DtdM77IsbEQSx?=
 =?us-ascii?Q?ECWpuq0QyGcFSixU2EsCC7/ZiriZ3aszvJktzfuiL7i3Cw0Bs/dr9hbIvo6g?=
 =?us-ascii?Q?7csEQx/swbE9RtyjxKdmgSEmPWpxcwCuIsjpHxy5EnQSIJdKLeNlbKCryG7S?=
 =?us-ascii?Q?LUUMwA/EaJruHk7aJC4jHsyLRkWR2nRNeMUcYVM8AiEjgjXbA+oT/6fMHGAM?=
 =?us-ascii?Q?GT87tM/qlSEDErbARIx1+lRtpP7XDS8S/AF4LKD/kIfkgtHiRMIjyV3liu4V?=
 =?us-ascii?Q?qpNcsOk0D6DSzzfNu86mgRq+Ru0Zhjx2kWcXskhEHmH22DCiknCQQSb1cAox?=
 =?us-ascii?Q?594v4WAmyiGCp+vwDbZiRjRaah7vmLiRieM/lHnM4nZDId5ul5w+rs2/4r+Z?=
 =?us-ascii?Q?VCa27+E8ymrXS13glXnkLCELTFAhRep2U+dTjg+dH0J8b4112XfgPUyAjILE?=
 =?us-ascii?Q?L895KuSjogXKdPUho8Od3Nmpl0muGWR/Ou2rDvEQWLDftg4PR7/4u39T1ueb?=
 =?us-ascii?Q?jQR/MWVd4WAXztXKo2uUFzmZ/rY68kqZ54EryjDjT3o7GYLI70d/kJIi9c7Y?=
 =?us-ascii?Q?DdQ2+X7XMWXngHIF/UqAxPp5IpYy0np8dU4WWKdm1DIXW8XpS6LEOLEgN3O0?=
 =?us-ascii?Q?IUkU4vP10KeEJ46O95Jg+4fHa6x8O3WFO0XXgB6naNjc+drQexB+74nUVzwN?=
 =?us-ascii?Q?czDl2YK+Iu67U8jBcNYHddH/Yjw+N6+QckihDvdjhofpuaZdAQa/2dYymvDD?=
 =?us-ascii?Q?3ujhOSEVR2t8ouRBfXBAIH3872LdA9yW/vAZ3fAc8yveitdE0f2XFP+kh7DR?=
 =?us-ascii?Q?jniKise0Jbk3dlELEqCKqNC/mV0yV4ljbgTX6iq2xk9wTTig2r0L7dhoaXud?=
 =?us-ascii?Q?hD915IYLHOGmzf43nxLFRyMZQV9QmXJ41cZTEUVTxnpBNqyhhPkhmLCL5nnp?=
 =?us-ascii?Q?k5EZbkxErbkgES4z0WSYNQYAB4o4ddKecB2OienK/o7UnkqDzG7wgnXYIpyF?=
 =?us-ascii?Q?oKrlldmLigd5rlg/kokxd52c0mUtXocN7s2Za5dJ20zozAqOszm5iMafRjwm?=
 =?us-ascii?Q?3L/Y5+cPt5rKp0ZOHskcgGP3WvJYRlyjLwS0IRQh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79689685-d8c5-41ce-65aa-08dd90f90f74
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 02:02:33.9481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Op/FkjjqeR4NLRuMmcpn+zEY6DFjJDXUdXm6xeh1RSoKSsdPuUvddH339aVv9oM8u0zVkemsbyOFlQkKFXGhJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9229

From: Ming Qian <ming.qian@oss.nxp.com>

For format H264 and HEVC, the firmware can report the parsed profile idc
and level idc to driver, these information may be useful.
Implement the H264 and HEVC profile and level control to report them.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v4
- Fix a building warning reported by kernel test robot

v3
- Check H264 Constrained Baseline Profile
- Check H264 Level 1b
- Remove support for V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH
- Remove support for V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH

v2
- Add support for V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE
---
 drivers/media/platform/amphion/vdec.c        |  59 +++++++++
 drivers/media/platform/amphion/vpu_defs.h    |  12 ++
 drivers/media/platform/amphion/vpu_helpers.c | 123 +++++++++++++++++++
 drivers/media/platform/amphion/vpu_helpers.h |   7 ++
 drivers/media/platform/amphion/vpu_malone.c  |   5 +-
 5 files changed, 205 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index 85d518823159..55067d9405c2 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -232,6 +232,35 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
 			  0, 1, 1, 0);
 
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
+			       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			       V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
+			       ~((1 << V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)),
+			       V4L2_MPEG_VIDEO_H264_PROFILE_MAIN);
+
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
+			       V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+			       V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
+			       0,
+			       V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
+
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
+			       V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+			       ~((1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				 (1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10)),
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN);
+
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
+			       V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+			       V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
+			       0,
+			       V4L2_MPEG_VIDEO_HEVC_LEVEL_4);
+
 	ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
 				 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 2);
 	if (ctrl)
@@ -1166,6 +1195,35 @@ static void vdec_clear_slots(struct vpu_inst *inst)
 	}
 }
 
+static void vdec_update_v4l2_ctrl(struct vpu_inst *inst, u32 id, u32 val)
+{
+	struct v4l2_ctrl *ctrl = v4l2_ctrl_find(&inst->ctrl_handler, id);
+
+	if (ctrl)
+		v4l2_ctrl_s_ctrl(ctrl, val);
+}
+
+static void vdec_update_v4l2_profile_level(struct vpu_inst *inst, struct vpu_dec_codec_info *hdr)
+{
+	switch (inst->out_format.pixfmt) {
+	case V4L2_PIX_FMT_H264:
+	case V4L2_PIX_FMT_H264_MVC:
+		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+				      vpu_get_h264_v4l2_profile(hdr));
+		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+				      vpu_get_h264_v4l2_level(hdr));
+		break;
+	case V4L2_PIX_FMT_HEVC:
+		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+				      vpu_get_hevc_v4l2_profile(hdr));
+		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+				      vpu_get_hevc_v4l2_level(hdr));
+		break;
+	default:
+		return;
+	}
+}
+
 static void vdec_event_seq_hdr(struct vpu_inst *inst, struct vpu_dec_codec_info *hdr)
 {
 	struct vdec_t *vdec = inst->priv;
@@ -1189,6 +1247,7 @@ static void vdec_event_seq_hdr(struct vpu_inst *inst, struct vpu_dec_codec_info
 	vdec_init_crop(inst);
 	vdec_init_mbi(inst);
 	vdec_init_dcp(inst);
+	vdec_update_v4l2_profile_level(inst, hdr);
 	if (!vdec->seq_hdr_found) {
 		vdec->seq_tag = vdec->codec_info.tag;
 		if (vdec->is_source_changed) {
diff --git a/drivers/media/platform/amphion/vpu_defs.h b/drivers/media/platform/amphion/vpu_defs.h
index 428d988cf2f7..f56245ae2205 100644
--- a/drivers/media/platform/amphion/vpu_defs.h
+++ b/drivers/media/platform/amphion/vpu_defs.h
@@ -134,6 +134,7 @@ struct vpu_dec_codec_info {
 	u32 decoded_height;
 	struct v4l2_fract frame_rate;
 	u32 dsp_asp_ratio;
+	u32 profile_idc;
 	u32 level_idc;
 	u32 bit_depth_luma;
 	u32 bit_depth_chroma;
@@ -147,6 +148,17 @@ struct vpu_dec_codec_info {
 	u32 mbi_size;
 	u32 dcp_size;
 	u32 stride;
+	union {
+		struct {
+			u32 constraint_set5_flag : 1;
+			u32 constraint_set4_flag : 1;
+			u32 constraint_set3_flag : 1;
+			u32 constraint_set2_flag : 1;
+			u32 constraint_set1_flag : 1;
+			u32 constraint_set0_flag : 1;
+		};
+		u32 constraint_set_flags;
+	};
 };
 
 struct vpu_dec_pic_info {
diff --git a/drivers/media/platform/amphion/vpu_helpers.c b/drivers/media/platform/amphion/vpu_helpers.c
index d12310af9ebc..886d5632388e 100644
--- a/drivers/media/platform/amphion/vpu_helpers.c
+++ b/drivers/media/platform/amphion/vpu_helpers.c
@@ -509,3 +509,126 @@ const char *vpu_codec_state_name(enum vpu_codec_state state)
 	}
 	return "<unknown>";
 }
+
+struct codec_id_mapping {
+	u32 id;
+	u32 v4l2_id;
+};
+
+static struct codec_id_mapping h264_profiles[] = {
+	{66,  V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE},
+	{77,  V4L2_MPEG_VIDEO_H264_PROFILE_MAIN},
+	{88,  V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED},
+	{100, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH}
+};
+
+static struct codec_id_mapping h264_levels[] = {
+	{10,  V4L2_MPEG_VIDEO_H264_LEVEL_1_0},
+	{9,   V4L2_MPEG_VIDEO_H264_LEVEL_1B},
+	{11,  V4L2_MPEG_VIDEO_H264_LEVEL_1_1},
+	{12,  V4L2_MPEG_VIDEO_H264_LEVEL_1_2},
+	{13,  V4L2_MPEG_VIDEO_H264_LEVEL_1_3},
+	{20,  V4L2_MPEG_VIDEO_H264_LEVEL_2_0},
+	{21,  V4L2_MPEG_VIDEO_H264_LEVEL_2_1},
+	{22,  V4L2_MPEG_VIDEO_H264_LEVEL_2_2},
+	{30,  V4L2_MPEG_VIDEO_H264_LEVEL_3_0},
+	{31,  V4L2_MPEG_VIDEO_H264_LEVEL_3_1},
+	{32,  V4L2_MPEG_VIDEO_H264_LEVEL_3_2},
+	{40,  V4L2_MPEG_VIDEO_H264_LEVEL_4_0},
+	{41,  V4L2_MPEG_VIDEO_H264_LEVEL_4_1},
+	{42,  V4L2_MPEG_VIDEO_H264_LEVEL_4_2},
+	{50,  V4L2_MPEG_VIDEO_H264_LEVEL_5_0},
+	{51,  V4L2_MPEG_VIDEO_H264_LEVEL_5_1},
+	{52,  V4L2_MPEG_VIDEO_H264_LEVEL_5_2},
+	{60,  V4L2_MPEG_VIDEO_H264_LEVEL_6_0},
+	{61,  V4L2_MPEG_VIDEO_H264_LEVEL_6_1},
+	{62,  V4L2_MPEG_VIDEO_H264_LEVEL_6_2}
+};
+
+static struct codec_id_mapping hevc_profiles[] = {
+	{1,   V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN},
+	{2,   V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10}
+};
+
+static struct codec_id_mapping hevc_levels[] = {
+	{30,  V4L2_MPEG_VIDEO_HEVC_LEVEL_1},
+	{60,  V4L2_MPEG_VIDEO_HEVC_LEVEL_2},
+	{63,  V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1},
+	{90,  V4L2_MPEG_VIDEO_HEVC_LEVEL_3},
+	{93,  V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1},
+	{120, V4L2_MPEG_VIDEO_HEVC_LEVEL_4},
+	{123, V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1},
+	{150, V4L2_MPEG_VIDEO_HEVC_LEVEL_5},
+	{153, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1},
+	{156, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2},
+	{180, V4L2_MPEG_VIDEO_HEVC_LEVEL_6},
+	{183, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1},
+	{186, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2}
+};
+
+static u32 vpu_find_v4l2_id(u32 id, struct codec_id_mapping *array, u32 array_sz)
+{
+	u32 i;
+
+	if (!array || !array_sz)
+		return 0;
+
+	for (i = 0; i < array_sz; i++) {
+		if (id == array[i].id)
+			return array[i].v4l2_id;
+	}
+
+	return 0;
+}
+
+u32 vpu_get_h264_v4l2_profile(struct vpu_dec_codec_info *hdr)
+{
+	if (!hdr)
+		return 0;
+
+	/*
+	 * In H.264 Document section A.2.1.1 Constrained Baseline profile
+	 * Conformance of a bitstream to the Constrained Baseline profile is indicated by
+	 * profile_idc being equal to 66 with constraint_set1_flag being equal to 1.
+	 */
+	if (hdr->profile_idc == 66 && hdr->constraint_set1_flag)
+		return V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE;
+
+	return vpu_find_v4l2_id(hdr->profile_idc, h264_profiles, ARRAY_SIZE(h264_profiles));
+}
+
+u32 vpu_get_h264_v4l2_level(struct vpu_dec_codec_info *hdr)
+{
+	if (!hdr)
+		return 0;
+
+	/*
+	 * In H.264 Document section 7.4.2.1.1 Sequence parameter set data semantics
+	 * If profile_idc is equal to 66, 77, or 88 and level_idc is equal to 11,
+	 * constraint_set3_flag equal to 1 indicates that the coded video sequence
+	 * obeys all constraints specified in Annex A for level 1b
+	 * and constraint_set3_flag equal to 0 indicates that the coded video sequence
+	 * obeys all constraints specified in Annex A for level 1.1.
+	 */
+	if (hdr->level_idc == 11 && hdr->constraint_set3_flag &&
+	    (hdr->profile_idc == 66 || hdr->profile_idc == 77 || hdr->profile_idc == 88))
+		return V4L2_MPEG_VIDEO_H264_LEVEL_1B;
+
+	return vpu_find_v4l2_id(hdr->level_idc, h264_levels, ARRAY_SIZE(h264_levels));
+}
+
+u32 vpu_get_hevc_v4l2_profile(struct vpu_dec_codec_info *hdr)
+{
+	if (!hdr)
+		return 0;
+
+	return vpu_find_v4l2_id(hdr->profile_idc, hevc_profiles, ARRAY_SIZE(hevc_profiles));
+}
+
+u32 vpu_get_hevc_v4l2_level(struct vpu_dec_codec_info *hdr)
+{
+	if (!hdr)
+		return 0;
+
+	return vpu_find_v4l2_id(hdr->level_idc, hevc_levels, ARRAY_SIZE(hevc_levels));
+}
diff --git a/drivers/media/platform/amphion/vpu_helpers.h b/drivers/media/platform/amphion/vpu_helpers.h
index 0eaddb07190d..6c0554ccf3b3 100644
--- a/drivers/media/platform/amphion/vpu_helpers.h
+++ b/drivers/media/platform/amphion/vpu_helpers.h
@@ -6,6 +6,8 @@
 #ifndef _AMPHION_VPU_HELPERS_H
 #define _AMPHION_VPU_HELPERS_H
 
+#include "vpu_defs.h"
+
 struct vpu_pair {
 	u32 src;
 	u32 dst;
@@ -70,4 +72,9 @@ int vpu_color_get_default(u32 primaries, u32 *ptransfers, u32 *pmatrix, u32 *pfu
 
 int vpu_find_dst_by_src(struct vpu_pair *pairs, u32 cnt, u32 src);
 int vpu_find_src_by_dst(struct vpu_pair *pairs, u32 cnt, u32 dst);
+
+u32 vpu_get_h264_v4l2_profile(struct vpu_dec_codec_info *hdr);
+u32 vpu_get_h264_v4l2_level(struct vpu_dec_codec_info *hdr);
+u32 vpu_get_hevc_v4l2_profile(struct vpu_dec_codec_info *hdr);
+u32 vpu_get_hevc_v4l2_level(struct vpu_dec_codec_info *hdr);
 #endif
diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index feca7d4220ed..ba688566dffd 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -908,7 +908,8 @@ static void vpu_malone_unpack_seq_hdr(struct vpu_rpc_event *pkt,
 	info->frame_rate.numerator = 1000;
 	info->frame_rate.denominator = pkt->data[8];
 	info->dsp_asp_ratio = pkt->data[9];
-	info->level_idc = pkt->data[10];
+	info->profile_idc = (pkt->data[10] >> 8) & 0xff;
+	info->level_idc = pkt->data[10] & 0xff;
 	info->bit_depth_luma = pkt->data[13];
 	info->bit_depth_chroma = pkt->data[14];
 	info->chroma_fmt = pkt->data[15];
@@ -925,6 +926,8 @@ static void vpu_malone_unpack_seq_hdr(struct vpu_rpc_event *pkt,
 		info->pixfmt = V4L2_PIX_FMT_NV12M_10BE_8L128;
 	else
 		info->pixfmt = V4L2_PIX_FMT_NV12M_8L128;
+	if (pkt->hdr.num > 28)
+		info->constraint_set_flags = pkt->data[28];
 	if (info->frame_rate.numerator && info->frame_rate.denominator) {
 		unsigned long n, d;
 

base-commit: b64b134942c8cf4801ea288b3fd38b509aedec21
-- 
2.43.0-rc1


