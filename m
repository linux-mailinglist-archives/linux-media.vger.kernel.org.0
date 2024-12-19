Return-Path: <linux-media+bounces-23756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 748BE9F725D
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 03:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 943191895AA8
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 01:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A3F1A23AC;
	Thu, 19 Dec 2024 01:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bLPFv7W/"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2061.outbound.protection.outlook.com [40.107.247.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BC41A0BE0;
	Thu, 19 Dec 2024 01:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734573140; cv=fail; b=jG7WNSiHhhNeSBr4AQJngFp/gqaWNQ5sB/1FiPxdFqBvSp9kQOT4snIvpOLSgaHkXDJK3iCGiYOIA08NG70jo6IZOSo5O8GJZcO+ZabB31XUNbKIMlaY6iJsIk3iTzfe3iSjh6RHm53S9CEN05MIKtH2zOHNfUeYIv9fGQOvgKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734573140; c=relaxed/simple;
	bh=jFYk1bkFyEOxgBpENF5cGYonSsciv2XWr7+bcB/Tbi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iNf55jNTQHN8qmS8PKWmxWLVZGkHaFKGHzHQjAhwrcVgvNpcBv4EQUw+B7EOAv4T/tDW950qHyLrwb1HmK0WtV+R4To7aRzl4dEbkijPoaRG7MK0WlrmFU2AC4rSJl0Hb9lVmSIOEEA5GmM0XuM0NEYYIfAIPkHOfmuqmOyC8xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bLPFv7W/; arc=fail smtp.client-ip=40.107.247.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSHlt0sxWT4lneYJi+F9JyCF6paHduf4h2X5T8MqTkzUb0oCP6vvKnV6Dj9dr3MjS7KHo7NrFXL4OMs97C8IvjxmWDHVdTyzAyaM+enEOJV+8JB4KtUFyCeUKeKcqdl4T70mpd2ftmnWEOMk8sH2nlmObFo2FR4f1kpVesuSJT4FMT+Tn4t1OOthkawnMHoyceObKLLH/Jh0e8X5YvJzQwexYk0uIyyVNQ0FCTKlQg6V1+B3WmrlQysFFVZDePxSEkVEsgb+sqK64D+ZlrNfArJ1A/tFr0KTV+Ny25VejGmSeRf4QDBYyx2njoGY3BRJDOMWxlKIC57cgN5wzWDWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4GTpso0mlsozeK4RcyvaU+aLxbFdGzPqeTRGi+FuCQ=;
 b=JNIzfRtTnXpmusFfRPABJNsJbpZX4yX6nw7mhx1TTDi6yvoFw4S8XZA3NNmXNgcVEIh4N47TVQLDGnzIILiQIdxkrRf8zWyayCOWxLM1mE4sfmmDOqTzNKLeaoSErBX9QURC3eKunYRhYvCi1CrVxdJmVcEr1b7PcNEoIHyipHGv5HuhlRHr1l7aLScY3Y+FAQFd2f49M7n95CUZrOyh70K01FwgPCfoeKRIUTzCbpyrTuldE1cb9bpRyY80tKD3HR8hQc30tJLKy8GUIhkOdYT7r/d12kP6QP8KBuMEjSE7cXy+hXYit09QsHJClA1cvfDQByRTrngQ0Pk/XmJAjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4GTpso0mlsozeK4RcyvaU+aLxbFdGzPqeTRGi+FuCQ=;
 b=bLPFv7W/U6QPjHSzcoqhTW8k24il3nS5U9OcuoGfIMzCbHg9s2GQPzSddl2ecjttLOttDPp7u4zWouG0gIkCbymPFivaGvxdKvkj+fqnURfF1ILjM4vWTBIY19f/I9BGCBFXrNUtr2j8xE1JM0dIioSY8mq2pEJTYySyunBFdlnfQdJcoqsTWcgQEgsM/oWCJyWoR3XhdARO/+DSfR3uHx7hJJdtVrdXYgkIc3AgPEC08xYg5BqqK7SRi4s+pGG2OsMHhSqgpFZ0feT4HMBdwXyGRBVzYSOhhNDF8ECxTaMVKZxPhVUXjE5KGZ5kOrkpiLkllenlbAOS5JxWeD6Zyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DBAPR04MB7270.eurprd04.prod.outlook.com (2603:10a6:10:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 01:52:16 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 01:52:16 +0000
From: Ming Qian <ming.qian@oss.nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	robh+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] media: amphion: Add a frame flush mode for decoder
Date: Thu, 19 Dec 2024 10:51:46 +0900
Message-ID: <20241219015146.706482-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241219015146.706482-1-ming.qian@oss.nxp.com>
References: <20241219015146.706482-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0074.apcprd02.prod.outlook.com
 (2603:1096:4:90::14) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DBAPR04MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: af8f7f88-f2bd-406c-7980-08dd1fcfc3bc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pQQfJk5tVOZ02wcwUn1JxXGUpGo5EmHsvPlYQ54uo5mqT8dVhvmOqY6oQ2GL?=
 =?us-ascii?Q?oBe5WeMDPy1QSUpCl1NhCzipI5FSj8tGffCYYFQFLL2RUfYombSGDfoYokHE?=
 =?us-ascii?Q?oYOn1aNwtxzz9GDfwmzbrO3aQnYg8jrg/iauJ2dwyUuzHL6asZ9W31v/ADk5?=
 =?us-ascii?Q?7Y0h2EX5+WVqCdVUKieafqsVLwlLE5I3LOUz02iQk25mQt9s4zsrErb09JjT?=
 =?us-ascii?Q?yG5mnML/ArYE2rnNIGmRTVu0PxVQJvUqQHDph5xpYQJ/uhBcPNf9qpEPD2z8?=
 =?us-ascii?Q?A50AHwerjCzZfSFdwX+CzeFngv0DAc20z1T5afhMcTDHtBuJixgTmohc+SbM?=
 =?us-ascii?Q?Mfe/E4VapK6nLLrQZslXin4h3TtYPJ0YWFoxD7AsYmvUeQVR/fjY6t2xlDlI?=
 =?us-ascii?Q?ViMxpAhSP1InlNLZp7M4qwxBmVqJw/pF7NY/tGvTC2ShAhi75fSqnRAx2Gl3?=
 =?us-ascii?Q?rHKXcOGpeBrXY0ExNRmK/HLDJOQtV2WDDZqvXcopKly3/L98zcRou6BGlHOZ?=
 =?us-ascii?Q?dsnIacyDqYrMColBWRgyfm3usurizcJMeuEP0GefJ6zZRp2pQvfaS8X77hqh?=
 =?us-ascii?Q?48UJhU/pWD661Pk5pLrvoDXcqAiUPcrRYobK+G5lsypOWphueqjJnLNSM6d/?=
 =?us-ascii?Q?TndwLXTKe9XX6+Lm/TfmmgiC+3UNJ0CAYjcC3geuzE3dVtSfE6zZJBxFm2jh?=
 =?us-ascii?Q?niuOQ8c0qZuHHLcsMGLQAAZIO7T3uirD7B3P4Ft5bLE/19szaZFKp8vyXBI7?=
 =?us-ascii?Q?PBnOOpZId4AAPOZC5L+0sLHBsUDda6b/349ncJJR22u6C5kovoEIk8niuVD2?=
 =?us-ascii?Q?K/6/gDuwxhURcBpM1tUJs0b7xNKAIfOuFBRkTY7I0wGl7zlKWjLb776DC9s5?=
 =?us-ascii?Q?5+sCwQqLpCDJVqQyh6AuT/oAG0gnKKCRR23XB8oRoNvk524yERPY+AHZ6npT?=
 =?us-ascii?Q?TV8WyA/9Y1U9PLcmrfsGNgtDwBeiVROu1eXWgGlDL7OruPUsMi0Ou2X0yALq?=
 =?us-ascii?Q?Dh6LE5XY3mZtOWXNKCwvNTIHyqv+5s+TLMe/S1T3NyreIikisWWb+qWibPjV?=
 =?us-ascii?Q?ZeMHttTamA0pseR2JRq8ZfYTkbwrYNpbMxO/0WE+OKTGjbM3F0Ps29uLxyiL?=
 =?us-ascii?Q?a7JI0A9w95VfXMf3lOopCVCJBIU5mHH0F8dyoxH4UK31SnIgemHYAt76fGm5?=
 =?us-ascii?Q?EP6kC3IL42JjiLryhdoeAFcGELpr04x9eIgwczAMuYlxYeVkqm83hzszUkaa?=
 =?us-ascii?Q?aAp/BZqyqJuV0BZDa9XDWFljWoI0jHqtoJlAKSdDjL7FU/xwzCj0iD/x78kP?=
 =?us-ascii?Q?SHGZn0ZNymbHUUC/ZtSdFBpw7KDUXpP7MrP/lnkoltNtk83vSUp7LHwLkT0c?=
 =?us-ascii?Q?AcSP7Eh22mZHnilnTPcOW4CHAOy4Altssu3jd//YDmaX0m9CES2jRAeDjAVU?=
 =?us-ascii?Q?s26lEnS679s0DEAdWPU7EU3nC6RGEN5H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+iROILbRevuVZVy3Ezygj+B1vb3Z7xGsIPFNi1vYOv+vxL5/VNJcKjUwST7Z?=
 =?us-ascii?Q?8VWv1rBFxYvB+DV9SjJeHQtDzvZh0s2XiLhmXdN9Vnqt52UsKaJzayge74bL?=
 =?us-ascii?Q?xAY1C6HTUysb0j3J6nXMil6BUiwiftDV7BHqFvUyUyZkmg8mvt4jSrYsxtM8?=
 =?us-ascii?Q?sgf8dgtgnlQdFNBWReK5+d1CrW6WWEwvBtQcRvp1vr9dsj6F7D5l0lVeIyi2?=
 =?us-ascii?Q?ApVr+5UVsuCRJQQuYP9OdFyarrYZGgfn4Mb+yxX6pvs0zi4KXZJSXM3SaMat?=
 =?us-ascii?Q?suFdeKLmftbVhke8Lby6w6xy2A2rTdUSqfyuGDLlHRwqdCYd2dkNvNWtybwC?=
 =?us-ascii?Q?/edKws6Uq6Irar0VGt2k6r5ViTX2FZy6LmWEWQyCU8/+VasKMZRf3kugx4lu?=
 =?us-ascii?Q?eC/a5HJp2GpMKv/+NQc+VRjq9/aQ3sfx+SrlbE1H1j7BGJoZaHawJHeDnHcL?=
 =?us-ascii?Q?goW5FEgo1JC09pfqfMgOuApX+5LW9G9l/R8itd19UjELlzvhlGnUZAZXPkZj?=
 =?us-ascii?Q?vnc5UXAjERNGeMttpQdhHqzlvaL8kw3ViprnXE/NcspFmsLeW/F3BJxDnMo/?=
 =?us-ascii?Q?w5Dv3d1TxOovKbD63M5mVF96Truuk6L3rV+A2SoZprL1xVAxWeszcdbDZcfh?=
 =?us-ascii?Q?0mMuC327OedY5epZoSVP+H5+JCuCrwCOsqMEjyGmM40MxJt80bEIEbEUtF6K?=
 =?us-ascii?Q?Z5BbYwcwYLwmk/mQgVW4MhA9OYChBKGiSh2rLaA91BYAjQXz7l5EnhaU5HmL?=
 =?us-ascii?Q?NZG7HTacQatLPxX7sMTpBqJFAuqo6dl95stQmSMkVx9pZiqjtbrC21BJslCI?=
 =?us-ascii?Q?XnvOuvbizGYpg34KWFjBEKMbGnOPUGY4UVOrWMclI+U7q0MMUFwTw6ftkz10?=
 =?us-ascii?Q?YnIaHIXyDI3Y4VHX75aT0U0gMZsvBpIUJZEUFuQQPeTMmF/c+l44M3QTVXFR?=
 =?us-ascii?Q?rkpi30LphhYGLZv5Et8kd+c5I7yveF4lLfQd0n74ns8nc8TmP5ngHKVRWLAR?=
 =?us-ascii?Q?ejNNTHBPqYWOxGVeNlVrJsr5aMZpOkMvVEaVzd19cfLn9TahOn8FEKCe5p5F?=
 =?us-ascii?Q?Br5ridyEp9GHp5guRTVwP7hSIdspDmJF/GXBJM9i/loQmcaCt/BBt0uyHCck?=
 =?us-ascii?Q?MsvvGpNKafbzrTvZJ0oDiqY5nDWqfcogteGH0W83IaOEG7CzfNJCjtoEQ569?=
 =?us-ascii?Q?7f9zbNbbz//KEScTGd45bEuErrdH8AZKA3GiYKV1zwbdfpcGjGOg5EWu2eIl?=
 =?us-ascii?Q?i8BjtywdAAhectNRzMTdeLvgtS44fh1J4DHadah21RnRDC7JQxe3Nl1rEPl3?=
 =?us-ascii?Q?5s9/TKDXdoweyr/hwE2kQK6inbjk323cTHKyZRs5Oe61BNAgbQt1PkTWeoOp?=
 =?us-ascii?Q?1cTy+tjzTf0LoQTpqKiGAPwuGGlFTxqE4HL2PswBXz6qLr5obN7msI0t2gYR?=
 =?us-ascii?Q?QS5zWxFzgkHIiJGFK7PX1byuCJ//OHkGLxXoCybsTW3yn3PJWsnCU5RIsuC4?=
 =?us-ascii?Q?DF2wKCCIFkn/nQTwaO/81tZUF698biPzDR5B9tuhcyByT1SjJ6J0VV4B1EVD?=
 =?us-ascii?Q?TKlT4MxgUanJWoMeArEKqfIPTl30eBRRIlZFclYz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af8f7f88-f2bd-406c-7980-08dd1fcfc3bc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 01:52:16.0890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c9bzuN2im9XoAIv2aF8LCge8f3Fo1e3uXryvOVofKFPPUS1RB3XTkMaEi0m8IXmh1tWb6dPcJ1CkMIeYrKAm9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7270

The amphion decoder will pre-parse 3 frames before decoding the first
frame. If we append a flush padding data after frame, the decoder
will finish parsing and start to decode when the flush data is parsed.
It can reduce the decoding latency.
In the past, we only enable this mode when the display delay is set to
0. But we still can enable this mode without changing the display order,
so we add a frame_flush_mode parameter to enable it.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vpu_malone.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index 8f4aa48b2d65..3750a2618b0e 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -25,6 +25,9 @@
 #include "vpu_imx8q.h"
 #include "vpu_malone.h"
 
+static bool frame_flush_mode;
+module_param(frame_flush_mode, bool, 0644);
+
 #define CMD_SIZE			25600
 #define MSG_SIZE			25600
 #define CODEC_SIZE			0x1000
@@ -1571,7 +1574,7 @@ static int vpu_malone_input_frame_data(struct vpu_malone_str_buffer __iomem *str
 
 	vpu_malone_update_wptr(str_buf, wptr);
 
-	if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
+	if ((disp_imm || frame_flush_mode) && !vpu_vb_is_codecconfig(vbuf)) {
 		ret = vpu_malone_add_scode(inst->core->iface,
 					   inst->id,
 					   &inst->stream_buffer,
-- 
2.43.0-rc1


