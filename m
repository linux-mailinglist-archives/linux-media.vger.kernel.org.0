Return-Path: <linux-media+bounces-23354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E59129F05BB
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 08:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0CAD281F55
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 07:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A8D1993B6;
	Fri, 13 Dec 2024 07:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MzUJLixI"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2060.outbound.protection.outlook.com [40.107.105.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E570E1F95E;
	Fri, 13 Dec 2024 07:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734076048; cv=fail; b=D1BCB7NA9JJD9rPdH/qotw/Rd1TJFPADeSh2l3xH9pYkFZor2LW0CYEgIXYcHNGO1u8a7CjLpDNE1SJDn/f0KX3yoivteT75uhSxBox8m8au5K9TDD+eymqLlnuhCXPiuUSbNl2xyq0pdlCTut0dXER9s1mKc0UFwPpQ55xU5Yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734076048; c=relaxed/simple;
	bh=EeMJf1V7uF9gnM+OXx99z4KUDVG1+DkKSZTiFVnKCuE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VIgxYBfmRb+a0JD+1+tA40S6SJLNzhXLQiyFcmyjUcY3heogfMz+vr3R6W94s7GaSLtasB4Lv0it3xclNiRksr9hZU5SQQ7XZznlS5LRxRJUcgxUn3/IyLp380UeH3YxF72CWW9P9f43J28PxCO1YyOeO5+xKUeGYKWbS+y98rM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MzUJLixI; arc=fail smtp.client-ip=40.107.105.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8FJNKBw3dgpDdahyMBrKA9KnKK/L+5yn6h/UM59j3nG/Gtby0t9wQjjIciQb7dhr7p00Roy+T/FTeSplnGyD2qZrXv6h3jQLrq9C7KyBbBdZmw/rgna25bEpkErL+9leUvvWxJfHx4f052eLYnypX10cNGOjkkl5qtCa1O8QKDIi7U3Y7Ja7BN47gwmD0bztnD/JD0QCcBE+1m8IvOzJqjogHZyQ9fmQCtE5JNSPfrN6+E7tklCqTpE+C80GNi/T9W9UgBYAfTiJurMSScNHdKVsp0ZCiAGLYDAHI7woIL+t1ziwzCe6Csu0GP+uJ9ZzTxN/whKnXQ0m2GsAh5hbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOKKt659PnFGKslQ/hbSUGj7otagSCJ/uRb0lZdMj1o=;
 b=DhbpAjYMTnneRXYEG8+RxFVqnMEh1MZRfeGyb9ekWjUtoRyC2xuTjZQuFwTmiBhlTgony7BeOXGiZLFbHwSNkZWSLTAvaBGwP+TCctJLqmCys6x1VqeFprj4D4UJTh+qp24Iw6+vo6py7AVXCUViThQyHBGcKQY9zndf7KBD457X/MVTLAy23A7v0BfYqW7R0C5iX+HLs8h1EgpDMEHnG3dT2Zcwcv7wJt55dhuiRtHTUW2BbQh62cIp81YuLe5EhLAuvUujCqI3MVBTxD2O9I9RSuwQ0eFiTY5+oIW+PBQbzGAC77nVPgpVIEzEu5HTv80ZOpQXF0S/LUD2qKd8uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOKKt659PnFGKslQ/hbSUGj7otagSCJ/uRb0lZdMj1o=;
 b=MzUJLixIHcHjJaA4t20cHAh0+dYP5invJeCGDAuhSsnZn++qqNYOoUtTswPWr9ZNxJX/88mSsoYo0rBjJT6tLmEi3nlRmR67j2NizZZQh9ZM83AyZM83o7FmxuLHBS1JnTlO10rIG4GkwoP1xVaLM26dpR0g3LV0bpp4FNcuHz/UKASAtZYocM0hDcXFBtMU+8xlLG5KwMgmC90G0P8BD/hZknQUB2B+mwM1QSI1ckE1v6o7/+zUCnV+elkSHebYLHJ38eVv4IKpyR+gWRkVWhgDKfXe6oCiESLxM6tuBY2mLWsYXtYy4NhKZzPU2Wgoq+bh3N/grq7IvqFRdV4mhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS1PR04MB9479.eurprd04.prod.outlook.com (2603:10a6:20b:4d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 13 Dec
 2024 07:47:16 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 07:47:16 +0000
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
Subject: [PATCH] media: amphion: Support dmabuf and v4l2 buffer without binding
Date: Fri, 13 Dec 2024 16:46:46 +0900
Message-ID: <20241213074646.2859784-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0102.apcprd02.prod.outlook.com
 (2603:1096:4:92::18) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS1PR04MB9479:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a2be56-b35d-4176-eb3a-08dd1b4a5d17
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?stzRKGn60t+dMfP7t4T2aKuEfxAbkReQnK//3mm1qBBIJ/ZwehlTHYEG1kAY?=
 =?us-ascii?Q?Xdak84zSUBjnei4WTq8vj8e5U/5f56b6B/CRitA140B/9dU4BuPLFm0Cc6ei?=
 =?us-ascii?Q?Ny54v/RHT7xCq3BMO7HJejERDmIwTDu4UrGap7X9RFZSLFtrEE4mizHKaesS?=
 =?us-ascii?Q?Zoybpted5/SpkvARFQw0DkefDxY0VzF5njAQwJQg/+X06gYXDkcfhqhAizrs?=
 =?us-ascii?Q?QHrFQzaVGsABDTFrk5wOkmSInNkwgniXfgamFDK11KbdGLQMRDpAUk14Ugh5?=
 =?us-ascii?Q?tV1F/0jhlJKEAyrD8k9ZBFJWROEO70APbcev/BDinGZDdpxA2z/75QxiGMs/?=
 =?us-ascii?Q?iv000fHNFU4ZbScME2x9OIh9t3eDeOpyyOVN2kvx1REjUUDlqRjj2P2CQJno?=
 =?us-ascii?Q?2uISP59vGmY6A4olbTrKocprPglCSSR/5/2oA2ODJNcDqLam1c9Nj8fW8xIe?=
 =?us-ascii?Q?jXMcOwuzBEb0pfeLyfIZoni0y69l0yP7Wxd/0F/xmcd1s8XDwDM0LHRArrL9?=
 =?us-ascii?Q?LcudTaqa6CapFkVPIIHy/kL0A5uj8ka6x50p6cat+Sl2II4HwGwXky1BlL84?=
 =?us-ascii?Q?Jww71uwFFv0v3MuBaeY6er14X2Szq+BvFJ2KGGK65ce39XZu+rS9pR5CVIs2?=
 =?us-ascii?Q?P3Y02FUcviwscTVG8cJfr1Y9KdFylcb1ypi1VSRM+KJV309vBV4hWRgXPJDP?=
 =?us-ascii?Q?zct3iTI2fVyAtDq8KAZO1KCdXkl5Q1Zjf3ubMvA5OeQK82KhBLkNMr2eZEGL?=
 =?us-ascii?Q?A7IU+7L/V0RFNScc92KjfbpRP9ZDTcGAJPSYFZekF/k1d4JmIeEnTk1Vvv6J?=
 =?us-ascii?Q?YO4/32+icvRX+w6i+n0CwNnEg9pqO/W9tuij6Y5eNjJ7ScnEQSed5TXw+/52?=
 =?us-ascii?Q?ngJUfqyiyvkEVhRs75at0Q95COHoE6ZQjC4abl5lsZXwi1p5uKb8OizX4ByQ?=
 =?us-ascii?Q?vC2qOKSm4QlyyjeOMkK0QQ0i8VkeoiKfd/yfQUVt807rexAmMWTVaTIV2fN3?=
 =?us-ascii?Q?e+fUr9iXEWkpcH5LAZrsydFb5ggu5HmOjHR2DnSi7Y/M52mt1f72OFHPaVEl?=
 =?us-ascii?Q?5iBc3vQDdYXI9MW6fK+mMAIwIHqRKKVHvg1GVEBasGoNpU2lnTYsJyDGwXXz?=
 =?us-ascii?Q?YOUi4yt3WBCrrUVrovW8B82d6BbYMu81HwNrcp+cB9Dk3JKMg6uQjhhUFFnU?=
 =?us-ascii?Q?uWYWuNou+4bLSR0PIviAOXtet/wBGn+NZFOv3iKZh1b3NXb+5RQLdbeEQY97?=
 =?us-ascii?Q?iMpL45EUz9qXcdkmirla4yaPElp//dtDpFC6QLTIrKhRKjVSCcKOBEB4UwAV?=
 =?us-ascii?Q?tSg3L0wTRpxgX7V58uFvGvKRxq9LKd+ekFLxUgoYrPV6tcSAkWenaFQRQRLc?=
 =?us-ascii?Q?DZ94OeeMvtjij+sxirmig+5B4Y9NcbON8u2DALdWrpbN/S2KTA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e+5SXXlCmdcLua7bXShHhmALFs+rrKgLh1k3Ye21Bp3ebV28xOdY0RYOOQu6?=
 =?us-ascii?Q?mO6pEBeZ2nZBd0N8HuryW0uNMUeI0Pd86G84AcYyCMGOqKXfgCYq45qiirOd?=
 =?us-ascii?Q?FjCYQeV1KJOnGyKOm33OYnQqasdbKxTIieG/cIBxYtwGMH6nx2U+11ZghMWw?=
 =?us-ascii?Q?A5jqQ59XTCfz3ladtt1k9NVMZ+sulwTxK9hH1wHt1HMMl5bQ/EhzPN/PHzlI?=
 =?us-ascii?Q?xjWufsndnN6CRvQqMswbGJGgmZCMkKAZ08NHpLe52+xC1Ggr+E07wN4bnQjx?=
 =?us-ascii?Q?iukrGnKlIiH+eV48Qir46qlBHE+DX6CmMhMCjt1AwSCkzXTE28hKHwelOwPr?=
 =?us-ascii?Q?1KdrovMUmbCtLoGxfmUeM9jUnRL6l5TUGBET/9Lh2M7xuE7wamgZbh+99SP7?=
 =?us-ascii?Q?5fqCA8mvm6HZQ+oQmKOTUqIyzWzWp0EaoW9wKvZQJr7XFt/wRPBEvJmDFKFI?=
 =?us-ascii?Q?YtNfEhOkhpzEOIOTOBua1JIQziCyFZouAFqRkWHdmrYd3yqAfYrBrYM0GvC8?=
 =?us-ascii?Q?ipKnBdpu0wpSFcndWf7qmSz5rjLT74UBZB3UEx64zOCsDFVWU/WABHFAzXTj?=
 =?us-ascii?Q?Eh6jkvSgU+nG+MDD85coA9eUkqwHgFRnO7rYv20Gwhu53m8kkN/srmsGbhSV?=
 =?us-ascii?Q?0FkYBDzbwy6EQorGlUWYLColC2iJaoy5WYP1s7tBRBY5dQUTZ6rFVJ7/rUx7?=
 =?us-ascii?Q?/fCW6qtGiqofLT74cVbVSAuByEKr29pwKzIJsliPjBHCIsDXL4LH+7DGiNN+?=
 =?us-ascii?Q?SFOJyS7tKK9/4iicwS5gcc4hsMPg6L5r8D8iW56tp0CPTnoACbU2f6YTQsc+?=
 =?us-ascii?Q?RwI3O6tGnv0mhmLYLHo+YEGPjeTXiJYCnzF/hKKTKpZ1K9NLb13U0xdYeHHN?=
 =?us-ascii?Q?uBfUfc1BwqTA7aHcYGUQDuiT0M8sTC84PLuy+nv0V69MXGzhE4HRUPvmtEb+?=
 =?us-ascii?Q?cYJkwiPEpb1VTdt6aYFjxFBmQhx2QHJrRML/DwpaAWU08cOeWaUf4BEp1roV?=
 =?us-ascii?Q?QdULr1Q9PQc5AtHZWA1GA5qe4b0o4kASEAkOqMkf5ehGIvR8O9zy/g+OqreY?=
 =?us-ascii?Q?o3M4VwRTonX1lyCORV//2rRgwDn0sufDGin7ge7fCw/oB2ZB8L5lPzxjBn4e?=
 =?us-ascii?Q?GoZ9TXGILXwx2gW/8HkBWbYVA2I11lLYo29pOPbJezV2L2f90yWvDnUEcKj2?=
 =?us-ascii?Q?tw150USSwFLCBESCj1Wal3OeQvAuMcZDhPU5upzdBtgNfroSH1lNogtEIB6S?=
 =?us-ascii?Q?58jQx3u/Ci5/Wn+raV6FP4y9QHkl8HqJbxTlSFyMEs0lDAG9LLS442URGGOl?=
 =?us-ascii?Q?gIlflQiI3uTlaaGkI+5tn19Ds29NAawSTZJeWi++InGRWV3ZoXV5NlBXK54f?=
 =?us-ascii?Q?GtvnJcWNPpxaf335HHhzJUSti3zxFaLE3872n1ui7rll8ZyPGowDwS8wHNpS?=
 =?us-ascii?Q?+j8Cq/NeRzYpGG2dxdaR02bW2+0Ngq3wHJj/wG1cmkQuSM86k9SsVEMdm/BY?=
 =?us-ascii?Q?fwkrAGirPn0h6utZ5O1oO2EUU8vDcMHtkXPo4RQdpJiaIpS72PjRBjZ/6Bzg?=
 =?us-ascii?Q?7kqClJugS/m26/J8pk6ebJ4n33TD6KR0FoOtE4xi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a2be56-b35d-4176-eb3a-08dd1b4a5d17
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 07:47:16.3594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7VFFFb79ihONZ1crZz+4IFyXid+TAUvtxrGoI/fNvOnOIFTUJBHdpG5U21mtC/Yc+xnpzx1RtgA7MK2VqDWfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9479

From: Ming Qian <ming.qian@nxp.com>

When using VB2_DMABUF, the relationship between dma-buf and v4l2 buffer
may not one-to-one, a single dma-buf may be queued via different
v4l2 buffers, and different dma-bufs may be queued via the same
v4l2 buffer, so it's not appropriate to use the v4l2 buffer index
as the frame store id.

We can generate a frame store id according to the dma address.
Then for a given dma-buf, the id is fixed.

Driver now manages the frame store and vb2-buffer states independently.

When a dmabuf is queued via another v4l2 buffer before the buffer is
released by firmware, need to pend it until firmware release it.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
---
 drivers/media/platform/amphion/vdec.c     | 232 ++++++++++++++++++----
 drivers/media/platform/amphion/vpu.h      |   7 +-
 drivers/media/platform/amphion/vpu_dbg.c  |  14 +-
 drivers/media/platform/amphion/vpu_v4l2.c |  11 +
 4 files changed, 217 insertions(+), 47 deletions(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index 61d5598ee6a1..a26cb0c264c9 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -26,6 +26,7 @@
 #include "vpu_cmds.h"
 #include "vpu_rpc.h"
 
+#define VDEC_SLOT_CNT_DFT		32
 #define VDEC_MIN_BUFFER_CAP		8
 #define VDEC_MIN_BUFFER_OUT		8
 
@@ -41,6 +42,14 @@ struct vdec_fs_info {
 	u32 tag;
 };
 
+struct vdec_frame_store_t {
+	struct vpu_vb2_buffer *curr;
+	struct vpu_vb2_buffer *pend;
+	dma_addr_t addr;
+	unsigned int state;
+	u32 tag;
+};
+
 struct vdec_t {
 	u32 seq_hdr_found;
 	struct vpu_buffer udata;
@@ -48,7 +57,8 @@ struct vdec_t {
 	struct vpu_dec_codec_info codec_info;
 	enum vpu_codec_state state;
 
-	struct vpu_vb2_buffer *slots[VB2_MAX_FRAME];
+	struct vdec_frame_store_t *slots;
+	u32 slot_count;
 	u32 req_frame_count;
 	struct vdec_fs_info mbi;
 	struct vdec_fs_info dcp;
@@ -289,6 +299,64 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
 	return 0;
 }
 
+static void vdec_attach_frame_store(struct vpu_inst *inst, struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
+	struct vdec_t *vdec = inst->priv;
+	struct vdec_frame_store_t *new_slots = NULL;
+	dma_addr_t addr;
+	int i;
+
+	addr = vpu_get_vb_phy_addr(vb, 0);
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (addr == vdec->slots[i].addr) {
+			if (vdec->slots[i].curr && vdec->slots[i].curr != vpu_buf) {
+				vpu_set_buffer_state(vbuf, VPU_BUF_STATE_CHANGED);
+				vdec->slots[i].pend = vpu_buf;
+			} else {
+				vpu_set_buffer_state(vbuf, vdec->slots[i].state);
+			}
+			vpu_buf->fs_id = i;
+			return;
+		}
+	}
+
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (!vdec->slots[i].addr) {
+			vdec->slots[i].addr = addr;
+			vpu_buf->fs_id = i;
+			return;
+		}
+	}
+
+	new_slots = vzalloc(sizeof(*vdec->slots) * vdec->slot_count * 2);
+	if (!vdec->slots) {
+		dev_err(inst->dev, "fail to alloc frame store\n");
+		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_ERROR);
+		return;
+	}
+
+	memcpy(new_slots, vdec->slots, sizeof(*vdec->slots) * vdec->slot_count);
+	vfree(vdec->slots);
+	vdec->slots = new_slots;
+	vdec->slot_count *= 2;
+
+	vdec->slots[i].addr = addr;
+	vpu_buf->fs_id = i;
+}
+
+static void vdec_reset_frame_store(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	if (!vdec->slots || !vdec->slot_count)
+		return;
+
+	vpu_trace(inst->dev, "inst[%d] reset slots\n", inst->id);
+	memset(vdec->slots, 0, sizeof(*vdec->slots) * vdec->slot_count);
+}
+
 static void vdec_handle_resolution_change(struct vpu_inst *inst)
 {
 	struct vdec_t *vdec = inst->priv;
@@ -745,11 +813,11 @@ static int vdec_frame_decoded(struct vpu_inst *inst, void *arg)
 	struct vb2_v4l2_buffer *src_buf;
 	int ret = 0;
 
-	if (!info || info->id >= ARRAY_SIZE(vdec->slots))
+	if (!info || info->id >= vdec->slot_count)
 		return -EINVAL;
 
 	vpu_inst_lock(inst);
-	vpu_buf = vdec->slots[info->id];
+	vpu_buf = vdec->slots[info->id].curr;
 	if (!vpu_buf) {
 		dev_err(inst->dev, "[%d] decoded invalid frame[%d]\n", inst->id, info->id);
 		ret = -EINVAL;
@@ -770,11 +838,13 @@ static int vdec_frame_decoded(struct vpu_inst *inst, void *arg)
 	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_DECODED)
 		dev_info(inst->dev, "[%d] buf[%d] has been decoded\n", inst->id, info->id);
 	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_DECODED);
