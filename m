Return-Path: <linux-media+bounces-46086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BC6C25F99
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 17:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 44DF94F78EA
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 16:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC162F6560;
	Fri, 31 Oct 2025 15:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BxwJrSrB"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DE62E8E00;
	Fri, 31 Oct 2025 15:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761926333; cv=none; b=p3xvC4lf3oYq7C1eDy9cWPveCzmij7+caq/noEcJ9IfNIZY3Jc2/KuyPwsUcuFBL05f6cDySlsyH7+8n6ldUTqjcjUuvm8Wl/w0bLaH7CMjV+tdB6kYOoOQpWYaVahVCbKYCrQoZQvIYyZEmC/y0lGUYFVYytZsrkWdQZePVJC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761926333; c=relaxed/simple;
	bh=h5RNEtSgJvdNhhPPdnuyMjpTlIVDbsIa91V+GhBJDKQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kbddm8j9+3ouB2vSClBquerEA3OzSvRk7mxmBEdOuzwaQ5Tzj57bE6O/XyEKa2NIsBc6EvZ3XnUAN5hnP9+ovSx95l4RIVT6tGZYPBM8Mg8H1xWUcgAi2uFU8Ni3p9jcU/qbVJ/ZaDySFwhi6VBW8jzCLcDSSEzuBRCKcItxl/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=BxwJrSrB; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 78ce0958b67211f0b33aeb1e7f16c2b6-20251031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=N+s08UDkslV26YtK+gc8ujVOn5d//WSt9TAVmnZFWOI=;
	b=BxwJrSrBZMnrt5kqq64GC6uglkURE/FzCQyO6C1UcgeHLLbQGCsoFtvw5/IYmHSfPXyU+byh1jWGyg6vM+Tfvi+2ZBTBqdaE3zIyj4G5fWUd5uT865Hur0dwsMnTB0kX+4GJ88o8XX/QkX4XWlnnOYNJuMMuHDFstJ47d4OS4yQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:915f67b8-71c2-4b63-ad2a-fbf7e727e25f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:3640c818-3399-4579-97ab-008f994989ea,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 78ce0958b67211f0b33aeb1e7f16c2b6-20251031
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1817838301; Fri, 31 Oct 2025 23:58:41 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 31 Oct 2025 23:58:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 31 Oct 2025 23:58:39 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xiandong
 Wang <xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>,
	Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH 3/9] mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
Date: Fri, 31 Oct 2025 23:56:31 +0800
Message-ID: <20251031155838.1650833-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
References: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The GCE hardware virtualization configuration supports the isolation of
GCE hardware resources across different OS environments. Each OS is
treated as a virtual machine (VM) for GCE purposes.
There are 6 VMs and 1 host VM. The host VM has main control over the
GCE virtualization settings for all VMs.

To properly access the GCE thread registers, it is necessary to
configure access permissions for specific GCE threads assigned to
different VMs.
Currently, since only the host VM is being used, it is required to
enable access permissions for all GCE threads for the host VM.

There are 2 VM configurations:
1. VM_ID_MAP
There are 4 registers to allocate 32 GCE threads across different VMs:
VM_ID_MAP0 for threads 0-9, VM_ID_MAP1 for threads 10-19,
VM_ID_MAP2 for threads 20-29, and VM_ID_MAP3 for threads 30-31.
Each thread has a 3-bit configuration, where setting all bits to 1
configures the thread for the host VM.

2. VM_CPR_GSIZE
It is used to allocate the CPR SRAM size to each VM. Each VM has 4-bit
configuration, where setting bit 0-3 to configures the size of host VM.
This setting must be configured before the VM configuration to prevent
resource leakage.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 48 ++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 95e8a5331b7c..a544108ddae7 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -43,6 +43,13 @@
 #define GCE_CTRL_BY_SW				GENMASK(2, 0)
 #define GCE_DDR_EN				GENMASK(18, 16)
 
+#define GCE_VM_ID_MAP(n)		(0x5018 + (n) / 10 * 4)
+#define GCE_VM_ID_MAP_THR_FLD_SHIFT(n)		((n) % 10 * 3)
+#define GCE_VM_ID_MAP_HOST_VM			GENMASK(2, 0)
+#define GCE_VM_CPR_GSIZE		0x50c4
+#define GCE_VM_CPR_GSIZE_FLD_SHIFT(vm_id)	((vm_id) * 4)
+#define GCE_VM_CPR_GSIZE_MAX			GENMASK(3, 0)
+
 #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
 #define CMDQ_THR_ENABLED		0x1
 #define CMDQ_THR_DISABLED		0x0
@@ -89,6 +96,7 @@ struct gce_plat {
 	u8 shift;
 	bool control_by_sw;
 	bool sw_ddr_en;
+	bool gce_vm;
 	u32 gce_num;
 };
 
@@ -120,6 +128,45 @@ u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 }
 EXPORT_SYMBOL(cmdq_get_shift_pa);
 
+static void cmdq_vm_init(struct cmdq *cmdq)
+{
+	int i;
+	u32 vm_cpr_gsize = 0, vm_id_map = 0;
+	u32 *vm_map = NULL;
+
+	if (!cmdq->pdata->gce_vm)
+		return;
+
+	vm_map = kcalloc(cmdq->pdata->thread_nr, sizeof(*vm_map), GFP_KERNEL);
+	if (!vm_map)
+		return;
+
+	/* only configure the max CPR SRAM size to host vm (vm_id = 0) currently */
+	vm_cpr_gsize = GCE_VM_CPR_GSIZE_MAX << GCE_VM_CPR_GSIZE_FLD_SHIFT(0);
+
+	/* set all thread mapping to host vm currently */
+	for (i = 0; i < cmdq->pdata->thread_nr; i++)
+		vm_map[i] = GCE_VM_ID_MAP_HOST_VM << GCE_VM_ID_MAP_THR_FLD_SHIFT(i);
+
+	/* set the amount of CPR SRAM to allocate to each VM */
+	writel(vm_cpr_gsize, cmdq->base + GCE_VM_CPR_GSIZE);
+
+	/* config CPR_GSIZE before setting VM_ID_MAP to avoid data leakage */
+	for (i = 0; i < cmdq->pdata->thread_nr; i++) {
+		vm_id_map |= vm_map[i];
+		/* config every 10 threads, e.g., thread id=0~9, 10~19, ..., into one register */
+		if ((i + 1) % 10 == 0) {
+			writel(vm_id_map, cmdq->base + GCE_VM_ID_MAP(i));
+			vm_id_map = 0;
+		}
+	}
+	/* config remaining threads settings */
+	if (cmdq->pdata->thread_nr % 10 != 0)
+		writel(vm_id_map, cmdq->base + GCE_VM_ID_MAP(cmdq->pdata->thread_nr - 1));
+
+	kfree(vm_map);
+}
+
 static void cmdq_gctl_value_toggle(struct cmdq *cmdq, bool ddr_enable)
 {
 	u32 val = cmdq->pdata->control_by_sw ? GCE_CTRL_BY_SW : 0;
@@ -164,6 +211,7 @@ static void cmdq_init(struct cmdq *cmdq)
 
 	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
 
+	cmdq_vm_init(cmdq);
 	cmdq_gctl_value_toggle(cmdq, true);
 
 	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
-- 
2.43.0


