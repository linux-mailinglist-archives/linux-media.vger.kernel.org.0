Return-Path: <linux-media+bounces-3812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B62830902
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 16:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EA23288622
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 15:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3793B21365;
	Wed, 17 Jan 2024 15:02:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A83210E1
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 15:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503762; cv=none; b=LQboahpCkSe9q0oLIZUrotS08EIvC22GK19nMAXc7yYI8atXHvn/lgAyzu8948PwP0KTEFSD/bBk0GeNI/fqtZe8Uvm1YM1m4ddIy69kBklEEENCxH+8kE/zZM2wSHdUK2XK/eP9wSNOjR8Rd8f64rkG2r4+Ed2hVZuvyLY/C9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503762; c=relaxed/simple;
	bh=WarlxSyX91uD5HrX2f6Q+s9xzG5qetIzsG8H9rgTSak=;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding; b=nTZsX9LTWqB1Hg9imtEW1INSaX/pqh3rbV6rbREQFwmWjz4UDk/QifC8DnTv8gN4Vg1g9z9dwT/kSt8L4dhPSM9PTJK+7E3kNQ4BwKFrzPsnRuOAKmXIESMhslbX10Zf8hbnrV7C/mrjMp6N0h1M3ULILL5ch6DWdac5sbWdkWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9FAC43390;
	Wed, 17 Jan 2024 15:02:41 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 03/10] v4l-utils: common: add v4l-audio support
Date: Wed, 17 Jan 2024 16:02:11 +0100
Message-ID: <6bdc0c79b2c4d4ddce4af8d4a5f44cdfbf49cd44.1705503477.git.hverkuil-cisco@xs4all.nl>
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
index c0dd6304..3c333df3 100644
--- a/utils/common/media-info.h
+++ b/utils/common/media-info.h
@@ -16,6 +16,7 @@ enum media_type {
 	MEDIA_TYPE_RADIO,
 	MEDIA_TYPE_SDR,
 	MEDIA_TYPE_TOUCH,
+	MEDIA_TYPE_AUDIO,
 	MEDIA_TYPE_SUBDEV,
 	MEDIA_TYPE_DVB_FRONTEND,
 	MEDIA_TYPE_DVB_DEMUX,
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index 72731bad..6e1e8b8b 100644
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
 
@@ -194,6 +196,10 @@ std::string buftype2s(int type)
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


