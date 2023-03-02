Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DADA6A831D
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 14:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjCBNDk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 08:03:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbjCBNDi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 08:03:38 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F446136DA
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 05:03:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F18F1615B3
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 13:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E349C433EF;
        Thu,  2 Mar 2023 13:03:33 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 01/17] media: saa7146: drop 'dev' and 'resources' from struct saa7146_fh
Date:   Thu,  2 Mar 2023 14:03:14 +0100
Message-Id: <20230302130330.1125172-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
References: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead use vv->resources and video_drvdata(file) to
obtain this information.

This prepares for the vb2 conversion later when saa7146_fh is
dropped completely.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/saa7146_fops.c  | 31 +++++-----
 drivers/media/common/saa7146/saa7146_vbi.c   | 21 +++----
 drivers/media/common/saa7146/saa7146_video.c | 60 +++++++++-----------
 drivers/media/pci/saa7146/hexium_gemini.c    |  4 +-
 drivers/media/pci/saa7146/hexium_orion.c     |  4 +-
 drivers/media/pci/saa7146/mxb.c              | 22 +++----
 drivers/media/pci/ttpci/budget-av.c          |  4 +-
 drivers/staging/media/av7110/av7110_v4l.c    | 35 ++++++------
 include/media/drv-intf/saa7146_vv.h          |  7 +--
 9 files changed, 86 insertions(+), 102 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
index 08c8e73cef2c..3cb3ee7855ee 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -7,12 +7,11 @@
 /****************************************************************************/
 /* resource management functions, shamelessly stolen from saa7134 driver */
 
