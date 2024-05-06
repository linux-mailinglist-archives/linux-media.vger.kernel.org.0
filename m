Return-Path: <linux-media+bounces-10842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C69D8BCA04
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 10:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26737283C87
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 08:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B061428F0;
	Mon,  6 May 2024 08:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="WkgTHzhh"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2050.outbound.protection.outlook.com [40.107.6.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD65142658;
	Mon,  6 May 2024 08:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714985404; cv=fail; b=JVIk76ozptywYIZ4qumyfNSN8nOV0apnKrxMMThYXoQ4maRz7DMnzg0XIRKqMUPLwWtpnI4Gw+tKTOFL8+LLxsM6QHZ3R+Fd4Ym5rg4a8lQAQNzZrIQH93hk5993VWmGFwfXQeY1vfXBS0Fk8ku1G77MB7FfdOS7vIlyoa87YM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714985404; c=relaxed/simple;
	bh=XjNR3bDqFG473MatK6R+ix7Ix1cQ1mZXNLl1MXtxeLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rtVOAI2Fw8S7nXW9LBFyG8+ho201hxAH5vsaCkSITOjChfVW5d176A2tpw1/mmcQ/APk+z3O1XVayD4IGlepCflzgao216ikvZpleIw3d0CMX+wWewInxDZh6DyR7+qVs7lyVlJoz0o2XJgL+SJiyihhRXAyCOEyF7ttIP1Qu74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=WkgTHzhh; arc=fail smtp.client-ip=40.107.6.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPH/uXmkbjw4Wf5Nj9qR53zEbTsm/awhPEONI0lvECsRQlxGY9OLJI68sFfe2tTvP/shwWDI9bsNG19s71phf7+Jb1a+bdHouJWkHzTMG0mrG69SynmC/gjaaCnH1k7tu6EA8ZBhry8f1uPvbSpzDB0U8h/K7HOBuKIZJc+lHa9uj0qNekWdvg18HAwffqA5VenMv1d2qAYzjEdhiQmYO1/MJpwjMetyK5jxsDcNE0Iz23zN+r6wuCAeLl9EBjWQCJRssN/e5/097ABJGNAoNdn2LRMmXLDTGqBlVqjgrmPFK7WRNJqfyDBzrNnGm7LJTMtdTQBUP6MoVVwFR8xBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1IykQN+7zxh/rSx1K34XsiQKrkUGKubvULsgDaJIm4=;
 b=hTHKQIcz5u+kJgabhFwIEeBELOCE2MPt6uTvA3rKuQqAx6iH2fH8BxHaEibpgWgSQiy6VrzaWmLF9bA5MSm8sYQNp6FlprQyPjYwz9zSWtD/P7aF+gyJGceWihIyUFyR8UkMgZbnRlGhY/v4i4y2aAaOlx8IMSkKzazGDxny5Q903Q/5rbvNiMcFNAvMkXmLvzijmG08vPxrcR/AxWELGCqyeYIzZsR+kVItbp185xYcuU5hbXahSzkffSEq20fboI+fRMg2DE+H36XuKoEWP9BLvV+VsJcDAd37H9+77mTvfyeL1oM9GF15KduSxru85377oQ835a8fuGAGpt332g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1IykQN+7zxh/rSx1K34XsiQKrkUGKubvULsgDaJIm4=;
 b=WkgTHzhh3+2N8xFYvbnOpFbcj8RQtD7BsATsObRgWq2UFpJvAosX2sFDLU4pRN3+W20+D0BrCwvuLDQ9QfielwEGCT50ju1Ijl8qEj2xuSRu/LdHXZ0U0UNcYbpc6wWV4NxqlUpA70oX/GcVmk66DH/FjeqcPv99G24CGb1Fcn4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM8PR04MB7812.eurprd04.prod.outlook.com (2603:10a6:20b:245::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 08:49:59 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::8589:eb00:ecf3:b4ca]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::8589:eb00:ecf3:b4ca%6]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 08:49:59 +0000
