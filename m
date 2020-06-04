Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5C71EE5FD
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 15:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728937AbgFDNxn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 09:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728914AbgFDNxg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 09:53:36 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09BFC08C5C3
        for <linux-media@vger.kernel.org>; Thu,  4 Jun 2020 06:53:35 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id r15so5720080wmh.5
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2020 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qIT7c2oqfX1dSt07GW6kZ3aWJcY6gqtFPD+/6G9C5xg=;
        b=SQ09LMb+H0DI40E9jW+JuSyMI8/9Kx4mI5GDMSzBJtzMiZTPtZy0Hrc4vGk7IeUBnp
         4dWbQ653AY5f7X8uKkjS2oI1u9xzQKJ3pqaArLeWGXKXCKI3ZqXS0nGafiTFRLByrxPA
         5y8q3QkkiMB7fwyc/ex9kn3mmQvX87Xqe3RMYNavHVsQeJVdLU6WA5Tk61sEm2yeBqmm
         EDf7pGfmvKyFmMNq2vupTmUpXo02GnddLU1gi2DRkQ/6czsa1PjPeZbX2a3OcR8aSUlf
         TUQgD4fngYeiQHhvxO+1PmNYZiC2aXEc2/UoKhVyttCSiMY4npPPdYDk9MkggDa+UX1+
         8t2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qIT7c2oqfX1dSt07GW6kZ3aWJcY6gqtFPD+/6G9C5xg=;
        b=FcAdwiMCjaMe5vBQxU63bUpNoDZwV4YFH5q4AJveV1gVR9IkS8wIhsWZTiuXYlN3XN
         xZ9b/5/tUB4l4aCAF6Z/AcOSh2dS0RdCsM8t2QDiMBboUjNAOr64fHY57jNZDTz9HOHE
         wK6QAA7ypenag5cL2CPI4RDP9MO6ODXWadJUlMedYP5ozS1RWX54N52MzhOMi8Wvf9aH
         7jWwgj0dR2J4FOypfaxU20GgdEK9EuYqJJrLq2oIt5tKl8mO6NGMGc1uPKEZRj9JMLRZ
         Cen5luI1reWCPw3oMUHxLOFFgz9shB8lnnQkooV0DfKdYcozKTgMLXvoiGe3OsT90v4/
         NPng==
X-Gm-Message-State: AOAM531/JkviRiglbBafFPbpL7ye/49bR/w97VmJ+IXKq3kk33mHVOMU
        CKS5ri1regAOEWo8NAyqk1TlzQ==
X-Google-Smtp-Source: ABdhPJyASWiMzktejXB41WYV4E54kbk5Ya8KhvN6w7LAwaQwuz7yYg0AKdW7mufmckku0K+tjmsWPg==
X-Received: by 2002:a1c:6884:: with SMTP id d126mr4116671wmc.121.1591278814224;
        Thu, 04 Jun 2020 06:53:34 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:22:5867:d2c6:75f4])
        by smtp.gmail.com with ESMTPSA id i74sm8185599wri.49.2020.06.04.06.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 06:53:33 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 4/5] media: meson: vdec: add support for compressed output for VP9 decoder
Date:   Thu,  4 Jun 2020 15:53:16 +0200
Message-Id: <20200604135317.9235-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200604135317.9235-1-narmstrong@baylibre.com>
References: <20200604135317.9235-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Add the necessary changes to decode VP9 8bit and 10bit streams into
compressed buffers to be imported back into DRM/KMS using a modifier.

On GXL/GXM platforms, the VP9 decoder will output a basic Framebuffer
Compressed layout, with a memory saving option when decoding 8bit to
better align the compressed macroblocks. This layout includes the buffer
content and an header desscribing the compressed buffer.

On G12A and later, the VP9 decoder will output "Scatter" layout, meaning
the header buffer will contain references to the internal memory decoder
workspace and frame memory to construct a compressed framebuffer.

The compressed layout has been described in the DRM Modifier patchset
at [1].

[1] https://patchwork.freedesktop.org/series/73722/#rev7

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../media/meson/vdec/codec_hevc_common.c      | 112 ++++++------------
 .../media/meson/vdec/codec_hevc_common.h      |  13 +-
 drivers/staging/media/meson/vdec/codec_vp9.c  |  19 +--
 3 files changed, 47 insertions(+), 97 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_hevc_common.c b/drivers/staging/media/meson/vdec/codec_hevc_common.c
index c9bf67aa2668..73dae40b3319 100644
--- a/drivers/staging/media/meson/vdec/codec_hevc_common.c
+++ b/drivers/staging/media/meson/vdec/codec_hevc_common.c
@@ -42,9 +42,17 @@ void codec_hevc_setup_decode_head(struct amvdec_session *sess, int is_10bit)
 		return;
 	}
 