+	vdec->slots[info->id].state = VPU_BUF_STATE_DECODED;
 	vdec->decoded_frame_count++;
 	if (vdec->params.display_delay_enable) {
 		struct vpu_format *cur_fmt;
 
 		cur_fmt = vpu_get_format(inst, inst->cap_format.type);
+		vdec->slots[info->id].state = VPU_BUF_STATE_READY;
 		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_READY);
 		for (int i = 0; i < vbuf->vb2_buf.num_planes; i++)
 			vb2_set_plane_payload(&vbuf->vb2_buf,
@@ -797,11 +867,11 @@ static struct vpu_vb2_buffer *vdec_find_buffer(struct vpu_inst *inst, u32 luma)
 	struct vdec_t *vdec = inst->priv;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(vdec->slots); i++) {
-		if (!vdec->slots[i])
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (!vdec->slots[i].curr)
 			continue;
-		if (luma == vdec->slots[i]->luma)
-			return vdec->slots[i];
+		if (luma == vdec->slots[i].addr)
+			return vdec->slots[i].curr;
 	}
 
 	return NULL;
@@ -835,11 +905,11 @@ static void vdec_buf_done(struct vpu_inst *inst, struct vpu_frame_info *frame)
 
 	cur_fmt = vpu_get_format(inst, inst->cap_format.type);
 	vbuf = &vpu_buf->m2m_buf.vb;
