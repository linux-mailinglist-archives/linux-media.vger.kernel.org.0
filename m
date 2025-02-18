Return-Path: <linux-media+bounces-26254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAE5A392EB
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 06:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A9FB3B3FEE
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 05:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181211D5165;
	Tue, 18 Feb 2025 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nVw3CoDR"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FADB1B4139;
	Tue, 18 Feb 2025 05:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739857460; cv=none; b=rI96bdO5zSDB4aHkj9CQs+TyS+nxR7LREoi6HVKcx/fY9mvNfCVms1RJrJcyQRXLLpAexaO5AK/Tb0ETmj6196ln7sWlWFP4fHnGIfoGX0olzq+fla4M5AI+2d387poa3PYthxpbKO8z0Ua/QV1uSeKh0qTiSF+hqe0PMkx6cG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739857460; c=relaxed/simple;
	bh=/MPdejGJTBEuh/yt/SwYib1UT4ZhDqnZBOc5GSkk2ns=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hSW07H7lMfUXAsJiTsLrLgdzH/XRxA6927dZitInCJomFFXc5or19390Qx7zHtQPfrGp4mhznKxMmyfiwJHCihkp35g8eW7+aCY5XRo2/Wtr+OIUuyb8Kf1CpLPA4Fk69mcDEXWr2zJXLfI1+FaYeDTZ5Mc1Ve2A3WvoemStLw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=nVw3CoDR; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5f094b02edbb11ef8eb9c36241bbb6fb-20250218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=N5e/5w3go2kcS3YoF9WOEQfKgMSGH9HMbkb2gJgiuEM=;
	b=nVw3CoDR8Rsj1bfU/W4GG2PL+1kxplYMl+OIKSz73AyG2NXJQqDfiWMxHLcQ4HpavbpD7CqR1TEWd9eACoKAZ1RXfOBd9wq8dkVdYtbGiY8fKOJIfZUb26KzB8Q+ZS8N+9/KALyG4i1s9VPgLCan45Q00bUr4XCzWTMz6kOk6n4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:90573f66-1c77-4f30-b6ef-360d5712e38a,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:34a67cd2-68f4-490a-aba6-6f94066fb2e3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1|
	19,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5f094b02edbb11ef8eb9c36241bbb6fb-20250218
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1716839077; Tue, 18 Feb 2025 13:44:08 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 18 Feb 2025 13:44:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 18 Feb 2025 13:44:06 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xavier Chang
	<xavier.chang@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v4 2/8] arm64: dts: mediatek: Add GCE header for MT8196
Date: Tue, 18 Feb 2025 13:41:47 +0800
Message-ID: <20250218054405.2017918-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add GCE header define for GCE Thread priority and GCE event IDs
that used in the MT8196 dtsi.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8196-gce.h | 612 ++++++++++++++++++++++
 1 file changed, 612 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-gce.h

