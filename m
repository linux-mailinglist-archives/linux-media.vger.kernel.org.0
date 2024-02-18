Return-Path: <linux-media+bounces-5391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85017859953
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 21:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA6C01C20B17
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 20:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4069B73182;
	Sun, 18 Feb 2024 20:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XYmY0CQE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9F57319D
	for <linux-media@vger.kernel.org>; Sun, 18 Feb 2024 20:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708289043; cv=none; b=GVsMKju9iIGKs6U7iCMJNC+7kZY8syR1SyMyG+OuDY/vJ/KzpyvZSK6OlQp2jakbdm3J7PJThFscFQtdgeGw0vgtmAW6gocMG6BLZQedVujPVCmT8VVFwV4RonUo7OVAshsIdG986ujDxkxfj+Ye3xgVAUPFLHsbV4maoEl+ZwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708289043; c=relaxed/simple;
	bh=oqAdTNIE9xBQbrtEhCFpCuBexXpqVCCV72LrhUwGx3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WD+EuTU0ywXM3uyu+ggeTuhGwiq+Ab68K/T9/P6uOUcmSDZBLMRK6vGTS1TmvRpwcH3H1/HJpoBjQDmwJMyr70L+Dt4p4eoSar4idasx9Wp/fMUmxC35b1RqTBvyvtkgLOQLclpkBCT7ASyQu2V6yTWLpHnncONg0Esxq7RN4WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XYmY0CQE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DDC31BA7;
	Sun, 18 Feb 2024 21:43:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708289031;
	bh=oqAdTNIE9xBQbrtEhCFpCuBexXpqVCCV72LrhUwGx3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XYmY0CQEvDsMAcGbXzgvnmTeG8FGuog7Dn6ipKlMzSdxMk6TpBQyTfWtunoRrOUWl
	 BgdQB8BQ/+hLbBpEAtGZcch2ro6K98NjIGEpqK+gYDbJXSiobvWhe5JpKAphAkUFrd
	 G3ko1oi/42O6YsoNCG1qXpyWNT+2E1gWqJ+HhNA0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Helen Koike <helen.koike@collabora.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v13 08/12] media: rkisp1: Support i.MX8MP's 34-bit DMA
Date: Sun, 18 Feb 2024 22:43:46 +0200
Message-ID: <20240218204350.10916-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240218204350.10916-1-laurent.pinchart@ideasonboard.com>
References: <20240218204350.10916-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Elder <paul.elder@ideasonboard.com>

On the ISP that is integrated in the i.MX8MP, DMA addresses have been
extended to 34 bits, with the 32 MSBs stored in the DMA address
registers and the 2 LSBs set to 0.

To support this:
- Shift the addresses to the right by 2 when writing to registers
- Set the dma mask to 34 bits
- Use dma_addr_t instead of u32 when storing the addresses

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Tested-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v12:

- Make dma_mask a u64

Changes since v5:

- Improve the commit message

Changes since v4:

- Squash in fix from Tomi:
  - https://gitlab.com/ideasonboard/nxp/linux/-/commit/d6477fe673b1c0d05d12ae21d8db9a03b07e7fea

Changes since v2:

