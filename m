Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1587A15A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 08:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfG3GiW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 02:38:22 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:45235 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726736AbfG3GiV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 02:38:21 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:3159:f139:4aff:7185])
        by smtp-cloud8.xs4all.net with ESMTPA
        id sLm5hAKSWqTdhsLm7hkdQY; Tue, 30 Jul 2019 08:38:19 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] omap_vout: convert to vb2
Date:   Tue, 30 Jul 2019 08:38:17 +0200
Message-Id: <20190730063817.47674-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190730063817.47674-1-hverkuil-cisco@xs4all.nl>
References: <20190730063817.47674-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIhMh+xDZ6FpDAJ0/UTPETox1aCaMWpmiO1+zxhgGjVHx71eZHaVIzkGfBAW2dnGXZsCgNHmTlmJ1usZWEzjWcWUhTkEH4Ze2vunFBWEKU/gvH0DFwJ+
 Phw+88O7qMT/jfP2fFxlGKKaekMthHAcI1FurkNR0JJ+HJ6fJ/w1Be3rnF+yxBoajcha8P9uIXl3DdoEmKwUigKK5g17qxIDxaFUHnr/2f5XDjK+5McDunVV
 Gu2MPEFPeE4MgDH0yE1pWPYa0ASRpBM1OdZ1vihXJXWZXlk8zXivMEMgZ1hbscyvVB/uSomaTFU3Iec3M6BfNi1LDMTq4CzM4NleSWdTCP+CM08dcYeh4Lsa
 iXikzP4lCTMP5EpygmYUJtW/erfzOQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert omap_vout to the vb2 framework. After this change
'v4l2-compliance -s' passes all tests.

As usual, this vb2 conversion is a 'big bang' patch and hard to read.

Tested on a Pandaboard and a Beagle XM board.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/omap/Kconfig          |   3 +-
 drivers/media/platform/omap/omap_vout.c      | 857 ++++---------------
 drivers/media/platform/omap/omap_vout_vrfb.c |  22 +-
 drivers/media/platform/omap/omap_vout_vrfb.h |   4 +-
 drivers/media/platform/omap/omap_voutdef.h   |  45 +-
 5 files changed, 178 insertions(+), 753 deletions(-)

diff --git a/drivers/media/platform/omap/Kconfig b/drivers/media/platform/omap/Kconfig
index 1a99dff21ca0..f73b5893220d 100644
--- a/drivers/media/platform/omap/Kconfig
+++ b/drivers/media/platform/omap/Kconfig
@@ -10,8 +10,7 @@ config VIDEO_OMAP2_VOUT
 	depends on FB_OMAP2 || (COMPILE_TEST && FB_OMAP2=n)
 	depends on ARCH_OMAP2 || ARCH_OMAP3 || COMPILE_TEST
 	depends on VIDEO_V4L2
-	select VIDEOBUF_GEN
-	select VIDEOBUF_DMA_CONTIG
+	select VIDEOBUF2_DMA_CONTIG
 	select OMAP2_VRFB if ARCH_OMAP2 || ARCH_OMAP3
 	select FRAME_VECTOR
 	help
diff --git a/drivers/media/platform/omap/omap_vout.c b/drivers/media/platform/omap/omap_vout.c
index 6d31c34e168d..2a2961e6ea88 100644
--- a/drivers/media/platform/omap/omap_vout.c
+++ b/drivers/media/platform/omap/omap_vout.c
@@ -40,7 +40,6 @@
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
 
-#include <media/videobuf-dma-contig.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
@@ -64,33 +63,12 @@ enum omap_vout_channels {
 	OMAP_VIDEO2,
 };
 
-static struct videobuf_queue_ops video_vbq_ops;
 /* Variables configurable through module params*/
-static u32 video1_numbuffers = 3;
-static u32 video2_numbuffers = 3;
-static u32 video1_bufsize = OMAP_VOUT_MAX_BUF_SIZE;
-static u32 video2_bufsize = OMAP_VOUT_MAX_BUF_SIZE;
 static bool vid1_static_vrfb_alloc;
 static bool vid2_static_vrfb_alloc;
 static bool debug;
 
 /* Module parameters */
-module_param(video1_numbuffers, uint, S_IRUGO);
-MODULE_PARM_DESC(video1_numbuffers,
-	"Number of buffers to be allocated at init time for Video1 device.");
-
-module_param(video2_numbuffers, uint, S_IRUGO);
-MODULE_PARM_DESC(video2_numbuffers,
-	"Number of buffers to be allocated at init time for Video2 device.");
-
-module_param(video1_bufsize, uint, S_IRUGO);
-MODULE_PARM_DESC(video1_bufsize,
-	"Size of the buffer to be allocated for video1 device");
-
-module_param(video2_bufsize, uint, S_IRUGO);
-MODULE_PARM_DESC(video2_bufsize,
-	"Size of the buffer to be allocated for video2 device");
-
 module_param(vid1_static_vrfb_alloc, bool, S_IRUGO);
 MODULE_PARM_DESC(vid1_static_vrfb_alloc,
 	"Static allocation of the VRFB buffer for video1 device");
@@ -190,56 +168,6 @@ static int omap_vout_try_format(struct v4l2_pix_format *pix)
 	return bpp;
 }
 
-/*
- * omap_vout_get_userptr: Convert user space virtual address to physical
- * address.
- */
-static int omap_vout_get_userptr(struct videobuf_buffer *vb, long virtp,
-				 u32 *physp)
-{
-	struct frame_vector *vec;
-	int ret;
-
-	/* For kernel direct-mapped memory, take the easy way */
-	if (virtp >= PAGE_OFFSET) {
-		*physp = virt_to_phys((void *)virtp);
-		return 0;
-	}
-
-	vec = frame_vector_create(1);
-	if (!vec)
-		return -ENOMEM;
-
-	ret = get_vaddr_frames(virtp, 1, FOLL_WRITE, vec);
-	if (ret != 1) {
-		frame_vector_destroy(vec);
-		return -EINVAL;
-	}
-	*physp = __pfn_to_phys(frame_vector_pfns(vec)[0]);
-	vb->priv = vec;
-
-	return 0;
-}
-
-/*
- * Free the V4L2 buffers
- */
-void omap_vout_free_buffers(struct omap_vout_device *vout)
-{
-	int i, numbuffers;
-
-	/* Allocate memory for the buffers */
-	numbuffers = (vout->vid) ?  video2_numbuffers : video1_numbuffers;
-	vout->buffer_size = (vout->vid) ? video2_bufsize : video1_bufsize;
-
-	for (i = 0; i < numbuffers; i++) {
-		omap_vout_free_buffer(vout->buf_virt_addr[i],
-				vout->buffer_size);
-		vout->buf_phy_addr[i] = 0;
-		vout->buf_virt_addr[i] = 0;
-	}
-}
-
 /*
  * Convert V4L2 rotation to DSS rotation
  *	V4L2 understand 0, 90, 180, 270.
@@ -533,9 +461,9 @@ static int omapvid_handle_interlace_display(struct omap_vout_device *vout,
 		if (vout->cur_frm == vout->next_frm)
 			goto err;
 
-		vout->cur_frm->ts = ts;
-		vout->cur_frm->state = VIDEOBUF_DONE;
-		wake_up_interruptible(&vout->cur_frm->done);
+		vout->cur_frm->vbuf.vb2_buf.timestamp = ts;
+		vout->cur_frm->vbuf.sequence = vout->sequence++;
+		vb2_buffer_done(&vout->cur_frm->vbuf.vb2_buf, VB2_BUF_STATE_DONE);
 		vout->cur_frm = vout->next_frm;
 	} else {
 		if (list_empty(&vout->dma_queue) ||
@@ -558,9 +486,6 @@ static void omap_vout_isr(void *arg, unsigned int irqstatus)
 	struct omap_dss_device *cur_display;
 	struct omap_vout_device *vout = (struct omap_vout_device *)arg;
 
-	if (!vout->streaming)
-		return;
-
 	ovid = &vout->vid_info;
 	ovl = ovid->overlays[0];
 
@@ -604,9 +529,9 @@ static void omap_vout_isr(void *arg, unsigned int irqstatus)
 	}
 
 	if (!vout->first_int && (vout->cur_frm != vout->next_frm)) {
-		vout->cur_frm->ts = ts;
-		vout->cur_frm->state = VIDEOBUF_DONE;
-		wake_up_interruptible(&vout->cur_frm->done);
+		vout->cur_frm->vbuf.vb2_buf.timestamp = ts;
+		vout->cur_frm->vbuf.sequence = vout->sequence++;
+		vb2_buffer_done(&vout->cur_frm->vbuf.vb2_buf, VB2_BUF_STATE_DONE);
 		vout->cur_frm = vout->next_frm;
 	}
 
@@ -615,12 +540,10 @@ static void omap_vout_isr(void *arg, unsigned int irqstatus)
 		goto vout_isr_err;
 
 	vout->next_frm = list_entry(vout->dma_queue.next,
-			struct videobuf_buffer, queue);
+			struct omap_vout_buffer, queue);
 	list_del(&vout->next_frm->queue);
 
-	vout->next_frm->state = VIDEOBUF_ACTIVE;
-
-	addr = (unsigned long) vout->queued_buf_addr[vout->next_frm->i]
+	addr = (unsigned long) vout->queued_buf_addr[vout->next_frm->vbuf.vb2_buf.index]
 		+ vout->cropped_offset;
 
 	/* First save the configuration in ovelray structure */