From: Ming Qian <ming.qian@nxp.com>
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
Subject: [PATCH v3 3/3] media: amphion: Report the average QP of current encoded frame
Date: Mon,  6 May 2024 17:49:18 +0900
Message-ID: <20240506084918.799544-3-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20240506084918.799544-1-ming.qian@nxp.com>
References: <20240506084918.799544-1-ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0178.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::34) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM8PR04MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: 126284e8-b5e9-446f-a527-08dc6da98300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|1800799015|7416005|376005|52116005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MtJafDPqbJrzqdbGElyheUgrDQ0Mn03bKBXFtwIkeXbvC3hkZTRIiNl82dfa?=
 =?us-ascii?Q?xoDQbKOP3/sor8w3Ie7Tfjji8tId1eHq6Hr2egi02z02xUhiULCzdGODyLwK?=
 =?us-ascii?Q?CrnfcQi9rhALC1cistNxfBIQt68RcXW4PcRnMmTtJqctMehs+1qOdPdBIIuO?=
 =?us-ascii?Q?p9eJ1qGJoG11bVL/gW3q9pQe9t+5f5bm5U9l+Xx0fho01goHnh51kHI0FKVK?=
 =?us-ascii?Q?jvToCzFiQBjcEdvrr58itJwJVgWnyoHR/w2Lq98c6OFHIto6AAHfcjCuf3sP?=
 =?us-ascii?Q?yDgavfqDBbGEsTDzqwRqxUI4CtBGbrwjs6KrBdu+XusU4kfVc7Ycddc10tH7?=
 =?us-ascii?Q?BFLVCVErzZFhJ4p7HH2mTuVjocwapojrem4ZapG719UQ+k93T+nNuSC9aYWQ?=
 =?us-ascii?Q?yZ6R7pFC5sl1RVcr74bPjtNEpNFmTJC4LdMrwLF/DfSeCgJgQhBKT7zOEe1Q?=
 =?us-ascii?Q?U5BV7NF3/+xdsDEXZYwWE9vhWnI9DEwvhI2zkO8SPwbMbRIjfi5ntCPu2rhz?=
 =?us-ascii?Q?T+31iDGAFsT6djjimfISuYxDCIdFHnm2Mnz4bIUms09rw+/0ItSFgjhm9wsq?=
 =?us-ascii?Q?Jm9Epbxf2d0SD2OUXwO5zcG7tu0QB/3IpBU42RPbJjVE5ZpviYb6yQuCD/XJ?=
 =?us-ascii?Q?F79NS63193/D+5J9eIs/tTAFs7zAXwHAlVi6YPMZQwgXdgpH4/5RigGG7KP4?=
 =?us-ascii?Q?1/2KIDBhckT6Y8k+S1UTlzTTjWnpvwppnoVfrpYbcdyNMxfmGN0SklVyPT1Y?=
 =?us-ascii?Q?Y26gptj+NorzD4s7NE/S+C2rp2cTSHoeudv5RwI5/hIOsEOJPSXTBLruf2Eu?=
 =?us-ascii?Q?TSlmb//kP3XdEYqOQ0gMday2iLsO0XXhcWQk8At7yoRSFvuXMlszpVdKnMXA?=
 =?us-ascii?Q?Jr9r6RxSW/psI1NiDQLPxgTfgVquxHOmNoVr+bTW7nuCbPvE/fnnZN3X+I4g?=
 =?us-ascii?Q?vCtW3IZHBX7gl2y4F7swjumEiSDARda51ivjcAlCKHgqvlw/5LnUjMoNW5hS?=
 =?us-ascii?Q?KKBx/wEoULRJWeJrEXg3PWnzFicpZBsAOjZlNDrhVLShDFNVX+Ux09FS89sm?=
 =?us-ascii?Q?x+gqF+9nqEWCmSTLqnEBbdjQN5EkOlxUkWvagKT3xI3RvLG67Yl+8eQVtJ43?=
 =?us-ascii?Q?DV1cCx0uSrmrm2+YR4wb628YbPGEa2T5N5wS9IKmd9f1iGC6YraDUOfrCs7t?=
 =?us-ascii?Q?C+E7WssqBBSdldTLCjrfN9I/MFW8NlCQ8DQ/JqXWZDlNNSdu3w3CKtCjAJW0?=
 =?us-ascii?Q?ab1iz91/V+TcyX6kG4ME+3ySV7UewJN9q7ZVZ68GeRlpl1NapZ4yDnBXDz0x?=
 =?us-ascii?Q?59HJxsQjZUz+fiztRB4Lkql3y+TtZQ+DswcsWHoqTWBb9Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ta4tvBo71BF9YEGLLNz4ZOrzX54dYQ1tSQBPR1pv1UWR4m1ZfIgBqLaB8H1l?=
 =?us-ascii?Q?h3/4dEwO6SBiZglum+iWALCM/m4iOPcVunZdgtLSvivDoEHgDLiC5+yK/n5Y?=
 =?us-ascii?Q?+imufShDat+h7noBk7vWJEfQtjqxYaY7ksIv4dWwX10qawjIk1OHNAuMvZKS?=
 =?us-ascii?Q?+Hvyt45eIIL8c4AEUlAwk0REvzdSplsmK/hZm8gYeMxOHZLJOl7BQs1mwf2k?=
 =?us-ascii?Q?GhDYg8to0qbRmj99sSuzpUIOYTQT0+XJ1caw+yuB4DWXyto09kHNsSXOs2dU?=
 =?us-ascii?Q?aKkPo24jHyNk36fvYv26BtD/OTi5wj3q7+iUZzVP/LUZVASxqn94mlZ66OY7?=
 =?us-ascii?Q?5GFlQCD5ZaKxFAOZgc5OjE19q8Ekx5cc04MAtOMZlc7rh+a+Ohqsa95Y1AnJ?=
 =?us-ascii?Q?2LVXDIYdQwt0w/WsInQX7M0eW8tgicVsk1S1zaYQoy/FoX8EvUipgMWLgGqL?=
 =?us-ascii?Q?63FlHl2PDn+QAEgJXuEsk6TwvQUrIxoMtNPwB4aeWTdzRRT8GoNcc1QSSCHN?=
 =?us-ascii?Q?LuoJEfSNhnUqU3fIXZeMooKq3A9Af53Qp92tF3cK8lyQptrUm1PJOMFVjZaS?=
 =?us-ascii?Q?r+CKbI4dZqiIEXVdTyuDoqk7sHHhLdXPFg5LBK5EEm/2vTADFDmIz5QMidxI?=
 =?us-ascii?Q?QWgpX/lzzdx9jNY8KiOP0YKQCSVpd5b1hzIjlpQWWGDnfk7GNbZtXZ3MMscv?=
 =?us-ascii?Q?Bsbh0FV+t+UrZ4pmaATRxEPa0lUdazfeiJTB0iJgMLQB8TWPHnh4O1MKOUg+?=
 =?us-ascii?Q?sW5SheF66qaAwlOb5Sv0HVUpKJEA5MOEoU91Zk8vAWEwNTibuY8+vgBPdkAp?=
 =?us-ascii?Q?3zZC/kpdKUGkMc7qK/rs0uKtPlz0WcyKU357cKR2DJmiX9gNWeU/VUsqJwWM?=
 =?us-ascii?Q?YLIHPx+b9zHnAJxpSSNHwIVFIS9pDh5Ld4X11BggS+UyLAdUM+LPqJz2d9s+?=
 =?us-ascii?Q?bNBVo7akebssyAE5Y/GKpAnCDjAI5sL8LwXvKE8in62srFva3p/ChNRRpBE8?=
 =?us-ascii?Q?DENqlaZpPNNOirUC9nPB4meHm0rQtXh7QD4QzUU7HS1d8C5ZH6vU6LhvqjEd?=
 =?us-ascii?Q?fAeFAssVB2sBbwRu/xWDCwnQDfuD71KBwfjuV39sTorq/CqAGUL9axJs510f?=
 =?us-ascii?Q?B/6mUpEYHpN6Rf5uyujwhkP1SvPQ+FbzZ+9evJWkadcmL8zU0JR2Lo5Yf189?=
 =?us-ascii?Q?Tgu8zvJUr0AGy/SDNU194CIxIhvdqdHP+Pd5XDlskwPm4gOD75KWGOfsGz3N?=
 =?us-ascii?Q?JRz+K05bsPYWZLJFpJCkXpOIofiziuy465jxA5QqaS/yuONp6jvxHQPGvn8J?=
 =?us-ascii?Q?mlNmCQW3BYslkoctyorOYpZL3U9dPmEMGgdR1i/3znZ56s/3cPw7W4ga/5Ze?=
 =?us-ascii?Q?ZQ5iHJ4oEFd2gBvIs3XJskQrKJ65SsSE/xiYT8uxfH/nGrOl9cVu0YpN9m30?=
 =?us-ascii?Q?n8EZYiPJ9C5G5BAEoTbAxnTdiec7J1k0lNrvMcQvOR44H9FXqMuINp8F7idn?=
 =?us-ascii?Q?SQSgYcD105feHbI49cmV7udoRcbUZyUBCRwHc0KJQi1v5awRCpp7er9xoLG0?=
 =?us-ascii?Q?EDnc66MEm0o8gd5Ut9t0BBAANN27bCQ/IW2dLpJ1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 126284e8-b5e9-446f-a527-08dc6da98300
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 08:49:59.6660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8TgrOg8eo8Jg76T5v0UgtSeyDyB7F6OSxQkypLcBDCXYA/j6uUb6GdpxzEOsqVIqhFSQbQa72W0M/qNVMQGRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7812

