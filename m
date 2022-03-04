Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F54A4CDA15
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 18:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241077AbiCDRVZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 12:21:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241099AbiCDRVL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 12:21:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982EF159280
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 09:20:15 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 858731E63;
        Fri,  4 Mar 2022 18:19:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646414388;
        bh=x22EFbQVhSY07BE7lFXOmzbq6IWWBUIwL43+3YLL1ec=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KlPBPYiyJpWXvqnLEFmwRwfVr5gyxgjRm36cO8x/Q2Z3FlLfT6GDlyTiOTl9w1BBT
         kFnTwEKTf/vEknPho87KMl5sPdt4Ig+u08NC69kGLGby1/QxHO889dgk56iGihrE6T
         +Pz6VRfMHlncZ7XjGIIVymR+rucp4B6Nb2/dZu2I=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 10/17] media: rkisp1: Swap value and address arguments to rkisp1_write()
Date:   Fri,  4 Mar 2022 19:19:18 +0200
Message-Id: <20220304171925.1592-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
References: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While writel() takes the value and address arguments in that order, most
write functions (including in the regmap API) use the opposite
convention. Having the value first is considered confusing, and often
leads to more difficult to read code compared to the opposite convention
where the write call and the register name often fit on a single line:

	rkisp1_write(rkisp1, RKISP1_CIF_THE_REG_NAME,
		     complicate_calculation + for / the_register
		     value + goes | here);

Swap the arguments of the rkisp1_write() function, and use the following
semantic patch to update the callers:

@@
expression rkisp1, value, address;
@@

- rkisp1_write(rkisp1, value, address)
+ rkisp1_write(rkisp1, address, value)

This commit also includes a few additional line break cleanups in the
rkisp1_write() calls, but no other manual change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-capture.c | 101 ++-
 .../platform/rockchip/rkisp1/rkisp1-common.h  |   2 +-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 125 ++--
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 683 +++++++++---------
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  40 +-
 .../platform/rockchip/rkisp1/rkisp1-stats.c   |   2 +-
 6 files changed, 470 insertions(+), 483 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index eedf4bb1c74c..c6f699dbf0b4 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -383,7 +383,7 @@ static void rkisp1_mi_config_ctrl(struct rkisp1_capture *cap)
 	mi_ctrl |= RKISP1_CIF_MI_CTRL_INIT_BASE_EN |
 		   RKISP1_CIF_MI_CTRL_INIT_OFFSET_EN;
 
-	rkisp1_write(cap->rkisp1, mi_ctrl, RKISP1_CIF_MI_CTRL);
+	rkisp1_write(cap->rkisp1, RKISP1_CIF_MI_CTRL, mi_ctrl);
 }
 
 static u32 rkisp1_pixfmt_comp_size(const struct v4l2_pix_format_mplane *pixm,
@@ -404,7 +404,7 @@ static void rkisp1_irq_frame_end_enable(struct rkisp1_capture *cap)
 	u32 mi_imsc = rkisp1_read(cap->rkisp1, RKISP1_CIF_MI_IMSC);
 
 	mi_imsc |= RKISP1_CIF_MI_FRAME(cap);
-	rkisp1_write(cap->rkisp1, mi_imsc, RKISP1_CIF_MI_IMSC);
+	rkisp1_write(cap->rkisp1, RKISP1_CIF_MI_IMSC, mi_imsc);
 }
 
 static void rkisp1_mp_config(struct rkisp1_capture *cap)
@@ -413,12 +413,12 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
 	struct rkisp1_device *rkisp1 = cap->rkisp1;
 	u32 reg;
 
-	rkisp1_write(rkisp1, rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_Y),
-		     cap->config->mi.y_size_init);
-	rkisp1_write(rkisp1, rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CB),
-		     cap->config->mi.cb_size_init);
-	rkisp1_write(rkisp1, rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR),
-		     cap->config->mi.cr_size_init);
+	rkisp1_write(rkisp1, cap->config->mi.y_size_init,
+		     rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_Y));
+	rkisp1_write(rkisp1, cap->config->mi.cb_size_init,
+		     rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CB));
+	rkisp1_write(rkisp1, cap->config->mi.cr_size_init,
+		     rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR));
 
 	rkisp1_irq_frame_end_enable(cap);
 
@@ -429,7 +429,7 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
 			reg |= RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP;
 		else
 			reg &= ~RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP;
-		rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
+		rkisp1_write(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL, reg);
 	}
 
 	rkisp1_mi_config_ctrl(cap);
@@ -437,11 +437,11 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
 	reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_CTRL);
 	reg &= ~RKISP1_MI_CTRL_MP_FMT_MASK;
 	reg |= cap->pix.cfg->write_format;
-	rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_CTRL);
+	rkisp1_write(rkisp1, RKISP1_CIF_MI_CTRL, reg);
 
 	reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_CTRL);
 	reg |= RKISP1_CIF_MI_MP_AUTOUPDATE_ENABLE;
-	rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_CTRL);
+	rkisp1_write(rkisp1, RKISP1_CIF_MI_CTRL, reg);
 }
 
 static void rkisp1_sp_config(struct rkisp1_capture *cap)
@@ -450,16 +450,16 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
 	struct rkisp1_device *rkisp1 = cap->rkisp1;
 	u32 mi_ctrl, reg;
 
-	rkisp1_write(rkisp1, rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_Y),
-		     cap->config->mi.y_size_init);
-	rkisp1_write(rkisp1, rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CB),
-		     cap->config->mi.cb_size_init);
-	rkisp1_write(rkisp1, rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR),
-		     cap->config->mi.cr_size_init);
+	rkisp1_write(rkisp1, cap->config->mi.y_size_init,
+		     rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_Y));
+	rkisp1_write(rkisp1, cap->config->mi.cb_size_init,
+		     rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CB));
+	rkisp1_write(rkisp1, cap->config->mi.cr_size_init,
+		     rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR));
 
-	rkisp1_write(rkisp1, pixm->width, RKISP1_CIF_MI_SP_Y_PIC_WIDTH);
-	rkisp1_write(rkisp1, pixm->height, RKISP1_CIF_MI_SP_Y_PIC_HEIGHT);
-	rkisp1_write(rkisp1, cap->sp_y_stride, RKISP1_CIF_MI_SP_Y_LLENGTH);
+	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_PIC_WIDTH, pixm->width);
+	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_PIC_HEIGHT, pixm->height);
+	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_LLENGTH, cap->sp_y_stride);
 
 	rkisp1_irq_frame_end_enable(cap);
 
@@ -470,7 +470,7 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
 			reg |= RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
 		else
 			reg &= ~RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
-		rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
+		rkisp1_write(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL, reg);
 	}
 
 	rkisp1_mi_config_ctrl(cap);
@@ -481,7 +481,7 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
 		   RKISP1_MI_CTRL_SP_INPUT_YUV422 |
 		   cap->pix.cfg->output_format |
 		   RKISP1_CIF_MI_SP_AUTOUPDATE_ENABLE;
-	rkisp1_write(rkisp1, mi_ctrl, RKISP1_CIF_MI_CTRL);
+	rkisp1_write(rkisp1, RKISP1_CIF_MI_CTRL, mi_ctrl);
 }
 
 static void rkisp1_mp_disable(struct rkisp1_capture *cap)
@@ -490,7 +490,7 @@ static void rkisp1_mp_disable(struct rkisp1_capture *cap)
 
 	mi_ctrl &= ~(RKISP1_CIF_MI_CTRL_MP_ENABLE |
 		     RKISP1_CIF_MI_CTRL_RAW_ENABLE);
-	rkisp1_write(cap->rkisp1, mi_ctrl, RKISP1_CIF_MI_CTRL);
+	rkisp1_write(cap->rkisp1, RKISP1_CIF_MI_CTRL, mi_ctrl);
 }
 
 static void rkisp1_sp_disable(struct rkisp1_capture *cap)
@@ -498,7 +498,7 @@ static void rkisp1_sp_disable(struct rkisp1_capture *cap)
 	u32 mi_ctrl = rkisp1_read(cap->rkisp1, RKISP1_CIF_MI_CTRL);
 
 	mi_ctrl &= ~RKISP1_CIF_MI_CTRL_SP_ENABLE;
-	rkisp1_write(cap->rkisp1, mi_ctrl, RKISP1_CIF_MI_CTRL);
+	rkisp1_write(cap->rkisp1, RKISP1_CIF_MI_CTRL, mi_ctrl);
 }
 
 static void rkisp1_mp_enable(struct rkisp1_capture *cap)
@@ -514,7 +514,7 @@ static void rkisp1_mp_enable(struct rkisp1_capture *cap)
 	else
 		mi_ctrl |= RKISP1_CIF_MI_CTRL_MP_ENABLE;
 
-	rkisp1_write(cap->rkisp1, mi_ctrl, RKISP1_CIF_MI_CTRL);
+	rkisp1_write(cap->rkisp1, RKISP1_CIF_MI_CTRL, mi_ctrl);
 }
 
 static void rkisp1_sp_enable(struct rkisp1_capture *cap)
@@ -522,15 +522,14 @@ static void rkisp1_sp_enable(struct rkisp1_capture *cap)
 	u32 mi_ctrl = rkisp1_read(cap->rkisp1, RKISP1_CIF_MI_CTRL);
 
 	mi_ctrl |= RKISP1_CIF_MI_CTRL_SP_ENABLE;
-	rkisp1_write(cap->rkisp1, mi_ctrl, RKISP1_CIF_MI_CTRL);
+	rkisp1_write(cap->rkisp1, RKISP1_CIF_MI_CTRL, mi_ctrl);
 }
 
 static void rkisp1_mp_sp_stop(struct rkisp1_capture *cap)
 {
 	if (!cap->is_streaming)
 		return;
-	rkisp1_write(cap->rkisp1,
-		     RKISP1_CIF_MI_FRAME(cap), RKISP1_CIF_MI_ICR);
+	rkisp1_write(cap->rkisp1, RKISP1_CIF_MI_ICR, RKISP1_CIF_MI_FRAME(cap));
 	cap->ops->disable(cap);
 }
 
@@ -554,7 +553,7 @@ static void rkisp1_mp_set_data_path(struct rkisp1_capture *cap)
 
 	dpcl = dpcl | RKISP1_CIF_VI_DPCL_CHAN_MODE_MP |
 	       RKISP1_CIF_VI_DPCL_MP_MUX_MRSZ_MI;
-	rkisp1_write(cap->rkisp1, dpcl, RKISP1_CIF_VI_DPCL);
+	rkisp1_write(cap->rkisp1, RKISP1_CIF_VI_DPCL, dpcl);
 }
 
 static void rkisp1_sp_set_data_path(struct rkisp1_capture *cap)
@@ -562,7 +561,7 @@ static void rkisp1_sp_set_data_path(struct rkisp1_capture *cap)
 	u32 dpcl = rkisp1_read(cap->rkisp1, RKISP1_CIF_VI_DPCL);
 
 	dpcl |= RKISP1_CIF_VI_DPCL_CHAN_MODE_SP;
-	rkisp1_write(cap->rkisp1, dpcl, RKISP1_CIF_VI_DPCL);
+	rkisp1_write(cap->rkisp1, RKISP1_CIF_VI_DPCL, dpcl);
 }
 
 static const struct rkisp1_capture_ops rkisp1_capture_ops_mp = {
@@ -628,35 +627,29 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
 
 		buff_addr = cap->buf.next->buff_addr;
 
-		rkisp1_write(cap->rkisp1,
-			     buff_addr[RKISP1_PLANE_Y],
-			     cap->config->mi.y_base_ad_init);
-		rkisp1_write(cap->rkisp1,
-			     buff_addr[RKISP1_PLANE_CB],
-			     cap->config->mi.cb_base_ad_init);
-		rkisp1_write(cap->rkisp1,
-			     buff_addr[RKISP1_PLANE_CR],
-			     cap->config->mi.cr_base_ad_init);
+		rkisp1_write(cap->rkisp1, cap->config->mi.y_base_ad_init,
+			     buff_addr[RKISP1_PLANE_Y]);
+		rkisp1_write(cap->rkisp1, cap->config->mi.cb_base_ad_init,
+			     buff_addr[RKISP1_PLANE_CB]);
+		rkisp1_write(cap->rkisp1, cap->config->mi.cr_base_ad_init,
+			     buff_addr[RKISP1_PLANE_CR]);
 	} else {
 		/*
 		 * Use the dummy space allocated by dma_alloc_coherent to
 		 * throw data if there is no available buffer.
 		 */
-		rkisp1_write(cap->rkisp1,
-			     cap->buf.dummy.dma_addr,
-			     cap->config->mi.y_base_ad_init);
-		rkisp1_write(cap->rkisp1,
-			     cap->buf.dummy.dma_addr,
-			     cap->config->mi.cb_base_ad_init);
-		rkisp1_write(cap->rkisp1,
-			     cap->buf.dummy.dma_addr,
-			     cap->config->mi.cr_base_ad_init);
+		rkisp1_write(cap->rkisp1, cap->config->mi.y_base_ad_init,
+			     cap->buf.dummy.dma_addr);
+		rkisp1_write(cap->rkisp1, cap->config->mi.cb_base_ad_init,
+			     cap->buf.dummy.dma_addr);
+		rkisp1_write(cap->rkisp1, cap->config->mi.cr_base_ad_init,
+			     cap->buf.dummy.dma_addr);
 	}
 
 	/* Set plane offsets */
