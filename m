Return-Path: <linux-media+bounces-36218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39518AED11F
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E1E917081B
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9705723D2BD;
	Sun, 29 Jun 2025 20:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKr/I/1a"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BD31EDA1E
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230612; cv=none; b=RGUKWYFfb886pL5Ngrbz2btxbS20+HHM3BTSMmD5ln6HMSnCTAH8citiDPujzP6LZWXbRJNfKTnaXqY599bVRtpS0/p8/OFtId+Y+G7BWVCRCUHvo23ND8VAFdnSAe/JUOlvGUiiNhXfF2x4zwPPXgGL6AadW5g+5KsOeBJUons=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230612; c=relaxed/simple;
	bh=cqrYz9f39lQ4vOCFOWUxDMHrxioDyG+ms/O/wvmRPa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P19E8v7I8RKD/ARAntYGiPLM9bhHLWGM7DsPFU/cFPtgDoLqc2ao/eHLm0s7MrmQI+LUeZiilujrCxANt3hMTsOXu65IlrveRqqq2S+5qXtld+SqI+vlSNOBBVdNfaII6lCUjERb08TFDhW+3oxeFVhtOQod82oc03oP+GfMmLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKr/I/1a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF95C4CEEB;
	Sun, 29 Jun 2025 20:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230611;
	bh=cqrYz9f39lQ4vOCFOWUxDMHrxioDyG+ms/O/wvmRPa0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RKr/I/1a6Jhfu35RlL7M0ip9ml2F2Kamnyn781VA0RsP7uMVQh7HxF2sEEegZErs8
	 4yME3Sr2pOEtKJ3480QtDglzNhs+g48p4thIpuIEMAhfiVKvo/PXuox813vLsxAR21
	 3smOkFwm71Pzucw/UHDYpYNYPjsCUI2gPgbmFyenNiLyYn4MEf2ju5/Gto73LqXTqB
	 HTcOC7ulzdde6nzwZqhKUI3tLRBlyragl4ecU2tywPpWez/W3dK73WhCB8tCt9txKY
	 RwMeLlrWvUuLzDTvmUou6l5/v/Lb/wFQpKw/4cMFnSRnuIeVqSFkXKaw3/1viOXnzJ
	 uxdTmv9qnhQ6A==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 10/15] media: mt9m114: Adjust IFP selections and src format when src pixelfmt changes to/from RAW10
Date: Sun, 29 Jun 2025 22:56:20 +0200
Message-ID: <20250629205626.68341-11-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250629205626.68341-1-hansg@kernel.org>
References: <20250629205626.68341-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changing the IFP src pad pixelfmt to RAW10 means disabling the scaler,
which means that the crop and compose rectangles must be reset to
match the sink format size with no border.

And when changing the src pad pixelfmt back from RAW10 to another pixelfmt
which require demosaicing the crop and compose rectangles must be reset
to the sink format size minus a 4 pixels border all around it.

Also when changing the src pad pixelfmt back from RAW10 to another pixelfmt
the colorspace, ycbcr_enc and quantization need to be updated too.

Add a new mt9m114_ifp_update_sel_and_src_fmt() helper which resets all
these taking the bordersize for the new src pixelfmt into account and
call this helper whenever the src pad pixelfmt changes to/from RAW10.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Changes in v3:
- This is a new patch in v3 of this patch-set, which comes from splitting
  up "media: mt9m114: Fix scaler bypass mode" into multiple patches
---
 drivers/media/i2c/mt9m114.c | 53 +++++++++++++++++++++++++++++++++----
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 020caae95a3d..ef27780384f2 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1820,6 +1820,40 @@ static int mt9m114_ifp_enum_frameintervals(struct v4l2_subdev *sd,
 	return 0;
 }
 
+/*
+ * Helper function to update IFP crop, compose rects and src format when
+ * the pixel border size changes, which requires resetting these.
+ */
+static void mt9m114_ifp_update_sel_and_src_fmt(struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *src_format, *sink_format;
+	struct v4l2_rect *crop;
+	unsigned int border;
+
+	sink_format = v4l2_subdev_state_get_format(state, 0);
+	src_format = v4l2_subdev_state_get_format(state, 1);
+	crop = v4l2_subdev_state_get_crop(state, 0);
+	border = mt9m114_ifp_get_border(state);
+
+	crop->left = border;
+	crop->top = border;
+	crop->width = sink_format->width - 2 * border;
+	crop->height = sink_format->height - 2 * border;
+	*v4l2_subdev_state_get_compose(state, 0) = *crop;
+
+	src_format->width = crop->width;
+	src_format->height = crop->height;
+	if (src_format->code == MEDIA_BUS_FMT_SGRBG10_1X10) {
+		src_format->colorspace = V4L2_COLORSPACE_RAW;
+		src_format->ycbcr_enc = V4L2_YCBCR_ENC_601;
+		src_format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	} else {
+		src_format->colorspace = V4L2_COLORSPACE_SRGB;
+		src_format->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+		src_format->quantization = V4L2_QUANTIZATION_DEFAULT;
+	}
+}
+
 static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *fmt)
@@ -1843,11 +1877,20 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
 		/* Only the media bus code can be changed on the source pad. */
 		info = mt9m114_format_info(sensor, 1, fmt->format.code);
 
-		format->code = info->code;
-
-		/* If the output format is RAW10, bypass the scaler. */
-		if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10)
-			*format = *v4l2_subdev_state_get_format(state, 0);
+		/*
+		 * If the output format changes from/to RAW10 then the crop
+		 * rectangle needs to be adjusted to add / remove the 4 pixel
+		 * border used for demosaicing. And these changes then need to
+		 * be propagated to the compose rectangle and src format size.
+		 */
+		if (format->code != info->code &&
+		    (format->code == MEDIA_BUS_FMT_SGRBG10_1X10 ||
+		     info->code == MEDIA_BUS_FMT_SGRBG10_1X10)) {
+			format->code = info->code;
+			mt9m114_ifp_update_sel_and_src_fmt(state);
+		} else {
+			format->code = info->code;
+		}
 	}
 
 	fmt->format = *format;
-- 
2.49.0


