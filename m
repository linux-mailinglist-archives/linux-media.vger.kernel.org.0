Return-Path: <linux-media+bounces-9150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E298A2A8D
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 11:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF5BE280C8B
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 09:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8622A57323;
	Fri, 12 Apr 2024 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="r6gZF1ro"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE23E56448;
	Fri, 12 Apr 2024 09:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712912959; cv=none; b=Wd8XL4wUsdKJsItS3x1B5Da90GYJA1sFF07l1rHtveEAoNdc62z8KAD256AaWZAsSRs2ww5ddGwTF/2xhhV/H4LLKFIo5c72l2xBv02R3Jf11KPak4fh8USqMXJrjIss9ruq89QMFUvhA7PEEqBj8FcAIdlNOqtPx0hkn3cxcsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712912959; c=relaxed/simple;
	bh=ZysNpKlfRjYKoIXH0RLWrWPWq3jtmUy+7DiGiVYS/T4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lp53PHef2L8i4lGIVfF/bkrlYKczI8c8mWokrOjaf2cqlxxkUq2xNV/mSda35y5L5CTQeXF4lKyEaTYBwpQzALHSZGXqADsa+q4qjBKXxn3HTY+Ioz/AJwdzJoqTlb73I+te2JaI3qfIhd10Mjl0JCMW0Z2oiLcvL9pQVr3KynE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=r6gZF1ro; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 55462b80f8ac11eeb8927bc1f75efef4-20240412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Fi7UbFm2+kGplhska174a/K5EaYfv0ai2uYoW6MqR+E=;
	b=r6gZF1roFmeI59VkVa/pg9xKw+oFe/A1n6EmZl6Hux02s9yXcAA9ZdQTsrY3NfpHKosY64Ik13UH+64S7KV/imBMuKSVwTv0zjAPuncX2mBvf0PR/IaNMKmkgs0WWe9Y/ZSpFOMYnJGbnQjsPU6Mb8+b6ZS++CxI6z4lx1Af6e0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:e0110c08-96ac-4bef-a38c-3a9f0b57634f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:7ff09882-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 55462b80f8ac11eeb8927bc1f75efef4-20240412
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 207917239; Fri, 12 Apr 2024 17:09:14 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Apr 2024 17:09:12 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Apr 2024 17:09:11 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Marek Szyprowski
	<m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
	"Hsin-Yi Wang" <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	"Daniel Vetter" <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	"Brian Starkey" <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T
 . J . Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5,12/23] media: mediatek: vcodec: add interface to allocate/free secure memory
Date: Fri, 12 Apr 2024 17:08:40 +0800
Message-ID: <20240412090851.24999-13-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412090851.24999-1-yunfei.dong@mediatek.com>
References: <20240412090851.24999-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.939000-8.000000
X-TMASE-MatchedRID: 4lOLcU0uxiOVUgVEUxWI0M36paW7ZnFoqQ9UezeTkTjK99fyOVK2z8Rr
	vjvFKTaxvl8gwRzU3uXUaxsqcNeOOm8aeniRmKw1oMfp2vHck9W7nrAU9KQxUbXvDHySC+eUd/f
	gGgoXNwfBfR/WU+6YOCtvlgVfOuhgVo9xxUteKStEtgfzRzMa1+WNJG9Iamrch5Q1ArtCPlyu01
	fPRCxAIkGUQBmB+AgBkDfm1zFLejyR9GF2J2xqMxRFJJyf5BJe3QfwsVk0UbuGrPnef/I+eq7Dq
	3TEJQOqT+yJa3UtvoiRtP/VFEG/YWd3l9Nof2SNug58UuBS7ec=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.939000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 074C582E234C7B8A18CBC8C327DE27CE4F05F79A227F4E001E3785656A7D4A252000:8
X-MTK: N

Need to call dma heap interface to allocate/free secure memory when playing
secure video.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/platform/mediatek/vcodec/Kconfig    |   1 +
 .../mediatek/vcodec/common/mtk_vcodec_util.c  | 122 +++++++++++++++++-
 .../mediatek/vcodec/common/mtk_vcodec_util.h  |   3 +
 3 files changed, 123 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig b/drivers/media/platform/mediatek/vcodec/Kconfig
index bc8292232530..707865703e61 100644
--- a/drivers/media/platform/mediatek/vcodec/Kconfig
+++ b/drivers/media/platform/mediatek/vcodec/Kconfig
@@ -17,6 +17,7 @@ config VIDEO_MEDIATEK_VCODEC
 	depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
 	depends on MTK_SCP || !MTK_SCP
 	depends on MTK_SMI || (COMPILE_TEST && MTK_SMI=n)
+	depends on DMABUF_HEAPS
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
index 9ce34a3b5ee6..b1c1b0a8a2c6 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
@@ -5,9 +5,11 @@
 *	Tiffany Lin <tiffany.lin@mediatek.com>
 */
 
+#include <linux/dma-heap.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
+#include <uapi/linux/dma-heap.h>
 
 #include "../decoder/mtk_vcodec_dec_drv.h"
 #include "../encoder/mtk_vcodec_enc_drv.h"
@@ -45,7 +47,7 @@ int mtk_vcodec_write_vdecsys(struct mtk_vcodec_dec_ctx *ctx, unsigned int reg,
 }
 EXPORT_SYMBOL(mtk_vcodec_write_vdecsys);
 
