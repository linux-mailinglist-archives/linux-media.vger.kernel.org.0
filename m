Return-Path: <linux-media+bounces-203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BD77E9A24
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 11:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E25DB207FC
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 10:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997531CA8E;
	Mon, 13 Nov 2023 10:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD141C6A2
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 10:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2FBC433C7;
	Mon, 13 Nov 2023 10:22:11 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	alsa-devel@alsa-project.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/8] v4l-utils: common: add v4l-audio support
Date: Mon, 13 Nov 2023 11:18:44 +0100
Message-ID: <266ef16e47abee5b13754324cc99943d73e38245.1699870530.git.hverkuil-cisco@xs4all.nl>
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

The media/v4l2-info sources now understand the new Audio types.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 utils/common/media-info.cpp | 3 +++
 utils/common/media-info.h   | 1 +
 utils/common/v4l2-info.cpp  | 6 ++++++
 3 files changed, 10 insertions(+)

diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index 95e4c74f..060e8b64 100644
--- a/utils/common/media-info.cpp
+++ b/utils/common/media-info.cpp
@@ -44,6 +44,7 @@ static constexpr struct {
 	{ "swradio", MEDIA_TYPE_SDR },
 	{ "v4l-subdev", MEDIA_TYPE_SUBDEV },
 	{ "v4l-touch", MEDIA_TYPE_TOUCH },
+	{ "v4l-audio", MEDIA_TYPE_AUDIO },
 	{ "media", MEDIA_TYPE_MEDIA },
 	{ "frontend", MEDIA_TYPE_DVB_FRONTEND },
 	{ "demux", MEDIA_TYPE_DVB_DEMUX },
@@ -280,6 +281,7 @@ static constexpr flag_def interface_types_def[] = {
 	{ MEDIA_INTF_T_V4L_SUBDEV, "V4L Sub-Device" },
 	{ MEDIA_INTF_T_V4L_SWRADIO, "V4L Software Defined Radio" },
 	{ MEDIA_INTF_T_V4L_TOUCH, "V4L Touch" },
+	{ MEDIA_INTF_T_V4L_AUDIO, "V4L Audio" },
 
 	{ MEDIA_INTF_T_ALSA_PCM_CAPTURE, "ALSA PCM Capture" },
 	{ MEDIA_INTF_T_ALSA_PCM_PLAYBACK, "ALSA PCM Playback" },
@@ -335,6 +337,7 @@ static constexpr flag_def entity_functions_def[] = {
 	{ MEDIA_ENT_F_PROC_VIDEO_DECODER, "Video Decoder" },
 	{ MEDIA_ENT_F_PROC_VIDEO_ENCODER, "Video Encoder" },
 	{ MEDIA_ENT_F_PROC_VIDEO_ISP, "Image Signal Processor" },
+	{ MEDIA_ENT_F_PROC_AUDIO_RESAMPLER, "Audio Resampler" },
 	{ MEDIA_ENT_F_VID_MUX, "Video Muxer" },
 	{ MEDIA_ENT_F_VID_IF_BRIDGE, "Video Interface Bridge" },
 	{ 0, nullptr }
diff --git a/utils/common/media-info.h b/utils/common/media-info.h
index a862b70b..578040b4 100644
--- a/utils/common/media-info.h
+++ b/utils/common/media-info.h
@@ -14,6 +14,7 @@ enum media_type {
 	MEDIA_TYPE_RADIO,
 	MEDIA_TYPE_SDR,
 	MEDIA_TYPE_TOUCH,
+	MEDIA_TYPE_AUDIO,
 	MEDIA_TYPE_SUBDEV,
 	MEDIA_TYPE_DVB_FRONTEND,
 	MEDIA_TYPE_DVB_DEMUX,
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index 4f8c2aa7..00de69ae 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -97,6 +97,8 @@ static std::string cap2s(unsigned cap)
 		s += "\t\tExtended Pix Format\n";
 	if (cap & V4L2_CAP_DEVICE_CAPS)
 		s += "\t\tDevice Capabilities\n";
+	if (cap & V4L2_CAP_AUDIO_M2M)
+		s += "\t\tAudio Memory-to-Memory\n";
 	return s;
 }
 
@@ -191,6 +193,10 @@ std::string buftype2s(int type)
 		return "Metadata Capture";
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		return "Metadata Output";
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+		return "Audio Capture";
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		return "Audio Output";
 	case V4L2_BUF_TYPE_PRIVATE:
 		return "Private";
 	default:
-- 
2.42.0