-	rkisp1_write(cap->rkisp1, 0, cap->config->mi.y_offs_cnt_init);
-	rkisp1_write(cap->rkisp1, 0, cap->config->mi.cb_offs_cnt_init);
-	rkisp1_write(cap->rkisp1, 0, cap->config->mi.cr_offs_cnt_init);
+	rkisp1_write(cap->rkisp1, cap->config->mi.y_offs_cnt_init, 0);
+	rkisp1_write(cap->rkisp1, cap->config->mi.cb_offs_cnt_init, 0);
+	rkisp1_write(cap->rkisp1, cap->config->mi.cr_offs_cnt_init, 0);
 }
 
 /*
@@ -696,7 +689,7 @@ irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
 	if (!status)
 		return IRQ_NONE;
 
-	rkisp1_write(rkisp1, status, RKISP1_CIF_MI_ICR);
+	rkisp1_write(rkisp1, RKISP1_CIF_MI_ICR, status);
 
 	for (i = 0; i < ARRAY_SIZE(rkisp1->capture_devs); ++i) {
 		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
@@ -874,8 +867,8 @@ static void rkisp1_cap_stream_enable(struct rkisp1_capture *cap)
 	 */
 	if (!other->is_streaming) {
 		/* force cfg update */
-		rkisp1_write(rkisp1,
-			     RKISP1_CIF_MI_INIT_SOFT_UPD, RKISP1_CIF_MI_INIT);
+		rkisp1_write(rkisp1, RKISP1_CIF_MI_INIT,
+			     RKISP1_CIF_MI_INIT_SOFT_UPD);
 		rkisp1_set_next_buf(cap);
 	}
 	spin_unlock_irq(&cap->buf.lock);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index d8fa3f1a5a85..941580c9c4e0 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -425,7 +425,7 @@ struct rkisp1_isp_mbus_info {
 };
 
 static inline void
-rkisp1_write(struct rkisp1_device *rkisp1, u32 val, unsigned int addr)
+rkisp1_write(struct rkisp1_device *rkisp1, unsigned int addr, u32 val)
 {
 	writel(val, rkisp1->base_addr + addr);
 }
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index e8abb57fb728..d7d91b923b69 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -251,20 +251,20 @@ static void rkisp1_config_ism(struct rkisp1_device *rkisp1)
 					V4L2_SUBDEV_FORMAT_ACTIVE);
 	u32 val;
 
-	rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_IS_RECENTER);
-	rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_IS_MAX_DX);
-	rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_IS_MAX_DY);
-	rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_IS_DISPLACE);
-	rkisp1_write(rkisp1, src_crop->left, RKISP1_CIF_ISP_IS_H_OFFS);
-	rkisp1_write(rkisp1, src_crop->top, RKISP1_CIF_ISP_IS_V_OFFS);
-	rkisp1_write(rkisp1, src_crop->width, RKISP1_CIF_ISP_IS_H_SIZE);
-	rkisp1_write(rkisp1, src_crop->height, RKISP1_CIF_ISP_IS_V_SIZE);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_RECENTER, 0);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_MAX_DX, 0);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_MAX_DY, 0);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_DISPLACE, 0);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_OFFS, src_crop->left);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_OFFS, src_crop->top);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_SIZE, src_crop->width);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_SIZE, src_crop->height);
 
 	/* IS(Image Stabilization) is always on, working as output crop */
-	rkisp1_write(rkisp1, 1, RKISP1_CIF_ISP_IS_CTRL);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_CTRL, 1);
 	val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_CTRL);
 	val |= RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD;
-	rkisp1_write(rkisp1, val, RKISP1_CIF_ISP_CTRL);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL, val);
 }
 
 /*
@@ -296,8 +296,8 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
 			else
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT;
 		} else {
-			rkisp1_write(rkisp1, RKISP1_CIF_ISP_DEMOSAIC_TH(0xc),
-				     RKISP1_CIF_ISP_DEMOSAIC);
+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_DEMOSAIC,
+				     RKISP1_CIF_ISP_DEMOSAIC_TH(0xc));
 
 			if (sensor->mbus_type == V4L2_MBUS_BT656)
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_BAYER_ITU656;
@@ -333,29 +333,29 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
 			signal |= RKISP1_CIF_ISP_ACQ_PROP_HSYNC_LOW;
 	}
 
-	rkisp1_write(rkisp1, isp_ctrl, RKISP1_CIF_ISP_CTRL);
-	rkisp1_write(rkisp1, signal | sink_fmt->yuv_seq |
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL, isp_ctrl);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_PROP,
+		     signal | sink_fmt->yuv_seq |
 		     RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT(sink_fmt->bayer_pat) |
-		     RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_ALL,
-		     RKISP1_CIF_ISP_ACQ_PROP);
-	rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_ACQ_NR_FRAMES);
+		     RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_ALL);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_NR_FRAMES, 0);
 
 	/* Acquisition Size */
-	rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_ACQ_H_OFFS);
-	rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_ACQ_V_OFFS);
-	rkisp1_write(rkisp1,
-		     acq_mult * sink_frm->width, RKISP1_CIF_ISP_ACQ_H_SIZE);
-	rkisp1_write(rkisp1, sink_frm->height, RKISP1_CIF_ISP_ACQ_V_SIZE);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_H_OFFS, 0);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_V_OFFS, 0);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_H_SIZE,
+		     acq_mult * sink_frm->width);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_V_SIZE, sink_frm->height);
 
 	/* ISP Out Area */
-	rkisp1_write(rkisp1, sink_crop->left, RKISP1_CIF_ISP_OUT_H_OFFS);
-	rkisp1_write(rkisp1, sink_crop->top, RKISP1_CIF_ISP_OUT_V_OFFS);
-	rkisp1_write(rkisp1, sink_crop->width, RKISP1_CIF_ISP_OUT_H_SIZE);
-	rkisp1_write(rkisp1, sink_crop->height, RKISP1_CIF_ISP_OUT_V_SIZE);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_OUT_H_OFFS, sink_crop->left);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_OUT_V_OFFS, sink_crop->top);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_OUT_H_SIZE, sink_crop->width);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_OUT_V_SIZE, sink_crop->height);
 
 	irq_mask |= RKISP1_CIF_ISP_FRAME | RKISP1_CIF_ISP_V_START |
 		    RKISP1_CIF_ISP_PIC_SIZE_ERROR;
-	rkisp1_write(rkisp1, irq_mask, RKISP1_CIF_ISP_IMSC);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IMSC, irq_mask);
 
 	if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
 		rkisp1_params_disable(&rkisp1->params);
@@ -393,7 +393,7 @@ static int rkisp1_config_dvp(struct rkisp1_device *rkisp1)
 	}
 
 	val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_ACQ_PROP);
-	rkisp1_write(rkisp1, val | input_sel, RKISP1_CIF_ISP_ACQ_PROP);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_PROP, val | input_sel);
 
 	return 0;
 }
@@ -412,30 +412,28 @@ static int rkisp1_config_mipi(struct rkisp1_device *rkisp1)
 		    RKISP1_CIF_MIPI_CTRL_ERR_SOT_SYNC_HS_SKIP |
 		    RKISP1_CIF_MIPI_CTRL_CLOCKLANE_ENA;
 
-	rkisp1_write(rkisp1, mipi_ctrl, RKISP1_CIF_MIPI_CTRL);
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_CTRL, mipi_ctrl);
 
 	/* V12 could also use a newer csi2-host, but we don't want that yet */
 	if (rkisp1->media_dev.hw_revision == RKISP1_V12)
-		rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_CSI0_CTRL0);
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_CSI0_CTRL0, 0);
 
 	/* Configure Data Type and Virtual Channel */
-	rkisp1_write(rkisp1,
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMG_DATA_SEL,
 		     RKISP1_CIF_MIPI_DATA_SEL_DT(sink_fmt->mipi_dt) |
-		     RKISP1_CIF_MIPI_DATA_SEL_VC(0),
-		     RKISP1_CIF_MIPI_IMG_DATA_SEL);
+		     RKISP1_CIF_MIPI_DATA_SEL_VC(0));
 
 	/* Clear MIPI interrupts */
-	rkisp1_write(rkisp1, ~0, RKISP1_CIF_MIPI_ICR);
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_ICR, ~0);
 	/*
 	 * Disable RKISP1_CIF_MIPI_ERR_DPHY interrupt here temporary for
 	 * isp bus may be dead when switch isp.
 	 */
-	rkisp1_write(rkisp1,
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMSC,
 		     RKISP1_CIF_MIPI_FRAME_END | RKISP1_CIF_MIPI_ERR_CSI |
 		     RKISP1_CIF_MIPI_ERR_DPHY |
 		     RKISP1_CIF_MIPI_SYNC_FIFO_OVFLW(0x03) |
-		     RKISP1_CIF_MIPI_ADD_DATA_OVFLW,
-		     RKISP1_CIF_MIPI_IMSC);
+		     RKISP1_CIF_MIPI_ADD_DATA_OVFLW);
 
 	dev_dbg(rkisp1->dev, "\n  MIPI_CTRL 0x%08x\n"
 		"  MIPI_IMG_DATA_SEL 0x%08x\n"
@@ -465,7 +463,7 @@ static int rkisp1_config_path(struct rkisp1_device *rkisp1)
 		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_MIPI;
 	}
 
-	rkisp1_write(rkisp1, dpcl, RKISP1_CIF_VI_DPCL);
+	rkisp1_write(rkisp1, RKISP1_CIF_VI_DPCL, dpcl);
 
 	return ret;
 }
@@ -499,34 +497,33 @@ static void rkisp1_isp_stop(struct rkisp1_device *rkisp1)
 	 * Stop ISP(isp) ->wait for ISP isp off
 	 */
 	/* stop and clear MI, MIPI, and ISP interrupts */
-	rkisp1_write(rkisp1, 0, RKISP1_CIF_MIPI_IMSC);
-	rkisp1_write(rkisp1, ~0, RKISP1_CIF_MIPI_ICR);
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMSC, 0);
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_ICR, ~0);
 
-	rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_IMSC);
-	rkisp1_write(rkisp1, ~0, RKISP1_CIF_ISP_ICR);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IMSC, 0);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, ~0);
 
-	rkisp1_write(rkisp1, 0, RKISP1_CIF_MI_IMSC);
-	rkisp1_write(rkisp1, ~0, RKISP1_CIF_MI_ICR);
+	rkisp1_write(rkisp1, RKISP1_CIF_MI_IMSC, 0);
+	rkisp1_write(rkisp1, RKISP1_CIF_MI_ICR, ~0);
 	val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL);
-	rkisp1_write(rkisp1, val & (~RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA),
-		     RKISP1_CIF_MIPI_CTRL);
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_CTRL,
+		     val & (~RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA));
 	/* stop ISP */
 	val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_CTRL);
 	val &= ~(RKISP1_CIF_ISP_CTRL_ISP_INFORM_ENABLE |
 		 RKISP1_CIF_ISP_CTRL_ISP_ENABLE);
-	rkisp1_write(rkisp1, val, RKISP1_CIF_ISP_CTRL);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL, val);
 
 	val = rkisp1_read(rkisp1,	RKISP1_CIF_ISP_CTRL);
-	rkisp1_write(rkisp1, val | RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD,
-		     RKISP1_CIF_ISP_CTRL);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL,
+		     val | RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD);
 
 	readx_poll_timeout(readl, rkisp1->base_addr + RKISP1_CIF_ISP_RIS,
 			   val, val & RKISP1_CIF_ISP_OFF, 20, 100);
