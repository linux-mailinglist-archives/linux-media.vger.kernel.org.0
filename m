Return-Path: <linux-media+bounces-34095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C57EACEC19
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 10:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0E243AAF79
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 08:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B5F1FBE87;
	Thu,  5 Jun 2025 08:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s8WZ6PD9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB1B42A87
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 08:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749112798; cv=none; b=iSg0UQea4c5bGhL50b5vJnXG3vku6tQHinrIy++wfFM75fATsFSzxcYrHBByL2s2xflQahL4XYrph5rvJNGUDuoABqvR7JRxgRguGezorgi9JamNupUKoWl36cCPKJMpMLkeRZxaihprsBI+7jspoQfvLLscCW6kIFUqmrwyb70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749112798; c=relaxed/simple;
	bh=JBsPBh2bWXTIrbd3NHnA1Vgu9UBbdBaNAGBe7JqWIKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MhHExzq6kSfntRg8iDSjOgVrF89XZz0W2lmvYNOiym6rEO8tG4X5FJf+mQ8zx7iPXx2Jo3q+mG5NuIg0aHCaqKk858vTFLm0YK78zyxFCgfnr7qXoRpbtZNeCS+teNBK0orOjN05X9i5tl3bp888aeialjQONbpmqcgmiAav0CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s8WZ6PD9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BC4F1838;
	Thu,  5 Jun 2025 10:39:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749112791;
	bh=JBsPBh2bWXTIrbd3NHnA1Vgu9UBbdBaNAGBe7JqWIKE=;
	h=From:To:Cc:Subject:Date:From;
	b=s8WZ6PD991FUCkbFFWA4xM1/4bt4MvoPYpNoW29tjRuehTnNERe70zYJ26r1XMTQf
	 SSUtSxpPdwTUHsV/wclphGAagPWWGWgfpBqbKt//qGXy0lJRT5gBB82L6pt9/ehNU6
	 uE5WzbWxANj38I35jMu+NqYjfjfvAh6vUEUvShIM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH] media: ipu3-cio2: Use V4L2 subdev active state
Date: Thu,  5 Jun 2025 11:39:45 +0300
Message-ID: <20250605083945.18863-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace storage of the active format in the cio2_queue structure with
usage of V4L2 subdev active state. This simplifies locking in the
driver, and drops usage of the deprecated subdev .open() internal
operation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
I haven't been able to test this patch yet as I'll need to resurect my
IPU3 machine. If anyone can test it easily, that would be appreciated.
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 84 ++++++++++--------------
 drivers/media/pci/intel/ipu3/ipu3-cio2.h |  2 -
 2 files changed, 33 insertions(+), 53 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 16fde96c9fb2..971289179383 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -358,6 +358,8 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 	static const int FBPT_WIDTH = DIV_ROUND_UP(CIO2_MAX_LOPS,
 					CIO2_FBPT_SUBENTRY_UNIT);
 	const u32 num_buffers1 = CIO2_MAX_BUFFERS - 1;
+	struct v4l2_subdev_state *state;
+	const struct v4l2_mbus_framefmt *format;
 	const struct ipu3_cio2_fmt *fmt;
 	void __iomem *const base = cio2->base;
 	u8 lanes, csi2bus = q->csi2.port;
@@ -365,7 +367,13 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 	struct cio2_csi2_timing timing = { 0 };
 	int i, r;
 
-	fmt = cio2_find_format(NULL, &q->subdev_fmt.code);
+	state = v4l2_subdev_lock_and_get_active_state(&q->subdev);
+	format = v4l2_subdev_state_get_format(state, CIO2_PAD_SINK);
+
+	fmt = cio2_find_format(NULL, &format->code);
+
+	v4l2_subdev_unlock_state(state);
+
 	if (!fmt)
 		return -EINVAL;
 
@@ -1194,10 +1202,10 @@ static int cio2_subdev_subscribe_event(struct v4l2_subdev *sd,
 	return v4l2_event_subscribe(fh, sub, 0, NULL);
 }
 