@@ -640,401 +563,6 @@ static void omap_vout_isr(void *arg, unsigned int irqstatus)
 	spin_unlock(&vout->vbq_lock);
 }
 
-/* Video buffer call backs */
-
-/*
- * Buffer setup function is called by videobuf layer when REQBUF ioctl is
- * called. This is used to setup buffers and return size and count of
- * buffers allocated. After the call to this buffer, videobuf layer will
- * setup buffer queue depending on the size and count of buffers
- */
-static int omap_vout_buffer_setup(struct videobuf_queue *q, unsigned int *count,
-			  unsigned int *size)
-{
-	int startindex = 0, i, j;
-	u32 phy_addr = 0, virt_addr = 0;
-	struct omap_vout_device *vout = q->priv_data;
-	struct omapvideo_info *ovid = &vout->vid_info;
-	int vid_max_buf_size;
-
-	if (!vout)
-		return -EINVAL;
-
-	vid_max_buf_size = vout->vid == OMAP_VIDEO1 ? video1_bufsize :
-		video2_bufsize;
-
-	if (V4L2_BUF_TYPE_VIDEO_OUTPUT != q->type)
-		return -EINVAL;
-
-	startindex = (vout->vid == OMAP_VIDEO1) ?
-		video1_numbuffers : video2_numbuffers;
-	if (V4L2_MEMORY_MMAP == vout->memory && *count < startindex)
-		*count = startindex;
-
-	if (ovid->rotation_type == VOUT_ROT_VRFB) {
-		if (omap_vout_vrfb_buffer_setup(vout, count, startindex))
-			return -ENOMEM;
-	}
-
-	if (V4L2_MEMORY_MMAP != vout->memory)
-		return 0;
-
-	/* Now allocated the V4L2 buffers */
-	*size = PAGE_ALIGN(vout->pix.width * vout->pix.height * vout->bpp);
-	startindex = (vout->vid == OMAP_VIDEO1) ?
-		video1_numbuffers : video2_numbuffers;
-
-	/* Check the size of the buffer */
-	if (*size > vid_max_buf_size) {
-		v4l2_err(&vout->vid_dev->v4l2_dev,
-				"buffer allocation mismatch [%u] [%u]\n",
-				*size, vout->buffer_size);
-		return -ENOMEM;
-	}
-
-	for (i = startindex; i < *count; i++) {
-		vout->buffer_size = *size;
-
-		virt_addr = omap_vout_alloc_buffer(vout->buffer_size,
-				&phy_addr);
-		if (!virt_addr) {
-			if (ovid->rotation_type == VOUT_ROT_NONE)
-				break;
-
-			if (!is_rotation_enabled(vout))
-				break;
-
-			/* Free the VRFB buffers if no space for V4L2 buffers */
-			for (j = i; j < *count; j++) {
-				omap_vout_free_buffer(vout->smsshado_virt_addr[j],
-						      vout->smsshado_size);
-				vout->smsshado_virt_addr[j] = 0;
-				vout->smsshado_phy_addr[j] = 0;
-			}
-		}
-		vout->buf_virt_addr[i] = virt_addr;
-		vout->buf_phy_addr[i] = phy_addr;
-	}
-	*count = vout->buffer_allocated = i;
-
-	return 0;
-}
-
-/*
- * Free the V4L2 buffers additionally allocated than default
- * number of buffers
- */
-static void omap_vout_free_extra_buffers(struct omap_vout_device *vout)
-{
-	int num_buffers = 0, i;
-
-	num_buffers = (vout->vid == OMAP_VIDEO1) ?
-		video1_numbuffers : video2_numbuffers;
-
-	for (i = num_buffers; i < vout->buffer_allocated; i++) {
-		if (vout->buf_virt_addr[i])
-			omap_vout_free_buffer(vout->buf_virt_addr[i],
-					vout->buffer_size);
-
-		vout->buf_virt_addr[i] = 0;
-		vout->buf_phy_addr[i] = 0;
-	}
-	vout->buffer_allocated = num_buffers;
-}
-
-/*
- * This function will be called when VIDIOC_QBUF ioctl is called.
- * It prepare buffers before give out for the display. This function
- * converts user space virtual address into physical address if userptr memory
- * exchange mechanism is used. If rotation is enabled, it copies entire
- * buffer into VRFB memory space before giving it to the DSS.
- */
-static int omap_vout_buffer_prepare(struct videobuf_queue *q,
-			struct videobuf_buffer *vb,
-			enum v4l2_field field)
-{
-	struct omap_vout_device *vout = q->priv_data;
-	struct omapvideo_info *ovid = &vout->vid_info;
-
-	if (VIDEOBUF_NEEDS_INIT == vb->state) {
-		vb->width = vout->pix.width;
-		vb->height = vout->pix.height;
-		vb->size = vb->width * vb->height * vout->bpp;
-		vb->field = field;
-	}
-	vb->state = VIDEOBUF_PREPARED;
-	/* if user pointer memory mechanism is used, get the physical
-	 * address of the buffer
-	 */
-	if (V4L2_MEMORY_USERPTR == vb->memory) {
-		int ret;
-
-		if (0 == vb->baddr)
-			return -EINVAL;
-		/* Physical address */
-		ret = omap_vout_get_userptr(vb, vb->baddr,
-				(u32 *)&vout->queued_buf_addr[vb->i]);
-		if (ret < 0)
-			return ret;
-	} else {
-		unsigned long addr, dma_addr;
-		unsigned long size;
-
-		addr = (unsigned long) vout->buf_virt_addr[vb->i];
-		size = (unsigned long) vb->size;
-
-		dma_addr = dma_map_single(vout->vid_dev->v4l2_dev.dev, (void *) addr,
-				size, DMA_TO_DEVICE);
-		if (dma_mapping_error(vout->vid_dev->v4l2_dev.dev, dma_addr))
-			v4l2_err(&vout->vid_dev->v4l2_dev,
-				 "dma_map_single failed\n");
-
-		vout->queued_buf_addr[vb->i] = (u8 *)vout->buf_phy_addr[vb->i];
-	}
-
-	if (ovid->rotation_type == VOUT_ROT_VRFB)
-		return omap_vout_prepare_vrfb(vout, vb);
-	else
-		return 0;
-}
-
-/*
- * Buffer queue function will be called from the videobuf layer when _QBUF
- * ioctl is called. It is used to enqueue buffer, which is ready to be
- * displayed.
- */
-static void omap_vout_buffer_queue(struct videobuf_queue *q,
-			  struct videobuf_buffer *vb)
-{
-	struct omap_vout_device *vout = q->priv_data;
-
-	/* Driver is also maintainig a queue. So enqueue buffer in the driver
-	 * queue */
-	list_add_tail(&vb->queue, &vout->dma_queue);
-
-	vb->state = VIDEOBUF_QUEUED;
-}
-
-/*
- * Buffer release function is called from videobuf layer to release buffer
- * which are already allocated
- */
-static void omap_vout_buffer_release(struct videobuf_queue *q,
-			    struct videobuf_buffer *vb)
-{
-	vb->state = VIDEOBUF_NEEDS_INIT;
-	if (vb->memory == V4L2_MEMORY_USERPTR && vb->priv) {
-		struct frame_vector *vec = vb->priv;
-
-		put_vaddr_frames(vec);
-		frame_vector_destroy(vec);
-	}
-}
-
-/*
- *  File operations
- */
-static __poll_t omap_vout_poll(struct file *file,
-				   struct poll_table_struct *wait)
-{
-	__poll_t req_events = poll_requested_events(wait);
-	struct omap_vout_device *vout = video_drvdata(file);
-	struct videobuf_queue *q = &vout->vbq;
-	__poll_t res = 0;
-
-	if (req_events & EPOLLPRI)
-		res = v4l2_ctrl_poll(file, wait);
-	if (req_events & (EPOLLOUT | EPOLLWRNORM))
-		res |= videobuf_poll_stream(file, q, wait);
-	return res;
-}
-
-static void omap_vout_vm_open(struct vm_area_struct *vma)
-{
-	struct omap_vout_device *vout = vma->vm_private_data;
-
-	v4l2_dbg(1, debug, &vout->vid_dev->v4l2_dev,
-		"vm_open [vma=%08lx-%08lx]\n", vma->vm_start, vma->vm_end);
-	vout->mmap_count++;
-}
-
-static void omap_vout_vm_close(struct vm_area_struct *vma)
-{
-	struct omap_vout_device *vout = vma->vm_private_data;
-
-	v4l2_dbg(1, debug, &vout->vid_dev->v4l2_dev,
-		"vm_close [vma=%08lx-%08lx]\n", vma->vm_start, vma->vm_end);
-	vout->mmap_count--;
-}
-
-static const struct vm_operations_struct omap_vout_vm_ops = {
-	.open	= omap_vout_vm_open,
-	.close	= omap_vout_vm_close,
-};
-
-static int omap_vout_mmap(struct file *file, struct vm_area_struct *vma)
-{
-	int i;
-	void *pos;
-	unsigned long start = vma->vm_start;
-	unsigned long size = (vma->vm_end - vma->vm_start);
-	struct omap_vout_device *vout = video_drvdata(file);
-	struct videobuf_queue *q = &vout->vbq;
-
-	v4l2_dbg(1, debug, &vout->vid_dev->v4l2_dev,
-			" %s pgoff=0x%lx, start=0x%lx, end=0x%lx\n", __func__,
-			vma->vm_pgoff, vma->vm_start, vma->vm_end);
-
-	/* look for the buffer to map */
-	for (i = 0; i < VIDEO_MAX_FRAME; i++) {
-		if (NULL == q->bufs[i])
-			continue;
-		if (V4L2_MEMORY_MMAP != q->bufs[i]->memory)
-			continue;
-		if (q->bufs[i]->boff == (vma->vm_pgoff << PAGE_SHIFT))
-			break;
-	}
-
-	if (VIDEO_MAX_FRAME == i) {
-		v4l2_dbg(1, debug, &vout->vid_dev->v4l2_dev,
-				"offset invalid [offset=0x%lx]\n",
-				(vma->vm_pgoff << PAGE_SHIFT));
-		return -EINVAL;
-	}
-	/* Check the size of the buffer */
-	if (size > vout->buffer_size) {
-		v4l2_err(&vout->vid_dev->v4l2_dev,
-				"insufficient memory [%lu] [%u]\n",
-				size, vout->buffer_size);
-		return -ENOMEM;
-	}
-
-	q->bufs[i]->baddr = vma->vm_start;
-
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
-	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-	vma->vm_ops = &omap_vout_vm_ops;
-	vma->vm_private_data = (void *) vout;
-	pos = (void *)vout->buf_virt_addr[i];
-	vma->vm_pgoff = virt_to_phys((void *)pos) >> PAGE_SHIFT;
-	while (size > 0) {
-		unsigned long pfn;
-		pfn = virt_to_phys((void *) pos) >> PAGE_SHIFT;
-		if (remap_pfn_range(vma, start, pfn, PAGE_SIZE, PAGE_SHARED))
-			return -EAGAIN;
-		start += PAGE_SIZE;
-		pos += PAGE_SIZE;
-		size -= PAGE_SIZE;
-	}
-	vout->mmap_count++;
-	v4l2_dbg(1, debug, &vout->vid_dev->v4l2_dev, "Exiting %s\n", __func__);
-
-	return 0;
-}
-
-static int omap_vout_release(struct file *file)
-{
-	unsigned int ret, i;
-	struct videobuf_queue *q;
-	struct omapvideo_info *ovid;
-	struct omap_vout_device *vout = video_drvdata(file);
-
-	v4l2_dbg(1, debug, &vout->vid_dev->v4l2_dev, "Entering %s\n", __func__);
-	ovid = &vout->vid_info;
-
-	if (!vout)
-		return 0;
-
-	q = &vout->vbq;
-	/* Disable all the overlay managers connected with this interface */
-	for (i = 0; i < ovid->num_overlays; i++) {
-		struct omap_overlay *ovl = ovid->overlays[i];
-		struct omap_dss_device *dssdev = ovl->get_device(ovl);
-
-		if (dssdev)
-			ovl->disable(ovl);
-	}
-	/* Turn off the pipeline */
-	ret = omapvid_apply_changes(vout);
-	if (ret)
-		v4l2_warn(&vout->vid_dev->v4l2_dev,
-				"Unable to apply changes\n");
-
-	/* Free all buffers */
-	omap_vout_free_extra_buffers(vout);
-
-	/* Free the VRFB buffers only if they are allocated
-	 * during reqbufs.  Don't free if init time allocated
-	 */
-	if (ovid->rotation_type == VOUT_ROT_VRFB) {
-		if (!vout->vrfb_static_allocation)
-			omap_vout_free_vrfb_buffers(vout);
-	}
-	videobuf_mmap_free(q);
-
-	/* Even if apply changes fails we should continue
-	   freeing allocated memory */
-	if (vout->streaming) {
-		u32 mask = 0;
-
-		mask = DISPC_IRQ_VSYNC | DISPC_IRQ_EVSYNC_EVEN |
-			DISPC_IRQ_EVSYNC_ODD | DISPC_IRQ_VSYNC2;
-		omap_dispc_unregister_isr(omap_vout_isr, vout, mask);
-		vout->streaming = false;
-
-		videobuf_streamoff(q);
-		videobuf_queue_cancel(q);
-	}
-
-	if (vout->mmap_count != 0)
-		vout->mmap_count = 0;
-
-	vout->opened -= 1;
-	v4l2_fh_release(file);
-
-	if (vout->buffer_allocated)
-		videobuf_mmap_free(q);
-
-	v4l2_dbg(1, debug, &vout->vid_dev->v4l2_dev, "Exiting %s\n", __func__);
-	return ret;
-}
-
-static int omap_vout_open(struct file *file)
-{
-	struct videobuf_queue *q;
-	struct omap_vout_device *vout = video_drvdata(file);
-	int ret;
-
-	if (vout == NULL)
-		return -ENODEV;
-
-	v4l2_dbg(1, debug, &vout->vid_dev->v4l2_dev, "Entering %s\n", __func__);
-
-	/* for now, we only support single open */
-	if (vout->opened)
-		return -EBUSY;
-
-	ret = v4l2_fh_open(file);
-	if (ret)
-		return ret;
-
-	vout->opened += 1;
-	vout->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
-
-	q = &vout->vbq;
-	video_vbq_ops.buf_setup = omap_vout_buffer_setup;
-	video_vbq_ops.buf_prepare = omap_vout_buffer_prepare;
-	video_vbq_ops.buf_release = omap_vout_buffer_release;
-	video_vbq_ops.buf_queue = omap_vout_buffer_queue;
-	spin_lock_init(&vout->vbq_lock);
-
-	videobuf_queue_dma_contig_init(q, &video_vbq_ops, q->dev,
-			&vout->vbq_lock, vout->type, V4L2_FIELD_NONE,
-			sizeof(struct videobuf_buffer), vout, NULL);
-
-	v4l2_dbg(1, debug, &vout->vid_dev->v4l2_dev, "Exiting %s\n", __func__);
-	return 0;
-}
 
 /*
  * V4L2 ioctls
@@ -1111,11 +639,9 @@ static int vidioc_s_fmt_vid_out(struct file *file, void *fh,
 	struct omap_vout_device *vout = video_drvdata(file);
 	struct omap_dss_device *dssdev;
 
-	if (vout->streaming)
+	if (vb2_is_busy(&vout->vq))
 		return -EBUSY;
 
-	mutex_lock(&vout->lock);
-
 	ovid = &vout->vid_info;
 	ovl = ovid->overlays[0];
 	dssdev = ovl->get_device(ovl);
@@ -1166,7 +692,6 @@ static int vidioc_s_fmt_vid_out(struct file *file, void *fh,
 	ret = 0;
 
 s_fmt_vid_out_exit:
-	mutex_unlock(&vout->lock);
 	return ret;
 }
 
@@ -1199,7 +724,6 @@ static int vidioc_s_fmt_vid_overlay(struct file *file, void *fh,
 	struct omap_vout_device *vout = video_drvdata(file);
 	struct v4l2_window *win = &f->fmt.win;
 
-	mutex_lock(&vout->lock);
 	ovid = &vout->vid_info;
 	ovl = ovid->overlays[0];
 
@@ -1232,10 +756,9 @@ static int vidioc_s_fmt_vid_overlay(struct file *file, void *fh,
 			info.trans_key = vout->win.chromakey;
 
 			if (ovl->manager->set_manager_info(ovl->manager, &info))
-				ret = -EINVAL;
+				return -EINVAL;
 		}
 	}
-	mutex_unlock(&vout->lock);
 	return ret;
 }
 
@@ -1304,10 +827,9 @@ static int vidioc_s_selection(struct file *file, void *fh, struct v4l2_selection
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	if (vout->streaming)
+	if (vb2_is_busy(&vout->vq))
 		return -EBUSY;
 
-	mutex_lock(&vout->lock);
 	ovid = &vout->vid_info;
 	ovl = ovid->overlays[0];
 	/* get the display device attached to the overlay */