-	rkisp1_write(rkisp1,
+	rkisp1_write(rkisp1, RKISP1_CIF_VI_IRCL,
 		     RKISP1_CIF_VI_IRCL_MIPI_SW_RST |
-		     RKISP1_CIF_VI_IRCL_ISP_SW_RST,
-		     RKISP1_CIF_VI_IRCL);
-	rkisp1_write(rkisp1, 0x0, RKISP1_CIF_VI_IRCL);
+		     RKISP1_CIF_VI_IRCL_ISP_SW_RST);
+	rkisp1_write(rkisp1, RKISP1_CIF_VI_IRCL, 0x0);
 }
 
 static void rkisp1_config_clk(struct rkisp1_device *rkisp1)
@@ -537,7 +534,7 @@ static void rkisp1_config_clk(struct rkisp1_device *rkisp1)
 		  RKISP1_CIF_VI_ICCL_IE_CLK | RKISP1_CIF_VI_ICCL_MIPI_CLK |
 		  RKISP1_CIF_VI_ICCL_DCROP_CLK;
 
-	rkisp1_write(rkisp1, val, RKISP1_CIF_VI_ICCL);
+	rkisp1_write(rkisp1, RKISP1_CIF_VI_ICCL, val);
 
 	/* ensure sp and mp can run at the same time in V12 */
 	if (rkisp1->media_dev.hw_revision == RKISP1_V12) {
@@ -545,7 +542,7 @@ static void rkisp1_config_clk(struct rkisp1_device *rkisp1)
 		      RKISP1_CIF_CLK_CTRL_MI_RAW0 | RKISP1_CIF_CLK_CTRL_MI_RAW1 |
 		      RKISP1_CIF_CLK_CTRL_MI_READ | RKISP1_CIF_CLK_CTRL_MI_RAWRD |
 		      RKISP1_CIF_CLK_CTRL_CP | RKISP1_CIF_CLK_CTRL_IE;
-		rkisp1_write(rkisp1, val, RKISP1_CIF_VI_ISP_CLK_CTRL_V12);
+		rkisp1_write(rkisp1, RKISP1_CIF_VI_ISP_CLK_CTRL_V12, val);
 	}
 }
 
@@ -559,15 +556,15 @@ static void rkisp1_isp_start(struct rkisp1_device *rkisp1)
 	/* Activate MIPI */
 	if (sensor->mbus_type == V4L2_MBUS_CSI2_DPHY) {
 		val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL);
-		rkisp1_write(rkisp1, val | RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA,
-			     RKISP1_CIF_MIPI_CTRL);
+		rkisp1_write(rkisp1, RKISP1_CIF_MIPI_CTRL,
+			     val | RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA);
 	}
 	/* Activate ISP */
 	val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_CTRL);
 	val |= RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD |
 	       RKISP1_CIF_ISP_CTRL_ISP_ENABLE |
 	       RKISP1_CIF_ISP_CTRL_ISP_INFORM_ENABLE;
-	rkisp1_write(rkisp1, val, RKISP1_CIF_ISP_CTRL);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL, val);
 
 	/*
 	 * CIF spec says to wait for sufficient time after enabling
@@ -1136,7 +1133,7 @@ irqreturn_t rkisp1_mipi_isr(int irq, void *ctx)
 	if (!status)
 		return IRQ_NONE;
 
-	rkisp1_write(rkisp1, status, RKISP1_CIF_MIPI_ICR);
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_ICR, status);
 
 	/*
 	 * Disable DPHY errctrl interrupt, because this dphy
@@ -1146,8 +1143,8 @@ irqreturn_t rkisp1_mipi_isr(int irq, void *ctx)
 	 */
 	if (status & RKISP1_CIF_MIPI_ERR_CTRL(0x0f)) {
 		val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMSC);
-		rkisp1_write(rkisp1, val & ~RKISP1_CIF_MIPI_ERR_CTRL(0x0f),
-			     RKISP1_CIF_MIPI_IMSC);
+		rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMSC,
+			     val & ~RKISP1_CIF_MIPI_ERR_CTRL(0x0f));
 		rkisp1->isp.is_dphy_errctrl_disabled = true;
 	}
 
@@ -1163,7 +1160,7 @@ irqreturn_t rkisp1_mipi_isr(int irq, void *ctx)
 		if (rkisp1->isp.is_dphy_errctrl_disabled) {
 			val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMSC);
 			val |= RKISP1_CIF_MIPI_ERR_CTRL(0x0f);
-			rkisp1_write(rkisp1, val, RKISP1_CIF_MIPI_IMSC);
+			rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMSC, val);
 			rkisp1->isp.is_dphy_errctrl_disabled = false;
 		}
 	} else {
@@ -1193,7 +1190,7 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
 	if (!status)
 		return IRQ_NONE;
 
-	rkisp1_write(rkisp1, status, RKISP1_CIF_ISP_ICR);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, status);
 
 	/* Vertical sync signal, starting generating new frame */
 	if (status & RKISP1_CIF_ISP_V_START) {
@@ -1213,7 +1210,7 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
 			rkisp1->debug.img_stabilization_size_error++;
 		if (isp_err & RKISP1_CIF_ISP_ERR_OUTFORM_SIZE)
 			rkisp1->debug.outform_size_error++;
-		rkisp1_write(rkisp1, isp_err, RKISP1_CIF_ISP_ERR_CLR);
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_ERR_CLR, isp_err);
 	} else if (status & RKISP1_CIF_ISP_DATA_LOSS) {
 		/* keep track of data_loss in debugfs */
 		rkisp1->debug.data_loss++;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 7a172d47d475..9cb45c49d8b6 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -37,7 +37,7 @@ rkisp1_param_set_bits(struct rkisp1_params *params, u32 reg, u32 bit_mask)
 	u32 val;
 
 	val = rkisp1_read(params->rkisp1, reg);
-	rkisp1_write(params->rkisp1, val | bit_mask, reg);
+	rkisp1_write(params->rkisp1, reg, val | bit_mask);
 }
 
 static inline void
@@ -46,7 +46,7 @@ rkisp1_param_clear_bits(struct rkisp1_params *params, u32 reg, u32 bit_mask)
 	u32 val;
 
 	val = rkisp1_read(params->rkisp1, reg);
-	rkisp1_write(params->rkisp1, val & ~bit_mask, reg);
+	rkisp1_write(params->rkisp1, reg, val & ~bit_mask);
 }
 
 /* ISP BP interface function */
@@ -60,35 +60,35 @@ static void rkisp1_dpcc_config(struct rkisp1_params *params,
 	mode = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_DPCC_MODE);
 	mode &= RKISP1_CIF_ISP_DPCC_ENA;
 	mode |= arg->mode & ~RKISP1_CIF_ISP_DPCC_ENA;
-	rkisp1_write(params->rkisp1, mode, RKISP1_CIF_ISP_DPCC_MODE);
-	rkisp1_write(params->rkisp1, arg->output_mode,
-		     RKISP1_CIF_ISP_DPCC_OUTPUT_MODE);
-	rkisp1_write(params->rkisp1, arg->set_use,
-		     RKISP1_CIF_ISP_DPCC_SET_USE);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_MODE, mode);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_OUTPUT_MODE,
+		     arg->output_mode);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_SET_USE,
+		     arg->set_use);
 
-	rkisp1_write(params->rkisp1, arg->methods[0].method,
-		     RKISP1_CIF_ISP_DPCC_METHODS_SET_1);
-	rkisp1_write(params->rkisp1, arg->methods[1].method,
-		     RKISP1_CIF_ISP_DPCC_METHODS_SET_2);
-	rkisp1_write(params->rkisp1, arg->methods[2].method,
-		     RKISP1_CIF_ISP_DPCC_METHODS_SET_3);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_METHODS_SET_1,
+		     arg->methods[0].method);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_METHODS_SET_2,
+		     arg->methods[1].method);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_METHODS_SET_3,
+		     arg->methods[2].method);
 	for (i = 0; i < RKISP1_CIF_ISP_DPCC_METHODS_MAX; i++) {
-		rkisp1_write(params->rkisp1, arg->methods[i].line_thresh,
-			     RKISP1_ISP_DPCC_LINE_THRESH(i));
-		rkisp1_write(params->rkisp1, arg->methods[i].line_mad_fac,
-			     RKISP1_ISP_DPCC_LINE_MAD_FAC(i));
-		rkisp1_write(params->rkisp1, arg->methods[i].pg_fac,
-			     RKISP1_ISP_DPCC_PG_FAC(i));
-		rkisp1_write(params->rkisp1, arg->methods[i].rnd_thresh,
-			     RKISP1_ISP_DPCC_RND_THRESH(i));
-		rkisp1_write(params->rkisp1, arg->methods[i].rg_fac,
-			     RKISP1_ISP_DPCC_RG_FAC(i));
+		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_LINE_THRESH(i),
+			     arg->methods[i].line_thresh);
+		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_LINE_MAD_FAC(i),
+			     arg->methods[i].line_mad_fac);
+		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_PG_FAC(i),
+			     arg->methods[i].pg_fac);
+		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_RND_THRESH(i),
+			     arg->methods[i].rnd_thresh);
+		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_RG_FAC(i),
+			     arg->methods[i].rg_fac);
 	}
 
-	rkisp1_write(params->rkisp1, arg->rnd_offs,
-		     RKISP1_CIF_ISP_DPCC_RND_OFFS);
-	rkisp1_write(params->rkisp1, arg->ro_limits,
-		     RKISP1_CIF_ISP_DPCC_RO_LIMITS);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_RND_OFFS,
+		     arg->rnd_offs);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_RO_LIMITS,
+		     arg->ro_limits);
 }
 
 /* ISP black level subtraction interface function */
@@ -107,44 +107,44 @@ static void rkisp1_bls_config(struct rkisp1_params *params,
 
 		switch (params->raw_type) {
 		case RKISP1_RAW_BGGR:
-			rkisp1_write(params->rkisp1,
-				     pval->r, RKISP1_CIF_ISP_BLS_D_FIXED);
-			rkisp1_write(params->rkisp1,
-				     pval->gr, RKISP1_CIF_ISP_BLS_C_FIXED);
-			rkisp1_write(params->rkisp1,
-				     pval->gb, RKISP1_CIF_ISP_BLS_B_FIXED);
-			rkisp1_write(params->rkisp1,
-				     pval->b, RKISP1_CIF_ISP_BLS_A_FIXED);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_D_FIXED,
+				     pval->r);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_C_FIXED,
+				     pval->gr);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_B_FIXED,
+				     pval->gb);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_A_FIXED,
+				     pval->b);
 			break;
 		case RKISP1_RAW_GBRG:
-			rkisp1_write(params->rkisp1,
-				     pval->r, RKISP1_CIF_ISP_BLS_C_FIXED);
-			rkisp1_write(params->rkisp1,
-				     pval->gr, RKISP1_CIF_ISP_BLS_D_FIXED);
-			rkisp1_write(params->rkisp1,
-				     pval->gb, RKISP1_CIF_ISP_BLS_A_FIXED);
-			rkisp1_write(params->rkisp1,
-				     pval->b, RKISP1_CIF_ISP_BLS_B_FIXED);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_C_FIXED,
+				     pval->r);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_D_FIXED,
+				     pval->gr);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_A_FIXED,
+				     pval->gb);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_B_FIXED,
+				     pval->b);
 			break;
 		case RKISP1_RAW_GRBG:
-			rkisp1_write(params->rkisp1,
-				     pval->r, RKISP1_CIF_ISP_BLS_B_FIXED);
-			rkisp1_write(params->rkisp1,
-				     pval->gr, RKISP1_CIF_ISP_BLS_A_FIXED);
-			rkisp1_write(params->rkisp1,
-				     pval->gb, RKISP1_CIF_ISP_BLS_D_FIXED);
-			rkisp1_write(params->rkisp1,
-				     pval->b, RKISP1_CIF_ISP_BLS_C_FIXED);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_B_FIXED,
+				     pval->r);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_A_FIXED,
+				     pval->gr);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_D_FIXED,
+				     pval->gb);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_C_FIXED,
+				     pval->b);
 			break;
 		case RKISP1_RAW_RGGB:
-			rkisp1_write(params->rkisp1,
-				     pval->r, RKISP1_CIF_ISP_BLS_A_FIXED);
-			rkisp1_write(params->rkisp1,
-				     pval->gr, RKISP1_CIF_ISP_BLS_B_FIXED);
-			rkisp1_write(params->rkisp1,
-				     pval->gb, RKISP1_CIF_ISP_BLS_C_FIXED);
-			rkisp1_write(params->rkisp1,
-				     pval->b, RKISP1_CIF_ISP_BLS_D_FIXED);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_A_FIXED,
+				     pval->r);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_B_FIXED,
+				     pval->gr);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_C_FIXED,
+				     pval->gb);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_D_FIXED,
+				     pval->b);
 			break;
 		default:
 			break;
