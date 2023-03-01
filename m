Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 898D76A6B92
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 12:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjCALTA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 06:19:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbjCALS7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 06:18:59 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879A193C6
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 03:18:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 13CB0B80FF2
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 11:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE93FC4339B;
        Wed,  1 Mar 2023 11:18:52 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 1/9] saa7146: drop overlay support
Date:   Wed,  1 Mar 2023 12:18:42 +0100
Message-Id: <20230301111850.607515-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301111850.607515-1-hverkuil-cisco@xs4all.nl>
References: <20230301111850.607515-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Destructive overlay support (i.e. where the video frame is DMA-ed
straight into a framebuffer) is effectively dead. It was a
necessary evil in the early days when computers were not fast enough
to copy SDTV video frames around, but today that's no longer a problem.

It requires access to the framebuffer memory, which is a bad idea and
very hard to do safely. In addition, in drm it is today almost
impossible to get hold of the framebuffer address.

So drop support for this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/saa7146_fops.c  |  22 --
 drivers/media/common/saa7146/saa7146_hlp.c   | 296 -----------------
 drivers/media/common/saa7146/saa7146_video.c | 326 +------------------
 drivers/staging/media/av7110/av7110_v4l.c    |  17 +-
 include/media/drv-intf/saa7146_vv.h          |  21 --
 5 files changed, 5 insertions(+), 677 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
index e9a15de6126e..e61c9e7bddf6 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -516,28 +516,10 @@ int saa7146_vv_init(struct saa7146_dev* dev, struct saa7146_ext_vv *ext_vv)
 	   configuration data) */
 	dev->ext_vv_data = ext_vv;
 
-	vv->d_clipping.cpu_addr =
-		dma_alloc_coherent(&dev->pci->dev, SAA7146_CLIPPING_MEM,
-				   &vv->d_clipping.dma_handle, GFP_KERNEL);
-	if( NULL == vv->d_clipping.cpu_addr ) {
-		ERR("out of memory. aborting.\n");
-		kfree(vv);
-		v4l2_ctrl_handler_free(hdl);
-		v4l2_device_unregister(&dev->v4l2_dev);
-		return -ENOMEM;
-	}
-
 	saa7146_video_uops.init(dev,vv);
 	if (dev->ext_vv_data->capabilities & V4L2_CAP_VBI_CAPTURE)
 		saa7146_vbi_uops.init(dev,vv);
 
-	vv->ov_fb.fmt.width = vv->standard->h_max_out;
-	vv->ov_fb.fmt.height = vv->standard->v_max_out;
-	vv->ov_fb.fmt.pixelformat = V4L2_PIX_FMT_RGB565;
-	vv->ov_fb.fmt.bytesperline = 2 * vv->ov_fb.fmt.width;
-	vv->ov_fb.fmt.sizeimage = vv->ov_fb.fmt.bytesperline * vv->ov_fb.fmt.height;
-	vv->ov_fb.fmt.colorspace = V4L2_COLORSPACE_SRGB;
-
 	fmt = &vv->video_fmt;
 	fmt->width = 384;
 	fmt->height = 288;
@@ -561,8 +543,6 @@ int saa7146_vv_init(struct saa7146_dev* dev, struct saa7146_ext_vv *ext_vv)
 
 	timer_setup(&vv->vbi_read_timeout, NULL, 0);
 
-	vv->ov_fb.capability = V4L2_FBUF_CAP_LIST_CLIPPING;
-	vv->ov_fb.flags = V4L2_FBUF_FLAG_PRIMARY;
 	dev->vv_data = vv;
 	dev->vv_callback = &vv_callback;
 
@@ -577,8 +557,6 @@ int saa7146_vv_release(struct saa7146_dev* dev)
 	DEB_EE("dev:%p\n", dev);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
-	dma_free_coherent(&dev->pci->dev, SAA7146_CLIPPING_MEM,
-			  vv->d_clipping.cpu_addr, vv->d_clipping.dma_handle);
 	v4l2_ctrl_handler_free(&dev->ctrl_handler);
 	kfree(vv);
 	dev->vv_data = NULL;
diff --git a/drivers/media/common/saa7146/saa7146_hlp.c b/drivers/media/common/saa7146/saa7146_hlp.c
index 6c9946a402ee..6792a96d0ba3 100644
--- a/drivers/media/common/saa7146/saa7146_hlp.c
+++ b/drivers/media/common/saa7146/saa7146_hlp.c
@@ -306,221 +306,6 @@ static int calculate_v_scale_registers(struct saa7146_dev *dev, enum v4l2_field
 }
 
 /* simple bubble-sort algorithm with duplicate elimination */
