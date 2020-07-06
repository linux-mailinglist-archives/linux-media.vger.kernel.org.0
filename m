Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620BC215ED1
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730028AbgGFSjJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:39:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730022AbgGFSjI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:39:08 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45DBB2175;
        Mon,  6 Jul 2020 20:38:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060710;
        bh=xQ7qJc+yrcSF0zuDhKzR8SJOq/MKK9og4tlMcXXo4iM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WROlE9LWeywHBNdava/AnAdm3zYgaa+Rb1i9zDPvRRTsmjoQmJSp+u7uWakQ8mqX0
         UuULnpK0TmcUFb5O/VDbp1D+kWZTfOKaT//fzt5JOoNrruSCcZgv/w+COUvWMsfszG
         GBHmKapq6BnXKXvGBz28jdak+maDd1SQ/eRnBrRc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 094/108] media: ti-vpe: cal: Rename struct cal_fmt to cal_format_info
Date:   Mon,  6 Jul 2020 21:36:55 +0300
Message-Id: <20200706183709.12238-95-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_fmt structure stores information about a format. Its name is
ambiguous, as it could be understood as storing a format. Furthermore,
instances of the structure are called 'fmt' through the code, which
leads to confusion with the 'format' variables. Rename the structure to
cal_format_info, and the corresponding 'fmt' variables to 'fmtinfo'.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c |   4 +-
 drivers/media/platform/ti-vpe/cal-video.c    | 104 +++++++++----------
 drivers/media/platform/ti-vpe/cal.c          |  10 +-
 drivers/media/platform/ti-vpe/cal.h          |  14 +--
 4 files changed, 66 insertions(+), 66 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 584dc548504d..fd37ce209461 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -667,7 +667,7 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 					   struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
-	const struct cal_fmt *fmtinfo;
+	const struct cal_format_info *fmtinfo;
 
 	if (fse->index > 0)
 		return -EINVAL;
@@ -720,7 +720,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_format *format)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
-	const struct cal_fmt *fmtinfo;
+	const struct cal_format_info *fmtinfo;
 	struct v4l2_mbus_framefmt *fmt;
 	unsigned int bpp;
 
diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 083389635269..e7ad0b93fc59 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -45,31 +45,31 @@ static char *fourcc_to_str(u32 fmt)
  * ------------------------------------------------------------------
  */
 
-static const struct cal_fmt *find_format_by_pix(struct cal_ctx *ctx,
-						u32 pixelformat)
+static const struct cal_format_info *find_format_by_pix(struct cal_ctx *ctx,
+							u32 pixelformat)
 {
-	const struct cal_fmt *fmt;
+	const struct cal_format_info *fmtinfo;
 	unsigned int k;
 
 	for (k = 0; k < ctx->num_active_fmt; k++) {
-		fmt = ctx->active_fmt[k];
-		if (fmt->fourcc == pixelformat)
-			return fmt;
+		fmtinfo = ctx->active_fmt[k];
+		if (fmtinfo->fourcc == pixelformat)
+			return fmtinfo;
 	}
 
 	return NULL;
 }
 