diff --git a/arch/arm64/boot/dts/mediatek/mt8196-gce.h b/arch/arm64/boot/dts/mediatek/mt8196-gce.h
new file mode 100644
index 000000000000..067a67f82965
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8196-gce.h
@@ -0,0 +1,612 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) 2024 MediaTek Inc.
+ *
+ */
+
+#ifndef __DTS_GCE_MT8196_H
+#define __DTS_GCE_MT8196_H
+
+/* GCE Thread Priority
+ * The GCE core has multiple GCE threads, each of which can independently
+ * execute its own sequence of instructions.
+ * However, the GCE threads on the same core cannot run in parallel.
+ * Different GCE threads can determine thread priority based on the scenario,
+ * thereby serving different user needs.
+ *
+ * Low priority thread is executed when no high priority thread is active.
+ * Same priority thread is scheduled by round robin.
+ */
+#define CMDQ_THR_PRIO_LOWEST	0
+#define CMDQ_THR_PRIO_1		1
+#define CMDQ_THR_PRIO_2		2
+#define CMDQ_THR_PRIO_3		3
+#define CMDQ_THR_PRIO_4		4
+#define CMDQ_THR_PRIO_5		5
+#define CMDQ_THR_PRIO_6		6
+#define CMDQ_THR_PRIO_HIGHEST	7
+
+/*
+ * GCE0 Hardware Event IDs
+ * Different SoCs will have varying numbers of hardware event signals,
+ * which are sent from the corresponding hardware to the GCE.
+ * Each hardware event signal corresponds to an event ID in the GCE.
+ * The CMDQ driver can use the following event ID definitions to allow
+ * the client driver to use wait and clear APIs provided by CMDQ, enabling
+ * the GCE to execute operations in the instructions for that event ID.
+ *
+ * The event IDs of GCE0 are mainly used by display hardware.
+ */
+/* CMDQ_EVENT_DISP0_STREAM_SOF0 ~ 15: 0 ~ 15 */
+#define CMDQ_EVENT_DISP0_STREAM_SOF(n)						(0 + (n))
+/* CMDQ_EVENT_DISP0_FRAME_DONE_SEL0 ~ 15: 16 ~ 31 */
+#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL(n)					(16 + (n))
+#define CMDQ_EVENT_DISP0_DISP_WDMA0_TARGET_LINE_END_ENG_EVENT			32
+#define CMDQ_EVENT_DISP0_DISP_WDMA0_SW_RST_DONE_ENG_EVENT			33
+#define CMDQ_EVENT_DISP0_DISP_POSTMASK1_RST_DONE_ENG_EVENT			34
+#define CMDQ_EVENT_DISP0_DISP_POSTMASK0_RST_DONE_ENG_EVENT			35
+#define CMDQ_EVENT_DISP0_DISP_MUTEX0_TIMEOUT_ENG_EVENT				36
+/* CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT0 ~ 15: 37 ~ 52 */
+#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT(n)			(37 + (n))
+#define CMDQ_EVENT_DISP0_DISP_MUTEX0_GET_RELEASE_ENG_EVENT			53
+#define CMDQ_EVENT_DISP0_DISP_MDP_RDMA0_SW_RST_DONE_ENG_EVENT			54
+/* CMDQ_EVENT_DISP1_STREAM_SOF0 ~ 15: 55 ~ 70 */
+#define CMDQ_EVENT_DISP1_STREAM_SOF(n)						(55 + (n))
+/* CMDQ_EVENT_DISP1_FRAME_DONE_SEL0 ~ 15: 71 ~ 86 */
+#define CMDQ_EVENT_DISP1_FRAME_DONE_SEL(n)					(71 + (n))
+/* CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0 ~ 15: 87 ~ 102 */
+#define CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT(n)				(87 + (n))
+/* CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT0 ~ 15: 103 ~ 118 */
+#define CMDQ_EVENT_DISP1_REG_UPDATE_DONE_ENG_EVENT(n)				(103 + (n))
+#define CMDQ_EVENT_DISP1_OCIP_SUBSYS_SRAM_ISOINT_ENG_EVENT			119
+#define CMDQ_EVENT_DISP1_DISP_WDMA4_TARGET_LINE_END_ENG_EVENT			120
+#define CMDQ_EVENT_DISP1_DISP_WDMA4_SW_RST_DONE_ENG_EVENT			121
+#define CMDQ_EVENT_DISP1_DISP_WDMA3_TARGET_LINE_END_ENG_EVENT			122
+#define CMDQ_EVENT_DISP1_DISP_WDMA3_SW_RST_DONE_ENG_EVENT			123
+#define CMDQ_EVENT_DISP1_DISP_WDMA2_TARGET_LINE_END_ENG_EVENT			124
+#define CMDQ_EVENT_DISP1_DISP_WDMA2_SW_RST_DONE_ENG_EVENT			125
+#define CMDQ_EVENT_DISP1_DISP_WDMA1_TARGET_LINE_END_ENG_EVENT			126
+#define CMDQ_EVENT_DISP1_DISP_WDMA1_SW_RST_DONE_ENG_EVENT			127
+#define CMDQ_EVENT_DISP1_DISP_MUTEX0_TIMEOUT_ENG_EVENT				128
+#define CMDQ_EVENT_DISP1_DISP_MUTEX0_GET_RLZ_ENG_EVENT				129
+#define CMDQ_EVENT_DISP1_DISP_MDP_RDMA1_SW_RST_DONE_ENG_EVENT			130
+#define CMDQ_EVENT_DISP1_DISP_GDMA0_SW_RST_DONE_ENG_EVENT			131
+#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_VSYNC_START_ENG_EVENT		132
+#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_VSYNC_END_ENG_EVENT		133
+#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_VRR_VFP_LAST_SAFE_BLANK_ENG_EVENT	134
+#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_VFP_START_ENG_EVENT		135
+#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_VFP_LAST_LINE_ENG_EVENT		136
+#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_VDE_END_ENG_EVENT			137
+#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_TRIGGER_LOOP_CLR_ENG_EVENT	138
+#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_TARGET_LINE1_ENG_EVENT		139
+#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_INT_TG_TARGET_LINE0_ENG_EVENT		140
+#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_EXT_TG_VSYNC_START_ENG_EVENT		141
+#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_EXT_TG_VSYNC_END_ENG_EVENT		142
+#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_EXT_TG_VDE_START_ENG_EVENT		143
+#define CMDQ_EVENT_DISP1_DISP_DVO0_DVO_EXT_TG_VDE_END_ENG_EVENT			144
+/* CMDQ_EVENT_DISP1_DISP_DSI2_ENG_EVENT0 ~ 10: 145 ~ 155 */
+#define CMDQ_EVENT_DISP1_DISP_DSI2_ENG_EVENT(n)					(145 + (n))
+/* CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT0 ~ 21: 156 ~ 177 */
+#define CMDQ_EVENT_DISP1_DISP_DSI1_ENG_EVENT(n)					(156 + (n))
+/* CMDQ_EVENT_DISP1_DISP_DSI0_ENG_EVENT0 ~ 10: 178 ~ 188 */
+#define CMDQ_EVENT_DISP1_DISP_DSI0_ENG_EVENT(n)					(178 + (n))
+#define CMDQ_EVENT_DISP1_DISP_DP_INTF1_VSYNC_START_ENG_EVENT			189
+#define CMDQ_EVENT_DISP1_DISP_DP_INTF1_VSYNC_END_ENG_EVENT			190
+#define CMDQ_EVENT_DISP1_DISP_DP_INTF1_VDE_START_ENG_EVENT			191
+#define CMDQ_EVENT_DISP1_DISP_DP_INTF1_VDE_END_ENG_EVENT			192
+#define CMDQ_EVENT_DISP1_DISP_DP_INTF1_TARGET_LINE_ENG_EVENT			193
+#define CMDQ_EVENT_DISP1_DISP_DP_INTF0_VSYNC_START_ENG_EVENT			194
+#define CMDQ_EVENT_DISP1_DISP_DP_INTF0_VSYNC_END_ENG_EVENT			195
+#define CMDQ_EVENT_DISP1_DISP_DP_INTF0_VDE_START_ENG_EVENT			196
+#define CMDQ_EVENT_DISP1_DISP_DP_INTF0_VDE_END_ENG_EVENT			197
+#define CMDQ_EVENT_DISP1_DISP_DP_INTF0_TARGET_LINE_ENG_EVENT			198
+/* CMDQ_EVENT_DISP1_BUF_UNDERRUN_ENG_EVENT0 ~ 10: 199 ~ 209 */
+#define CMDQ_EVENT_DISP1_BUF_UNDERRUN_ENG_EVENT(n)				(199 + (n))
+/* CMDQ_EVENT_MML0_STREAM_SOF0 ~ 15: 210 ~ 225 */
+#define CMDQ_EVENT_MML0_STREAM_SOF(n)						(210 + (n))
+/* CMDQ_EVENT_MML0_FRAME_DONE_SEL0 ~ 15: 226 ~ 241 */
+#define CMDQ_EVENT_MML0_FRAME_DONE_SEL(n)					(226 + (n))
+/* CMDQ_EVENT_MML0_REG_UPDATE_DONE_ENG_EVENT0 ~ 15: 242 ~ 257 */
+#define CMDQ_EVENT_MML0_REG_UPDATE_DONE_ENG_EVENT(n)				(242 + (n))
+#define CMDQ_EVENT_MML0_MDP_WROT2_SW_RST_DONE_ENG_EVENT				258
+#define CMDQ_EVENT_MML0_MDP_WROT1_SW_RST_DONE_ENG_EVENT				259
+#define CMDQ_EVENT_MML0_MDP_WROT0_SW_RST_DONE_ENG_EVENT				260
+#define CMDQ_EVENT_MML0_MDP_RROT0_SW_RST_DONE_ENG_EVENT				261
+#define CMDQ_EVENT_MML0_MDP_RDMA2_SW_RST_DONE_ENG_EVENT				262
+#define CMDQ_EVENT_MML0_MDP_RDMA1_SW_RST_DONE_ENG_EVENT				263
+#define CMDQ_EVENT_MML0_MDP_RDMA0_SW_RST_DONE_ENG_EVENT				264
+#define CMDQ_EVENT_MML0_MDP_MERGE0_SW_RST_DONE_ENG_EVENT			265
+#define CMDQ_EVENT_MML0_DISP_MUTEX0_TIMEOUT_ENG_EVENT				266
+#define CMDQ_EVENT_MML0_DISP_MUTEX0_GET_RLZ_ENG_EVENT				267
+/* CMDQ_EVENT_MML1_STREAM_SOF0 ~ 15: 268 ~ 283 */
+#define CMDQ_EVENT_MML1_STREAM_SOF(n)						(268 + (n))
+/* CMDQ_EVENT_MML1_FRAME_DONE_SEL0 ~ 15: 284 ~ 299 */
+#define CMDQ_EVENT_MML1_FRAME_DONE_SEL(n)					(284 + (n))
+/* CMDQ_EVENT_MML1_REG_UPDATE_DONE_ENG_EVENT0 ~ 15: 300 ~ 315 */
+#define CMDQ_EVENT_MML1_REG_UPDATE_DONE_ENG_EVENT0				(300 + (n))
+#define CMDQ_EVENT_MML1_MDP_WROT2_SW_RST_DONE_ENG_EVENT				316
+#define CMDQ_EVENT_MML1_MDP_WROT1_SW_RST_DONE_ENG_EVENT				317
+#define CMDQ_EVENT_MML1_MDP_WROT0_SW_RST_DONE_ENG_EVENT				318
+#define CMDQ_EVENT_MML1_MDP_RROT0_SW_RST_DONE_ENG_EVENT				319
+#define CMDQ_EVENT_MML1_MDP_RDMA2_SW_RST_DONE_ENG_EVENT				320
+#define CMDQ_EVENT_MML1_MDP_RDMA1_SW_RST_DONE_ENG_EVENT				321
+#define CMDQ_EVENT_MML1_MDP_RDMA0_SW_RST_DONE_ENG_EVENT				322
+#define CMDQ_EVENT_MML1_MDP_MERGE0_SW_RST_DONE_ENG_EVENT			323
+#define CMDQ_EVENT_MML1_DISP_MUTEX0_TIMEOUT_ENG_EVENT				324
+#define CMDQ_EVENT_MML1_DISP_MUTEX0_GET_RLZ_ENG_EVENT				325
+/* CMDQ_EVENT_OVL0_STREAM_SOF0 ~ 15: 326 ~ 341 */
+#define CMDQ_EVENT_OVL0_STREAM_SOF(n)						(326 + (n))
+/* CMDQ_EVENT_OVL0_FRAME_DONE_SEL0 ~ 15: 342 ~ 357 */
+#define CMDQ_EVENT_OVL0_FRAME_DONE_SEL(n)					(342 + (n))
+#define CMDQ_EVENT_OVL0_OVL_UFBC_WDMA0_TARGET_LINE_END_ENG_EVENT		358
+#define CMDQ_EVENT_OVL0_OVL_MUTEX0_TIMEOUT_ENG_EVENT				359
+/* CMDQ_EVENT_OVL0_OVL_MUTEX0_REG_UPDATE_DONE_ENG_EVENT0 ~ 15: 360 ~ 375 */
+#define CMDQ_EVENT_OVL0_OVL_MUTEX0_REG_UPDATE_DONE_ENG_EVENT(n)			(360 + (n))
+#define CMDQ_EVENT_OVL0_OVL_MUTEX0_GET_RELEASE_ENG_EVENT			376
+#define CMDQ_EVENT_OVL0_OVL_MDP_RDMA1_SW_RST_DONE_ENG_EVENT			377
+#define CMDQ_EVENT_OVL0_OVL_MDP_RDMA0_SW_RST_DONE_ENG_EVENT			378
+#define CMDQ_EVENT_OVL0_OVL_EXDMA9_FRAME_RESET_DONE_ENG_EVENT			379
+#define CMDQ_EVENT_OVL0_OVL_EXDMA8_FRAME_RESET_DONE_ENG_EVENT			380
+#define CMDQ_EVENT_OVL0_OVL_EXDMA7_FRAME_RESET_DONE_ENG_EVENT			381
+#define CMDQ_EVENT_OVL0_OVL_EXDMA6_FRAME_RESET_DONE_ENG_EVENT			382
+#define CMDQ_EVENT_OVL0_OVL_EXDMA5_FRAME_RESET_DONE_ENG_EVENT			383
+#define CMDQ_EVENT_OVL0_OVL_EXDMA4_FRAME_RESET_DONE_ENG_EVENT			384
+#define CMDQ_EVENT_OVL0_OVL_EXDMA3_FRAME_RESET_DONE_ENG_EVENT			385
+#define CMDQ_EVENT_OVL0_OVL_EXDMA2_FRAME_RESET_DONE_ENG_EVENT			386
+#define CMDQ_EVENT_OVL0_OVL_EXDMA1_FRAME_RESET_DONE_ENG_EVENT			387
+#define CMDQ_EVENT_OVL0_OVL_EXDMA0_FRAME_RESET_DONE_ENG_EVENT			388
+#define CMDQ_EVENT_OVL0_OVL_DISP_WDMA1_TARGET_LINE_END_ENG_EVENT		389
+#define CMDQ_EVENT_OVL0_OVL_DISP_WDMA1_SW_RST_DONE_END_ENG_EVENT		390
+#define CMDQ_EVENT_OVL0_OVL_DISP_WDMA0_TARGET_LINE_END_ENG_EVENT		391
+#define CMDQ_EVENT_OVL0_OVL_DISP_WDMA0_SW_RST_DONE_END_ENG_EVENT		392
+#define CMDQ_EVENT_OVL0_OVL_BWM0_FRAME_RESET_DONE_ENG_EVENT			393
+/* CMDQ_EVENT_OVL1_STREAM_SOF0 ~ 15: 394 ~ 409 */
+#define CMDQ_EVENT_OVL1_STREAM_SOF(n)						(394 + (n))
+/* CMDQ_EVENT_OVL1_FRAME_DONE_SEL0 ~ 15: 410 ~ 425 */
+#define CMDQ_EVENT_OVL1_FRAME_DONE_SEL(n)					(410 + (n))
+#define CMDQ_EVENT_OVL1_OVL_UFBC_WDMA0_TARGET_LINE_END_ENG_EVENT		426
+#define CMDQ_EVENT_OVL1_OVL_MUTEX0_TIMEOUT_ENG_EVENT				427
+/* CMDQ_EVENT_OVL1_OVL_MUTEX0_REG_UPDATE_DONE_ENG_EVENT0 ~ 15: 428 ~ 443 */
+#define CMDQ_EVENT_OVL1_OVL_MUTEX0_REG_UPDATE_DONE_ENG_EVENT(n)			(428 + (n))
+#define CMDQ_EVENT_OVL1_OVL_MUTEX0_GET_RELEASE_ENG_EVENT			444
+#define CMDQ_EVENT_OVL1_OVL_MDP_RDMA1_SW_RST_DONE_ENG_EVENT			445
+#define CMDQ_EVENT_OVL1_OVL_MDP_RDMA0_SW_RST_DONE_ENG_EVENT			446
+#define CMDQ_EVENT_OVL1_OVL_EXDMA9_FRAME_RESET_DONE_ENG_EVENT			447
+#define CMDQ_EVENT_OVL1_OVL_EXDMA8_FRAME_RESET_DONE_ENG_EVENT			448
+#define CMDQ_EVENT_OVL1_OVL_EXDMA7_FRAME_RESET_DONE_ENG_EVENT			449
+#define CMDQ_EVENT_OVL1_OVL_EXDMA6_FRAME_RESET_DONE_ENG_EVENT			450
+#define CMDQ_EVENT_OVL1_OVL_EXDMA5_FRAME_RESET_DONE_ENG_EVENT			451
+#define CMDQ_EVENT_OVL1_OVL_EXDMA4_FRAME_RESET_DONE_ENG_EVENT			452
+#define CMDQ_EVENT_OVL1_OVL_EXDMA3_FRAME_RESET_DONE_ENG_EVENT			453
+#define CMDQ_EVENT_OVL1_OVL_EXDMA2_FRAME_RESET_DONE_ENG_EVENT			454
+#define CMDQ_EVENT_OVL1_OVL_EXDMA1_FRAME_RESET_DONE_ENG_EVENT			455
+#define CMDQ_EVENT_OVL1_OVL_EXDMA0_FRAME_RESET_DONE_ENG_EVENT			456
+#define CMDQ_EVENT_OVL1_OVL_DISP_WDMA1_TARGET_LINE_END_ENG_EVENT		457
+#define CMDQ_EVENT_OVL1_OVL_DISP_WDMA1_SW_RST_DONE_END_ENG_EVENT		458
+#define CMDQ_EVENT_OVL1_OVL_DISP_WDMA0_TARGET_LINE_END_ENG_EVENT		459
+#define CMDQ_EVENT_OVL1_OVL_DISP_WDMA0_SW_RST_DONE_END_ENG_EVENT		460
+#define CMDQ_EVENT_OVL1_OVL_BWM0_FRAME_RESET_DONE_ENG_EVENT			461
+#define CMDQ_EVENT_DPC_DT_DONE0							462
+#define CMDQ_EVENT_DPC_DT_DONE1							463
+#define CMDQ_EVENT_DPC_DT_DONE2_0_MERGE						464
+#define CMDQ_EVENT_DPC_DT_DONE2_1_MERGE						465
+#define CMDQ_EVENT_DPC_DT_DONE2_2_MERGE						466
+#define CMDQ_EVENT_DPC_DT_DONE2_3_MERGE						467
+#define CMDQ_EVENT_DPC_DT_DONE3							468
+#define CMDQ_EVENT_DPC_DT_DONE4_MERGE						469
+#define CMDQ_EVENT_DPC_DT_DONE5							470
+#define CMDQ_EVENT_DPC_DT_DONE6_0_MERGE						471
+#define CMDQ_EVENT_DPC_DT_DONE6_1_MERGE						472
+#define CMDQ_EVENT_DPC_DT_DONE6_2_MERGE						473
+#define CMDQ_EVENT_DPC_DT_DONE6_3_MERGE						474
+#define CMDQ_EVENT_DPC_DT_DONE7							475
+#define CMDQ_EVENT_DPC_DT_DONE32_MERGE						476
+#define CMDQ_EVENT_DPC_DT_DONE33						477
+#define CMDQ_EVENT_DPC_DT_DONE34_0						478
+#define CMDQ_EVENT_DPC_DT_DONE35						479
+#define CMDQ_EVENT_DPC_DISP_SSYS_DT_ERR_ON_BEFORE_OFF				480
+#define CMDQ_EVENT_DPC_DISP_SSYS_DT_ERR_PRETE_BEFORE_ON				481
+#define CMDQ_EVENT_DPC_DISP_DVFS_DT_ERR_ON_BEFORE_OFF				482
+#define CMDQ_EVENT_DPC_DISP_DVFS_DT_ERR_PRETE_BEFORE_ON				483
+#define CMDQ_EVENT_DPC_DISP_SB_DT_ERR_ON_BEFORE_OFF				484
+#define CMDQ_EVENT_DPC_DISP_SB_DT_ERR_PRETE_BEFORE_ON				485
+#define CMDQ_EVENT_DPC_DISP_SW_CONFIG_WHEN_MTCMOS_OFF				486
+#define CMDQ_EVENT_DPC_MML_SSYS_DT_ERR_ON_BEFORE_OFF				487
+#define CMDQ_EVENT_DPC_MML_SSYS_DT_ERR_PRETE_BEFORE_ON				488
+#define CMDQ_EVENT_DPC_MML_DVFS_DT_ERR_ON_BEFORE_OFF				489
+#define CMDQ_EVENT_DPC_MML_DVFS_DT_ERR_PRETE_BEFORE_ON				490
+#define CMDQ_EVENT_DPC_MML_SB_DT_ERR_ON_BEFORE_OFF				491
+#define CMDQ_EVENT_DPC_MML_SB_DT_ERR_PRETE_BEFORE_ON				492
+#define CMDQ_EVENT_DPC_MML_SW_CONFIG_WHEN_MTCMOS_OFF				493
+/* CMDQ_EVENT_DPTX_DPTX_EVENT0 ~ 3: 494 ~ 497 */
+#define CMDQ_EVENT_DPTX_DPTX_EVENT(n)						(494 + (n))
+/* CMDQ_EVENT_EDPTX_EDPTX_EVENT0 ~ 1: 498 ~ 499 */
+#define CMDQ_EVENT_EDPTX_EDPTX_EVENT(n)						(498 + (n))
+
+#define CMDQ_EVENT_DSI0_TE_I_DSI0_TE_I						898
+#define CMDQ_EVENT_DSI1_TE_I_DSI1_TE_I						899
+#define CMDQ_EVENT_DSI2_TE_I_DSI2_TE_I						900
+/* CMDQ_EVENT_POWEREVENT_GCE_EVENT_SUBSYS_PWR_ACK0 ~ 23: 901 ~ 924 */
+#define CMDQ_EVENT_POWEREVENT_GCE_EVENT_SUBSYS_PWR_ACK(n)			(901 + (n))
+/* CMDQ_EVENT_GCE_EVENT_DPTX_GCE_EVENT_DPTX0 ~ 1: 925 ~ 926 */
+#define CMDQ_EVENT_GCE_EVENT_DPTX_GCE_EVENT_DPTX(n)				(925 + (n))
+/* CMDQ_EVENT_GCE_EVENT_DPTX_P1_GCE_EVENT_DPTX_P10 ~ 1: 927 ~ 928 */
+#define CMDQ_EVENT_GCE_EVENT_DPTX_P1_GCE_EVENT_DPTX_P1(n)			(927 + (n))
+/* CMDQ_EVENT_GCE_EVENT_EDPTX_GCE_EVENT_EDPTX0 ~ 1: 929 ~ 930 */
+#define CMDQ_EVENT_GCE_EVENT_EDPTX_GCE_EVENT_EDPTX(n)				(929 + (n))
+#define CMDQ_EVENT_DSI3_TE_I_DSI3_TE_I						931
+#define CMDQ_EVENT_SPI0_FINISH_EVENT_DSI4_TE_I					932
+#define CMDQ_EVENT_SPI0_EVENT_EVENT_DSI5_TE_I					933
+
+/*
+ * GCE1 Hardware Event IDs
+ * Different SoCs will have varying numbers of hardware event signals,
+ * which are sent from the corresponding hardware to the GCE.
+ * Each hardware event signal corresponds to an event ID in the GCE.
+ * The CMDQ driver can use the following event ID definitions to allow
+ * the client driver to use wait and clear APIs provided by CMDQ, enabling
+ * the GCE to execute operations in the instructions for that event ID.
+ *
+ * The event IDs of GCE1 are mainly used by non-display hardware.
+ */
+#define CMDQ_EVENT_VENC3_VENC_RESERVED						0
+#define CMDQ_EVENT_VENC3_VENC_FRAME_DONE					1
+#define CMDQ_EVENT_VENC3_VENC_PAUSE_DONE					2
+#define CMDQ_EVENT_VENC3_JPGENC_DONE						3
+#define CMDQ_EVENT_VENC3_VENC_MB_DONE						4
+#define CMDQ_EVENT_VENC3_VENC_128BYTE_DONE					5
+#define CMDQ_EVENT_VENC3_JPGDEC_DONE						6
+#define CMDQ_EVENT_VENC3_JPGDEC_C1_DONE						7
+#define CMDQ_EVENT_VENC3_JPGDEC_INSUFF_DONE					8
+#define CMDQ_EVENT_VENC3_JPGDEC_C1_INSUFF_DONE					9
+#define CMDQ_EVENT_VENC3_WP_2ND_STAGE_DONE					10
+#define CMDQ_EVENT_VENC3_WP_3RD_STAGE_DONE					11
+#define CMDQ_EVENT_VENC3_PPS_HEADER_DONE					12
+#define CMDQ_EVENT_VENC3_SPS_HEADER_DONE					13
+#define CMDQ_EVENT_VENC3_VPS_HEADER_DONE					14
+#define CMDQ_EVENT_VENC3_VENC_SLICE_DONE					15
+#define CMDQ_EVENT_VENC3_VENC_SOC_SLICE_DONE					16
+#define CMDQ_EVENT_VENC3_VENC_SOC_FRAME_DONE					17
+
+#define CMDQ_EVENT_VENC2_VENC_FRAME_DONE					33
+#define CMDQ_EVENT_VENC2_VENC_PAUSE_DONE					34
+#define CMDQ_EVENT_VENC2_JPGENC_DONE						35
+#define CMDQ_EVENT_VENC2_VENC_MB_DONE						36
+#define CMDQ_EVENT_VENC2_VENC_128BYTE_DONE					37
+#define CMDQ_EVENT_VENC2_JPGDEC_DONE						38
+#define CMDQ_EVENT_VENC2_JPGDEC_C1_DONE						39
+#define CMDQ_EVENT_VENC2_JPGDEC_INSUFF_DONE					40
+#define CMDQ_EVENT_VENC2_JPGDEC_C1_INSUFF_DONE					41
+#define CMDQ_EVENT_VENC2_WP_2ND_STAGE_DONE					42
+#define CMDQ_EVENT_VENC2_WP_3RD_STAGE_DONE					43
+#define CMDQ_EVENT_VENC2_PPS_HEADER_DONE					44
+#define CMDQ_EVENT_VENC2_SPS_HEADER_DONE					45
+#define CMDQ_EVENT_VENC2_VPS_HEADER_DONE					46
+#define CMDQ_EVENT_VENC2_VENC_SLICE_DONE					47
+#define CMDQ_EVENT_VENC2_VENC_SOC_SLICE_DONE					48
+#define CMDQ_EVENT_VENC2_VENC_SOC_FRAME_DONE					49
+
+#define CMDQ_EVENT_VENC1_VENC_FRAME_DONE					65
+#define CMDQ_EVENT_VENC1_VENC_PAUSE_DONE					66
+#define CMDQ_EVENT_VENC1_JPGENC_DONE						67
+#define CMDQ_EVENT_VENC1_VENC_MB_DONE						68
+#define CMDQ_EVENT_VENC1_VENC_128BYTE_DONE					69
+#define CMDQ_EVENT_VENC1_JPGDEC_DONE						70
+#define CMDQ_EVENT_VENC1_JPGDEC_C1_DONE						71
+#define CMDQ_EVENT_VENC1_JPGDEC_INSUFF_DONE					72
+#define CMDQ_EVENT_VENC1_JPGDEC_C1_INSUFF_DONE					73
+#define CMDQ_EVENT_VENC1_WP_2ND_STAGE_DONE					74
+#define CMDQ_EVENT_VENC1_WP_3RD_STAGE_DONE					75
+#define CMDQ_EVENT_VENC1_PPS_HEADER_DONE					76
+#define CMDQ_EVENT_VENC1_SPS_HEADER_DONE					77
+#define CMDQ_EVENT_VENC1_VPS_HEADER_DONE					78
+#define CMDQ_EVENT_VENC1_VENC_SLICE_DONE					79
+#define CMDQ_EVENT_VENC1_VENC_SOC_SLICE_DONE					80
+#define CMDQ_EVENT_VENC1_VENC_SOC_FRAME_DONE					81
+
+#define CMDQ_EVENT_VDEC1_VDEC_LINE_CNT_INT					192
+#define CMDQ_EVENT_VDEC1_VDEC_INT						193
+#define CMDQ_EVENT_VDEC1_VDEC1_EVENT_2						194
+#define CMDQ_EVENT_VDEC1_VDEC_DEC_ERR						195
+#define CMDQ_EVENT_VDEC1_VDEC_BUSY_OVERFLOW					196
+#define CMDQ_EVENT_VDEC1_VDEC1_EVENT_5						197
+#define CMDQ_EVENT_VDEC1_VDEC_INI_FETCH_RDY					198
+#define CMDQ_EVENT_VDEC1_VDEC1_EVENT_7						199
+#define CMDQ_EVENT_VDEC1_VDEC1_EVENT_8						200
+#define CMDQ_EVENT_VDEC1_VDEC1_EVENT_9						201
+#define CMDQ_EVENT_VDEC1_VDEC1_EVENT_10						202
+#define CMDQ_EVENT_VDEC1_VDEC1_EVENT_11						203
+
+#define CMDQ_EVENT_VDEC1_VDEC_GCE_CNT_OP_THR					207
+
+#define CMDQ_EVENT_VDEC1_VDEC1_EVENT_32						224
+#define CMDQ_EVENT_VDEC1_VDEC_LAT_INT						225
+#define CMDQ_EVENT_VDEC1_VDEC1_EVENT_34						226
+#define CMDQ_EVENT_VDEC1_VDEC_LAT_DEC_ERR					227
+#define CMDQ_EVENT_VDEC1_VDEC_LAT_BUSY_OVERFLOW					228
+#define CMDQ_EVENT_VDEC1_VDEC1_EVENT_37						229
+#define CMDQ_EVENT_VDEC1_VDEC_LAT_INI_FETCH_RDY					230
+#define CMDQ_EVENT_VDEC1_VDEC1_EVENT_39						231
+#define CMDQ_EVENT_VDEC1_VDEC1_EVENT_40						232
+#define CMDQ_EVENT_VDEC1_VDEC1_EVENT_41						233
+#define CMDQ_EVENT_VDEC1_VDEC1_EVENT_42						234
+#define CMDQ_EVENT_VDEC1_VDEC1_EVENT_43						235
+
+#define CMDQ_EVENT_VDEC1_VDEC_LAT_GCE_CNT_OP_THR				239
+
+#define CMDQ_EVENT_IMG_IMG_EVENT_0						256
+/* CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_TRAW0_0 ~ 5: 257 ~  262 */
+#define CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_TRAW0(n)				(257 + (n))
+#define CMDQ_EVENT_IMG_TRAW0_DMA_ERR_EVENT					263
+#define CMDQ_EVENT_IMG_TRAW0_DUMMY_0						264
+/* CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_TRAW0_0 ~ 5: 265 ~ 270 */
+#define CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_TRAW0(n)				(265 + (n))
+#define CMDQ_EVENT_IMG_TRAW1_DMA_ERR_EVENT					271
+#define CMDQ_EVENT_IMG_ADL_TILE_DONE_EVENT					272
+#define CMDQ_EVENT_IMG_ADLWR0_TILE_DONE_EVENT					273
+#define CMDQ_EVENT_IMG_ADLWR1_TILE_DONE_EVENT					274
+#define CMDQ_EVENT_IMG_IMGSYS_IPE_ME_DONE					275
+#define CMDQ_EVENT_IMG_IMGSYS_IPE_MMG_DONE					276
+/* CMDQ_EVENT_IMG_QOF_ACK_EVENT0 ~ 19: 277 ~ 296 */
+#define CMDQ_EVENT_IMG_QOF_ACK_EVENT(n)						(277 + (n))
+/* CMDQ_EVENT_IMG_QOF_ON_EVENT0 ~ 4: 297 ~ 301 */
+#define CMDQ_EVENT_IMG_QOF_ON_EVENT(n)						(297 + (n))
+/* CMDQ_EVENT_IMG_QOF_OFF_EVENT0 ~ 4: 302 ~ 306 */
+#define CMDQ_EVENT_IMG_QOF_OFF_EVENT(n)						(302 + (n))
+/* CMDQ_EVENT_IMG_QOF_SAVE_EVENT0 ~ 4: 307 ~ 311 */
+#define CMDQ_EVENT_IMG_QOF_SAVE_EVENT(n)					(307 + (n))
+/* CMDQ_EVENT_IMG_QOF_RESTORE_EVENT0 ~ 4: 312 ~ 316 */
+#define CMDQ_EVENT_IMG_QOF_RESTORE_EVENT(n)					(312 + (n))
+/* CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_P20~5: 317 ~ 322 */
+#define CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_P2(n)					(317 + (n))
+#define CMDQ_EVENT_IMG_DIP_DMA_ERR_EVENT					323
+#define CMDQ_EVENT_IMG_DIP_NR_DMA_ERR_EVENT					324
+#define CMDQ_EVENT_IMG_DIP_DUMMY_0						325
+#define CMDQ_EVENT_IMG_WPE_EIS_GCE_FRAME_DONE					326
+#define CMDQ_EVENT_IMG_WPE_EIS_DONE_SYNC_OUT					327
+/* CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_P20 ~ 5: 328 ~ 333 */
+#define CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_P2(n)				(328 + (n))
+/* CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_P20 ~ 5: 334 ~ 339 */
+#define CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_P2(n)				(334 + (n))
+#define CMDQ_EVENT_IMG_PQA_DMA_ERR_EVENT					340
+/* CMDQ_EVENT_IMG_WPE0_DUMMY0~2: 341 ~ 343 */
+#define CMDQ_EVENT_IMG_WPE0_DUMMY(n)						(341 + (n))
+#define CMDQ_EVENT_IMG_OMC_TNR_GCE_FRAME_DONE					344
+#define CMDQ_EVENT_IMG_OMC_TNR_DONE_SYNC_OUT					345
+/* CMDQ_EVENT_IMG_OMC_TNR_CQ_THR_DONE_P20 ~ 5: 346 ~ 351 */
+#define CMDQ_EVENT_IMG_OMC_TNR_CQ_THR_DONE_P2(n)				(346 + (n))
+/* CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_P20 ~ 5: 352 ~ 357 */
+#define CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_P2(n)				(352 + (n))
+#define CMDQ_EVENT_IMG_PQB_DMA_ERR_EVENT					358
+/* CMDQ_EVENT_IMG_WPE1_DUMMY0 ~ 2: 359 ~ 361 */
+#define CMDQ_EVENT_IMG_WPE1_DUMMY(n)						(359 + (n))
+#define CMDQ_EVENT_IMG_WPE_LITE_GCE_FRAME_DONE					362
+#define CMDQ_EVENT_IMG_WPE_LITE_DONE_SYNC_OUT					363
+/* CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_P20 ~ 5: 364 ~ 369 */
+#define CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_P2(n)				(364 + (n))
+#define CMDQ_EVENT_IMG_OMC_LITE_GCE_FRAME_DONE					370
+#define CMDQ_EVENT_IMG_OMC_LITE_DONE_SYNC_OUT					371
+/* CMDQ_EVENT_IMG_OMC_LITE_CQ_THR_DONE_P20 ~ 5: 372 ~ 377 */
+#define CMDQ_EVENT_IMG_OMC_LITE_CQ_THR_DONE_P2(n)				(372 + (n))
+/* CMDQ_EVENT_IMG_WPE2_DUMMY0 ~ 2: 378 ~ 380 */
+#define CMDQ_EVENT_IMG_WPE2_DUMMY(n)						(378 + (n))
+#define CMDQ_EVENT_IMG_IMGSYS_IPE_FDVT0_DONE					381
+#define CMDQ_EVENT_IMG_IMG_EVENT_126						382
+#define CMDQ_EVENT_IMG_IMG_EVENT_127						383
+#define CMDQ_EVENT_CAM_CAM_EVENT_0						384
+#define CMDQ_EVENT_CAM_CAM_SUBA_SW_PASS1_DONE					385
+#define CMDQ_EVENT_CAM_CAM_SUBB_SW_PASS1_DONE					386
+#define CMDQ_EVENT_CAM_CAM_SUBC_SW_PASS1_DONE					387
+#define CMDQ_EVENT_CAM_CAM_SUBA_TFMR_PASS1_DONE					388
+#define CMDQ_EVENT_CAM_CAM_SUBB_TFMR_PASS1_DONE					389
+#define CMDQ_EVENT_CAM_CAM_SUBC_TFMR_PASS1_DONE					390
+/* CMDQ_EVENT_CAM_CAMSV_A_SW_PASS1_DONE0 ~ 3: 391 ~ 394 */
+#define CMDQ_EVENT_CAM_CAMSV_A_SW_PASS1_DONE(n)					(391 + (n))
+/* CMDQ_EVENT_CAM_CAMSV_B_SW_PASS1_DONE0 ~ 3: 395 ~ 398 */
+#define CMDQ_EVENT_CAM_CAMSV_B_SW_PASS1_DONE(n)					(395 + (n))
+/* CMDQ_EVENT_CAM_CAMSV_C_SW_PASS1_DONE0 ~ 3: 399 + 402 */
+#define CMDQ_EVENT_CAM_CAMSV_C_SW_PASS1_DONE(n)					(399 + (n))
+/* CMDQ_EVENT_CAM_CAMSV_D_SW_PASS1_DONE0 ~ 3: 403 ~ 406 */
+#define CMDQ_EVENT_CAM_CAMSV_D_SW_PASS1_DONE(n)					(403 + (n))
+/* CMDQ_EVENT_CAM_CAMSV_E_SW_PASS1_DONE0 ~ 3: 407 ~ 409 */
+#define CMDQ_EVENT_CAM_CAMSV_E_SW_PASS1_DONE(n)					(407 + (n))
+/* CMDQ_EVENT_CAM_CAMSV_F_SW_PASS1_DONE0 ~ 3: 411 ~ 413 */
+#define CMDQ_EVENT_CAM_CAMSV_F_SW_PASS1_DONE(n)					(411 + (n))
+#define CMDQ_EVENT_CAM_MRAW0_SW_PASS1_DONE					415
+#define CMDQ_EVENT_CAM_MRAW1_SW_PASS1_DONE					416
+#define CMDQ_EVENT_CAM_MRAW2_SW_PASS1_DONE					417
+#define CMDQ_EVENT_CAM_MRAW3_SW_PASS1_DONE					418
+#define CMDQ_EVENT_CAM_UISP_SW_PASS1_DONE					419
+#define CMDQ_EVENT_CAM_TG_MRAW0_OUT_SOF						420
+#define CMDQ_EVENT_CAM_TG_MRAW1_OUT_SOF						421
+#define CMDQ_EVENT_CAM_TG_MRAW2_OUT_SOF						422
+#define CMDQ_EVENT_CAM_TG_MRAW3_OUT_SOF						423
+#define CMDQ_EVENT_CAM_PDA0_IRQO_EVENT_DONE_D1					424
+#define CMDQ_EVENT_CAM_PDA1_IRQO_EVENT_DONE_D1					425
+#define CMDQ_EVENT_CAM_DPE_DVP_CMQ_EVENT					426
+#define CMDQ_EVENT_CAM_DPE_DVS_CMQ_EVENT					427
+#define CMDQ_EVENT_CAM_DPE_DVFG_CMQ_EVENT					428
+#define CMDQ_EVENT_CAM_CAM_EVENT_45						429
+#define CMDQ_EVENT_CAM_CAM_EVENT_46						430
+#define CMDQ_EVENT_CAM_CAM_EVENT_47						431
+#define CMDQ_EVENT_CAM_CAM_EVENT_48						432
+/* CMDQ_EVENT_CAM_CAM_SUBA_TG_INT1 ~ 4: 433 ~ 436 */
+#define CMDQ_EVENT_CAM_CAM_SUBA_TG_INT(n)					(433 + (n) - 1)
+/* CMDQ_EVENT_CAM_CAM_SUBB_TG_INT1 ~ 4: 437 ~ 440 */
+#define CMDQ_EVENT_CAM_CAM_SUBB_TG_INT(n)					(437 + (n) - 1)
+/* CMDQ_EVENT_CAM_CAM_SUBC_TG_INT1 ~ 4: 441 ~ 444 */
+#define CMDQ_EVENT_CAM_CAM_SUBC_TG_INT(n)					(441 + (n) - 1)
+#define CMDQ_EVENT_CAM_RAW_O_SOF_SUBA						445
+#define CMDQ_EVENT_CAM_RAW_O_SOF_SUBB						446
+#define CMDQ_EVENT_CAM_RAW_O_SOF_SUBC						447
+#define CMDQ_EVENT_CAM_TFMR_RAW_O_SOF_SUBA					448
+#define CMDQ_EVENT_CAM_TFMR_RAW_O_SOF_SUBB					449
+#define CMDQ_EVENT_CAM_TFMR_RAW_O_SOF_SUBC					450
+#define CMDQ_EVENT_CAM_RAW_SEL_SOF_UISP						451
+#define CMDQ_EVENT_CAM_CAM_SUBA_RING_BUFFER_OVERFLOW_INT_IN			452
+#define CMDQ_EVENT_CAM_CAM_SUBB_RING_BUFFER_OVERFLOW_INT_IN			453
+#define CMDQ_EVENT_CAM_CAM_SUBC_RING_BUFFER_OVERFLOW_INT_IN			454
+#define CMDQ_EVENT_CAM_CAM_EVENT_71						455
+#define CMDQ_EVENT_CAM_ADL_WR_FRAME_DONE					456
+#define CMDQ_EVENT_CAM_ADL_RD_FRAME_DONE					457
+#define CMDQ_EVENT_CAM_QOF_RAWA_POWER_ON_EVENT					458
+#define CMDQ_EVENT_CAM_QOF_RAWB_POWER_ON_EVENT					459
+#define CMDQ_EVENT_CAM_QOF_RAWC_POWER_ON_EVENT					460
+#define CMDQ_EVENT_CAM_QOF_RAWA_POWER_OFF_EVENT					461
+#define CMDQ_EVENT_CAM_QOF_RAWB_POWER_OFF_EVENT					462
+#define CMDQ_EVENT_CAM_QOF_RAWC_POWER_OFF_EVENT					463
+#define CMDQ_EVENT_CAM_QOF_RAWA_SAVE_EVENT					464
+#define CMDQ_EVENT_CAM_QOF_RAWB_SAVE_EVENT					465
+#define CMDQ_EVENT_CAM_QOF_RAWC_SAVE_EVENT					466
+#define CMDQ_EVENT_CAM_QOF_RAWA_RESTORE_EVENT					467
+#define CMDQ_EVENT_CAM_QOF_RAWB_RESTORE_EVENT					468
+#define CMDQ_EVENT_CAM_QOF_RAWC_RESTORE_EVENT					469
+/* CMDQ_EVENT_CAM_QOF_CAM_EVENT0 ~ 11: 470 ~ 481 */
+#define CMDQ_EVENT_CAM_QOF_CAM_EVENT(n)						(470 + (n))
+/* CMDQ_EVENT_CAM_SENINF_CFG_DONE_EVENT0 ~ 11: 482 ~ 495 */
+#define CMDQ_EVENT_CAM_SENINF_CFG_DONE_EVENT(n)					(482 + (n))
+#define CMDQ_EVENT_CAM_CCU0_TO_GCE_NON_SEC_IRQ					496
+#define CMDQ_EVENT_CAM_CCU0_TO_GCE_SEC_IRQ					497
+#define CMDQ_EVENT_CAM_CCU0_TO_GCE_VM_IRQ					498
+#define CMDQ_EVENT_CAM_CCU0_TO_GCE_EXCH_VM_IRQ					499
+#define CMDQ_EVENT_CAM_CCU1_TO_GCE_NON_SEC_IRQ					500
+#define CMDQ_EVENT_CAM_CCU1_TO_GCE_SEC_IRQ					501
+#define CMDQ_EVENT_CAM_CCU1_TO_GCE_VM_IRQ					502
+#define CMDQ_EVENT_CAM_CCU1_TO_GCE_EXCH_VM_IRQ					503
+/* CMDQ_EVENT_CAM_I2C_CH2_EVENT0 ~ 4: 504 ~ 509 */
+#define CMDQ_EVENT_CAM_I2C_CH2_EVENT(n)						(504 + (n))
+#define CMDQ_EVENT_CAM_CAM_EVENT_125						509
+#define CMDQ_EVENT_CAM_CAM_EVENT_126						510
+#define CMDQ_EVENT_CAM_CAM_EVENT_127						511
+
+#define CMDQ_EVENT_SMI_EVENT_MMINFRA_SMI_MMSRAM_COMM_SMIASSER			898
+#define CMDQ_EVENT_SMI_EVENT_MMINFRA_SMI_MDP_COMM_SMIASSER			899
+#define CMDQ_EVENT_SMI_EVENT_MMINFRA_SMI_DISP_COMM_SMIASSER			900
+
+/*
+ * GCE Software Tokens
+ * Apart from the event IDs that are already bound to hardware event signals,
+ * the remaining event IDs can be used as software tokens.
+ * This allows the client driver to name and operate them independently,
+ * and their usage is the same as that of hardware events.
+ */
+/* Begin of GCE0 software token */
+/* Config thread notify trigger thread */
+#define CMDQ_SYNC_TOKEN_CONFIG_DIRTY			640
+/* Trigger thread notify config thread */
+#define CMDQ_SYNC_TOKEN_STREAM_EOF			641
+/* Block Trigger thread until the ESD check finishes */
+#define CMDQ_SYNC_TOKEN_ESD_EOF				642
+#define CMDQ_SYNC_TOKEN_STREAM_BLOCK			643
+/* Check CABC setup finish */
+#define CMDQ_SYNC_TOKEN_CABC_EOF			644
+/* VFP period token for Msync */
+#define CMDQ_SYNC_TOKEN_VFP_PERIOD			645
+/* Software sync token for dual display */
+#define CMDQ_SYNC_TOKEN_CONFIG_DIRTY_1			694
+#define CMDQ_SYNC_TOKEN_STREAM_EOF_1			695
+#define CMDQ_SYNC_TOKEN_ESD_EOF_1			696
+#define CMDQ_SYNC_TOKEN_STREAM_BLOCK_1			697
+#define CMDQ_SYNC_TOKEN_CABC_EOF_1			698
+
+/*
+ * GPR access tokens (for HW register backup)
+ * There are 15 32-bit GPR, form 3 GPR as a set
+ * (64-bit for address, 32-bit for value)
+ *
+ * CMDQ_SYNC_TOKEN_GPR_SET0 ~ 4: 700 ~ 704
+ */
+#define CMDQ_SYNC_TOKEN_GPR_SET(n)			(700 + (n))
+#define CMDQ_SYNC_TOKEN_TE_0				705
+#define CMDQ_SYNC_TOKEN_PREFETCH_TE_0			706
+#define CMDQ_SYNC_TOKEN_VIDLE_POWER_ON			707
+#define CMDQ_SYNC_TOKEN_CHECK_TRIGGER_MERGE		708
+
+/* Resource lock event to control resource in GCE thread */
+#define CMDQ_SYNC_RESOURCE_WROT0			710
+#define CMDQ_SYNC_RESOURCE_WROT1			711
+/* Hardware TRACE software token */
+#define CMDQ_SYNC_TOKEN_HW_TRACE_WAIT			712
+#define CMDQ_SYNC_TOKEN_HW_TRACE_LOCK			713
+/* Software sync token for dual display */
+#define CMDQ_SYNC_TOKEN_CONFIG_DIRTY_3			714
+#define CMDQ_SYNC_TOKEN_STREAM_EOF_3			715
+#define CMDQ_SYNC_TOKEN_ESD_EOF_3			716
+#define CMDQ_SYNC_TOKEN_STREAM_BLOCK_3			717
+#define CMDQ_SYNC_TOKEN_CABC_EOF_3			718
+/* End of GCE0 software token */
+
+/* Begin of GCE1 software token */
+/* CMDQ_SYNC_TOKEN_IMGSYS_POOL0 ~ 300: 512 ~ 812 */
+#define	CMDQ_SYNC_TOKEN_IMGSYS_POOL(n)			(512 + (n))
+/* ISP software token */
+#define CMDQ_SYNC_TOKEN_IMGSYS_WPE_EIS			813
+#define CMDQ_SYNC_TOKEN_IMGSYS_OMC_TNR			814
+#define CMDQ_SYNC_TOKEN_IMGSYS_WPE_LITE			815
+#define CMDQ_SYNC_TOKEN_IMGSYS_TRAW			816
+#define CMDQ_SYNC_TOKEN_IMGSYS_LTRAW			817
+#define CMDQ_SYNC_TOKEN_IMGSYS_XTRAW			818
+#define CMDQ_SYNC_TOKEN_IMGSYS_DIP			819
+#define CMDQ_SYNC_TOKEN_IMGSYS_PQDIP_A			820
+#define CMDQ_SYNC_TOKEN_IMGSYS_PQDIP_B			821
+#define CMDQ_SYNC_TOKEN_IPESYS_ME			822
+#define CMDQ_SYNC_TOKEN_APUSYS_APU			823
+#define CMDQ_SYNC_TOKEN_IMGSYS_VSS_TRAW			824
+#define CMDQ_SYNC_TOKEN_IMGSYS_VSS_LTRAW		825
+#define CMDQ_SYNC_TOKEN_IMGSYS_VSS_XTRAW		826
+#define CMDQ_SYNC_TOKEN_IMGSYS_VSS_DIP			827
+#define CMDQ_SYNC_TOKEN_IMGSYS_OMC_LITE			828
+/* IMG software token for QoS */
+#define CMDQ_SYNC_TOKEN_IMGSYS_QOS_LOCK			829
+/* IMG software token for Qof */
+#define CMDQ_SYNC_TOKEN_DIP_POWER_CTRL			830
+#define CMDQ_SYNC_TOKEN_DIP_TRIG_PWR_ON			831
+#define CMDQ_SYNC_TOKEN_DIP_PWR_ON			832
+#define CMDQ_SYNC_TOKEN_DIP_TRIG_PWR_OFF		833
+#define CMDQ_SYNC_TOKEN_DIP_PWR_OFF			834
+#define CMDQ_SYNC_TOKEN_DIP_PWR_HAND_SHAKE		835
+#define CMDQ_SYNC_TOKEN_TRAW_POWER_CTRL			836
+#define CMDQ_SYNC_TOKEN_TRAW_TRIG_PWR_ON		837
+#define CMDQ_SYNC_TOKEN_TRAW_PWR_ON			838
+#define CMDQ_SYNC_TOKEN_TRAW_TRIG_PWR_OFF		839
+#define CMDQ_SYNC_TOKEN_TRAW_PWR_OFF			840
+#define CMDQ_SYNC_TOKEN_TRAW_PWR_HAND_SHAKE		841
+/* End of GCE1 software token */
+
+/* Begin of common software token */
+/*
+ * Notify normal CMDQ there are some secure task done
+ * MUST NOT CHANGE, this token sync with secure world
+ */
+#define CMDQ_SYNC_SECURE_THR_EOF			940
+/* CMDQ use software token */
+#define CMDQ_SYNC_TOKEN_USER_0				941
+#define CMDQ_SYNC_TOKEN_USER_1				942
+#define CMDQ_SYNC_TOKEN_POLL_MONITOR			943
+#define CMDQ_SYNC_TOKEN_TPR_LOCK			942
+/* TZMP software token */
+#define CMDQ_SYNC_TOKEN_TZMP_DISP_WAIT			943
+#define CMDQ_SYNC_TOKEN_TZMP_DISP_SET			944
+#define CMDQ_SYNC_TOKEN_TZMP_ISP_WAIT			945
+#define CMDQ_SYNC_TOKEN_TZMP_ISP_SET			946
+#define CMDQ_SYNC_TOKEN_TZMP_AIE_WAIT			947
+#define CMDQ_SYNC_TOKEN_TZMP_AIE_SET			948
+#define CMDQ_SYNC_TOKEN_TZMP_ADL_WAIT			949
+#define CMDQ_SYNC_TOKEN_TZMP_ADL_SET			950
+/* PREBUILT software token */
+#define CMDQ_SYNC_TOKEN_PREBUILT_MDP_LOCK		951
+#define CMDQ_SYNC_TOKEN_PREBUILT_MML_LOCK		952
+#define CMDQ_SYNC_TOKEN_PREBUILT_VFMT_LOCK		953
+#define CMDQ_SYNC_TOKEN_PREBUILT_DISP_LOCK		954
+#define CMDQ_SYNC_TOKEN_DISP_VA_START			955
+#define CMDQ_SYNC_TOKEN_DISP_VA_END			956
+
+/*
+ * Event for GPR timer, used in sleep and poll with timeout
+ *
+ * CMDQ_TOKEN_GPR_TIMER_R0~15: 994 ~ 1009
+ */
+#define CMDQ_TOKEN_GPR_TIMER_R(n)			(994 + (n))
+/* End of common software token */
+
+#endif
-- 
2.43.0