@@ -152,35 +152,35 @@ static void rkisp1_bls_config(struct rkisp1_params *params,
 
 	} else {
 		if (arg->en_windows & BIT(1)) {
-			rkisp1_write(params->rkisp1, arg->bls_window2.h_offs,
-				     RKISP1_CIF_ISP_BLS_H2_START);
-			rkisp1_write(params->rkisp1, arg->bls_window2.h_size,
-				     RKISP1_CIF_ISP_BLS_H2_STOP);
-			rkisp1_write(params->rkisp1, arg->bls_window2.v_offs,
-				     RKISP1_CIF_ISP_BLS_V2_START);
-			rkisp1_write(params->rkisp1, arg->bls_window2.v_size,
-				     RKISP1_CIF_ISP_BLS_V2_STOP);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_H2_START,
+				     arg->bls_window2.h_offs);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_H2_STOP,
+				     arg->bls_window2.h_size);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_V2_START,
+				     arg->bls_window2.v_offs);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_V2_STOP,
+				     arg->bls_window2.v_size);
 			new_control |= RKISP1_CIF_ISP_BLS_WINDOW_2;
 		}
 
 		if (arg->en_windows & BIT(0)) {
-			rkisp1_write(params->rkisp1, arg->bls_window1.h_offs,
-				     RKISP1_CIF_ISP_BLS_H1_START);
-			rkisp1_write(params->rkisp1, arg->bls_window1.h_size,
-				     RKISP1_CIF_ISP_BLS_H1_STOP);
-			rkisp1_write(params->rkisp1, arg->bls_window1.v_offs,
-				     RKISP1_CIF_ISP_BLS_V1_START);
-			rkisp1_write(params->rkisp1, arg->bls_window1.v_size,
-				     RKISP1_CIF_ISP_BLS_V1_STOP);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_H1_START,
+				     arg->bls_window1.h_offs);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_H1_STOP,
+				     arg->bls_window1.h_size);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_V1_START,
+				     arg->bls_window1.v_offs);
+			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_V1_STOP,
+				     arg->bls_window1.v_size);
 			new_control |= RKISP1_CIF_ISP_BLS_WINDOW_1;
 		}
 
-		rkisp1_write(params->rkisp1, arg->bls_samples,
-			     RKISP1_CIF_ISP_BLS_SAMPLES);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_SAMPLES,
+			     arg->bls_samples);
 
 		new_control |= RKISP1_CIF_ISP_BLS_MODE_MEASURED;
 	}
-	rkisp1_write(params->rkisp1, new_control, RKISP1_CIF_ISP_BLS_CTRL);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_CTRL, new_control);
 }
 
 /* ISP LS correction interface function */
@@ -196,14 +196,10 @@ rkisp1_lsc_matrix_config_v10(struct rkisp1_params *params,
 	sram_addr = (isp_lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE) ?
 		    RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_0 :
 		    RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_153;
-	rkisp1_write(params->rkisp1, sram_addr,
-		     RKISP1_CIF_ISP_LSC_R_TABLE_ADDR);
-	rkisp1_write(params->rkisp1, sram_addr,
-		     RKISP1_CIF_ISP_LSC_GR_TABLE_ADDR);
-	rkisp1_write(params->rkisp1, sram_addr,
-		     RKISP1_CIF_ISP_LSC_GB_TABLE_ADDR);
-	rkisp1_write(params->rkisp1, sram_addr,
-		     RKISP1_CIF_ISP_LSC_B_TABLE_ADDR);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_ADDR, sram_addr);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_ADDR, sram_addr);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_ADDR, sram_addr);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_ADDR, sram_addr);
 
 	/* program data tables (table size is 9 * 17 = 153) */
 	for (i = 0; i < RKISP1_CIF_ISP_LSC_SAMPLES_MAX; i++) {
@@ -214,45 +210,45 @@ rkisp1_lsc_matrix_config_v10(struct rkisp1_params *params,
 		for (j = 0; j < RKISP1_CIF_ISP_LSC_SAMPLES_MAX - 1; j += 2) {
 			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->r_data_tbl[i][j],
 								 pconfig->r_data_tbl[i][j + 1]);
-			rkisp1_write(params->rkisp1, data,
-				     RKISP1_CIF_ISP_LSC_R_TABLE_DATA);
+			rkisp1_write(params->rkisp1,
+				     RKISP1_CIF_ISP_LSC_R_TABLE_DATA, data);
 
 			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gr_data_tbl[i][j],
 								 pconfig->gr_data_tbl[i][j + 1]);
-			rkisp1_write(params->rkisp1, data,
-				     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA);
+			rkisp1_write(params->rkisp1,
+				     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA, data);
 
 			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gb_data_tbl[i][j],
 								 pconfig->gb_data_tbl[i][j + 1]);
-			rkisp1_write(params->rkisp1, data,
-				     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA);
+			rkisp1_write(params->rkisp1,
+				     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA, data);
 
 			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->b_data_tbl[i][j],
 								 pconfig->b_data_tbl[i][j + 1]);
-			rkisp1_write(params->rkisp1, data,
-				     RKISP1_CIF_ISP_LSC_B_TABLE_DATA);
+			rkisp1_write(params->rkisp1,
+				     RKISP1_CIF_ISP_LSC_B_TABLE_DATA, data);
 		}
 		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->r_data_tbl[i][j], 0);
-		rkisp1_write(params->rkisp1, data,
-			     RKISP1_CIF_ISP_LSC_R_TABLE_DATA);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_DATA,
+			     data);
 
 		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gr_data_tbl[i][j], 0);
-		rkisp1_write(params->rkisp1, data,
-			     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_DATA,
+			     data);
 
 		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gb_data_tbl[i][j], 0);
-		rkisp1_write(params->rkisp1, data,
-			     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_DATA,
+			     data);
 
 		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->b_data_tbl[i][j], 0);
-		rkisp1_write(params->rkisp1, data,
-			     RKISP1_CIF_ISP_LSC_B_TABLE_DATA);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_DATA,
+			     data);
 	}
 	isp_lsc_table_sel = (isp_lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE) ?
 			    RKISP1_CIF_ISP_LSC_TABLE_0 :
 			    RKISP1_CIF_ISP_LSC_TABLE_1;
-	rkisp1_write(params->rkisp1, isp_lsc_table_sel,
-		     RKISP1_CIF_ISP_LSC_TABLE_SEL);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_TABLE_SEL,
+		     isp_lsc_table_sel);
 }
 
 static void
@@ -267,10 +263,10 @@ rkisp1_lsc_matrix_config_v12(struct rkisp1_params *params,
 	sram_addr = (isp_lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE) ?
 		     RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_0 :
 		     RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_153;
-	rkisp1_write(params->rkisp1, sram_addr, RKISP1_CIF_ISP_LSC_R_TABLE_ADDR);
-	rkisp1_write(params->rkisp1, sram_addr, RKISP1_CIF_ISP_LSC_GR_TABLE_ADDR);
-	rkisp1_write(params->rkisp1, sram_addr, RKISP1_CIF_ISP_LSC_GB_TABLE_ADDR);
-	rkisp1_write(params->rkisp1, sram_addr, RKISP1_CIF_ISP_LSC_B_TABLE_ADDR);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_ADDR, sram_addr);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_ADDR, sram_addr);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_ADDR, sram_addr);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_ADDR, sram_addr);
 
 	/* program data tables (table size is 9 * 17 = 153) */
 	for (i = 0; i < RKISP1_CIF_ISP_LSC_SAMPLES_MAX; i++) {
@@ -282,49 +278,49 @@ rkisp1_lsc_matrix_config_v12(struct rkisp1_params *params,
 			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
 					pconfig->r_data_tbl[i][j],
 					pconfig->r_data_tbl[i][j + 1]);
-			rkisp1_write(params->rkisp1, data,
-				     RKISP1_CIF_ISP_LSC_R_TABLE_DATA);
+			rkisp1_write(params->rkisp1,
+				     RKISP1_CIF_ISP_LSC_R_TABLE_DATA, data);
 
 			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
 					pconfig->gr_data_tbl[i][j],
 					pconfig->gr_data_tbl[i][j + 1]);
-			rkisp1_write(params->rkisp1, data,
-				     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA);
+			rkisp1_write(params->rkisp1,
+				     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA, data);
 
 			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
 					pconfig->gb_data_tbl[i][j],
 					pconfig->gb_data_tbl[i][j + 1]);
-			rkisp1_write(params->rkisp1, data,
-				     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA);
+			rkisp1_write(params->rkisp1,
+				     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA, data);
 
 			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
 					pconfig->b_data_tbl[i][j],
 					pconfig->b_data_tbl[i][j + 1]);
-			rkisp1_write(params->rkisp1, data,
-				     RKISP1_CIF_ISP_LSC_B_TABLE_DATA);
+			rkisp1_write(params->rkisp1,
+				     RKISP1_CIF_ISP_LSC_B_TABLE_DATA, data);
 		}
 
 		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->r_data_tbl[i][j], 0);
-		rkisp1_write(params->rkisp1, data,
-			     RKISP1_CIF_ISP_LSC_R_TABLE_DATA);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_R_TABLE_DATA,
+			     data);
 
 		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->gr_data_tbl[i][j], 0);
-		rkisp1_write(params->rkisp1, data,
-			     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GR_TABLE_DATA,
+			     data);
 
 		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->gb_data_tbl[i][j], 0);
-		rkisp1_write(params->rkisp1, data,
-			     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_GB_TABLE_DATA,
+			     data);
 
 		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->b_data_tbl[i][j], 0);
-		rkisp1_write(params->rkisp1, data,
-			     RKISP1_CIF_ISP_LSC_B_TABLE_DATA);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_B_TABLE_DATA,
+			     data);
 	}
 	isp_lsc_table_sel = (isp_lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE) ?
 			    RKISP1_CIF_ISP_LSC_TABLE_0 :
 			    RKISP1_CIF_ISP_LSC_TABLE_1;
-	rkisp1_write(params->rkisp1, isp_lsc_table_sel,
-		     RKISP1_CIF_ISP_LSC_TABLE_SEL);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_LSC_TABLE_SEL,
+		     isp_lsc_table_sel);
 }
 
 static void rkisp1_lsc_config(struct rkisp1_params *params,
@@ -343,26 +339,26 @@ static void rkisp1_lsc_config(struct rkisp1_params *params,
 		/* program x size tables */
 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->x_size_tbl[i * 2],
 						    arg->x_size_tbl[i * 2 + 1]);
-		rkisp1_write(params->rkisp1, data,
-			     RKISP1_CIF_ISP_LSC_XSIZE_01 + i * 4);
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_LSC_XSIZE_01 + i * 4, data);
 
 		/* program x grad tables */
 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->x_grad_tbl[i * 2],
 						    arg->x_grad_tbl[i * 2 + 1]);
-		rkisp1_write(params->rkisp1, data,
-			     RKISP1_CIF_ISP_LSC_XGRAD_01 + i * 4);
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_LSC_XGRAD_01 + i * 4, data);
 
 		/* program y size tables */
 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->y_size_tbl[i * 2],
 						    arg->y_size_tbl[i * 2 + 1]);
-		rkisp1_write(params->rkisp1, data,
-			     RKISP1_CIF_ISP_LSC_YSIZE_01 + i * 4);
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_LSC_YSIZE_01 + i * 4, data);
 
 		/* program y grad tables */
 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->y_grad_tbl[i * 2],
 						    arg->y_grad_tbl[i * 2 + 1]);
-		rkisp1_write(params->rkisp1, data,
-			     RKISP1_CIF_ISP_LSC_YGRAD_01 + i * 4);
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_LSC_YGRAD_01 + i * 4, data);
 	}
 
 	/* restore the lsc ctrl status */