+	/* enable mem saving mode for 8-bit */
+	if (!is_10bit)
+		amvdec_write_dos_bits(core, HEVC_SAO_CTRL5, BIT(9));
+	else
+		amvdec_clear_dos_bits(core, HEVC_SAO_CTRL5, BIT(9));
+
 	if (codec_hevc_use_mmu(core->platform->revision,
 			       sess->pixfmt_cap, is_10bit))
 		amvdec_write_dos(core, HEVCD_MPP_DECOMP_CTL1, BIT(4));
+	else if (!is_10bit)
+		amvdec_write_dos(core, HEVCD_MPP_DECOMP_CTL1, BIT(3));
 	else
 		amvdec_write_dos(core, HEVCD_MPP_DECOMP_CTL1, 0);
 
@@ -76,7 +84,7 @@ static void codec_hevc_setup_buffers_gxbb(struct amvdec_session *sess,
 
 		idx = vb->index;
 
-		if (codec_hevc_use_downsample(sess->pixfmt_cap, is_10bit))
+		if (codec_hevc_use_fbc(sess->pixfmt_cap, is_10bit))
 			buf_y_paddr = comm->fbc_buffer_paddr[idx];
 		else
 			buf_y_paddr = vb2_dma_contig_plane_dma_addr(vb, 0);
@@ -117,7 +125,6 @@ static void codec_hevc_setup_buffers_gxl(struct amvdec_session *sess,
 {
 	struct amvdec_core *core = sess->core;
 	struct v4l2_m2m_buffer *buf;
-	u32 revision = core->platform->revision;
 	u32 pixfmt_cap = sess->pixfmt_cap;
 	int i;
 
@@ -130,9 +137,7 @@ static void codec_hevc_setup_buffers_gxl(struct amvdec_session *sess,
 		dma_addr_t buf_uv_paddr = 0;
 		u32 idx = vb->index;
 
-		if (codec_hevc_use_mmu(revision, pixfmt_cap, is_10bit))
-			buf_y_paddr = comm->mmu_header_paddr[idx];
-		else if (codec_hevc_use_downsample(pixfmt_cap, is_10bit))
+		if (codec_hevc_use_downsample(pixfmt_cap, is_10bit))
 			buf_y_paddr = comm->fbc_buffer_paddr[idx];
 		else
 			buf_y_paddr = vb2_dma_contig_plane_dma_addr(vb, 0);
@@ -173,6 +178,14 @@ void codec_hevc_free_fbc_buffers(struct amvdec_session *sess,
 			comm->fbc_buffer_vaddr[i] = NULL;
 		}
 	}
+
+	if (comm->mmu_map_vaddr) {
+		dma_free_coherent(dev, MMU_MAP_SIZE,
+				  comm->mmu_map_vaddr,
+				  comm->mmu_map_paddr);
+		comm->mmu_map_vaddr = NULL;
+	}
+
 }
 EXPORT_SYMBOL_GPL(codec_hevc_free_fbc_buffers);
 
@@ -205,79 +218,29 @@ static int codec_hevc_alloc_fbc_buffers(struct amvdec_session *sess,
 	return 0;
 }
 
-void codec_hevc_free_mmu_headers(struct amvdec_session *sess,
-				 struct codec_hevc_common *comm)
-{
-	struct device *dev = sess->core->dev;
-	int i;
-
-	for (i = 0; i < MAX_REF_PIC_NUM; ++i) {
-		if (comm->mmu_header_vaddr[i]) {
-			dma_free_coherent(dev, MMU_COMPRESS_HEADER_SIZE,
-					  comm->mmu_header_vaddr[i],
-					  comm->mmu_header_paddr[i]);
-			comm->mmu_header_vaddr[i] = NULL;
-		}
-	}
-
-	if (comm->mmu_map_vaddr) {
-		dma_free_coherent(dev, MMU_MAP_SIZE,
-				  comm->mmu_map_vaddr,
-				  comm->mmu_map_paddr);
-		comm->mmu_map_vaddr = NULL;
-	}
-}
-EXPORT_SYMBOL_GPL(codec_hevc_free_mmu_headers);
-
-static int codec_hevc_alloc_mmu_headers(struct amvdec_session *sess,
-					struct codec_hevc_common *comm)
-{
-	struct device *dev = sess->core->dev;
-	struct v4l2_m2m_buffer *buf;
-
-	comm->mmu_map_vaddr = dma_alloc_coherent(dev, MMU_MAP_SIZE,
-						 &comm->mmu_map_paddr,
-						 GFP_KERNEL);
-	if (!comm->mmu_map_vaddr)
-		return -ENOMEM;
-
-	v4l2_m2m_for_each_dst_buf(sess->m2m_ctx, buf) {
-		u32 idx = buf->vb.vb2_buf.index;
-		dma_addr_t paddr;
-		void *vaddr = dma_alloc_coherent(dev, MMU_COMPRESS_HEADER_SIZE,
-						 &paddr, GFP_KERNEL);
-		if (!vaddr) {
-			codec_hevc_free_mmu_headers(sess, comm);
-			return -ENOMEM;
-		}
-
-		comm->mmu_header_vaddr[idx] = vaddr;
-		comm->mmu_header_paddr[idx] = paddr;
-	}
-
-	return 0;
-}
-
 int codec_hevc_setup_buffers(struct amvdec_session *sess,
 			     struct codec_hevc_common *comm,
 			     int is_10bit)
 {
 	struct amvdec_core *core = sess->core;
+	struct device *dev = core->dev;
 	int ret;
 
-	if (codec_hevc_use_downsample(sess->pixfmt_cap, is_10bit)) {
-		ret = codec_hevc_alloc_fbc_buffers(sess, comm);
-		if (ret)
-			return ret;
+	if (codec_hevc_use_mmu(core->platform->revision,
+			       sess->pixfmt_cap, is_10bit)) {
+		comm->mmu_map_vaddr = dma_alloc_coherent(dev, MMU_MAP_SIZE,
+							 &comm->mmu_map_paddr,
+							 GFP_KERNEL);
+		if (!comm->mmu_map_vaddr)
+			return -ENOMEM;
 	}
 
 	if (codec_hevc_use_mmu(core->platform->revision,
-			       sess->pixfmt_cap, is_10bit)) {
-		ret = codec_hevc_alloc_mmu_headers(sess, comm);
-		if (ret) {
-			codec_hevc_free_fbc_buffers(sess, comm);
+			       sess->pixfmt_cap, is_10bit) ||
+	    codec_hevc_use_downsample(sess->pixfmt_cap, is_10bit)) {
+		ret = codec_hevc_alloc_fbc_buffers(sess, comm);
+		if (ret)
 			return ret;
-		}
 	}
 
 	if (core->platform->revision == VDEC_REVISION_GXBB)
@@ -291,24 +254,19 @@ EXPORT_SYMBOL_GPL(codec_hevc_setup_buffers);
 
 void codec_hevc_fill_mmu_map(struct amvdec_session *sess,
 			     struct codec_hevc_common *comm,
-			     struct vb2_buffer *vb)
+			     struct vb2_buffer *vb,
+			     u32 is_10bit)
 {
 	u32 use_mmu = codec_hevc_use_mmu(sess->core->platform->revision,
-					 sess->pixfmt_cap,
-					 sess->bitdepth == 10 ? 1 : 0);
-	u32 size = amvdec_amfbc_size(sess->width, sess->height,
-				     sess->bitdepth == 10 ? 1 : 0,
+					 sess->pixfmt_cap, is_10bit);
+	u32 size = amvdec_amfbc_size(sess->width, sess->height, is_10bit,
 				     use_mmu);
 	u32 nb_pages = size / PAGE_SIZE;
 	u32 *mmu_map = comm->mmu_map_vaddr;
 	u32 first_page;
 	u32 i;
 
-	if (sess->pixfmt_cap == V4L2_PIX_FMT_NV12M)
-		first_page = comm->fbc_buffer_paddr[vb->index] >> PAGE_SHIFT;
-	else
-		first_page = vb2_dma_contig_plane_dma_addr(vb, 0) >> PAGE_SHIFT;
-
+	first_page = comm->fbc_buffer_paddr[vb->index] >> PAGE_SHIFT;
 	for (i = 0; i < nb_pages; ++i)
 		mmu_map[i] = first_page + i;
 }
diff --git a/drivers/staging/media/meson/vdec/codec_hevc_common.h b/drivers/staging/media/meson/vdec/codec_hevc_common.h
index 88e4379ba1ee..5a3c6520940f 100644
--- a/drivers/staging/media/meson/vdec/codec_hevc_common.h
+++ b/drivers/staging/media/meson/vdec/codec_hevc_common.h
@@ -22,9 +22,6 @@ struct codec_hevc_common {
 	void      *fbc_buffer_vaddr[MAX_REF_PIC_NUM];
 	dma_addr_t fbc_buffer_paddr[MAX_REF_PIC_NUM];
 
-	void      *mmu_header_vaddr[MAX_REF_PIC_NUM];
-	dma_addr_t mmu_header_paddr[MAX_REF_PIC_NUM];
-
 	void      *mmu_map_vaddr;
 	dma_addr_t mmu_map_paddr;
 };
@@ -32,14 +29,15 @@ struct codec_hevc_common {
 /* Returns 1 if we must use framebuffer compression */
 static inline int codec_hevc_use_fbc(u32 pixfmt, int is_10bit)
 {
-	/* TOFIX: Handle Amlogic Compressed buffer for 8bit also */
-	return is_10bit;
+	return pixfmt == V4L2_PIX_FMT_YUV420_8BIT ||
+	       pixfmt == V4L2_PIX_FMT_YUV420_10BIT ||
+	       is_10bit;
 }
 
 /* Returns 1 if we are decoding 10-bit but outputting 8-bit NV12 */
 static inline int codec_hevc_use_downsample(u32 pixfmt, int is_10bit)
 {
-	return is_10bit;
+	return pixfmt == V4L2_PIX_FMT_NV12M && is_10bit;
 }
 
 /* Returns 1 if we are decoding using the IOMMU */
@@ -66,6 +64,7 @@ int codec_hevc_setup_buffers(struct amvdec_session *sess,
 
 void codec_hevc_fill_mmu_map(struct amvdec_session *sess,
 			     struct codec_hevc_common *comm,
-			     struct vb2_buffer *vb);
+			     struct vb2_buffer *vb,
+			     u32 is_10bit);
 
 #endif
diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index a810c50f3a39..e193a2f9de9f 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -458,12 +458,6 @@ struct codec_vp9 {
 	struct list_head ref_frames_list;
 	u32 frames_num;
 
-	/* In case of downsampling (decoding with FBC but outputting in NV12M),
-	 * we need to allocate additional buffers for FBC.
-	 */
-	void      *fbc_buffer_vaddr[MAX_REF_PIC_NUM];
-	dma_addr_t fbc_buffer_paddr[MAX_REF_PIC_NUM];
-
 	int ref_frame_map[REF_FRAMES];
 	int next_ref_frame_map[REF_FRAMES];
 	struct vp9_frame *frame_refs[REFS_PER_FRAME];
@@ -901,11 +895,8 @@ static void codec_vp9_set_sao(struct amvdec_session *sess,
 		buf_y_paddr =
 		       vb2_dma_contig_plane_dma_addr(vb, 0);
 
-	if (codec_hevc_use_fbc(sess->pixfmt_cap, vp9->is_10bit)) {
-		val = amvdec_read_dos(core, HEVC_SAO_CTRL5) & ~0xff0200;
-		amvdec_write_dos(core, HEVC_SAO_CTRL5, val);
+	if (codec_hevc_use_fbc(sess->pixfmt_cap, vp9->is_10bit))
 		amvdec_write_dos(core, HEVC_CM_BODY_START_ADDR, buf_y_paddr);
-	}
 
 	if (sess->pixfmt_cap == V4L2_PIX_FMT_NV12M) {
 		buf_y_paddr =
@@ -921,7 +912,7 @@ static void codec_vp9_set_sao(struct amvdec_session *sess,
 	if (codec_hevc_use_mmu(core->platform->revision, sess->pixfmt_cap,
 			       vp9->is_10bit)) {
 		amvdec_write_dos(core, HEVC_CM_HEADER_START_ADDR,
-				 vp9->common.mmu_header_paddr[vb->index]);
+				 vb2_dma_contig_plane_dma_addr(vb, 0));
 		/* use HEVC_CM_HEADER_START_ADDR */
 		amvdec_write_dos_bits(core, HEVC_SAO_CTRL5, BIT(10));
 	}
@@ -956,7 +947,8 @@ static void codec_vp9_set_sao(struct amvdec_session *sess,
 		val &= ~0x3;
 		if (!codec_hevc_use_fbc(sess->pixfmt_cap, vp9->is_10bit))
 			val |= BIT(0); /* disable cm compression */
-		/* TOFIX: Handle Amlogic Framebuffer compression */
+		else if (amvdec_is_dst_fbc(sess))
+			val |= BIT(1); /* Disable double write */
 	}
 
 	amvdec_write_dos(core, HEVC_SAO_CTRL1, val);
@@ -1286,7 +1278,8 @@ static void codec_vp9_process_frame(struct amvdec_session *sess)
 	if (codec_hevc_use_mmu(core->platform->revision, sess->pixfmt_cap,
 			       vp9->is_10bit))
 		codec_hevc_fill_mmu_map(sess, &vp9->common,
-					&vp9->cur_frame->vbuf->vb2_buf);
+					&vp9->cur_frame->vbuf->vb2_buf,
+					vp9->is_10bit);
 
 	intra_only = param->p.show_frame ? 0 : param->p.intra_only;
 
-- 
2.22.0

