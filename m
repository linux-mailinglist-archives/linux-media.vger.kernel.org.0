Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1EAB272093
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbgIUKXZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbgIUKUu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:20:50 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73620C061755
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:50 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id q9so11566560wmj.2
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XUCRDH6iHP/B7aPgUO/p342/Ws8bKasBR0X3UR3PF+I=;
        b=COEGfMiFZniPYReKLoWfHR9tS+laqXb9erzlYjDHLUnLrwz0wv6itTpod8UALUjn9i
         CckJCm4NK0/nwWiIdp21MpKvskhvcuxTfpzCeaKWybxDA1xUfz4ogGR2IHS9lVpJzsLu
         wBsBnWZjkJ4tuUcprvJ1RNy4PtuDMMX3uKdOUvJ4M27IFjBUWxXgFfI+QJHCayQsJO3s
         SMwlXUIXP9bViMENlKKWaLnfb4Nk4fPJ5/hbXU3gjfB8jXH0vg5sYs3WPIRDchrcKWsc
         dAYMUnZbfBg3bbLcVxi++zEhfwgUNOWHxxjDF/IQ25Q6twqzEJjQ6C7ULa6IGDtzOZqr
         0/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XUCRDH6iHP/B7aPgUO/p342/Ws8bKasBR0X3UR3PF+I=;
        b=LToZ06Dy8/+DYrXKd34h0EkhPKi6PNyqzbbJ9yzxJqLd3fsPlmicdHx8VgVCm/J+6A
         kCVfblsXUul8+31RDTdgMUYba/fisvXdNK40WPN0FogOZiSeiE8c+vctG+b+H5ibnTsi
         XL/uH1oAbEuOhBc24KKmPNljvG4UznSWg19TlACrBNpPdEp/B7FshNVuH9JG6k432ZR1
         3jDPoQmU++aXKUi6L19ufGMJenb81XnjFF9/WrQoYu3P9NGUApUWhhTV71sL4Mm9Hbih
         BIXpQxgSEvewTUkJfSTImc698PnyHmkwXdN7YxnctVK8eWG01MpQGos9zFAfJY2nrMTl
         CCYg==
X-Gm-Message-State: AOAM5330PaCavDRMTHzMV4/uY3aIeSP65TIh4fBE0GWND94nb62HZNJE
        63UvnPrRKDblVb1oaRa+XkB7ZQ==
X-Google-Smtp-Source: ABdhPJww3+HOO9uP4NbpSoCHegjIzTUgjpnk7lEmGXSWSZ+qbnX+IR0Tn9nDi7Xvljaj39CspqSQgw==
X-Received: by 2002:a7b:c1d4:: with SMTP id a20mr29620554wmj.30.1600683649047;
        Mon, 21 Sep 2020 03:20:49 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.20.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:20:48 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 17/49] staging: media: zoran: move buffer_size out of zoran_fh
