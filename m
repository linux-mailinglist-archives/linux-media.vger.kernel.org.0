Return-Path: <linux-media+bounces-202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E237E9A23
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 11:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22CE41C208B2
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 10:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA981C6BB;
	Mon, 13 Nov 2023 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EDC1C6A2
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 10:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01175C433C8;
	Mon, 13 Nov 2023 10:22:09 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	alsa-devel@alsa-project.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/8] v4l-utils: add v4l-audio support to helper headers
Date: Mon, 13 Nov 2023 11:18:43 +0100
Message-ID: <6551a96a857c767160ec8a01301583c450c3b7e0.1699870530.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <7889c22b922214ebcc0e62feeeb167b40d5042ec.1699870530.git.hverkuil-cisco@xs4all.nl>
References: <7889c22b922214ebcc0e62feeeb167b40d5042ec.1699870530.git.hverkuil-cisco@xs4all.nl>
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
 utils/common/cv4l-helpers.h |  7 ++++++
 utils/common/v4l-helpers.h  | 44 +++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 91a04146..235368ec 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -78,6 +78,13 @@ public:
 	bool has_rds_out() const { return v4l_has_rds_out(this); }
 	bool has_sdr_cap() const { return v4l_has_sdr_cap(this); }
 	bool has_sdr_out() const { return v4l_has_sdr_out(this); }
+	bool has_touch() const { return v4l_has_touch(this); }
+	bool has_meta_cap() const { return v4l_has_meta_cap(this); }
+	bool has_meta_out() const { return v4l_has_meta_out(this); }
+	bool has_audio_cap() const { return v4l_has_audio_cap(this); }
+	bool has_audio_out() const { return v4l_has_audio_out(this); }
+	bool has_audio_m2m() const { return v4l_has_audio_m2m(this); }
+	bool has_m2m() const { return v4l_has_m2m(this); }
 	bool has_hwseek() const { return v4l_has_hwseek(this); }
 	bool has_rw() const { return v4l_has_rw(this); }
 	bool has_streaming() const { return v4l_has_streaming(this); }
diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index f8e96d58..a01b3e48 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -404,6 +404,26 @@ static inline bool v4l_has_touch(const struct v4l_fd *f)
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
@@ -449,6 +469,10 @@ static inline __u32 v4l_determine_type(const struct v4l_fd *f)
 		return V4L2_BUF_TYPE_META_CAPTURE;
 	if (v4l_has_meta_out(f))
 		return V4L2_BUF_TYPE_META_OUTPUT;
+	if (v4l_has_audio_cap(f))
+		return V4L2_BUF_TYPE_AUDIO_CAPTURE;
+	if (v4l_has_audio_out(f))
+		return V4L2_BUF_TYPE_AUDIO_OUTPUT;
 
 	return 0;
 }
@@ -701,6 +725,10 @@ static inline void v4l_format_s_pixelformat(struct v4l2_format *fmt, __u32 pixel
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		fmt->fmt.meta.dataformat = pixelformat;
 		break;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		fmt->fmt.audio.audioformat = pixelformat;
+		break;
 	}
 }
 
@@ -722,6 +750,9 @@ static inline __u32 v4l_format_g_pixelformat(const struct v4l2_format *fmt)
 	case V4L2_BUF_TYPE_META_CAPTURE:
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		return fmt->fmt.meta.dataformat;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		return fmt->fmt.audio.audioformat;
 	default:
 		return 0;
 	}
@@ -1063,6 +1094,9 @@ v4l_format_g_sizeimage(const struct v4l2_format *fmt, unsigned plane)
 	case V4L2_BUF_TYPE_META_CAPTURE:
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		return plane ? 0 : fmt->fmt.meta.buffersize;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		return plane ? 0 : fmt->fmt.audio.buffersize;
 	default:
 		return 0;
 	}
@@ -1187,12 +1221,22 @@ static inline bool v4l_type_is_meta(unsigned type)
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