@@ -383,28 +379,32 @@ static void rkisp1_flt_config(struct rkisp1_params *params,
 {
 	u32 filt_mode;
 
-	rkisp1_write(params->rkisp1,
-		     arg->thresh_bl0, RKISP1_CIF_ISP_FILT_THRESH_BL0);
-	rkisp1_write(params->rkisp1,
-		     arg->thresh_bl1, RKISP1_CIF_ISP_FILT_THRESH_BL1);
-	rkisp1_write(params->rkisp1,
-		     arg->thresh_sh0, RKISP1_CIF_ISP_FILT_THRESH_SH0);
-	rkisp1_write(params->rkisp1,
-		     arg->thresh_sh1, RKISP1_CIF_ISP_FILT_THRESH_SH1);
-	rkisp1_write(params->rkisp1, arg->fac_bl0, RKISP1_CIF_ISP_FILT_FAC_BL0);
-	rkisp1_write(params->rkisp1, arg->fac_bl1, RKISP1_CIF_ISP_FILT_FAC_BL1);
-	rkisp1_write(params->rkisp1, arg->fac_mid, RKISP1_CIF_ISP_FILT_FAC_MID);
-	rkisp1_write(params->rkisp1, arg->fac_sh0, RKISP1_CIF_ISP_FILT_FAC_SH0);
-	rkisp1_write(params->rkisp1, arg->fac_sh1, RKISP1_CIF_ISP_FILT_FAC_SH1);
-	rkisp1_write(params->rkisp1,
-		     arg->lum_weight, RKISP1_CIF_ISP_FILT_LUM_WEIGHT);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_THRESH_BL0,
+		     arg->thresh_bl0);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_THRESH_BL1,
+		     arg->thresh_bl1);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_THRESH_SH0,
+		     arg->thresh_sh0);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_THRESH_SH1,
+		     arg->thresh_sh1);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_FAC_BL0,
+		     arg->fac_bl0);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_FAC_BL1,
+		     arg->fac_bl1);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_FAC_MID,
+		     arg->fac_mid);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_FAC_SH0,
+		     arg->fac_sh0);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_FAC_SH1,
+		     arg->fac_sh1);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_LUM_WEIGHT,
+		     arg->lum_weight);
 
-	rkisp1_write(params->rkisp1,
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_MODE,
 		     (arg->mode ? RKISP1_CIF_ISP_FLT_MODE_DNR : 0) |
 		     RKISP1_CIF_ISP_FLT_CHROMA_V_MODE(arg->chr_v_mode) |
 		     RKISP1_CIF_ISP_FLT_CHROMA_H_MODE(arg->chr_h_mode) |
-		     RKISP1_CIF_ISP_FLT_GREEN_STAGE1(arg->grn_stage1),
-		     RKISP1_CIF_ISP_FILT_MODE);
+		     RKISP1_CIF_ISP_FLT_GREEN_STAGE1(arg->grn_stage1));
 
 	/* avoid to override the old enable value */
 	filt_mode = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_FILT_MODE);
@@ -414,7 +414,7 @@ static void rkisp1_flt_config(struct rkisp1_params *params,
 	filt_mode |= RKISP1_CIF_ISP_FLT_CHROMA_V_MODE(arg->chr_v_mode) |
 		     RKISP1_CIF_ISP_FLT_CHROMA_H_MODE(arg->chr_h_mode) |
 		     RKISP1_CIF_ISP_FLT_GREEN_STAGE1(arg->grn_stage1);
-	rkisp1_write(params->rkisp1, filt_mode, RKISP1_CIF_ISP_FILT_MODE);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_MODE, filt_mode);
 }
 
 /* ISP demosaic interface function */
@@ -428,7 +428,7 @@ static int rkisp1_bdm_config(struct rkisp1_params *params,
 	bdm_th &= RKISP1_CIF_ISP_DEMOSAIC_BYPASS;
 	bdm_th |= arg->demosaic_th & ~RKISP1_CIF_ISP_DEMOSAIC_BYPASS;
 	/* set demosaic threshold */
-	rkisp1_write(params->rkisp1, bdm_th, RKISP1_CIF_ISP_DEMOSAIC);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DEMOSAIC, bdm_th);
 	return 0;
 }
 
@@ -438,18 +438,21 @@ static void rkisp1_sdg_config(struct rkisp1_params *params,
 {
 	unsigned int i;
 
-	rkisp1_write(params->rkisp1,
-		     arg->xa_pnts.gamma_dx0, RKISP1_CIF_ISP_GAMMA_DX_LO);
-	rkisp1_write(params->rkisp1,
-		     arg->xa_pnts.gamma_dx1, RKISP1_CIF_ISP_GAMMA_DX_HI);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_GAMMA_DX_LO,
+		     arg->xa_pnts.gamma_dx0);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_GAMMA_DX_HI,
+		     arg->xa_pnts.gamma_dx1);
 
 	for (i = 0; i < RKISP1_CIF_ISP_DEGAMMA_CURVE_SIZE; i++) {
-		rkisp1_write(params->rkisp1, arg->curve_r.gamma_y[i],
-			     RKISP1_CIF_ISP_GAMMA_R_Y0 + i * 4);
-		rkisp1_write(params->rkisp1, arg->curve_g.gamma_y[i],
-			     RKISP1_CIF_ISP_GAMMA_G_Y0 + i * 4);
-		rkisp1_write(params->rkisp1, arg->curve_b.gamma_y[i],
-			     RKISP1_CIF_ISP_GAMMA_B_Y0 + i * 4);
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_GAMMA_R_Y0 + i * 4,
+			     arg->curve_r.gamma_y[i]);
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_GAMMA_G_Y0 + i * 4,
+			     arg->curve_g.gamma_y[i]);
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_GAMMA_B_Y0 + i * 4,
+			     arg->curve_b.gamma_y[i]);
 	}
 }
 
@@ -461,11 +464,13 @@ static void rkisp1_goc_config_v10(struct rkisp1_params *params,
 
 	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
 				RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
-	rkisp1_write(params->rkisp1, arg->mode, RKISP1_CIF_ISP_GAMMA_OUT_MODE_V10);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_GAMMA_OUT_MODE_V10,
+		     arg->mode);
 
 	for (i = 0; i < RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10; i++)
-		rkisp1_write(params->rkisp1, arg->gamma_y[i],
-			     RKISP1_CIF_ISP_GAMMA_OUT_Y_0_V10 + i * 4);
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_GAMMA_OUT_Y_0_V10 + i * 4,
+			     arg->gamma_y[i]);
 }
 
 static void rkisp1_goc_config_v12(struct rkisp1_params *params,
@@ -476,14 +481,15 @@ static void rkisp1_goc_config_v12(struct rkisp1_params *params,
 
 	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
 				RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
-	rkisp1_write(params->rkisp1, arg->mode, RKISP1_CIF_ISP_GAMMA_OUT_MODE_V12);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_GAMMA_OUT_MODE_V12,
+		     arg->mode);
 
 	for (i = 0; i < RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V12 / 2; i++) {
 		value = RKISP1_CIF_ISP_GAMMA_VALUE_V12(
 			arg->gamma_y[2 * i + 1],
 			arg->gamma_y[2 * i]);
-		rkisp1_write(params->rkisp1, value,
-			     RKISP1_CIF_ISP_GAMMA_OUT_Y_0_V12 + i * 4);
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_GAMMA_OUT_Y_0_V12 + i * 4, value);
 	}
 }
 
@@ -495,11 +501,13 @@ static void rkisp1_ctk_config(struct rkisp1_params *params,
 
 	for (i = 0; i < 3; i++)
 		for (j = 0; j < 3; j++)
-			rkisp1_write(params->rkisp1, arg->coeff[i][j],
-				     RKISP1_CIF_ISP_CT_COEFF_0 + 4 * k++);
+			rkisp1_write(params->rkisp1,
+				     RKISP1_CIF_ISP_CT_COEFF_0 + 4 * k++,
+				     arg->coeff[i][j]);
 	for (i = 0; i < 3; i++)
-		rkisp1_write(params->rkisp1, arg->ct_offset[i],
-			     RKISP1_CIF_ISP_CT_OFFSET_R + i * 4);
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_CT_OFFSET_R + i * 4,
+			     arg->ct_offset[i]);
 }
 
 static void rkisp1_ctk_enable(struct rkisp1_params *params, bool en)
@@ -508,19 +516,19 @@ static void rkisp1_ctk_enable(struct rkisp1_params *params, bool en)
 		return;
 
 	/* Write back the default values. */
-	rkisp1_write(params->rkisp1, 0x80, RKISP1_CIF_ISP_CT_COEFF_0);
-	rkisp1_write(params->rkisp1, 0, RKISP1_CIF_ISP_CT_COEFF_1);
-	rkisp1_write(params->rkisp1, 0, RKISP1_CIF_ISP_CT_COEFF_2);
-	rkisp1_write(params->rkisp1, 0, RKISP1_CIF_ISP_CT_COEFF_3);
-	rkisp1_write(params->rkisp1, 0x80, RKISP1_CIF_ISP_CT_COEFF_4);
-	rkisp1_write(params->rkisp1, 0, RKISP1_CIF_ISP_CT_COEFF_5);
-	rkisp1_write(params->rkisp1, 0, RKISP1_CIF_ISP_CT_COEFF_6);
-	rkisp1_write(params->rkisp1, 0, RKISP1_CIF_ISP_CT_COEFF_7);
-	rkisp1_write(params->rkisp1, 0x80, RKISP1_CIF_ISP_CT_COEFF_8);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CT_COEFF_0, 0x80);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CT_COEFF_1, 0);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CT_COEFF_2, 0);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CT_COEFF_3, 0);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CT_COEFF_4, 0x80);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CT_COEFF_5, 0);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CT_COEFF_6, 0);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CT_COEFF_7, 0);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CT_COEFF_8, 0x80);
 
-	rkisp1_write(params->rkisp1, 0, RKISP1_CIF_ISP_CT_OFFSET_R);
-	rkisp1_write(params->rkisp1, 0, RKISP1_CIF_ISP_CT_OFFSET_G);
-	rkisp1_write(params->rkisp1, 0, RKISP1_CIF_ISP_CT_OFFSET_B);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CT_OFFSET_R, 0);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CT_OFFSET_G, 0);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CT_OFFSET_B, 0);
 }
 
 /* ISP White Balance Mode */
@@ -531,15 +539,15 @@ static void rkisp1_awb_meas_config_v10(struct rkisp1_params *params,
 	/* based on the mode,configure the awb module */
 	if (arg->awb_mode == RKISP1_CIF_ISP_AWB_MODE_YCBCR) {
 		/* Reference Cb and Cr */
-		rkisp1_write(params->rkisp1,
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_REF_V10,
 			     RKISP1_CIF_ISP_AWB_REF_CR_SET(arg->awb_ref_cr) |
-			     arg->awb_ref_cb, RKISP1_CIF_ISP_AWB_REF_V10);
+			     arg->awb_ref_cb);
 		/* Yc Threshold */
-		rkisp1_write(params->rkisp1,
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_THRESH_V10,
 			     RKISP1_CIF_ISP_AWB_MAX_Y_SET(arg->max_y) |
 			     RKISP1_CIF_ISP_AWB_MIN_Y_SET(arg->min_y) |
 			     RKISP1_CIF_ISP_AWB_MAX_CS_SET(arg->max_csum) |
-			     arg->min_c, RKISP1_CIF_ISP_AWB_THRESH_V10);
+			     arg->min_c);
 	}
 
 	reg_val = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP_V10);
@@ -547,21 +555,21 @@ static void rkisp1_awb_meas_config_v10(struct rkisp1_params *params,
 		reg_val |= RKISP1_CIF_ISP_AWB_YMAX_CMP_EN;
 	else
 		reg_val &= ~RKISP1_CIF_ISP_AWB_YMAX_CMP_EN;
-	rkisp1_write(params->rkisp1, reg_val, RKISP1_CIF_ISP_AWB_PROP_V10);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP_V10, reg_val);
 
 	/* window offset */
-	rkisp1_write(params->rkisp1,
-		     arg->awb_wnd.v_offs, RKISP1_CIF_ISP_AWB_WND_V_OFFS_V10);
-	rkisp1_write(params->rkisp1,
-		     arg->awb_wnd.h_offs, RKISP1_CIF_ISP_AWB_WND_H_OFFS_V10);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_WND_V_OFFS_V10,
+		     arg->awb_wnd.v_offs);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_WND_H_OFFS_V10,
+		     arg->awb_wnd.h_offs);
 	/* AWB window size */
-	rkisp1_write(params->rkisp1,
-		     arg->awb_wnd.v_size, RKISP1_CIF_ISP_AWB_WND_V_SIZE_V10);
-	rkisp1_write(params->rkisp1,
-		     arg->awb_wnd.h_size, RKISP1_CIF_ISP_AWB_WND_H_SIZE_V10);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_WND_V_SIZE_V10,
+		     arg->awb_wnd.v_size);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_WND_H_SIZE_V10,
+		     arg->awb_wnd.h_size);
 	/* Number of frames */