Date:   Mon, 21 Sep 2020 10:19:52 +0000
Message-Id: <1600683624-5863-18-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to get rid of zoran_fh, so move the buffer_size directly in the
zoran structure.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran.h        |  3 +-
 drivers/staging/media/zoran/zoran_device.c |  3 +-
 drivers/staging/media/zoran/zoran_driver.c | 62 +++++++++++-----------
 3 files changed, 35 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index 1b3eceaead5a..97933c550113 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -195,7 +195,7 @@ enum zoran_lock_activity {
 /* buffer collections */
 struct zoran_buffer_col {
 	enum zoran_lock_activity active;	/* feature currently in use? */
-	unsigned int num_buffers, buffer_size;
+	unsigned int num_buffers;
 	struct zoran_buffer buffer[MAX_FRAME];	/* buffers */
 	u8 allocated;		/* Flag if buffers are allocated */
 	u8 need_contiguous;	/* Flag if contiguous buffers are needed */
@@ -292,6 +292,7 @@ struct zoran {
 	v4l2_std_id norm;
 
 	/* Current buffer params */
+	unsigned int buffer_size;
 	void *vbuf_base;
 	int vbuf_height, vbuf_width;
 	int vbuf_depth;
diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index a33de61a5e9b..4f9b28e63ac0 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -882,8 +882,7 @@ void jpeg_start(struct zoran *zr)
 void zr36057_enable_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 {
 	struct vfe_settings cap;
-	int field_size =
-	    zr->jpg_buffers.buffer_size / zr->jpg_settings.field_per_buff;
+	int field_size = zr->buffer_size / zr->jpg_settings.field_per_buff;
 
 	zr->codec_mode = mode;
 
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index a996161cb276..a97faf54e19d 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -178,15 +178,18 @@ static void jpg_fbuffer_free(struct zoran_fh *fh);
 /* Set mapping mode */
 static void map_mode_raw(struct zoran_fh *fh)
 {
+	struct zoran *zr = fh->zr;
 	fh->map_mode = ZORAN_MAP_MODE_RAW;
-	fh->buffers.buffer_size = v4l_bufsize;
+	zr->buffer_size = v4l_bufsize;
 	fh->buffers.num_buffers = v4l_nbufs;
 }
 
 static void map_mode_jpg(struct zoran_fh *fh, int play)
 {
+	struct zoran *zr = fh->zr;
+
 	fh->map_mode = play ? ZORAN_MAP_MODE_JPG_PLAY : ZORAN_MAP_MODE_JPG_REC;
-	fh->buffers.buffer_size = jpg_bufsize;
+	zr->buffer_size = jpg_bufsize;
 	fh->buffers.num_buffers = jpg_nbufs;
 }
 
@@ -212,7 +215,7 @@ static int v4l_fbuffer_alloc(struct zoran_fh *fh)
 			pci_warn(zr->pci_dev, "%s - buffer %d already allocated!?\n", __func__, i);
 
 		//udelay(20);
-		mem = kmalloc(fh->buffers.buffer_size, GFP_KERNEL | __GFP_NOWARN);
+		mem = kmalloc(zr->buffer_size, GFP_KERNEL | __GFP_NOWARN);
 		if (!mem) {
 			pci_err(zr->pci_dev, "%s - kmalloc for V4L buf %d failed\n", __func__, i);
 			v4l_fbuffer_free(fh);
@@ -221,7 +224,7 @@ static int v4l_fbuffer_alloc(struct zoran_fh *fh)
 		fh->buffers.buffer[i].v4l.fbuffer = mem;
 		fh->buffers.buffer[i].v4l.fbuffer_phys = virt_to_phys(mem);
 		fh->buffers.buffer[i].v4l.fbuffer_bus = virt_to_bus(mem);
-		for (off = 0; off < fh->buffers.buffer_size;
+		for (off = 0; off < zr->buffer_size;
 		     off += PAGE_SIZE)
 			SetPageReserved(virt_to_page(mem + off));
 		pci_info(zr->pci_dev, "%s - V4L frame %d mem %p (bus: 0x%llx)\n", __func__, i, mem,
@@ -247,7 +250,7 @@ static void v4l_fbuffer_free(struct zoran_fh *fh)
 			continue;
 
 		mem = fh->buffers.buffer[i].v4l.fbuffer;
-		for (off = 0; off < fh->buffers.buffer_size;
+		for (off = 0; off < zr->buffer_size;
 		     off += PAGE_SIZE)
 			ClearPageReserved(virt_to_page(mem + off));
 		kfree(fh->buffers.buffer[i].v4l.fbuffer);
@@ -307,7 +310,7 @@ static int jpg_fbuffer_alloc(struct zoran_fh *fh)
 		fh->buffers.buffer[i].jpg.frag_tab_bus = virt_to_bus(mem);
 
 		if (fh->buffers.need_contiguous) {
-			mem = kmalloc(fh->buffers.buffer_size, GFP_KERNEL);
+			mem = kmalloc(zr->buffer_size, GFP_KERNEL);
 			if (!mem) {
 				pci_err(zr->pci_dev, "%s - kmalloc failed for buffer %d\n", __func__, i);
 				jpg_fbuffer_free(fh);
@@ -316,12 +319,12 @@ static int jpg_fbuffer_alloc(struct zoran_fh *fh)
 			fh->buffers.buffer[i].jpg.frag_tab[0] =
 				cpu_to_le32(virt_to_bus(mem));
 			fh->buffers.buffer[i].jpg.frag_tab[1] =
-				cpu_to_le32((fh->buffers.buffer_size >> 1) | 1);
-			for (off = 0; off < fh->buffers.buffer_size; off += PAGE_SIZE)
+				cpu_to_le32((zr->buffer_size >> 1) | 1);
+			for (off = 0; off < zr->buffer_size; off += PAGE_SIZE)
 				SetPageReserved(virt_to_page(mem + off));
 		} else {
 			/* jpg_bufsize is already page aligned */
-			for (j = 0; j < fh->buffers.buffer_size / PAGE_SIZE; j++) {
+			for (j = 0; j < zr->buffer_size / PAGE_SIZE; j++) {
 				mem = (void *)get_zeroed_page(GFP_KERNEL);
 				if (!mem) {
 					pci_err(zr->pci_dev, "%s - get_zeroed_page failed for buffer %d\n", __func__, i);
@@ -341,7 +344,7 @@ static int jpg_fbuffer_alloc(struct zoran_fh *fh)
 	}
 
 	pci_dbg(zr->pci_dev, "%s - %d KB allocated\n", __func__,
-		(fh->buffers.num_buffers * fh->buffers.buffer_size) >> 10);
+		(fh->buffers.num_buffers * zr->buffer_size) >> 10);
 
 	fh->buffers.allocated = 1;
 
@@ -369,14 +372,14 @@ static void jpg_fbuffer_free(struct zoran_fh *fh)
 
 			if (frag_tab) {
 				mem = bus_to_virt(le32_to_cpu(frag_tab));
-				for (off = 0; off < fh->buffers.buffer_size; off += PAGE_SIZE)
+				for (off = 0; off < zr->buffer_size; off += PAGE_SIZE)
 					ClearPageReserved(virt_to_page(mem + off));
 				kfree(mem);
 				buffer->jpg.frag_tab[0] = 0;
 				buffer->jpg.frag_tab[1] = 0;
 			}
 		} else {
-			for (j = 0; j < fh->buffers.buffer_size / PAGE_SIZE; j++) {
+			for (j = 0; j < zr->buffer_size / PAGE_SIZE; j++) {
 				frag_tab = buffer->jpg.frag_tab[2 * j];
 
 				if (!frag_tab)
@@ -416,9 +419,9 @@ static int zoran_v4l_set_format(struct zoran_fh *fh, int width, int height,
 	bpp = (format->depth + 7) / 8;
 
 	/* Check against available buffer size */
-	if (height * width * bpp > fh->buffers.buffer_size) {
+	if (height * width * bpp > zr->buffer_size) {
 		pci_err(zr->pci_dev, "%s - video buffer size (%d kB) is too small\n",
-			__func__, fh->buffers.buffer_size >> 10);
+			__func__, zr->buffer_size >> 10);
 		return -EINVAL;
 	}
 
@@ -1189,7 +1192,7 @@ static int zoran_v4l2_buffer_status(struct zoran_fh *fh,
 		spin_unlock_irqrestore(&zr->spinlock, flags);
 
 		buf->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-		buf->length = fh->buffers.buffer_size;
+		buf->length = zr->buffer_size;
 
 		/* get buffer */
 		buf->bytesused = fh->buffers.buffer[num].bs.length;
@@ -1222,7 +1225,7 @@ static int zoran_v4l2_buffer_status(struct zoran_fh *fh,
 		buf->type = (fh->map_mode == ZORAN_MAP_MODE_JPG_REC) ?
 			      V4L2_BUF_TYPE_VIDEO_CAPTURE :
 			      V4L2_BUF_TYPE_VIDEO_OUTPUT;
-		buf->length = fh->buffers.buffer_size;
+		buf->length = zr->buffer_size;
 
 		/* these variables are only written after frame has been captured */
 		if (fh->buffers.buffer[num].state == BUZ_STATE_DONE ||
@@ -1634,7 +1637,7 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh, struct v4l2_format
 	fh->jpg_settings = settings;
 
 	map_mode_jpg(fh, fmt->type == V4L2_BUF_TYPE_VIDEO_OUTPUT);
-	fh->buffers.buffer_size = zoran_v4l2_calc_bufsize(&fh->jpg_settings);
+	zr->buffer_size = zoran_v4l2_calc_bufsize(&fh->jpg_settings);
 
 	/* tell the user what we actually did */
 	fmt->fmt.pix.width = settings.img_width / settings.HorDcm;
@@ -1646,7 +1649,7 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh, struct v4l2_format
 		fmt->fmt.pix.field = (fh->jpg_settings.odd_even ?
 				V4L2_FIELD_TOP : V4L2_FIELD_BOTTOM);
 	fmt->fmt.pix.bytesperline = 0;
-	fmt->fmt.pix.sizeimage = fh->buffers.buffer_size;
+	fmt->fmt.pix.sizeimage = zr->buffer_size;
 	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SMPTE170M;
 	return res;
 }
@@ -1798,7 +1801,7 @@ static int zoran_reqbufs(struct file *file, void *__fh, struct v4l2_requestbuffe
 		/* The next mmap will map the MJPEG buffers */
 		map_mode_jpg(fh, req->type == V4L2_BUF_TYPE_VIDEO_OUTPUT);
 		fh->buffers.num_buffers = req->count;
-		fh->buffers.buffer_size = zoran_v4l2_calc_bufsize(&fh->jpg_settings);
+		zr->buffer_size = zoran_v4l2_calc_bufsize(&fh->jpg_settings);
 
 		if (jpg_fbuffer_alloc(fh)) {
 			res = -ENOMEM;
@@ -2270,8 +2273,7 @@ static int zoran_s_jpegcomp(struct file *file, void *__fh,
 	if (res)
 		return res;
 	if (!fh->buffers.allocated)
-		fh->buffers.buffer_size =
-			zoran_v4l2_calc_bufsize(&fh->jpg_settings);
+		zr->buffer_size = zoran_v4l2_calc_bufsize(&fh->jpg_settings);
 	fh->jpg_settings.jpg_comp = settings.jpg_comp;
 	return res;
 }
@@ -2437,15 +2439,15 @@ static int zoran_mmap(struct file *file, struct vm_area_struct *vma)
 		return res;
 	}
 
-	first = offset / fh->buffers.buffer_size;
-	last = first - 1 + size / fh->buffers.buffer_size;
-	if (offset % fh->buffers.buffer_size != 0 ||
-	    size % fh->buffers.buffer_size != 0 || first < 0 ||
+	first = offset / zr->buffer_size;
+	last = first - 1 + size / zr->buffer_size;
+	if (offset % zr->buffer_size != 0 ||
+	    size % zr->buffer_size != 0 || first < 0 ||
 	    last < 0 || first >= fh->buffers.num_buffers ||
-	    last >= fh->buffers.buffer_size) {
+	    last >= zr->buffer_size) {
 		pci_err(zr->pci_dev, "%s(%s) - offset=%lu or size=%lu invalid for bufsize=%d and numbufs=%d\n",
 			__func__, mode_name(fh->map_mode), offset, size,
-			fh->buffers.buffer_size,
+			zr->buffer_size,
 			fh->buffers.num_buffers);
 		res = -EINVAL;
 		return res;
@@ -2476,8 +2478,8 @@ static int zoran_mmap(struct file *file, struct vm_area_struct *vma)
 	if (fh->map_mode == ZORAN_MAP_MODE_RAW) {
 		for (i = first; i <= last; i++) {
 			todo = size;
-			if (todo > fh->buffers.buffer_size)
-				todo = fh->buffers.buffer_size;
+			if (todo > zr->buffer_size)
+				todo = zr->buffer_size;
 			page = fh->buffers.buffer[i].v4l.fbuffer_phys;
 			if (remap_pfn_range(vma, start, page >> PAGE_SHIFT,
 					    todo, PAGE_SHARED)) {
@@ -2494,7 +2496,7 @@ static int zoran_mmap(struct file *file, struct vm_area_struct *vma)
 	} else {
 		for (i = first; i <= last; i++) {
 			for (j = 0;
-			     j < fh->buffers.buffer_size / PAGE_SIZE;
+			     j < zr->buffer_size / PAGE_SIZE;
 			     j++) {
 				fraglen =
 				    (le32_to_cpu(fh->buffers.buffer[i].jpg.
-- 
2.26.2

