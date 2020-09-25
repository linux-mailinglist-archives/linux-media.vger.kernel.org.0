Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 266B42790B3
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbgIYSeu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729726AbgIYSeu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:34:50 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38031C0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:50 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q4so2228912pjh.5
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zWdRTOBLGfmxWIFw5P0xYyCZjv4L5/S6QeConjO/lmw=;
        b=RoQkxRgTBxEmKPAEV0CzblFy82jnQ2JW6j0Dt/MGY991NM84WYP9HsdeVJF/+qK1jH
         nrIPzWLCvpAxFPSCiWBfkcCLUsJQBhwhEshltWdHyKivWKJDc2CAQY2/0BUB4Hs1Y1Jw
         u86gp75DtApxq2TD7VK0IXxsxehwWRSJHICZTCXJQizQaFyArjwjjV6/e6j0c3HuyApP
         AdGTUZ7FkeKgjsUJuy/R2lJlqoWUFldZqLyM8jU3vVhqv7cEg+Sq/9qcT+1DhwnmHSta
         BZn0jBo07a+Uweyhvj84mx8uimqBlK7wYsSraGrIHhSFkTSBnnwfMGpf4g2qBqrXptzO
         S5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zWdRTOBLGfmxWIFw5P0xYyCZjv4L5/S6QeConjO/lmw=;
        b=ulYdzviKAmAMDrdQO76JH3AuQIj9+U8XXZZsEZgOwsf2lHVXvfXRkbG1Gl+InUhWoH
         2HgkGpwAIQ8SPQVTtuiesqdqQtdNXInUMockVWWZ8Vy6j/Ul4IkWzjQ9AfWU4aaeGlrg
         0xPn02qTwiN+vzqW8rpNXbsZJbJ8Ketndu4SCYSWtdRCjmGFx6UMR55mO/Su6TlGaCdp
         AKIbOnPfXv0XpSTKKYLKm/ArPG7+Kl8ooCXSNPKBkSNFjmtYHajQ40942TGwjWPXMV2e
         V9BG51sMYd7/ylgNl9lKgmaeQTeIR0AbYwOJ/Xxyvx5e14PVj9jW6/NjzF47ABmfO3wG
         JTJA==
X-Gm-Message-State: AOAM532aXqM7um7t7HOkYBIjkPC9nFDsklfWgLc+pt3vkhfvYC77/0f2
        hpVZbzJedx3AC2T/wUnr1o93/g==
X-Google-Smtp-Source: ABdhPJxcD+pc+W1DZRYu8EM7MDx+hSANh4bdKVdG7/xWFu19D/n73pi/JkrM3w9SwuaYMhmiuLiiYA==
X-Received: by 2002:a17:90b:138e:: with SMTP id hr14mr760489pjb.161.1601058889674;
        Fri, 25 Sep 2020 11:34:49 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.34.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:34:49 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 36/47] staging: media: zoran: Add vb_queue
Date:   Fri, 25 Sep 2020 18:30:46 +0000
Message-Id: <1601058657-14042-37-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchs adds a vb_queue without using it.
This reduce the final VB2 conversion patch.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/Kconfig        |   1 +
 drivers/staging/media/zoran/zoran.h        |  30 +++
 drivers/staging/media/zoran/zoran_card.c   |   7 +
 drivers/staging/media/zoran/zoran_driver.c | 233 +++++++++++++++++++++
 4 files changed, 271 insertions(+)

diff --git a/drivers/staging/media/zoran/Kconfig b/drivers/staging/media/zoran/Kconfig
index 34a18135ede0..ddf38a931c01 100644
--- a/drivers/staging/media/zoran/Kconfig
+++ b/drivers/staging/media/zoran/Kconfig
@@ -2,6 +2,7 @@ config VIDEO_ZORAN
 	tristate "Zoran ZR36057/36067 Video For Linux (Deprecated)"
 	depends on PCI && I2C_ALGOBIT && VIDEO_V4L2 && VIRT_TO_BUS
 	depends on !ALPHA
+	select VIDEOBUF2_DMA_CONTIG
 	help
 	  Say Y for support for MJPEG capture cards based on the Zoran
 	  36057/36067 PCI controller chipset. This includes the Iomega
diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index 727ba67afd56..294e52d78e1b 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -21,6 +21,9 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fh.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
 
 #define ZR_NORM_PAL 0
 #define ZR_NORM_NTSC 1
@@ -33,6 +36,18 @@ struct zoran_sync {
 	u64 ts;			/* timestamp */
 };
 
