Return-Path: <linux-media+bounces-32289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B23AB3360
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 11:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 486CD189DD48
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 09:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6A2266F08;
	Mon, 12 May 2025 09:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uwWkioT3"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62A925C71F;
	Mon, 12 May 2025 09:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747041788; cv=none; b=OxjZxx94X3adxwhs94tgZVUo4yAlbEo9mJAH5lDUuU5w3wooNvGYMuT7Fh+MaI/vdQunI7J4AcaMXtPHbwJcdPVi/DfX9HUmiXuXAbJrreEkIs5GIhd3yJJ8h5ry50WS9oghWdbVT4D2qYrgvmgeliXgXECTYkBhX61X390JpZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747041788; c=relaxed/simple;
	bh=oIkFzvOf8iwBtz1Op06T3Bmysl2KDaThWTEsOskVaWc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T1/ZMoxn4kl1+lkXdzKbjJX5/rObz5G2qlloolpVzTKi86/kPN5+ijG6OW1iXW3BBLA5rpIu8AtBrQKaocZIkyTSRoeY5FLgM/TUpoTSgsid9hK3kLkY3OO/ZmK1vvqkDC9+H3zFX+yZFFB1V7Bi/ODUIlpDlS7pPfpPUjs5IxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=uwWkioT3; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b0dff3d42f1211f082f7f7ac98dee637-20250512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=b+v/Rc3SBBjUvwh1R52tOKlSxyh4mqwDsnkbk64LocQ=;
	b=uwWkioT3q8XjNJ0pu3V5SW4vR/gXdjJtpahhQkyu2qC1j4aePgrgl0EwFWIn6Jy78FK0aWIoA/+hXwyxq33+dJyPn9MK1fcE35egzmxCdmgV2KWOz1Hgz5Cugb+VxL4+YIlCrb6I115++WQnTPkimFXOQEEflT03jgzDOKzz2Bs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:18ba15cd-377c-488a-b875-213d80afb267,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:4b75ebf9-d2be-4f65-b354-0f04e3343627,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b0dff3d42f1211f082f7f7ac98dee637-20250512
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1994926404; Mon, 12 May 2025 17:22:57 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 12 May 2025 17:22:54 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 12 May 2025 17:22:54 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy
 Ho <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
	<sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
	<wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH RESEND v5 14/20] soc: mediatek: mtk-cmdq: Add pa_base parsing for hardware without subsys ID support
Date: Mon, 12 May 2025 17:19:36 +0800
Message-ID: <20250512092252.905629-15-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512092252.905629-1-jason-jh.lin@mediatek.com>
References: <20250512092252.905629-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

When GCE executes instructions, it typically locates the corresponding
hardware register using the subsys ID. For hardware that does not
support subsys ID, the subsys ID is set to an invalid value, and the
physical address must be used to generate GCE instructions.

The main advantage of using subsys ID is to reduce the number of
instructions. Without subsys ID, an additional `ASSIGN` instruction
is needed to assign the high bytes of the physical address, which can
impact performance if too many instructions are required. However, if
the hardware does not support subsys ID, using the physical address
is the only option to achieve the same functionality.

This commit adds a pa_base parsing flow to the cmdq_client_reg structure
to handle hardware without subsys ID support.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 15 +++++++++++++--
 include/linux/soc/mediatek/mtk-cmdq.h  |  3 +++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index a40919555d4d..bae6753bd4a7 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/mailbox_controller.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
@@ -60,20 +61,30 @@ int cmdq_dev_get_client_reg(struct device *dev,
 			    struct cmdq_client_reg *client_reg, int idx)
 {
 	struct of_phandle_args spec;
+	struct resource res;
 	int err;
 
 	if (!client_reg)
 		return -ENOENT;
 
+	if (of_address_to_resource(dev->of_node, 0, &res) != 0) {
+		dev_err(dev, "Missing reg in %s node\n", dev->of_node->full_name);
+		return -EINVAL;
+	}
+	client_reg->pa_base = res.start;
+
 	err = of_parse_phandle_with_fixed_args(dev->of_node,
 					       "mediatek,gce-client-reg",
 					       3, idx, &spec);
 	if (err < 0) {
-		dev_warn(dev,
+		dev_dbg(dev,
 			"error %d can't parse gce-client-reg property (%d)",
 			err, idx);
 
-		return err;
+		/* make subsys invalid */
+		client_reg->subsys = CMDQ_SUBSYS_INVALID;
+
+		return 0;
 	}
 
 	client_reg->subsys = (u8)spec.args[0];
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index f956ee9a0b34..f9a48262cb95 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -23,6 +23,8 @@
 #define CMDQ_THR_SPR_IDX2	(2)
 #define CMDQ_THR_SPR_IDX3	(3)
 
+#define CMDQ_SUBSYS_INVALID	(U8_MAX)
+
 struct cmdq_pkt;
 
 enum cmdq_logic_op {
@@ -52,6 +54,7 @@ struct cmdq_operand {
 
 struct cmdq_client_reg {
 	u8 subsys;
+	phys_addr_t pa_base;
 	u16 offset;
 	u16 size;
 };
-- 
2.43.0


