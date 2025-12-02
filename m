Return-Path: <linux-media+bounces-48047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBB5C9A8FF
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E6873A61CE
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D044303A0B;
	Tue,  2 Dec 2025 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UyLTSkxG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD486302CB0
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661959; cv=none; b=n/mujWna+VmALaoYG36DaSMTe2n1MfHq8PJ7mLb/077FqB5QR5IFq3kDOLXW1ozdC5IxTW70L7j1WEiKiTGkRbKYnHVP20+SEGQ9YXkvCQXzvOiqCgPReg1wbwW+Q0oI03UPyHvcmNfIKxyTiqcUScfnNEbscDpfnD7EskiBVJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661959; c=relaxed/simple;
	bh=F3JyL4BRCL2uIuBmfuDD+z41O+QHllGDLMjIC/kBUtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BNOU1XGajJJ7sdbvzTrAnIVH2sQ4L7VG1aE1vKcrH1edmD7Pnfa/Tw7fhp7WpQ6EwJPvd0tI48tGJfdrq9JdBr9Xzeg0pbMMp/1daH6axo9CdGClSznjSl+30o+H0ztc9sr+7tyxPzPWqucFWZPzkmRRbLMOFpkBviMO4dZiOcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UyLTSkxG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C553C116D0;
	Tue,  2 Dec 2025 07:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661959;
	bh=F3JyL4BRCL2uIuBmfuDD+z41O+QHllGDLMjIC/kBUtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UyLTSkxGaRvLLOxw/invEsy5IRF+IijfEsxAf5Pb4Ib6sOEViwNoOBDpXuSNd87oV
	 JpMnLGAcDjCRItoqeXIYc1FA+3L+wvA9k+SMQbGBYEXuMq6mR2sNepbDZBdtF6Szuf
	 e+O84yGkbfNzALprAslcHJPiA7YX0aC8Fc9m8WWohRLNO8lbscSITpiHxQP51TGOpF
	 4susA8Odb2wZpJ0ZcpnreDY5YJFgLwbVDPlwVn4PuefvEQ5bOXfIt8/yBg+b4l9oQH
	 HmEXavYoGlxOrmsS4ZLQmOI6ZyeIfhnqdGwy+RESsEA/29rjsnApQmcmVv/M4FVv8U
	 Ih6rnMsqtYMSw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 04/12] media: omap3isp: implement enum_fmt_vid_cap/out
Date: Tue,  2 Dec 2025 08:51:12 +0100
Message-ID: <aac106008d4fea75e7881b6aeac636a884dc8636.1764661880.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1764661880.git.hverkuil+cisco@kernel.org>
References: <cover.1764661880.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing ioctls. This makes v4l2-compliance happier:

fail: v4l2-test-formats.cpp(516): pixelformat 59565955 (UYVY) for buftype 1 not reported by ENUM_FMT
	test VIDIOC_G_FMT: FAIL
fail: v4l2-test-formats.cpp(516): pixelformat 59565955 (UYVY) for buftype 1 not reported by ENUM_FMT
	test VIDIOC_TRY_FMT: FAIL
fail: v4l2-test-formats.cpp(516): pixelformat 56595559 (YUYV) for buftype 1 not reported by ENUM_FMT
	test VIDIOC_S_FMT: FAIL

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/ispvideo.c | 39 +++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index 864d38140b87..5ce8736ca5bd 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -35,6 +35,10 @@
 /*
  * NOTE: When adding new media bus codes, always remember to add
  * corresponding in-memory formats to the table below!!!
+ *
+ * If there are multiple entries with the same pixelformat but
+ * different media bus codes, then keep those together. Otherwise
+ * isp_video_enum_format() cannot detect duplicate pixelformats.
  */
 static struct isp_format_info formats[] = {
 	{ MEDIA_BUS_FMT_Y8_1X8, MEDIA_BUS_FMT_Y8_1X8,
@@ -97,12 +101,12 @@ static struct isp_format_info formats[] = {
 	{ MEDIA_BUS_FMT_UYVY8_1X16, MEDIA_BUS_FMT_UYVY8_1X16,
 	  MEDIA_BUS_FMT_UYVY8_1X16, 0,
 	  V4L2_PIX_FMT_UYVY, 16, 2, },
-	{ MEDIA_BUS_FMT_YUYV8_1X16, MEDIA_BUS_FMT_YUYV8_1X16,
-	  MEDIA_BUS_FMT_YUYV8_1X16, 0,
-	  V4L2_PIX_FMT_YUYV, 16, 2, },
 	{ MEDIA_BUS_FMT_UYVY8_2X8, MEDIA_BUS_FMT_UYVY8_2X8,
 	  MEDIA_BUS_FMT_UYVY8_2X8, 0,
 	  V4L2_PIX_FMT_UYVY, 8, 2, },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, MEDIA_BUS_FMT_YUYV8_1X16,
+	  MEDIA_BUS_FMT_YUYV8_1X16, 0,
+	  V4L2_PIX_FMT_YUYV, 16, 2, },
 	{ MEDIA_BUS_FMT_YUYV8_2X8, MEDIA_BUS_FMT_YUYV8_2X8,
 	  MEDIA_BUS_FMT_YUYV8_2X8, 0,
 	  V4L2_PIX_FMT_YUYV, 8, 2, },
@@ -652,6 +656,33 @@ isp_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 	return 0;
 }
 
+static int
+isp_video_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct isp_video *video = video_drvdata(file);
+	unsigned int i, j;
+
+	if (f->type != video->type)
+		return -EINVAL;
+
+	for (i = 0, j = 0; i < ARRAY_SIZE(formats); i++) {
+		/* Weed out duplicate pixelformats with different mbus codes */
+		if (!f->mbus_code && i &&
+		    formats[i - 1].pixelformat == formats[i].pixelformat)
+			continue;
+		if (f->mbus_code && formats[i].code != f->mbus_code)
+			continue;
+
+		if (j == f->index) {
+			f->pixelformat = formats[i].pixelformat;
+			return 0;
+		}
+		j++;
+	}
+
+	return -EINVAL;
+}
+
 static int
 isp_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
 {
@@ -1258,9 +1289,11 @@ isp_video_s_input(struct file *file, void *fh, unsigned int input)
 
 static const struct v4l2_ioctl_ops isp_video_ioctl_ops = {
 	.vidioc_querycap		= isp_video_querycap,
+	.vidioc_enum_fmt_vid_cap	= isp_video_enum_format,
 	.vidioc_g_fmt_vid_cap		= isp_video_get_format,
 	.vidioc_s_fmt_vid_cap		= isp_video_set_format,
 	.vidioc_try_fmt_vid_cap		= isp_video_try_format,
+	.vidioc_enum_fmt_vid_out	= isp_video_enum_format,
 	.vidioc_g_fmt_vid_out		= isp_video_get_format,
 	.vidioc_s_fmt_vid_out		= isp_video_set_format,
 	.vidioc_try_fmt_vid_out		= isp_video_try_format,
-- 
2.51.0


