Return-Path: <linux-media+bounces-21713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E18C9D46B6
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 05:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9624E1F225EF
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 04:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95D51CB339;
	Thu, 21 Nov 2024 04:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RLwkEoLe"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46E71531E2;
	Thu, 21 Nov 2024 04:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732163175; cv=none; b=k0+FRveRf8SABU+yb86lvKNMpMbjYq+N87vm8RARaMfTo6cMpTZJ2+YHy1owF0wJkbJJZ6tTFF3BjRr/E7zcVNNeoxhSKwsjp8XEvTFev/VAcU/0xRcNIAutHz3vyucg8YKFczpFi+ZnBiNQalD2c0RLTclkhdr+vA7t5Dk00BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732163175; c=relaxed/simple;
	bh=tG+OlYIQDNka6IgdzKgibIBFy3nRYcFvzflPC4gFcoE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NpBXsBxbDLzDf4+G75s9cZsWxXs/EaH1HiyXzlGeIKca01dGE8hY4wLBJs5a3J4EI5/BBhar9c29vSVqAy4tr2uCWrPsJoWWQ5t50ny+BEuLMnWG2tUL4cq7gfYKIHnzsM2hwEruwYSzRGJaax8D7Q6pi+dyJP2AeEvmeUtWZwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=RLwkEoLe; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b93fe464a7c011efbd192953cf12861f-20241121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TObNgCpqKWmaGnqLV7GpN/33WKql07KB4LNAUUXxi9o=;
	b=RLwkEoLetd1/7zI69XOlQo+CHWXkYnvuO0Cw8Tb/3o+PSZEKhjzYChmatYiybv/da/42W8YVd3wXz6It7GtRuSdzuwwKo2lj7kijYuA+gbkd1yxI17XEZnNP8ukV1if3A+mf6K1/+owhEPbofvCuhNC1bRTbhaJqAzaRr+XVzz0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:23310132-b145-4250-96af-05c32c901cfa,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:6c1c27b9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b93fe464a7c011efbd192953cf12861f-20241121
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1981771509; Thu, 21 Nov 2024 12:26:05 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 12:26:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 12:26:04 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Moudy
 Ho <moudy.ho@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 3/8] mailbox: mtk-cmdq: Add driver data to support for MT8196
Date: Thu, 21 Nov 2024 12:25:57 +0800
Message-ID: <20241121042602.32730-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

MT8196 has 4 hardware changes compared with the previous SoC,
which correspond to the 4 new driver data:

1. mminfra_offset: For GCE data plane control
   Since GCE has been moved into mminfra, GCE needs to append the
   mminfra offset to the DRAM address when accessing the DRAM.

2. gce_vm: For GCE hardware virtualization
   Currently, the first version of the mt8196 mailbox controller only
   requires setting the VM-related registers to enable the permissions
   of a host VM.

3. dma_mask_bit: For dma address bit control
   In order to avoid the hardware limitations of MT8196 accessing DRAM,
   GCE needs to configure the DMA address to be less than 35 bits.

4. subsys_num: For subsys ID validation
   In previous SoCs, most hardware supported the 5-bit GCE subsys ID.
   When GCE executed instructions, the corresponding hareware register
   could be found through the subsys ID.
   However, 8196 most hardware does not support subsys ID, so the
   subsys ID will be set to an invalid value that exceeds the max
   supported subsys ID.
   By defining subsys_num, which is the max supported subsys ID, to
   determine whether the subsys ID is supported.
   So that mtk-cmdq-helper can know how to program the command.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       | 107 +++++++++++++++++++++--
 include/linux/mailbox/mtk-cmdq-mailbox.h |   3 +
 2 files changed, 102 insertions(+), 8 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 4bff73532085..37ff34a11749 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -43,6 +43,17 @@
 #define GCE_CTRL_BY_SW				GENMASK(2, 0)
 #define GCE_DDR_EN				GENMASK(18, 16)
 
+#define GCE_VM_ID_MAP0			0x5018
+#define GCE_VM_MAP0_ALL_HOST			GENMASK(29, 0)
+#define GCE_VM_ID_MAP1			0x501c
+#define GCE_VM_MAP1_ALL_HOST			GENMASK(29, 0)
+#define GCE_VM_ID_MAP2			0x5020
+#define GCE_VM_MAP2_ALL_HOST			GENMASK(29, 0)
+#define GCE_VM_ID_MAP3			0x5024
+#define GCE_VM_MAP3_ALL_HOST			GENMASK(5, 0)
+#define GCE_VM_CPR_GSIZE		0x50c4
+#define GCE_VM_CPR_GSIZE_HSOT			GENMASK(3, 0)
+
 #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
 #define CMDQ_THR_ENABLED		0x1
 #define CMDQ_THR_DISABLED		0x0