@@ -1332,7 +854,6 @@ static int vidioc_s_selection(struct file *file, void *fh, struct v4l2_selection
 				 &vout->fbuf, &sel->r);
 
 s_crop_err:
-	mutex_unlock(&vout->lock);
 	return ret;
 }
 
@@ -1349,26 +870,21 @@ static int omap_vout_s_ctrl(struct v4l2_ctrl *ctrl)
 
 		ovid = &vout->vid_info;
 
-		mutex_lock(&vout->lock);
 		if (rotation && ovid->rotation_type == VOUT_ROT_NONE) {
-			mutex_unlock(&vout->lock);
 			ret = -ERANGE;
 			break;
 		}
 
 		if (rotation && vout->pix.pixelformat == V4L2_PIX_FMT_RGB24) {
-			mutex_unlock(&vout->lock);
 			ret = -EINVAL;
 			break;
 		}
 
 		if (v4l2_rot_to_dss_rot(rotation, &vout->rotation,
 							vout->mirror)) {
-			mutex_unlock(&vout->lock);
 			ret = -EINVAL;
 			break;
 		}
-		mutex_unlock(&vout->lock);
 		break;
 	}
 	case V4L2_CID_BG_COLOR:
@@ -1379,9 +895,7 @@ static int omap_vout_s_ctrl(struct v4l2_ctrl *ctrl)
 
 		ovl = vout->vid_info.overlays[0];
 