-	rkisp1_write(params->rkisp1,
-		     arg->frames, RKISP1_CIF_ISP_AWB_FRAMES_V10);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_FRAMES_V10,
+		     arg->frames);
 }
 
 static void rkisp1_awb_meas_config_v12(struct rkisp1_params *params,
@@ -571,15 +579,15 @@ static void rkisp1_awb_meas_config_v12(struct rkisp1_params *params,
 	/* based on the mode,configure the awb module */
 	if (arg->awb_mode == RKISP1_CIF_ISP_AWB_MODE_YCBCR) {
 		/* Reference Cb and Cr */
-		rkisp1_write(params->rkisp1,
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_REF_V12,
 			     RKISP1_CIF_ISP_AWB_REF_CR_SET(arg->awb_ref_cr) |
-			     arg->awb_ref_cb, RKISP1_CIF_ISP_AWB_REF_V12);
+			     arg->awb_ref_cb);
 		/* Yc Threshold */
-		rkisp1_write(params->rkisp1,
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_THRESH_V12,
 			     RKISP1_CIF_ISP_AWB_MAX_Y_SET(arg->max_y) |
 			     RKISP1_CIF_ISP_AWB_MIN_Y_SET(arg->min_y) |
 			     RKISP1_CIF_ISP_AWB_MAX_CS_SET(arg->max_csum) |
-			     arg->min_c, RKISP1_CIF_ISP_AWB_THRESH_V12);
+			     arg->min_c);
 	}
 
 	reg_val = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP_V12);
@@ -589,18 +597,14 @@ static void rkisp1_awb_meas_config_v12(struct rkisp1_params *params,
 		reg_val &= ~RKISP1_CIF_ISP_AWB_YMAX_CMP_EN;
 	reg_val &= ~RKISP1_CIF_ISP_AWB_SET_FRAMES_MASK_V12;
 	reg_val |= RKISP1_CIF_ISP_AWB_SET_FRAMES_V12(arg->frames);
-	rkisp1_write(params->rkisp1, reg_val, RKISP1_CIF_ISP_AWB_PROP_V12);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP_V12, reg_val);
 
 	/* window offset */
-	rkisp1_write(params->rkisp1,
-		     arg->awb_wnd.v_offs << 16 |
-		     arg->awb_wnd.h_offs,
-		     RKISP1_CIF_ISP_AWB_OFFS_V12);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_OFFS_V12,
+		     arg->awb_wnd.v_offs << 16 | arg->awb_wnd.h_offs);
 	/* AWB window size */
-	rkisp1_write(params->rkisp1,
-		     arg->awb_wnd.v_size << 16 |
-		     arg->awb_wnd.h_size,
-		     RKISP1_CIF_ISP_AWB_SIZE_V12);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_SIZE_V12,
+		     arg->awb_wnd.v_size << 16 | arg->awb_wnd.h_size);
 }
 
 static void
@@ -619,14 +623,15 @@ rkisp1_awb_meas_enable_v10(struct rkisp1_params *params,
 		else
 			reg_val |= RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN;
 
-		rkisp1_write(params->rkisp1, reg_val, RKISP1_CIF_ISP_AWB_PROP_V10);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP_V10,
+			     reg_val);
 
 		/* Measurements require AWB block be active. */
 		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
 				      RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
 	} else {
-		rkisp1_write(params->rkisp1,
-			     reg_val, RKISP1_CIF_ISP_AWB_PROP_V10);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP_V10,
+			     reg_val);
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
 					RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
 	}
@@ -648,14 +653,15 @@ rkisp1_awb_meas_enable_v12(struct rkisp1_params *params,
 		else
 			reg_val |= RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN;
 
-		rkisp1_write(params->rkisp1, reg_val, RKISP1_CIF_ISP_AWB_PROP_V12);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP_V12,
+			     reg_val);
 
 		/* Measurements require AWB block be active. */
 		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
 				      RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
 	} else {
-		rkisp1_write(params->rkisp1,
-			     reg_val, RKISP1_CIF_ISP_AWB_PROP_V12);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP_V12,
+			     reg_val);
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
 					RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
 	}
@@ -665,26 +671,26 @@ static void
 rkisp1_awb_gain_config_v10(struct rkisp1_params *params,
 			   const struct rkisp1_cif_isp_awb_gain_config *arg)
 {
-	rkisp1_write(params->rkisp1,
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_GAIN_G_V10,
 		     RKISP1_CIF_ISP_AWB_GAIN_R_SET(arg->gain_green_r) |
-		     arg->gain_green_b, RKISP1_CIF_ISP_AWB_GAIN_G_V10);
+		     arg->gain_green_b);
 
-	rkisp1_write(params->rkisp1,
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_GAIN_RB_V10,
 		     RKISP1_CIF_ISP_AWB_GAIN_R_SET(arg->gain_red) |
-		     arg->gain_blue, RKISP1_CIF_ISP_AWB_GAIN_RB_V10);
+		     arg->gain_blue);
 }
 
 static void
 rkisp1_awb_gain_config_v12(struct rkisp1_params *params,
 			   const struct rkisp1_cif_isp_awb_gain_config *arg)
 {
-	rkisp1_write(params->rkisp1,
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_GAIN_G_V12,
 		     RKISP1_CIF_ISP_AWB_GAIN_R_SET(arg->gain_green_r) |
-		     arg->gain_green_b, RKISP1_CIF_ISP_AWB_GAIN_G_V12);
+		     arg->gain_green_b);
 
-	rkisp1_write(params->rkisp1,
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB_GAIN_RB_V12,
 		     RKISP1_CIF_ISP_AWB_GAIN_R_SET(arg->gain_red) |
-		     arg->gain_blue, RKISP1_CIF_ISP_AWB_GAIN_RB_V12);
+		     arg->gain_blue);
 }
 
 static void rkisp1_aec_config_v10(struct rkisp1_params *params,
@@ -700,24 +706,22 @@ static void rkisp1_aec_config_v10(struct rkisp1_params *params,
 		exp_ctrl |= RKISP1_CIF_ISP_EXP_CTRL_AUTOSTOP;
 	if (arg->mode == RKISP1_CIF_ISP_EXP_MEASURING_MODE_1)
 		exp_ctrl |= RKISP1_CIF_ISP_EXP_CTRL_MEASMODE_1;
-	rkisp1_write(params->rkisp1, exp_ctrl, RKISP1_CIF_ISP_EXP_CTRL);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_EXP_CTRL, exp_ctrl);
 
-	rkisp1_write(params->rkisp1,
-		     arg->meas_window.h_offs, RKISP1_CIF_ISP_EXP_H_OFFSET_V10);
-	rkisp1_write(params->rkisp1,
-		     arg->meas_window.v_offs, RKISP1_CIF_ISP_EXP_V_OFFSET_V10);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_EXP_H_OFFSET_V10,
+		     arg->meas_window.h_offs);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_EXP_V_OFFSET_V10,
+		     arg->meas_window.v_offs);
 
 	block_hsize = arg->meas_window.h_size /
 		      RKISP1_CIF_ISP_EXP_COLUMN_NUM_V10 - 1;
 	block_vsize = arg->meas_window.v_size /
 		      RKISP1_CIF_ISP_EXP_ROW_NUM_V10 - 1;
 
-	rkisp1_write(params->rkisp1,
-		     RKISP1_CIF_ISP_EXP_H_SIZE_SET_V10(block_hsize),
-		     RKISP1_CIF_ISP_EXP_H_SIZE_V10);
-	rkisp1_write(params->rkisp1,
-		     RKISP1_CIF_ISP_EXP_V_SIZE_SET_V10(block_vsize),
-		     RKISP1_CIF_ISP_EXP_V_SIZE_V10);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_EXP_H_SIZE_V10,
+		     RKISP1_CIF_ISP_EXP_H_SIZE_SET_V10(block_hsize));
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_EXP_V_SIZE_V10,
+		     RKISP1_CIF_ISP_EXP_V_SIZE_SET_V10(block_vsize));
 }
 
 static void rkisp1_aec_config_v12(struct rkisp1_params *params,
@@ -736,20 +740,18 @@ static void rkisp1_aec_config_v12(struct rkisp1_params *params,
 	if (arg->mode == RKISP1_CIF_ISP_EXP_MEASURING_MODE_1)
 		exp_ctrl |= RKISP1_CIF_ISP_EXP_CTRL_MEASMODE_1;
 	exp_ctrl |= RKISP1_CIF_ISP_EXP_CTRL_WNDNUM_SET_V12(wnd_num_idx);
-	rkisp1_write(params->rkisp1, exp_ctrl, RKISP1_CIF_ISP_EXP_CTRL);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_EXP_CTRL, exp_ctrl);
 
-	rkisp1_write(params->rkisp1,
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_EXP_OFFS_V12,
 		     RKISP1_CIF_ISP_EXP_V_OFFSET_SET_V12(arg->meas_window.v_offs) |
-		     RKISP1_CIF_ISP_EXP_H_OFFSET_SET_V12(arg->meas_window.h_offs),
-		     RKISP1_CIF_ISP_EXP_OFFS_V12);
+		     RKISP1_CIF_ISP_EXP_H_OFFSET_SET_V12(arg->meas_window.h_offs));
 
 	block_hsize = arg->meas_window.h_size / ae_wnd_num[wnd_num_idx] - 1;
 	block_vsize = arg->meas_window.v_size / ae_wnd_num[wnd_num_idx] - 1;
 
-	rkisp1_write(params->rkisp1,
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_EXP_SIZE_V12,
 		     RKISP1_CIF_ISP_EXP_V_SIZE_SET_V12(block_vsize) |
-		     RKISP1_CIF_ISP_EXP_H_SIZE_SET_V12(block_hsize),
-		     RKISP1_CIF_ISP_EXP_SIZE_V12);
+		     RKISP1_CIF_ISP_EXP_H_SIZE_SET_V12(block_hsize));
 }
 
 static void rkisp1_cproc_config(struct rkisp1_params *params,
@@ -762,11 +764,12 @@ static void rkisp1_cproc_config(struct rkisp1_params *params,
 	u32 effect = cur_ie_config->effect;
 	u32 quantization = params->quantization;
 
-	rkisp1_write(params->rkisp1, arg->contrast, RKISP1_CIF_C_PROC_CONTRAST);
-	rkisp1_write(params->rkisp1, arg->hue, RKISP1_CIF_C_PROC_HUE);
-	rkisp1_write(params->rkisp1, arg->sat, RKISP1_CIF_C_PROC_SATURATION);
-	rkisp1_write(params->rkisp1, arg->brightness,
-		     RKISP1_CIF_C_PROC_BRIGHTNESS);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_C_PROC_CONTRAST,
+		     arg->contrast);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_C_PROC_HUE, arg->hue);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_C_PROC_SATURATION, arg->sat);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_C_PROC_BRIGHTNESS,
+		     arg->brightness);
 
 	if (quantization != V4L2_QUANTIZATION_FULL_RANGE ||
 	    effect != V4L2_COLORFX_NONE) {
@@ -802,31 +805,29 @@ static void rkisp1_hst_config_v10(struct rkisp1_params *params,
 	hist_prop = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_HIST_PROP_V10);
 	hist_prop &= RKISP1_CIF_ISP_HIST_PROP_MODE_MASK_V10;
 	hist_prop |= RKISP1_CIF_ISP_HIST_PREDIV_SET_V10(arg->histogram_predivider);
-	rkisp1_write(params->rkisp1, hist_prop, RKISP1_CIF_ISP_HIST_PROP_V10);
-	rkisp1_write(params->rkisp1,
-		     arg->meas_window.h_offs,
-		     RKISP1_CIF_ISP_HIST_H_OFFS_V10);
-	rkisp1_write(params->rkisp1,
-		     arg->meas_window.v_offs,
-		     RKISP1_CIF_ISP_HIST_V_OFFS_V10);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_HIST_PROP_V10, hist_prop);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_HIST_H_OFFS_V10,
+		     arg->meas_window.h_offs);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_HIST_V_OFFS_V10,
+		     arg->meas_window.v_offs);
 
 	block_hsize = arg->meas_window.h_size /
 		      RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10 - 1;
 	block_vsize = arg->meas_window.v_size / RKISP1_CIF_ISP_HIST_ROW_NUM_V10 - 1;
 
-	rkisp1_write(params->rkisp1, block_hsize, RKISP1_CIF_ISP_HIST_H_SIZE_V10);
-	rkisp1_write(params->rkisp1, block_vsize, RKISP1_CIF_ISP_HIST_V_SIZE_V10);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_HIST_H_SIZE_V10,
+		     block_hsize);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_HIST_V_SIZE_V10,
+		     block_vsize);
 
 	weight = arg->hist_weight;
 	for (i = 0; i < ARRAY_SIZE(hist_weight_regs); ++i, weight += 4)
