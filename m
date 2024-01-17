Return-Path: <linux-media+bounces-3811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 062498308FF
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 16:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 922D528856F
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 15:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F028D210ED;
	Wed, 17 Jan 2024 15:02:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DAB210E1
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 15:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503761; cv=none; b=GNZCbNsekuPOGjN7Xs7kKUs4bSXt7CAbQaz2c82UO9WD56dHVjmwX9+4aabFZjUxZQGzbqJXeHy9JJeEOTcCQpGuk/zj3AlmvFPnaSUXj/5uYjMrAO8XO5KkasBz9DqLEC7dmL2+YNBmWdtFyo5tM7OugiZjH/zt/szFL6XrP3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503761; c=relaxed/simple;
	bh=R7WV+vabFUs1twg9mfotUzQCkhAMZIOUHkk0qSFkk7E=;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding; b=OdJwafnkPBKp1xyy/6mmiGcMLfe8+ilbDX4lZF3nIKRRZD5vUt0veUx5o604kg6nd/rYOVFAwfq3iRMZAg14ToMFkmcQw3tAR1JNGUxNlyMTcNwtTPCLusqWYXUFL0pcq5aVX74ac/QYcN4wcO6ZpfDmzPe8hUQm6sTHzRDEcyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21894C433F1;
	Wed, 17 Jan 2024 15:02:39 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 02/10] v4l-utils: add v4l-audio support to helper headers
Date: Wed, 17 Jan 2024 16:02:10 +0100
Message-ID: <2ab12b0a568ef97a09bf409527026af6441d2578.1705503477.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <79cf7f3c0fdde2ff151ba05d912ba05b35386d4a.1705503477.git.hverkuil-cisco@xs4all.nl>
References: <79cf7f3c0fdde2ff151ba05d912ba05b35386d4a.1705503477.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add v4l-audio support to helper headers.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 utils/common/cv4l-helpers.h |  4 ++++
 utils/common/v4l-helpers.h  | 44 +++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 77c6517a..f4fc71d6 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -81,6 +81,10 @@ public:
 	bool has_touch() const { return v4l_has_touch(this); }
 	bool has_meta_cap() const { return v4l_has_meta_cap(this); }
 	bool has_meta_out() const { return v4l_has_meta_out(this); }
+	bool has_audio_cap() const { return v4l_has_audio_cap(this); }
+	bool has_audio_out() const { return v4l_has_audio_out(this); }
+	bool has_audio_m2m() const { return v4l_has_audio_m2m(this); }
+	bool has_m2m() const { return v4l_has_m2m(this); }
 	bool has_hwseek() const { return v4l_has_hwseek(this); }
 	bool has_rw() const { return v4l_has_rw(this); }
 	bool has_streaming() const { return v4l_has_streaming(this); }
diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index 7387b621..650220e6 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -405,6 +405,26 @@ static inline bool v4l_has_touch(const struct v4l_fd *f)
 	return v4l_g_caps(f) & V4L2_CAP_TOUCH;
 }
 
+static inline bool v4l_has_audio_cap(const struct v4l_fd *f)
+{
+	return v4l_g_caps(f) & V4L2_CAP_AUDIO_M2M;
+}
+
+static inline bool v4l_has_audio_out(const struct v4l_fd *f)
+{
+	return v4l_g_caps(f) & V4L2_CAP_AUDIO_M2M;
+}
+
+static inline bool v4l_has_audio_m2m(const struct v4l_fd *f)
+{
+	return v4l_g_caps(f) & V4L2_CAP_AUDIO_M2M;
+}
+
+static inline bool v4l_has_m2m(const struct v4l_fd *f)
+{
+	return v4l_has_vid_m2m(f) || v4l_has_audio_m2m(f);
+}
+
 static inline bool v4l_has_hwseek(const struct v4l_fd *f)
 {
 	return v4l_g_caps(f) & V4L2_CAP_HW_FREQ_SEEK;
@@ -450,6 +470,10 @@ static inline __u32 v4l_determine_type(const struct v4l_fd *f)
 		return V4L2_BUF_TYPE_META_CAPTURE;
 	if (v4l_has_meta_out(f))
 		return V4L2_BUF_TYPE_META_OUTPUT;
+	if (v4l_has_audio_cap(f))
+		return V4L2_BUF_TYPE_AUDIO_CAPTURE;
+	if (v4l_has_audio_out(f))
+		return V4L2_BUF_TYPE_AUDIO_OUTPUT;
 
 	return 0;
 }
@@ -704,6 +728,10 @@ static inline void v4l_format_s_pixelformat(struct v4l2_format *fmt, __u32 pixel
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		fmt->fmt.meta.dataformat = pixelformat;
 		break;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		fmt->fmt.audio.audioformat = pixelformat;
+		break;
 	}
 }
 
@@ -725,6 +753,9 @@ static inline __u32 v4l_format_g_pixelformat(const struct v4l2_format *fmt)
 	case V4L2_BUF_TYPE_META_CAPTURE:
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		return fmt->fmt.meta.dataformat;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		return fmt->fmt.audio.audioformat;
 	default:
 		return 0;
 	}
@@ -1066,6 +1097,9 @@ v4l_format_g_sizeimage(const struct v4l2_format *fmt, unsigned plane)
 	case V4L2_BUF_TYPE_META_CAPTURE:
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		return plane ? 0 : fmt->fmt.meta.buffersize;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		return plane ? 0 : fmt->fmt.audio.buffersize;
 	default:
 		return 0;
 	}
@@ -1190,12 +1224,22 @@ static inline bool v4l_type_is_meta(unsigned type)
 	       type == V4L2_BUF_TYPE_META_OUTPUT;
 }
 
+static inline bool v4l_type_is_audio(unsigned type)
+{
+	return type == V4L2_BUF_TYPE_AUDIO_CAPTURE ||
+	       type == V4L2_BUF_TYPE_AUDIO_OUTPUT;
+}
+
 static inline unsigned v4l_type_invert(unsigned type)
 {
 	if (v4l_type_is_planar(type))
 		return v4l_type_is_output(type) ?
 			V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
 			V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	if (v4l_type_is_audio(type))
+		return v4l_type_is_output(type) ?
+			V4L2_BUF_TYPE_AUDIO_CAPTURE :
+			V4L2_BUF_TYPE_AUDIO_OUTPUT;
 	return v4l_type_is_output(type) ?
 		V4L2_BUF_TYPE_VIDEO_CAPTURE :
 		V4L2_BUF_TYPE_VIDEO_OUTPUT;
-- 
2.42.0