-		mutex_lock(&vout->lock);
 		if (!ovl->manager || !ovl->manager->get_manager_info) {
-			mutex_unlock(&vout->lock);
 			ret = -EINVAL;
 			break;
 		}
@@ -1389,11 +903,9 @@ static int omap_vout_s_ctrl(struct v4l2_ctrl *ctrl)
 		ovl->manager->get_manager_info(ovl->manager, &info);
 		info.default_color = color;
 		if (ovl->manager->set_manager_info(ovl->manager, &info)) {
-			mutex_unlock(&vout->lock);
 			ret = -EINVAL;
 			break;
 		}
-		mutex_unlock(&vout->lock);
 		break;
 	}
 	case V4L2_CID_VFLIP:
@@ -1403,20 +915,16 @@ static int omap_vout_s_ctrl(struct v4l2_ctrl *ctrl)
 
 		ovid = &vout->vid_info;
 
-		mutex_lock(&vout->lock);
 		if (mirror && ovid->rotation_type == VOUT_ROT_NONE) {
-			mutex_unlock(&vout->lock);
 			ret = -ERANGE;
 			break;
 		}
 
 		if (mirror  && vout->pix.pixelformat == V4L2_PIX_FMT_RGB24) {
-			mutex_unlock(&vout->lock);
 			ret = -EINVAL;
 			break;
 		}
 		vout->mirror = mirror;
-		mutex_unlock(&vout->lock);
 		break;
 	}
 	default:
@@ -1429,185 +937,94 @@ static const struct v4l2_ctrl_ops omap_vout_ctrl_ops = {
 	.s_ctrl = omap_vout_s_ctrl,
 };
 