-		rkisp1_write(params->rkisp1,
-			     RKISP1_CIF_ISP_HIST_WEIGHT_SET_V10(weight[0],
-							    weight[1],
-							    weight[2],
-							    weight[3]),
-				 hist_weight_regs[i]);
+		rkisp1_write(params->rkisp1, hist_weight_regs[i],
+			     RKISP1_CIF_ISP_HIST_WEIGHT_SET_V10(weight[0], weight[1],
+								weight[2], weight[3]));
 
-	rkisp1_write(params->rkisp1, weight[0] & 0x1F, RKISP1_CIF_ISP_HIST_WEIGHT_44_V10);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_HIST_WEIGHT_44_V10,
+		     weight[0] & 0x1F);
 }
 
 static void rkisp1_hst_config_v12(struct rkisp1_params *params,
@@ -852,18 +853,16 @@ static void rkisp1_hst_config_v12(struct rkisp1_params *params,
 		    RKISP1_CIF_ISP_HIST_CTRL_AUTOSTOP_SET_V12(0) |
 		    RKISP1_CIF_ISP_HIST_CTRL_WNDNUM_SET_V12(1) |
 		    RKISP1_CIF_ISP_HIST_CTRL_STEPSIZE_SET_V12(arg->histogram_predivider);
-	rkisp1_write(params->rkisp1, hist_ctrl, RKISP1_CIF_ISP_HIST_CTRL_V12);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_HIST_CTRL_V12, hist_ctrl);
 
-	rkisp1_write(params->rkisp1,
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_HIST_OFFS_V12,
 		     RKISP1_CIF_ISP_HIST_OFFS_SET_V12(arg->meas_window.h_offs,
-						      arg->meas_window.v_offs),
-		     RKISP1_CIF_ISP_HIST_OFFS_V12);
+						      arg->meas_window.v_offs));
 
 	block_hsize = arg->meas_window.h_size / hist_wnd_num[wnd_num_idx] - 1;
 	block_vsize = arg->meas_window.v_size / hist_wnd_num[wnd_num_idx] - 1;
-	rkisp1_write(params->rkisp1,
-		     RKISP1_CIF_ISP_HIST_SIZE_SET_V12(block_hsize, block_vsize),
-		     RKISP1_CIF_ISP_HIST_SIZE_V12);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_HIST_SIZE_V12,
+		     RKISP1_CIF_ISP_HIST_SIZE_SET_V12(block_hsize, block_vsize));
 
 	for (i = 0; i < hist_wnd_num[wnd_num_idx]; i++) {
 		for (j = 0; j < hist_wnd_num[wnd_num_idx]; j++) {
@@ -879,12 +878,12 @@ static void rkisp1_hst_config_v12(struct rkisp1_params *params,
 				 weight15x15[4 * i + 1],
 				 weight15x15[4 * i + 2],
 				 weight15x15[4 * i + 3]);
-		rkisp1_write(params->rkisp1, value,
-				 RKISP1_CIF_ISP_HIST_WEIGHT_V12 + 4 * i);
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_HIST_WEIGHT_V12 + 4 * i, value);
 	}
 	value = RKISP1_CIF_ISP_HIST_WEIGHT_SET_V12(weight15x15[4 * i + 0], 0, 0, 0);
-	rkisp1_write(params->rkisp1, value,
-				 RKISP1_CIF_ISP_HIST_WEIGHT_V12 + 4 * i);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_HIST_WEIGHT_V12 + 4 * i,
+		     value);
 }
 
 static void
@@ -938,22 +937,20 @@ static void rkisp1_afm_config_v10(struct rkisp1_params *params,
 				RKISP1_CIF_ISP_AFM_ENA);
 
 	for (i = 0; i < num_of_win; i++) {
-		rkisp1_write(params->rkisp1,
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AFM_LT_A + i * 8,
 			     RKISP1_CIF_ISP_AFM_WINDOW_X(arg->afm_win[i].h_offs) |
-			     RKISP1_CIF_ISP_AFM_WINDOW_Y(arg->afm_win[i].v_offs),
-			     RKISP1_CIF_ISP_AFM_LT_A + i * 8);
-		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_AFM_WINDOW_Y(arg->afm_win[i].v_offs));
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AFM_RB_A + i * 8,
 			     RKISP1_CIF_ISP_AFM_WINDOW_X(arg->afm_win[i].h_size +
 							 arg->afm_win[i].h_offs) |
 			     RKISP1_CIF_ISP_AFM_WINDOW_Y(arg->afm_win[i].v_size +
-							 arg->afm_win[i].v_offs),
-			     RKISP1_CIF_ISP_AFM_RB_A + i * 8);
+							 arg->afm_win[i].v_offs));
 	}
-	rkisp1_write(params->rkisp1, arg->thres, RKISP1_CIF_ISP_AFM_THRES);
-	rkisp1_write(params->rkisp1, arg->var_shift,
-		     RKISP1_CIF_ISP_AFM_VAR_SHIFT);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AFM_THRES, arg->thres);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AFM_VAR_SHIFT,
+		     arg->var_shift);
 	/* restore afm status */
-	rkisp1_write(params->rkisp1, afm_ctrl, RKISP1_CIF_ISP_AFM_CTRL);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AFM_CTRL, afm_ctrl);
 }
 
 static void rkisp1_afm_config_v12(struct rkisp1_params *params,
@@ -970,29 +967,26 @@ static void rkisp1_afm_config_v12(struct rkisp1_params *params,
 				RKISP1_CIF_ISP_AFM_ENA);
 
 	for (i = 0; i < num_of_win; i++) {
-		rkisp1_write(params->rkisp1,
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AFM_LT_A + i * 8,
 			     RKISP1_CIF_ISP_AFM_WINDOW_X(arg->afm_win[i].h_offs) |
-			     RKISP1_CIF_ISP_AFM_WINDOW_Y(arg->afm_win[i].v_offs),
-			     RKISP1_CIF_ISP_AFM_LT_A + i * 8);
-		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_AFM_WINDOW_Y(arg->afm_win[i].v_offs));
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AFM_RB_A + i * 8,
 			     RKISP1_CIF_ISP_AFM_WINDOW_X(arg->afm_win[i].h_size +
 							 arg->afm_win[i].h_offs) |
 			     RKISP1_CIF_ISP_AFM_WINDOW_Y(arg->afm_win[i].v_size +
-							 arg->afm_win[i].v_offs),
-			     RKISP1_CIF_ISP_AFM_RB_A + i * 8);
+							 arg->afm_win[i].v_offs));
 	}
-	rkisp1_write(params->rkisp1, arg->thres, RKISP1_CIF_ISP_AFM_THRES);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AFM_THRES, arg->thres);
 
 	lum_var_shift = RKISP1_CIF_ISP_AFM_GET_LUM_SHIFT_a_V12(arg->var_shift);
 	afm_var_shift = RKISP1_CIF_ISP_AFM_GET_AFM_SHIFT_a_V12(arg->var_shift);
-	rkisp1_write(params->rkisp1,
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AFM_VAR_SHIFT,
 		     RKISP1_CIF_ISP_AFM_SET_SHIFT_a_V12(lum_var_shift, afm_var_shift) |
 		     RKISP1_CIF_ISP_AFM_SET_SHIFT_b_V12(lum_var_shift, afm_var_shift) |
-		     RKISP1_CIF_ISP_AFM_SET_SHIFT_c_V12(lum_var_shift, afm_var_shift),
-		     RKISP1_CIF_ISP_AFM_VAR_SHIFT);
+		     RKISP1_CIF_ISP_AFM_SET_SHIFT_c_V12(lum_var_shift, afm_var_shift));
 
 	/* restore afm status */
-	rkisp1_write(params->rkisp1, afm_ctrl, RKISP1_CIF_ISP_AFM_CTRL);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AFM_CTRL, afm_ctrl);
 }
 
 static void rkisp1_ie_config(struct rkisp1_params *params,
@@ -1011,8 +1005,8 @@ static void rkisp1_ie_config(struct rkisp1_params *params,
 		eff_ctrl |= RKISP1_CIF_IMG_EFF_CTRL_MODE_SEPIA;
 		break;
 	case V4L2_COLORFX_SET_CBCR:
-		rkisp1_write(params->rkisp1, arg->eff_tint,
-			     RKISP1_CIF_IMG_EFF_TINT);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_IMG_EFF_TINT,
+			     arg->eff_tint);
 		eff_ctrl |= RKISP1_CIF_IMG_EFF_CTRL_MODE_SEPIA;
 		break;
 		/*
@@ -1021,26 +1015,26 @@ static void rkisp1_ie_config(struct rkisp1_params *params,
 		 */
 	case V4L2_COLORFX_AQUA:
 		eff_ctrl |= RKISP1_CIF_IMG_EFF_CTRL_MODE_COLOR_SEL;
-		rkisp1_write(params->rkisp1, arg->color_sel,
-			     RKISP1_CIF_IMG_EFF_COLOR_SEL);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_IMG_EFF_COLOR_SEL,
+			     arg->color_sel);
 		break;
 	case V4L2_COLORFX_EMBOSS:
 		eff_ctrl |= RKISP1_CIF_IMG_EFF_CTRL_MODE_EMBOSS;
-		rkisp1_write(params->rkisp1, arg->eff_mat_1,
-			     RKISP1_CIF_IMG_EFF_MAT_1);
-		rkisp1_write(params->rkisp1, arg->eff_mat_2,
-			     RKISP1_CIF_IMG_EFF_MAT_2);
-		rkisp1_write(params->rkisp1, arg->eff_mat_3,
-			     RKISP1_CIF_IMG_EFF_MAT_3);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_IMG_EFF_MAT_1,
+			     arg->eff_mat_1);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_IMG_EFF_MAT_2,
+			     arg->eff_mat_2);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_IMG_EFF_MAT_3,
+			     arg->eff_mat_3);
 		break;
 	case V4L2_COLORFX_SKETCH:
 		eff_ctrl |= RKISP1_CIF_IMG_EFF_CTRL_MODE_SKETCH;
-		rkisp1_write(params->rkisp1, arg->eff_mat_3,
-			     RKISP1_CIF_IMG_EFF_MAT_3);
-		rkisp1_write(params->rkisp1, arg->eff_mat_4,
-			     RKISP1_CIF_IMG_EFF_MAT_4);
-		rkisp1_write(params->rkisp1, arg->eff_mat_5,
-			     RKISP1_CIF_IMG_EFF_MAT_5);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_IMG_EFF_MAT_3,
+			     arg->eff_mat_3);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_IMG_EFF_MAT_4,
+			     arg->eff_mat_4);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_IMG_EFF_MAT_5,
+			     arg->eff_mat_5);
 		break;
 	case V4L2_COLORFX_BW:
 		eff_ctrl |= RKISP1_CIF_IMG_EFF_CTRL_MODE_BLACKWHITE;
@@ -1052,7 +1046,7 @@ static void rkisp1_ie_config(struct rkisp1_params *params,
 		break;
 	}
 
-	rkisp1_write(params->rkisp1, eff_ctrl, RKISP1_CIF_IMG_EFF_CTRL);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_IMG_EFF_CTRL, eff_ctrl);
 }
 
 static void rkisp1_ie_enable(struct rkisp1_params *params, bool en)
