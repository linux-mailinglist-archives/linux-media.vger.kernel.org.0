Return-Path: <linux-media+bounces-20549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A84489B59E4
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 03:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10963B22B3B
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 02:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD00D531;
	Wed, 30 Oct 2024 02:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="utRL81S/"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013051.outbound.protection.outlook.com [52.101.67.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CE7199E9B;
	Wed, 30 Oct 2024 02:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730254947; cv=fail; b=pUSFvbtZ9W4A0sja4eG2XY8Lyz0b077/EVyCD4aKC2utry/5uaEEWNZ+gMtxSlM/o4fPq0opU7pYpSRqJNtnnVQ1Gdo9M70nFD76Sf/SsnqdMfG7zyCd3xirYJP2IW9mIx3iavablp/tKE3x+EtZI98L5ouxXPGCd35CNiXdXNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730254947; c=relaxed/simple;
	bh=V9uQS5qYmiXssOXx3/jo+h9bUk3tmEJA4+u5KYczP+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ez+Sa3izy2TAtU4zGrL+4iqoBPFEYPVmMG06JqmhKcZ67U+HoPUR1JvpdSJJYNVom2Q/IjP4UaLt+wQuzIWQS0f0vriy933TQcbkMF+0lMGbbFINvuuVZ6M7xc0xhzPGEF8ajrA1dBLPTfKCwq3jOIXnoNxAMRvFmwUsAD4/xPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=utRL81S/; arc=fail smtp.client-ip=52.101.67.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSQssZqXqbI0qDOyM8uzpTIi0iMbHxFYzdwWUug2S5keewRsfPablThDV9AfzOpkhYDu/qc86Lb8JpdYd9Zpo+gZWH8UFSUCHrz8ERH9l0SigoyR7vgSK6KmHQunOzB06Hq6ow5vRiQSW5bPkAFNxauQTjhShXzy6zfWfaVfk46IqTqpLVMq2hkfBIYBCxMhQPsW8xxvBrQWGA3qbX3v+OQud2zvzVqt98NdmJ4xGr39xMezQeVgMbEs55R8K248IF53T0NyejT7E8InZAl/m/2zxzMc36HsTu+GaS8FyDKZexdh5f1OAXSjMYwPRjrvV6PPsbaJaMfMD/ApOmIwjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3oKuxRFkA9yHb1hrfi99zYa7fO58IZs40h8sxAWj0U=;
 b=NWPrOAzOoBLZVMXcb4KOkGMSTqXs99TYjBV9xXaBE6e6RjBIqDvboJKKPRAUosils/cagfiTIigVRenGCElqv8gjcE3+R/8Kk6SobM1n3kltyZ8YAnHt/Zt8Rn5QO7tgrk+H+Nwsx4v0/mJIjWxxI0G6LQgdqanzFTbXcpLWy1PWv4958fAWczfVwMk/rPKBm8/UVxkOsDcFjE9Y78AXxIly9aJYf7PJQigciGReCckpdh9XveofIBaKA6dktBhVPrYlkXgRIoaCEsaSx0xe8pVIrGxMvxYgOmyiGMDbqHXkdjg0ycIeTwJ5cmD7fDvQnR/KWX2O6SxoU7SqqhukdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3oKuxRFkA9yHb1hrfi99zYa7fO58IZs40h8sxAWj0U=;
 b=utRL81S/CDciQlwdCk0JpR+BsYHUd+GtXi7PjFIStnJPxnxMIeVgYM7plDEjh7r0M4GeYjocXe87OjDrHeZrBc0AFWupOxaXUmZlgqvOzALCgk1GoVISlNiWgCWSL9DtLhf5lB9Rz54Z4P0KPGw/kUCcW12Y4T1q2VYwkhYoACtmBxXcSaBVic/b6IKdemfkIYZYnhevhci24Gje0098KEqY3/Oli9hi2kscJWUpnrjKLDc0YJJ9XiZdhD4UxKkRMh7MC/7u1+IkIbJzf1YIeztiCVjpaUrrn44Srs8X2+xo/r8ua4pWiVSBmcEq25XXcvB1Jj7VPlN2zPnByOI8aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB8705.eurprd04.prod.outlook.com (2603:10a6:20b:428::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 02:22:21 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 02:22:21 +0000
From: ming.qian@oss.nxp.com
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
	ming.qian@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC v4 3/4] media: vivid: Add an rectangle control
Date: Wed, 30 Oct 2024 11:21:33 +0900
Message-ID: <20241030022134.1098589-4-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241030022134.1098589-1-ming.qian@oss.nxp.com>
References: <20241030022134.1098589-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::6) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b259d3-a7c4-4326-73ad-08dcf889af52
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DnE7m6fKGAvxhC1Cd2dDosy3qwvuef1CJi4CpgIYgzlJf25I4SLLAW7U+TFZ?=
 =?us-ascii?Q?zhl1DtxJJLuRtDNGEtWjZvEcG+sdlM6vqU1pCX3Utx5dO50Cg9/pzxAdHyWb?=
 =?us-ascii?Q?A6GtRwxh9rhfFSJz/aWCgB1pvlxGV4VNuX+NGNRhCmoqC94fwFugJN7tmA8B?=
 =?us-ascii?Q?dBkgxAysqICFPT/1+SorrFl1GQEcih5Sik5yB5PIuTzUmuvJ1hrhJ+yTLNwd?=
 =?us-ascii?Q?Y+bi37Ps609BK6k5Jfv1H2xj3FZsXNT5poLNoKlT0W5fjFEPrybf2wQ5i5VX?=
 =?us-ascii?Q?Y2eHFaCakAw8tlMlStnfhmsfYlWJ2Pki/xJzMGImkbBZZcuhEy/OMYnLPTAN?=
 =?us-ascii?Q?91Gc/VhsRP33y9D0jb5GvUkR+TTXe/t6qOm0PHvfQIk8zy8+SxEtzKtkjaAA?=
 =?us-ascii?Q?/kwCklnkP5pWVlFuIScCrq0Mz4mPfKxnDzdJff6bgZ9TiShFKAq/aY094f9+?=
 =?us-ascii?Q?OnAYvM3fwa6rAQMDOTdp/CCDkicII55KDukMW4Tnxcll/MRvFvT9nKdPSEHT?=
 =?us-ascii?Q?44tauaMKVU22PIK7GGeOvd+TsSnLz5YAn9XvGmVbiVXFXvJHx2m1DJ7/d6+T?=
 =?us-ascii?Q?gtATCqZbk9E28WI3BOlgNTWY9VMnOAM92pOVMudi9eoejUa8mxkH5fWLlAEs?=
 =?us-ascii?Q?6IMzTHxi07C72+KiOVOUxANX9pgUR102/ePpxigek4kOwcloMssbhsIum/12?=
 =?us-ascii?Q?Dv0ea6cnSCvq330KsEUXi5z8n/nYoBddGx3U5Y8xOq8RYS4fWFGeyQ8/06uF?=
 =?us-ascii?Q?JicAj3XVPcwx80Difojmy61gkCknFWoNnrja9GniUGn+3SA/FIQd7JIUMzHH?=
 =?us-ascii?Q?deFpaMq2hLtz3vPoCTLSwKEDgeSYgFNhXjvMZ2Nh4byZ0/6pugdRa/CvSRyC?=
 =?us-ascii?Q?CUG7+9rmHVex/wB1pYLMAACDP6+0fCL+IF7DNv5UxShXsGLrqkTDWb09Tao+?=
 =?us-ascii?Q?TOBaHLctjY/yFXu36SEUTDpfrOEb4JBNgvqHF2crF6XCF6Wgw4kHjhsJSOmf?=
 =?us-ascii?Q?LgdSuAxk6ntSc3iLtB0c8qbQviyRIxTaVs5lktEhzBX5c7PEgdqykWcwCcz9?=
 =?us-ascii?Q?U1B++BqtoC5al6YvylKF3LoJWA7MzDyWY/ev4kP+fBX8Ox5E/uFGcNfFz3DC?=
 =?us-ascii?Q?BmO1ZB3G3722sh1FTbilNfd0BQo9DfECeUpo01ej7XrjNRi5CylPHQqKJMgg?=
 =?us-ascii?Q?fUAmZHAZtf4xNdw1LGtoJrhwxGEXXuFHInPnpeRSNLndkKTqhOL7GrPxSt56?=
 =?us-ascii?Q?cG8uCV2pB9W8OEe5KCOpntNnEeSgDYy2n0jIDao30kPM12Ia93wqgJciJzWL?=
 =?us-ascii?Q?K+mKuZJHn0t0HWLemB+yTGinc8FyrnelnErnGMYp+IBYgYrzbFnabS/G372K?=
 =?us-ascii?Q?CHR0pC4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pC3LessNBM22pYsIS0Kz+wFbkhIh3nX07yACUtuvNKPnwzwlAezpn6T2OEgk?=
 =?us-ascii?Q?+VtnzII4BY9J5usp50qM1VqcpfdlqPLMjiqVbVMLjf5OotqLPXV54ObrYchz?=
 =?us-ascii?Q?Sh+pVd5NRq7Mkuu7VN1mTy/te73NYEZEoYXS4cB81t7Q3VcQL54OOlgLAYhn?=
 =?us-ascii?Q?Js++QOeQz8ljFuh8+iOaO5ai5E8RqAKDW7RDS2Fr0aToZQapY1CgKMqYp5Qy?=
 =?us-ascii?Q?j20OFPX95ybvRVJdgfdNdvNZFcqbADBKBUdcSmhTyrjiHEMBcbKnIPQIpcwu?=
 =?us-ascii?Q?FE093BQm5JuFVQRW3GnsFqDMzqlP9i796qLVotsZ7X9c5Gz0Hwmj6GNi9/L/?=
 =?us-ascii?Q?fHdYRiRqWjl4ctZ+rmWoMDxHssrGn9PcY0oQ9aDSNPYOqtOe7m5GIblGND+o?=
 =?us-ascii?Q?3uY4ev1yjG+Zg7DDf6C1ptE7JCGkubtJxxnmKV2GpQWfEhIPeGUTa2M9tQh1?=
 =?us-ascii?Q?+SHj+rKQZzsnaS9E+vrzVlLysfKKHnj/ANwXaBOzoVM/NAmPOuO9k06oQ43K?=
 =?us-ascii?Q?2L5B3bPlFJT5TDG7KRU90Sys+SA7izebzVez4WXb78eDD2LsXpynHfoxSh1X?=
 =?us-ascii?Q?mYt6xpGopetKm2qKYBwsFPPdrxpSgJg5Cmn0GyUF5pLRfLIA+QSUsqgm0DlK?=
 =?us-ascii?Q?VTDed1XIQVs2TN0omc6ldtEzDHG/0owksLPuk6XvrUPndVGEbqCTjAA+qv9a?=
 =?us-ascii?Q?Yklv2L+IC0gGXpUhxVjdrfLx2/+OGXAyFK1Sp5XKI+b1bKe5cis6RKzLByiX?=
 =?us-ascii?Q?g6GI+RxhjpLJMOtOELsEqIPJ5k7vAM1lJGF7x7FwEK2WV2ZI0zGbpz0TwIqF?=
 =?us-ascii?Q?6RaqnjNzjma66sGSwa8y60rPdSM/02WYmchNxmX8pEZaG1S3807illYzLbAJ?=
 =?us-ascii?Q?EHGzisyLXVvwQ4FPeMxBOgDveXiSHKHlluwo3VSQ0cmK1ssxZjzZ27TEqG0q?=
 =?us-ascii?Q?cNSqAl1Q+6FV1vrrKqBdX3mzQJbwJfHyHhdk47VXXeY9/E888wrb8CvqMZ2K?=
 =?us-ascii?Q?xn2/5Iy6Kt6FeQVwNZ4rJzHXczFkOGpeqBpPfqAP9SVN4LeKhADEkVSwOC/l?=
 =?us-ascii?Q?xiEmjMy/0FVZrLgqDmTCo6nlS9bGzCcH71Edg0ksj+UIMySosechpgbno7EY?=
 =?us-ascii?Q?SPMqCoPqSCjycY6jezO2ZWYv9l+cCYur+DQABvv46cw16+B1hJJa9LJ0uAYs?=
 =?us-ascii?Q?8adj+OcuIF/MXMds8YFsQG4cu4H26oNyLRR1YCfk3h1FQrWSfbGMWBRqUiR/?=
 =?us-ascii?Q?Fy48n6853wEsN2dsfVOADQfJwJzBBMkNvPItoP6+mJl0gphnksSe230c7siJ?=
 =?us-ascii?Q?P18UiKBxjzw3sNzMO4jZzzDZK5/ELktre4phEGl6Y2kwaYMc+OIFqUNR8+bY?=
 =?us-ascii?Q?AeMNRswV7rlUnjo7t01DijPlaMM+u0uCuIfZuwH40QM9VvBSK9Y8OXVrkD2L?=
 =?us-ascii?Q?EgusvFrjSTGyYDzlaszPrr73/WLInCpA975AqoFXNDlJZVnsQAGjn6Za9fzz?=
 =?us-ascii?Q?Jx4rc5JIIVw/gBLntOvLYD8VNPY73w7RG8iXyS6MG4MGm+dUCKfYOMWmBDcf?=
 =?us-ascii?Q?nbcHYlH7KBjvWeCX1R32JiKE/OJ4gvdTfAHWotew?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b259d3-a7c4-4326-73ad-08dcf889af52
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 02:22:21.6994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rl3atW0zDSEgAuFrzTYG5gMMAqckHmx3wCvNqEDfHI8MXPKKeG3PyLroaclVrNS0z4uNl8HYPz00AeJiFz/10w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8705