-static int vidioc_reqbufs(struct file *file, void *fh,
-			struct v4l2_requestbuffers *req)
+static int omap_vout_vb2_queue_setup(struct vb2_queue *vq,
+				     unsigned int *nbufs,
+				     unsigned int *num_planes, unsigned int sizes[],
+				     struct device *alloc_devs[])
 {
-	int ret = 0;
-	unsigned int i, num_buffers = 0;
-	struct omap_vout_device *vout = video_drvdata(file);
-	struct videobuf_queue *q = &vout->vbq;
-
-	if (req->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
-		return -EINVAL;
-	/* if memory is not mmp or userptr
-	   return error */
-	if ((V4L2_MEMORY_MMAP != req->memory) &&
-			(V4L2_MEMORY_USERPTR != req->memory))
-		return -EINVAL;
+	struct omap_vout_device *vout = vb2_get_drv_priv(vq);
+	int size = vout->pix.sizeimage;
 
-	mutex_lock(&vout->lock);
-	/* Cannot be requested when streaming is on */
-	if (vout->streaming) {
-		ret = -EBUSY;
-		goto reqbuf_err;
-	}
-
-	/* If buffers are already allocated free them */
-	if (q->bufs[0] && (V4L2_MEMORY_MMAP == q->bufs[0]->memory)) {
-		if (vout->mmap_count) {
-			ret = -EBUSY;
-			goto reqbuf_err;
-		}
-		num_buffers = (vout->vid == OMAP_VIDEO1) ?
-			video1_numbuffers : video2_numbuffers;
-		for (i = num_buffers; i < vout->buffer_allocated; i++) {
-			omap_vout_free_buffer(vout->buf_virt_addr[i],
-					vout->buffer_size);
-			vout->buf_virt_addr[i] = 0;
-			vout->buf_phy_addr[i] = 0;
-		}
-		vout->buffer_allocated = num_buffers;
-		videobuf_mmap_free(q);
-	} else if (q->bufs[0] && (V4L2_MEMORY_USERPTR == q->bufs[0]->memory)) {
-		if (vout->buffer_allocated) {
-			videobuf_mmap_free(q);
-			for (i = 0; i < vout->buffer_allocated; i++) {
-				kfree(q->bufs[i]);
-				q->bufs[i] = NULL;
-			}
-			vout->buffer_allocated = 0;
-		}
+	if (is_rotation_enabled(vout) && vq->num_buffers + *nbufs > VRFB_NUM_BUFS) {
+		*nbufs = VRFB_NUM_BUFS - vq->num_buffers;
+		if (*nbufs == 0)
+			return -EINVAL;
 	}
 
-	/*store the memory type in data structure */
-	vout->memory = req->memory;
-
-	INIT_LIST_HEAD(&vout->dma_queue);
-
-	/* call videobuf_reqbufs api */
-	ret = videobuf_reqbufs(q, req);
-	if (ret < 0)
-		goto reqbuf_err;
+	if (*num_planes)
+		return sizes[0] < size ? -EINVAL : 0;
 
-	vout->buffer_allocated = req->count;
-
-reqbuf_err:
-	mutex_unlock(&vout->lock);
-	return ret;
-}
-
-static int vidioc_querybuf(struct file *file, void *fh,
-			struct v4l2_buffer *b)
-{
-	struct omap_vout_device *vout = video_drvdata(file);
-
-	return videobuf_querybuf(&vout->vbq, b);
+	*num_planes = 1;
+	sizes[0] = size;
+	return 0;
 }
 
-static int vidioc_qbuf(struct file *file, void *fh,
-			struct v4l2_buffer *buffer)
+static int omap_vout_vb2_prepare(struct vb2_buffer *vb)
 {
-	struct omap_vout_device *vout = video_drvdata(file);
-	struct videobuf_queue *q = &vout->vbq;
+	struct omap_vout_device *vout = vb2_get_drv_priv(vb->vb2_queue);
+	struct omapvideo_info *ovid = &vout->vid_info;
+	struct omap_vout_buffer *voutbuf = vb2_to_omap_vout_buffer(vb);
+	dma_addr_t buf_phy_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
 
-	if ((V4L2_BUF_TYPE_VIDEO_OUTPUT != buffer->type) ||
-			(buffer->index >= vout->buffer_allocated) ||
-			(q->bufs[buffer->index]->memory != buffer->memory)) {
+	if (vb2_plane_size(vb, 0) < vout->pix.sizeimage) {
+		v4l2_dbg(1, debug, &vout->vid_dev->v4l2_dev,
+			 "%s data will not fit into plane (%lu < %u)\n",
+			__func__, vb2_plane_size(vb, 0), vout->pix.sizeimage);
 		return -EINVAL;
 	}
-	if (V4L2_MEMORY_USERPTR == buffer->memory) {
-		if ((buffer->length < vout->pix.sizeimage) ||
-				(0 == buffer->m.userptr)) {
-			return -EINVAL;
-		}
-	}
 
-	if ((is_rotation_enabled(vout)) &&
-			vout->vrfb_dma_tx.req_status == DMA_CHAN_NOT_ALLOTED) {
-		v4l2_warn(&vout->vid_dev->v4l2_dev,
-				"DMA Channel not allocated for Rotation\n");
-		return -EINVAL;
-	}
+	vb2_set_plane_payload(vb, 0, vout->pix.sizeimage);
+	voutbuf->vbuf.field = V4L2_FIELD_NONE;
 
-	return videobuf_qbuf(q, buffer);
+	vout->queued_buf_addr[vb->index] = (u8 *)buf_phy_addr;
+	if (ovid->rotation_type == VOUT_ROT_VRFB)
+		return omap_vout_prepare_vrfb(vout, vb);
+	return 0;
 }
 
-static int vidioc_dqbuf(struct file *file, void *fh, struct v4l2_buffer *b)
+static void omap_vout_vb2_queue(struct vb2_buffer *vb)
 {
-	struct omap_vout_device *vout = video_drvdata(file);
-	struct videobuf_queue *q = &vout->vbq;
-
-	int ret;
-	u32 addr;
-	unsigned long size;
-	struct videobuf_buffer *vb;
-
-	if (!vout->streaming)
-		return -EINVAL;
+	struct omap_vout_device *vout = vb2_get_drv_priv(vb->vb2_queue);
+	struct omap_vout_buffer *voutbuf = vb2_to_omap_vout_buffer(vb);
 
-	ret = videobuf_dqbuf(q, b, !!(file->f_flags & O_NONBLOCK));
-	if (ret)
-		return ret;
-
-	vb = q->bufs[b->index];
-
-	addr = (unsigned long) vout->buf_phy_addr[vb->i];
-	size = (unsigned long) vb->size;
-	dma_unmap_single(vout->vid_dev->v4l2_dev.dev,  addr,
-				size, DMA_TO_DEVICE);
-	return 0;
+	list_add_tail(&voutbuf->queue, &vout->dma_queue);
 }
 
-static int vidioc_streamon(struct file *file, void *fh, enum v4l2_buf_type i)
+static int omap_vout_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
-	int ret = 0, j;
-	u32 addr = 0, mask = 0;
-	struct omap_vout_device *vout = video_drvdata(file);
-	struct videobuf_queue *q = &vout->vbq;
+	struct omap_vout_device *vout = vb2_get_drv_priv(vq);
 	struct omapvideo_info *ovid = &vout->vid_info;
-
-	mutex_lock(&vout->lock);
-
-	if (vout->streaming) {
-		ret = -EBUSY;
-		goto streamon_err;
-	}
-
-	ret = videobuf_streamon(q);
-	if (ret)
-		goto streamon_err;
-
-	if (list_empty(&vout->dma_queue)) {
-		ret = -EIO;
-		goto streamon_err1;
-	}
+	struct omap_vout_buffer *buf, *tmp;
+	u32 addr = 0, mask = 0;
+	int ret, j;
 
 	/* Get the next frame from the buffer queue */
 	vout->next_frm = vout->cur_frm = list_entry(vout->dma_queue.next,
-			struct videobuf_buffer, queue);
+			struct omap_vout_buffer, queue);
 	/* Remove buffer from the buffer queue */
 	list_del(&vout->cur_frm->queue);
-	/* Mark state of the current frame to active */
-	vout->cur_frm->state = VIDEOBUF_ACTIVE;
 	/* Initialize field_id and started member */
 	vout->field_id = 0;
-
-	/* set flag here. Next QBUF will start DMA */
-	vout->streaming = true;
-
 	vout->first_int = 1;
+	vout->sequence = 0;
 
 	if (omap_vout_calculate_offset(vout)) {
 		ret = -EINVAL;
-		goto streamon_err1;
+		goto out;
 	}
-	addr = (unsigned long) vout->queued_buf_addr[vout->cur_frm->i]
+	if (ovid->rotation_type == VOUT_ROT_VRFB)
+		if (omap_vout_vrfb_buffer_setup(vout, &count, 0)) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+	addr = (unsigned long) vout->queued_buf_addr[vout->cur_frm->vbuf.vb2_buf.index]
 		+ vout->cropped_offset;
 
 	mask = DISPC_IRQ_VSYNC | DISPC_IRQ_EVSYNC_EVEN | DISPC_IRQ_EVSYNC_ODD
 		| DISPC_IRQ_VSYNC2;
 
-	/* First save the configuration in ovelray structure */
+	/* First save the configuration in overlay structure */
 	ret = omapvid_init(vout, addr);
 	if (ret) {
 		v4l2_err(&vout->vid_dev->v4l2_dev,
@@ -1632,28 +1049,43 @@ static int vidioc_streamon(struct file *file, void *fh, enum v4l2_buf_type i)
 				goto streamon_err1;
 		}
 	}
-
-	ret = 0;
+	return 0;
 
 streamon_err1:
-	if (ret)
-		ret = videobuf_streamoff(q);
-streamon_err:
-	mutex_unlock(&vout->lock);
+	mask = DISPC_IRQ_VSYNC | DISPC_IRQ_EVSYNC_EVEN | DISPC_IRQ_EVSYNC_ODD
+		| DISPC_IRQ_VSYNC2;
+
+	omap_dispc_unregister_isr(omap_vout_isr, vout, mask);
+
+	for (j = 0; j < ovid->num_overlays; j++) {
+		struct omap_overlay *ovl = ovid->overlays[j];
+		struct omap_dss_device *dssdev = ovl->get_device(ovl);
+
+		if (dssdev)
+			ovl->disable(ovl);
+	}
+	/* Turn of the pipeline */
+	if (omapvid_apply_changes(vout))
+		v4l2_err(&vout->vid_dev->v4l2_dev,
+			 "failed to change mode in streamoff\n");
+
+out:
+	vb2_buffer_done(&vout->cur_frm->vbuf.vb2_buf, VB2_BUF_STATE_QUEUED);
+	list_for_each_entry_safe(buf, tmp, &vout->dma_queue, queue) {
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vbuf.vb2_buf, VB2_BUF_STATE_QUEUED);
+	}
 	return ret;
 }
 