@@ -87,11 +98,25 @@ struct cmdq {
 struct gce_plat {
 	u32 thread_nr;
 	u8 shift;
+	u64 mminfra_offset;
 	bool control_by_sw;
 	bool sw_ddr_en;
+	bool gce_vm;
+	u32 dma_mask_bit;
+	u8 subsys_num;
 	u32 gce_num;
 };
 
+static inline u32 cmdq_reg_shift_addr(u32 addr, const struct gce_plat *pdata)
+{
+	return ((addr + pdata->mminfra_offset) >> pdata->shift);
+}
+
+static inline u32 cmdq_reg_revert_addr(u32 addr, const struct gce_plat *pdata)
+{
+	return ((addr << pdata->shift) - pdata->mminfra_offset);
+}
+
 static void cmdq_sw_ddr_enable(struct cmdq *cmdq, bool enable)
 {
 	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
@@ -112,6 +137,38 @@ u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 }
 EXPORT_SYMBOL(cmdq_get_shift_pa);
 
+u64 cmdq_get_offset_pa(struct mbox_chan *chan)
+{
+	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
+
+	return cmdq->pdata->mminfra_offset;
+}
+EXPORT_SYMBOL(cmdq_get_offset_pa);
+
+bool cmdq_subsys_is_valid(struct mbox_chan *chan, u8 subsys)
+{
+	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
+
+	return (subsys < cmdq->pdata->subsys_num);
+}
+EXPORT_SYMBOL(cmdq_subsys_is_valid);
+
+bool cmdq_addr_need_offset(struct mbox_chan *chan, u32 addr)
+{
+	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
+
+	if (cmdq->pdata->mminfra_offset == 0)
+		return false;
+
+	/*
+	 * mminfra will recognize the addr that greater than the mminfra_offset
+	 * as a transaction to DRAM.
+	 * So the caller needs to append mminfra_offset for the true case.
+	 */
+	return (addr >= cmdq->pdata->mminfra_offset);
+}
+EXPORT_SYMBOL(cmdq_addr_need_offset);
+
 static int cmdq_thread_suspend(struct cmdq *cmdq, struct cmdq_thread *thread)
 {
 	u32 status;
@@ -143,6 +200,17 @@ static void cmdq_init(struct cmdq *cmdq)
 	u32 gctl_regval = 0;
 
 	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
+
+	if (cmdq->pdata->gce_vm) {
+		/* config cpr size for host vm */
+		writel(GCE_VM_CPR_GSIZE_HSOT, cmdq->base + GCE_VM_CPR_GSIZE);
+		/* config CPR_GSIZE before setting VM_ID_MAP to avoid data leakage */
+		writel(GCE_VM_MAP0_ALL_HOST, cmdq->base + GCE_VM_ID_MAP0);
+		writel(GCE_VM_MAP1_ALL_HOST, cmdq->base + GCE_VM_ID_MAP1);
+		writel(GCE_VM_MAP2_ALL_HOST, cmdq->base + GCE_VM_ID_MAP2);
+		writel(GCE_VM_MAP3_ALL_HOST, cmdq->base + GCE_VM_ID_MAP3);
+	}
+
 	if (cmdq->pdata->control_by_sw)
 		gctl_regval = GCE_CTRL_BY_SW;
 	if (cmdq->pdata->sw_ddr_en)
@@ -199,7 +267,7 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
 				prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
 	prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] =
 		(u64)CMDQ_JUMP_BY_PA << 32 |
-		(task->pa_base >> task->cmdq->pdata->shift);
+		cmdq_reg_shift_addr(task->pa_base, task->cmdq->pdata);
 	dma_sync_single_for_device(dev, prev_task->pa_base,
 				   prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
 
@@ -264,7 +332,7 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 	else
 		return;
 
-	curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) << cmdq->pdata->shift;
+	curr_pa = cmdq_reg_shift_addr(readl(thread->base + CMDQ_THR_CURR_ADDR), cmdq->pdata);
 
 	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
 				 list_entry) {
@@ -416,9 +484,9 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 		 */
 		WARN_ON(cmdq_thread_reset(cmdq, thread) < 0);
 
-		writel(task->pa_base >> cmdq->pdata->shift,
+		writel(cmdq_reg_shift_addr(task->pa_base, cmdq->pdata),
 		       thread->base + CMDQ_THR_CURR_ADDR);
-		writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->pdata->shift,
+		writel(cmdq_reg_shift_addr(task->pa_base + pkt->cmd_buf_size, cmdq->pdata),
 		       thread->base + CMDQ_THR_END_ADDR);
 
 		writel(thread->priority, thread->base + CMDQ_THR_PRIORITY);
@@ -426,10 +494,10 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 		writel(CMDQ_THR_ENABLED, thread->base + CMDQ_THR_ENABLE_TASK);
 	} else {
 		WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
-		curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) <<
-			cmdq->pdata->shift;
-		end_pa = readl(thread->base + CMDQ_THR_END_ADDR) <<
-			cmdq->pdata->shift;
+		curr_pa = cmdq_reg_revert_addr(readl(thread->base + CMDQ_THR_CURR_ADDR),
+					       cmdq->pdata);
+		end_pa = cmdq_reg_revert_addr(readl(thread->base + CMDQ_THR_END_ADDR),
+					      cmdq->pdata);
 		/* check boundary */
 		if (curr_pa == end_pa - CMDQ_INST_SIZE ||
 		    curr_pa == end_pa) {
@@ -663,6 +731,9 @@ static int cmdq_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	if (cmdq->pdata->dma_mask_bit)
+		dma_set_coherent_mask(dev, DMA_BIT_MASK(cmdq->pdata->dma_mask_bit));
+
 	cmdq->mbox.dev = dev;
 	cmdq->mbox.chans = devm_kcalloc(dev, cmdq->pdata->thread_nr,
 					sizeof(*cmdq->mbox.chans), GFP_KERNEL);
@@ -736,6 +807,7 @@ static const struct gce_plat gce_plat_mt6779 = {
 	.thread_nr = 24,
 	.shift = 3,
 	.control_by_sw = false,
+	.subsys_num = 30,
 	.gce_num = 1
 };
 
@@ -743,6 +815,7 @@ static const struct gce_plat gce_plat_mt8173 = {
 	.thread_nr = 16,
 	.shift = 0,
 	.control_by_sw = false,
+	.subsys_num = 4,
 	.gce_num = 1
 };
 
@@ -750,6 +823,7 @@ static const struct gce_plat gce_plat_mt8183 = {
 	.thread_nr = 24,
 	.shift = 0,
 	.control_by_sw = false,
+	.subsys_num = 30,
 	.gce_num = 1
 };
 
@@ -758,6 +832,7 @@ static const struct gce_plat gce_plat_mt8186 = {
 	.shift = 3,
 	.control_by_sw = true,
 	.sw_ddr_en = true,
+	.subsys_num = 30,
 	.gce_num = 1
 };
 
@@ -765,6 +840,7 @@ static const struct gce_plat gce_plat_mt8188 = {
 	.thread_nr = 32,
 	.shift = 3,
 	.control_by_sw = true,
+	.subsys_num = 26,
 	.gce_num = 2
 };
 
@@ -772,6 +848,7 @@ static const struct gce_plat gce_plat_mt8192 = {
 	.thread_nr = 24,
 	.shift = 3,
 	.control_by_sw = true,
+	.subsys_num = 30,
 	.gce_num = 1
 };
 
@@ -779,6 +856,19 @@ static const struct gce_plat gce_plat_mt8195 = {
 	.thread_nr = 24,
 	.shift = 3,
 	.control_by_sw = true,
+	.subsys_num = 26,
+	.gce_num = 2
+};
+
+static const struct gce_plat gce_plat_mt8196 = {
+	.thread_nr = 32,
+	.shift = 3,
+	.mminfra_offset = 0x80000000, /* 2GB */
+	.control_by_sw = true,
+	.sw_ddr_en = true,
+	.gce_vm = true,
+	.dma_mask_bit = 35,
+	.subsys_num = 30,
 	.gce_num = 2
 };
 
@@ -790,6 +880,7 @@ static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt8188-gce", .data = (void *)&gce_plat_mt8188},
 	{.compatible = "mediatek,mt8192-gce", .data = (void *)&gce_plat_mt8192},
 	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_mt8195},
+	{.compatible = "mediatek,mt8196-gce", .data = (void *)&gce_plat_mt8196},
 	{}
 };
 MODULE_DEVICE_TABLE(of, cmdq_of_ids);
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index a8f0070c7aa9..f30023db4dbf 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -79,5 +79,8 @@ struct cmdq_pkt {
 };
 
 u8 cmdq_get_shift_pa(struct mbox_chan *chan);
+u64 cmdq_get_offset_pa(struct mbox_chan *chan);
+bool cmdq_subsys_is_valid(struct mbox_chan *chan, u8 subsys);
+bool cmdq_addr_need_offset(struct mbox_chan *chan, u32 addr);
 
 #endif /* __MTK_CMDQ_MAILBOX_H__ */
-- 
2.43.0