From: Yunke Cao <yunkec@google.com>

This control represents a generic read/write rectangle.
It supports V4L2_CTRL_WHICH_MIN/MAX_VAL.

Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/test-drivers/vivid/vivid-ctrls.c    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 8bb38bc7b8cc..bed5f4fb0c69 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -37,6 +37,7 @@
 #define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
 #define VIVID_CID_S32_ARRAY		(VIVID_CID_CUSTOM_BASE + 15)
 #define VIVID_CID_S64_ARRAY		(VIVID_CID_CUSTOM_BASE + 16)
+#define VIVID_CID_RECT			(VIVID_CID_CUSTOM_BASE + 17)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -360,6 +361,38 @@ static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
 	.step = 1,
 };
 
+static const struct v4l2_rect rect_def = {
+	.top = 100,
+	.left = 200,
+	.width = 300,
+	.height = 400,
+};
+
+static const struct v4l2_rect rect_min = {
+	.top = 0,
+	.left = 0,
+	.width = 1,
+	.height = 1,
+};
+
+static const struct v4l2_rect rect_max = {
+	.top = 0,
+	.left = 0,
+	.width = 1000,
+	.height = 2000,
+};
+
+static const struct v4l2_ctrl_config vivid_ctrl_rect = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_RECT,
+	.name = "Rect",
+	.type = V4L2_CTRL_TYPE_RECT,
+	.flags = V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX,
+	.p_def.p_const = &rect_def,
+	.p_min.p_const = &rect_min,
+	.p_max.p_const = &rect_max,
+};
+
 /* Framebuffer Controls */
 
 static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -1685,6 +1718,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
 	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_rect, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
-- 
2.43.0-rc1