-static int vidioc_streamoff(struct file *file, void *fh, enum v4l2_buf_type i)
+static void omap_vout_vb2_stop_streaming(struct vb2_queue *vq)
 {
-	u32 mask = 0;
-	int ret = 0, j;
-	struct omap_vout_device *vout = video_drvdata(file);
+	struct omap_vout_device *vout = vb2_get_drv_priv(vq);
 	struct omapvideo_info *ovid = &vout->vid_info;
+	struct omap_vout_buffer *buf, *tmp;
+	u32 mask = 0;
+	int j;
 
-	if (!vout->streaming)
-		return -EINVAL;
-
-	vout->streaming = false;
 	mask = DISPC_IRQ_VSYNC | DISPC_IRQ_EVSYNC_EVEN | DISPC_IRQ_EVSYNC_ODD
 		| DISPC_IRQ_VSYNC2;
 
@@ -1666,17 +1098,18 @@ static int vidioc_streamoff(struct file *file, void *fh, enum v4l2_buf_type i)
 		if (dssdev)
 			ovl->disable(ovl);
 	}
-
 	/* Turn of the pipeline */
-	ret = omapvid_apply_changes(vout);
-	if (ret)
+	if (omapvid_apply_changes(vout))
 		v4l2_err(&vout->vid_dev->v4l2_dev,
 			 "failed to change mode in streamoff\n");
 