-	if (vbuf->vb2_buf.index != frame->id)
-		dev_err(inst->dev, "[%d] buffer id(%d, %d) dismatch\n",
-			inst->id, vbuf->vb2_buf.index, frame->id);
+	if (vpu_buf->fs_id != frame->id)
+		dev_err(inst->dev, "[%d] buffer id(%d(%d), %d) dismatch\n",
+			inst->id, vpu_buf->fs_id, vbuf->vb2_buf.index, frame->id);
 
-	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_READY && vdec->params.display_delay_enable)
+	if (vdec->params.display_delay_enable)
 		return;
 
 	if (vpu_get_buffer_state(vbuf) != VPU_BUF_STATE_DECODED)
@@ -852,10 +922,11 @@ static void vdec_buf_done(struct vpu_inst *inst, struct vpu_frame_info *frame)
 	vbuf->sequence = vdec->sequence;
 	dev_dbg(inst->dev, "[%d][OUTPUT TS]%32lld\n", inst->id, vbuf->vb2_buf.timestamp);
 
-	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 	vpu_inst_lock(inst);
+	vdec->slots[vpu_buf->fs_id].state = VPU_BUF_STATE_READY;
 	vdec->display_frame_count++;
 	vpu_inst_unlock(inst);
+	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 	dev_dbg(inst->dev, "[%d] decoded : %d, display : %d, sequence : %d\n",
 		inst->id, vdec->decoded_frame_count, vdec->display_frame_count, vdec->sequence);
 }
