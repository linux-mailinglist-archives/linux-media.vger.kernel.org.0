Return-Path: <linux-media+bounces-8319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAB9894813
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 02:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C1AD1F24449
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 00:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C0979DE;
	Tue,  2 Apr 2024 00:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N3+HwggC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B0617F3
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 00:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712016051; cv=none; b=VCm+v/hYzVjzywafbvmxhqibf8MdEZb2Q05O3b3GEIAe8UAcdvx7bUOpFJR/mgncyn380V2vT7uO2/XwAeIsxyBEW1gd6SWE6A4yL8O5y7+G+ZpV2UuNMWfZrjAxyv30JiV+Ib7I/0CxwT0AVLbsGWxNrhfq81AcfuaeoUGva/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712016051; c=relaxed/simple;
	bh=hUF8XQKuhEz2ExH7hiBlvbEUNWyRPrO0sqbqxSTlJ/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MyaXBre21fYU7HUt8aD3sR1fxugDv2Xl0Lcw7gTnZ7un8USXUBPIQf7349aOjGMumCSQjn3dvO6gwgG1uhg/0WxeExarz5g+1HMhx0C/V+Tvfc/2oT6F0zNIQBPBB41b/oY27Ws0jk/QUrvxhJNmz7BvknqMRGInxVlKUMuiaho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N3+HwggC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2459CCE3;
	Tue,  2 Apr 2024 02:00:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712016010;
	bh=hUF8XQKuhEz2ExH7hiBlvbEUNWyRPrO0sqbqxSTlJ/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N3+HwggCM0rZr+vDusEWR3jZwh2/w19ccV1CeZUyUr3iVTmE6vvRyH86uPDw+01m9
	 1aYimqI4q4UujG1jkidrcnIFZRCR1L5gpEp2rUkNVTfuFVY6ZHTF1KLhZeB6BWyEA4
	 7cNak53Zv67w9pB539yVcTSLu918p6Dn/3V7/5nY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: [v4l-utils] [PATCH 2/8] v4l2-compliance: Constify pointers and references in formats tests
Date: Tue,  2 Apr 2024 03:00:27 +0300
Message-ID: <20240402000033.4007-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
References: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multiple variables point to or reference data that never needs to be
modified. Make them const.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-test-formats.cpp | 30 ++++++++++-----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 8a16613c3097..423567fe573b 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -49,7 +49,7 @@ static int testEnumFrameIntervals(struct node *node, __u32 pixfmt,
 				  __u32 w, __u32 h, __u32 type)
 {
 	struct v4l2_frmivalenum frmival;
-	struct v4l2_frmival_stepwise *sw = &frmival.stepwise;
+	const struct v4l2_frmival_stepwise *sw = &frmival.stepwise;
 	bool found_stepwise = false;
 	unsigned f = 0;
 	int ret;
@@ -129,7 +129,7 @@ static int testEnumFrameIntervals(struct node *node, __u32 pixfmt,
 static int testEnumFrameSizes(struct node *node, __u32 pixfmt)
 {
 	struct v4l2_frmsizeenum frmsize;
-	struct v4l2_frmsize_stepwise *sw = &frmsize.stepwise;
+	const struct v4l2_frmsize_stepwise *sw = &frmsize.stepwise;
 	bool found_stepwise = false;
 	__u64 cookie;
 	unsigned f = 0;
@@ -438,15 +438,15 @@ static void createInvalidFmt(struct v4l2_format &fmt, struct v4l2_clip &clip, un
 
 static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4l2_format &fmt, bool have_clip = false)
 {
-	pixfmt_map &map = node->buftype_pixfmts[type];
-	pixfmt_map *map_splane;
-	struct v4l2_pix_format &pix = fmt.fmt.pix;
-	struct v4l2_pix_format_mplane &pix_mp = fmt.fmt.pix_mp;
-	struct v4l2_window &win = fmt.fmt.win;
-	struct v4l2_vbi_format &vbi = fmt.fmt.vbi;
-	struct v4l2_sliced_vbi_format &sliced = fmt.fmt.sliced;
-	struct v4l2_sdr_format &sdr = fmt.fmt.sdr;
-	struct v4l2_meta_format &meta = fmt.fmt.meta;
+	const pixfmt_map &map = node->buftype_pixfmts[type];
+	const pixfmt_map *map_splane;
+	const struct v4l2_pix_format &pix = fmt.fmt.pix;
+	const struct v4l2_pix_format_mplane &pix_mp = fmt.fmt.pix_mp;
+	const struct v4l2_window &win = fmt.fmt.win;
+	const struct v4l2_vbi_format &vbi = fmt.fmt.vbi;
+	const struct v4l2_sliced_vbi_format &sliced = fmt.fmt.sliced;
+	const struct v4l2_sdr_format &sdr = fmt.fmt.sdr;
+	const struct v4l2_meta_format &meta = fmt.fmt.meta;
 	unsigned min_data_samples;
 	unsigned min_sampling_rate;
 	v4l2_std_id std;
@@ -497,7 +497,7 @@ static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4
 			return fail("pix_mp.reserved not zeroed\n");
 		fail_on_test(pix_mp.num_planes == 0 || pix_mp.num_planes >= VIDEO_MAX_PLANES);
 		for (int i = 0; i < pix_mp.num_planes; i++) {
-			struct v4l2_plane_pix_format &pfmt = pix_mp.plane_fmt[i];
+			const struct v4l2_plane_pix_format &pfmt = pix_mp.plane_fmt[i];
 
 			ret = check_0(pfmt.reserved, sizeof(pfmt.reserved));
 			if (ret)
@@ -559,7 +559,7 @@ static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4
 		if (have_clip)
 			fail_on_test(!win.clipcount && (node->fbuf_caps & V4L2_FBUF_CAP_LIST_CLIPPING));
 		if (win.clipcount) {
-			struct v4l2_rect *r = &win.clips->c;
+			const struct v4l2_rect *r = &win.clips->c;
 			struct v4l2_framebuffer fb;
 
 			fail_on_test(doioctl(node, VIDIOC_G_FBUF, &fb));
@@ -1281,8 +1281,8 @@ int testSlicedVBICap(struct node *node)
 static int testParmStruct(struct node *node, struct v4l2_streamparm &parm)
 {
 	bool is_stateful_enc = node->codec_mask & STATEFUL_ENCODER;
-	struct v4l2_captureparm *cap = &parm.parm.capture;
-	struct v4l2_outputparm *out = &parm.parm.output;
+	const struct v4l2_captureparm *cap = &parm.parm.capture;
+	const struct v4l2_outputparm *out = &parm.parm.output;
 	int ret;
 
 	switch (parm.type) {
-- 
Regards,

Laurent Pinchart