-static int cio2_subdev_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+static int cio2_subdev_init_state(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state)
 {
-	struct v4l2_mbus_framefmt *format;
-	const struct v4l2_mbus_framefmt fmt_default = {
+	static const struct v4l2_mbus_framefmt fmt_default = {
 		.width = 1936,
 		.height = 1096,
 		.code = formats[0].mbus_code,
@@ -1207,42 +1215,23 @@ static int cio2_subdev_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		.quantization = V4L2_QUANTIZATION_DEFAULT,
 		.xfer_func = V4L2_XFER_FUNC_DEFAULT,
 	};
+	struct v4l2_mbus_framefmt *format;
 
-	/* Initialize try_fmt */
-	format = v4l2_subdev_state_get_format(fh->state, CIO2_PAD_SINK);
+	/* Initialize the format on the sink and source pads. */
+	format = v4l2_subdev_state_get_format(state, CIO2_PAD_SINK);
 	*format = fmt_default;
 
 	/* same as sink */
-	format = v4l2_subdev_state_get_format(fh->state, CIO2_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, CIO2_PAD_SOURCE);
 	*format = fmt_default;
 
 	return 0;
 }
 
-static int cio2_subdev_get_fmt(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *sd_state,
-			       struct v4l2_subdev_format *fmt)
-{
-	struct cio2_queue *q = container_of(sd, struct cio2_queue, subdev);
-
-	mutex_lock(&q->subdev_lock);
-
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_state_get_format(sd_state,
-							    fmt->pad);
-	else
-		fmt->format = q->subdev_fmt;
-
-	mutex_unlock(&q->subdev_lock);
-
-	return 0;
-}
-
 static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
-	struct cio2_queue *q = container_of(sd, struct cio2_queue, subdev);
 	struct v4l2_mbus_framefmt *mbus;
 	u32 mbus_code = fmt->format.code;
 	unsigned int i;
@@ -1252,12 +1241,7 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
 	 * source always propagates from sink
 	 */
 	if (fmt->pad == CIO2_PAD_SOURCE)
-		return cio2_subdev_get_fmt(sd, sd_state, fmt);
-
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		mbus = v4l2_subdev_state_get_format(sd_state, fmt->pad);
-	else
-		mbus = &q->subdev_fmt;
+		return v4l2_subdev_get_fmt(sd, sd_state, fmt);
 
 	fmt->format.code = formats[0].mbus_code;
 
@@ -1272,9 +1256,12 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
 	fmt->format.height = min(fmt->format.height, CIO2_IMAGE_MAX_HEIGHT);
 	fmt->format.field = V4L2_FIELD_NONE;
 
-	mutex_lock(&q->subdev_lock);
+	mbus = v4l2_subdev_state_get_format(sd_state, CIO2_PAD_SINK);
+	*mbus = fmt->format;
+
+	/* Propagate the format to the source pad. */
+	mbus = v4l2_subdev_state_get_format(sd_state, CIO2_PAD_SOURCE);
 	*mbus = fmt->format;
-	mutex_unlock(&q->subdev_lock);
 
 	return 0;
 }
@@ -1345,12 +1332,12 @@ static const struct v4l2_subdev_core_ops cio2_subdev_core_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops cio2_subdev_internal_ops = {
-	.open = cio2_subdev_open,
+	.init_state = cio2_subdev_init_state,
 };
 
 static const struct v4l2_subdev_pad_ops cio2_subdev_pad_ops = {
 	.link_validate = v4l2_subdev_link_validate_default,
-	.get_fmt = cio2_subdev_get_fmt,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = cio2_subdev_set_fmt,
 	.enum_mbus_code = cio2_subdev_enum_mbus_code,
 };
@@ -1502,28 +1489,18 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 {
 	static const u32 default_width = 1936;
 	static const u32 default_height = 1096;
-	const struct ipu3_cio2_fmt dflt_fmt = formats[0];
 	struct device *dev = &cio2->pci_dev->dev;
 	struct video_device *vdev = &q->vdev;
 	struct vb2_queue *vbq = &q->vbq;
 	struct v4l2_subdev *subdev = &q->subdev;
-	struct v4l2_mbus_framefmt *fmt;
 	int r;
 
 	/* Initialize miscellaneous variables */
 	mutex_init(&q->lock);
-	mutex_init(&q->subdev_lock);
-
-	/* Initialize formats to default values */
-	fmt = &q->subdev_fmt;
-	fmt->width = default_width;
-	fmt->height = default_height;
-	fmt->code = dflt_fmt.mbus_code;
-	fmt->field = V4L2_FIELD_NONE;
 
 	q->format.width = default_width;
 	q->format.height = default_height;
-	q->format.pixelformat = dflt_fmt.fourcc;
+	q->format.pixelformat = formats[0].fourcc;
 	q->format.colorspace = V4L2_COLORSPACE_RAW;
 	q->format.field = V4L2_FIELD_NONE;
 	q->format.num_planes = 1;
@@ -1567,9 +1544,16 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 		 CIO2_ENTITY_NAME " %td", q - cio2->queue);
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	v4l2_set_subdevdata(subdev, cio2);
+
+	r = v4l2_subdev_init_finalize(subdev);
+	if (r) {
+		dev_err(dev, "failed to initialize subdev (%d)\n", r);
+		goto fail_subdev;
+	}
+
 	r = v4l2_device_register_subdev(&cio2->v4l2_dev, subdev);
 	if (r) {
-		dev_err(dev, "failed initialize subdev (%d)\n", r);
+		dev_err(dev, "failed to register subdev (%d)\n", r);
 		goto fail_subdev;
 	}
 
@@ -1626,7 +1610,6 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 fail_subdev_media_entity:
 	cio2_fbpt_exit(q, dev);
 fail_fbpt:
-	mutex_destroy(&q->subdev_lock);
 	mutex_destroy(&q->lock);
 
 	return r;
@@ -1639,7 +1622,6 @@ static void cio2_queue_exit(struct cio2_device *cio2, struct cio2_queue *q)
 	v4l2_device_unregister_subdev(&q->subdev);
 	media_entity_cleanup(&q->subdev.entity);
 	cio2_fbpt_exit(q, &cio2->pci_dev->dev);
-	mutex_destroy(&q->subdev_lock);
 	mutex_destroy(&q->lock);
 }
 
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
index d7cb7dae665b..19258190936a 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
@@ -351,9 +351,7 @@ struct cio2_queue {
 
 	/* Subdev, /dev/v4l-subdevX */
 	struct v4l2_subdev subdev;
-	struct mutex subdev_lock; /* Serialise acces to subdev_fmt field */
 	struct media_pad subdev_pads[CIO2_PADS];
-	struct v4l2_mbus_framefmt subdev_fmt;
 	atomic_t frame_sequence;
 
 	/* Video device, /dev/videoX */

base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
-- 
Regards,

Laurent Pinchart