Report the average QP value of current encoded frame via the control
V4L2_CID_MPEG_VIDEO_AVERAGE_QP, the value applies to the last dequeued
capture buffer.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
---
v3
- adjust patch order

v2
 - drop the volatile flag

 drivers/media/platform/amphion/venc.c        |  4 ++++
 drivers/media/platform/amphion/vpu.h         |  1 +
 drivers/media/platform/amphion/vpu_defs.h    |  1 +
 drivers/media/platform/amphion/vpu_v4l2.c    | 16 ++++++++++++++++
 drivers/media/platform/amphion/vpu_v4l2.h    |  1 +
 drivers/media/platform/amphion/vpu_windsor.c |  2 ++
 6 files changed, 25 insertions(+)

diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
index 16ed4d21519c..351b4edc8742 100644
--- a/drivers/media/platform/amphion/venc.c
+++ b/drivers/media/platform/amphion/venc.c
@@ -678,6 +678,9 @@ static int venc_ctrl_init(struct vpu_inst *inst)
 			       ~(1 << V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
 			       V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME);
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, NULL,
+			  V4L2_CID_MPEG_VIDEO_AVERAGE_QP, 0, 51, 1, 0);
+
 	if (inst->ctrl_handler.error) {
 		ret = inst->ctrl_handler.error;
 		v4l2_ctrl_handler_free(&inst->ctrl_handler);
@@ -817,6 +820,7 @@ static int venc_get_one_encoded_frame(struct vpu_inst *inst,
 	vbuf->field = inst->cap_format.field;
 	vbuf->flags |= frame->info.pic_type;
 	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
+	vpu_set_buffer_average_qp(vbuf, frame->info.average_qp);
 	dev_dbg(inst->dev, "[%d][OUTPUT TS]%32lld\n", inst->id, vbuf->vb2_buf.timestamp);
 	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 	venc->ready_count++;
diff --git a/drivers/media/platform/amphion/vpu.h b/drivers/media/platform/amphion/vpu.h
index 0246cf0ac3a8..22f0da26ccec 100644
--- a/drivers/media/platform/amphion/vpu.h
+++ b/drivers/media/platform/amphion/vpu.h
@@ -306,6 +306,7 @@ struct vpu_vb2_buffer {
 	dma_addr_t chroma_v;
 	unsigned int state;
 	u32 tag;
+	u32 average_qp;
 };
 
 void vpu_writel(struct vpu_dev *vpu, u32 reg, u32 val);
diff --git a/drivers/media/platform/amphion/vpu_defs.h b/drivers/media/platform/amphion/vpu_defs.h
index 7320852668d6..428d988cf2f7 100644
--- a/drivers/media/platform/amphion/vpu_defs.h
+++ b/drivers/media/platform/amphion/vpu_defs.h
@@ -114,6 +114,7 @@ struct vpu_enc_pic_info {
 	u32 wptr;
 	u32 crc;
 	s64 timestamp;
+	u32 average_qp;
 };
 
 struct vpu_dec_codec_info {
diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index c88738e8fff7..83db57bc80b7 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -63,6 +63,13 @@ unsigned int vpu_get_buffer_state(struct vb2_v4l2_buffer *vbuf)
 	return vpu_buf->state;
 }
 
+void vpu_set_buffer_average_qp(struct vb2_v4l2_buffer *vbuf, u32 qp)
+{
+	struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
+
+	vpu_buf->average_qp = qp;
+}
+
 void vpu_v4l2_set_error(struct vpu_inst *inst)
 {
 	vpu_inst_lock(inst);
@@ -539,6 +546,15 @@ static void vpu_vb2_buf_finish(struct vb2_buffer *vb)
 	struct vpu_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_queue *q = vb->vb2_queue;
 
+	if (V4L2_TYPE_IS_CAPTURE(vb->type)) {
+		struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
+		struct v4l2_ctrl *ctrl = v4l2_ctrl_find(&inst->ctrl_handler,
+							V4L2_CID_MPEG_VIDEO_AVERAGE_QP);
+
+		if (ctrl)
+			v4l2_ctrl_s_ctrl(ctrl, vpu_buf->average_qp);
+	}
+
 	if (vbuf->flags & V4L2_BUF_FLAG_LAST)
 		vpu_notify_eos(inst);
 
diff --git a/drivers/media/platform/amphion/vpu_v4l2.h b/drivers/media/platform/amphion/vpu_v4l2.h
index 60f43056a7a2..56f2939fa84d 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.h
+++ b/drivers/media/platform/amphion/vpu_v4l2.h
@@ -12,6 +12,7 @@ void vpu_inst_lock(struct vpu_inst *inst);
 void vpu_inst_unlock(struct vpu_inst *inst);
 void vpu_set_buffer_state(struct vb2_v4l2_buffer *vbuf, unsigned int state);
 unsigned int vpu_get_buffer_state(struct vb2_v4l2_buffer *vbuf);
+void vpu_set_buffer_average_qp(struct vb2_v4l2_buffer *vbuf, u32 qp);
 
 int vpu_v4l2_open(struct file *file, struct vpu_inst *inst);
 int vpu_v4l2_close(struct file *file);
diff --git a/drivers/media/platform/amphion/vpu_windsor.c b/drivers/media/platform/amphion/vpu_windsor.c
index 5f1101d7cf9e..e7d37aa4b826 100644
--- a/drivers/media/platform/amphion/vpu_windsor.c
+++ b/drivers/media/platform/amphion/vpu_windsor.c
@@ -499,6 +499,7 @@ struct windsor_pic_info {
 	u32 proc_dacc_rng_wr_cnt;
 	s32 tv_s;
 	u32 tv_ns;
+	u32 average_qp;
 };
 
 u32 vpu_windsor_get_data_size(void)
@@ -734,6 +735,7 @@ static void vpu_windsor_unpack_pic_info(struct vpu_rpc_event *pkt, void *data)
 	info->wptr = get_ptr(windsor->str_buff_wptr);
 	info->crc = windsor->frame_crc;
 	info->timestamp = timespec64_to_ns(&ts);
+	info->average_qp = windsor->average_qp;
 }
 
 static void vpu_windsor_unpack_mem_req(struct vpu_rpc_event *pkt, void *data)
-- 
2.43.0-rc1