-static const struct cal_fmt *find_format_by_code(struct cal_ctx *ctx,
-						 u32 code)
+static const struct cal_format_info *find_format_by_code(struct cal_ctx *ctx,
+							 u32 code)
 {
-	const struct cal_fmt *fmt;
+	const struct cal_format_info *fmtinfo;
 	unsigned int k;
 
 	for (k = 0; k < ctx->num_active_fmt; k++) {
-		fmt = ctx->active_fmt[k];
-		if (fmt->code == code)
-			return fmt;
+		fmtinfo = ctx->active_fmt[k];
+		if (fmtinfo->code == code)
+			return fmtinfo;
 	}
 
 	return NULL;
@@ -92,14 +92,14 @@ static int cal_enum_fmt_vid_cap(struct file *file, void  *priv,
 				struct v4l2_fmtdesc *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
-	const struct cal_fmt *fmt;
+	const struct cal_format_info *fmtinfo;
 
 	if (f->index >= ctx->num_active_fmt)
 		return -EINVAL;
 
-	fmt = ctx->active_fmt[f->index];
+	fmtinfo = ctx->active_fmt[f->index];
 
-	f->pixelformat = fmt->fourcc;
+	f->pixelformat = fmtinfo->fourcc;
 	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	return 0;
 }
@@ -148,12 +148,12 @@ static int __subdev_set_format(struct cal_ctx *ctx,
 }
 
 static int cal_calc_format_size(struct cal_ctx *ctx,
-				const struct cal_fmt *fmt,
+				const struct cal_format_info *fmtinfo,
 				struct v4l2_format *f)
 {
 	u32 bpl, max_width;
 
-	if (!fmt) {
+	if (!fmtinfo) {
 		ctx_dbg(3, ctx, "No cal_fmt provided!\n");
 		return -EINVAL;
 	}
@@ -163,12 +163,12 @@ static int cal_calc_format_size(struct cal_ctx *ctx,
 	 * We need to recalculate the actual maxi width depending on the
 	 * number of bytes per pixels required.
 	 */
-	max_width = CAL_MAX_WIDTH_BYTES / (ALIGN(fmt->bpp, 8) >> 3);
+	max_width = CAL_MAX_WIDTH_BYTES / (ALIGN(fmtinfo->bpp, 8) >> 3);
 	v4l_bound_align_image(&f->fmt.pix.width, 48, max_width, 2,
 			      &f->fmt.pix.height, 32, CAL_MAX_HEIGHT_LINES,
 			      0, 0);
 
-	bpl = (f->fmt.pix.width * ALIGN(fmt->bpp, 8)) >> 3;
+	bpl = (f->fmt.pix.width * ALIGN(fmtinfo->bpp, 8)) >> 3;
 	f->fmt.pix.bytesperline = ALIGN(bpl, 16);
 
 	f->fmt.pix.sizeimage = f->fmt.pix.height *
@@ -196,18 +196,18 @@ static int cal_try_fmt_vid_cap(struct file *file, void *priv,
 			       struct v4l2_format *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
-	const struct cal_fmt *fmt;
+	const struct cal_format_info *fmtinfo;
 	struct v4l2_subdev_frame_size_enum fse;
 	int ret, found;
 
-	fmt = find_format_by_pix(ctx, f->fmt.pix.pixelformat);
-	if (!fmt) {
+	fmtinfo = find_format_by_pix(ctx, f->fmt.pix.pixelformat);
+	if (!fmtinfo) {
 		ctx_dbg(3, ctx, "Fourcc format (0x%08x) not found.\n",
 			f->fmt.pix.pixelformat);
 
 		/* Just get the first one enumerated */
-		fmt = ctx->active_fmt[0];
-		f->fmt.pix.pixelformat = fmt->fourcc;
+		fmtinfo = ctx->active_fmt[0];
+		f->fmt.pix.pixelformat = fmtinfo->fourcc;
 	}
 
 	f->fmt.pix.field = ctx->v_fmt.fmt.pix.field;
@@ -216,7 +216,7 @@ static int cal_try_fmt_vid_cap(struct file *file, void *priv,
 	ret = 0;
 	found = false;
 	fse.pad = 0;
-	fse.code = fmt->code;
+	fse.code = fmtinfo->code;
 	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	for (fse.index = 0; ; fse.index++) {
 		ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_frame_size,
@@ -248,7 +248,7 @@ static int cal_try_fmt_vid_cap(struct file *file, void *priv,
 	 * updated properly during s_fmt
 	 */
 	f->fmt.pix.colorspace = ctx->v_fmt.fmt.pix.colorspace;
-	return cal_calc_format_size(ctx, fmt, f);
+	return cal_calc_format_size(ctx, fmtinfo, f);
 }
 
 static int cal_s_fmt_vid_cap(struct file *file, void *priv,
@@ -260,7 +260,7 @@ static int cal_s_fmt_vid_cap(struct file *file, void *priv,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.pad = CAL_CAMERARX_PAD_SINK,
 	};
-	const struct cal_fmt *fmt;
+	const struct cal_format_info *fmtinfo;
 	int ret;
 
 	if (vb2_is_busy(q)) {
@@ -272,16 +272,16 @@ static int cal_s_fmt_vid_cap(struct file *file, void *priv,
 	if (ret < 0)
 		return ret;
 
-	fmt = find_format_by_pix(ctx, f->fmt.pix.pixelformat);
+	fmtinfo = find_format_by_pix(ctx, f->fmt.pix.pixelformat);
 
-	v4l2_fill_mbus_format(&sd_fmt.format, &f->fmt.pix, fmt->code);
+	v4l2_fill_mbus_format(&sd_fmt.format, &f->fmt.pix, fmtinfo->code);
 
 	ret = __subdev_set_format(ctx, &sd_fmt.format);
 	if (ret)
 		return ret;
 
 	/* Just double check nothing has gone wrong */
-	if (sd_fmt.format.code != fmt->code) {
+	if (sd_fmt.format.code != fmtinfo->code) {
 		ctx_dbg(3, ctx,
 			"%s subdev changed format on us, this should not happen\n",
 			__func__);
@@ -290,13 +290,13 @@ static int cal_s_fmt_vid_cap(struct file *file, void *priv,
 
 	v4l2_fill_pix_format(&ctx->v_fmt.fmt.pix, &sd_fmt.format);
 	ctx->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	ctx->v_fmt.fmt.pix.pixelformat = fmt->fourcc;
+	ctx->v_fmt.fmt.pix.pixelformat = fmtinfo->fourcc;
 	ctx->v_fmt.fmt.pix.field = sd_fmt.format.field;
-	cal_calc_format_size(ctx, fmt, &ctx->v_fmt);
+	cal_calc_format_size(ctx, fmtinfo, &ctx->v_fmt);
 
 	v4l2_subdev_call(&ctx->phy->subdev, pad, set_fmt, NULL, &sd_fmt);
 
-	ctx->fmt = fmt;
+	ctx->fmtinfo = fmtinfo;
 	*f = ctx->v_fmt;
 
 	return 0;
@@ -306,13 +306,13 @@ static int cal_enum_framesizes(struct file *file, void *fh,
 			       struct v4l2_frmsizeenum *fsize)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
-	const struct cal_fmt *fmt;
+	const struct cal_format_info *fmtinfo;
 	struct v4l2_subdev_frame_size_enum fse;
 	int ret;
 
 	/* check for valid format */
-	fmt = find_format_by_pix(ctx, fsize->pixel_format);
-	if (!fmt) {
+	fmtinfo = find_format_by_pix(ctx, fsize->pixel_format);
+	if (!fmtinfo) {
 		ctx_dbg(3, ctx, "Invalid pixel code: %x\n",
 			fsize->pixel_format);
 		return -EINVAL;
@@ -320,7 +320,7 @@ static int cal_enum_framesizes(struct file *file, void *fh,
 
 	fse.index = fsize->index;
 	fse.pad = 0;
-	fse.code = fmt->code;
+	fse.code = fmtinfo->code;
 	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 
 	ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_frame_size, NULL,
@@ -366,7 +366,7 @@ static int cal_enum_frameintervals(struct file *file, void *priv,
 				   struct v4l2_frmivalenum *fival)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
-	const struct cal_fmt *fmt;
+	const struct cal_format_info *fmtinfo;
 	struct v4l2_subdev_frame_interval_enum fie = {
 		.index = fival->index,
 		.width = fival->width,
@@ -375,11 +375,11 @@ static int cal_enum_frameintervals(struct file *file, void *priv,
 	};
 	int ret;
 
-	fmt = find_format_by_pix(ctx, fival->pixel_format);
-	if (!fmt)
+	fmtinfo = find_format_by_pix(ctx, fival->pixel_format);
+	if (!fmtinfo)
 		return -EINVAL;
 
-	fie.code = fmt->code;
+	fie.code = fmtinfo->code;
 	ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_frame_interval,
 			       NULL, &fie);
 	if (ret)
@@ -623,7 +623,7 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 {
 	struct v4l2_subdev_mbus_code_enum mbus_code;
 	struct v4l2_mbus_framefmt mbus_fmt;
-	const struct cal_fmt *fmt;
+	const struct cal_format_info *fmtinfo;
 	unsigned int i, j, k;
 	int ret = 0;
 
@@ -647,14 +647,14 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 			ctx->phy->sensor->name, mbus_code.code, j);
 
 		for (k = 0; k < cal_num_formats; k++) {
-			const struct cal_fmt *fmt = &cal_formats[k];
+			fmtinfo = &cal_formats[k];
 
-			if (mbus_code.code == fmt->code) {
-				ctx->active_fmt[i] = fmt;
+			if (mbus_code.code == fmtinfo->code) {
+				ctx->active_fmt[i] = fmtinfo;
 				ctx_dbg(2, ctx,
 					"matched fourcc: %s: code: %04x idx: %u\n",
-					fourcc_to_str(fmt->fourcc),
-					fmt->code, i);
+					fourcc_to_str(fmtinfo->fourcc),
+					fmtinfo->code, i);
 				ctx->num_active_fmt = ++i;
 			}
 		}
@@ -670,8 +670,8 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 	if (ret)
 		return ret;
 
-	fmt = find_format_by_code(ctx, mbus_fmt.code);
-	if (!fmt) {
+	fmtinfo = find_format_by_code(ctx, mbus_fmt.code);
+	if (!fmtinfo) {
 		ctx_dbg(3, ctx, "mbus code format (0x%08x) not found.\n",
 			mbus_fmt.code);
 		return -EINVAL;
@@ -680,10 +680,10 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 	/* Save current format */
 	v4l2_fill_pix_format(&ctx->v_fmt.fmt.pix, &mbus_fmt);
 	ctx->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	ctx->v_fmt.fmt.pix.pixelformat = fmt->fourcc;
+	ctx->v_fmt.fmt.pix.pixelformat = fmtinfo->fourcc;
 	ctx->v_fmt.fmt.pix.field = mbus_fmt.field;
-	cal_calc_format_size(ctx, fmt, &ctx->v_fmt);
-	ctx->fmt = fmt;
+	cal_calc_format_size(ctx, fmtinfo, &ctx->v_fmt);
+	ctx->fmtinfo = fmtinfo;
 
 	return 0;
 }
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 4c938ca1f1a9..213381b8ddfa 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -48,7 +48,7 @@ MODULE_PARM_DESC(debug, "activates debug info");
  * ------------------------------------------------------------------
  */
 
-const struct cal_fmt cal_formats[] = {
+const struct cal_format_info cal_formats[] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_YUYV,
 		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
@@ -146,7 +146,7 @@ const struct cal_fmt cal_formats[] = {
 
 const unsigned int cal_num_formats = ARRAY_SIZE(cal_formats);
 
-const struct cal_fmt *cal_format_by_fourcc(u32 fourcc)
+const struct cal_format_info *cal_format_by_fourcc(u32 fourcc)
 {
 	unsigned int i;
 
@@ -158,7 +158,7 @@ const struct cal_fmt *cal_format_by_fourcc(u32 fourcc)
 	return NULL;
 }
 
-const struct cal_fmt *cal_format_by_code(u32 code)
+const struct cal_format_info *cal_format_by_code(u32 code)
 {
 	unsigned int i;
 
@@ -309,7 +309,7 @@ void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
 {
 	u32 val, extract, pack;
 
-	switch (ctx->fmt->bpp) {
+	switch (ctx->fmtinfo->bpp) {
 	case 8:
 		extract = CAL_PIX_PROC_EXTRACT_B8;
 		pack = CAL_PIX_PROC_PACK_B8;
@@ -338,7 +338,7 @@ void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
 		 */
 		dev_warn_once(ctx->cal->dev,
 			      "%s:%d:%s: bpp:%d unsupported! Overwritten with 8.\n",
-			      __FILE__, __LINE__, __func__, ctx->fmt->bpp);
+			      __FILE__, __LINE__, __func__, ctx->fmtinfo->bpp);
 		extract = CAL_PIX_PROC_EXTRACT_B8;
 		pack = CAL_PIX_PROC_PACK_B8;
 		break;
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 0bfbbc927f49..998c4497496b 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -60,7 +60,7 @@ enum cal_camerarx_field {
 	F_MAX_FIELDS,
 };
 
-struct cal_fmt {
+struct cal_format_info {
 	u32	fourcc;
 	u32	code;
 	/* Bits per pixel */
@@ -126,7 +126,7 @@ struct cal_camerarx {
 	struct v4l2_subdev	subdev;
 	struct media_pad	pads[2];
 	struct v4l2_mbus_framefmt	formats[2];
-	const struct cal_fmt	*fmtinfo;
+	const struct cal_format_info	*fmtinfo;
 };
 
 struct cal_dev {
@@ -172,12 +172,12 @@ struct cal_ctx {
 	struct cal_dmaqueue	vidq;
 
 	/* video capture */
-	const struct cal_fmt	*fmt;
+	const struct cal_format_info	*fmtinfo;
 	/* Used to store current pixel format */
 	struct v4l2_format	v_fmt;
 
 	/* Current subdev enumerated format */
-	const struct cal_fmt	**active_fmt;
+	const struct cal_format_info	**active_fmt;
 	unsigned int		num_active_fmt;
 
 	unsigned int		sequence;
@@ -254,10 +254,10 @@ static inline void cal_set_field(u32 *valp, u32 field, u32 mask)
 	*valp = val;
 }
 
-extern const struct cal_fmt cal_formats[];
+extern const struct cal_format_info cal_formats[];
 extern const unsigned int cal_num_formats;
-const struct cal_fmt *cal_format_by_fourcc(u32 fourcc);
-const struct cal_fmt *cal_format_by_code(u32 code);
+const struct cal_format_info *cal_format_by_fourcc(u32 fourcc);
+const struct cal_format_info *cal_format_by_code(u32 code);
 
 void cal_quickdump_regs(struct cal_dev *cal);
 
-- 
Regards,

Laurent Pinchart