@@ -1083,18 +1154,30 @@ static int vdec_response_frame(struct vpu_inst *inst, struct vb2_v4l2_buffer *vb
 	if (!vbuf)
 		return -EINVAL;
 
-	if (vdec->slots[vbuf->vb2_buf.index]) {
-		dev_err(inst->dev, "[%d] repeat alloc fs %d\n",
-			inst->id, vbuf->vb2_buf.index);
+	vpu_buf = to_vpu_vb2_buffer(vbuf);
+	if (vpu_buf->fs_id < 0 || vpu_buf->fs_id >= vdec->slot_count) {
+		dev_err(inst->dev, "invalid fs %d for v4l2 buffer %d\n",
+			vpu_buf->fs_id, vbuf->vb2_buf.index);
 		return -EINVAL;
 	}
 
+	if (vdec->slots[vpu_buf->fs_id].curr) {
+		if (vdec->slots[vpu_buf->fs_id].curr != vpu_buf) {
+			vpu_set_buffer_state(vbuf, VPU_BUF_STATE_CHANGED);
+			vdec->slots[vpu_buf->fs_id].pend = vpu_buf;
+		} else {
+			vpu_set_buffer_state(vbuf, vdec->slots[vpu_buf->fs_id].state);
+		}
+		dev_err(inst->dev, "[%d] repeat alloc fs %d (v4l2 index %d)\n",
+			inst->id, vpu_buf->fs_id, vbuf->vb2_buf.index);
+		return -EAGAIN;
+	}
+
 	dev_dbg(inst->dev, "[%d] state = %s, alloc fs %d, tag = 0x%x\n",
 		inst->id, vpu_codec_state_name(inst->state), vbuf->vb2_buf.index, vdec->seq_tag);
-	vpu_buf = to_vpu_vb2_buffer(vbuf);
 
 	memset(&info, 0, sizeof(info));
-	info.id = vbuf->vb2_buf.index;
+	info.id = vpu_buf->fs_id;
 	info.type = MEM_RES_FRAME;
 	info.tag = vdec->seq_tag;
 	info.luma_addr = vpu_get_vb_phy_addr(&vbuf->vb2_buf, 0);
@@ -1109,12 +1192,13 @@ static int vdec_response_frame(struct vpu_inst *inst, struct vb2_v4l2_buffer *vb
 	if (ret)
 		return ret;
 
-	vpu_buf->tag = info.tag;
 	vpu_buf->luma = info.luma_addr;
 	vpu_buf->chroma_u = info.chroma_addr;
 	vpu_buf->chroma_v = 0;
 	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_INUSE);
-	vdec->slots[info.id] = vpu_buf;
+	vdec->slots[info.id].tag = info.tag;
+	vdec->slots[info.id].curr = vpu_buf;
+	vdec->slots[info.id].state = VPU_BUF_STATE_INUSE;
 	vdec->req_frame_count--;
 
 	return 0;
@@ -1175,25 +1259,47 @@ static void vdec_recycle_buffer(struct vpu_inst *inst, struct vb2_v4l2_buffer *v
 	v4l2_m2m_buf_queue(inst->fh.m2m_ctx, vbuf);
 }
 
-static void vdec_clear_slots(struct vpu_inst *inst)
+static void vdec_release_curr_frame_store(struct vpu_inst *inst, u32 id)
 {
 	struct vdec_t *vdec = inst->priv;
 	struct vpu_vb2_buffer *vpu_buf;
 	struct vb2_v4l2_buffer *vbuf;
+
+	if (id >= vdec->slot_count)
+		return;
+	if (!vdec->slots[id].curr)
+		return;
+
+	vpu_buf = vdec->slots[id].curr;
+	vbuf = &vpu_buf->m2m_buf.vb;
+
+	vdec_response_fs_release(inst, id, vdec->slots[id].tag);
+	if (vpu_buf->fs_id == id) {
+		if (vpu_buf->state != VPU_BUF_STATE_READY)
+			vdec_recycle_buffer(inst, vbuf);
+		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
+	}
+
+	vdec->slots[id].curr = NULL;
+	vdec->slots[id].state = VPU_BUF_STATE_IDLE;
+
+	if (vdec->slots[id].pend) {
+		vpu_set_buffer_state(&vdec->slots[id].pend->m2m_buf.vb, VPU_BUF_STATE_IDLE);
+		vdec->slots[id].pend = NULL;
+	}
+}
+
+static void vdec_clear_slots(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(vdec->slots); i++) {
-		if (!vdec->slots[i])
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (!vdec->slots[i].curr)
 			continue;
 
-		vpu_buf = vdec->slots[i];
-		vbuf = &vpu_buf->m2m_buf.vb;
-
 		vpu_trace(inst->dev, "clear slot %d\n", i);
-		vdec_response_fs_release(inst, i, vpu_buf->tag);
-		vdec_recycle_buffer(inst, vbuf);
-		vdec->slots[i]->state = VPU_BUF_STATE_IDLE;
-		vdec->slots[i] = NULL;
+		vdec_release_curr_frame_store(inst, i);
 	}
 }
 
@@ -1324,39 +1430,29 @@ static void vdec_event_req_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
 static void vdec_evnet_rel_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
 {
 	struct vdec_t *vdec = inst->priv;
-	struct vpu_vb2_buffer *vpu_buf;
-	struct vb2_v4l2_buffer *vbuf;
 
-	if (!fs || fs->id >= ARRAY_SIZE(vdec->slots))
+	if (!fs || fs->id >= vdec->slot_count)
 		return;
 	if (fs->type != MEM_RES_FRAME)
 		return;
 
-	if (fs->id >= vpu_get_num_buffers(inst, inst->cap_format.type)) {
+	if (fs->id >= vdec->slot_count) {
 		dev_err(inst->dev, "[%d] invalid fs(%d) to release\n", inst->id, fs->id);
 		return;
 	}
 
 	vpu_inst_lock(inst);
-	vpu_buf = vdec->slots[fs->id];
-	vdec->slots[fs->id] = NULL;
-
-	if (!vpu_buf) {
+	if (!vdec->slots[fs->id].curr) {
 		dev_dbg(inst->dev, "[%d] fs[%d] has bee released\n", inst->id, fs->id);
 		goto exit;
 	}
 
-	vbuf = &vpu_buf->m2m_buf.vb;
-	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_DECODED) {
+	if (vdec->slots[fs->id].state == VPU_BUF_STATE_DECODED) {
 		dev_dbg(inst->dev, "[%d] frame skip\n", inst->id);
 		vdec->sequence++;
 	}
 
-	vdec_response_fs_release(inst, fs->id, vpu_buf->tag);
-	if (vpu_get_buffer_state(vbuf) != VPU_BUF_STATE_READY)
-		vdec_recycle_buffer(inst, vbuf);
-
-	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
+	vdec_release_curr_frame_store(inst, fs->id);
 	vpu_process_capture_buffer(inst);
 
 exit:
@@ -1552,6 +1648,11 @@ static void vdec_cleanup(struct vpu_inst *inst)
 		return;
 
 	vdec = inst->priv;
+	if (vdec) {
+		vfree(vdec->slots);
+		vdec->slots = NULL;
+		vdec->slot_count = 0;
+	}
 	vfree(vdec);
 	inst->priv = NULL;
 	vfree(inst);
@@ -1683,6 +1784,38 @@ static int vdec_stop_session(struct vpu_inst *inst, u32 type)
 	return 0;
 }
 
+static int vdec_get_slot_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
+{
+	struct vdec_t *vdec = inst->priv;
+	struct vpu_vb2_buffer *vpu_buf;
+	int num = -1;
+
+	vpu_inst_lock(inst);
+	if (i >= vdec->slot_count || !vdec->slots[i].addr)
+		goto exit;
+
+	vpu_buf = vdec->slots[i].curr;
+
+	num = scnprintf(str, size, "slot[%2d] :", i);
+	if (vpu_buf) {
+		num += scnprintf(str + num, size - num, " %2d",
+				 vpu_buf->m2m_buf.vb.vb2_buf.index);
+		num += scnprintf(str + num, size - num, "; state = %d", vdec->slots[i].state);
+	} else {
+		num += scnprintf(str + num, size - num, " -1");
+	}
+
+	if (vdec->slots[i].pend)
+		num += scnprintf(str + num, size - num, "; %d",
+				 vdec->slots[i].pend->m2m_buf.vb.vb2_buf.index);
+
+	num += scnprintf(str + num, size - num, "\n");
+exit:
+	vpu_inst_unlock(inst);
+
+	return num;
+}
+
 static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
 {
 	struct vdec_t *vdec = inst->priv;
@@ -1741,6 +1874,7 @@ static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i
 				vdec->codec_info.vui_present);
 		break;
 	default:
+		num = vdec_get_slot_debug_info(inst, str, size, i - 10);
 		break;
 	}
 
@@ -1764,6 +1898,8 @@ static struct vpu_inst_ops vdec_inst_ops = {
 	.get_debug_info = vdec_get_debug_info,
 	.wait_prepare = vpu_inst_unlock,
 	.wait_finish = vpu_inst_lock,
+	.attach_frame_store = vdec_attach_frame_store,
+	.reset_frame_store = vdec_reset_frame_store,
 };
 
 static void vdec_init(struct file *file)
@@ -1804,6 +1940,14 @@ static int vdec_open(struct file *file)
 		return -ENOMEM;
 	}
 
+	vdec->slots = vzalloc(sizeof(*vdec->slots) * VDEC_SLOT_CNT_DFT);
+	if (!vdec->slots) {
+		vfree(vdec);
+		vfree(inst);
+		return -ENOMEM;
+	}
+	vdec->slot_count = VDEC_SLOT_CNT_DFT;
+
 	inst->ops = &vdec_inst_ops;
 	inst->formats = vdec_formats;
 	inst->type = VPU_CORE_TYPE_DEC;
diff --git a/drivers/media/platform/amphion/vpu.h b/drivers/media/platform/amphion/vpu.h
index 22f0da26ccec..76bfd6b26170 100644
--- a/drivers/media/platform/amphion/vpu.h
+++ b/drivers/media/platform/amphion/vpu.h
@@ -223,6 +223,8 @@ struct vpu_inst_ops {
 	int (*get_debug_info)(struct vpu_inst *inst, char *str, u32 size, u32 i);
 	void (*wait_prepare)(struct vpu_inst *inst);
 	void (*wait_finish)(struct vpu_inst *inst);
+	void (*attach_frame_store)(struct vpu_inst *inst, struct vb2_buffer *vb);
+	void (*reset_frame_store)(struct vpu_inst *inst);
 };
 
 struct vpu_inst {
@@ -296,7 +298,8 @@ enum {
 	VPU_BUF_STATE_DECODED,
 	VPU_BUF_STATE_READY,
 	VPU_BUF_STATE_SKIP,
-	VPU_BUF_STATE_ERROR
+	VPU_BUF_STATE_ERROR,
+	VPU_BUF_STATE_CHANGED
 };
 
 struct vpu_vb2_buffer {
@@ -305,8 +308,8 @@ struct vpu_vb2_buffer {
 	dma_addr_t chroma_u;
 	dma_addr_t chroma_v;
 	unsigned int state;
-	u32 tag;
 	u32 average_qp;
+	s32 fs_id;
 };
 
 void vpu_writel(struct vpu_dev *vpu, u32 reg, u32 val);
diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
index 940e5bda5fa3..246b7d91d083 100644
--- a/drivers/media/platform/amphion/vpu_dbg.c
+++ b/drivers/media/platform/amphion/vpu_dbg.c
@@ -48,6 +48,7 @@ static char *vpu_stat_name[] = {
 	[VPU_BUF_STATE_READY] = "ready",
 	[VPU_BUF_STATE_SKIP] = "skip",
 	[VPU_BUF_STATE_ERROR] = "error",
+	[VPU_BUF_STATE_CHANGED] = "changed",
 };
 
 static inline const char *to_vpu_stat_name(int state)
@@ -164,6 +165,7 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 	for (i = 0; i < vb2_get_num_buffers(vq); i++) {
 		struct vb2_buffer *vb;
 		struct vb2_v4l2_buffer *vbuf;
+		struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
 
 		vb = vb2_get_buffer(vq, i);
 		if (!vb)
@@ -175,11 +177,21 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 		vbuf = to_vb2_v4l2_buffer(vb);
 
 		num = scnprintf(str, sizeof(str),
-				"capture[%2d] state = %10s, %8s\n",
+				"capture[%2d] state = %10s, %8s",
 				i, vb2_stat_name[vb->state],
 				to_vpu_stat_name(vpu_get_buffer_state(vbuf)));
 		if (seq_write(s, str, num))
 			return 0;
+
+		if (vpu_buf->fs_id >= 0) {
+			num = scnprintf(str, sizeof(str), "; fs %d", vpu_buf->fs_id);
+			if (seq_write(s, str, num))
+				return 0;
+		}
+
+		num = scnprintf(str, sizeof(str), "\n");
+		if (seq_write(s, str, num))
+			return 0;
 	}
 
 	num = scnprintf(str, sizeof(str), "sequence = %d\n", inst->sequence);
diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 45707931bc4f..74668fa362e2 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -501,14 +501,25 @@ static int vpu_vb2_queue_setup(struct vb2_queue *vq,
 		call_void_vop(inst, release);
 	}
 
+	if (V4L2_TYPE_IS_CAPTURE(vq->type))
+		call_void_vop(inst, reset_frame_store);
+
 	return 0;
 }
 
 static int vpu_vb2_buf_init(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
+	struct vpu_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
 
+	vpu_buf->fs_id = -1;
 	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
+
+	if (!inst->ops->attach_frame_store || V4L2_TYPE_IS_OUTPUT(vb->type))
+		return 0;
+
+	call_void_vop(inst, attach_frame_store, vb);
 	return 0;
 }
 
-- 
2.43.0-rc1