-	INIT_LIST_HEAD(&vout->dma_queue);
-	ret = videobuf_streamoff(&vout->vbq);
-
-	return ret;
+	if (vout->next_frm != vout->cur_frm)
+		vb2_buffer_done(&vout->next_frm->vbuf.vb2_buf, VB2_BUF_STATE_ERROR);
+	vb2_buffer_done(&vout->cur_frm->vbuf.vb2_buf, VB2_BUF_STATE_ERROR);
+	list_for_each_entry_safe(buf, tmp, &vout->dma_queue, queue) {
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vbuf.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
 }
 
 static int vidioc_s_fbuf(struct file *file, void *fh,
@@ -1837,23 +1270,35 @@ static const struct v4l2_ioctl_ops vout_ioctl_ops = {
 	.vidioc_enum_output			= vidioc_enum_output,
 	.vidioc_g_output			= vidioc_g_output,
 	.vidioc_s_output			= vidioc_s_output,
-	.vidioc_reqbufs				= vidioc_reqbufs,
-	.vidioc_querybuf			= vidioc_querybuf,
-	.vidioc_qbuf				= vidioc_qbuf,
-	.vidioc_dqbuf				= vidioc_dqbuf,
-	.vidioc_streamon			= vidioc_streamon,
-	.vidioc_streamoff			= vidioc_streamoff,
+	.vidioc_reqbufs				= vb2_ioctl_reqbufs,
+	.vidioc_create_bufs			= vb2_ioctl_create_bufs,
+	.vidioc_querybuf			= vb2_ioctl_querybuf,
+	.vidioc_qbuf				= vb2_ioctl_qbuf,
+	.vidioc_dqbuf				= vb2_ioctl_dqbuf,
+	.vidioc_expbuf				= vb2_ioctl_expbuf,
+	.vidioc_streamon			= vb2_ioctl_streamon,
+	.vidioc_streamoff			= vb2_ioctl_streamoff,
 	.vidioc_subscribe_event			= v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event		= v4l2_event_unsubscribe,
 };
 
 static const struct v4l2_file_operations omap_vout_fops = {
 	.owner		= THIS_MODULE,
-	.poll		= omap_vout_poll,
 	.unlocked_ioctl	= video_ioctl2,
-	.mmap		= omap_vout_mmap,
-	.open		= omap_vout_open,
-	.release	= omap_vout_release,
+	.poll		= vb2_fop_poll,
+	.mmap		= vb2_fop_mmap,
+	.open		= v4l2_fh_open,
+	.release	= vb2_fop_release,
+};
+
+static const struct vb2_ops omap_vout_vb2_ops = {
+	.queue_setup		= omap_vout_vb2_queue_setup,
+	.buf_queue		= omap_vout_vb2_queue,
+	.buf_prepare		= omap_vout_vb2_prepare,
+	.start_streaming	= omap_vout_vb2_start_streaming,
+	.stop_streaming		= omap_vout_vb2_stop_streaming,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
 };
 
 /* Init functions used during driver initialization */
@@ -1865,6 +1310,8 @@ static int __init omap_vout_setup_video_data(struct omap_vout_device *vout)
 	struct omap_overlay *ovl = vout->vid_info.overlays[0];
 	struct omap_dss_device *display = ovl->get_device(ovl);
 	struct v4l2_ctrl_handler *hdl;
+	struct vb2_queue *vq;
+	int ret;
 
 	/* set the default pix */
 	pix = &vout->pix;
@@ -1883,6 +1330,7 @@ static int __init omap_vout_setup_video_data(struct omap_vout_device *vout)
 	vout->bpp = RGB565_BPP;
 	vout->fbuf.fmt.width  =  display->panel.timings.x_res;
 	vout->fbuf.fmt.height =  display->panel.timings.y_res;
+	vout->cropped_offset = 0;
 
 	/* Set the data structures for the overlay parameters*/
 	vout->fbuf.flags = V4L2_FBUF_FLAG_OVERLAY;
@@ -1915,6 +1363,7 @@ static int __init omap_vout_setup_video_data(struct omap_vout_device *vout)
 
 	vout->rotation = 0;
 	vout->mirror = false;
+	INIT_LIST_HEAD(&vout->dma_queue);
 	if (vout->vid_info.rotation_type == VOUT_ROT_VRFB)
 		vout->vrfb_bpp = 2;
 
@@ -1936,65 +1385,54 @@ static int __init omap_vout_setup_video_data(struct omap_vout_device *vout)
 	vfd->fops = &omap_vout_fops;
 	vfd->v4l2_dev = &vout->vid_dev->v4l2_dev;
 	vfd->vfl_dir = VFL_DIR_TX;
+	vfd->minor = -1;
 	vfd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_OUTPUT |
 			   V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
 	mutex_init(&vout->lock);
 
-	vfd->minor = -1;
-	return 0;
-
+	vq = &vout->vq;
+	vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
+	vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	vq->drv_priv = vout;
+	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vq->buf_struct_size = sizeof(struct omap_vout_buffer);
+	vq->dev = vfd->v4l2_dev->dev;
+
+	vq->ops = &omap_vout_vb2_ops;
+	vq->mem_ops = &vb2_dma_contig_memops;
+	vq->lock = &vout->lock;
+	vq->min_buffers_needed = 1;
+	vfd->queue = vq;
+
+	ret = vb2_queue_init(vq);
+	if (ret) {
+		v4l2_ctrl_handler_free(hdl);
+		video_device_release(vfd);
+	}
+	return ret;
 }
 
 /* Setup video buffers */
 static int __init omap_vout_setup_video_bufs(struct platform_device *pdev,
 		int vid_num)
 {
-	u32 numbuffers;
-	int ret = 0, i;
 	struct omapvideo_info *ovid;
 	struct omap_vout_device *vout;
 	struct v4l2_device *v4l2_dev = platform_get_drvdata(pdev);
 	struct omap2video_device *vid_dev =
 		container_of(v4l2_dev, struct omap2video_device, v4l2_dev);
+	int ret = 0;
 
 	vout = vid_dev->vouts[vid_num];
 	ovid = &vout->vid_info;
 
-	numbuffers = (vid_num == 0) ? video1_numbuffers : video2_numbuffers;
-	vout->buffer_size = (vid_num == 0) ? video1_bufsize : video2_bufsize;
-	dev_info(&pdev->dev, "Buffer Size = %d\n", vout->buffer_size);
-
-	for (i = 0; i < numbuffers; i++) {
-		vout->buf_virt_addr[i] =
-			omap_vout_alloc_buffer(vout->buffer_size,
-					(u32 *) &vout->buf_phy_addr[i]);
-		if (!vout->buf_virt_addr[i]) {
-			numbuffers = i;
-			ret = -ENOMEM;
-			goto free_buffers;
-		}
-	}
-
-	vout->cropped_offset = 0;
-
 	if (ovid->rotation_type == VOUT_ROT_VRFB) {
 		bool static_vrfb_allocation = (vid_num == 0) ?
 			vid1_static_vrfb_alloc : vid2_static_vrfb_alloc;
 		ret = omap_vout_setup_vrfb_bufs(pdev, vid_num,
 				static_vrfb_allocation);
 	}
-
 	return ret;
-
-free_buffers:
-	for (i = 0; i < numbuffers; i++) {
-		omap_vout_free_buffer(vout->buf_virt_addr[i],
-						vout->buffer_size);
-		vout->buf_virt_addr[i] = 0;
-		vout->buf_phy_addr[i] = 0;
-	}
-	return ret;
-
 }
 
 /* Create video out devices */
@@ -2030,6 +1468,7 @@ static int __init omap_vout_create_video_devices(struct platform_device *pdev)
 			vout->vid_info.overlays[0] = vid_dev->overlays[k + 1];
 		vout->vid_info.num_overlays = 1;
 		vout->vid_info.id = k + 1;