-int saa7146_res_get(struct saa7146_fh *fh, unsigned int bit)
+int saa7146_res_get(struct saa7146_dev *dev, unsigned int bit)
 {
-	struct saa7146_dev *dev = fh->dev;
 	struct saa7146_vv *vv = dev->vv_data;
 
-	if (fh->resources & bit) {
+	if (vv->resources & bit) {
 		DEB_D("already allocated! want: 0x%02x, cur:0x%02x\n",
 		      bit, vv->resources);
 		/* have it already allocated */
@@ -27,20 +26,17 @@ int saa7146_res_get(struct saa7146_fh *fh, unsigned int bit)
 		return 0;
 	}
 	/* it's free, grab it */
-	fh->resources |= bit;
 	vv->resources |= bit;
 	DEB_D("res: get 0x%02x, cur:0x%02x\n", bit, vv->resources);
 	return 1;
 }
 
-void saa7146_res_free(struct saa7146_fh *fh, unsigned int bits)
+void saa7146_res_free(struct saa7146_dev *dev, unsigned int bits)
 {
-	struct saa7146_dev *dev = fh->dev;
 	struct saa7146_vv *vv = dev->vv_data;
 
-	BUG_ON((fh->resources & bits) != bits);
+	WARN_ON((vv->resources & bits) != bits);
 
-	fh->resources &= ~bits;
 	vv->resources &= ~bits;
 	DEB_D("res: put 0x%02x, cur:0x%02x\n", bits, vv->resources);
 }
@@ -221,7 +217,6 @@ static int fops_open(struct file *file)
 	v4l2_fh_init(&fh->fh, vdev);
 
 	file->private_data = &fh->fh;
-	fh->dev = dev;
 
 	if (vdev->vfl_type == VFL_TYPE_VBI) {
 		DEB_S("initializing vbi...\n");
@@ -257,8 +252,8 @@ static int fops_open(struct file *file)
 static int fops_release(struct file *file)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_fh  *fh  = file->private_data;
-	struct saa7146_dev *dev = fh->dev;
 
 	DEB_EE("file:%p\n", file);
 
@@ -287,6 +282,7 @@ static int fops_release(struct file *file)
 static int fops_mmap(struct file *file, struct vm_area_struct * vma)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_fh *fh = file->private_data;
 	struct videobuf_queue *q;
 	int res;
@@ -301,7 +297,7 @@ static int fops_mmap(struct file *file, struct vm_area_struct * vma)
 	case VFL_TYPE_VBI: {
 		DEB_EE("V4L2_BUF_TYPE_VBI_CAPTURE: file:%p, vma:%p\n",
 		       file, vma);
-		if (fh->dev->ext_vv_data->capabilities & V4L2_CAP_SLICED_VBI_OUTPUT)
+		if (dev->ext_vv_data->capabilities & V4L2_CAP_SLICED_VBI_OUTPUT)
 			return -ENODEV;
 		q = &fh->vbi_q;
 		break;
@@ -320,6 +316,7 @@ static int fops_mmap(struct file *file, struct vm_area_struct * vma)
 static __poll_t __fops_poll(struct file *file, struct poll_table_struct *wait)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_fh *fh = file->private_data;
 	struct videobuf_buffer *buf = NULL;
 	struct videobuf_queue *q;
@@ -328,7 +325,7 @@ static __poll_t __fops_poll(struct file *file, struct poll_table_struct *wait)
 	DEB_EE("file:%p, poll:%p\n", file, wait);
 
 	if (vdev->vfl_type == VFL_TYPE_VBI) {
-		if (fh->dev->ext_vv_data->capabilities & V4L2_CAP_SLICED_VBI_OUTPUT)
+		if (dev->ext_vv_data->capabilities & V4L2_CAP_SLICED_VBI_OUTPUT)
 			return res | EPOLLOUT | EPOLLWRNORM;
 		if( 0 == fh->vbi_q.streaming )
 			return res | videobuf_poll_stream(file, &fh->vbi_q, wait);
@@ -370,7 +367,7 @@ static __poll_t fops_poll(struct file *file, struct poll_table_struct *wait)
 static ssize_t fops_read(struct file *file, char __user *data, size_t count, loff_t *ppos)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct saa7146_fh *fh = file->private_data;
+	struct saa7146_dev *dev = video_drvdata(file);
 	int ret;
 
 	switch (vdev->vfl_type) {
@@ -385,7 +382,7 @@ static ssize_t fops_read(struct file *file, char __user *data, size_t count, lof
 		DEB_EE("V4L2_BUF_TYPE_VBI_CAPTURE: file:%p, data:%p, count:%lu\n",
 		       file, data, (unsigned long)count);
 */
-		if (fh->dev->ext_vv_data->capabilities & V4L2_CAP_VBI_CAPTURE) {
+		if (dev->ext_vv_data->capabilities & V4L2_CAP_VBI_CAPTURE) {
 			if (mutex_lock_interruptible(vdev->lock))
 				return -ERESTARTSYS;
 			ret = saa7146_vbi_uops.read(file, data, count, ppos);
@@ -401,17 +398,17 @@ static ssize_t fops_read(struct file *file, char __user *data, size_t count, lof
 static ssize_t fops_write(struct file *file, const char __user *data, size_t count, loff_t *ppos)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct saa7146_fh *fh = file->private_data;
+	struct saa7146_dev *dev = video_drvdata(file);
 	int ret;
 
 	switch (vdev->vfl_type) {
 	case VFL_TYPE_VIDEO:
 		return -EINVAL;
 	case VFL_TYPE_VBI:
-		if (fh->dev->ext_vv_data->vbi_fops.write) {
+		if (dev->ext_vv_data->vbi_fops.write) {
 			if (mutex_lock_interruptible(vdev->lock))
 				return -ERESTARTSYS;
-			ret = fh->dev->ext_vv_data->vbi_fops.write(file, data, count, ppos);
+			ret = dev->ext_vv_data->vbi_fops.write(file, data, count, ppos);
 			mutex_unlock(vdev->lock);
 			return ret;
 		}
diff --git a/drivers/media/common/saa7146/saa7146_vbi.c b/drivers/media/common/saa7146/saa7146_vbi.c
index bd442b984423..1a6fb0f381b7 100644
--- a/drivers/media/common/saa7146/saa7146_vbi.c
+++ b/drivers/media/common/saa7146/saa7146_vbi.c
@@ -219,8 +219,7 @@ static int buffer_activate(struct saa7146_dev *dev,
 static int buffer_prepare(struct videobuf_queue *q, struct videobuf_buffer *vb,enum v4l2_field field)
 {
 	struct file *file = q->priv_data;
-	struct saa7146_fh *fh = file->private_data;
-	struct saa7146_dev *dev = fh->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_buf *buf = (struct saa7146_buf *)vb;
 
 	int err = 0;
@@ -289,8 +288,7 @@ static int buffer_setup(struct videobuf_queue *q, unsigned int *count, unsigned
 static void buffer_queue(struct videobuf_queue *q, struct videobuf_buffer *vb)
 {
 	struct file *file = q->priv_data;
-	struct saa7146_fh *fh = file->private_data;
-	struct saa7146_dev *dev = fh->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
 	struct saa7146_buf *buf = (struct saa7146_buf *)vb;
 
@@ -301,8 +299,7 @@ static void buffer_queue(struct videobuf_queue *q, struct videobuf_buffer *vb)
 static void buffer_release(struct videobuf_queue *q, struct videobuf_buffer *vb)
 {
 	struct file *file = q->priv_data;
-	struct saa7146_fh *fh   = file->private_data;
-	struct saa7146_dev *dev = fh->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_buf *buf = (struct saa7146_buf *)vb;
 
 	DEB_VBI("vb:%p\n", vb);
@@ -320,7 +317,7 @@ static const struct videobuf_queue_ops vbi_qops = {
 
 static void vbi_stop(struct saa7146_fh *fh, struct file *file)
 {
-	struct saa7146_dev *dev = fh->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
 	unsigned long flags;
 	DEB_VBI("dev:%p, fh:%p\n", dev, fh);
@@ -353,8 +350,8 @@ static void vbi_read_timeout(struct timer_list *t)
 {
 	struct saa7146_vv *vv = from_timer(vv, t, vbi_read_timeout);
 	struct file *file = vv->vbi_read_timeout_file;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_fh *fh = file->private_data;
-	struct saa7146_dev *dev = fh->dev;
 
 	DEB_VBI("dev:%p, fh:%p\n", dev, fh);
 
@@ -376,14 +373,14 @@ static void vbi_init(struct saa7146_dev *dev, struct saa7146_vv *vv)
 static int vbi_open(struct saa7146_dev *dev, struct file *file)
 {
 	struct saa7146_fh *fh = file->private_data;
-	struct saa7146_vv *vv = fh->dev->vv_data;
+	struct saa7146_vv *vv = dev->vv_data;
 
 	u32 arbtr_ctrl	= saa7146_read(dev, PCI_BT_V1);
 	int ret = 0;
 
 	DEB_VBI("dev:%p, fh:%p\n", dev, fh);
 
-	ret = saa7146_res_get(fh, RESOURCE_DMA3_BRS);
+	ret = saa7146_res_get(dev, RESOURCE_DMA3_BRS);
 	if (0 == ret) {
 		DEB_S("cannot get vbi RESOURCE_DMA3_BRS resource\n");
 		return -EBUSY;
@@ -431,7 +428,7 @@ static void vbi_close(struct saa7146_dev *dev, struct file *file)
 	if( fh == vv->vbi_streaming ) {
 		vbi_stop(fh, file);
 	}
-	saa7146_res_free(fh, RESOURCE_DMA3_BRS);
+	saa7146_res_free(dev, RESOURCE_DMA3_BRS);
 }
 
 static void vbi_irq_done(struct saa7146_dev *dev, unsigned long status)
@@ -456,7 +453,7 @@ static void vbi_irq_done(struct saa7146_dev *dev, unsigned long status)
 static ssize_t vbi_read(struct file *file, char __user *data, size_t count, loff_t *ppos)
 {
 	struct saa7146_fh *fh = file->private_data;
-	struct saa7146_dev *dev = fh->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
 	ssize_t ret = 0;
 
diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index 27c97218ee53..58f39cf64a1c 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -211,9 +211,8 @@ static int saa7146_pgtable_build(struct saa7146_dev *dev, struct saa7146_buf *bu
 /********************************************************************************/
 /* file operations */
 
-static int video_begin(struct saa7146_fh *fh)
+static int video_begin(struct saa7146_dev *dev, struct saa7146_fh *fh)
 {
-	struct saa7146_dev *dev = fh->dev;
 	struct saa7146_vv *vv = dev->vv_data;
 	struct saa7146_format *fmt = NULL;
 	unsigned int resource;
@@ -241,7 +240,7 @@ static int video_begin(struct saa7146_fh *fh)
 		resource = RESOURCE_DMA1_HPS;
 	}
 
-	ret = saa7146_res_get(fh, resource);
+	ret = saa7146_res_get(dev, resource);
 	if (0 == ret) {
 		DEB_S("cannot get capture resource %d\n", resource);
 		return -EBUSY;
@@ -259,9 +258,8 @@ static int video_begin(struct saa7146_fh *fh)
 	return 0;
 }
 
-static int video_end(struct saa7146_fh *fh, struct file *file)
+static int video_end(struct saa7146_dev *dev, struct saa7146_fh *fh)
 {
-	struct saa7146_dev *dev = fh->dev;
 	struct saa7146_vv *vv = dev->vv_data;
 	struct saa7146_dmaqueue *q = &vv->video_dmaq;
 	struct saa7146_format *fmt = NULL;
@@ -311,14 +309,14 @@ static int video_end(struct saa7146_fh *fh, struct file *file)
 	vv->video_fh = NULL;
 	vv->video_status = 0;
 
-	saa7146_res_free(fh, resource);
+	saa7146_res_free(dev, resource);
 
 	return 0;
 }
 
 static int vidioc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 
 	strscpy((char *)cap->driver, "saa7146 v4l2", sizeof(cap->driver));
 	strscpy((char *)cap->card, dev->ext->name, sizeof(cap->card));
@@ -391,7 +389,7 @@ int saa7146_s_ctrl(struct v4l2_ctrl *ctrl)
 static int vidioc_g_parm(struct file *file, void *fh,
 		struct v4l2_streamparm *parm)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
 
 	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -404,7 +402,7 @@ static int vidioc_g_parm(struct file *file, void *fh,
 
 static int vidioc_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
 
 	f->fmt.pix = vv->video_fmt;
@@ -413,7 +411,7 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format
 
 static int vidioc_g_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
 
 	f->fmt.vbi = vv->vbi_fmt;
@@ -422,7 +420,7 @@ static int vidioc_g_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format
 
 static int vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
 	struct saa7146_format *fmt;
 	enum v4l2_field field;
@@ -487,8 +485,8 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_forma
 
 static int vidioc_s_fmt_vid_cap(struct file *file, void *__fh, struct v4l2_format *f)
 {
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_fh *fh = __fh;
-	struct saa7146_dev *dev = fh->dev;
 	struct saa7146_vv *vv = dev->vv_data;
 	int err;
 
@@ -508,7 +506,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *__fh, struct v4l2_forma
 
 static int vidioc_g_std(struct file *file, void *fh, v4l2_std_id *norm)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
 
 	*norm = vv->standard->id;
@@ -535,7 +533,7 @@ static int vidioc_g_std(struct file *file, void *fh, v4l2_std_id *norm)
 
 static int vidioc_s_std(struct file *file, void *fh, v4l2_std_id id)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
 	int found = 0;
 	int i;
@@ -612,12 +610,13 @@ static int vidioc_dqbuf(struct file *file, void *__fh, struct v4l2_buffer *buf)
 
 static int vidioc_streamon(struct file *file, void *__fh, enum v4l2_buf_type type)
 {
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_fh *fh = __fh;
 	int err;
 
 	DEB_D("VIDIOC_STREAMON, type:%d\n", type);
 
-	err = video_begin(fh);
+	err = video_begin(dev, fh);
 	if (err)
 		return err;
 	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -629,8 +628,8 @@ static int vidioc_streamon(struct file *file, void *__fh, enum v4l2_buf_type typ
 
 static int vidioc_streamoff(struct file *file, void *__fh, enum v4l2_buf_type type)
 {
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_fh *fh = __fh;
-	struct saa7146_dev *dev = fh->dev;
 	struct saa7146_vv *vv = dev->vv_data;
 	int err;
 
@@ -656,9 +655,9 @@ static int vidioc_streamoff(struct file *file, void *__fh, enum v4l2_buf_type ty
 		err = videobuf_streamoff(&fh->vbi_q);
 	if (0 != err) {
 		DEB_D("warning: videobuf_streamoff() failed\n");
-		video_end(fh, file);
+		video_end(dev, fh);
 	} else {
-		err = video_end(fh, file);
+		err = video_end(dev, fh);
 	}
 	return err;
 }
@@ -727,8 +726,7 @@ static int buffer_prepare(struct videobuf_queue *q,
 			  struct videobuf_buffer *vb, enum v4l2_field field)
 {
 	struct file *file = q->priv_data;
-	struct saa7146_fh *fh = file->private_data;
-	struct saa7146_dev *dev = fh->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
 	struct saa7146_buf *buf = (struct saa7146_buf *)vb;
 	int size,err = 0;
@@ -808,8 +806,8 @@ static int buffer_prepare(struct videobuf_queue *q,
 static int buffer_setup(struct videobuf_queue *q, unsigned int *count, unsigned int *size)
 {
 	struct file *file = q->priv_data;
-	struct saa7146_fh *fh = file->private_data;
-	struct saa7146_vv *vv = fh->dev->vv_data;
+	struct saa7146_dev *dev = video_drvdata(file);
+	struct saa7146_vv *vv = dev->vv_data;
 
 	if (0 == *count || *count > MAX_SAA7146_CAPTURE_BUFFERS)
 		*count = MAX_SAA7146_CAPTURE_BUFFERS;
@@ -829,20 +827,18 @@ static int buffer_setup(struct videobuf_queue *q, unsigned int *count, unsigned
 static void buffer_queue(struct videobuf_queue *q, struct videobuf_buffer *vb)
 {
 	struct file *file = q->priv_data;
-	struct saa7146_fh *fh = file->private_data;
-	struct saa7146_dev *dev = fh->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
 	struct saa7146_buf *buf = (struct saa7146_buf *)vb;
 
 	DEB_CAP("vbuf:%p\n", vb);
-	saa7146_buffer_queue(fh->dev, &vv->video_dmaq, buf);
+	saa7146_buffer_queue(dev, &vv->video_dmaq, buf);
 }
 
 static void buffer_release(struct videobuf_queue *q, struct videobuf_buffer *vb)
 {
 	struct file *file = q->priv_data;
-	struct saa7146_fh *fh = file->private_data;
-	struct saa7146_dev *dev = fh->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_buf *buf = (struct saa7146_buf *)vb;
 
 	DEB_CAP("vbuf:%p\n", vb);
@@ -900,7 +896,7 @@ static void video_close(struct saa7146_dev *dev, struct file *file)
 	struct videobuf_queue *q = &fh->video_q;
 
 	if (IS_CAPTURE_ACTIVE(fh) != 0)
-		video_end(fh, file);
+		video_end(dev, fh);
 
 	videobuf_stop(q);
 	/* hmm, why is this function declared void? */
@@ -926,8 +922,8 @@ static void video_irq_done(struct saa7146_dev *dev, unsigned long st)
 
 static ssize_t video_read(struct file *file, char __user *data, size_t count, loff_t *ppos)
 {
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_fh *fh = file->private_data;
-	struct saa7146_dev *dev = fh->dev;
 	struct saa7146_vv *vv = dev->vv_data;
 	ssize_t ret = 0;
 
@@ -943,7 +939,7 @@ static ssize_t video_read(struct file *file, char __user *data, size_t count, lo
 		return -EBUSY;
 	}
 
-	ret = video_begin(fh);
+	ret = video_begin(dev, fh);
 	if( 0 != ret) {
 		goto out;
 	}
@@ -951,9 +947,9 @@ static ssize_t video_read(struct file *file, char __user *data, size_t count, lo
 	ret = videobuf_read_one(&fh->video_q , data, count, ppos,
 				file->f_flags & O_NONBLOCK);
 	if (ret != 0) {
-		video_end(fh, file);
+		video_end(dev, fh);
 	} else {
-		ret = video_end(fh, file);
+		ret = video_end(dev, fh);
 	}
 out:
 	return ret;
diff --git a/drivers/media/pci/saa7146/hexium_gemini.c b/drivers/media/pci/saa7146/hexium_gemini.c
index 3947701cd6c7..7dead0dfcc9f 100644
--- a/drivers/media/pci/saa7146/hexium_gemini.c
+++ b/drivers/media/pci/saa7146/hexium_gemini.c
@@ -215,7 +215,7 @@ static int vidioc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
 
 static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct hexium *hexium = (struct hexium *) dev->ext_priv;
 
 	*input = hexium->cur_input;
@@ -226,7 +226,7 @@ static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
 
 static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct hexium *hexium = (struct hexium *) dev->ext_priv;
 
 	DEB_EE("VIDIOC_S_INPUT %d\n", input);
diff --git a/drivers/media/pci/saa7146/hexium_orion.c b/drivers/media/pci/saa7146/hexium_orion.c
index 2eb4bee16b71..a83fd5d19add 100644
--- a/drivers/media/pci/saa7146/hexium_orion.c
+++ b/drivers/media/pci/saa7146/hexium_orion.c
@@ -326,7 +326,7 @@ static int vidioc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
 
 static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct hexium *hexium = (struct hexium *) dev->ext_priv;
 
 	*input = hexium->cur_input;
@@ -337,7 +337,7 @@ static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
 
 static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct hexium *hexium = (struct hexium *) dev->ext_priv;
 
 	if (input >= HEXIUM_INPUTS)
diff --git a/drivers/media/pci/saa7146/mxb.c b/drivers/media/pci/saa7146/mxb.c
index 7ded8f5b05cb..f518ad8c92ed 100644
--- a/drivers/media/pci/saa7146/mxb.c
+++ b/drivers/media/pci/saa7146/mxb.c
@@ -456,7 +456,7 @@ static int vidioc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
 
 static int vidioc_g_input(struct file *file, void *fh, unsigned int *i)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
 	*i = mxb->cur_input;
 
@@ -466,7 +466,7 @@ static int vidioc_g_input(struct file *file, void *fh, unsigned int *i)
 
 static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
 	int err = 0;
 	int i = 0;
@@ -528,7 +528,7 @@ static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
 
 static int vidioc_g_tuner(struct file *file, void *fh, struct v4l2_tuner *t)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
 
 	if (t->index) {
@@ -550,7 +550,7 @@ static int vidioc_g_tuner(struct file *file, void *fh, struct v4l2_tuner *t)
 
 static int vidioc_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *t)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
 
 	if (t->index) {
@@ -565,14 +565,14 @@ static int vidioc_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *
 
 static int vidioc_querystd(struct file *file, void *fh, v4l2_std_id *norm)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 
 	return call_all(dev, video, querystd, norm);
 }
 
 static int vidioc_g_frequency(struct file *file, void *fh, struct v4l2_frequency *f)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
 
 	if (f->tuner)
@@ -585,7 +585,7 @@ static int vidioc_g_frequency(struct file *file, void *fh, struct v4l2_frequency
 
 static int vidioc_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *f)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
 	struct saa7146_vv *vv = dev->vv_data;
 
@@ -626,7 +626,7 @@ static int vidioc_enumaudio(struct file *file, void *fh, struct v4l2_audio *a)
 
 static int vidioc_g_audio(struct file *file, void *fh, struct v4l2_audio *a)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
 
 	DEB_EE("VIDIOC_G_AUDIO\n");
@@ -636,7 +636,7 @@ static int vidioc_g_audio(struct file *file, void *fh, struct v4l2_audio *a)
 
 static int vidioc_s_audio(struct file *file, void *fh, const struct v4l2_audio *a)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
 
 	DEB_D("VIDIOC_S_AUDIO %d\n", a->index);
@@ -656,7 +656,7 @@ static int vidioc_s_audio(struct file *file, void *fh, const struct v4l2_audio *
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 static int vidioc_g_register(struct file *file, void *fh, struct v4l2_dbg_register *reg)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 
 	if (reg->reg > pci_resource_len(dev->pci, 0) - 4)
 		return -EINVAL;
@@ -667,7 +667,7 @@ static int vidioc_g_register(struct file *file, void *fh, struct v4l2_dbg_regist
 
 static int vidioc_s_register(struct file *file, void *fh, const struct v4l2_dbg_register *reg)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 
 	if (reg->reg > pci_resource_len(dev->pci, 0) - 4)
 		return -EINVAL;
diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci/budget-av.c
index 3cb83005cf09..f33d1e2602d1 100644
--- a/drivers/media/pci/ttpci/budget-av.c
+++ b/drivers/media/pci/ttpci/budget-av.c
@@ -1410,7 +1410,7 @@ static int vidioc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
 
 static int vidioc_g_input(struct file *file, void *fh, unsigned int *i)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct budget_av *budget_av = (struct budget_av *)dev->ext_priv;
 
 	*i = budget_av->cur_input;
@@ -1421,7 +1421,7 @@ static int vidioc_g_input(struct file *file, void *fh, unsigned int *i)
 
 static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct budget_av *budget_av = (struct budget_av *)dev->ext_priv;
 
 	dprintk(1, "VIDIOC_S_INPUT %d\n", input);
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/media/av7110/av7110_v4l.c
index 374f78b84c04..3ab930cd8a27 100644
--- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -213,9 +213,8 @@ static const struct v4l2_audio msp3400_v4l2_audio = {
 	.capability = V4L2_AUDCAP_STEREO
 };
 
-static int av7110_dvb_c_switch(struct saa7146_fh *fh)
+static int av7110_dvb_c_switch(struct saa7146_dev *dev)
 {
-	struct saa7146_dev *dev = fh->dev;
 	struct av7110 *av7110 = (struct av7110*)dev->ext_priv;
 	u16 adswitch;
 	int source, sync;
@@ -295,7 +294,7 @@ static int av7110_dvb_c_switch(struct saa7146_fh *fh)
 
 static int vidioc_g_tuner(struct file *file, void *fh, struct v4l2_tuner *t)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
 	u16 stereo_det;
 	s8 stereo;
@@ -339,7 +338,7 @@ static int vidioc_g_tuner(struct file *file, void *fh, struct v4l2_tuner *t)
 
 static int vidioc_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *t)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
 	u16 fm_matrix, src;
 	dprintk(2, "VIDIOC_S_TUNER: %d\n", t->index);
@@ -383,7 +382,7 @@ static int vidioc_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *
 
 static int vidioc_g_frequency(struct file *file, void *fh, struct v4l2_frequency *f)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
 
 	dprintk(2, "VIDIOC_G_FREQ: freq:0x%08x\n", f->frequency);
@@ -399,7 +398,7 @@ static int vidioc_g_frequency(struct file *file, void *fh, struct v4l2_frequency
 
 static int vidioc_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *f)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
 
 	dprintk(2, "VIDIOC_S_FREQUENCY: freq:0x%08x\n", f->frequency);
@@ -429,7 +428,7 @@ static int vidioc_s_frequency(struct file *file, void *fh, const struct v4l2_fre
 
 static int vidioc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
 
 	dprintk(2, "VIDIOC_ENUMINPUT: %d\n", i->index);
@@ -449,7 +448,7 @@ static int vidioc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
 
 static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
 
 	*input = av7110->current_input;
@@ -459,7 +458,7 @@ static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
 
 static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
 
 	dprintk(2, "VIDIOC_S_INPUT: %d\n", input);
@@ -471,7 +470,7 @@ static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
 		return -EINVAL;
 
 	av7110->current_input = input;
-	return av7110_dvb_c_switch(fh);
+	return av7110_dvb_c_switch(dev);
 }
 
 static int vidioc_enumaudio(struct file *file, void *fh, struct v4l2_audio *a)
@@ -485,7 +484,7 @@ static int vidioc_enumaudio(struct file *file, void *fh, struct v4l2_audio *a)
 
 static int vidioc_g_audio(struct file *file, void *fh, struct v4l2_audio *a)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
 
 	dprintk(2, "VIDIOC_G_AUDIO: %d\n", a->index);
@@ -499,7 +498,7 @@ static int vidioc_g_audio(struct file *file, void *fh, struct v4l2_audio *a)
 
 static int vidioc_s_audio(struct file *file, void *fh, const struct v4l2_audio *a)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
 
 	dprintk(2, "VIDIOC_S_AUDIO: %d\n", a->index);
@@ -511,7 +510,7 @@ static int vidioc_s_audio(struct file *file, void *fh, const struct v4l2_audio *
 static int vidioc_g_sliced_vbi_cap(struct file *file, void *fh,
 					struct v4l2_sliced_vbi_cap *cap)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
 
 	dprintk(2, "VIDIOC_G_SLICED_VBI_CAP\n");
@@ -527,7 +526,7 @@ static int vidioc_g_sliced_vbi_cap(struct file *file, void *fh,
 static int vidioc_g_fmt_sliced_vbi_out(struct file *file, void *fh,
 					struct v4l2_format *f)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
 
 	dprintk(2, "VIDIOC_G_FMT:\n");
@@ -545,7 +544,7 @@ static int vidioc_g_fmt_sliced_vbi_out(struct file *file, void *fh,
 static int vidioc_s_fmt_sliced_vbi_out(struct file *file, void *fh,
 					struct v4l2_format *f)
 {
-	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
 
 	dprintk(2, "VIDIOC_S_FMT\n");
@@ -573,8 +572,7 @@ static int vidioc_s_fmt_sliced_vbi_out(struct file *file, void *fh,
 
 static int av7110_vbi_reset(struct file *file)
 {
-	struct saa7146_fh *fh = file->private_data;
-	struct saa7146_dev *dev = fh->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110*) dev->ext_priv;
 
 	dprintk(2, "%s\n", __func__);
@@ -588,8 +586,7 @@ static int av7110_vbi_reset(struct file *file)
 
 static ssize_t av7110_vbi_write(struct file *file, const char __user *data, size_t count, loff_t *ppos)
 {
-	struct saa7146_fh *fh = file->private_data;
-	struct saa7146_dev *dev = fh->dev;
+	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110*) dev->ext_priv;
 	struct v4l2_sliced_vbi_data d;
 	int rc;
diff --git a/include/media/drv-intf/saa7146_vv.h b/include/media/drv-intf/saa7146_vv.h
index 932961e8f5ab..fee861670ddb 100644
--- a/include/media/drv-intf/saa7146_vv.h
+++ b/include/media/drv-intf/saa7146_vv.h
@@ -80,15 +80,12 @@ struct saa7146_dmaqueue {
 struct saa7146_fh {
 	/* Must be the first field! */
 	struct v4l2_fh		fh;
-	struct saa7146_dev	*dev;
 
 	/* video capture */
 	struct videobuf_queue	video_q;
 
 	/* vbi capture */
 	struct videobuf_queue	vbi_q;
-
-	unsigned int resources;	/* resource management for device open */
 };
 
 #define STATUS_CAPTURE	0x02
@@ -192,8 +189,8 @@ int saa7146_s_ctrl(struct v4l2_ctrl *ctrl);
 extern const struct saa7146_use_ops saa7146_vbi_uops;
 
 /* resource management functions */
-int saa7146_res_get(struct saa7146_fh *fh, unsigned int bit);
-void saa7146_res_free(struct saa7146_fh *fh, unsigned int bits);
+int saa7146_res_get(struct saa7146_dev *dev, unsigned int bit);
+void saa7146_res_free(struct saa7146_dev *dev, unsigned int bits);
 
 #define RESOURCE_DMA1_HPS	0x1
 #define RESOURCE_DMA2_CLP	0x2
-- 
2.39.1