-static int sort_and_eliminate(u32* values, int* count)
-{
-	int low = 0, high = 0, top = 0;
-	int cur = 0, next = 0;
-
-	/* sanity checks */
-	if( (0 > *count) || (NULL == values) ) {
-		return -EINVAL;
-	}
-
-	/* bubble sort the first @count items of the array @values */
-	for( top = *count; top > 0; top--) {
-		for( low = 0, high = 1; high < top; low++, high++) {
-			if( values[low] > values[high] )
-				swap(values[low], values[high]);
-		}
-	}
-
-	/* remove duplicate items */
-	for( cur = 0, next = 1; next < *count; next++) {
-		if( values[cur] != values[next])
-			values[++cur] = values[next];
-	}
-
-	*count = cur + 1;
-
-	return 0;
-}
-
-static void calculate_clipping_registers_rect(struct saa7146_dev *dev, struct saa7146_fh *fh,
-	struct saa7146_video_dma *vdma2, u32* clip_format, u32* arbtr_ctrl, enum v4l2_field field)
-{
-	struct saa7146_vv *vv = dev->vv_data;
-	__le32 *clipping = vv->d_clipping.cpu_addr;
-
-	int width = vv->ov.win.w.width;
-	int height =  vv->ov.win.w.height;
-	int clipcount = vv->ov.nclips;
-
-	u32 line_list[32];
-	u32 pixel_list[32];
-	int numdwords = 0;
-
-	int i = 0, j = 0;
-	int cnt_line = 0, cnt_pixel = 0;
-
-	int x[32], y[32], w[32], h[32];
-
-	/* clear out memory */
-	memset(&line_list[0],  0x00, sizeof(u32)*32);
-	memset(&pixel_list[0], 0x00, sizeof(u32)*32);
-	memset(clipping,  0x00, SAA7146_CLIPPING_MEM);
-
-	/* fill the line and pixel-lists */
-	for(i = 0; i < clipcount; i++) {
-		int l = 0, r = 0, t = 0, b = 0;
-
-		x[i] = vv->ov.clips[i].c.left;
-		y[i] = vv->ov.clips[i].c.top;
-		w[i] = vv->ov.clips[i].c.width;
-		h[i] = vv->ov.clips[i].c.height;
-
-		if( w[i] < 0) {
-			x[i] += w[i]; w[i] = -w[i];
-		}
-		if( h[i] < 0) {
-			y[i] += h[i]; h[i] = -h[i];
-		}
-		if( x[i] < 0) {
-			w[i] += x[i]; x[i] = 0;
-		}
-		if( y[i] < 0) {
-			h[i] += y[i]; y[i] = 0;
-		}
-		if( 0 != vv->vflip ) {
-			y[i] = height - y[i] - h[i];
-		}
-
-		l = x[i];
-		r = x[i]+w[i];
-		t = y[i];
-		b = y[i]+h[i];
-
-		/* insert left/right coordinates */
-		pixel_list[ 2*i   ] = min_t(int, l, width);
-		pixel_list[(2*i)+1] = min_t(int, r, width);
-		/* insert top/bottom coordinates */
-		line_list[ 2*i   ] = min_t(int, t, height);
-		line_list[(2*i)+1] = min_t(int, b, height);
-	}
-
-	/* sort and eliminate lists */
-	cnt_line = cnt_pixel = 2*clipcount;
-	sort_and_eliminate( &pixel_list[0], &cnt_pixel );
-	sort_and_eliminate( &line_list[0], &cnt_line );
-
-	/* calculate the number of used u32s */
-	numdwords = max_t(int, (cnt_line+1), (cnt_pixel+1))*2;
-	numdwords = max_t(int, 4, numdwords);
-	numdwords = min_t(int, 64, numdwords);
-
-	/* fill up cliptable */
-	for(i = 0; i < cnt_pixel; i++) {
-		clipping[2*i] |= cpu_to_le32(pixel_list[i] << 16);
-	}
-	for(i = 0; i < cnt_line; i++) {
-		clipping[(2*i)+1] |= cpu_to_le32(line_list[i] << 16);
-	}
-
-	/* fill up cliptable with the display infos */
-	for(j = 0; j < clipcount; j++) {
-
-		for(i = 0; i < cnt_pixel; i++) {
-
-			if( x[j] < 0)
-				x[j] = 0;
-
-			if( pixel_list[i] < (x[j] + w[j])) {
-
-				if ( pixel_list[i] >= x[j] ) {
-					clipping[2*i] |= cpu_to_le32(1 << j);
-				}
-			}
-		}
-		for(i = 0; i < cnt_line; i++) {
-
-			if( y[j] < 0)
-				y[j] = 0;
-
-			if( line_list[i] < (y[j] + h[j]) ) {
-
-				if( line_list[i] >= y[j] ) {
-					clipping[(2*i)+1] |= cpu_to_le32(1 << j);
-				}
-			}
-		}
-	}
-
-	/* adjust arbitration control register */
-	*arbtr_ctrl &= 0xffff00ff;
-	*arbtr_ctrl |= 0x00001c00;
-
-	vdma2->base_even	= vv->d_clipping.dma_handle;
-	vdma2->base_odd		= vv->d_clipping.dma_handle;
-	vdma2->prot_addr	= vv->d_clipping.dma_handle+((sizeof(u32))*(numdwords));
-	vdma2->base_page	= 0x04;
-	vdma2->pitch		= 0x00;
-	vdma2->num_line_byte	= (0 << 16 | (sizeof(u32))*(numdwords-1) );
-
-	/* set clipping-mode. this depends on the field(s) used */
-	*clip_format &= 0xfffffff7;
-	if (V4L2_FIELD_HAS_BOTH(field)) {
-		*clip_format |= 0x00000008;
-	} else {
-		*clip_format |= 0x00000000;
-	}
-}
-
-/* disable clipping */
-static void saa7146_disable_clipping(struct saa7146_dev *dev)
-{
-	u32 clip_format	= saa7146_read(dev, CLIP_FORMAT_CTRL);
-
-	/* mask out relevant bits (=lower word)*/
-	clip_format &= MASK_W1;
-
-	/* upload clipping-registers*/
-	saa7146_write(dev, CLIP_FORMAT_CTRL,clip_format);
-	saa7146_write(dev, MC2, (MASK_05 | MASK_21));
-
-	/* disable video dma2 */
-	saa7146_write(dev, MC1, MASK_21);
-}
-
-static void saa7146_set_clipping_rect(struct saa7146_fh *fh)
-{
-	struct saa7146_dev *dev = fh->dev;
-	struct saa7146_vv *vv = dev->vv_data;
-	enum v4l2_field field = vv->ov.win.field;
-	struct	saa7146_video_dma vdma2;
-	u32 clip_format;
-	u32 arbtr_ctrl;
-
-	/* check clipcount, disable clipping if clipcount == 0*/
-	if (vv->ov.nclips == 0) {
-		saa7146_disable_clipping(dev);
-		return;
-	}
-
-	clip_format = saa7146_read(dev, CLIP_FORMAT_CTRL);
-	arbtr_ctrl = saa7146_read(dev, PCI_BT_V1);
-
-	calculate_clipping_registers_rect(dev, fh, &vdma2, &clip_format, &arbtr_ctrl, field);
-
-	/* set clipping format */
-	clip_format &= 0xffff0008;
-	clip_format |= (SAA7146_CLIPPING_RECT << 4);
-
-	/* prepare video dma2 */
-	saa7146_write(dev, BASE_EVEN2,		vdma2.base_even);
-	saa7146_write(dev, BASE_ODD2,		vdma2.base_odd);
-	saa7146_write(dev, PROT_ADDR2,		vdma2.prot_addr);
-	saa7146_write(dev, BASE_PAGE2,		vdma2.base_page);
-	saa7146_write(dev, PITCH2,		vdma2.pitch);
-	saa7146_write(dev, NUM_LINE_BYTE2,	vdma2.num_line_byte);
-
-	/* prepare the rest */
-	saa7146_write(dev, CLIP_FORMAT_CTRL,clip_format);
-	saa7146_write(dev, PCI_BT_V1, arbtr_ctrl);
-
-	/* upload clip_control-register, clipping-registers, enable video dma2 */
-	saa7146_write(dev, MC2, (MASK_05 | MASK_21 | MASK_03 | MASK_19));
-	saa7146_write(dev, MC1, (MASK_05 | MASK_21));
-}
-
 static void saa7146_set_window(struct saa7146_dev *dev, int width, int height, enum v4l2_field field)
 {
 	struct saa7146_vv *vv = dev->vv_data;
@@ -556,62 +341,6 @@ static void saa7146_set_window(struct saa7146_dev *dev, int width, int height, e
 	saa7146_write(dev, MC2, (MASK_05 | MASK_06 | MASK_21 | MASK_22) );
 }
 
-/* calculate the new memory offsets for a desired position */
-static void saa7146_set_position(struct saa7146_dev *dev, int w_x, int w_y, int w_height, enum v4l2_field field, u32 pixelformat)
-{
-	struct saa7146_vv *vv = dev->vv_data;
-	struct saa7146_format *sfmt = saa7146_format_by_fourcc(dev, pixelformat);
-
-	int b_depth = vv->ov_fmt->depth;
-	int b_bpl = vv->ov_fb.fmt.bytesperline;
-	/* The unsigned long cast is to remove a 64-bit compile warning since
-	   it looks like a 64-bit address is cast to a 32-bit value, even
-	   though the base pointer is really a 32-bit physical address that
-	   goes into a 32-bit DMA register.
-	   FIXME: might not work on some 64-bit platforms, but see the FIXME
-	   in struct v4l2_framebuffer (videodev2.h) for that.
-	 */
-	u32 base = (u32)(unsigned long)vv->ov_fb.base;
-
-	struct	saa7146_video_dma vdma1;
-
-	/* calculate memory offsets for picture, look if we shall top-down-flip */
-	vdma1.pitch	= 2*b_bpl;
-	if ( 0 == vv->vflip ) {
-		vdma1.base_even = base + (w_y * (vdma1.pitch/2)) + (w_x * (b_depth / 8));
-		vdma1.base_odd  = vdma1.base_even + (vdma1.pitch / 2);
-		vdma1.prot_addr = vdma1.base_even + (w_height * (vdma1.pitch / 2));
-	}
-	else {
-		vdma1.base_even = base + ((w_y+w_height) * (vdma1.pitch/2)) + (w_x * (b_depth / 8));
-		vdma1.base_odd  = vdma1.base_even - (vdma1.pitch / 2);
-		vdma1.prot_addr = vdma1.base_odd - (w_height * (vdma1.pitch / 2));
-	}
-
-	if (V4L2_FIELD_HAS_BOTH(field)) {
-	} else if (field == V4L2_FIELD_ALTERNATE) {
-		/* fixme */
-		vdma1.base_odd = vdma1.prot_addr;
-		vdma1.pitch /= 2;
-	} else if (field == V4L2_FIELD_TOP) {
-		vdma1.base_odd = vdma1.prot_addr;
-		vdma1.pitch /= 2;
-	} else if (field == V4L2_FIELD_BOTTOM) {
-		vdma1.base_odd = vdma1.base_even;
-		vdma1.base_even = vdma1.prot_addr;
-		vdma1.pitch /= 2;
-	}
-
-	if ( 0 != vv->vflip ) {
-		vdma1.pitch *= -1;
-	}
-
-	vdma1.base_page = sfmt->swap;
-	vdma1.num_line_byte = (vv->standard->v_field<<16)+vv->standard->h_pixels;
-
-	saa7146_write_out_dma(dev, 1, &vdma1);
-}
-
 static void saa7146_set_output_format(struct saa7146_dev *dev, unsigned long palette)
 {
 	u32 clip_format = saa7146_read(dev, CLIP_FORMAT_CTRL);
@@ -645,30 +374,6 @@ void saa7146_set_hps_source_and_sync(struct saa7146_dev *dev, int source, int sy
 }
 EXPORT_SYMBOL_GPL(saa7146_set_hps_source_and_sync);
 
-int saa7146_enable_overlay(struct saa7146_fh *fh)
-{
-	struct saa7146_dev *dev = fh->dev;
-	struct saa7146_vv *vv = dev->vv_data;
-
-	saa7146_set_window(dev, vv->ov.win.w.width, vv->ov.win.w.height, vv->ov.win.field);
-	saa7146_set_position(dev, vv->ov.win.w.left, vv->ov.win.w.top, vv->ov.win.w.height, vv->ov.win.field, vv->ov_fmt->pixelformat);
-	saa7146_set_output_format(dev, vv->ov_fmt->trans);
-	saa7146_set_clipping_rect(fh);
-
-	/* enable video dma1 */
-	saa7146_write(dev, MC1, (MASK_06 | MASK_22));
-	return 0;
-}
-
-void saa7146_disable_overlay(struct saa7146_fh *fh)
-{
-	struct saa7146_dev *dev = fh->dev;
-
-	/* disable clipping + video dma1 */
-	saa7146_disable_clipping(dev);
-	saa7146_write(dev, MC1, MASK_22);
-}
-
 void saa7146_write_out_dma(struct saa7146_dev* dev, int which, struct saa7146_video_dma* vdma)
 {
 	int where = 0;
@@ -1011,7 +716,6 @@ void saa7146_set_capture(struct saa7146_dev *dev, struct saa7146_buf *buf, struc
 
 	saa7146_set_window(dev, buf->fmt->width, buf->fmt->height, buf->fmt->field);
 	saa7146_set_output_format(dev, sfmt->trans);
-	saa7146_disable_clipping(dev);
 
 	if ( vv->last_field == V4L2_FIELD_INTERLACED ) {
 	} else if ( vv->last_field == V4L2_FIELD_TOP ) {
diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index 2296765079a4..27c97218ee53 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -14,9 +14,6 @@ MODULE_PARM_DESC(max_memory, "maximum memory usage for capture buffers (default:
 #define IS_CAPTURE_ACTIVE(fh) \
 	(((vv->video_status & STATUS_CAPTURE) != 0) && (vv->video_fh == fh))
 
-#define IS_OVERLAY_ACTIVE(fh) \
-	(((vv->video_status & STATUS_OVERLAY) != 0) && (vv->video_fh == fh))
-
 /* format descriptions for capture and preview */
 static struct saa7146_format formats[] = {
 	{
@@ -91,105 +88,6 @@ struct saa7146_format* saa7146_format_by_fourcc(struct saa7146_dev *dev, int fou
 	return NULL;
 }
 
-static int vidioc_try_fmt_vid_overlay(struct file *file, void *fh, struct v4l2_format *f);
-
-int saa7146_start_preview(struct saa7146_fh *fh)
-{
-	struct saa7146_dev *dev = fh->dev;
-	struct saa7146_vv *vv = dev->vv_data;
-	struct v4l2_format fmt;
-	int ret = 0, err = 0;
-
-	DEB_EE("dev:%p, fh:%p\n", dev, fh);
-
-	/* check if we have overlay information */
-	if (vv->ov.fh == NULL) {
-		DEB_D("no overlay data available. try S_FMT first.\n");
-		return -EAGAIN;
-	}
-
-	/* check if streaming capture is running */
-	if (IS_CAPTURE_ACTIVE(fh) != 0) {
-		DEB_D("streaming capture is active\n");
-		return -EBUSY;
-	}
-
-	/* check if overlay is running */
-	if (IS_OVERLAY_ACTIVE(fh) != 0) {
-		if (vv->video_fh == fh) {
-			DEB_D("overlay is already active\n");
-			return 0;
-		}
-		DEB_D("overlay is already active in another open\n");
-		return -EBUSY;
-	}
-
-	if (0 == saa7146_res_get(fh, RESOURCE_DMA1_HPS|RESOURCE_DMA2_CLP)) {
-		DEB_D("cannot get necessary overlay resources\n");
-		return -EBUSY;
-	}
-
-	fmt.fmt.win = vv->ov.win;
-	err = vidioc_try_fmt_vid_overlay(NULL, fh, &fmt);
-	if (0 != err) {
-		saa7146_res_free(vv->video_fh, RESOURCE_DMA1_HPS|RESOURCE_DMA2_CLP);
-		return -EBUSY;
-	}
-	vv->ov.win = fmt.fmt.win;
-
-	DEB_D("%dx%d+%d+%d 0x%08x field=%s\n",
-	      vv->ov.win.w.width, vv->ov.win.w.height,
-	      vv->ov.win.w.left, vv->ov.win.w.top,
-	      vv->ov_fmt->pixelformat, v4l2_field_names[vv->ov.win.field]);
-
-	if (0 != (ret = saa7146_enable_overlay(fh))) {
-		DEB_D("enabling overlay failed: %d\n", ret);
-		saa7146_res_free(vv->video_fh, RESOURCE_DMA1_HPS|RESOURCE_DMA2_CLP);
-		return ret;
-	}
-
-	vv->video_status = STATUS_OVERLAY;
-	vv->video_fh = fh;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(saa7146_start_preview);
-
-int saa7146_stop_preview(struct saa7146_fh *fh)
-{
-	struct saa7146_dev *dev = fh->dev;
-	struct saa7146_vv *vv = dev->vv_data;
-
-	DEB_EE("dev:%p, fh:%p\n", dev, fh);
-
-	/* check if streaming capture is running */
-	if (IS_CAPTURE_ACTIVE(fh) != 0) {
-		DEB_D("streaming capture is active\n");
-		return -EBUSY;
-	}
-
-	/* check if overlay is running at all */
-	if ((vv->video_status & STATUS_OVERLAY) == 0) {
-		DEB_D("no active overlay\n");
-		return 0;
-	}
-
-	if (vv->video_fh != fh) {
-		DEB_D("overlay is active, but in another open\n");
-		return -EBUSY;
-	}
-
-	vv->video_status = 0;
-	vv->video_fh = NULL;
-
-	saa7146_disable_overlay(fh);
-
-	saa7146_res_free(fh, RESOURCE_DMA1_HPS|RESOURCE_DMA2_CLP);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(saa7146_stop_preview);
-
 /********************************************************************************/
 /* common pagetable functions */
 
@@ -319,7 +217,7 @@ static int video_begin(struct saa7146_fh *fh)
 	struct saa7146_vv *vv = dev->vv_data;
 	struct saa7146_format *fmt = NULL;
 	unsigned int resource;
-	int ret = 0, err = 0;
+	int ret = 0;
 
 	DEB_EE("dev:%p, fh:%p\n", dev, fh);
 
@@ -332,16 +230,6 @@ static int video_begin(struct saa7146_fh *fh)
 		return -EBUSY;
 	}
 
-	if ((vv->video_status & STATUS_OVERLAY) != 0) {
-		DEB_S("warning: suspending overlay video for streaming capture\n");
-		vv->ov_suspend = vv->video_fh;
-		err = saa7146_stop_preview(vv->video_fh); /* side effect: video_status is now 0, video_fh is NULL */
-		if (0 != err) {
-			DEB_D("suspending video failed. aborting\n");
-			return err;
-		}
-	}
-
 	fmt = saa7146_format_by_fourcc(dev, vv->video_fmt.pixelformat);
 	/* we need to have a valid format set here */
 	if (!fmt)
@@ -356,10 +244,6 @@ static int video_begin(struct saa7146_fh *fh)
 	ret = saa7146_res_get(fh, resource);
 	if (0 == ret) {
 		DEB_S("cannot get capture resource %d\n", resource);
-		if (vv->ov_suspend != NULL) {
-			saa7146_start_preview(vv->ov_suspend);
-			vv->ov_suspend = NULL;
-		}
 		return -EBUSY;
 	}
 
@@ -429,11 +313,6 @@ static int video_end(struct saa7146_fh *fh, struct file *file)
 
 	saa7146_res_free(fh, resource);
 
-	if (vv->ov_suspend != NULL) {
-		saa7146_start_preview(vv->ov_suspend);
-		vv->ov_suspend = NULL;
-	}
-
 	return 0;
 }
 
@@ -443,64 +322,13 @@ static int vidioc_querycap(struct file *file, void *fh, struct v4l2_capability *
 
 	strscpy((char *)cap->driver, "saa7146 v4l2", sizeof(cap->driver));
 	strscpy((char *)cap->card, dev->ext->name, sizeof(cap->card));
-	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OVERLAY |
+	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE |
 			    V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
 			    V4L2_CAP_DEVICE_CAPS;
 	cap->capabilities |= dev->ext_vv_data->capabilities;
 	return 0;
 }
 
-static int vidioc_g_fbuf(struct file *file, void *fh, struct v4l2_framebuffer *fb)
-{
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
-	struct saa7146_vv *vv = dev->vv_data;
-
-	*fb = vv->ov_fb;
-	fb->capability = V4L2_FBUF_CAP_LIST_CLIPPING;
-	fb->flags = V4L2_FBUF_FLAG_PRIMARY;
-	return 0;
-}
-
-static int vidioc_s_fbuf(struct file *file, void *fh, const struct v4l2_framebuffer *fb)
-{
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
-	struct saa7146_vv *vv = dev->vv_data;
-	struct saa7146_format *fmt;
-
-	DEB_EE("VIDIOC_S_FBUF\n");
-
-	if (!capable(CAP_SYS_ADMIN) && !capable(CAP_SYS_RAWIO))
-		return -EPERM;
-
-	/* check args */
-	fmt = saa7146_format_by_fourcc(dev, fb->fmt.pixelformat);
-	if (NULL == fmt)
-		return -EINVAL;
-
-	/* planar formats are not allowed for overlay video, clipping and video dma would clash */
-	if (fmt->flags & FORMAT_IS_PLANAR)
-		DEB_S("planar pixelformat '%4.4s' not allowed for overlay\n",
-		      (char *)&fmt->pixelformat);
-
-	/* check if overlay is running */
-	if (IS_OVERLAY_ACTIVE(fh) != 0) {
-		if (vv->video_fh != fh) {
-			DEB_D("refusing to change framebuffer information while overlay is active in another open\n");
-			return -EBUSY;
-		}
-	}
-
-	/* ok, accept it */
-	vv->ov_fb = *fb;
-	vv->ov_fmt = fmt;
-
-	if (vv->ov_fb.fmt.bytesperline < vv->ov_fb.fmt.width) {
-		vv->ov_fb.fmt.bytesperline = vv->ov_fb.fmt.width * fmt->depth / 8;
-		DEB_D("setting bytesperline to %d\n", vv->ov_fb.fmt.bytesperline);
-	}
-	return 0;
-}
-
 static int vidioc_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 {
 	if (f->index >= ARRAY_SIZE(formats))
@@ -557,13 +385,6 @@ int saa7146_s_ctrl(struct v4l2_ctrl *ctrl)
 	default:
 		return -EINVAL;
 	}
-
-	if ((vv->video_status & STATUS_OVERLAY) != 0) { /* CHECK: && (vv->video_fh == fh)) */
-		struct saa7146_fh *fh = vv->video_fh;
-
-		saa7146_stop_preview(fh);
-		saa7146_start_preview(fh);
-	}
 	return 0;
 }
 
@@ -590,15 +411,6 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_overlay(struct file *file, void *fh, struct v4l2_format *f)
-{
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
-	struct saa7146_vv *vv = dev->vv_data;
-
-	f->fmt.win = vv->ov.win;
-	return 0;
-}
-
 static int vidioc_g_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
@@ -673,66 +485,6 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_forma
 	return 0;
 }
 
-
-static int vidioc_try_fmt_vid_overlay(struct file *file, void *fh, struct v4l2_format *f)
-{
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
-	struct saa7146_vv *vv = dev->vv_data;
-	struct v4l2_window *win = &f->fmt.win;
-	enum v4l2_field field;
-	int maxw, maxh;
-
-	DEB_EE("dev:%p\n", dev);
-
-	if (NULL == vv->ov_fb.base) {
-		DEB_D("no fb base set\n");
-		return -EINVAL;
-	}
-	if (NULL == vv->ov_fmt) {
-		DEB_D("no fb fmt set\n");
-		return -EINVAL;
-	}
-	if (win->w.width < 48 || win->w.height < 32) {
-		DEB_D("min width/height. (%d,%d)\n",
-		      win->w.width, win->w.height);
-		return -EINVAL;
-	}
-	if (win->clipcount > 16) {
-		DEB_D("clipcount too big\n");
-		return -EINVAL;
-	}
-
-	field = win->field;
-	maxw  = vv->standard->h_max_out;
-	maxh  = vv->standard->v_max_out;
-
-	if (V4L2_FIELD_ANY == field) {
-		field = (win->w.height > maxh / 2)
-			? V4L2_FIELD_INTERLACED
-			: V4L2_FIELD_TOP;
-		}
-	switch (field) {
-	case V4L2_FIELD_TOP:
-	case V4L2_FIELD_BOTTOM:
-	case V4L2_FIELD_ALTERNATE:
-		maxh = maxh / 2;
-		break;
-	case V4L2_FIELD_INTERLACED:
-		break;
-	default:
-		DEB_D("no known field mode '%d'\n", field);
-		return -EINVAL;
-	}
-
-	win->field = field;
-	if (win->w.width > maxw)
-		win->w.width = maxw;
-	if (win->w.height > maxh)
-		win->w.height = maxh;
-
-	return 0;
-}
-
 static int vidioc_s_fmt_vid_cap(struct file *file, void *__fh, struct v4l2_format *f)
 {
 	struct saa7146_fh *fh = __fh;
@@ -754,35 +506,6 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *__fh, struct v4l2_forma
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_overlay(struct file *file, void *__fh, struct v4l2_format *f)
-{
-	struct saa7146_fh *fh = __fh;
-	struct saa7146_dev *dev = fh->dev;
-	struct saa7146_vv *vv = dev->vv_data;
-	int err;
-
-	DEB_EE("V4L2_BUF_TYPE_VIDEO_OVERLAY: dev:%p, fh:%p\n", dev, fh);
-	err = vidioc_try_fmt_vid_overlay(file, fh, f);
-	if (0 != err)
-		return err;
-	vv->ov.win    = f->fmt.win;
-	vv->ov.nclips = f->fmt.win.clipcount;
-	if (vv->ov.nclips > 16)
-		vv->ov.nclips = 16;
-	memcpy(vv->ov.clips, f->fmt.win.clips,
-	       sizeof(struct v4l2_clip) * vv->ov.nclips);
-
-	/* vv->ov.fh is used to indicate that we have valid overlay information, too */
-	vv->ov.fh = fh;
-
-	/* check if our current overlay is active */
-	if (IS_OVERLAY_ACTIVE(fh) != 0) {
-		saa7146_stop_preview(fh);
-		saa7146_start_preview(fh);
-	}
-	return 0;
-}
-
 static int vidioc_g_std(struct file *file, void *fh, v4l2_std_id *norm)
 {
 	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
@@ -815,7 +538,7 @@ static int vidioc_s_std(struct file *file, void *fh, v4l2_std_id id)
 	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
 	struct saa7146_vv *vv = dev->vv_data;
 	int found = 0;
-	int err, i;
+	int i;
 
 	DEB_EE("VIDIOC_S_STD\n");
 
@@ -824,15 +547,6 @@ static int vidioc_s_std(struct file *file, void *fh, v4l2_std_id id)
 		return -EBUSY;
 	}
 
-	if ((vv->video_status & STATUS_OVERLAY) != 0) {
-		vv->ov_suspend = vv->video_fh;
-		err = saa7146_stop_preview(vv->video_fh); /* side effect: video_status is now 0, video_fh is NULL */
-		if (0 != err) {
-			DEB_D("suspending video failed. aborting\n");
-			return err;
-		}
-	}
-
 	for (i = 0; i < dev->ext_vv_data->num_stds; i++)
 		if (id & dev->ext_vv_data->stds[i].id)
 			break;
@@ -843,11 +557,6 @@ static int vidioc_s_std(struct file *file, void *fh, v4l2_std_id id)
 		found = 1;
 	}
 
-	if (vv->ov_suspend != NULL) {
-		saa7146_start_preview(vv->ov_suspend);
-		vv->ov_suspend = NULL;
-	}
-
 	if (!found) {
 		DEB_EE("VIDIOC_S_STD: standard not found\n");
 		return -EINVAL;
@@ -857,18 +566,6 @@ static int vidioc_s_std(struct file *file, void *fh, v4l2_std_id id)
 	return 0;
 }
 
-static int vidioc_overlay(struct file *file, void *fh, unsigned int on)
-{
-	int err;
-
-	DEB_D("VIDIOC_OVERLAY on:%d\n", on);
-	if (on)
-		err = saa7146_start_preview(fh);
-	else
-		err = saa7146_stop_preview(fh);
-	return err;
-}
-
 static int vidioc_reqbufs(struct file *file, void *__fh, struct v4l2_requestbuffers *b)
 {
 	struct saa7146_fh *fh = __fh;
@@ -969,17 +666,10 @@ static int vidioc_streamoff(struct file *file, void *__fh, enum v4l2_buf_type ty
 const struct v4l2_ioctl_ops saa7146_video_ioctl_ops = {
 	.vidioc_querycap             = vidioc_querycap,
 	.vidioc_enum_fmt_vid_cap     = vidioc_enum_fmt_vid_cap,
-	.vidioc_enum_fmt_vid_overlay = vidioc_enum_fmt_vid_cap,
 	.vidioc_g_fmt_vid_cap        = vidioc_g_fmt_vid_cap,
 	.vidioc_try_fmt_vid_cap      = vidioc_try_fmt_vid_cap,
 	.vidioc_s_fmt_vid_cap        = vidioc_s_fmt_vid_cap,
-	.vidioc_g_fmt_vid_overlay    = vidioc_g_fmt_vid_overlay,
-	.vidioc_try_fmt_vid_overlay  = vidioc_try_fmt_vid_overlay,
-	.vidioc_s_fmt_vid_overlay    = vidioc_s_fmt_vid_overlay,
 
-	.vidioc_overlay		     = vidioc_overlay,
-	.vidioc_g_fbuf		     = vidioc_g_fbuf,
-	.vidioc_s_fbuf		     = vidioc_s_fbuf,
 	.vidioc_reqbufs              = vidioc_reqbufs,
 	.vidioc_querybuf             = vidioc_querybuf,
 	.vidioc_qbuf                 = vidioc_qbuf,
@@ -1096,7 +786,7 @@ static int buffer_prepare(struct videobuf_queue *q,
 			saa7146_pgtable_alloc(dev->pci, &buf->pt[0]);
 		}
 
-		err = videobuf_iolock(q,&buf->vb, &vv->ov_fb);
+		err = videobuf_iolock(q, &buf->vb, NULL);
 		if (err)
 			goto oops;
 		err = saa7146_pgtable_build(dev,buf);
@@ -1211,8 +901,6 @@ static void video_close(struct saa7146_dev *dev, struct file *file)
 
 	if (IS_CAPTURE_ACTIVE(fh) != 0)
 		video_end(fh, file);
-	else if (IS_OVERLAY_ACTIVE(fh) != 0)
-		saa7146_stop_preview(fh);
 
 	videobuf_stop(q);
 	/* hmm, why is this function declared void? */
@@ -1268,12 +956,6 @@ static ssize_t video_read(struct file *file, char __user *data, size_t count, lo
 		ret = video_end(fh, file);
 	}
 out:
-	/* restart overlay if it was active before */
-	if (vv->ov_suspend != NULL) {
-		saa7146_start_preview(vv->ov_suspend);
-		vv->ov_suspend = NULL;
-	}
-
 	return ret;
 }
 
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/media/av7110/av7110_v4l.c
index c89f536f699c..374f78b84c04 100644
--- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -216,22 +216,12 @@ static const struct v4l2_audio msp3400_v4l2_audio = {
 static int av7110_dvb_c_switch(struct saa7146_fh *fh)
 {
 	struct saa7146_dev *dev = fh->dev;
-	struct saa7146_vv *vv = dev->vv_data;
 	struct av7110 *av7110 = (struct av7110*)dev->ext_priv;
 	u16 adswitch;
-	int source, sync, err;
+	int source, sync;
 
 	dprintk(4, "%p\n", av7110);
 
-	if ((vv->video_status & STATUS_OVERLAY) != 0) {
-		vv->ov_suspend = vv->video_fh;
-		err = saa7146_stop_preview(vv->video_fh); /* side effect: video_status is now 0, video_fh is NULL */
-		if (err != 0) {
-			dprintk(2, "suspending video failed\n");
-			vv->ov_suspend = NULL;
-		}
-	}
-
 	if (0 != av7110->current_input) {
 		dprintk(1, "switching to analog TV:\n");
 		adswitch = 1;
@@ -300,11 +290,6 @@ static int av7110_dvb_c_switch(struct saa7146_fh *fh)
 
 	saa7146_set_hps_source_and_sync(dev, source, sync);
 
-	if (vv->ov_suspend != NULL) {
-		saa7146_start_preview(vv->ov_suspend);
-		vv->ov_suspend = NULL;
-	}
-
 	return 0;
 }
 
diff --git a/include/media/drv-intf/saa7146_vv.h b/include/media/drv-intf/saa7146_vv.h
index 635805fb35e8..932961e8f5ab 100644
--- a/include/media/drv-intf/saa7146_vv.h
+++ b/include/media/drv-intf/saa7146_vv.h
@@ -76,13 +76,6 @@ struct saa7146_dmaqueue {
 	struct timer_list	timeout;
 };
 
-struct saa7146_overlay {
-	struct saa7146_fh	*fh;
-	struct v4l2_window	win;
-	struct v4l2_clip	clips[16];
-	int			nclips;
-};
-
 /* per open data */
 struct saa7146_fh {
 	/* Must be the first field! */
@@ -98,7 +91,6 @@ struct saa7146_fh {
 	unsigned int resources;	/* resource management for device open */
 };
 
-#define STATUS_OVERLAY	0x01
 #define STATUS_CAPTURE	0x02
 
 struct saa7146_vv
@@ -116,12 +108,6 @@ struct saa7146_vv
 	int				video_status;
 	struct saa7146_fh		*video_fh;
 
-	/* video overlay */
-	struct saa7146_overlay		ov;
-	struct v4l2_framebuffer		ov_fb;
-	struct saa7146_format		*ov_fmt;
-	struct saa7146_fh		*ov_suspend;
-
 	/* video capture */
 	struct saa7146_dmaqueue		video_dmaq;
 	struct v4l2_pix_format		video_fmt;
@@ -140,8 +126,6 @@ struct saa7146_vv
 	int	current_hps_source;
 	int	current_hps_sync;
 
-	struct saa7146_dma	d_clipping;	/* pointer to clipping memory */
-
 	unsigned int resources;	/* resource management for device */
 };
 
@@ -192,9 +176,6 @@ int saa7146_vv_init(struct saa7146_dev* dev, struct saa7146_ext_vv *ext_vv);
 int saa7146_vv_release(struct saa7146_dev* dev);
 
 /* from saa7146_hlp.c */
-int saa7146_enable_overlay(struct saa7146_fh *fh);
-void saa7146_disable_overlay(struct saa7146_fh *fh);
-
 void saa7146_set_capture(struct saa7146_dev *dev, struct saa7146_buf *buf, struct saa7146_buf *next);
 void saa7146_write_out_dma(struct saa7146_dev* dev, int which, struct saa7146_video_dma* vdma) ;
 void saa7146_set_hps_source_and_sync(struct saa7146_dev *saa, int source, int sync);
@@ -204,8 +185,6 @@ void saa7146_set_gpio(struct saa7146_dev *saa, u8 pin, u8 data);
 extern const struct v4l2_ioctl_ops saa7146_video_ioctl_ops;
 extern const struct v4l2_ioctl_ops saa7146_vbi_ioctl_ops;
 extern const struct saa7146_use_ops saa7146_video_uops;
-int saa7146_start_preview(struct saa7146_fh *fh);
-int saa7146_stop_preview(struct saa7146_fh *fh);
 long saa7146_video_do_ioctl(struct file *file, unsigned int cmd, void *arg);
 int saa7146_s_ctrl(struct v4l2_ctrl *ctrl);
 
-- 
2.39.1