-int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
+static int mtk_vcodec_mem_alloc_nor(void *priv, struct mtk_vcodec_mem *mem)
 {
 	enum mtk_instance_type inst_type = *((unsigned int *)priv);
 	struct platform_device *plat_dev;
@@ -76,9 +78,71 @@ int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
 
 	return 0;
 }
-EXPORT_SYMBOL(mtk_vcodec_mem_alloc);
 
-void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
+static int mtk_vcodec_mem_alloc_sec(struct mtk_vcodec_dec_ctx *ctx, struct mtk_vcodec_mem *mem)
+{
+	struct device *dev = &ctx->dev->plat_dev->dev;
+	struct dma_buf *dma_buffer;
+	struct dma_heap *vdec_heap;
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+	unsigned long size = mem->size;
+	int ret = 0;
+
+	if (!size)
+		return -EINVAL;
+
+	vdec_heap = dma_heap_find("restricted_mtk_cma");
+	if (!vdec_heap) {
+		mtk_v4l2_vdec_err(ctx, "dma heap find failed!");
+		return -EPERM;
+	}
+
+	dma_buffer = dma_heap_buffer_alloc(vdec_heap, size, DMA_HEAP_VALID_FD_FLAGS,
+					   DMA_HEAP_VALID_HEAP_FLAGS);
+	if (IS_ERR_OR_NULL(dma_buffer)) {
+		mtk_v4l2_vdec_err(ctx, "dma heap alloc size=0x%lx failed!", size);
+		return PTR_ERR(dma_buffer);
+	}
+
+	attach = dma_buf_attach(dma_buffer, dev);
+	if (IS_ERR_OR_NULL(attach)) {
+		mtk_v4l2_vdec_err(ctx, "dma attach size=0x%lx failed!", size);
+		ret = PTR_ERR(attach);
+		goto err_attach;
+	}
+
+	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR_OR_NULL(sgt)) {
+		mtk_v4l2_vdec_err(ctx, "dma map attach size=0x%lx failed!", size);
+		ret = PTR_ERR(sgt);
+		goto err_sgt;
+	}
+
+	mem->va = dma_buffer;
+	mem->dma_addr = (dma_addr_t)sg_dma_address((sgt)->sgl);
+
+	if (!mem->va || !mem->dma_addr) {
+		mtk_v4l2_vdec_err(ctx, "dma buffer size=0x%lx failed!", size);
+		ret = -EPERM;
+		goto err_addr;
+	}
+
+	mem->attach = attach;
+	mem->sgt = sgt;
+
+	return 0;
+err_addr:
+	dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
+err_sgt:
+	dma_buf_detach(dma_buffer, attach);
+err_attach:
+	dma_buf_put(dma_buffer);
+
+	return ret;
+}
+
+static void mtk_vcodec_mem_free_nor(void *priv, struct mtk_vcodec_mem *mem)
 {
 	enum mtk_instance_type inst_type = *((unsigned int *)priv);
 	struct platform_device *plat_dev;
@@ -111,6 +175,57 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
 	mem->dma_addr = 0;
 	mem->size = 0;
 }
+
+static void mtk_vcodec_mem_free_sec(struct mtk_vcodec_mem *mem)
+{
+	if (mem->sgt)
+		dma_buf_unmap_attachment(mem->attach, mem->sgt, DMA_BIDIRECTIONAL);
+	dma_buf_detach((struct dma_buf *)mem->va, mem->attach);
+	dma_buf_put((struct dma_buf *)mem->va);
+
+	mem->attach = NULL;
+	mem->sgt = NULL;
+	mem->va = NULL;
+	mem->dma_addr = 0;
+	mem->size = 0;
+}
+
+int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
+{
+	enum mtk_instance_type inst_type = *((unsigned int *)priv);
+	int ret;
+
+	if (inst_type == MTK_INST_DECODER) {
+		struct mtk_vcodec_dec_ctx *dec_ctx = priv;
+
+		if (dec_ctx->is_secure_playback) {
+			ret = mtk_vcodec_mem_alloc_sec(dec_ctx, mem);
+			goto alloc_end;
+		}
+	}
+
+	ret = mtk_vcodec_mem_alloc_nor(priv, mem);
+alloc_end:
+
+	return ret;
+}
+EXPORT_SYMBOL(mtk_vcodec_mem_alloc);
+
+void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
+{
+	enum mtk_instance_type inst_type = *((unsigned int *)priv);
+
+	if (inst_type == MTK_INST_DECODER) {
+		struct mtk_vcodec_dec_ctx *dec_ctx = priv;
+
+		if (dec_ctx->is_secure_playback) {
+			mtk_vcodec_mem_free_sec(mem);
+			return;
+		}
+	}
+
+	mtk_vcodec_mem_free_nor(priv, mem);
+}
 EXPORT_SYMBOL(mtk_vcodec_mem_free);
 
 void *mtk_vcodec_get_hw_dev(struct mtk_vcodec_dec_dev *dev, int hw_idx)
@@ -172,3 +287,4 @@ EXPORT_SYMBOL(mtk_vcodec_get_curr_ctx);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Mediatek video codec driver");
+MODULE_IMPORT_NS(DMA_BUF);
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
index 85f615cdd4d3..22078e757ed0 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
@@ -18,6 +18,9 @@ struct mtk_vcodec_mem {
 	size_t size;
 	void *va;
 	dma_addr_t dma_addr;
+
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
 };
 
 struct mtk_vcodec_fb {
-- 
2.18.0