@@ -1060,8 +1054,8 @@ static void rkisp1_ie_enable(struct rkisp1_params *params, bool en)
 	if (en) {
 		rkisp1_param_set_bits(params, RKISP1_CIF_VI_ICCL,
 				      RKISP1_CIF_VI_ICCL_IE_CLK);
-		rkisp1_write(params->rkisp1, RKISP1_CIF_IMG_EFF_CTRL_ENABLE,
-			     RKISP1_CIF_IMG_EFF_CTRL);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_IMG_EFF_CTRL,
+			     RKISP1_CIF_IMG_EFF_CTRL_ENABLE);
 		rkisp1_param_set_bits(params, RKISP1_CIF_IMG_EFF_CTRL,
 				      RKISP1_CIF_IMG_EFF_CTRL_CFG_UPD);
 	} else {
@@ -1088,16 +1082,18 @@ static void rkisp1_csm_config(struct rkisp1_params *params, bool full_range)
 
 	if (full_range) {
 		for (i = 0; i < ARRAY_SIZE(full_range_coeff); i++)
-			rkisp1_write(params->rkisp1, full_range_coeff[i],
-				     RKISP1_CIF_ISP_CC_COEFF_0 + i * 4);
+			rkisp1_write(params->rkisp1,
+				     RKISP1_CIF_ISP_CC_COEFF_0 + i * 4,
+				     full_range_coeff[i]);
 
 		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
 				      RKISP1_CIF_ISP_CTRL_ISP_CSM_Y_FULL_ENA |
 				      RKISP1_CIF_ISP_CTRL_ISP_CSM_C_FULL_ENA);
 	} else {
 		for (i = 0; i < ARRAY_SIZE(limited_range_coeff); i++)
-			rkisp1_write(params->rkisp1, limited_range_coeff[i],
-				     RKISP1_CIF_ISP_CC_COEFF_0 + i * 4);
+			rkisp1_write(params->rkisp1,
+				     RKISP1_CIF_ISP_CC_COEFF_0 + i * 4,
+				     limited_range_coeff[i]);
 
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
 					RKISP1_CIF_ISP_CTRL_ISP_CSM_Y_FULL_ENA |
@@ -1152,52 +1148,53 @@ static void rkisp1_dpf_config(struct rkisp1_params *params,
 
 	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DPF_MODE,
 			      isp_dpf_mode);
-	rkisp1_write(params->rkisp1, arg->gain.nf_b_gain,
-		     RKISP1_CIF_ISP_DPF_NF_GAIN_B);
-	rkisp1_write(params->rkisp1, arg->gain.nf_r_gain,
-		     RKISP1_CIF_ISP_DPF_NF_GAIN_R);
-	rkisp1_write(params->rkisp1, arg->gain.nf_gb_gain,
-		     RKISP1_CIF_ISP_DPF_NF_GAIN_GB);
-	rkisp1_write(params->rkisp1, arg->gain.nf_gr_gain,
-		     RKISP1_CIF_ISP_DPF_NF_GAIN_GR);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPF_NF_GAIN_B,
+		     arg->gain.nf_b_gain);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPF_NF_GAIN_R,
+		     arg->gain.nf_r_gain);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPF_NF_GAIN_GB,
+		     arg->gain.nf_gb_gain);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPF_NF_GAIN_GR,
+		     arg->gain.nf_gr_gain);
 
 	for (i = 0; i < RKISP1_CIF_ISP_DPF_MAX_NLF_COEFFS; i++) {
-		rkisp1_write(params->rkisp1, arg->nll.coeff[i],
-			     RKISP1_CIF_ISP_DPF_NULL_COEFF_0 + i * 4);
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_DPF_NULL_COEFF_0 + i * 4,
+			     arg->nll.coeff[i]);
 	}
 
 	spatial_coeff = arg->g_flt.spatial_coeff[0] |
 			(arg->g_flt.spatial_coeff[1] << 8) |
 			(arg->g_flt.spatial_coeff[2] << 16) |
 			(arg->g_flt.spatial_coeff[3] << 24);
-	rkisp1_write(params->rkisp1, spatial_coeff,
-		     RKISP1_CIF_ISP_DPF_S_WEIGHT_G_1_4);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPF_S_WEIGHT_G_1_4,
+		     spatial_coeff);
 
 	spatial_coeff = arg->g_flt.spatial_coeff[4] |
 			(arg->g_flt.spatial_coeff[5] << 8);
-	rkisp1_write(params->rkisp1, spatial_coeff,
-		     RKISP1_CIF_ISP_DPF_S_WEIGHT_G_5_6);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPF_S_WEIGHT_G_5_6,
+		     spatial_coeff);
 
 	spatial_coeff = arg->rb_flt.spatial_coeff[0] |
 			(arg->rb_flt.spatial_coeff[1] << 8) |
 			(arg->rb_flt.spatial_coeff[2] << 16) |
 			(arg->rb_flt.spatial_coeff[3] << 24);
-	rkisp1_write(params->rkisp1, spatial_coeff,
-		     RKISP1_CIF_ISP_DPF_S_WEIGHT_RB_1_4);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPF_S_WEIGHT_RB_1_4,
+		     spatial_coeff);
 
 	spatial_coeff = arg->rb_flt.spatial_coeff[4] |
 			(arg->rb_flt.spatial_coeff[5] << 8);
-	rkisp1_write(params->rkisp1, spatial_coeff,
-		     RKISP1_CIF_ISP_DPF_S_WEIGHT_RB_5_6);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPF_S_WEIGHT_RB_5_6,
+		     spatial_coeff);
 }
 
 static void
 rkisp1_dpf_strength_config(struct rkisp1_params *params,
 			   const struct rkisp1_cif_isp_dpf_strength_config *arg)
 {
-	rkisp1_write(params->rkisp1, arg->b, RKISP1_CIF_ISP_DPF_STRENGTH_B);
-	rkisp1_write(params->rkisp1, arg->g, RKISP1_CIF_ISP_DPF_STRENGTH_G);
-	rkisp1_write(params->rkisp1, arg->r, RKISP1_CIF_ISP_DPF_STRENGTH_R);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPF_STRENGTH_B, arg->b);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPF_STRENGTH_G, arg->g);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPF_STRENGTH_R, arg->r);
 }
 
 static void
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index df2beee1be99..b88d579a283c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -222,7 +222,7 @@ static void rkisp1_dcrop_disable(struct rkisp1_resizer *rsz,
 		dc_ctrl |= RKISP1_CIF_DUAL_CROP_GEN_CFG_UPD;
 	else
 		dc_ctrl |= RKISP1_CIF_DUAL_CROP_CFG_UPD;
-	rkisp1_write(rsz->rkisp1, dc_ctrl, rsz->config->dual_crop.ctrl);
+	rkisp1_write(rsz->rkisp1, rsz->config->dual_crop.ctrl, dc_ctrl);
 }
 
 /* configure dual-crop unit */
@@ -247,13 +247,13 @@ static void rkisp1_dcrop_config(struct rkisp1_resizer *rsz)
 	}
 
 	dc_ctrl = rkisp1_read(rkisp1, rsz->config->dual_crop.ctrl);
-	rkisp1_write(rkisp1, sink_crop->left, rsz->config->dual_crop.h_offset);
-	rkisp1_write(rkisp1, sink_crop->top, rsz->config->dual_crop.v_offset);
-	rkisp1_write(rkisp1, sink_crop->width, rsz->config->dual_crop.h_size);
-	rkisp1_write(rkisp1, sink_crop->height, rsz->config->dual_crop.v_size);
+	rkisp1_write(rkisp1, rsz->config->dual_crop.h_offset, sink_crop->left);
+	rkisp1_write(rkisp1, rsz->config->dual_crop.v_offset, sink_crop->top);
+	rkisp1_write(rkisp1, rsz->config->dual_crop.h_size, sink_crop->width);
+	rkisp1_write(rkisp1, rsz->config->dual_crop.v_size, sink_crop->height);
 	dc_ctrl |= rsz->config->dual_crop.yuvmode_mask;
 	dc_ctrl |= RKISP1_CIF_DUAL_CROP_CFG_UPD;
-	rkisp1_write(rkisp1, dc_ctrl, rsz->config->dual_crop.ctrl);
+	rkisp1_write(rkisp1, rsz->config->dual_crop.ctrl, dc_ctrl);
 
 	dev_dbg(rkisp1->dev, "stream %d crop: %dx%d -> %dx%d\n", rsz->id,
 		sink_fmt->width, sink_fmt->height,
@@ -309,7 +309,7 @@ static void rkisp1_rsz_update_shadow(struct rkisp1_resizer *rsz,
 	else
 		ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD;
 
-	rkisp1_write(rsz->rkisp1, ctrl_cfg, rsz->config->rsz.ctrl);
+	rkisp1_write(rsz->rkisp1, rsz->config->rsz.ctrl, ctrl_cfg);
 }
 
 static u32 rkisp1_rsz_calc_ratio(u32 len_sink, u32 len_src)
@@ -325,7 +325,7 @@ static u32 rkisp1_rsz_calc_ratio(u32 len_sink, u32 len_src)
 static void rkisp1_rsz_disable(struct rkisp1_resizer *rsz,
 			       enum rkisp1_shadow_regs_when when)
 {
-	rkisp1_write(rsz->rkisp1, 0, rsz->config->rsz.ctrl);
+	rkisp1_write(rsz->rkisp1, rsz->config->rsz.ctrl, 0);
 
 	if (when == RKISP1_SHADOW_REGS_SYNC)
 		rkisp1_rsz_update_shadow(rsz, when);
@@ -343,15 +343,15 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
 	unsigned int i;
 
 	/* No phase offset */
-	rkisp1_write(rkisp1, 0, rsz->config->rsz.phase_hy);
-	rkisp1_write(rkisp1, 0, rsz->config->rsz.phase_hc);
-	rkisp1_write(rkisp1, 0, rsz->config->rsz.phase_vy);
-	rkisp1_write(rkisp1, 0, rsz->config->rsz.phase_vc);
+	rkisp1_write(rkisp1, rsz->config->rsz.phase_hy, 0);
+	rkisp1_write(rkisp1, rsz->config->rsz.phase_hc, 0);
+	rkisp1_write(rkisp1, rsz->config->rsz.phase_vy, 0);
+	rkisp1_write(rkisp1, rsz->config->rsz.phase_vc, 0);
 
 	/* Linear interpolation */
 	for (i = 0; i < 64; i++) {
-		rkisp1_write(rkisp1, i, rsz->config->rsz.scale_lut_addr);
-		rkisp1_write(rkisp1, i, rsz->config->rsz.scale_lut);
+		rkisp1_write(rkisp1, rsz->config->rsz.scale_lut_addr, i);
+		rkisp1_write(rkisp1, rsz->config->rsz.scale_lut, i);
 	}
 
 	if (sink_y->width != src_y->width) {
@@ -359,7 +359,7 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
 		if (sink_y->width < src_y->width)
 			rsz_ctrl |= RKISP1_CIF_RSZ_CTRL_SCALE_HY_UP;
 		ratio = rkisp1_rsz_calc_ratio(sink_y->width, src_y->width);
-		rkisp1_write(rkisp1, ratio, rsz->config->rsz.scale_hy);
+		rkisp1_write(rkisp1, rsz->config->rsz.scale_hy, ratio);
 	}
 
 	if (sink_c->width != src_c->width) {
@@ -367,8 +367,8 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
 		if (sink_c->width < src_c->width)
 			rsz_ctrl |= RKISP1_CIF_RSZ_CTRL_SCALE_HC_UP;
 		ratio = rkisp1_rsz_calc_ratio(sink_c->width, src_c->width);
-		rkisp1_write(rkisp1, ratio, rsz->config->rsz.scale_hcb);
-		rkisp1_write(rkisp1, ratio, rsz->config->rsz.scale_hcr);
+		rkisp1_write(rkisp1, rsz->config->rsz.scale_hcb, ratio);
+		rkisp1_write(rkisp1, rsz->config->rsz.scale_hcr, ratio);
 	}
 
 	if (sink_y->height != src_y->height) {
@@ -376,7 +376,7 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
 		if (sink_y->height < src_y->height)
 			rsz_ctrl |= RKISP1_CIF_RSZ_CTRL_SCALE_VY_UP;
 		ratio = rkisp1_rsz_calc_ratio(sink_y->height, src_y->height);
-		rkisp1_write(rkisp1, ratio, rsz->config->rsz.scale_vy);
+		rkisp1_write(rkisp1, rsz->config->rsz.scale_vy, ratio);
 	}
 
 	if (sink_c->height != src_c->height) {
@@ -384,10 +384,10 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
 		if (sink_c->height < src_c->height)
 			rsz_ctrl |= RKISP1_CIF_RSZ_CTRL_SCALE_VC_UP;
 		ratio = rkisp1_rsz_calc_ratio(sink_c->height, src_c->height);
-		rkisp1_write(rkisp1, ratio, rsz->config->rsz.scale_vc);
+		rkisp1_write(rkisp1, rsz->config->rsz.scale_vc, ratio);
 	}
 
-	rkisp1_write(rkisp1, rsz_ctrl, rsz->config->rsz.ctrl);
+	rkisp1_write(rkisp1, rsz->config->rsz.ctrl, rsz_ctrl);
 
 	rkisp1_rsz_update_shadow(rsz, when);
 }
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
index 26ef3bbe43d0..b7ae9166c52f 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
@@ -408,7 +408,7 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
 
 	spin_lock(&stats->lock);
 
-	rkisp1_write(rkisp1, RKISP1_STATS_MEAS_MASK, RKISP1_CIF_ISP_ICR);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, RKISP1_STATS_MEAS_MASK);
 
 	isp_mis_tmp = rkisp1_read(rkisp1, RKISP1_CIF_ISP_MIS);
 	if (isp_mis_tmp & RKISP1_STATS_MEAS_MASK)
-- 
Regards,

Laurent Pinchart