- Document the RKISP1_FEATURE_DMA_34BIT bit
- Use the rkisp1_has_feature() macro
---
 .../platform/rockchip/rkisp1/rkisp1-capture.c | 20 ++++++++++---------
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  4 +++-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  8 ++++++++
 3 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 7d56874c3106..50e86d8ff902 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -648,11 +648,13 @@ static void rkisp1_dummy_buf_destroy(struct rkisp1_capture *cap)
 
 static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
 {
+	u8 shift = rkisp1_has_feature(cap->rkisp1, DMA_34BIT) ? 2 : 0;
+
 	cap->buf.curr = cap->buf.next;
 	cap->buf.next = NULL;
 
 	if (!list_empty(&cap->buf.queue)) {
-		u32 *buff_addr;
+		dma_addr_t *buff_addr;
 
 		cap->buf.next = list_first_entry(&cap->buf.queue, struct rkisp1_buffer, queue);
 		list_del(&cap->buf.next->queue);
@@ -660,7 +662,7 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
 		buff_addr = cap->buf.next->buff_addr;
 
 		rkisp1_write(cap->rkisp1, cap->config->mi.y_base_ad_init,
-			     buff_addr[RKISP1_PLANE_Y]);
+			     buff_addr[RKISP1_PLANE_Y] >> shift);
 		/*
 		 * In order to support grey format we capture
 		 * YUV422 planar format from the camera and
@@ -669,17 +671,17 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
 		if (cap->pix.cfg->fourcc == V4L2_PIX_FMT_GREY) {
 			rkisp1_write(cap->rkisp1,
 				     cap->config->mi.cb_base_ad_init,
-				     cap->buf.dummy.dma_addr);
+				     cap->buf.dummy.dma_addr >> shift);
 			rkisp1_write(cap->rkisp1,
 				     cap->config->mi.cr_base_ad_init,
-				     cap->buf.dummy.dma_addr);
+				     cap->buf.dummy.dma_addr >> shift);
 		} else {
 			rkisp1_write(cap->rkisp1,
 				     cap->config->mi.cb_base_ad_init,
-				     buff_addr[RKISP1_PLANE_CB]);
+				     buff_addr[RKISP1_PLANE_CB] >> shift);
 			rkisp1_write(cap->rkisp1,
 				     cap->config->mi.cr_base_ad_init,
-				     buff_addr[RKISP1_PLANE_CR]);
+				     buff_addr[RKISP1_PLANE_CR] >> shift);
 		}
 	} else {
 		/*
@@ -687,11 +689,11 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
 		 * throw data if there is no available buffer.
 		 */
 		rkisp1_write(cap->rkisp1, cap->config->mi.y_base_ad_init,
-			     cap->buf.dummy.dma_addr);
+			     cap->buf.dummy.dma_addr >> shift);
 		rkisp1_write(cap->rkisp1, cap->config->mi.cb_base_ad_init,
-			     cap->buf.dummy.dma_addr);
+			     cap->buf.dummy.dma_addr >> shift);
 		rkisp1_write(cap->rkisp1, cap->config->mi.cr_base_ad_init,
-			     cap->buf.dummy.dma_addr);
+			     cap->buf.dummy.dma_addr >> shift);
 	}
 
 	/* Set plane offsets */
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 070317196aa1..0afee50b97b9 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -114,6 +114,7 @@ enum rkisp1_isp_pad {
  * @RKISP1_FEATURE_MAIN_STRIDE: The ISP supports configurable stride on the main path
  * @RKISP1_FEATURE_SELF_PATH: The ISP has a self path
  * @RKISP1_FEATURE_DUAL_CROP: The ISP has the dual crop block at the resizer input
+ * @RKISP1_FEATURE_DMA_34BIT: The ISP uses 34-bit DMA addresses
  *
  * The ISP features are stored in a bitmask in &rkisp1_info.features and allow
  * the driver to implement support for features present in some ISP versions
@@ -124,6 +125,7 @@ enum rkisp1_feature {
 	RKISP1_FEATURE_MAIN_STRIDE = BIT(1),
 	RKISP1_FEATURE_SELF_PATH = BIT(2),
 	RKISP1_FEATURE_DUAL_CROP = BIT(3),
+	RKISP1_FEATURE_DMA_34BIT = BIT(4),
 };
 
 #define rkisp1_has_feature(rkisp1, feature) \
@@ -239,7 +241,7 @@ struct rkisp1_vdev_node {
 struct rkisp1_buffer {
 	struct vb2_v4l2_buffer vb;
 	struct list_head queue;
-	u32 buff_addr[VIDEO_MAX_PLANES];
+	dma_addr_t buff_addr[VIDEO_MAX_PLANES];
 };
 
 /*
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 885339159763..ff4ba0682068 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -531,6 +531,7 @@ static int rkisp1_probe(struct platform_device *pdev)
 	struct rkisp1_device *rkisp1;
 	struct v4l2_device *v4l2_dev;
 	unsigned int i;
+	u64 dma_mask;
 	int ret, irq;
 	u32 cif_id;
 
@@ -544,6 +545,13 @@ static int rkisp1_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, rkisp1);
 	rkisp1->dev = dev;
 
+	dma_mask = rkisp1_has_feature(rkisp1, DMA_34BIT) ? DMA_BIT_MASK(34) :
+							   DMA_BIT_MASK(32);
+
+	ret = dma_set_mask_and_coherent(dev, dma_mask);
+	if (ret)
+		return ret;
+
 	mutex_init(&rkisp1->stream_lock);
 
 	rkisp1->base_addr = devm_platform_ioremap_resource(pdev, 0);
-- 
Regards,

Laurent Pinchart