+		spin_lock_init(&vout->vbq_lock);
 		/*
 		 * Set the framebuffer base, this allows applications to find
 		 * the fb corresponding to this overlay.
@@ -2080,7 +1519,6 @@ static int __init omap_vout_create_video_devices(struct platform_device *pdev)
 error2:
 		if (vout->vid_info.rotation_type == VOUT_ROT_VRFB)
 			omap_vout_release_vrfb(vout);
-		omap_vout_free_buffers(vout);
 error1:
 		video_device_release(vfd);
 error:
@@ -2125,7 +1563,6 @@ static void omap_vout_cleanup_device(struct omap_vout_device *vout)
 		if (vout->vrfb_static_allocation)
 			omap_vout_free_vrfb_buffers(vout);
 	}
-	omap_vout_free_buffers(vout);
 
 	kfree(vout);
 }
diff --git a/drivers/media/platform/omap/omap_vout_vrfb.c b/drivers/media/platform/omap/omap_vout_vrfb.c
index 729b1bf9395f..28ce88c81999 100644
--- a/drivers/media/platform/omap/omap_vout_vrfb.c
+++ b/drivers/media/platform/omap/omap_vout_vrfb.c
@@ -14,7 +14,6 @@
 #include <linux/videodev2.h>
 #include <linux/slab.h>
 
-#include <media/videobuf-dma-contig.h>
 #include <media/v4l2-device.h>
 
 #include <video/omapvrfb.h>
@@ -40,7 +39,7 @@ static int omap_vout_allocate_vrfb_buffers(struct omap_vout_device *vout,
 						&vout->smsshado_phy_addr[i]);
 		}
 		if (!vout->smsshado_virt_addr[i] && startindex != -1) {
-			if (V4L2_MEMORY_MMAP == vout->memory && i >= startindex)
+			if (vout->vq.memory == V4L2_MEMORY_MMAP && i >= startindex)
 				break;
 		}
 		if (!vout->smsshado_virt_addr[i]) {
@@ -109,8 +108,7 @@ int omap_vout_setup_vrfb_bufs(struct platform_device *pdev, int vid_num,
 			dev_info(&pdev->dev, ": VRFB allocation failed\n");
 			for (j = 0; j < i; j++)
 				omap_vrfb_release_ctx(&vout->vrfb_context[j]);
-			ret = -ENOMEM;
-			goto free_buffers;
+			return -ENOMEM;
 		}
 	}
 
@@ -156,7 +154,7 @@ int omap_vout_setup_vrfb_bufs(struct platform_device *pdev, int vid_num,
 	init_waitqueue_head(&vout->vrfb_dma_tx.wait);
 
 	/* statically allocated the VRFB buffer is done through
-	   commands line aruments */
+	   command line arguments */
 	if (static_vrfb_allocation) {
 		if (omap_vout_allocate_vrfb_buffers(vout, &vrfb_num_bufs, -1)) {
 			ret =  -ENOMEM;
@@ -169,9 +167,6 @@ int omap_vout_setup_vrfb_bufs(struct platform_device *pdev, int vid_num,
 release_vrfb_ctx:
 	for (j = 0; j < VRFB_NUM_BUFS; j++)
 		omap_vrfb_release_ctx(&vout->vrfb_context[j]);
-free_buffers:
-	omap_vout_free_buffers(vout);
-
 	return ret;
 }
 
@@ -231,13 +226,14 @@ int omap_vout_vrfb_buffer_setup(struct omap_vout_device *vout,
 }
 
 int omap_vout_prepare_vrfb(struct omap_vout_device *vout,
-			   struct videobuf_buffer *vb)
+			   struct vb2_buffer *vb)
 {
 	struct dma_async_tx_descriptor *tx;
 	enum dma_ctrl_flags flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
 	struct dma_chan *chan = vout->vrfb_dma_tx.chan;
 	struct dma_interleaved_template *xt = vout->vrfb_dma_tx.xt;
 	dma_cookie_t cookie;
+	dma_addr_t buf_phy_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
 	enum dma_status status;
 	enum dss_rotation rotation;
 	size_t dst_icg;
@@ -256,8 +252,8 @@ int omap_vout_prepare_vrfb(struct omap_vout_device *vout,
 	dst_icg = ((MAX_PIXELS_PER_LINE * pixsize) -
 		  (vout->pix.width * vout->bpp));
 
-	xt->src_start = vout->buf_phy_addr[vb->i];
-	xt->dst_start = vout->vrfb_context[vb->i].paddr[0];
+	xt->src_start = buf_phy_addr;
+	xt->dst_start = vout->vrfb_context[vb->index].paddr[0];
 
 	xt->numf = vout->pix.height;
 	xt->frame_size = 1;
@@ -308,8 +304,8 @@ int omap_vout_prepare_vrfb(struct omap_vout_device *vout,
 	/* Store buffers physical address into an array. Addresses
 	 * from this array will be used to configure DSS */
 	rotation = calc_rotation(vout);
-	vout->queued_buf_addr[vb->i] = (u8 *)
-		vout->vrfb_context[vb->i].paddr[rotation];
+	vout->queued_buf_addr[vb->index] = (u8 *)
+		vout->vrfb_context[vb->index].paddr[rotation];
 	return 0;
 }
 
diff --git a/drivers/media/platform/omap/omap_vout_vrfb.h b/drivers/media/platform/omap/omap_vout_vrfb.h
index c976975024df..40bc9e54ecc6 100644
--- a/drivers/media/platform/omap/omap_vout_vrfb.h
+++ b/drivers/media/platform/omap/omap_vout_vrfb.h
@@ -20,7 +20,7 @@ void omap_vout_release_vrfb(struct omap_vout_device *vout);
 int omap_vout_vrfb_buffer_setup(struct omap_vout_device *vout,
 			unsigned int *count, unsigned int startindex);
 int omap_vout_prepare_vrfb(struct omap_vout_device *vout,
-			struct videobuf_buffer *vb);
+			struct vb2_buffer *vb);
 void omap_vout_calculate_vrfb_offset(struct omap_vout_device *vout);
 #else
 static inline void omap_vout_free_vrfb_buffers(struct omap_vout_device *vout) { };
@@ -32,7 +32,7 @@ static inline int omap_vout_vrfb_buffer_setup(struct omap_vout_device *vout,
 			unsigned int *count, unsigned int startindex)
 		{ return 0; };
 static inline int omap_vout_prepare_vrfb(struct omap_vout_device *vout,
-			struct videobuf_buffer *vb)
+			struct vb2_buffer *vb)
 		{ return 0; };
 static inline void omap_vout_calculate_vrfb_offset(struct omap_vout_device *vout) { };
 #endif
diff --git a/drivers/media/platform/omap/omap_voutdef.h b/drivers/media/platform/omap/omap_voutdef.h
index c740393c8509..1cff6dea1879 100644
--- a/drivers/media/platform/omap/omap_voutdef.h
+++ b/drivers/media/platform/omap/omap_voutdef.h
@@ -11,6 +11,7 @@
 #ifndef OMAP_VOUTDEF_H
 #define OMAP_VOUTDEF_H
 
+#include <media/videobuf2-dma-contig.h>
 #include <media/v4l2-ctrls.h>
 #include <video/omapfb_dss.h>
 #include <video/omapvrfb.h>
@@ -113,6 +114,20 @@ struct omap2video_device {
 	struct omap_overlay_manager *managers[MAX_MANAGERS];
 };
 
+/* buffer for one video frame */
+struct omap_vout_buffer {
+	/* common v4l buffer stuff -- must be first */
+	struct vb2_v4l2_buffer		vbuf;
+	struct list_head		queue;
+};
+
+static inline struct omap_vout_buffer *vb2_to_omap_vout_buffer(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	return container_of(vbuf, struct omap_vout_buffer, vbuf);
+}
+
 /* per-device data structure */
 struct omap_vout_device {
 
@@ -121,29 +136,12 @@ struct omap_vout_device {
 	struct omap2video_device *vid_dev;
 	struct v4l2_ctrl_handler ctrl_handler;
 	int vid;
-	int opened;
 
-	/* we don't allow to change image fmt/size once buffer has
-	 * been allocated
-	 */
-	int buffer_allocated;
 	/* allow to reuse previously allocated buffer which is big enough */
 	int buffer_size;
-	/* keep buffer info across opens */
-	unsigned long buf_virt_addr[VIDEO_MAX_FRAME];
-	unsigned long buf_phy_addr[VIDEO_MAX_FRAME];
 	enum omap_color_mode dss_mode;
 
-	/* we don't allow to request new buffer when old buffers are
-	 * still mmapped
-	 */
-	int mmap_count;
-
-	spinlock_t vbq_lock;		/* spinlock for videobuf queues */
-	unsigned long field_count;	/* field counter for videobuf_buffer */
-
-	/* non-NULL means streaming is in progress. */
-	bool streaming;
+	u32 sequence;
 
 	struct v4l2_pix_format pix;
 	struct v4l2_rect crop;
@@ -169,19 +167,14 @@ struct omap_vout_device {
 	unsigned char pos;
 
 	int ps, vr_ps, line_length, first_int, field_id;
-	enum v4l2_memory memory;
-	struct videobuf_buffer *cur_frm, *next_frm;
+	struct omap_vout_buffer *cur_frm, *next_frm;
+	spinlock_t vbq_lock;            /* spinlock for dma_queue */
 	struct list_head dma_queue;
 	u8 *queued_buf_addr[VIDEO_MAX_FRAME];
 	u32 cropped_offset;
 	s32 tv_field1_offset;
 	void *isr_handle;
-
-	/* Buffer queue variables */
-	struct omap_vout_device *vout;
-	enum v4l2_buf_type type;
-	struct videobuf_queue vbq;
-	int io_allowed;
+	struct vb2_queue vq;
 
 };
 
-- 
2.20.1