+struct zr_buffer {
+	/* common v4l buffer stuff -- must be first */
+	struct vb2_v4l2_buffer          vbuf;
+	struct list_head                queue;
+};
+
+static inline struct zr_buffer *vb2_to_zr_buffer(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	return container_of(vbuf, struct zr_buffer, vbuf);
+}
 
 #define ZORAN_NAME    "ZORAN"	/* name of the device */
 
@@ -104,6 +119,7 @@ enum zoran_buffer_state {
 };
 
 enum zoran_map_mode {
+	ZORAN_MAP_MODE_NONE,
 	ZORAN_MAP_MODE_RAW,
 	ZORAN_MAP_MODE_JPG_REC,
 #define ZORAN_MAP_MODE_JPG ZORAN_MAP_MODE_JPG_REC
@@ -250,6 +266,7 @@ struct zoran {
 	struct v4l2_device v4l2_dev;
 	struct v4l2_ctrl_handler hdl;
 	struct video_device *video_dev;
+	struct vb2_queue vq;
 
 	struct i2c_adapter i2c_adapter;	/* */
 	struct i2c_algo_bit_data i2c_algo;	/* */
@@ -320,6 +337,7 @@ struct zoran {
 	unsigned long jpg_err_seq;	/* last seq_num before error */
 	unsigned long jpg_err_shift;
 	unsigned long jpg_queued_num;	/* count of frames queued since grab/play started */
+	unsigned long vbseq;
 
 	/* zr36057's code buffer table */
 	__le32 *stat_com;		/* stat_com[i] is indexed by dma_head/tail & BUZ_MASK_STAT_COM */
@@ -350,15 +368,23 @@ struct zoran {
 	int num_errors;
 	int JPEG_max_missed;
 	int JPEG_min_missed;
+	unsigned int prepared;
+	unsigned int queued;
 
 	u32 last_isr;
 	unsigned long frame_num;
+	int running;
+	int buf_in_reserve;
 
 	wait_queue_head_t test_q;
 
 	dma_addr_t p_sc;
 	__le32 *stat_comb;
 	dma_addr_t p_scb;
+	enum zoran_map_mode map_mode;
+	struct list_head queued_bufs;
+	spinlock_t queued_bufs_lock; /* Protects queued_bufs */
+	struct zr_buffer *inuse[BUZ_NUM_STAT_COM * 2];
 };
 
 static inline struct zoran *to_zoran(struct v4l2_device *v4l2_dev)
@@ -376,3 +402,7 @@ static inline struct zoran *to_zoran(struct v4l2_device *v4l2_dev)
 #define btaor(dat, mask, adr) btwrite((dat) | ((mask) & btread(adr)), adr)
 
 #endif
+
+int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq);
+void zoran_queue_exit(struct zoran *zr);
+int zr_set_buf(struct zoran *zr);
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 49a1d9e084a8..fed368ba6fd1 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -970,6 +970,9 @@ static int zr36057_init(struct zoran *zr)
 	 * another day.
 	 */
 	zr->video_dev->vfl_dir = VFL_DIR_M2M;
+
+	zoran_queue_init(zr, &zr->vq);
+
 	err = video_register_device(zr->video_dev, VFL_TYPE_VIDEO, video_nr[zr->id]);
 	if (err < 0)
 		goto exit_statcomb;
@@ -1005,6 +1008,8 @@ static void zoran_remove(struct pci_dev *pdev)
 	if (!zr->initialized)
 		goto exit_free;
 
+	zoran_queue_exit(zr);
+
 	/* unregister videocodec bus */
 	if (zr->codec)
 		videocodec_detach(zr->codec);
@@ -1283,6 +1288,8 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (zr36057_init(zr) < 0)
 		goto zr_detach_vfe;
 
+	zr->map_mode = ZORAN_MAP_MODE_RAW;
+
 	return 0;
 
 zr_detach_vfe:
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 5ac832eca501..e962fc6c1f9f 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -2272,3 +2272,236 @@ const struct video_device zoran_template = {
 	.tvnorms = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM,
 };
 
+static int zr_vb2_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers, unsigned int *nplanes,
+			      unsigned int sizes[], struct device *alloc_devs[])
+{
+	struct zoran *zr = vb2_get_drv_priv(vq);
+	unsigned int size = zr->buffer_size;
+
+	pci_dbg(zr->pci_dev, "%s nbuf=%u nplanes=%u", __func__, *nbuffers, *nplanes);
+
+	zr->buf_in_reserve = 0;
+
+	if (*nbuffers < vq->min_buffers_needed)
+		*nbuffers = vq->min_buffers_needed;
+
+	if (*nplanes)
+		if (sizes[0] < size)
+			return -EINVAL;
+		else
+			return 0;
+	*nplanes = 1;
+	sizes[0] = size;
+
+	return 0;
+}
+
+static void zr_vb2_queue(struct vb2_buffer *vb)
+{
+	struct zoran *zr = vb2_get_drv_priv(vb->vb2_queue);
+	struct zr_buffer *buf = vb2_to_zr_buffer(vb);
+	unsigned long flags;
+
+	spin_lock_irqsave(&zr->queued_bufs_lock, flags);
+	list_add_tail(&buf->queue, &zr->queued_bufs);
+	zr->buf_in_reserve++;
+	spin_unlock_irqrestore(&zr->queued_bufs_lock, flags);
+	if (zr->running == ZORAN_MAP_MODE_JPG_REC)
+		zoran_feed_stat_com(zr);
+	zr->queued++;
+}
+
+static int zr_vb2_prepare(struct vb2_buffer *vb)
+{
+	struct zoran *zr = vb2_get_drv_priv(vb->vb2_queue);
+
+	zr->prepared++;
+	return 0;
+}
+
+int zr_set_buf(struct zoran *zr)
+{
+	struct zr_buffer *buf;
+	struct vb2_v4l2_buffer *vbuf;
+	dma_addr_t phys_addr;
+	unsigned long flags;
+	u32 reg;
+
+	if (zr->running == ZORAN_MAP_MODE_NONE)
+		return 0;
+
+	if (zr->inuse[0]) {
+		buf = zr->inuse[0];
+		buf->vbuf.vb2_buf.timestamp = ktime_get_ns();
+		buf->vbuf.sequence = zr->vbseq++;
+		vbuf = &buf->vbuf;
+
+		buf->vbuf.field = V4L2_FIELD_INTERLACED;
+		vb2_set_plane_payload(&buf->vbuf.vb2_buf, 0, zr->buffer_size);
+		vb2_buffer_done(&buf->vbuf.vb2_buf, VB2_BUF_STATE_DONE);
+		zr->inuse[0] = NULL;
+	}
+
+	spin_lock_irqsave(&zr->queued_bufs_lock, flags);
+	if (list_empty(&zr->queued_bufs)) {
+		btand(~ZR36057_ICR_IntPinEn, ZR36057_ICR);
+		vb2_queue_error(zr->video_dev->queue);
+		spin_unlock_irqrestore(&zr->queued_bufs_lock, flags);
+		return -EINVAL;
+	}
+	buf = list_first_entry_or_null(&zr->queued_bufs, struct zr_buffer, queue);
+	if (!buf) {
+		btand(~ZR36057_ICR_IntPinEn, ZR36057_ICR);
+		vb2_queue_error(zr->video_dev->queue);
+		spin_unlock_irqrestore(&zr->queued_bufs_lock, flags);
+		return -EINVAL;
+	}
+	list_del(&buf->queue);
+	spin_unlock_irqrestore(&zr->queued_bufs_lock, flags);
+
+	vbuf = &buf->vbuf;
+	vbuf->vb2_buf.state = VB2_BUF_STATE_ACTIVE;
+	phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
+
+	if (!phys_addr)
+		return -EINVAL;
+
+	zr->inuse[0] = buf;
+
+	reg = phys_addr;
+	btwrite(reg, ZR36057_VDTR);
+	if (zr->v4l_settings.height > BUZ_MAX_HEIGHT / 2)
+		reg += zr->v4l_settings.bytesperline;
+	btwrite(reg, ZR36057_VDBR);
+
+	reg = 0;
+	if (zr->v4l_settings.height > BUZ_MAX_HEIGHT / 2)
+		reg += zr->v4l_settings.bytesperline;
+	reg = (reg << ZR36057_VSSFGR_DispStride);
+	reg |= ZR36057_VSSFGR_VidOvf;
+	reg |= ZR36057_VSSFGR_SnapShot;
+	reg |= ZR36057_VSSFGR_FrameGrab;
+	btwrite(reg, ZR36057_VSSFGR);
+
+	btor(ZR36057_VDCR_VidEn, ZR36057_VDCR);
+	return 0;
+}
+
+static int zr_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct zoran *zr = vq->drv_priv;
+	int j;
+
+	for (j = 0; j < BUZ_NUM_STAT_COM; j++) {
+		zr->stat_com[j] = cpu_to_le32(1);
+		zr->inuse[j] = NULL;
+	}
+
+	if (zr->map_mode != ZORAN_MAP_MODE_RAW) {
+		pci_info(zr->pci_dev, "START JPG\n");
+		zr36057_restart(zr);
+		zoran_init_hardware(zr);
+		if (zr->map_mode == ZORAN_MAP_MODE_JPG_REC)
+			zr36057_enable_jpg(zr, BUZ_MODE_MOTION_DECOMPRESS);
+		else
+			zr36057_enable_jpg(zr, BUZ_MODE_MOTION_COMPRESS);
+		zoran_feed_stat_com(zr);
+		jpeg_start(zr);
+		zr->running = zr->map_mode;
+		btor(ZR36057_ICR_IntPinEn, ZR36057_ICR);
+		return 0;
+	}
+
+	pci_info(zr->pci_dev, "START RAW\n");
+	zr36057_restart(zr);
+	zoran_init_hardware(zr);
+
+	zr36057_enable_jpg(zr, BUZ_MODE_IDLE);
+	zr36057_set_memgrab(zr, 1);
+	zr->running = zr->map_mode;
+	btor(ZR36057_ICR_IntPinEn, ZR36057_ICR);
+	return 0;
+}
+
+static void zr_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct zoran *zr = vq->drv_priv;
+	struct zr_buffer *buf;
+	unsigned long flags;
+	int j;
+
+	btand(~ZR36057_ICR_IntPinEn, ZR36057_ICR);
+	if (zr->map_mode != ZORAN_MAP_MODE_RAW)
+		zr36057_enable_jpg(zr, BUZ_MODE_IDLE);
+	zr36057_set_memgrab(zr, 0);
+	zr->running = ZORAN_MAP_MODE_NONE;
+
+	zoran_set_pci_master(zr, 0);
+
+	if (!pass_through) {	/* Switch to color bar */
+		decoder_call(zr, video, s_stream, 0);
+		encoder_call(zr, video, s_routing, 2, 0, 0);
+	}
+
+	for (j = 0; j < BUZ_NUM_STAT_COM; j++) {
+		zr->stat_com[j] = cpu_to_le32(1);
+		if (!zr->inuse[j])
+			continue;
+		buf = zr->inuse[j];
+		pci_dbg(zr->pci_dev, "%s clean buf %d\n", __func__, j);
+		vb2_buffer_done(&buf->vbuf.vb2_buf, VB2_BUF_STATE_ERROR);
+		zr->inuse[j] = NULL;
+	}
+
+	spin_lock_irqsave(&zr->queued_bufs_lock, flags);
+	while (!list_empty(&zr->queued_bufs)) {
+		buf = list_entry(zr->queued_bufs.next, struct zr_buffer, queue);
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vbuf.vb2_buf, VB2_BUF_STATE_ERROR);
+		zr->buf_in_reserve--;
+	}
+	spin_unlock_irqrestore(&zr->queued_bufs_lock, flags);
+	if (zr->buf_in_reserve)
+		pci_err(zr->pci_dev, "Buffer remaining %d\n", zr->buf_in_reserve);
+	zr->map_mode = ZORAN_MAP_MODE_RAW;
+}
+
+static const struct vb2_ops zr_video_qops = {
+	.queue_setup            = zr_vb2_queue_setup,
+	.buf_queue              = zr_vb2_queue,
+	.buf_prepare            = zr_vb2_prepare,
+	.start_streaming        = zr_vb2_start_streaming,
+	.stop_streaming         = zr_vb2_stop_streaming,
+	.wait_prepare           = vb2_ops_wait_prepare,
+	.wait_finish            = vb2_ops_wait_finish,
+};
+
+int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq)
+{
+	int err;
+
+	spin_lock_init(&zr->queued_bufs_lock);
+	INIT_LIST_HEAD(&zr->queued_bufs);
+
+	vq->dev = &zr->pci_dev->dev;
+	vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	vq->io_modes = VB2_USERPTR | VB2_DMABUF | VB2_MMAP | VB2_READ | VB2_WRITE;
+	vq->drv_priv = zr;
+	vq->buf_struct_size = sizeof(struct zr_buffer);
+	vq->ops = &zr_video_qops;
+	vq->mem_ops = &vb2_dma_contig_memops;
+	vq->gfp_flags = GFP_DMA32,
+	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vq->min_buffers_needed = 9;
+	vq->lock = &zr->lock;
+	err = vb2_queue_init(vq);
+	if (err)
+		return err;
+	zr->video_dev->queue = vq;
+	return 0;
+}
+
+void zoran_queue_exit(struct zoran *zr)
+{
+	vb2_queue_release(zr->video_dev->queue);
+}
-- 
2.26.2

