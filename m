Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806D3339EA1
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 15:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234065AbhCMOnw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 09:43:52 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:39887 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234034AbhCMOnb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 09:43:31 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id L5UBljyoWC40pL5UIlV5eX; Sat, 13 Mar 2021 15:43:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615646610; bh=Q7QiQVmH8VVhnSJZxvkP8BuPJlLvE+U9lNHKjTbZ3/U=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=OLmm0SXOHINpoCcculWtqKYpDRaEH+fvm4bXOyl3ki/M+hta9Bq/1Ku0A0fLim4d8
         ldLns/Gqs0J8VKDpvxt3A4XKwZfFIuD6tAUF54lrtAnojU4Z5UxoHEE1TdOdoZnxD2
         UcPGkxPziY8KORjK/ZkZtONOMRxfjYQEwGF60ttvA9ibA4n5pz8AN/4Ta8J+qTI287
         gwRp+HYSXCdekRlGho4c7eYScsLnwdfY3n66jAKD/LQygln8yjJMlDT5XpR587fpvf
         avNH/iHx1mh4x6bhXnmYnIWt4Xc80U9H38UxorodmAW6LN2G8VyX5w1uU0NQ0inhcv
         ZoGFccvfOGkNw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 09/15] media/platform: rename MPEG to CODEC
Date:   Sat, 13 Mar 2021 15:43:17 +0100
Message-Id: <20210313144323.143600-10-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
References: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIh2kl1GkjNDZ839RU89rU7JIlz/Dpg9Ug6+sf1vZ9aM0wB9FTrQXLWmvRXqms0kreacuBi5YkmdKj8bnJ7Us4Gy4qoOzqpcs4oOLhG6c8fl+fqFphUO
 1TZh4fS6XwQ55u2ThsAxwVG6eSvUBoa++FhjYoPSEXsZ9IW4dbt/w40or9IiDT8zCwxsthOKeQpMVFDUd5ev739T3PfS5/CVs4/drG+I1k3ijeMjLpPblhXY
 xUOk0qRK6etC493qrR/4UOfwre0isvld9zigxomdadiZfqxJU+X6o54Kyhh5zz+avLBwf84TfGR8iOwbDAlosIPHZfK/A+gTaafjHx68aEr8EiLULp9tnanO
 aPnx8e2oupAaJjV3ZgzBcUbkVZvpqQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Historically all codec-related data structures and defines used the
MPEG prefix. This is confusing. Rename MPEG to CODEC to make it clear
that the MPEG prefix isn't MPEG specific.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/platform/allegro-dvt/allegro-core.c | 348 ++++----
 drivers/media/platform/allegro-dvt/nal-h264.c |  52 +-
 drivers/media/platform/allegro-dvt/nal-h264.h |   4 +-
 drivers/media/platform/allegro-dvt/nal-hevc.c |  42 +-
 drivers/media/platform/allegro-dvt/nal-hevc.h |   6 +-
 drivers/media/platform/coda/coda-bit.c        |   8 +-
 drivers/media/platform/coda/coda-common.c     | 218 ++---
 drivers/media/platform/coda/coda-h264.c       |  40 +-
 drivers/media/platform/coda/coda-mpeg2.c      |  18 +-
 drivers/media/platform/coda/coda-mpeg4.c      |  22 +-
 drivers/media/platform/coda/coda.h            |   2 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   6 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  80 +-
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  38 +-
 drivers/media/platform/qcom/venus/helpers.c   | 154 ++--
 .../media/platform/qcom/venus/vdec_ctrls.c    |  92 +--
 drivers/media/platform/qcom/venus/venc.c      |  26 +-
 .../media/platform/qcom/venus/venc_ctrls.c    | 294 +++----
 .../media/platform/s5p-mfc/s5p_mfc_common.h   |  28 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |  16 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  | 764 +++++++++---------
 .../media/platform/s5p-mfc/s5p_mfc_opr_v5.c   |  12 +-
 .../media/platform/s5p-mfc/s5p_mfc_opr_v6.c   |  38 +-
 drivers/media/platform/sti/hva/hva-debugfs.c  |  10 +-
 drivers/media/platform/sti/hva/hva-h264.c     |  48 +-
 drivers/media/platform/sti/hva/hva-v4l2.c     | 100 +--
 drivers/media/platform/sti/hva/hva.h          |  14 +-
 27 files changed, 1240 insertions(+), 1240 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 887b492e4ad1..1601ae01dfda 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -496,13 +496,13 @@ static unsigned int estimate_stream_size(unsigned int width,
 	return round_up(offset + num_blocks * pcm_size + partition_table, 32);
 }
 
-static enum v4l2_mpeg_video_h264_level
+static enum v4l2_codec_video_h264_level
 select_minimum_h264_level(unsigned int width, unsigned int height)
 {
 	unsigned int pic_width_in_mb = DIV_ROUND_UP(width, SIZE_MACROBLOCK);
 	unsigned int frame_height_in_mb = DIV_ROUND_UP(height, SIZE_MACROBLOCK);
 	unsigned int frame_size_in_mb = pic_width_in_mb * frame_height_in_mb;
-	enum v4l2_mpeg_video_h264_level level = V4L2_MPEG_VIDEO_H264_LEVEL_4_0;
+	enum v4l2_codec_video_h264_level level = V4L2_CODEC_VIDEO_H264_LEVEL_4_0;
 
 	/*
 	 * The level limits are specified in Rec. ITU-T H.264 Annex A.3.1 and
@@ -512,183 +512,183 @@ select_minimum_h264_level(unsigned int width, unsigned int height)
 	 * Level 5.1 allows up to 4k video resolution.
 	 */
 	if (frame_size_in_mb <= 99)
-		level = V4L2_MPEG_VIDEO_H264_LEVEL_1_0;
+		level = V4L2_CODEC_VIDEO_H264_LEVEL_1_0;
 	else if (frame_size_in_mb <= 396)
-		level = V4L2_MPEG_VIDEO_H264_LEVEL_1_1;
+		level = V4L2_CODEC_VIDEO_H264_LEVEL_1_1;
 	else if (frame_size_in_mb <= 792)
-		level = V4L2_MPEG_VIDEO_H264_LEVEL_2_1;
+		level = V4L2_CODEC_VIDEO_H264_LEVEL_2_1;
 	else if (frame_size_in_mb <= 1620)
-		level = V4L2_MPEG_VIDEO_H264_LEVEL_2_2;
+		level = V4L2_CODEC_VIDEO_H264_LEVEL_2_2;
 	else if (frame_size_in_mb <= 3600)
-		level = V4L2_MPEG_VIDEO_H264_LEVEL_3_1;
+		level = V4L2_CODEC_VIDEO_H264_LEVEL_3_1;
 	else if (frame_size_in_mb <= 5120)
-		level = V4L2_MPEG_VIDEO_H264_LEVEL_3_2;
+		level = V4L2_CODEC_VIDEO_H264_LEVEL_3_2;
 	else if (frame_size_in_mb <= 8192)
-		level = V4L2_MPEG_VIDEO_H264_LEVEL_4_0;
+		level = V4L2_CODEC_VIDEO_H264_LEVEL_4_0;
 	else if (frame_size_in_mb <= 8704)
-		level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
+		level = V4L2_CODEC_VIDEO_H264_LEVEL_4_2;
 	else if (frame_size_in_mb <= 22080)
-		level = V4L2_MPEG_VIDEO_H264_LEVEL_5_0;
+		level = V4L2_CODEC_VIDEO_H264_LEVEL_5_0;
 	else
-		level = V4L2_MPEG_VIDEO_H264_LEVEL_5_1;
+		level = V4L2_CODEC_VIDEO_H264_LEVEL_5_1;
 
 	return level;
 }
 
-static unsigned int h264_maximum_bitrate(enum v4l2_mpeg_video_h264_level level)
+static unsigned int h264_maximum_bitrate(enum v4l2_codec_video_h264_level level)
 {
 	switch (level) {
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_0:
 		return 64000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1B:
 		return 128000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_1:
 		return 192000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_2:
 		return 384000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_3:
 		return 768000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_2_0:
 		return 2000000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_2_1:
 		return 4000000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_2_2:
 		return 4000000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_3_0:
 		return 10000000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_3_1:
 		return 14000000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_3_2:
 		return 20000000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_4_0:
 		return 20000000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_4_1:
 		return 50000000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_4_2:
 		return 50000000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_5_0:
 		return 135000000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_5_1:
 	default:
 		return 240000000;
 	}
 }
 
-static unsigned int h264_maximum_cpb_size(enum v4l2_mpeg_video_h264_level level)
+static unsigned int h264_maximum_cpb_size(enum v4l2_codec_video_h264_level level)
 {
 	switch (level) {
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_0:
 		return 175;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1B:
 		return 350;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_1:
 		return 500;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_2:
 		return 1000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_3:
 		return 2000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_2_0:
 		return 2000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_2_1:
 		return 4000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_2_2:
 		return 4000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_3_0:
 		return 10000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_3_1:
 		return 14000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_3_2:
 		return 20000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_4_0:
 		return 25000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_4_1:
 		return 62500;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_4_2:
 		return 62500;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_5_0:
 		return 135000;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_5_1:
 	default:
 		return 240000;
 	}
 }
 
-static enum v4l2_mpeg_video_hevc_level
+static enum v4l2_codec_video_hevc_level
 select_minimum_hevc_level(unsigned int width, unsigned int height)
 {
 	unsigned int luma_picture_size = width * height;
-	enum v4l2_mpeg_video_hevc_level level;
+	enum v4l2_codec_video_hevc_level level;
 
 	if (luma_picture_size <= 36864)
-		level = V4L2_MPEG_VIDEO_HEVC_LEVEL_1;
+		level = V4L2_CODEC_VIDEO_HEVC_LEVEL_1;
 	else if (luma_picture_size <= 122880)
-		level = V4L2_MPEG_VIDEO_HEVC_LEVEL_2;
+		level = V4L2_CODEC_VIDEO_HEVC_LEVEL_2;
 	else if (luma_picture_size <= 245760)
-		level = V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1;
+		level = V4L2_CODEC_VIDEO_HEVC_LEVEL_2_1;
 	else if (luma_picture_size <= 552960)
-		level = V4L2_MPEG_VIDEO_HEVC_LEVEL_3;
+		level = V4L2_CODEC_VIDEO_HEVC_LEVEL_3;
 	else if (luma_picture_size <= 983040)
-		level = V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1;
+		level = V4L2_CODEC_VIDEO_HEVC_LEVEL_3_1;
 	else if (luma_picture_size <= 2228224)
-		level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4;
+		level = V4L2_CODEC_VIDEO_HEVC_LEVEL_4;
 	else if (luma_picture_size <= 8912896)
-		level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5;
+		level = V4L2_CODEC_VIDEO_HEVC_LEVEL_5;
 	else
-		level = V4L2_MPEG_VIDEO_HEVC_LEVEL_6;
+		level = V4L2_CODEC_VIDEO_HEVC_LEVEL_6;
 
 	return level;
 }
 
-static unsigned int hevc_maximum_bitrate(enum v4l2_mpeg_video_hevc_level level)
+static unsigned int hevc_maximum_bitrate(enum v4l2_codec_video_hevc_level level)
 {
 	/*
 	 * See Rec. ITU-T H.265 v5 (02/2018), A.4.2 Profile-specific level
 	 * limits for the video profiles.
 	 */
 	switch (level) {
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_1:
 		return 128;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_2:
 		return 1500;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_2_1:
 		return 3000;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_3:
 		return 6000;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_3_1:
 		return 10000;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_4:
 		return 12000;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_4_1:
 		return 20000;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_5:
 		return 25000;
 	default:
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_5_1:
 		return 40000;
 	}
 }
 
-static unsigned int hevc_maximum_cpb_size(enum v4l2_mpeg_video_hevc_level level)
+static unsigned int hevc_maximum_cpb_size(enum v4l2_codec_video_hevc_level level)
 {
 	switch (level) {
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_1:
 		return 350;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_2:
 		return 1500;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_2_1:
 		return 3000;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_3:
 		return 6000;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_3_1:
 		return 10000;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_4:
 		return 12000;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_4_1:
 		return 20000;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_5:
 		return 25000;
 	default:
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_5_1:
 		return 40000;
 	}
 }
@@ -970,108 +970,108 @@ static u32 v4l2_colorspace_to_mcu_colorspace(enum v4l2_colorspace colorspace)
 	}
 }
 
-static u8 v4l2_profile_to_mcu_profile(enum v4l2_mpeg_video_h264_profile profile)
+static u8 v4l2_profile_to_mcu_profile(enum v4l2_codec_video_h264_profile profile)
 {
 	switch (profile) {
-	case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
+	case V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE:
 	default:
 		return 66;
 	}
 }
 
-static u16 v4l2_level_to_mcu_level(enum v4l2_mpeg_video_h264_level level)
+static u16 v4l2_level_to_mcu_level(enum v4l2_codec_video_h264_level level)
 {
 	switch (level) {
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_0:
 		return 10;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_1:
 		return 11;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_2:
 		return 12;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_3:
 		return 13;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_2_0:
 		return 20;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_2_1:
 		return 21;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_2_2:
 		return 22;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_3_0:
 		return 30;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_3_1:
 		return 31;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_3_2:
 		return 32;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_4_0:
 		return 40;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_4_1:
 		return 41;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_4_2:
 		return 42;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_5_0:
 		return 50;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_5_1:
 	default:
 		return 51;
 	}
 }
 
-static u8 hevc_profile_to_mcu_profile(enum v4l2_mpeg_video_hevc_profile profile)
+static u8 hevc_profile_to_mcu_profile(enum v4l2_codec_video_hevc_profile profile)
 {
 	switch (profile) {
 	default:
-	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN:
+	case V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN:
 		return 1;
-	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10:
+	case V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN_10:
 		return 2;
-	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE:
+	case V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE:
 		return 3;
 	}
 }
 
-static u16 hevc_level_to_mcu_level(enum v4l2_mpeg_video_hevc_level level)
+static u16 hevc_level_to_mcu_level(enum v4l2_codec_video_hevc_level level)
 {
 	switch (level) {
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_1:
 		return 10;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_2:
 		return 20;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_2_1:
 		return 21;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_3:
 		return 30;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_3_1:
 		return 31;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_4:
 		return 40;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_4_1:
 		return 41;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_5:
 		return 50;
 	default:
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_5_1:
 		return 51;
 	}
 }
 
-static u8 hevc_tier_to_mcu_tier(enum v4l2_mpeg_video_hevc_tier tier)
+static u8 hevc_tier_to_mcu_tier(enum v4l2_codec_video_hevc_tier tier)
 {
 	switch (tier) {
 	default:
-	case V4L2_MPEG_VIDEO_HEVC_TIER_MAIN:
+	case V4L2_CODEC_VIDEO_HEVC_TIER_MAIN:
 		return 0;
-	case V4L2_MPEG_VIDEO_HEVC_TIER_HIGH:
+	case V4L2_CODEC_VIDEO_HEVC_TIER_HIGH:
 		return 1;
 	}
 }
 
 static u32
-v4l2_bitrate_mode_to_mcu_mode(enum v4l2_mpeg_video_bitrate_mode mode)
+v4l2_bitrate_mode_to_mcu_mode(enum v4l2_codec_video_bitrate_mode mode)
 {
 	switch (mode) {
-	case V4L2_MPEG_VIDEO_BITRATE_MODE_VBR:
+	case V4L2_CODEC_VIDEO_BITRATE_MODE_VBR:
 		return 2;
-	case V4L2_MPEG_VIDEO_BITRATE_MODE_CBR:
+	case V4L2_CODEC_VIDEO_BITRATE_MODE_CBR:
 	default:
 		return 1;
 	}
@@ -1084,7 +1084,7 @@ static u32 v4l2_cpb_size_to_mcu(unsigned int cpb_size, unsigned int bitrate)
 
 	/*
 	 * The mcu expects the CPB size in units of a 90 kHz clock, but the
-	 * channel follows the V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE and stores
+	 * channel follows the V4L2_CID_CODEC_VIDEO_H264_CPB_SIZE and stores
 	 * the CPB size in kilobytes.
 	 */
 	cpb_size_kbit = cpb_size * BITS_PER_BYTE;
@@ -1131,8 +1131,8 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 
 	param->codec = channel->codec;
 	if (channel->codec == V4L2_PIX_FMT_H264) {
-		enum v4l2_mpeg_video_h264_profile profile;
-		enum v4l2_mpeg_video_h264_level level;
+		enum v4l2_codec_video_h264_profile profile;
+		enum v4l2_codec_video_h264_level level;
 
 		profile = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_profile);
 		level = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_level);
@@ -1141,9 +1141,9 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 		param->constraint_set_flags = BIT(1);
 		param->level = v4l2_level_to_mcu_level(level);
 	} else {
-		enum v4l2_mpeg_video_hevc_profile profile;
-		enum v4l2_mpeg_video_hevc_level level;
-		enum v4l2_mpeg_video_hevc_tier tier;
+		enum v4l2_codec_video_hevc_profile profile;
+		enum v4l2_codec_video_hevc_level level;
+		enum v4l2_codec_video_hevc_tier tier;
 
 		profile = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_profile);
 		level = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_level);
@@ -1497,8 +1497,8 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	/* Calculation of crop units in Rec. ITU-T H.264 (04/2017) p. 76 */
 	unsigned int crop_unit_x = 2;
 	unsigned int crop_unit_y = 2;
-	enum v4l2_mpeg_video_h264_profile profile;
-	enum v4l2_mpeg_video_h264_level level;
+	enum v4l2_codec_video_h264_profile profile;
+	enum v4l2_codec_video_h264_level level;
 	unsigned int cpb_size;
 	unsigned int cpb_size_scale;
 
@@ -2797,9 +2797,9 @@ static int allegro_clamp_qp(struct allegro_channel *channel,
 {
 	struct v4l2_ctrl *next_ctrl;
 
-	if (ctrl->id == V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP)
+	if (ctrl->id == V4L2_CID_CODEC_VIDEO_H264_I_FRAME_QP)
 		next_ctrl = channel->mpeg_video_h264_p_frame_qp;
-	else if (ctrl->id == V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP)
+	else if (ctrl->id == V4L2_CID_CODEC_VIDEO_H264_P_FRAME_QP)
 		next_ctrl = channel->mpeg_video_h264_b_frame_qp;
 	else
 		return 0;
@@ -2816,7 +2816,7 @@ static int allegro_clamp_bitrate(struct allegro_channel *channel,
 	struct v4l2_ctrl *ctrl_bitrate = channel->mpeg_video_bitrate;
 	struct v4l2_ctrl *ctrl_bitrate_peak = channel->mpeg_video_bitrate_peak;
 
-	if (ctrl->val == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR &&
+	if (ctrl->val == V4L2_CODEC_VIDEO_BITRATE_MODE_VBR &&
 	    ctrl_bitrate_peak->val < ctrl_bitrate->val)
 		ctrl_bitrate_peak->val = ctrl_bitrate->val;
 
@@ -2830,7 +2830,7 @@ static int allegro_try_ctrl(struct v4l2_ctrl *ctrl)
 						       ctrl_handler);
 
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_MODE:
 		allegro_clamp_bitrate(channel, ctrl);
 		break;
 	}
@@ -2849,18 +2849,18 @@ static int allegro_s_ctrl(struct v4l2_ctrl *ctrl)
 		 "s_ctrl: %s = %d\n", v4l2_ctrl_get_name(ctrl->id), ctrl->val);
 
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
+	case V4L2_CID_CODEC_VIDEO_FRAME_RC_ENABLE:
 		channel->frame_rc_enable = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_MODE:
 		channel->bitrate = channel->mpeg_video_bitrate->val;
 		channel->bitrate_peak = channel->mpeg_video_bitrate_peak->val;
 		v4l2_ctrl_activate(channel->mpeg_video_bitrate_peak,
-				   ctrl->val == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR);
+				   ctrl->val == V4L2_CODEC_VIDEO_BITRATE_MODE_VBR);
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:
-	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP:
-	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_I_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_P_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_B_FRAME_QP:
 		allegro_clamp_qp(channel, ctrl);
 		break;
 	}
@@ -2905,123 +2905,123 @@ static int allegro_open(struct file *file)
 	v4l2_ctrl_handler_init(handler, 0);
 	channel->mpeg_video_h264_profile = v4l2_ctrl_new_std_menu(handler,
 			&allegro_ctrl_ops,
-			V4L2_CID_MPEG_VIDEO_H264_PROFILE,
-			V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE, 0x0,
-			V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE);
-	mask = 1 << V4L2_MPEG_VIDEO_H264_LEVEL_1B;
+			V4L2_CID_CODEC_VIDEO_H264_PROFILE,
+			V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE, 0x0,
+			V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE);
+	mask = 1 << V4L2_CODEC_VIDEO_H264_LEVEL_1B;
 	channel->mpeg_video_h264_level = v4l2_ctrl_new_std_menu(handler,
 			&allegro_ctrl_ops,
-			V4L2_CID_MPEG_VIDEO_H264_LEVEL,
-			V4L2_MPEG_VIDEO_H264_LEVEL_5_1, mask,
-			V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
+			V4L2_CID_CODEC_VIDEO_H264_LEVEL,
+			V4L2_CODEC_VIDEO_H264_LEVEL_5_1, mask,
+			V4L2_CODEC_VIDEO_H264_LEVEL_5_1);
 	channel->mpeg_video_h264_i_frame_qp =
 		v4l2_ctrl_new_std(handler,
 				  &allegro_ctrl_ops,
-				  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP,
+				  V4L2_CID_CODEC_VIDEO_H264_I_FRAME_QP,
 				  0, 51, 1, 30);
 	channel->mpeg_video_h264_max_qp =
 		v4l2_ctrl_new_std(handler,
 				  &allegro_ctrl_ops,
-				  V4L2_CID_MPEG_VIDEO_H264_MAX_QP,
+				  V4L2_CID_CODEC_VIDEO_H264_MAX_QP,
 				  0, 51, 1, 51);
 	channel->mpeg_video_h264_min_qp =
 		v4l2_ctrl_new_std(handler,
 				  &allegro_ctrl_ops,
-				  V4L2_CID_MPEG_VIDEO_H264_MIN_QP,
+				  V4L2_CID_CODEC_VIDEO_H264_MIN_QP,
 				  0, 51, 1, 0);
 	channel->mpeg_video_h264_p_frame_qp =
 		v4l2_ctrl_new_std(handler,
 				  &allegro_ctrl_ops,
-				  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP,
+				  V4L2_CID_CODEC_VIDEO_H264_P_FRAME_QP,
 				  0, 51, 1, 30);
 	channel->mpeg_video_h264_b_frame_qp =
 		v4l2_ctrl_new_std(handler,
 				  &allegro_ctrl_ops,
-				  V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP,
+				  V4L2_CID_CODEC_VIDEO_H264_B_FRAME_QP,
 				  0, 51, 1, 30);
 
 	channel->mpeg_video_hevc_profile =
 		v4l2_ctrl_new_std_menu(handler,
 				       &allegro_ctrl_ops,
-				       V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
-				       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN, 0x0,
-				       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN);
+				       V4L2_CID_CODEC_VIDEO_HEVC_PROFILE,
+				       V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN, 0x0,
+				       V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN);
 	channel->mpeg_video_hevc_level =
 		v4l2_ctrl_new_std_menu(handler,
 				       &allegro_ctrl_ops,
-				       V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
-				       V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1, 0x0,
-				       V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1);
+				       V4L2_CID_CODEC_VIDEO_HEVC_LEVEL,
+				       V4L2_CODEC_VIDEO_HEVC_LEVEL_5_1, 0x0,
+				       V4L2_CODEC_VIDEO_HEVC_LEVEL_5_1);
 	channel->mpeg_video_hevc_tier =
 		v4l2_ctrl_new_std_menu(handler,
 				       &allegro_ctrl_ops,
-				       V4L2_CID_MPEG_VIDEO_HEVC_TIER,
-				       V4L2_MPEG_VIDEO_HEVC_TIER_HIGH, 0x0,
-				       V4L2_MPEG_VIDEO_HEVC_TIER_MAIN);
+				       V4L2_CID_CODEC_VIDEO_HEVC_TIER,
+				       V4L2_CODEC_VIDEO_HEVC_TIER_HIGH, 0x0,
+				       V4L2_CODEC_VIDEO_HEVC_TIER_MAIN);
 	channel->mpeg_video_hevc_i_frame_qp =
 		v4l2_ctrl_new_std(handler,
 				  &allegro_ctrl_ops,
-				  V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP,
+				  V4L2_CID_CODEC_VIDEO_HEVC_I_FRAME_QP,
 				  0, 51, 1, 30);
 	channel->mpeg_video_hevc_max_qp =
 		v4l2_ctrl_new_std(handler,
 				  &allegro_ctrl_ops,
-				  V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP,
+				  V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP,
 				  0, 51, 1, 51);
 	channel->mpeg_video_hevc_min_qp =
 		v4l2_ctrl_new_std(handler,
 				  &allegro_ctrl_ops,
-				  V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
+				  V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP,
 				  0, 51, 1, 0);
 	channel->mpeg_video_hevc_p_frame_qp =
 		v4l2_ctrl_new_std(handler,
 				  &allegro_ctrl_ops,
-				  V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP,
+				  V4L2_CID_CODEC_VIDEO_HEVC_P_FRAME_QP,
 				  0, 51, 1, 30);
 	channel->mpeg_video_hevc_b_frame_qp =
 		v4l2_ctrl_new_std(handler,
 				  &allegro_ctrl_ops,
-				  V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP,
+				  V4L2_CID_CODEC_VIDEO_HEVC_B_FRAME_QP,
 				  0, 51, 1, 30);
 
 	channel->mpeg_video_frame_rc_enable =
 		v4l2_ctrl_new_std(handler,
 				  &allegro_ctrl_ops,
-				  V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE,
+				  V4L2_CID_CODEC_VIDEO_FRAME_RC_ENABLE,
 				  false, 0x1,
 				  true, false);
 	channel->mpeg_video_bitrate_mode = v4l2_ctrl_new_std_menu(handler,
 			&allegro_ctrl_ops,
-			V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
-			V4L2_MPEG_VIDEO_BITRATE_MODE_CBR, 0,
-			V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
+			V4L2_CID_CODEC_VIDEO_BITRATE_MODE,
+			V4L2_CODEC_VIDEO_BITRATE_MODE_CBR, 0,
+			V4L2_CODEC_VIDEO_BITRATE_MODE_CBR);
 
 	if (channel->codec == V4L2_PIX_FMT_H264) {
-		bitrate_max = h264_maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
-		bitrate_def = h264_maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
-		cpb_size_max = h264_maximum_cpb_size(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
-		cpb_size_def = h264_maximum_cpb_size(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
+		bitrate_max = h264_maximum_bitrate(V4L2_CODEC_VIDEO_H264_LEVEL_5_1);
+		bitrate_def = h264_maximum_bitrate(V4L2_CODEC_VIDEO_H264_LEVEL_5_1);
+		cpb_size_max = h264_maximum_cpb_size(V4L2_CODEC_VIDEO_H264_LEVEL_5_1);
+		cpb_size_def = h264_maximum_cpb_size(V4L2_CODEC_VIDEO_H264_LEVEL_5_1);
 	} else {
-		bitrate_max = hevc_maximum_bitrate(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1);
-		bitrate_def = hevc_maximum_bitrate(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1);
-		cpb_size_max = hevc_maximum_cpb_size(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1);
-		cpb_size_def = hevc_maximum_cpb_size(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1);
+		bitrate_max = hevc_maximum_bitrate(V4L2_CODEC_VIDEO_HEVC_LEVEL_5_1);
+		bitrate_def = hevc_maximum_bitrate(V4L2_CODEC_VIDEO_HEVC_LEVEL_5_1);
+		cpb_size_max = hevc_maximum_cpb_size(V4L2_CODEC_VIDEO_HEVC_LEVEL_5_1);
+		cpb_size_def = hevc_maximum_cpb_size(V4L2_CODEC_VIDEO_HEVC_LEVEL_5_1);
 	}
 	channel->mpeg_video_bitrate = v4l2_ctrl_new_std(handler,
 			&allegro_ctrl_ops,
-			V4L2_CID_MPEG_VIDEO_BITRATE,
+			V4L2_CID_CODEC_VIDEO_BITRATE,
 			0, bitrate_max, 1, bitrate_def);
 	channel->mpeg_video_bitrate_peak = v4l2_ctrl_new_std(handler,
 			&allegro_ctrl_ops,
-			V4L2_CID_MPEG_VIDEO_BITRATE_PEAK,
+			V4L2_CID_CODEC_VIDEO_BITRATE_PEAK,
 			0, bitrate_max, 1, bitrate_def);
 	channel->mpeg_video_cpb_size = v4l2_ctrl_new_std(handler,
 			&allegro_ctrl_ops,
-			V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE,
+			V4L2_CID_CODEC_VIDEO_H264_CPB_SIZE,
 			0, cpb_size_max, 1, cpb_size_def);
 	channel->mpeg_video_gop_size = v4l2_ctrl_new_std(handler,
 			&allegro_ctrl_ops,
-			V4L2_CID_MPEG_VIDEO_GOP_SIZE,
+			V4L2_CID_CODEC_VIDEO_GOP_SIZE,
 			0, ALLEGRO_GOP_SIZE_MAX,
 			1, ALLEGRO_GOP_SIZE_DEFAULT);
 	v4l2_ctrl_new_std(handler,
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/media/platform/allegro-dvt/nal-h264.c
index 94dd9266d850..b6494994ae7f 100644
--- a/drivers/media/platform/allegro-dvt/nal-h264.c
+++ b/drivers/media/platform/allegro-dvt/nal-h264.c
@@ -36,23 +36,23 @@ enum nal_unit_type {
 
 /**
  * nal_h264_profile_from_v4l2() - Get profile_idc for v4l2 h264 profile
- * @profile: the profile as &enum v4l2_mpeg_video_h264_profile
+ * @profile: the profile as &enum v4l2_codec_video_h264_profile
  *
- * Convert the &enum v4l2_mpeg_video_h264_profile to profile_idc as specified
+ * Convert the &enum v4l2_codec_video_h264_profile to profile_idc as specified
  * in Rec. ITU-T H.264 (04/2017) A.2.
  *
  * Return: the profile_idc for the passed level
  */
-int nal_h264_profile_from_v4l2(enum v4l2_mpeg_video_h264_profile profile)
+int nal_h264_profile_from_v4l2(enum v4l2_codec_video_h264_profile profile)
 {
 	switch (profile) {
-	case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
+	case V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE:
 		return 66;
-	case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
+	case V4L2_CODEC_VIDEO_H264_PROFILE_MAIN:
 		return 77;
-	case V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED:
+	case V4L2_CODEC_VIDEO_H264_PROFILE_EXTENDED:
 		return 88;
-	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
+	case V4L2_CODEC_VIDEO_H264_PROFILE_HIGH:
 		return 100;
 	default:
 		return -EINVAL;
@@ -61,47 +61,47 @@ int nal_h264_profile_from_v4l2(enum v4l2_mpeg_video_h264_profile profile)
 
 /**
  * nal_h264_level_from_v4l2() - Get level_idc for v4l2 h264 level
- * @level: the level as &enum v4l2_mpeg_video_h264_level
+ * @level: the level as &enum v4l2_codec_video_h264_level
  *
- * Convert the &enum v4l2_mpeg_video_h264_level to level_idc as specified in
+ * Convert the &enum v4l2_codec_video_h264_level to level_idc as specified in
  * Rec. ITU-T H.264 (04/2017) A.3.2.
  *
  * Return: the level_idc for the passed level
  */
-int nal_h264_level_from_v4l2(enum v4l2_mpeg_video_h264_level level)
+int nal_h264_level_from_v4l2(enum v4l2_codec_video_h264_level level)
 {
 	switch (level) {
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_0:
 		return 10;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1B:
 		return 9;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_1:
 		return 11;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_2:
 		return 12;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_3:
 		return 13;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_2_0:
 		return 20;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_2_1:
 		return 21;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_2_2:
 		return 22;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_3_0:
 		return 30;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_3_1:
 		return 31;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_3_2:
 		return 32;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_4_0:
 		return 40;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_4_1:
 		return 41;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_4_2:
 		return 42;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_5_0:
 		return 50;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_5_1:
 		return 51;
 	default:
 		return -EINVAL;
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/media/platform/allegro-dvt/nal-h264.h
index 2ba7cbced7a5..bebee9bc6328 100644
--- a/drivers/media/platform/allegro-dvt/nal-h264.h
+++ b/drivers/media/platform/allegro-dvt/nal-h264.h
@@ -187,8 +187,8 @@ struct nal_h264_pps {
 	};
 };
 
-int nal_h264_profile_from_v4l2(enum v4l2_mpeg_video_h264_profile profile);
-int nal_h264_level_from_v4l2(enum v4l2_mpeg_video_h264_level level);
+int nal_h264_profile_from_v4l2(enum v4l2_codec_video_h264_profile profile);
+int nal_h264_level_from_v4l2(enum v4l2_codec_video_h264_level level);
 
 ssize_t nal_h264_write_sps(const struct device *dev,
 			   void *dest, size_t n, struct nal_h264_sps *sps);
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/nal-hevc.c
index 5db540c69bfe..73fc3db1c3b1 100644
--- a/drivers/media/platform/allegro-dvt/nal-hevc.c
+++ b/drivers/media/platform/allegro-dvt/nal-hevc.c
@@ -35,14 +35,14 @@ enum nal_unit_type {
 	FD_NUT = 38,
 };
 
-int nal_hevc_profile_from_v4l2(enum v4l2_mpeg_video_hevc_profile profile)
+int nal_hevc_profile_from_v4l2(enum v4l2_codec_video_hevc_profile profile)
 {
 	switch (profile) {
-	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN:
+	case V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN:
 		return 1;
-	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10:
+	case V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN_10:
 		return 2;
-	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE:
+	case V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE:
 		return 3;
 	default:
 		return -EINVAL;
@@ -50,12 +50,12 @@ int nal_hevc_profile_from_v4l2(enum v4l2_mpeg_video_hevc_profile profile)
 }
 EXPORT_SYMBOL_GPL(nal_hevc_profile_from_v4l2);
 
-int nal_hevc_tier_from_v4l2(enum v4l2_mpeg_video_hevc_tier tier)
+int nal_hevc_tier_from_v4l2(enum v4l2_codec_video_hevc_tier tier)
 {
 	switch (tier) {
-	case V4L2_MPEG_VIDEO_HEVC_TIER_MAIN:
+	case V4L2_CODEC_VIDEO_HEVC_TIER_MAIN:
 		return 0;
-	case V4L2_MPEG_VIDEO_HEVC_TIER_HIGH:
+	case V4L2_CODEC_VIDEO_HEVC_TIER_HIGH:
 		return 1;
 	default:
 		return -EINVAL;
@@ -63,7 +63,7 @@ int nal_hevc_tier_from_v4l2(enum v4l2_mpeg_video_hevc_tier tier)
 }
 EXPORT_SYMBOL_GPL(nal_hevc_tier_from_v4l2);
 
-int nal_hevc_level_from_v4l2(enum v4l2_mpeg_video_hevc_level level)
+int nal_hevc_level_from_v4l2(enum v4l2_codec_video_hevc_level level)
 {
 	/*
 	 * T-Rec-H.265 p. 280: general_level_idc and sub_layer_level_idc[ i ]
@@ -73,31 +73,31 @@ int nal_hevc_level_from_v4l2(enum v4l2_mpeg_video_hevc_level level)
 	int factor = 30 / 10;
 
 	switch (level) {
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_1:
 		return factor * 10;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_2:
 		return factor * 20;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_2_1:
 		return factor * 21;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_3:
 		return factor * 30;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_3_1:
 		return factor * 31;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_4:
 		return factor * 40;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_4_1:
 		return factor * 41;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_5:
 		return factor * 50;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_5_1:
 		return factor * 51;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_5_2:
 		return factor * 52;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_6:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_6:
 		return factor * 60;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_6_1:
 		return factor * 61;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2:
+	case V4L2_CODEC_VIDEO_HEVC_LEVEL_6_2:
 		return factor * 62;
 	default:
 		return -EINVAL;
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/nal-hevc.h
index fc994d4242d8..16d9e7931de1 100644
--- a/drivers/media/platform/allegro-dvt/nal-hevc.h
+++ b/drivers/media/platform/allegro-dvt/nal-hevc.h
@@ -318,9 +318,9 @@ struct nal_hevc_pps {
 	};
 };
 
-int nal_hevc_profile_from_v4l2(enum v4l2_mpeg_video_hevc_profile profile);
-int nal_hevc_tier_from_v4l2(enum v4l2_mpeg_video_hevc_tier tier);
-int nal_hevc_level_from_v4l2(enum v4l2_mpeg_video_hevc_level level);
+int nal_hevc_profile_from_v4l2(enum v4l2_codec_video_hevc_profile profile);
+int nal_hevc_tier_from_v4l2(enum v4l2_codec_video_hevc_tier tier);
+int nal_hevc_level_from_v4l2(enum v4l2_codec_video_hevc_level level);
 
 int nal_range_from_v4l2(enum v4l2_quantization quantization);
 int nal_color_primaries_from_v4l2(enum v4l2_colorspace colorspace);
diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index 2f42808c43a4..30bd468f7f95 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -680,14 +680,14 @@ static u32 coda_slice_mode(struct coda_ctx *ctx)
 	int size, unit;
 
 	switch (ctx->params.slice_mode) {
-	case V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE:
+	case V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_SINGLE:
 	default:
 		return 0;
-	case V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB:
+	case V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_MAX_MB:
 		size = ctx->params.slice_max_mb;
 		unit = 1;
 		break;
-	case V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES:
+	case V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_MAX_BYTES:
 		size = ctx->params.slice_max_bits;
 		unit = 0;
 		break;
@@ -1834,7 +1834,7 @@ static bool coda_reorder_enable(struct coda_ctx *ctx)
 			  ctx->params.h264_profile_idc);
 
 	/* Baseline profile does not support reordering */
-	return profile > V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE;
+	return profile > V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE;
 }
 
 static void coda_decoder_drop_used_metas(struct coda_ctx *ctx)
diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 995e95272e51..a6e41ebdf168 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1791,8 +1791,8 @@ void coda_update_profile_level_ctrls(struct coda_ctx *ctx, u8 profile_idc,
 	switch (ctx->codec->src_fourcc) {
 	case V4L2_PIX_FMT_H264:
 		codec_name = "H264";
-		profile_cid = V4L2_CID_MPEG_VIDEO_H264_PROFILE;
-		level_cid = V4L2_CID_MPEG_VIDEO_H264_LEVEL;
+		profile_cid = V4L2_CID_CODEC_VIDEO_H264_PROFILE;
+		level_cid = V4L2_CID_CODEC_VIDEO_H264_LEVEL;
 		profile_ctrl = ctx->h264_profile_ctrl;
 		level_ctrl = ctx->h264_level_ctrl;
 		profile = coda_h264_profile(profile_idc);
@@ -1800,8 +1800,8 @@ void coda_update_profile_level_ctrls(struct coda_ctx *ctx, u8 profile_idc,
 		break;
 	case V4L2_PIX_FMT_MPEG2:
 		codec_name = "MPEG-2";
-		profile_cid = V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE;
-		level_cid = V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL;
+		profile_cid = V4L2_CID_CODEC_VIDEO_MPEG2_PROFILE;
+		level_cid = V4L2_CID_CODEC_VIDEO_MPEG2_LEVEL;
 		profile_ctrl = ctx->mpeg2_profile_ctrl;
 		level_ctrl = ctx->mpeg2_level_ctrl;
 		profile = coda_mpeg2_profile(profile_idc);
@@ -1809,8 +1809,8 @@ void coda_update_profile_level_ctrls(struct coda_ctx *ctx, u8 profile_idc,
 		break;
 	case V4L2_PIX_FMT_MPEG4:
 		codec_name = "MPEG-4";
-		profile_cid = V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE;
-		level_cid = V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL;
+		profile_cid = V4L2_CID_CODEC_VIDEO_MPEG4_PROFILE;
+		level_cid = V4L2_CID_CODEC_VIDEO_MPEG4_LEVEL;
 		profile_ctrl = ctx->mpeg4_profile_ctrl;
 		level_ctrl = ctx->mpeg4_level_ctrl;
 		profile = coda_mpeg4_profile(profile_idc);
@@ -2189,86 +2189,86 @@ static int coda_s_ctrl(struct v4l2_ctrl *ctrl)
 		else
 			ctx->params.rot_mode &= ~CODA_MIR_VER;
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE:
 		ctx->params.bitrate = ctrl->val / 1000;
 		ctx->params.bitrate_changed = true;
 		break;
-	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
+	case V4L2_CID_CODEC_VIDEO_GOP_SIZE:
 		ctx->params.gop_size = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_I_FRAME_QP:
 		ctx->params.h264_intra_qp = ctrl->val;
 		ctx->params.h264_intra_qp_changed = true;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_P_FRAME_QP:
 		ctx->params.h264_inter_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_MIN_QP:
 		ctx->params.h264_min_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_MAX_QP:
 		ctx->params.h264_max_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA:
+	case V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_ALPHA:
 		ctx->params.h264_slice_alpha_c0_offset_div2 = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA:
+	case V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_BETA:
 		ctx->params.h264_slice_beta_offset_div2 = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:
+	case V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_MODE:
 		ctx->params.h264_disable_deblocking_filter_idc = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION:
+	case V4L2_CID_CODEC_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION:
 		ctx->params.h264_constrained_intra_pred_flag = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
+	case V4L2_CID_CODEC_VIDEO_FRAME_RC_ENABLE:
 		ctx->params.frame_rc_enable = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
+	case V4L2_CID_CODEC_VIDEO_MB_RC_ENABLE:
 		ctx->params.mb_rc_enable = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_CHROMA_QP_INDEX_OFFSET:
+	case V4L2_CID_CODEC_VIDEO_H264_CHROMA_QP_INDEX_OFFSET:
 		ctx->params.h264_chroma_qp_index_offset = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_H264_PROFILE:
 		/* TODO: switch between baseline and constrained baseline */
 		if (ctx->inst_type == CODA_INST_ENCODER)
 			ctx->params.h264_profile_idc = 66;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_H264_LEVEL:
 		/* nothing to do, this is set by the encoder */
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_I_FRAME_QP:
 		ctx->params.mpeg4_intra_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_P_FRAME_QP:
 		ctx->params.mpeg4_inter_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
-	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
-	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:
-	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_MPEG2_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_MPEG2_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_LEVEL:
 		/* nothing to do, these are fixed */
 		break;
-	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
+	case V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MODE:
 		ctx->params.slice_mode = ctrl->val;
 		ctx->params.slice_mode_changed = true;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
+	case V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MAX_MB:
 		ctx->params.slice_max_mb = ctrl->val;
 		ctx->params.slice_mode_changed = true;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:
+	case V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MAX_BYTES:
 		ctx->params.slice_max_bits = ctrl->val * 8;
 		ctx->params.slice_mode_changed = true;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
+	case V4L2_CID_CODEC_VIDEO_HEADER_MODE:
 		break;
-	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:
+	case V4L2_CID_CODEC_VIDEO_CYCLIC_INTRA_REFRESH_MB:
 		ctx->params.intra_refresh = ctrl->val;
 		ctx->params.intra_refresh_changed = true;
 		break;
-	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
+	case V4L2_CID_CODEC_VIDEO_FORCE_KEY_FRAME:
 		ctx->params.force_ipicture = true;
 		break;
 	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
@@ -2277,10 +2277,10 @@ static int coda_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_JPEG_RESTART_INTERVAL:
 		ctx->params.jpeg_restart_interval = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VBV_DELAY:
+	case V4L2_CID_CODEC_VIDEO_VBV_DELAY:
 		ctx->params.vbv_delay = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VBV_SIZE:
+	case V4L2_CID_CODEC_VIDEO_VBV_SIZE:
 		ctx->params.vbv_size = min(ctrl->val * 8192, 0x7fffffff);
 		break;
 	default:
@@ -2301,103 +2301,103 @@ static void coda_encode_ctrls(struct coda_ctx *ctx)
 	int max_gop_size = (ctx->dev->devtype->product == CODA_DX6) ? 60 : 99;
 
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_BITRATE, 0, 32767000, 1000, 0);
+		V4L2_CID_CODEC_VIDEO_BITRATE, 0, 32767000, 1000, 0);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_GOP_SIZE, 0, max_gop_size, 1, 16);
+		V4L2_CID_CODEC_VIDEO_GOP_SIZE, 0, max_gop_size, 1, 16);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP, 0, 51, 1, 25);
+		V4L2_CID_CODEC_VIDEO_H264_I_FRAME_QP, 0, 51, 1, 25);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP, 0, 51, 1, 25);
+		V4L2_CID_CODEC_VIDEO_H264_P_FRAME_QP, 0, 51, 1, 25);
 	if (ctx->dev->devtype->product != CODA_960) {
 		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-			V4L2_CID_MPEG_VIDEO_H264_MIN_QP, 0, 51, 1, 12);
+			V4L2_CID_CODEC_VIDEO_H264_MIN_QP, 0, 51, 1, 12);
 	}
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_MAX_QP, 0, 51, 1, 51);
+		V4L2_CID_CODEC_VIDEO_H264_MAX_QP, 0, 51, 1, 51);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA, -6, 6, 1, 0);
+		V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_ALPHA, -6, 6, 1, 0);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA, -6, 6, 1, 0);
+		V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_BETA, -6, 6, 1, 0);
 	v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE,
-		V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
-		0x0, V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED);
+		V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_MODE,
+		V4L2_CODEC_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
+		0x0, V4L2_CODEC_VIDEO_H264_LOOP_FILTER_MODE_ENABLED);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION, 0, 1, 1,
+		V4L2_CID_CODEC_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION, 0, 1, 1,
 		0);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE, 0, 1, 1, 1);
+		V4L2_CID_CODEC_VIDEO_FRAME_RC_ENABLE, 0, 1, 1, 1);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE, 0, 1, 1, 1);
+		V4L2_CID_CODEC_VIDEO_MB_RC_ENABLE, 0, 1, 1, 1);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_CHROMA_QP_INDEX_OFFSET, -12, 12, 1, 0);
+		V4L2_CID_CODEC_VIDEO_H264_CHROMA_QP_INDEX_OFFSET, -12, 12, 1, 0);
 	v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_PROFILE,
-		V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE, 0x0,
-		V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE);
+		V4L2_CID_CODEC_VIDEO_H264_PROFILE,
+		V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE, 0x0,
+		V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE);
 	if (ctx->dev->devtype->product == CODA_HX4 ||
 	    ctx->dev->devtype->product == CODA_7541) {
 		v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
-			V4L2_CID_MPEG_VIDEO_H264_LEVEL,
-			V4L2_MPEG_VIDEO_H264_LEVEL_3_1,
-			~((1 << V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
-			  (1 << V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
-			  (1 << V4L2_MPEG_VIDEO_H264_LEVEL_3_1)),
-			V4L2_MPEG_VIDEO_H264_LEVEL_3_1);
+			V4L2_CID_CODEC_VIDEO_H264_LEVEL,
+			V4L2_CODEC_VIDEO_H264_LEVEL_3_1,
+			~((1 << V4L2_CODEC_VIDEO_H264_LEVEL_2_0) |
+			  (1 << V4L2_CODEC_VIDEO_H264_LEVEL_3_0) |
+			  (1 << V4L2_CODEC_VIDEO_H264_LEVEL_3_1)),
+			V4L2_CODEC_VIDEO_H264_LEVEL_3_1);
 	}
 	if (ctx->dev->devtype->product == CODA_960) {
 		v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
-			V4L2_CID_MPEG_VIDEO_H264_LEVEL,
-			V4L2_MPEG_VIDEO_H264_LEVEL_4_0,
-			~((1 << V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
-			  (1 << V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
-			  (1 << V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
-			  (1 << V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
-			  (1 << V4L2_MPEG_VIDEO_H264_LEVEL_4_0)),
-			V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
+			V4L2_CID_CODEC_VIDEO_H264_LEVEL,
+			V4L2_CODEC_VIDEO_H264_LEVEL_4_0,
+			~((1 << V4L2_CODEC_VIDEO_H264_LEVEL_2_0) |
+			  (1 << V4L2_CODEC_VIDEO_H264_LEVEL_3_0) |
+			  (1 << V4L2_CODEC_VIDEO_H264_LEVEL_3_1) |
+			  (1 << V4L2_CODEC_VIDEO_H264_LEVEL_3_2) |
+			  (1 << V4L2_CODEC_VIDEO_H264_LEVEL_4_0)),
+			V4L2_CODEC_VIDEO_H264_LEVEL_4_0);
 	}
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP, 1, 31, 1, 2);
+		V4L2_CID_CODEC_VIDEO_MPEG4_I_FRAME_QP, 1, 31, 1, 2);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP, 1, 31, 1, 2);
+		V4L2_CID_CODEC_VIDEO_MPEG4_P_FRAME_QP, 1, 31, 1, 2);
 	v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE,
-		V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE, 0x0,
-		V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE);
+		V4L2_CID_CODEC_VIDEO_MPEG4_PROFILE,
+		V4L2_CODEC_VIDEO_MPEG4_PROFILE_SIMPLE, 0x0,
+		V4L2_CODEC_VIDEO_MPEG4_PROFILE_SIMPLE);
 	if (ctx->dev->devtype->product == CODA_HX4 ||
 	    ctx->dev->devtype->product == CODA_7541 ||
 	    ctx->dev->devtype->product == CODA_960) {
 		v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
-			V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL,
-			V4L2_MPEG_VIDEO_MPEG4_LEVEL_5,
-			~(1 << V4L2_MPEG_VIDEO_MPEG4_LEVEL_5),
-			V4L2_MPEG_VIDEO_MPEG4_LEVEL_5);
+			V4L2_CID_CODEC_VIDEO_MPEG4_LEVEL,
+			V4L2_CODEC_VIDEO_MPEG4_LEVEL_5,
+			~(1 << V4L2_CODEC_VIDEO_MPEG4_LEVEL_5),
+			V4L2_CODEC_VIDEO_MPEG4_LEVEL_5);
 	}
 	v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE,
-		V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES, 0x0,
-		V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE);
+		V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MODE,
+		V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_MAX_BYTES, 0x0,
+		V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_SINGLE);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB, 1, 0x3fffffff, 1, 1);
+		V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MAX_MB, 1, 0x3fffffff, 1, 1);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES, 1, 0x3fffffff, 1,
+		V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MAX_BYTES, 1, 0x3fffffff, 1,
 		500);
 	v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_HEADER_MODE,
-		V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
-		(1 << V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE),
-		V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME);
+		V4L2_CID_CODEC_VIDEO_HEADER_MODE,
+		V4L2_CODEC_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		(1 << V4L2_CODEC_VIDEO_HEADER_MODE_SEPARATE),
+		V4L2_CODEC_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB, 0,
+		V4L2_CID_CODEC_VIDEO_CYCLIC_INTRA_REFRESH_MB, 0,
 		1920 * 1088 / 256, 1, 0);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_VBV_DELAY, 0, 0x7fff, 1, 0);
+		V4L2_CID_CODEC_VIDEO_VBV_DELAY, 0, 0x7fff, 1, 0);
 	/*
 	 * The maximum VBV size value is 0x7fffffff bits,
 	 * one bit less than 262144 KiB
 	 */
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_VBV_SIZE, 0, 262144, 1, 0);
+		V4L2_CID_CODEC_VIDEO_VBV_SIZE, 0, 262144, 1, 0);
 }
 
 static void coda_jpeg_encode_ctrls(struct coda_ctx *ctx)
@@ -2413,52 +2413,52 @@ static void coda_decode_ctrls(struct coda_ctx *ctx)
 	u8 max;
 
 	ctx->h264_profile_ctrl = v4l2_ctrl_new_std_menu(&ctx->ctrls,
-		&coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
-		V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
-		~((1 << V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
-		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
-		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)),
-		V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
+		&coda_ctrl_ops, V4L2_CID_CODEC_VIDEO_H264_PROFILE,
+		V4L2_CODEC_VIDEO_H264_PROFILE_HIGH,
+		~((1 << V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE) |
+		  (1 << V4L2_CODEC_VIDEO_H264_PROFILE_MAIN) |
+		  (1 << V4L2_CODEC_VIDEO_H264_PROFILE_HIGH)),
+		V4L2_CODEC_VIDEO_H264_PROFILE_HIGH);
 	if (ctx->h264_profile_ctrl)
 		ctx->h264_profile_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	if (ctx->dev->devtype->product == CODA_HX4 ||
 	    ctx->dev->devtype->product == CODA_7541)
-		max = V4L2_MPEG_VIDEO_H264_LEVEL_4_0;
+		max = V4L2_CODEC_VIDEO_H264_LEVEL_4_0;
 	else if (ctx->dev->devtype->product == CODA_960)
-		max = V4L2_MPEG_VIDEO_H264_LEVEL_4_1;
+		max = V4L2_CODEC_VIDEO_H264_LEVEL_4_1;
 	else
 		return;
 	ctx->h264_level_ctrl = v4l2_ctrl_new_std_menu(&ctx->ctrls,
-		&coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_H264_LEVEL, max, 0, max);
+		&coda_ctrl_ops, V4L2_CID_CODEC_VIDEO_H264_LEVEL, max, 0, max);
 	if (ctx->h264_level_ctrl)
 		ctx->h264_level_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	ctx->mpeg2_profile_ctrl = v4l2_ctrl_new_std_menu(&ctx->ctrls,
-		&coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE,
-		V4L2_MPEG_VIDEO_MPEG2_PROFILE_HIGH, 0,
-		V4L2_MPEG_VIDEO_MPEG2_PROFILE_HIGH);
+		&coda_ctrl_ops, V4L2_CID_CODEC_VIDEO_MPEG2_PROFILE,
+		V4L2_CODEC_VIDEO_MPEG2_PROFILE_HIGH, 0,
+		V4L2_CODEC_VIDEO_MPEG2_PROFILE_HIGH);
 	if (ctx->mpeg2_profile_ctrl)
 		ctx->mpeg2_profile_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	ctx->mpeg2_level_ctrl = v4l2_ctrl_new_std_menu(&ctx->ctrls,
-		&coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL,
-		V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH, 0,
-		V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH);
+		&coda_ctrl_ops, V4L2_CID_CODEC_VIDEO_MPEG2_LEVEL,
+		V4L2_CODEC_VIDEO_MPEG2_LEVEL_HIGH, 0,
+		V4L2_CODEC_VIDEO_MPEG2_LEVEL_HIGH);
 	if (ctx->mpeg2_level_ctrl)
 		ctx->mpeg2_level_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	ctx->mpeg4_profile_ctrl = v4l2_ctrl_new_std_menu(&ctx->ctrls,
-		&coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE,
-		V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY, 0,
-		V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY);
+		&coda_ctrl_ops, V4L2_CID_CODEC_VIDEO_MPEG4_PROFILE,
+		V4L2_CODEC_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY, 0,
+		V4L2_CODEC_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY);
 	if (ctx->mpeg4_profile_ctrl)
 		ctx->mpeg4_profile_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	ctx->mpeg4_level_ctrl = v4l2_ctrl_new_std_menu(&ctx->ctrls,
-		&coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL,
-		V4L2_MPEG_VIDEO_MPEG4_LEVEL_5, 0,
-		V4L2_MPEG_VIDEO_MPEG4_LEVEL_5);
+		&coda_ctrl_ops, V4L2_CID_CODEC_VIDEO_MPEG4_LEVEL,
+		V4L2_CODEC_VIDEO_MPEG4_LEVEL_5, 0,
+		V4L2_CODEC_VIDEO_MPEG4_LEVEL_5);
 	if (ctx->mpeg4_level_ctrl)
 		ctx->mpeg4_level_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 }
diff --git a/drivers/media/platform/coda/coda-h264.c b/drivers/media/platform/coda/coda-h264.c
index 8bd0aa8af114..852307f30c80 100644
--- a/drivers/media/platform/coda/coda-h264.c
+++ b/drivers/media/platform/coda/coda-h264.c
@@ -81,10 +81,10 @@ int coda_h264_padding(int size, char *p)
 int coda_h264_profile(int profile_idc)
 {
 	switch (profile_idc) {
-	case 66: return V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE;
-	case 77: return V4L2_MPEG_VIDEO_H264_PROFILE_MAIN;
-	case 88: return V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED;
-	case 100: return V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
+	case 66: return V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE;
+	case 77: return V4L2_CODEC_VIDEO_H264_PROFILE_MAIN;
+	case 88: return V4L2_CODEC_VIDEO_H264_PROFILE_EXTENDED;
+	case 100: return V4L2_CODEC_VIDEO_H264_PROFILE_HIGH;
 	default: return -EINVAL;
 	}
 }
@@ -92,22 +92,22 @@ int coda_h264_profile(int profile_idc)
 int coda_h264_level(int level_idc)
 {
 	switch (level_idc) {
-	case 10: return V4L2_MPEG_VIDEO_H264_LEVEL_1_0;
-	case 9:  return V4L2_MPEG_VIDEO_H264_LEVEL_1B;
-	case 11: return V4L2_MPEG_VIDEO_H264_LEVEL_1_1;
-	case 12: return V4L2_MPEG_VIDEO_H264_LEVEL_1_2;
-	case 13: return V4L2_MPEG_VIDEO_H264_LEVEL_1_3;
-	case 20: return V4L2_MPEG_VIDEO_H264_LEVEL_2_0;
-	case 21: return V4L2_MPEG_VIDEO_H264_LEVEL_2_1;
-	case 22: return V4L2_MPEG_VIDEO_H264_LEVEL_2_2;
-	case 30: return V4L2_MPEG_VIDEO_H264_LEVEL_3_0;
-	case 31: return V4L2_MPEG_VIDEO_H264_LEVEL_3_1;
-	case 32: return V4L2_MPEG_VIDEO_H264_LEVEL_3_2;
-	case 40: return V4L2_MPEG_VIDEO_H264_LEVEL_4_0;
-	case 41: return V4L2_MPEG_VIDEO_H264_LEVEL_4_1;
-	case 42: return V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
-	case 50: return V4L2_MPEG_VIDEO_H264_LEVEL_5_0;
-	case 51: return V4L2_MPEG_VIDEO_H264_LEVEL_5_1;
+	case 10: return V4L2_CODEC_VIDEO_H264_LEVEL_1_0;
+	case 9:  return V4L2_CODEC_VIDEO_H264_LEVEL_1B;
+	case 11: return V4L2_CODEC_VIDEO_H264_LEVEL_1_1;
+	case 12: return V4L2_CODEC_VIDEO_H264_LEVEL_1_2;
+	case 13: return V4L2_CODEC_VIDEO_H264_LEVEL_1_3;
+	case 20: return V4L2_CODEC_VIDEO_H264_LEVEL_2_0;
+	case 21: return V4L2_CODEC_VIDEO_H264_LEVEL_2_1;
+	case 22: return V4L2_CODEC_VIDEO_H264_LEVEL_2_2;
+	case 30: return V4L2_CODEC_VIDEO_H264_LEVEL_3_0;
+	case 31: return V4L2_CODEC_VIDEO_H264_LEVEL_3_1;
+	case 32: return V4L2_CODEC_VIDEO_H264_LEVEL_3_2;
+	case 40: return V4L2_CODEC_VIDEO_H264_LEVEL_4_0;
+	case 41: return V4L2_CODEC_VIDEO_H264_LEVEL_4_1;
+	case 42: return V4L2_CODEC_VIDEO_H264_LEVEL_4_2;
+	case 50: return V4L2_CODEC_VIDEO_H264_LEVEL_5_0;
+	case 51: return V4L2_CODEC_VIDEO_H264_LEVEL_5_1;
 	default: return -EINVAL;
 	}
 }
diff --git a/drivers/media/platform/coda/coda-mpeg2.c b/drivers/media/platform/coda/coda-mpeg2.c
index 6f3f6721d286..277614f68f4b 100644
--- a/drivers/media/platform/coda/coda-mpeg2.c
+++ b/drivers/media/platform/coda/coda-mpeg2.c
@@ -13,15 +13,15 @@ int coda_mpeg2_profile(int profile_idc)
 {
 	switch (profile_idc) {
 	case 5:
-		return V4L2_MPEG_VIDEO_MPEG2_PROFILE_SIMPLE;
+		return V4L2_CODEC_VIDEO_MPEG2_PROFILE_SIMPLE;
 	case 4:
-		return V4L2_MPEG_VIDEO_MPEG2_PROFILE_MAIN;
+		return V4L2_CODEC_VIDEO_MPEG2_PROFILE_MAIN;
 	case 3:
-		return V4L2_MPEG_VIDEO_MPEG2_PROFILE_SNR_SCALABLE;
+		return V4L2_CODEC_VIDEO_MPEG2_PROFILE_SNR_SCALABLE;
 	case 2:
-		return V4L2_MPEG_VIDEO_MPEG2_PROFILE_SPATIALLY_SCALABLE;
+		return V4L2_CODEC_VIDEO_MPEG2_PROFILE_SPATIALLY_SCALABLE;
 	case 1:
-		return V4L2_MPEG_VIDEO_MPEG2_PROFILE_HIGH;
+		return V4L2_CODEC_VIDEO_MPEG2_PROFILE_HIGH;
 	default:
 		return -EINVAL;
 	}
@@ -31,13 +31,13 @@ int coda_mpeg2_level(int level_idc)
 {
 	switch (level_idc) {
 	case 10:
-		return V4L2_MPEG_VIDEO_MPEG2_LEVEL_LOW;
+		return V4L2_CODEC_VIDEO_MPEG2_LEVEL_LOW;
 	case 8:
-		return V4L2_MPEG_VIDEO_MPEG2_LEVEL_MAIN;
+		return V4L2_CODEC_VIDEO_MPEG2_LEVEL_MAIN;
 	case 6:
-		return V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH_1440;
+		return V4L2_CODEC_VIDEO_MPEG2_LEVEL_HIGH_1440;
 	case 4:
-		return V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH;
+		return V4L2_CODEC_VIDEO_MPEG2_LEVEL_HIGH;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/coda/coda-mpeg4.c b/drivers/media/platform/coda/coda-mpeg4.c
index 483a4fba1b4f..159eff42026e 100644
--- a/drivers/media/platform/coda/coda-mpeg4.c
+++ b/drivers/media/platform/coda/coda-mpeg4.c
@@ -14,15 +14,15 @@ int coda_mpeg4_profile(int profile_idc)
 {
 	switch (profile_idc) {
 	case 0:
-		return V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE;
+		return V4L2_CODEC_VIDEO_MPEG4_PROFILE_SIMPLE;
 	case 15:
-		return V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE;
+		return V4L2_CODEC_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE;
 	case 2:
-		return V4L2_MPEG_VIDEO_MPEG4_PROFILE_CORE;
+		return V4L2_CODEC_VIDEO_MPEG4_PROFILE_CORE;
 	case 1:
-		return V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE_SCALABLE;
+		return V4L2_CODEC_VIDEO_MPEG4_PROFILE_SIMPLE_SCALABLE;
 	case 11:
-		return V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY;
+		return V4L2_CODEC_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY;
 	default:
 		return -EINVAL;
 	}
@@ -32,17 +32,17 @@ int coda_mpeg4_level(int level_idc)
 {
 	switch (level_idc) {
 	case 0:
-		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_0;
+		return V4L2_CODEC_VIDEO_MPEG4_LEVEL_0;
 	case 1:
-		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_1;
+		return V4L2_CODEC_VIDEO_MPEG4_LEVEL_1;
 	case 2:
-		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_2;
+		return V4L2_CODEC_VIDEO_MPEG4_LEVEL_2;
 	case 3:
-		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_3;
+		return V4L2_CODEC_VIDEO_MPEG4_LEVEL_3;
 	case 4:
-		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_4;
+		return V4L2_CODEC_VIDEO_MPEG4_LEVEL_4;
 	case 5:
-		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_5;
+		return V4L2_CODEC_VIDEO_MPEG4_LEVEL_5;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/coda/coda.h
index dcf35641c603..125b5f126e6c 100644
--- a/drivers/media/platform/coda/coda.h
+++ b/drivers/media/platform/coda/coda.h
@@ -143,7 +143,7 @@ struct coda_params {
 	struct coda_huff_tab	*jpeg_huff_tab;
 	int			codec_mode;
 	int			codec_mode_aux;
-	enum v4l2_mpeg_video_multi_slice_mode slice_mode;
+	enum v4l2_codec_video_multi_slice_mode slice_mode;
 	u32			framerate;
 	u16			bitrate;
 	u16			vbv_delay;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 56d86e59421e..967dfba10af4 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -1418,9 +1418,9 @@ int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 	ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
 	v4l2_ctrl_new_std_menu(&ctx->ctrl_hdl,
 				&mtk_vcodec_dec_ctrl_ops,
-				V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
-				V4L2_MPEG_VIDEO_VP9_PROFILE_0,
-				0, V4L2_MPEG_VIDEO_VP9_PROFILE_0);
+				V4L2_CID_CODEC_VIDEO_VP9_PROFILE,
+				V4L2_CODEC_VIDEO_VP9_PROFILE_0,
+				0, V4L2_CODEC_VIDEO_VP9_PROFILE_0);
 
 	if (ctx->ctrl_hdl.error) {
 		mtk_v4l2_err("Adding control failed %d",
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 8c917969c2f1..eb2d3ff6aa07 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -43,61 +43,61 @@ static int vidioc_venc_s_ctrl(struct v4l2_ctrl *ctrl)
 	int ret = 0;
 
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_VIDEO_BITRATE:
-		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_BITRATE val = %d",
+	case V4L2_CID_CODEC_VIDEO_BITRATE:
+		mtk_v4l2_debug(2, "V4L2_CID_CODEC_VIDEO_BITRATE val = %d",
 			       ctrl->val);
 		p->bitrate = ctrl->val;
 		ctx->param_change |= MTK_ENCODE_PARAM_BITRATE;
 		break;
-	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
-		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_B_FRAMES val = %d",
+	case V4L2_CID_CODEC_VIDEO_B_FRAMES:
+		mtk_v4l2_debug(2, "V4L2_CID_CODEC_VIDEO_B_FRAMES val = %d",
 			       ctrl->val);
 		p->num_b_frame = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
-		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE val = %d",
+	case V4L2_CID_CODEC_VIDEO_FRAME_RC_ENABLE:
+		mtk_v4l2_debug(2, "V4L2_CID_CODEC_VIDEO_FRAME_RC_ENABLE val = %d",
 			       ctrl->val);
 		p->rc_frame = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
-		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_H264_MAX_QP val = %d",
+	case V4L2_CID_CODEC_VIDEO_H264_MAX_QP:
+		mtk_v4l2_debug(2, "V4L2_CID_CODEC_VIDEO_H264_MAX_QP val = %d",
 			       ctrl->val);
 		p->h264_max_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
-		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_HEADER_MODE val = %d",
+	case V4L2_CID_CODEC_VIDEO_HEADER_MODE:
+		mtk_v4l2_debug(2, "V4L2_CID_CODEC_VIDEO_HEADER_MODE val = %d",
 			       ctrl->val);
 		p->seq_hdr_mode = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
-		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE val = %d",
+	case V4L2_CID_CODEC_VIDEO_MB_RC_ENABLE:
+		mtk_v4l2_debug(2, "V4L2_CID_CODEC_VIDEO_MB_RC_ENABLE val = %d",
 			       ctrl->val);
 		p->rc_mb = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
-		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_H264_PROFILE val = %d",
+	case V4L2_CID_CODEC_VIDEO_H264_PROFILE:
+		mtk_v4l2_debug(2, "V4L2_CID_CODEC_VIDEO_H264_PROFILE val = %d",
 			       ctrl->val);
 		p->h264_profile = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
-		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_H264_LEVEL val = %d",
+	case V4L2_CID_CODEC_VIDEO_H264_LEVEL:
+		mtk_v4l2_debug(2, "V4L2_CID_CODEC_VIDEO_H264_LEVEL val = %d",
 			       ctrl->val);
 		p->h264_level = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_I_PERIOD:
-		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_H264_I_PERIOD val = %d",
+	case V4L2_CID_CODEC_VIDEO_H264_I_PERIOD:
+		mtk_v4l2_debug(2, "V4L2_CID_CODEC_VIDEO_H264_I_PERIOD val = %d",
 			       ctrl->val);
 		p->intra_period = ctrl->val;
 		ctx->param_change |= MTK_ENCODE_PARAM_INTRA_PERIOD;
 		break;
-	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
-		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_GOP_SIZE val = %d",
+	case V4L2_CID_CODEC_VIDEO_GOP_SIZE:
+		mtk_v4l2_debug(2, "V4L2_CID_CODEC_VIDEO_GOP_SIZE val = %d",
 			       ctrl->val);
 		p->gop_size = ctrl->val;
 		ctx->param_change |= MTK_ENCODE_PARAM_GOP_SIZE;
 		break;
-	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
-		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME");
+	case V4L2_CID_CODEC_VIDEO_FORCE_KEY_FRAME:
+		mtk_v4l2_debug(2, "V4L2_CID_CODEC_VIDEO_FORCE_KEY_FRAME");
 		p->force_intra = 1;
 		ctx->param_change |= MTK_ENCODE_PARAM_FORCE_INTRA;
 		break;
@@ -810,7 +810,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	if ((ctx->q_data[MTK_Q_DATA_DST].fmt->fourcc == V4L2_PIX_FMT_H264) &&
 	    (ctx->enc_params.seq_hdr_mode !=
-				V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)) {
+				V4L2_CODEC_VIDEO_HEADER_MODE_SEPARATE)) {
 		ret = venc_if_set_param(ctx,
 					VENC_SET_PARAM_PREPEND_HEADER,
 					NULL);
@@ -1207,33 +1207,33 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 
 	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
 			  1, 1, 1, 1);
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_BITRATE,
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_CODEC_VIDEO_BITRATE,
 			  ctx->dev->venc_pdata->min_bitrate,
 			  ctx->dev->venc_pdata->max_bitrate, 1, 4000000);
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_B_FRAMES,
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_CODEC_VIDEO_B_FRAMES,
 			0, 2, 1, 0);
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE,
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_CODEC_VIDEO_FRAME_RC_ENABLE,
 			0, 1, 1, 1);
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_H264_MAX_QP,
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_CODEC_VIDEO_H264_MAX_QP,
 			0, 51, 1, 51);
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_H264_I_PERIOD,
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_CODEC_VIDEO_H264_I_PERIOD,
 			0, 65535, 1, 0);
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_GOP_SIZE,
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_CODEC_VIDEO_GOP_SIZE,
 			0, 65535, 1, 0);
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE,
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_CODEC_VIDEO_MB_RC_ENABLE,
 			0, 1, 1, 0);
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME,
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_CODEC_VIDEO_FORCE_KEY_FRAME,
 			0, 0, 0, 0);
 	v4l2_ctrl_new_std_menu(handler, ops,
-			V4L2_CID_MPEG_VIDEO_HEADER_MODE,
-			V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
-			0, V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE);
-	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
-			V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
-			0, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
-	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
-			V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
-			0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
+			V4L2_CID_CODEC_VIDEO_HEADER_MODE,
+			V4L2_CODEC_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+			0, V4L2_CODEC_VIDEO_HEADER_MODE_SEPARATE);
+	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_CODEC_VIDEO_H264_PROFILE,
+			V4L2_CODEC_VIDEO_H264_PROFILE_HIGH,
+			0, V4L2_CODEC_VIDEO_H264_PROFILE_HIGH);
+	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_CODEC_VIDEO_H264_LEVEL,
+			V4L2_CODEC_VIDEO_H264_LEVEL_4_2,
+			0, V4L2_CODEC_VIDEO_H264_LEVEL_4_0);
 	if (handler->error) {
 		mtk_v4l2_err("Init control handler fail %d",
 				handler->error);
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
index d0123dfc5f93..1633791bb780 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
@@ -164,16 +164,16 @@ static unsigned int h264_get_profile(struct venc_h264_inst *inst,
 				     unsigned int profile)
 {
 	switch (profile) {
-	case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
+	case V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE:
 		return 66;
-	case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
+	case V4L2_CODEC_VIDEO_H264_PROFILE_MAIN:
 		return 77;
-	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
+	case V4L2_CODEC_VIDEO_H264_PROFILE_HIGH:
 		return 100;
-	case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
+	case V4L2_CODEC_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
 		mtk_vcodec_err(inst, "unsupported CONSTRAINED_BASELINE");
 		return 0;
-	case V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED:
+	case V4L2_CODEC_VIDEO_H264_PROFILE_EXTENDED:
 		mtk_vcodec_err(inst, "unsupported EXTENDED");
 		return 0;
 	default:
@@ -186,34 +186,34 @@ static unsigned int h264_get_level(struct venc_h264_inst *inst,
 				   unsigned int level)
 {
 	switch (level) {
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1B:
 		mtk_vcodec_err(inst, "unsupported 1B");
 		return 0;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_0:
 		return 10;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_1:
 		return 11;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_2:
 		return 12;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_1_3:
 		return 13;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_2_0:
 		return 20;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_2_1:
 		return 21;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_2_2:
 		return 22;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_3_0:
 		return 30;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_3_1:
 		return 31;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_3_2:
 		return 32;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_4_0:
 		return 40;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_4_1:
 		return 41;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
+	case V4L2_CODEC_VIDEO_H264_LEVEL_4_2:
 		return 42;
 	default:
 		mtk_vcodec_debug(inst, "unsupported level %d", level);
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 76ece2ff8d39..441aa4c8e498 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -590,7 +590,7 @@ static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
 		params.hfi_color_fmt = to_hfi_raw_fmt(inst->fmt_out->pixfmt);
 		params.enc.work_mode = VIDC_WORK_MODE_2;
 		params.enc.rc_type = HFI_RATE_CONTROL_OFF;
-		if (enc_ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CQ)
+		if (enc_ctr->bitrate_mode == V4L2_CODEC_VIDEO_BITRATE_MODE_CQ)
 			params.enc.rc_type = HFI_RATE_CONTROL_CQ;
 		params.enc.num_b_frames = enc_ctr->num_b_frames;
 		params.enc.is_tenbit = inst->bit_depth == VIDC_BITDEPTH_10;
@@ -640,112 +640,112 @@ struct id_mapping {
 };
 
 static const struct id_mapping mpeg4_profiles[] = {
-	{ HFI_MPEG4_PROFILE_SIMPLE, V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE },
-	{ HFI_MPEG4_PROFILE_ADVANCEDSIMPLE, V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE },
+	{ HFI_MPEG4_PROFILE_SIMPLE, V4L2_CODEC_VIDEO_MPEG4_PROFILE_SIMPLE },
+	{ HFI_MPEG4_PROFILE_ADVANCEDSIMPLE, V4L2_CODEC_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE },
 };
 
 static const struct id_mapping mpeg4_levels[] = {
-	{ HFI_MPEG4_LEVEL_0, V4L2_MPEG_VIDEO_MPEG4_LEVEL_0 },
-	{ HFI_MPEG4_LEVEL_0b, V4L2_MPEG_VIDEO_MPEG4_LEVEL_0B },
-	{ HFI_MPEG4_LEVEL_1, V4L2_MPEG_VIDEO_MPEG4_LEVEL_1 },
-	{ HFI_MPEG4_LEVEL_2, V4L2_MPEG_VIDEO_MPEG4_LEVEL_2 },
-	{ HFI_MPEG4_LEVEL_3, V4L2_MPEG_VIDEO_MPEG4_LEVEL_3 },
-	{ HFI_MPEG4_LEVEL_4, V4L2_MPEG_VIDEO_MPEG4_LEVEL_4 },
-	{ HFI_MPEG4_LEVEL_5, V4L2_MPEG_VIDEO_MPEG4_LEVEL_5 },
+	{ HFI_MPEG4_LEVEL_0, V4L2_CODEC_VIDEO_MPEG4_LEVEL_0 },
+	{ HFI_MPEG4_LEVEL_0b, V4L2_CODEC_VIDEO_MPEG4_LEVEL_0B },
+	{ HFI_MPEG4_LEVEL_1, V4L2_CODEC_VIDEO_MPEG4_LEVEL_1 },
+	{ HFI_MPEG4_LEVEL_2, V4L2_CODEC_VIDEO_MPEG4_LEVEL_2 },
+	{ HFI_MPEG4_LEVEL_3, V4L2_CODEC_VIDEO_MPEG4_LEVEL_3 },
+	{ HFI_MPEG4_LEVEL_4, V4L2_CODEC_VIDEO_MPEG4_LEVEL_4 },
+	{ HFI_MPEG4_LEVEL_5, V4L2_CODEC_VIDEO_MPEG4_LEVEL_5 },
 };
 
 static const struct id_mapping mpeg2_profiles[] = {
-	{ HFI_MPEG2_PROFILE_SIMPLE, V4L2_MPEG_VIDEO_MPEG2_PROFILE_SIMPLE },
-	{ HFI_MPEG2_PROFILE_MAIN, V4L2_MPEG_VIDEO_MPEG2_PROFILE_MAIN },
-	{ HFI_MPEG2_PROFILE_SNR, V4L2_MPEG_VIDEO_MPEG2_PROFILE_SNR_SCALABLE },
-	{ HFI_MPEG2_PROFILE_SPATIAL, V4L2_MPEG_VIDEO_MPEG2_PROFILE_SPATIALLY_SCALABLE },
-	{ HFI_MPEG2_PROFILE_HIGH, V4L2_MPEG_VIDEO_MPEG2_PROFILE_HIGH },
+	{ HFI_MPEG2_PROFILE_SIMPLE, V4L2_CODEC_VIDEO_MPEG2_PROFILE_SIMPLE },
+	{ HFI_MPEG2_PROFILE_MAIN, V4L2_CODEC_VIDEO_MPEG2_PROFILE_MAIN },
+	{ HFI_MPEG2_PROFILE_SNR, V4L2_CODEC_VIDEO_MPEG2_PROFILE_SNR_SCALABLE },
+	{ HFI_MPEG2_PROFILE_SPATIAL, V4L2_CODEC_VIDEO_MPEG2_PROFILE_SPATIALLY_SCALABLE },
+	{ HFI_MPEG2_PROFILE_HIGH, V4L2_CODEC_VIDEO_MPEG2_PROFILE_HIGH },
 };
 
 static const struct id_mapping mpeg2_levels[] = {
-	{ HFI_MPEG2_LEVEL_LL, V4L2_MPEG_VIDEO_MPEG2_LEVEL_LOW },
-	{ HFI_MPEG2_LEVEL_ML, V4L2_MPEG_VIDEO_MPEG2_LEVEL_MAIN },
-	{ HFI_MPEG2_LEVEL_H14, V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH_1440 },
-	{ HFI_MPEG2_LEVEL_HL, V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH },
+	{ HFI_MPEG2_LEVEL_LL, V4L2_CODEC_VIDEO_MPEG2_LEVEL_LOW },
+	{ HFI_MPEG2_LEVEL_ML, V4L2_CODEC_VIDEO_MPEG2_LEVEL_MAIN },
+	{ HFI_MPEG2_LEVEL_H14, V4L2_CODEC_VIDEO_MPEG2_LEVEL_HIGH_1440 },
+	{ HFI_MPEG2_LEVEL_HL, V4L2_CODEC_VIDEO_MPEG2_LEVEL_HIGH },
 };
 
 static const struct id_mapping h264_profiles[] = {
-	{ HFI_H264_PROFILE_BASELINE, V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE },
-	{ HFI_H264_PROFILE_MAIN, V4L2_MPEG_VIDEO_H264_PROFILE_MAIN },
-	{ HFI_H264_PROFILE_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH },
-	{ HFI_H264_PROFILE_STEREO_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH },
-	{ HFI_H264_PROFILE_MULTIVIEW_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH },
-	{ HFI_H264_PROFILE_CONSTRAINED_BASE, V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE },
-	{ HFI_H264_PROFILE_CONSTRAINED_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH },
+	{ HFI_H264_PROFILE_BASELINE, V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE },
+	{ HFI_H264_PROFILE_MAIN, V4L2_CODEC_VIDEO_H264_PROFILE_MAIN },
+	{ HFI_H264_PROFILE_HIGH, V4L2_CODEC_VIDEO_H264_PROFILE_HIGH },
+	{ HFI_H264_PROFILE_STEREO_HIGH, V4L2_CODEC_VIDEO_H264_PROFILE_STEREO_HIGH },
+	{ HFI_H264_PROFILE_MULTIVIEW_HIGH, V4L2_CODEC_VIDEO_H264_PROFILE_MULTIVIEW_HIGH },
+	{ HFI_H264_PROFILE_CONSTRAINED_BASE, V4L2_CODEC_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE },
+	{ HFI_H264_PROFILE_CONSTRAINED_HIGH, V4L2_CODEC_VIDEO_H264_PROFILE_CONSTRAINED_HIGH },
 };
 
 static const struct id_mapping h264_levels[] = {
-	{ HFI_H264_LEVEL_1, V4L2_MPEG_VIDEO_H264_LEVEL_1_0 },
-	{ HFI_H264_LEVEL_1b, V4L2_MPEG_VIDEO_H264_LEVEL_1B },
-	{ HFI_H264_LEVEL_11, V4L2_MPEG_VIDEO_H264_LEVEL_1_1 },
-	{ HFI_H264_LEVEL_12, V4L2_MPEG_VIDEO_H264_LEVEL_1_2 },
-	{ HFI_H264_LEVEL_13, V4L2_MPEG_VIDEO_H264_LEVEL_1_3 },
-	{ HFI_H264_LEVEL_2, V4L2_MPEG_VIDEO_H264_LEVEL_2_0 },
-	{ HFI_H264_LEVEL_21, V4L2_MPEG_VIDEO_H264_LEVEL_2_1 },
-	{ HFI_H264_LEVEL_22, V4L2_MPEG_VIDEO_H264_LEVEL_2_2 },
-	{ HFI_H264_LEVEL_3, V4L2_MPEG_VIDEO_H264_LEVEL_3_0 },
-	{ HFI_H264_LEVEL_31, V4L2_MPEG_VIDEO_H264_LEVEL_3_1 },
-	{ HFI_H264_LEVEL_32, V4L2_MPEG_VIDEO_H264_LEVEL_3_2 },
-	{ HFI_H264_LEVEL_4, V4L2_MPEG_VIDEO_H264_LEVEL_4_0 },
-	{ HFI_H264_LEVEL_41, V4L2_MPEG_VIDEO_H264_LEVEL_4_1 },
-	{ HFI_H264_LEVEL_42, V4L2_MPEG_VIDEO_H264_LEVEL_4_2 },
-	{ HFI_H264_LEVEL_5, V4L2_MPEG_VIDEO_H264_LEVEL_5_0 },
-	{ HFI_H264_LEVEL_51, V4L2_MPEG_VIDEO_H264_LEVEL_5_1 },
-	{ HFI_H264_LEVEL_52, V4L2_MPEG_VIDEO_H264_LEVEL_5_1 },
+	{ HFI_H264_LEVEL_1, V4L2_CODEC_VIDEO_H264_LEVEL_1_0 },
+	{ HFI_H264_LEVEL_1b, V4L2_CODEC_VIDEO_H264_LEVEL_1B },
+	{ HFI_H264_LEVEL_11, V4L2_CODEC_VIDEO_H264_LEVEL_1_1 },
+	{ HFI_H264_LEVEL_12, V4L2_CODEC_VIDEO_H264_LEVEL_1_2 },
+	{ HFI_H264_LEVEL_13, V4L2_CODEC_VIDEO_H264_LEVEL_1_3 },
+	{ HFI_H264_LEVEL_2, V4L2_CODEC_VIDEO_H264_LEVEL_2_0 },
+	{ HFI_H264_LEVEL_21, V4L2_CODEC_VIDEO_H264_LEVEL_2_1 },
+	{ HFI_H264_LEVEL_22, V4L2_CODEC_VIDEO_H264_LEVEL_2_2 },
+	{ HFI_H264_LEVEL_3, V4L2_CODEC_VIDEO_H264_LEVEL_3_0 },
+	{ HFI_H264_LEVEL_31, V4L2_CODEC_VIDEO_H264_LEVEL_3_1 },
+	{ HFI_H264_LEVEL_32, V4L2_CODEC_VIDEO_H264_LEVEL_3_2 },
+	{ HFI_H264_LEVEL_4, V4L2_CODEC_VIDEO_H264_LEVEL_4_0 },
+	{ HFI_H264_LEVEL_41, V4L2_CODEC_VIDEO_H264_LEVEL_4_1 },
+	{ HFI_H264_LEVEL_42, V4L2_CODEC_VIDEO_H264_LEVEL_4_2 },
+	{ HFI_H264_LEVEL_5, V4L2_CODEC_VIDEO_H264_LEVEL_5_0 },
+	{ HFI_H264_LEVEL_51, V4L2_CODEC_VIDEO_H264_LEVEL_5_1 },
+	{ HFI_H264_LEVEL_52, V4L2_CODEC_VIDEO_H264_LEVEL_5_1 },
 };
 
 static const struct id_mapping hevc_profiles[] = {
-	{ HFI_HEVC_PROFILE_MAIN, V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN },
-	{ HFI_HEVC_PROFILE_MAIN_STILL_PIC, V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE },
-	{ HFI_HEVC_PROFILE_MAIN10, V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10 },
+	{ HFI_HEVC_PROFILE_MAIN, V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN },
+	{ HFI_HEVC_PROFILE_MAIN_STILL_PIC, V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE },
+	{ HFI_HEVC_PROFILE_MAIN10, V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN_10 },
 };
 
 static const struct id_mapping hevc_levels[] = {
-	{ HFI_HEVC_LEVEL_1, V4L2_MPEG_VIDEO_HEVC_LEVEL_1 },
-	{ HFI_HEVC_LEVEL_2, V4L2_MPEG_VIDEO_HEVC_LEVEL_2 },
-	{ HFI_HEVC_LEVEL_21, V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1 },
-	{ HFI_HEVC_LEVEL_3, V4L2_MPEG_VIDEO_HEVC_LEVEL_3 },
-	{ HFI_HEVC_LEVEL_31, V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1 },
-	{ HFI_HEVC_LEVEL_4, V4L2_MPEG_VIDEO_HEVC_LEVEL_4 },
-	{ HFI_HEVC_LEVEL_41, V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1 },
-	{ HFI_HEVC_LEVEL_5, V4L2_MPEG_VIDEO_HEVC_LEVEL_5 },
-	{ HFI_HEVC_LEVEL_51, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1 },
-	{ HFI_HEVC_LEVEL_52, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2 },
-	{ HFI_HEVC_LEVEL_6, V4L2_MPEG_VIDEO_HEVC_LEVEL_6 },
-	{ HFI_HEVC_LEVEL_61, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1 },
-	{ HFI_HEVC_LEVEL_62, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2 },
+	{ HFI_HEVC_LEVEL_1, V4L2_CODEC_VIDEO_HEVC_LEVEL_1 },
+	{ HFI_HEVC_LEVEL_2, V4L2_CODEC_VIDEO_HEVC_LEVEL_2 },
+	{ HFI_HEVC_LEVEL_21, V4L2_CODEC_VIDEO_HEVC_LEVEL_2_1 },
+	{ HFI_HEVC_LEVEL_3, V4L2_CODEC_VIDEO_HEVC_LEVEL_3 },
+	{ HFI_HEVC_LEVEL_31, V4L2_CODEC_VIDEO_HEVC_LEVEL_3_1 },
+	{ HFI_HEVC_LEVEL_4, V4L2_CODEC_VIDEO_HEVC_LEVEL_4 },
+	{ HFI_HEVC_LEVEL_41, V4L2_CODEC_VIDEO_HEVC_LEVEL_4_1 },
+	{ HFI_HEVC_LEVEL_5, V4L2_CODEC_VIDEO_HEVC_LEVEL_5 },
+	{ HFI_HEVC_LEVEL_51, V4L2_CODEC_VIDEO_HEVC_LEVEL_5_1 },
+	{ HFI_HEVC_LEVEL_52, V4L2_CODEC_VIDEO_HEVC_LEVEL_5_2 },
+	{ HFI_HEVC_LEVEL_6, V4L2_CODEC_VIDEO_HEVC_LEVEL_6 },
+	{ HFI_HEVC_LEVEL_61, V4L2_CODEC_VIDEO_HEVC_LEVEL_6_1 },
+	{ HFI_HEVC_LEVEL_62, V4L2_CODEC_VIDEO_HEVC_LEVEL_6_2 },
 };
 
 static const struct id_mapping vp8_profiles[] = {
-	{ HFI_VPX_PROFILE_VERSION_0, V4L2_MPEG_VIDEO_VP8_PROFILE_0 },
-	{ HFI_VPX_PROFILE_VERSION_1, V4L2_MPEG_VIDEO_VP8_PROFILE_1 },
-	{ HFI_VPX_PROFILE_VERSION_2, V4L2_MPEG_VIDEO_VP8_PROFILE_2 },
-	{ HFI_VPX_PROFILE_VERSION_3, V4L2_MPEG_VIDEO_VP8_PROFILE_3 },
+	{ HFI_VPX_PROFILE_VERSION_0, V4L2_CODEC_VIDEO_VP8_PROFILE_0 },
+	{ HFI_VPX_PROFILE_VERSION_1, V4L2_CODEC_VIDEO_VP8_PROFILE_1 },
+	{ HFI_VPX_PROFILE_VERSION_2, V4L2_CODEC_VIDEO_VP8_PROFILE_2 },
+	{ HFI_VPX_PROFILE_VERSION_3, V4L2_CODEC_VIDEO_VP8_PROFILE_3 },
 };
 
 static const struct id_mapping vp9_profiles[] = {
-	{ HFI_VP9_PROFILE_P0, V4L2_MPEG_VIDEO_VP9_PROFILE_0 },
-	{ HFI_VP9_PROFILE_P2_10B, V4L2_MPEG_VIDEO_VP9_PROFILE_2 },
+	{ HFI_VP9_PROFILE_P0, V4L2_CODEC_VIDEO_VP9_PROFILE_0 },
+	{ HFI_VP9_PROFILE_P2_10B, V4L2_CODEC_VIDEO_VP9_PROFILE_2 },
 };
 
 static const struct id_mapping vp9_levels[] = {
-	{ HFI_VP9_LEVEL_1, V4L2_MPEG_VIDEO_VP9_LEVEL_1_0 },
-	{ HFI_VP9_LEVEL_11, V4L2_MPEG_VIDEO_VP9_LEVEL_1_1 },
-	{ HFI_VP9_LEVEL_2, V4L2_MPEG_VIDEO_VP9_LEVEL_2_0},
-	{ HFI_VP9_LEVEL_21, V4L2_MPEG_VIDEO_VP9_LEVEL_2_1 },
-	{ HFI_VP9_LEVEL_3, V4L2_MPEG_VIDEO_VP9_LEVEL_3_0},
-	{ HFI_VP9_LEVEL_31, V4L2_MPEG_VIDEO_VP9_LEVEL_3_1 },
-	{ HFI_VP9_LEVEL_4, V4L2_MPEG_VIDEO_VP9_LEVEL_4_0 },
-	{ HFI_VP9_LEVEL_41, V4L2_MPEG_VIDEO_VP9_LEVEL_4_1 },
-	{ HFI_VP9_LEVEL_5, V4L2_MPEG_VIDEO_VP9_LEVEL_5_0 },
-	{ HFI_VP9_LEVEL_51, V4L2_MPEG_VIDEO_VP9_LEVEL_5_1 },
-	{ HFI_VP9_LEVEL_6, V4L2_MPEG_VIDEO_VP9_LEVEL_6_0 },
-	{ HFI_VP9_LEVEL_61, V4L2_MPEG_VIDEO_VP9_LEVEL_6_1 },
+	{ HFI_VP9_LEVEL_1, V4L2_CODEC_VIDEO_VP9_LEVEL_1_0 },
+	{ HFI_VP9_LEVEL_11, V4L2_CODEC_VIDEO_VP9_LEVEL_1_1 },
+	{ HFI_VP9_LEVEL_2, V4L2_CODEC_VIDEO_VP9_LEVEL_2_0},
+	{ HFI_VP9_LEVEL_21, V4L2_CODEC_VIDEO_VP9_LEVEL_2_1 },
+	{ HFI_VP9_LEVEL_3, V4L2_CODEC_VIDEO_VP9_LEVEL_3_0},
+	{ HFI_VP9_LEVEL_31, V4L2_CODEC_VIDEO_VP9_LEVEL_3_1 },
+	{ HFI_VP9_LEVEL_4, V4L2_CODEC_VIDEO_VP9_LEVEL_4_0 },
+	{ HFI_VP9_LEVEL_41, V4L2_CODEC_VIDEO_VP9_LEVEL_4_1 },
+	{ HFI_VP9_LEVEL_5, V4L2_CODEC_VIDEO_VP9_LEVEL_5_0 },
+	{ HFI_VP9_LEVEL_51, V4L2_CODEC_VIDEO_VP9_LEVEL_5_1 },
+	{ HFI_VP9_LEVEL_6, V4L2_CODEC_VIDEO_VP9_LEVEL_6_0 },
+	{ HFI_VP9_LEVEL_61, V4L2_CODEC_VIDEO_VP9_LEVEL_6_1 },
 };
 
 static u32 find_v4l2_id(u32 hfi_id, const struct id_mapping *array, unsigned int array_sz)
diff --git a/drivers/media/platform/qcom/venus/vdec_ctrls.c b/drivers/media/platform/qcom/venus/vdec_ctrls.c
index 974110b75b93..e6dd79af10af 100644
--- a/drivers/media/platform/qcom/venus/vdec_ctrls.c
+++ b/drivers/media/platform/qcom/venus/vdec_ctrls.c
@@ -16,18 +16,18 @@ static int vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct vdec_controls *ctr = &inst->controls.dec;
 
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
+	case V4L2_CID_CODEC_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
 		ctr->post_loop_deb_mode = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
-	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:
-	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
-	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_H264_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_VP8_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_VP9_PROFILE:
 		ctr->profile = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
-	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
-	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_H264_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_VP9_LEVEL:
 		ctr->level = ctrl->val;
 		break;
 	default:
@@ -47,24 +47,24 @@ static int vdec_op_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	int ret;
 
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
-	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:
-	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
-	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_H264_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_VP8_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_VP9_PROFILE:
 		ret = venus_helper_get_profile_level(inst, &profile, &level);
 		if (!ret)
 			ctr->profile = profile;
 		ctrl->val = ctr->profile;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
-	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
-	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_H264_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_VP9_LEVEL:
 		ret = venus_helper_get_profile_level(inst, &profile, &level);
 		if (!ret)
 			ctr->level = level;
 		ctrl->val = ctr->level;
 		break;
-	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
+	case V4L2_CID_CODEC_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
 		ctrl->val = ctr->post_loop_deb_mode;
 		break;
 	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
@@ -94,64 +94,64 @@ int vdec_ctrl_init(struct venus_inst *inst)
 		return ret;
 
 	ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &vdec_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE,
-		V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY,
-		~((1 << V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE) |
-		  (1 << V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE)),
-		V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE);
+		V4L2_CID_CODEC_VIDEO_MPEG4_PROFILE,
+		V4L2_CODEC_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY,
+		~((1 << V4L2_CODEC_VIDEO_MPEG4_PROFILE_SIMPLE) |
+		  (1 << V4L2_CODEC_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE)),
+		V4L2_CODEC_VIDEO_MPEG4_PROFILE_SIMPLE);
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
 	ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &vdec_ctrl_ops,
-				      V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL,
-				      V4L2_MPEG_VIDEO_MPEG4_LEVEL_5,
-				      0, V4L2_MPEG_VIDEO_MPEG4_LEVEL_0);
+				      V4L2_CID_CODEC_VIDEO_MPEG4_LEVEL,
+				      V4L2_CODEC_VIDEO_MPEG4_LEVEL_5,
+				      0, V4L2_CODEC_VIDEO_MPEG4_LEVEL_0);
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
 	ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &vdec_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_PROFILE,
-		V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
-		~((1 << V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
-		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
-		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
-		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
-		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH) |
-		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH)),
-		V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE);
+		V4L2_CID_CODEC_VIDEO_H264_PROFILE,
+		V4L2_CODEC_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
+		~((1 << V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE) |
+		  (1 << V4L2_CODEC_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+		  (1 << V4L2_CODEC_VIDEO_H264_PROFILE_MAIN) |
+		  (1 << V4L2_CODEC_VIDEO_H264_PROFILE_HIGH) |
+		  (1 << V4L2_CODEC_VIDEO_H264_PROFILE_STEREO_HIGH) |
+		  (1 << V4L2_CODEC_VIDEO_H264_PROFILE_MULTIVIEW_HIGH)),
+		V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE);
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
 	ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &vdec_ctrl_ops,
-				      V4L2_CID_MPEG_VIDEO_H264_LEVEL,
-				      V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
-				      0, V4L2_MPEG_VIDEO_H264_LEVEL_1_0);
+				      V4L2_CID_CODEC_VIDEO_H264_LEVEL,
+				      V4L2_CODEC_VIDEO_H264_LEVEL_5_1,
+				      0, V4L2_CODEC_VIDEO_H264_LEVEL_1_0);
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
 	ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &vdec_ctrl_ops,
-				      V4L2_CID_MPEG_VIDEO_VP8_PROFILE,
-				      V4L2_MPEG_VIDEO_VP8_PROFILE_3,
-				      0, V4L2_MPEG_VIDEO_VP8_PROFILE_0);
+				      V4L2_CID_CODEC_VIDEO_VP8_PROFILE,
+				      V4L2_CODEC_VIDEO_VP8_PROFILE_3,
+				      0, V4L2_CODEC_VIDEO_VP8_PROFILE_0);
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
 	ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &vdec_ctrl_ops,
-				      V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
-				      V4L2_MPEG_VIDEO_VP9_PROFILE_3,
-				      0, V4L2_MPEG_VIDEO_VP9_PROFILE_0);
+				      V4L2_CID_CODEC_VIDEO_VP9_PROFILE,
+				      V4L2_CODEC_VIDEO_VP9_PROFILE_3,
+				      0, V4L2_CODEC_VIDEO_VP9_PROFILE_0);
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
 	ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &vdec_ctrl_ops,
-				      V4L2_CID_MPEG_VIDEO_VP9_LEVEL,
-				      V4L2_MPEG_VIDEO_VP9_LEVEL_6_2,
-				      0, V4L2_MPEG_VIDEO_VP9_LEVEL_1_0);
+				      V4L2_CID_CODEC_VIDEO_VP9_LEVEL,
+				      V4L2_CODEC_VIDEO_VP9_LEVEL_6_2,
+				      0, V4L2_CODEC_VIDEO_VP9_LEVEL_1_0);
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER, 0, 1, 1, 0);
+		V4L2_CID_CODEC_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER, 0, 1, 1, 0);
 
 	ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
 		V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 1);
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 6976ed553647..16251e662b64 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -113,22 +113,22 @@ find_format_by_index(struct venus_inst *inst, unsigned int index, u32 type)
 static int venc_v4l2_to_hfi(int id, int value)
 {
 	switch (id) {
-	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
+	case V4L2_CID_CODEC_VIDEO_H264_ENTROPY_MODE:
 		switch (value) {
-		case V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC:
+		case V4L2_CODEC_VIDEO_H264_ENTROPY_MODE_CAVLC:
 		default:
 			return HFI_H264_ENTROPY_CAVLC;
-		case V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC:
+		case V4L2_CODEC_VIDEO_H264_ENTROPY_MODE_CABAC:
 			return HFI_H264_ENTROPY_CABAC;
 		}
-	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:
+	case V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_MODE:
 		switch (value) {
-		case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED:
+		case V4L2_CODEC_VIDEO_H264_LOOP_FILTER_MODE_ENABLED:
 		default:
 			return HFI_H264_DB_MODE_ALL_BOUNDARY;
-		case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED:
+		case V4L2_CODEC_VIDEO_H264_LOOP_FILTER_MODE_DISABLED:
 			return HFI_H264_DB_MODE_DISABLE;
-		case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
+		case V4L2_CODEC_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
 			return HFI_H264_DB_MODE_SKIP_SLICE_BOUNDARY;
 		}
 	}
@@ -578,7 +578,7 @@ static int venc_set_properties(struct venus_inst *inst)
 
 		ptype = HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL;
 		entropy.entropy_mode = venc_v4l2_to_hfi(
-					  V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE,
+					  V4L2_CID_CODEC_VIDEO_H264_ENTROPY_MODE,
 					  ctr->h264_entropy_mode);
 		entropy.cabac_model = HFI_H264_CABAC_MODEL_0;
 
@@ -588,7 +588,7 @@ static int venc_set_properties(struct venus_inst *inst)
 
 		ptype = HFI_PROPERTY_PARAM_VENC_H264_DEBLOCK_CONTROL;
 		deblock.mode = venc_v4l2_to_hfi(
-				      V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE,
+				      V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_MODE,
 				      ctr->h264_loop_filter_mode);
 		deblock.slice_alpha_offset = ctr->h264_loop_filter_alpha;
 		deblock.slice_beta_offset = ctr->h264_loop_filter_beta;
@@ -631,13 +631,13 @@ static int venc_set_properties(struct venus_inst *inst)
 
 	if (!ctr->rc_enable)
 		rate_control = HFI_RATE_CONTROL_OFF;
-	else if (ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
+	else if (ctr->bitrate_mode == V4L2_CODEC_VIDEO_BITRATE_MODE_VBR)
 		rate_control = ctr->frame_skip_mode ? HFI_RATE_CONTROL_VBR_VFR :
 						      HFI_RATE_CONTROL_VBR_CFR;
-	else if (ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+	else if (ctr->bitrate_mode == V4L2_CODEC_VIDEO_BITRATE_MODE_CBR)
 		rate_control = ctr->frame_skip_mode ? HFI_RATE_CONTROL_CBR_VFR :
 						      HFI_RATE_CONTROL_CBR_CFR;
-	else if (ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CQ)
+	else if (ctr->bitrate_mode == V4L2_CODEC_VIDEO_BITRATE_MODE_CQ)
 		rate_control = HFI_RATE_CONTROL_CQ;
 
 	ptype = HFI_PROPERTY_PARAM_VENC_RATE_CONTROL;
@@ -671,7 +671,7 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
 	    inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
 		ptype = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER;
-		if (ctr->header_mode == V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
+		if (ctr->header_mode == V4L2_CODEC_VIDEO_HEADER_MODE_SEPARATE)
 			en.enable = 0;
 		else
 			en.enable = 1;
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index a52b80055173..cf0943ee5be0 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -19,7 +19,7 @@
 #define SLICE_MB_SIZE_MAX	300
 #define INTRA_REFRESH_MBS_MAX	300
 #define AT_SLICE_BOUNDARY	\
-	V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY
+	V4L2_CODEC_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY
 
 static int venc_calc_bpframes(u32 gop_size, u32 conseq_b, u32 *bf, u32 *pf)
 {
@@ -77,10 +77,10 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	int ret;
 
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_MODE:
 		ctr->bitrate_mode = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE:
 		ctr->bitrate = ctrl->val;
 		mutex_lock(&inst->lock);
 		if (inst->streamon_out && inst->streamon_cap) {
@@ -96,122 +96,122 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		}
 		mutex_unlock(&inst->lock);
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_PEAK:
 		ctr->bitrate_peak = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
+	case V4L2_CID_CODEC_VIDEO_H264_ENTROPY_MODE:
 		ctr->h264_entropy_mode = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_PROFILE:
 		ctr->profile.mpeg4 = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_H264_PROFILE:
 		ctr->profile.h264 = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_PROFILE:
 		ctr->profile.hevc = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_VP8_PROFILE:
 		ctr->profile.vp8 = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_LEVEL:
 		ctr->level.mpeg4 = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_H264_LEVEL:
 		ctr->level.h264 = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_HEVC_LEVEL:
 		ctr->level.hevc = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_I_FRAME_QP:
 		ctr->h264_i_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_P_FRAME_QP:
 		ctr->h264_p_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_B_FRAME_QP:
 		ctr->h264_b_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_MIN_QP:
 		ctr->h264_min_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_I_FRAME_MIN_QP:
 		ctr->h264_i_min_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_P_FRAME_MIN_QP:
 		ctr->h264_p_min_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_B_FRAME_MIN_QP:
 		ctr->h264_b_min_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_MAX_QP:
 		ctr->h264_max_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_I_FRAME_MAX_QP:
 		ctr->h264_i_max_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_P_FRAME_MAX_QP:
 		ctr->h264_p_max_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_B_FRAME_MAX_QP:
 		ctr->h264_b_max_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_I_FRAME_QP:
 		ctr->hevc_i_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_P_FRAME_QP:
 		ctr->hevc_p_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_B_FRAME_QP:
 		ctr->hevc_b_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP:
 		ctr->hevc_min_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_I_FRAME_MIN_QP:
 		ctr->hevc_i_min_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_P_FRAME_MIN_QP:
 		ctr->hevc_p_min_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_B_FRAME_MIN_QP:
 		ctr->hevc_b_min_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP:
 		ctr->hevc_max_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_I_FRAME_MAX_QP:
 		ctr->hevc_i_max_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_P_FRAME_MAX_QP:
 		ctr->hevc_p_max_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_B_FRAME_MAX_QP:
 		ctr->hevc_b_max_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
+	case V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MODE:
 		ctr->multi_slice_mode = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:
+	case V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MAX_BYTES:
 		ctr->multi_slice_max_bytes = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
+	case V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MAX_MB:
 		ctr->multi_slice_max_mb = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA:
+	case V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_ALPHA:
 		ctr->h264_loop_filter_alpha = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA:
+	case V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_BETA:
 		ctr->h264_loop_filter_beta = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:
+	case V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_MODE:
 		ctr->h264_loop_filter_mode = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
+	case V4L2_CID_CODEC_VIDEO_HEADER_MODE:
 		ctr->header_mode = ctrl->val;
 		mutex_lock(&inst->lock);
 		if (inst->streamon_out && inst->streamon_cap) {
-			if (ctrl->val == V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
+			if (ctrl->val == V4L2_CODEC_VIDEO_HEADER_MODE_SEPARATE)
 				en.enable = 0;
 			else
 				en.enable = 1;
@@ -224,9 +224,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		}
 		mutex_unlock(&inst->lock);
 		break;
-	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:
+	case V4L2_CID_CODEC_VIDEO_CYCLIC_INTRA_REFRESH_MB:
 		break;
-	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
+	case V4L2_CID_CODEC_VIDEO_GOP_SIZE:
 		ret = venc_calc_bpframes(ctrl->val, ctr->num_b_frames, &bframes,
 					 &ctr->num_p_frames);
 		if (ret)
@@ -234,16 +234,16 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 
 		ctr->gop_size = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_I_PERIOD:
+	case V4L2_CID_CODEC_VIDEO_H264_I_PERIOD:
 		ctr->h264_i_period = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VPX_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_VPX_MIN_QP:
 		ctr->vp8_min_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VPX_MAX_QP:
+	case V4L2_CID_CODEC_VIDEO_VPX_MAX_QP:
 		ctr->vp8_max_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
+	case V4L2_CID_CODEC_VIDEO_B_FRAMES:
 		ret = venc_calc_bpframes(ctr->gop_size, ctrl->val, &bframes,
 					 &ctr->num_p_frames);
 		if (ret)
@@ -251,7 +251,7 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 
 		ctr->num_b_frames = bframes;
 		break;
-	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
+	case V4L2_CID_CODEC_VIDEO_FORCE_KEY_FRAME:
 		mutex_lock(&inst->lock);
 		if (inst->streamon_out && inst->streamon_cap) {
 			ptype = HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME;
@@ -264,16 +264,16 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		}
 		mutex_unlock(&inst->lock);
 		break;
-	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
+	case V4L2_CID_CODEC_VIDEO_FRAME_RC_ENABLE:
 		ctr->rc_enable = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY:
+	case V4L2_CID_CODEC_VIDEO_CONSTANT_QUALITY:
 		ctr->const_quality = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
+	case V4L2_CID_CODEC_VIDEO_FRAME_SKIP_MODE:
 		ctr->frame_skip_mode = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID:
+	case V4L2_CID_CODEC_VIDEO_BASELAYER_PRIORITY_ID:
 		ctr->base_priority_id = ctrl->val;
 		break;
 	default:
@@ -296,206 +296,206 @@ int venc_ctrl_init(struct venus_inst *inst)
 		return ret;
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
-		V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
-		~((1 << V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
-		  (1 << V4L2_MPEG_VIDEO_BITRATE_MODE_CBR) |
-		  (1 << V4L2_MPEG_VIDEO_BITRATE_MODE_CQ)),
-		V4L2_MPEG_VIDEO_BITRATE_MODE_VBR);
+		V4L2_CID_CODEC_VIDEO_BITRATE_MODE,
+		V4L2_CODEC_VIDEO_BITRATE_MODE_CBR,
+		~((1 << V4L2_CODEC_VIDEO_BITRATE_MODE_VBR) |
+		  (1 << V4L2_CODEC_VIDEO_BITRATE_MODE_CBR) |
+		  (1 << V4L2_CODEC_VIDEO_BITRATE_MODE_CQ)),
+		V4L2_CODEC_VIDEO_BITRATE_MODE_VBR);
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE,
-		V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
-		0, V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC);
+		V4L2_CID_CODEC_VIDEO_H264_ENTROPY_MODE,
+		V4L2_CODEC_VIDEO_H264_ENTROPY_MODE_CABAC,
+		0, V4L2_CODEC_VIDEO_H264_ENTROPY_MODE_CAVLC);
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE,
-		V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY,
-		~((1 << V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE) |
-		  (1 << V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE)),
-		V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE);
+		V4L2_CID_CODEC_VIDEO_MPEG4_PROFILE,
+		V4L2_CODEC_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY,
+		~((1 << V4L2_CODEC_VIDEO_MPEG4_PROFILE_SIMPLE) |
+		  (1 << V4L2_CODEC_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE)),
+		V4L2_CODEC_VIDEO_MPEG4_PROFILE_SIMPLE);
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL,
-		V4L2_MPEG_VIDEO_MPEG4_LEVEL_5,
-		0, V4L2_MPEG_VIDEO_MPEG4_LEVEL_0);
+		V4L2_CID_CODEC_VIDEO_MPEG4_LEVEL,
+		V4L2_CODEC_VIDEO_MPEG4_LEVEL_5,
+		0, V4L2_CODEC_VIDEO_MPEG4_LEVEL_0);
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
-		V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
-		~((1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
-		  (1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
-		  (1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10)),
-		V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN);
+		V4L2_CID_CODEC_VIDEO_HEVC_PROFILE,
+		V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN_10,
+		~((1 << V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN) |
+		  (1 << V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
+		  (1 << V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN_10)),
+		V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN);
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
-		V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
-		0, V4L2_MPEG_VIDEO_HEVC_LEVEL_1);
+		V4L2_CID_CODEC_VIDEO_HEVC_LEVEL,
+		V4L2_CODEC_VIDEO_HEVC_LEVEL_6_2,
+		0, V4L2_CODEC_VIDEO_HEVC_LEVEL_1);
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_PROFILE,
-		V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
-		~((1 << V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
-		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
-		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
-		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
-		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH) |
-		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH)),
-		V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
+		V4L2_CID_CODEC_VIDEO_H264_PROFILE,
+		V4L2_CODEC_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
+		~((1 << V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE) |
+		  (1 << V4L2_CODEC_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+		  (1 << V4L2_CODEC_VIDEO_H264_PROFILE_MAIN) |
+		  (1 << V4L2_CODEC_VIDEO_H264_PROFILE_HIGH) |
+		  (1 << V4L2_CODEC_VIDEO_H264_PROFILE_STEREO_HIGH) |
+		  (1 << V4L2_CODEC_VIDEO_H264_PROFILE_MULTIVIEW_HIGH)),
+		V4L2_CODEC_VIDEO_H264_PROFILE_HIGH);
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_LEVEL,
-		V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
-		0, V4L2_MPEG_VIDEO_H264_LEVEL_1_0);
+		V4L2_CID_CODEC_VIDEO_H264_LEVEL,
+		V4L2_CODEC_VIDEO_H264_LEVEL_5_1,
+		0, V4L2_CODEC_VIDEO_H264_LEVEL_1_0);
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE,
+		V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_MODE,
 		AT_SLICE_BOUNDARY,
-		0, V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED);
+		0, V4L2_CODEC_VIDEO_H264_LOOP_FILTER_MODE_DISABLED);
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_HEADER_MODE,
-		V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
-		~((1 << V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
-		(1 << V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME)),
-		V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE);
+		V4L2_CID_CODEC_VIDEO_HEADER_MODE,
+		V4L2_CODEC_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		~((1 << V4L2_CODEC_VIDEO_HEADER_MODE_SEPARATE) |
+		(1 << V4L2_CODEC_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME)),
+		V4L2_CODEC_VIDEO_HEADER_MODE_SEPARATE);
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE,
-		V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES,
-		0, V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE);
+		V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MODE,
+		V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_MAX_BYTES,
+		0, V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_SINGLE);
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_VP8_PROFILE,
-		V4L2_MPEG_VIDEO_VP8_PROFILE_3,
-		0, V4L2_MPEG_VIDEO_VP8_PROFILE_0);
+		V4L2_CID_CODEC_VIDEO_VP8_PROFILE,
+		V4L2_CODEC_VIDEO_VP8_PROFILE_3,
+		0, V4L2_CODEC_VIDEO_VP8_PROFILE_0);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_BITRATE, BITRATE_MIN, BITRATE_MAX,
+		V4L2_CID_CODEC_VIDEO_BITRATE, BITRATE_MIN, BITRATE_MAX,
 		BITRATE_STEP, BITRATE_DEFAULT);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_BITRATE_PEAK, BITRATE_MIN, BITRATE_MAX,
+		V4L2_CID_CODEC_VIDEO_BITRATE_PEAK, BITRATE_MIN, BITRATE_MAX,
 		BITRATE_STEP, BITRATE_DEFAULT_PEAK);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP, 1, 51, 1, 26);
+			  V4L2_CID_CODEC_VIDEO_H264_I_FRAME_QP, 1, 51, 1, 26);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP, 1, 51, 1, 28);
+			  V4L2_CID_CODEC_VIDEO_H264_P_FRAME_QP, 1, 51, 1, 28);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP, 1, 51, 1, 30);
+			  V4L2_CID_CODEC_VIDEO_H264_B_FRAME_QP, 1, 51, 1, 30);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_MIN_QP, 1, 51, 1, 1);
+			  V4L2_CID_CODEC_VIDEO_H264_MIN_QP, 1, 51, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP, 1, 51, 1, 1);
+			  V4L2_CID_CODEC_VIDEO_H264_I_FRAME_MIN_QP, 1, 51, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP, 1, 51, 1, 1);
+			  V4L2_CID_CODEC_VIDEO_H264_P_FRAME_MIN_QP, 1, 51, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP, 1, 51, 1, 1);
+			  V4L2_CID_CODEC_VIDEO_H264_B_FRAME_MIN_QP, 1, 51, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_MAX_QP, 1, 51, 1, 51);
+			  V4L2_CID_CODEC_VIDEO_H264_MAX_QP, 1, 51, 1, 51);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP, 1, 51, 1, 51);
+			  V4L2_CID_CODEC_VIDEO_H264_I_FRAME_MAX_QP, 1, 51, 1, 51);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP, 1, 51, 1, 51);
+			  V4L2_CID_CODEC_VIDEO_H264_P_FRAME_MAX_QP, 1, 51, 1, 51);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP, 1, 51, 1, 51);
+			  V4L2_CID_CODEC_VIDEO_H264_B_FRAME_MAX_QP, 1, 51, 1, 51);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP, 1, 63, 1, 26);
+			  V4L2_CID_CODEC_VIDEO_HEVC_I_FRAME_QP, 1, 63, 1, 26);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP, 1, 63, 1, 28);
+			  V4L2_CID_CODEC_VIDEO_HEVC_P_FRAME_QP, 1, 63, 1, 28);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP, 1, 63, 1, 30);
+			  V4L2_CID_CODEC_VIDEO_HEVC_B_FRAME_QP, 1, 63, 1, 30);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP, 1, 63, 1, 1);
+			  V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP, 1, 63, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP, 1, 63, 1, 1);
+			  V4L2_CID_CODEC_VIDEO_HEVC_I_FRAME_MIN_QP, 1, 63, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP, 1, 63, 1, 1);
+			  V4L2_CID_CODEC_VIDEO_HEVC_P_FRAME_MIN_QP, 1, 63, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP, 1, 63, 1, 1);
+			  V4L2_CID_CODEC_VIDEO_HEVC_B_FRAME_MIN_QP, 1, 63, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP, 1, 63, 1, 63);
+			  V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP, 1, 63, 1, 63);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP, 1, 63, 1, 63);
+			  V4L2_CID_CODEC_VIDEO_HEVC_I_FRAME_MAX_QP, 1, 63, 1, 63);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP, 1, 63, 1, 63);
+			  V4L2_CID_CODEC_VIDEO_HEVC_P_FRAME_MAX_QP, 1, 63, 1, 63);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP, 1, 63, 1, 63);
+			  V4L2_CID_CODEC_VIDEO_HEVC_B_FRAME_MAX_QP, 1, 63, 1, 63);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES, SLICE_BYTE_SIZE_MIN,
+		V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MAX_BYTES, SLICE_BYTE_SIZE_MIN,
 		SLICE_BYTE_SIZE_MAX, 1, SLICE_BYTE_SIZE_MIN);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB, 1,
+		V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MAX_MB, 1,
 		SLICE_MB_SIZE_MAX, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA, -6, 6, 1, 0);
+		V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_ALPHA, -6, 6, 1, 0);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA, -6, 6, 1, 0);
+		V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_BETA, -6, 6, 1, 0);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB,
+		V4L2_CID_CODEC_VIDEO_CYCLIC_INTRA_REFRESH_MB,
 		0, INTRA_REFRESH_MBS_MAX, 1, 0);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_GOP_SIZE, 0, (1 << 16) - 1, 1, 30);
+		V4L2_CID_CODEC_VIDEO_GOP_SIZE, 0, (1 << 16) - 1, 1, 30);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_VPX_MIN_QP, 1, 128, 1, 1);
+		V4L2_CID_CODEC_VIDEO_VPX_MIN_QP, 1, 128, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_VPX_MAX_QP, 1, 128, 1, 128);
+		V4L2_CID_CODEC_VIDEO_VPX_MAX_QP, 1, 128, 1, 128);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_B_FRAMES, 0, 4, 1, 0);
+		V4L2_CID_CODEC_VIDEO_B_FRAMES, 0, 4, 1, 0);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_I_PERIOD, 0, (1 << 16) - 1, 1, 0);
+		V4L2_CID_CODEC_VIDEO_H264_I_PERIOD, 0, (1 << 16) - 1, 1, 0);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME, 0, 0, 0, 0);
+			  V4L2_CID_CODEC_VIDEO_FORCE_KEY_FRAME, 0, 0, 0, 0);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE, 0, 1, 1, 1);
+			  V4L2_CID_CODEC_VIDEO_FRAME_RC_ENABLE, 0, 1, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY, 0, 100, 1, 0);
+			  V4L2_CID_CODEC_VIDEO_CONSTANT_QUALITY, 0, 100, 1, 0);
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
-			       V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE,
-			       V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
-			       ~((1 << V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
-			       (1 << V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT)),
-			       V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED);
+			       V4L2_CID_CODEC_VIDEO_FRAME_SKIP_MODE,
+			       V4L2_CODEC_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+			       ~((1 << V4L2_CODEC_VIDEO_FRAME_SKIP_MODE_DISABLED) |
+			       (1 << V4L2_CODEC_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT)),
+			       V4L2_CODEC_VIDEO_FRAME_SKIP_MODE_DISABLED);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID, 0,
+			  V4L2_CID_CODEC_VIDEO_BASELAYER_PRIORITY_ID, 0,
 			  6, 1, 0);
 
 	ret = inst->ctrl_handler.error;
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
index 96d1ecd1521b..6739fbab4c00 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
@@ -346,11 +346,11 @@ struct s5p_mfc_dev {
  * struct s5p_mfc_h264_enc_params - encoding parameters for h264
  */
 struct s5p_mfc_h264_enc_params {
-	enum v4l2_mpeg_video_h264_profile profile;
-	enum v4l2_mpeg_video_h264_loop_filter_mode loop_filter_mode;
+	enum v4l2_codec_video_h264_profile profile;
+	enum v4l2_codec_video_h264_loop_filter_mode loop_filter_mode;
 	s8 loop_filter_alpha;
 	s8 loop_filter_beta;
-	enum v4l2_mpeg_video_h264_entropy_mode entropy_mode;
+	enum v4l2_codec_video_h264_entropy_mode entropy_mode;
 	u8 max_ref_pic;
 	u8 num_ref_pic_4p;
 	int _8x8_transform;
@@ -369,7 +369,7 @@ struct s5p_mfc_h264_enc_params {
 	u8 rc_max_qp;
 	u8 rc_p_frame_qp;
 	u8 rc_b_frame_qp;
-	enum v4l2_mpeg_video_h264_level level_v4l2;
+	enum v4l2_codec_video_h264_level level_v4l2;
 	int level;
 	u16 cpb_size;
 	int interlace;
@@ -396,7 +396,7 @@ struct s5p_mfc_h264_enc_params {
  */
 struct s5p_mfc_mpeg4_enc_params {
 	/* MPEG4 Only */
-	enum v4l2_mpeg_video_mpeg4_profile profile;
+	enum v4l2_codec_video_mpeg4_profile profile;
 	int quarter_pixel;
 	/* Common for MPEG4, H263 */
 	u16 vop_time_res;
@@ -406,7 +406,7 @@ struct s5p_mfc_mpeg4_enc_params {
 	u8 rc_max_qp;
 	u8 rc_p_frame_qp;
 	u8 rc_b_frame_qp;
-	enum v4l2_mpeg_video_mpeg4_level level_v4l2;
+	enum v4l2_codec_video_mpeg4_level level_v4l2;
 	int level;
 };
 
@@ -431,9 +431,9 @@ struct s5p_mfc_vp8_enc_params {
 };
 
 struct s5p_mfc_hevc_enc_params {
-	enum v4l2_mpeg_video_hevc_profile profile;
+	enum v4l2_codec_video_hevc_profile profile;
 	int level;
-	enum v4l2_mpeg_video_h264_level level_v4l2;
+	enum v4l2_codec_video_h264_level level_v4l2;
 	u8 tier;
 	u32 rc_framerate;
 	u8 rc_min_qp;
@@ -462,7 +462,7 @@ struct s5p_mfc_hevc_enc_params {
 	u8 wavefront_enable;
 	u8 enable_ltr;
 	u8 hier_qp_enable;
-	enum v4l2_mpeg_video_hevc_hier_coding_type hier_qp_type;
+	enum v4l2_codec_video_hevc_hier_coding_type hier_qp_type;
 	u8 num_hier_layer;
 	u8 hier_qp_layer[7];
 	u32 hier_bit_layer[7];
@@ -489,7 +489,7 @@ struct s5p_mfc_enc_params {
 	u32 mv_v_range;
 
 	u16 gop_size;
-	enum v4l2_mpeg_video_multi_slice_mode slice_mode;
+	enum v4l2_codec_video_multi_slice_mode slice_mode;
 	u16 slice_mb;
 	u32 slice_bit;
 	u16 intra_refresh_mb;
@@ -504,8 +504,8 @@ struct s5p_mfc_enc_params {
 	u16 vbv_size;
 	u32 vbv_delay;
 
-	enum v4l2_mpeg_video_header_mode seq_hdr_mode;
-	enum v4l2_mpeg_mfc51_video_frame_skip_mode frame_skip_mode;
+	enum v4l2_codec_video_header_mode seq_hdr_mode;
+	enum v4l2_codec_mfc51_video_frame_skip_mode frame_skip_mode;
 	int fixed_target_bit;
 
 	u8 num_b_frame;
@@ -694,12 +694,12 @@ struct s5p_mfc_ctx {
 	size_t me_buffer_size;
 	size_t tmv_buffer_size;
 
-	enum v4l2_mpeg_mfc51_video_force_frame_type force_frame_type;
+	enum v4l2_codec_mfc51_video_force_frame_type force_frame_type;
 
 	struct list_head ref_queue;
 	unsigned int ref_queue_cnt;
 
-	enum v4l2_mpeg_video_multi_slice_mode slice_mode;
+	enum v4l2_codec_video_multi_slice_mode slice_mode;
 	union {
 		unsigned int mb;
 		unsigned int bits;
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
index a71753d459ba..4aa6735a7202 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
@@ -159,7 +159,7 @@ static struct s5p_mfc_fmt *find_format(struct v4l2_format *f, unsigned int t)
 
 static struct mfc_control controls[] = {
 	{
-		.id = V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY,
+		.id = V4L2_CID_CODEC_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "H264 Display Delay",
 		.minimum = 0,
@@ -168,7 +168,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY_ENABLE,
+		.id = V4L2_CID_CODEC_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY_ENABLE,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.name = "H264 Display Delay Enable",
 		.minimum = 0,
@@ -177,7 +177,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER,
+		.id = V4L2_CID_CODEC_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.name = "Mpeg4 Loop Filter Enable",
 		.minimum = 0,
@@ -186,7 +186,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE,
+		.id = V4L2_CID_CODEC_VIDEO_DECODER_SLICE_INTERFACE,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.name = "Slice Interface Enable",
 		.minimum = 0,
@@ -689,16 +689,16 @@ static int s5p_mfc_dec_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct s5p_mfc_ctx *ctx = ctrl_to_ctx(ctrl);
 
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY:
+	case V4L2_CID_CODEC_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY:
 		ctx->display_delay = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY_ENABLE:
+	case V4L2_CID_CODEC_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY_ENABLE:
 		ctx->display_delay_enable = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
+	case V4L2_CID_CODEC_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
 		ctx->loop_filter_mpeg4 = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
+	case V4L2_CID_CODEC_VIDEO_DECODER_SLICE_INTERFACE:
 		ctx->slice_interface = ctrl->val;
 		break;
 	default:
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
index 1fad99edb091..d3401828b73c 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
@@ -111,7 +111,7 @@ static struct s5p_mfc_fmt *find_format(struct v4l2_format *f, unsigned int t)
 
 static struct mfc_control controls[] = {
 	{
-		.id = V4L2_CID_MPEG_VIDEO_GOP_SIZE,
+		.id = V4L2_CID_CODEC_VIDEO_GOP_SIZE,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = (1 << 16) - 1,
@@ -119,15 +119,15 @@ static struct mfc_control controls[] = {
 		.default_value = 12,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE,
+		.id = V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MODE,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
-		.maximum = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES,
-		.default_value = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
+		.minimum = V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_SINGLE,
+		.maximum = V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_MAX_BYTES,
+		.default_value = V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_SINGLE,
 		.menu_skip_mask = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB,
+		.id = V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MAX_MB,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 1,
 		.maximum = (1 << 16) - 1,
@@ -135,7 +135,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES,
+		.id = V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MAX_BYTES,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 1900,
 		.maximum = (1 << 30) - 1,
@@ -143,7 +143,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1900,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB,
+		.id = V4L2_CID_CODEC_VIDEO_CYCLIC_INTRA_REFRESH_MB,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = (1 << 16) - 1,
@@ -151,7 +151,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_MFC51_VIDEO_PADDING,
+		.id = V4L2_CID_CODEC_MFC51_VIDEO_PADDING,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.name = "Padding Control Enable",
 		.minimum = 0,
@@ -160,7 +160,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_MFC51_VIDEO_PADDING_YUV,
+		.id = V4L2_CID_CODEC_MFC51_VIDEO_PADDING_YUV,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "Padding Color YUV Value",
 		.minimum = 0,
@@ -169,7 +169,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE,
+		.id = V4L2_CID_CODEC_VIDEO_FRAME_RC_ENABLE,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.minimum = 0,
 		.maximum = 1,
@@ -177,7 +177,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_BITRATE,
+		.id = V4L2_CID_CODEC_VIDEO_BITRATE,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 1,
 		.maximum = (1 << 30) - 1,
@@ -185,7 +185,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_MFC51_VIDEO_RC_REACTION_COEFF,
+		.id = V4L2_CID_CODEC_MFC51_VIDEO_RC_REACTION_COEFF,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "Rate Control Reaction Coeff.",
 		.minimum = 1,
@@ -194,16 +194,16 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE,
+		.id = V4L2_CID_CODEC_MFC51_VIDEO_FORCE_FRAME_TYPE,
 		.type = V4L2_CTRL_TYPE_MENU,
 		.name = "Force frame type",
-		.minimum = V4L2_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE_DISABLED,
-		.maximum = V4L2_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE_NOT_CODED,
-		.default_value = V4L2_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE_DISABLED,
+		.minimum = V4L2_CODEC_MFC51_VIDEO_FORCE_FRAME_TYPE_DISABLED,
+		.maximum = V4L2_CODEC_MFC51_VIDEO_FORCE_FRAME_TYPE_NOT_CODED,
+		.default_value = V4L2_CODEC_MFC51_VIDEO_FORCE_FRAME_TYPE_DISABLED,
 		.menu_skip_mask = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME,
+		.id = V4L2_CID_CODEC_VIDEO_FORCE_KEY_FRAME,
 		.type = V4L2_CTRL_TYPE_BUTTON,
 		.minimum = 0,
 		.maximum = 0,
@@ -211,7 +211,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_VBV_SIZE,
+		.id = V4L2_CID_CODEC_VIDEO_VBV_SIZE,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = (1 << 16) - 1,
@@ -219,7 +219,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE,
+		.id = V4L2_CID_CODEC_VIDEO_MV_H_SEARCH_RANGE,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "Horizontal MV Search Range",
 		.minimum = 16,
@@ -228,7 +228,7 @@ static struct mfc_control controls[] = {
 		.default_value = 32,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE,
+		.id = V4L2_CID_CODEC_VIDEO_MV_V_SEARCH_RANGE,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "Vertical MV Search Range",
 		.minimum = 16,
@@ -237,7 +237,7 @@ static struct mfc_control controls[] = {
 		.default_value = 32,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE,
+		.id = V4L2_CID_CODEC_VIDEO_H264_CPB_SIZE,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = (1 << 16) - 1,
@@ -245,30 +245,30 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEADER_MODE,
+		.id = V4L2_CID_CODEC_VIDEO_HEADER_MODE,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
-		.maximum = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
-		.default_value = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
+		.minimum = V4L2_CODEC_VIDEO_HEADER_MODE_SEPARATE,
+		.maximum = V4L2_CODEC_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		.default_value = V4L2_CODEC_VIDEO_HEADER_MODE_SEPARATE,
 		.menu_skip_mask = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE,
+		.id = V4L2_CID_CODEC_MFC51_VIDEO_FRAME_SKIP_MODE,
 		.type = V4L2_CTRL_TYPE_MENU,
 		.name = "Frame Skip Enable",
-		.minimum = V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_DISABLED,
-		.maximum = V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+		.minimum = V4L2_CODEC_MFC51_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.maximum = V4L2_CODEC_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
 		.menu_skip_mask = 0,
-		.default_value = V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.default_value = V4L2_CODEC_MFC51_VIDEO_FRAME_SKIP_MODE_DISABLED,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE,
+		.id = V4L2_CID_CODEC_VIDEO_FRAME_SKIP_MODE,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.maximum = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
-		.default_value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.maximum = V4L2_CODEC_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+		.default_value = V4L2_CODEC_VIDEO_FRAME_SKIP_MODE_DISABLED,
 	},
 	{
-		.id = V4L2_CID_MPEG_MFC51_VIDEO_RC_FIXED_TARGET_BIT,
+		.id = V4L2_CID_CODEC_MFC51_VIDEO_RC_FIXED_TARGET_BIT,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.name = "Fixed Target Bit Enable",
 		.minimum = 0,
@@ -278,7 +278,7 @@ static struct mfc_control controls[] = {
 		.menu_skip_mask = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_B_FRAMES,
+		.id = V4L2_CID_CODEC_VIDEO_B_FRAMES,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 2,
@@ -286,42 +286,42 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+		.id = V4L2_CID_CODEC_VIDEO_H264_PROFILE,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
-		.maximum = V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
-		.default_value = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.minimum = V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE,
+		.maximum = V4L2_CODEC_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
+		.default_value = V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE,
 		.menu_skip_mask = ~(
-				(1 << V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
-				(1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
-				(1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)
+				(1 << V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE) |
+				(1 << V4L2_CODEC_VIDEO_H264_PROFILE_MAIN) |
+				(1 << V4L2_CODEC_VIDEO_H264_PROFILE_HIGH)
 				),
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+		.id = V4L2_CID_CODEC_VIDEO_H264_LEVEL,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
-		.maximum = V4L2_MPEG_VIDEO_H264_LEVEL_4_0,
-		.default_value = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.minimum = V4L2_CODEC_VIDEO_H264_LEVEL_1_0,
+		.maximum = V4L2_CODEC_VIDEO_H264_LEVEL_4_0,
+		.default_value = V4L2_CODEC_VIDEO_H264_LEVEL_1_0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL,
+		.id = V4L2_CID_CODEC_VIDEO_MPEG4_LEVEL,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_MPEG_VIDEO_MPEG4_LEVEL_0,
-		.maximum = V4L2_MPEG_VIDEO_MPEG4_LEVEL_5,
-		.default_value = V4L2_MPEG_VIDEO_MPEG4_LEVEL_0,
+		.minimum = V4L2_CODEC_VIDEO_MPEG4_LEVEL_0,
+		.maximum = V4L2_CODEC_VIDEO_MPEG4_LEVEL_5,
+		.default_value = V4L2_CODEC_VIDEO_MPEG4_LEVEL_0,
 		.menu_skip_mask = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE,
+		.id = V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_MODE,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
-		.maximum = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
-		.default_value = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
+		.minimum = V4L2_CODEC_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
+		.maximum = V4L2_CODEC_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
+		.default_value = V4L2_CODEC_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
 		.menu_skip_mask = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA,
+		.id = V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_ALPHA,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = -6,
 		.maximum = 6,
@@ -329,7 +329,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA,
+		.id = V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_BETA,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = -6,
 		.maximum = 6,
@@ -337,15 +337,15 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE,
+		.id = V4L2_CID_CODEC_VIDEO_H264_ENTROPY_MODE,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
-		.maximum = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
-		.default_value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
+		.minimum = V4L2_CODEC_VIDEO_H264_ENTROPY_MODE_CAVLC,
+		.maximum = V4L2_CODEC_VIDEO_H264_ENTROPY_MODE_CABAC,
+		.default_value = V4L2_CODEC_VIDEO_H264_ENTROPY_MODE_CAVLC,
 		.menu_skip_mask = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P,
+		.id = V4L2_CID_CODEC_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "The Number of Ref. Pic for P",
 		.minimum = 1,
@@ -354,7 +354,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM,
+		.id = V4L2_CID_CODEC_VIDEO_H264_8X8_TRANSFORM,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.minimum = 0,
 		.maximum = 1,
@@ -362,7 +362,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE,
+		.id = V4L2_CID_CODEC_VIDEO_MB_RC_ENABLE,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.minimum = 0,
 		.maximum = 1,
@@ -370,7 +370,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP,
+		.id = V4L2_CID_CODEC_VIDEO_H264_I_FRAME_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 51,
@@ -378,7 +378,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_MIN_QP,
+		.id = V4L2_CID_CODEC_VIDEO_H264_MIN_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 51,
@@ -386,7 +386,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_MAX_QP,
+		.id = V4L2_CID_CODEC_VIDEO_H264_MAX_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 51,
@@ -394,7 +394,7 @@ static struct mfc_control controls[] = {
 		.default_value = 51,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP,
+		.id = V4L2_CID_CODEC_VIDEO_H264_P_FRAME_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 51,
@@ -402,7 +402,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP,
+		.id = V4L2_CID_CODEC_VIDEO_H264_B_FRAME_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 51,
@@ -410,7 +410,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP,
+		.id = V4L2_CID_CODEC_VIDEO_H263_I_FRAME_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "H263 I-Frame QP value",
 		.minimum = 1,
@@ -419,7 +419,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H263_MIN_QP,
+		.id = V4L2_CID_CODEC_VIDEO_H263_MIN_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "H263 Minimum QP value",
 		.minimum = 1,
@@ -428,7 +428,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H263_MAX_QP,
+		.id = V4L2_CID_CODEC_VIDEO_H263_MAX_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "H263 Maximum QP value",
 		.minimum = 1,
@@ -437,7 +437,7 @@ static struct mfc_control controls[] = {
 		.default_value = 31,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP,
+		.id = V4L2_CID_CODEC_VIDEO_H263_P_FRAME_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "H263 P frame QP value",
 		.minimum = 1,
@@ -446,7 +446,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP,
+		.id = V4L2_CID_CODEC_VIDEO_H263_B_FRAME_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "H263 B frame QP value",
 		.minimum = 1,
@@ -455,7 +455,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP,
+		.id = V4L2_CID_CODEC_VIDEO_MPEG4_I_FRAME_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "MPEG4 I-Frame QP value",
 		.minimum = 1,
@@ -464,7 +464,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP,
+		.id = V4L2_CID_CODEC_VIDEO_MPEG4_MIN_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "MPEG4 Minimum QP value",
 		.minimum = 1,
@@ -473,7 +473,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP,
+		.id = V4L2_CID_CODEC_VIDEO_MPEG4_MAX_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "MPEG4 Maximum QP value",
 		.minimum = 0,
@@ -482,7 +482,7 @@ static struct mfc_control controls[] = {
 		.default_value = 51,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP,
+		.id = V4L2_CID_CODEC_VIDEO_MPEG4_P_FRAME_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "MPEG4 P frame QP value",
 		.minimum = 1,
@@ -491,7 +491,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP,
+		.id = V4L2_CID_CODEC_VIDEO_MPEG4_B_FRAME_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "MPEG4 B frame QP value",
 		.minimum = 1,
@@ -500,7 +500,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_DARK,
+		.id = V4L2_CID_CODEC_MFC51_VIDEO_H264_ADAPTIVE_RC_DARK,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.name = "H264 Dark Reg Adaptive RC",
 		.minimum = 0,
@@ -509,7 +509,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_SMOOTH,
+		.id = V4L2_CID_CODEC_MFC51_VIDEO_H264_ADAPTIVE_RC_SMOOTH,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.name = "H264 Smooth Reg Adaptive RC",
 		.minimum = 0,
@@ -518,7 +518,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_STATIC,
+		.id = V4L2_CID_CODEC_MFC51_VIDEO_H264_ADAPTIVE_RC_STATIC,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.name = "H264 Static Reg Adaptive RC",
 		.minimum = 0,
@@ -527,7 +527,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_ACTIVITY,
+		.id = V4L2_CID_CODEC_MFC51_VIDEO_H264_ADAPTIVE_RC_ACTIVITY,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.name = "H264 Activity Reg Adaptive RC",
 		.minimum = 0,
@@ -536,7 +536,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE,
+		.id = V4L2_CID_CODEC_VIDEO_H264_VUI_SAR_ENABLE,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.minimum = 0,
 		.maximum = 1,
@@ -544,15 +544,15 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC,
+		.id = V4L2_CID_CODEC_VIDEO_H264_VUI_SAR_IDC,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_UNSPECIFIED,
-		.maximum = V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED,
-		.default_value = V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_UNSPECIFIED,
+		.minimum = V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_UNSPECIFIED,
+		.maximum = V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_EXTENDED,
+		.default_value = V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_UNSPECIFIED,
 		.menu_skip_mask = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH,
+		.id = V4L2_CID_CODEC_VIDEO_H264_VUI_EXT_SAR_WIDTH,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = (1 << 16) - 1,
@@ -560,7 +560,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT,
+		.id = V4L2_CID_CODEC_VIDEO_H264_VUI_EXT_SAR_HEIGHT,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = (1 << 16) - 1,
@@ -568,7 +568,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_GOP_CLOSURE,
+		.id = V4L2_CID_CODEC_VIDEO_GOP_CLOSURE,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.minimum = 0,
 		.maximum = 1,
@@ -576,7 +576,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_I_PERIOD,
+		.id = V4L2_CID_CODEC_VIDEO_H264_I_PERIOD,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = (1 << 16) - 1,
@@ -584,15 +584,15 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE,
+		.id = V4L2_CID_CODEC_VIDEO_MPEG4_PROFILE,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE,
-		.maximum = V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE,
-		.default_value = V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE,
+		.minimum = V4L2_CODEC_VIDEO_MPEG4_PROFILE_SIMPLE,
+		.maximum = V4L2_CODEC_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE,
+		.default_value = V4L2_CODEC_VIDEO_MPEG4_PROFILE_SIMPLE,
 		.menu_skip_mask = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_MPEG4_QPEL,
+		.id = V4L2_CID_CODEC_VIDEO_MPEG4_QPEL,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.minimum = 0,
 		.maximum = 1,
@@ -600,14 +600,14 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS,
+		.id = V4L2_CID_CODEC_VIDEO_VPX_NUM_PARTITIONS,
 		.type = V4L2_CTRL_TYPE_INTEGER_MENU,
-		.maximum = V4L2_CID_MPEG_VIDEO_VPX_8_PARTITIONS,
-		.default_value = V4L2_CID_MPEG_VIDEO_VPX_1_PARTITION,
+		.maximum = V4L2_CID_CODEC_VIDEO_VPX_8_PARTITIONS,
+		.default_value = V4L2_CID_CODEC_VIDEO_VPX_1_PARTITION,
 		.menu_skip_mask = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_VPX_IMD_DISABLE_4X4,
+		.id = V4L2_CID_CODEC_VIDEO_VPX_IMD_DISABLE_4X4,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.minimum = 0,
 		.maximum = 1,
@@ -615,14 +615,14 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_VPX_NUM_REF_FRAMES,
+		.id = V4L2_CID_CODEC_VIDEO_VPX_NUM_REF_FRAMES,
 		.type = V4L2_CTRL_TYPE_INTEGER_MENU,
-		.maximum = V4L2_CID_MPEG_VIDEO_VPX_2_REF_FRAME,
-		.default_value = V4L2_CID_MPEG_VIDEO_VPX_1_REF_FRAME,
+		.maximum = V4L2_CID_CODEC_VIDEO_VPX_2_REF_FRAME,
+		.default_value = V4L2_CID_CODEC_VIDEO_VPX_1_REF_FRAME,
 		.menu_skip_mask = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_VPX_FILTER_LEVEL,
+		.id = V4L2_CID_CODEC_VIDEO_VPX_FILTER_LEVEL,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 63,
@@ -630,7 +630,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_VPX_FILTER_SHARPNESS,
+		.id = V4L2_CID_CODEC_VIDEO_VPX_FILTER_SHARPNESS,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 7,
@@ -638,7 +638,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_REF_PERIOD,
+		.id = V4L2_CID_CODEC_VIDEO_VPX_GOLDEN_FRAME_REF_PERIOD,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = (1 << 16) - 1,
@@ -646,15 +646,15 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL,
+		.id = V4L2_CID_CODEC_VIDEO_VPX_GOLDEN_FRAME_SEL,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_USE_PREV,
-		.maximum = V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_USE_REF_PERIOD,
-		.default_value = V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_USE_PREV,
+		.minimum = V4L2_CID_CODEC_VIDEO_VPX_GOLDEN_FRAME_USE_PREV,
+		.maximum = V4L2_CID_CODEC_VIDEO_VPX_GOLDEN_FRAME_USE_REF_PERIOD,
+		.default_value = V4L2_CID_CODEC_VIDEO_VPX_GOLDEN_FRAME_USE_PREV,
 		.menu_skip_mask = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_VPX_MAX_QP,
+		.id = V4L2_CID_CODEC_VIDEO_VPX_MAX_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 127,
@@ -662,7 +662,7 @@ static struct mfc_control controls[] = {
 		.default_value = 127,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_VPX_MIN_QP,
+		.id = V4L2_CID_CODEC_VIDEO_VPX_MIN_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 11,
@@ -670,7 +670,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_VPX_I_FRAME_QP,
+		.id = V4L2_CID_CODEC_VIDEO_VPX_I_FRAME_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 127,
@@ -678,7 +678,7 @@ static struct mfc_control controls[] = {
 		.default_value = 10,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP,
+		.id = V4L2_CID_CODEC_VIDEO_VPX_P_FRAME_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 127,
@@ -686,15 +686,15 @@ static struct mfc_control controls[] = {
 		.default_value = 10,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_VP8_PROFILE,
+		.id = V4L2_CID_CODEC_VIDEO_VP8_PROFILE,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_MPEG_VIDEO_VP8_PROFILE_0,
-		.maximum = V4L2_MPEG_VIDEO_VP8_PROFILE_3,
-		.default_value = V4L2_MPEG_VIDEO_VP8_PROFILE_0,
+		.minimum = V4L2_CODEC_VIDEO_VP8_PROFILE_0,
+		.maximum = V4L2_CODEC_VIDEO_VP8_PROFILE_3,
+		.default_value = V4L2_CODEC_VIDEO_VP8_PROFILE_0,
 		.menu_skip_mask = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_I_FRAME_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "HEVC I Frame QP Value",
 		.minimum = 0,
@@ -703,7 +703,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_P_FRAME_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "HEVC P Frame QP Value",
 		.minimum = 0,
@@ -712,7 +712,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_B_FRAME_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 51,
@@ -720,7 +720,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 51,
@@ -728,7 +728,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 51,
@@ -736,31 +736,31 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_PROFILE,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
-		.maximum = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+		.minimum = V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN,
+		.maximum = V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
 		.step = 1,
-		.default_value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.default_value = V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_LEVEL,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
-		.maximum = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
+		.minimum = V4L2_CODEC_VIDEO_HEVC_LEVEL_1,
+		.maximum = V4L2_CODEC_VIDEO_HEVC_LEVEL_6_2,
 		.step = 1,
-		.default_value = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.default_value = V4L2_CODEC_VIDEO_HEVC_LEVEL_1,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_TIER,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_TIER,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
-		.maximum = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
+		.minimum = V4L2_CODEC_VIDEO_HEVC_TIER_MAIN,
+		.maximum = V4L2_CODEC_VIDEO_HEVC_TIER_HIGH,
 		.step = 1,
-		.default_value = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
+		.default_value = V4L2_CODEC_VIDEO_HEVC_TIER_MAIN,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_FRAME_RATE_RESOLUTION,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_FRAME_RATE_RESOLUTION,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 1,
 		.maximum = (1 << 16) - 1,
@@ -768,7 +768,7 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_MAX_PARTITION_DEPTH,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_MAX_PARTITION_DEPTH,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 1,
@@ -776,7 +776,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES,
+		.id = V4L2_CID_CODEC_VIDEO_REF_NUMBER_FOR_PFRAMES,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 1,
 		.maximum = 2,
@@ -784,15 +784,15 @@ static struct mfc_control controls[] = {
 		.default_value = 1,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_REFRESH_TYPE,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_MPEG_VIDEO_HEVC_REFRESH_NONE,
-		.maximum = V4L2_MPEG_VIDEO_HEVC_REFRESH_IDR,
+		.minimum = V4L2_CODEC_VIDEO_HEVC_REFRESH_NONE,
+		.maximum = V4L2_CODEC_VIDEO_HEVC_REFRESH_IDR,
 		.step = 1,
-		.default_value = V4L2_MPEG_VIDEO_HEVC_REFRESH_NONE,
+		.default_value = V4L2_CODEC_VIDEO_HEVC_REFRESH_NONE,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_CONST_INTRA_PRED,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_CONST_INTRA_PRED,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.minimum = 0,
 		.maximum = 1,
@@ -800,7 +800,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_LOSSLESS_CU,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_LOSSLESS_CU,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.minimum = 0,
 		.maximum = 1,
@@ -808,7 +808,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_WAVEFRONT,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_WAVEFRONT,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.minimum = 0,
 		.maximum = 1,
@@ -816,15 +816,15 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_LOOP_FILTER_MODE,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED,
-		.maximum = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
+		.minimum = V4L2_CODEC_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED,
+		.maximum = V4L2_CODEC_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
 		.step = 1,
-		.default_value = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED,
+		.default_value = V4L2_CODEC_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIER_QP,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_HIER_QP,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.minimum = 0,
 		.maximum = 1,
@@ -832,15 +832,15 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_TYPE,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B,
-		.maximum = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
+		.minimum = V4L2_CODEC_VIDEO_HEVC_HIERARCHICAL_CODING_B,
+		.maximum = V4L2_CODEC_VIDEO_HEVC_HIERARCHICAL_CODING_P,
 		.step = 1,
-		.default_value = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B,
+		.default_value = V4L2_CODEC_VIDEO_HEVC_HIERARCHICAL_CODING_B,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_LAYER,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 6,
@@ -848,7 +848,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_QP,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L0_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 51,
@@ -856,7 +856,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_QP,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L1_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 51,
@@ -864,7 +864,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_QP,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L2_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 51,
@@ -872,7 +872,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_QP,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L3_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 51,
@@ -880,7 +880,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_QP,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L4_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 51,
@@ -888,7 +888,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_QP,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L5_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 51,
@@ -896,7 +896,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_QP,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L6_QP,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 51,
@@ -904,7 +904,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_BR,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L0_BR,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = INT_MIN,
 		.maximum = INT_MAX,
@@ -912,7 +912,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_BR,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L1_BR,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = INT_MIN,
 		.maximum = INT_MAX,
@@ -920,7 +920,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_BR,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L2_BR,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = INT_MIN,
 		.maximum = INT_MAX,
@@ -928,7 +928,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_BR,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L3_BR,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = INT_MIN,
 		.maximum = INT_MAX,
@@ -936,7 +936,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L4_BR,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = INT_MIN,
 		.maximum = INT_MAX,
@@ -944,7 +944,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L5_BR,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = INT_MIN,
 		.maximum = INT_MAX,
@@ -952,7 +952,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L6_BR,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = INT_MIN,
 		.maximum = INT_MAX,
@@ -960,7 +960,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_GENERAL_PB,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_GENERAL_PB,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.minimum = 0,
 		.maximum = 1,
@@ -968,7 +968,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_TEMPORAL_ID,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_TEMPORAL_ID,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.minimum = 0,
 		.maximum = 1,
@@ -976,7 +976,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_STRONG_SMOOTHING,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_STRONG_SMOOTHING,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.minimum = 0,
 		.maximum = 1,
@@ -984,7 +984,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_INTRA_PU_SPLIT,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_INTRA_PU_SPLIT,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.minimum = 0,
 		.maximum = 1,
@@ -992,7 +992,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_TMV_PREDICTION,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_TMV_PREDICTION,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.minimum = 0,
 		.maximum = 1,
@@ -1000,7 +1000,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 4,
@@ -1008,7 +1008,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_WITHOUT_STARTCODE,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_WITHOUT_STARTCODE,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
 		.minimum = 0,
 		.maximum = 1,
@@ -1016,7 +1016,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERIOD,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_REFRESH_PERIOD,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = (1 << 16) - 1,
@@ -1024,7 +1024,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_LF_BETA_OFFSET_DIV2,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = -6,
 		.maximum = 6,
@@ -1032,7 +1032,7 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_LF_TC_OFFSET_DIV2,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = -6,
 		.maximum = 6,
@@ -1040,15 +1040,15 @@ static struct mfc_control controls[] = {
 		.default_value = 0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD,
+		.id = V4L2_CID_CODEC_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD,
 		.type = V4L2_CTRL_TYPE_MENU,
-		.minimum = V4L2_MPEG_VIDEO_HEVC_SIZE_0,
-		.maximum = V4L2_MPEG_VIDEO_HEVC_SIZE_4,
+		.minimum = V4L2_CODEC_VIDEO_HEVC_SIZE_0,
+		.maximum = V4L2_CODEC_VIDEO_HEVC_SIZE_4,
 		.step = 1,
-		.default_value = V4L2_MPEG_VIDEO_HEVC_SIZE_0,
+		.default_value = V4L2_CODEC_VIDEO_HEVC_SIZE_0,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR,
+		.id = V4L2_CID_CODEC_VIDEO_PREPEND_SPSPPS_TO_IDR,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.minimum = 0,
 		.maximum = 1,
@@ -1083,9 +1083,9 @@ static const char * const *mfc51_get_menu(u32 id)
 		NULL,
 	};
 	switch (id) {
-	case V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE:
+	case V4L2_CID_CODEC_MFC51_VIDEO_FRAME_SKIP_MODE:
 		return mfc51_video_frame_skip;
-	case V4L2_CID_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE:
+	case V4L2_CID_CODEC_MFC51_VIDEO_FORCE_FRAME_TYPE:
 		return mfc51_video_force_frame;
 	}
 	return NULL;
@@ -1152,7 +1152,7 @@ static int enc_post_seq_start(struct s5p_mfc_ctx *ctx)
 	struct s5p_mfc_buf *dst_mb;
 	unsigned int enc_pb_count;
 
-	if (p->seq_hdr_mode == V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) {
+	if (p->seq_hdr_mode == V4L2_CODEC_VIDEO_HEADER_MODE_SEPARATE) {
 		if (!list_empty(&ctx->dst_queue)) {
 			dst_mb = list_entry(ctx->dst_queue.next,
 					struct s5p_mfc_buf, list);
@@ -1677,103 +1677,103 @@ static int vidioc_streamoff(struct file *file, void *priv,
 	return -EINVAL;
 }
 
-static inline int h264_level(enum v4l2_mpeg_video_h264_level lvl)
+static inline int h264_level(enum v4l2_codec_video_h264_level lvl)
 {
-	static unsigned int t[V4L2_MPEG_VIDEO_H264_LEVEL_4_0 + 1] = {
-		/* V4L2_MPEG_VIDEO_H264_LEVEL_1_0   */ 10,
-		/* V4L2_MPEG_VIDEO_H264_LEVEL_1B    */ 9,
-		/* V4L2_MPEG_VIDEO_H264_LEVEL_1_1   */ 11,
-		/* V4L2_MPEG_VIDEO_H264_LEVEL_1_2   */ 12,
-		/* V4L2_MPEG_VIDEO_H264_LEVEL_1_3   */ 13,
-		/* V4L2_MPEG_VIDEO_H264_LEVEL_2_0   */ 20,
-		/* V4L2_MPEG_VIDEO_H264_LEVEL_2_1   */ 21,
-		/* V4L2_MPEG_VIDEO_H264_LEVEL_2_2   */ 22,
-		/* V4L2_MPEG_VIDEO_H264_LEVEL_3_0   */ 30,
-		/* V4L2_MPEG_VIDEO_H264_LEVEL_3_1   */ 31,
-		/* V4L2_MPEG_VIDEO_H264_LEVEL_3_2   */ 32,
-		/* V4L2_MPEG_VIDEO_H264_LEVEL_4_0   */ 40,
+	static unsigned int t[V4L2_CODEC_VIDEO_H264_LEVEL_4_0 + 1] = {
+		/* V4L2_CODEC_VIDEO_H264_LEVEL_1_0   */ 10,
+		/* V4L2_CODEC_VIDEO_H264_LEVEL_1B    */ 9,
+		/* V4L2_CODEC_VIDEO_H264_LEVEL_1_1   */ 11,
+		/* V4L2_CODEC_VIDEO_H264_LEVEL_1_2   */ 12,
+		/* V4L2_CODEC_VIDEO_H264_LEVEL_1_3   */ 13,
+		/* V4L2_CODEC_VIDEO_H264_LEVEL_2_0   */ 20,
+		/* V4L2_CODEC_VIDEO_H264_LEVEL_2_1   */ 21,
+		/* V4L2_CODEC_VIDEO_H264_LEVEL_2_2   */ 22,
+		/* V4L2_CODEC_VIDEO_H264_LEVEL_3_0   */ 30,
+		/* V4L2_CODEC_VIDEO_H264_LEVEL_3_1   */ 31,
+		/* V4L2_CODEC_VIDEO_H264_LEVEL_3_2   */ 32,
+		/* V4L2_CODEC_VIDEO_H264_LEVEL_4_0   */ 40,
 	};
 	return t[lvl];
 }
 
-static inline int mpeg4_level(enum v4l2_mpeg_video_mpeg4_level lvl)
+static inline int mpeg4_level(enum v4l2_codec_video_mpeg4_level lvl)
 {
-	static unsigned int t[V4L2_MPEG_VIDEO_MPEG4_LEVEL_5 + 1] = {
-		/* V4L2_MPEG_VIDEO_MPEG4_LEVEL_0    */ 0,
-		/* V4L2_MPEG_VIDEO_MPEG4_LEVEL_0B   */ 9,
-		/* V4L2_MPEG_VIDEO_MPEG4_LEVEL_1    */ 1,
-		/* V4L2_MPEG_VIDEO_MPEG4_LEVEL_2    */ 2,
-		/* V4L2_MPEG_VIDEO_MPEG4_LEVEL_3    */ 3,
-		/* V4L2_MPEG_VIDEO_MPEG4_LEVEL_3B   */ 7,
-		/* V4L2_MPEG_VIDEO_MPEG4_LEVEL_4    */ 4,
-		/* V4L2_MPEG_VIDEO_MPEG4_LEVEL_5    */ 5,
+	static unsigned int t[V4L2_CODEC_VIDEO_MPEG4_LEVEL_5 + 1] = {
+		/* V4L2_CODEC_VIDEO_MPEG4_LEVEL_0    */ 0,
+		/* V4L2_CODEC_VIDEO_MPEG4_LEVEL_0B   */ 9,
+		/* V4L2_CODEC_VIDEO_MPEG4_LEVEL_1    */ 1,
+		/* V4L2_CODEC_VIDEO_MPEG4_LEVEL_2    */ 2,
+		/* V4L2_CODEC_VIDEO_MPEG4_LEVEL_3    */ 3,
+		/* V4L2_CODEC_VIDEO_MPEG4_LEVEL_3B   */ 7,
+		/* V4L2_CODEC_VIDEO_MPEG4_LEVEL_4    */ 4,
+		/* V4L2_CODEC_VIDEO_MPEG4_LEVEL_5    */ 5,
 	};
 	return t[lvl];
 }
 
-static inline int hevc_level(enum v4l2_mpeg_video_hevc_level lvl)
+static inline int hevc_level(enum v4l2_codec_video_hevc_level lvl)
 {
 	static unsigned int t[] = {
-		/* V4L2_MPEG_VIDEO_HEVC_LEVEL_1    */ 10,
-		/* V4L2_MPEG_VIDEO_HEVC_LEVEL_2    */ 20,
-		/* V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1  */ 21,
-		/* V4L2_MPEG_VIDEO_HEVC_LEVEL_3    */ 30,
-		/* V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1  */ 31,
-		/* V4L2_MPEG_VIDEO_HEVC_LEVEL_4    */ 40,
-		/* V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1  */ 41,
-		/* V4L2_MPEG_VIDEO_HEVC_LEVEL_5    */ 50,
-		/* V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1  */ 51,
-		/* V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2  */ 52,
-		/* V4L2_MPEG_VIDEO_HEVC_LEVEL_6    */ 60,
-		/* V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1  */ 61,
-		/* V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2  */ 62,
+		/* V4L2_CODEC_VIDEO_HEVC_LEVEL_1    */ 10,
+		/* V4L2_CODEC_VIDEO_HEVC_LEVEL_2    */ 20,
+		/* V4L2_CODEC_VIDEO_HEVC_LEVEL_2_1  */ 21,
+		/* V4L2_CODEC_VIDEO_HEVC_LEVEL_3    */ 30,
+		/* V4L2_CODEC_VIDEO_HEVC_LEVEL_3_1  */ 31,
+		/* V4L2_CODEC_VIDEO_HEVC_LEVEL_4    */ 40,
+		/* V4L2_CODEC_VIDEO_HEVC_LEVEL_4_1  */ 41,
+		/* V4L2_CODEC_VIDEO_HEVC_LEVEL_5    */ 50,
+		/* V4L2_CODEC_VIDEO_HEVC_LEVEL_5_1  */ 51,
+		/* V4L2_CODEC_VIDEO_HEVC_LEVEL_5_2  */ 52,
+		/* V4L2_CODEC_VIDEO_HEVC_LEVEL_6    */ 60,
+		/* V4L2_CODEC_VIDEO_HEVC_LEVEL_6_1  */ 61,
+		/* V4L2_CODEC_VIDEO_HEVC_LEVEL_6_2  */ 62,
 	};
 	return t[lvl];
 }
 
-static inline int vui_sar_idc(enum v4l2_mpeg_video_h264_vui_sar_idc sar)
+static inline int vui_sar_idc(enum v4l2_codec_video_h264_vui_sar_idc sar)
 {
-	static unsigned int t[V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED + 1] = {
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_UNSPECIFIED     */ 0,
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_1x1             */ 1,
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_12x11           */ 2,
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_10x11           */ 3,
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_16x11           */ 4,
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_40x33           */ 5,
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_24x11           */ 6,
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_20x11           */ 7,
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_32x11           */ 8,
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_80x33           */ 9,
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_18x11           */ 10,
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_15x11           */ 11,
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_64x33           */ 12,
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_160x99          */ 13,
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_4x3             */ 14,
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_3x2             */ 15,
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_2x1             */ 16,
-		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED        */ 255,
+	static unsigned int t[V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_EXTENDED + 1] = {
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_UNSPECIFIED     */ 0,
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_1x1             */ 1,
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_12x11           */ 2,
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_10x11           */ 3,
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_16x11           */ 4,
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_40x33           */ 5,
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_24x11           */ 6,
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_20x11           */ 7,
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_32x11           */ 8,
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_80x33           */ 9,
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_18x11           */ 10,
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_15x11           */ 11,
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_64x33           */ 12,
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_160x99          */ 13,
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_4x3             */ 14,
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_3x2             */ 15,
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_2x1             */ 16,
+		/* V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_EXTENDED        */ 255,
 	};
 	return t[sar];
 }
 
 /*
  * Update range of all HEVC quantization parameter controls that depend on the
- * V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP, V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP controls.
+ * V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP, V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP controls.
  */
 static void __enc_update_hevc_qp_ctrls_range(struct s5p_mfc_ctx *ctx,
 					     int min, int max)
 {
 	static const int __hevc_qp_ctrls[] = {
-		V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP,
-		V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP,
-		V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP,
-		V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_QP,
-		V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_QP,
-		V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_QP,
-		V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_QP,
-		V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_QP,
-		V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_QP,
-		V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_QP,
+		V4L2_CID_CODEC_VIDEO_HEVC_I_FRAME_QP,
+		V4L2_CID_CODEC_VIDEO_HEVC_P_FRAME_QP,
+		V4L2_CID_CODEC_VIDEO_HEVC_B_FRAME_QP,
+		V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L0_QP,
+		V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L1_QP,
+		V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L2_QP,
+		V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L3_QP,
+		V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L4_QP,
+		V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L5_QP,
+		V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L6_QP,
 	};
 	struct v4l2_ctrl *ctrl = NULL;
 	int i, j;
@@ -1800,85 +1800,85 @@ static int s5p_mfc_enc_s_ctrl(struct v4l2_ctrl *ctrl)
 	int ret = 0;
 
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
+	case V4L2_CID_CODEC_VIDEO_GOP_SIZE:
 		p->gop_size = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
+	case V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MODE:
 		p->slice_mode = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
+	case V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MAX_MB:
 		p->slice_mb = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:
+	case V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MAX_BYTES:
 		p->slice_bit = ctrl->val * 8;
 		break;
-	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:
+	case V4L2_CID_CODEC_VIDEO_CYCLIC_INTRA_REFRESH_MB:
 		p->intra_refresh_mb = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_MFC51_VIDEO_PADDING:
+	case V4L2_CID_CODEC_MFC51_VIDEO_PADDING:
 		p->pad = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_MFC51_VIDEO_PADDING_YUV:
+	case V4L2_CID_CODEC_MFC51_VIDEO_PADDING_YUV:
 		p->pad_luma = (ctrl->val >> 16) & 0xff;
 		p->pad_cb = (ctrl->val >> 8) & 0xff;
 		p->pad_cr = (ctrl->val >> 0) & 0xff;
 		break;
-	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
+	case V4L2_CID_CODEC_VIDEO_FRAME_RC_ENABLE:
 		p->rc_frame = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE:
 		p->rc_bitrate = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_MFC51_VIDEO_RC_REACTION_COEFF:
+	case V4L2_CID_CODEC_MFC51_VIDEO_RC_REACTION_COEFF:
 		p->rc_reaction_coeff = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE:
+	case V4L2_CID_CODEC_MFC51_VIDEO_FORCE_FRAME_TYPE:
 		ctx->force_frame_type = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
+	case V4L2_CID_CODEC_VIDEO_FORCE_KEY_FRAME:
 		ctx->force_frame_type =
-			V4L2_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE_I_FRAME;
+			V4L2_CODEC_MFC51_VIDEO_FORCE_FRAME_TYPE_I_FRAME;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VBV_SIZE:
+	case V4L2_CID_CODEC_VIDEO_VBV_SIZE:
 		p->vbv_size = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
+	case V4L2_CID_CODEC_VIDEO_MV_H_SEARCH_RANGE:
 		p->mv_h_range = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
+	case V4L2_CID_CODEC_VIDEO_MV_V_SEARCH_RANGE:
 		p->mv_v_range = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE:
+	case V4L2_CID_CODEC_VIDEO_H264_CPB_SIZE:
 		p->codec.h264.cpb_size = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
+	case V4L2_CID_CODEC_VIDEO_HEADER_MODE:
 		p->seq_hdr_mode = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE:
-	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
+	case V4L2_CID_CODEC_MFC51_VIDEO_FRAME_SKIP_MODE:
+	case V4L2_CID_CODEC_VIDEO_FRAME_SKIP_MODE:
 		p->frame_skip_mode = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_MFC51_VIDEO_RC_FIXED_TARGET_BIT:
+	case V4L2_CID_CODEC_MFC51_VIDEO_RC_FIXED_TARGET_BIT:
 		p->fixed_target_bit = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
+	case V4L2_CID_CODEC_VIDEO_B_FRAMES:
 		p->num_b_frame = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_H264_PROFILE:
 		switch (ctrl->val) {
-		case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
+		case V4L2_CODEC_VIDEO_H264_PROFILE_MAIN:
 			p->codec.h264.profile =
 					S5P_FIMV_ENC_PROFILE_H264_MAIN;
 			break;
-		case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
+		case V4L2_CODEC_VIDEO_H264_PROFILE_HIGH:
 			p->codec.h264.profile =
 					S5P_FIMV_ENC_PROFILE_H264_HIGH;
 			break;
-		case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
+		case V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE:
 			p->codec.h264.profile =
 				S5P_FIMV_ENC_PROFILE_H264_BASELINE;
 			break;
-		case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
+		case V4L2_CODEC_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
 			if (IS_MFCV6_PLUS(dev))
 				p->codec.h264.profile =
 				S5P_FIMV_ENC_PROFILE_H264_CONSTRAINED_BASELINE;
@@ -1889,7 +1889,7 @@ static int s5p_mfc_enc_s_ctrl(struct v4l2_ctrl *ctrl)
 			ret = -EINVAL;
 		}
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_H264_LEVEL:
 		p->codec.h264.level_v4l2 = ctrl->val;
 		p->codec.h264.level = h264_level(ctrl->val);
 		if (p->codec.h264.level < 0) {
@@ -1897,7 +1897,7 @@ static int s5p_mfc_enc_s_ctrl(struct v4l2_ctrl *ctrl)
 			ret = p->codec.h264.level;
 		}
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_LEVEL:
 		p->codec.mpeg4.level_v4l2 = ctrl->val;
 		p->codec.mpeg4.level = mpeg4_level(ctrl->val);
 		if (p->codec.mpeg4.level < 0) {
@@ -1905,99 +1905,99 @@ static int s5p_mfc_enc_s_ctrl(struct v4l2_ctrl *ctrl)
 			ret = p->codec.mpeg4.level;
 		}
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:
+	case V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_MODE:
 		p->codec.h264.loop_filter_mode = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA:
+	case V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_ALPHA:
 		p->codec.h264.loop_filter_alpha = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA:
+	case V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_BETA:
 		p->codec.h264.loop_filter_beta = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
+	case V4L2_CID_CODEC_VIDEO_H264_ENTROPY_MODE:
 		p->codec.h264.entropy_mode = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P:
+	case V4L2_CID_CODEC_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P:
 		p->codec.h264.num_ref_pic_4p = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
+	case V4L2_CID_CODEC_VIDEO_H264_8X8_TRANSFORM:
 		p->codec.h264._8x8_transform = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
+	case V4L2_CID_CODEC_VIDEO_MB_RC_ENABLE:
 		p->rc_mb = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_I_FRAME_QP:
 		p->codec.h264.rc_frame_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_MIN_QP:
 		p->codec.h264.rc_min_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_MAX_QP:
 		p->codec.h264.rc_max_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_P_FRAME_QP:
 		p->codec.h264.rc_p_frame_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_B_FRAME_QP:
 		p->codec.h264.rc_b_frame_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:
-	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_I_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_H263_I_FRAME_QP:
 		p->codec.mpeg4.rc_frame_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP:
-	case V4L2_CID_MPEG_VIDEO_H263_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_H263_MIN_QP:
 		p->codec.mpeg4.rc_min_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP:
-	case V4L2_CID_MPEG_VIDEO_H263_MAX_QP:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_MAX_QP:
+	case V4L2_CID_CODEC_VIDEO_H263_MAX_QP:
 		p->codec.mpeg4.rc_max_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP:
-	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_P_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_H263_P_FRAME_QP:
 		p->codec.mpeg4.rc_p_frame_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP:
-	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_B_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_H263_B_FRAME_QP:
 		p->codec.mpeg4.rc_b_frame_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_DARK:
+	case V4L2_CID_CODEC_MFC51_VIDEO_H264_ADAPTIVE_RC_DARK:
 		p->codec.h264.rc_mb_dark = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_SMOOTH:
+	case V4L2_CID_CODEC_MFC51_VIDEO_H264_ADAPTIVE_RC_SMOOTH:
 		p->codec.h264.rc_mb_smooth = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_STATIC:
+	case V4L2_CID_CODEC_MFC51_VIDEO_H264_ADAPTIVE_RC_STATIC:
 		p->codec.h264.rc_mb_static = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_ACTIVITY:
+	case V4L2_CID_CODEC_MFC51_VIDEO_H264_ADAPTIVE_RC_ACTIVITY:
 		p->codec.h264.rc_mb_activity = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
+	case V4L2_CID_CODEC_VIDEO_H264_VUI_SAR_ENABLE:
 		p->codec.h264.vui_sar = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
+	case V4L2_CID_CODEC_VIDEO_H264_VUI_SAR_IDC:
 		p->codec.h264.vui_sar_idc = vui_sar_idc(ctrl->val);
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH:
+	case V4L2_CID_CODEC_VIDEO_H264_VUI_EXT_SAR_WIDTH:
 		p->codec.h264.vui_ext_sar_width = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT:
+	case V4L2_CID_CODEC_VIDEO_H264_VUI_EXT_SAR_HEIGHT:
 		p->codec.h264.vui_ext_sar_height = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_GOP_CLOSURE:
+	case V4L2_CID_CODEC_VIDEO_GOP_CLOSURE:
 		p->codec.h264.open_gop = !ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_I_PERIOD:
+	case V4L2_CID_CODEC_VIDEO_H264_I_PERIOD:
 		p->codec.h264.open_gop_size = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_PROFILE:
 		switch (ctrl->val) {
-		case V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE:
+		case V4L2_CODEC_VIDEO_MPEG4_PROFILE_SIMPLE:
 			p->codec.mpeg4.profile =
 				S5P_FIMV_ENC_PROFILE_MPEG4_SIMPLE;
 			break;
-		case V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE:
+		case V4L2_CODEC_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE:
 			p->codec.mpeg4.profile =
 			S5P_FIMV_ENC_PROFILE_MPEG4_ADVANCED_SIMPLE;
 			break;
@@ -2005,194 +2005,194 @@ static int s5p_mfc_enc_s_ctrl(struct v4l2_ctrl *ctrl)
 			ret = -EINVAL;
 		}
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_QPEL:
 		p->codec.mpeg4.quarter_pixel = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:
+	case V4L2_CID_CODEC_VIDEO_VPX_NUM_PARTITIONS:
 		p->codec.vp8.num_partitions = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VPX_IMD_DISABLE_4X4:
+	case V4L2_CID_CODEC_VIDEO_VPX_IMD_DISABLE_4X4:
 		p->codec.vp8.imd_4x4 = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VPX_NUM_REF_FRAMES:
+	case V4L2_CID_CODEC_VIDEO_VPX_NUM_REF_FRAMES:
 		p->codec.vp8.num_ref = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VPX_FILTER_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_VPX_FILTER_LEVEL:
 		p->codec.vp8.filter_level = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VPX_FILTER_SHARPNESS:
+	case V4L2_CID_CODEC_VIDEO_VPX_FILTER_SHARPNESS:
 		p->codec.vp8.filter_sharpness = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_REF_PERIOD:
+	case V4L2_CID_CODEC_VIDEO_VPX_GOLDEN_FRAME_REF_PERIOD:
 		p->codec.vp8.golden_frame_ref_period = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL:
+	case V4L2_CID_CODEC_VIDEO_VPX_GOLDEN_FRAME_SEL:
 		p->codec.vp8.golden_frame_sel = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VPX_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_VPX_MIN_QP:
 		p->codec.vp8.rc_min_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VPX_MAX_QP:
+	case V4L2_CID_CODEC_VIDEO_VPX_MAX_QP:
 		p->codec.vp8.rc_max_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VPX_I_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_VPX_I_FRAME_QP:
 		p->codec.vp8.rc_frame_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_VPX_P_FRAME_QP:
 		p->codec.vp8.rc_p_frame_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_VP8_PROFILE:
 		p->codec.vp8.profile = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_I_FRAME_QP:
 		p->codec.hevc.rc_frame_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_P_FRAME_QP:
 		p->codec.hevc.rc_p_frame_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_B_FRAME_QP:
 		p->codec.hevc.rc_b_frame_qp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_FRAME_RATE_RESOLUTION:
+	case V4L2_CID_CODEC_VIDEO_HEVC_FRAME_RATE_RESOLUTION:
 		p->codec.hevc.rc_framerate = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP:
 		p->codec.hevc.rc_min_qp = ctrl->val;
 		__enc_update_hevc_qp_ctrls_range(ctx, ctrl->val,
 						 p->codec.hevc.rc_max_qp);
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP:
 		p->codec.hevc.rc_max_qp = ctrl->val;
 		__enc_update_hevc_qp_ctrls_range(ctx, p->codec.hevc.rc_min_qp,
 						 ctrl->val);
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_HEVC_LEVEL:
 		p->codec.hevc.level_v4l2 = ctrl->val;
 		p->codec.hevc.level = hevc_level(ctrl->val);
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_PROFILE:
 		switch (ctrl->val) {
-		case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN:
+		case V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN:
 			p->codec.hevc.profile =
-				V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN;
+				V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN;
 			break;
-		case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE:
+		case V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE:
 			p->codec.hevc.profile =
-			V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE;
+			V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE;
 			break;
 		default:
 			ret = -EINVAL;
 		}
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_TIER:
+	case V4L2_CID_CODEC_VIDEO_HEVC_TIER:
 		p->codec.hevc.tier = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_PARTITION_DEPTH:
+	case V4L2_CID_CODEC_VIDEO_HEVC_MAX_PARTITION_DEPTH:
 		p->codec.hevc.max_partition_depth = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES:
+	case V4L2_CID_CODEC_VIDEO_REF_NUMBER_FOR_PFRAMES:
 		p->codec.hevc.num_refs_for_p = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_REFRESH_TYPE:
 		p->codec.hevc.refreshtype = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_CONST_INTRA_PRED:
+	case V4L2_CID_CODEC_VIDEO_HEVC_CONST_INTRA_PRED:
 		p->codec.hevc.const_intra_period_enable = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_LOSSLESS_CU:
+	case V4L2_CID_CODEC_VIDEO_HEVC_LOSSLESS_CU:
 		p->codec.hevc.lossless_cu_enable = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_WAVEFRONT:
+	case V4L2_CID_CODEC_VIDEO_HEVC_WAVEFRONT:
 		p->codec.hevc.wavefront_enable = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_LOOP_FILTER_MODE:
 		p->codec.hevc.loopfilter = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_QP:
 		p->codec.hevc.hier_qp_enable = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_TYPE:
 		p->codec.hevc.hier_qp_type = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_LAYER:
 		p->codec.hevc.num_hier_layer = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L0_QP:
 		p->codec.hevc.hier_qp_layer[0] = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L1_QP:
 		p->codec.hevc.hier_qp_layer[1] = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L2_QP:
 		p->codec.hevc.hier_qp_layer[2] = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L3_QP:
 		p->codec.hevc.hier_qp_layer[3] = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L4_QP:
 		p->codec.hevc.hier_qp_layer[4] = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L5_QP:
 		p->codec.hevc.hier_qp_layer[5] = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_QP:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L6_QP:
 		p->codec.hevc.hier_qp_layer[6] = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_BR:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L0_BR:
 		p->codec.hevc.hier_bit_layer[0] = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_BR:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L1_BR:
 		p->codec.hevc.hier_bit_layer[1] = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_BR:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L2_BR:
 		p->codec.hevc.hier_bit_layer[2] = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_BR:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L3_BR:
 		p->codec.hevc.hier_bit_layer[3] = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L4_BR:
 		p->codec.hevc.hier_bit_layer[4] = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L5_BR:
 		p->codec.hevc.hier_bit_layer[5] = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L6_BR:
 		p->codec.hevc.hier_bit_layer[6] = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_GENERAL_PB:
+	case V4L2_CID_CODEC_VIDEO_HEVC_GENERAL_PB:
 		p->codec.hevc.general_pb_enable = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_TEMPORAL_ID:
+	case V4L2_CID_CODEC_VIDEO_HEVC_TEMPORAL_ID:
 		p->codec.hevc.temporal_id_enable = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_STRONG_SMOOTHING:
+	case V4L2_CID_CODEC_VIDEO_HEVC_STRONG_SMOOTHING:
 		p->codec.hevc.strong_intra_smooth = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_INTRA_PU_SPLIT:
+	case V4L2_CID_CODEC_VIDEO_HEVC_INTRA_PU_SPLIT:
 		p->codec.hevc.intra_pu_split_disable = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_TMV_PREDICTION:
+	case V4L2_CID_CODEC_VIDEO_HEVC_TMV_PREDICTION:
 		p->codec.hevc.tmv_prediction_disable = !ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1:
+	case V4L2_CID_CODEC_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1:
 		p->codec.hevc.max_num_merge_mv = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_WITHOUT_STARTCODE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_WITHOUT_STARTCODE:
 		p->codec.hevc.encoding_nostartcode_enable = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERIOD:
+	case V4L2_CID_CODEC_VIDEO_HEVC_REFRESH_PERIOD:
 		p->codec.hevc.refreshperiod = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2:
+	case V4L2_CID_CODEC_VIDEO_HEVC_LF_BETA_OFFSET_DIV2:
 		p->codec.hevc.lf_beta_offset_div2 = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2:
+	case V4L2_CID_CODEC_VIDEO_HEVC_LF_TC_OFFSET_DIV2:
 		p->codec.hevc.lf_tc_offset_div2 = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:
+	case V4L2_CID_CODEC_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:
 		p->codec.hevc.size_of_length_field = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:
+	case V4L2_CID_CODEC_VIDEO_PREPEND_SPSPPS_TO_IDR:
 		p->codec.hevc.prepend_sps_pps_to_idr = ctrl->val;
 		break;
 	default:
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c b/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c
index 49503c20d320..cecb8b669c76 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c
@@ -692,9 +692,9 @@ static int s5p_mfc_set_enc_params(struct s5p_mfc_ctx *ctx)
 	/* multi-slice control */
 	/* multi-slice MB number or bit size */
 	mfc_write(dev, p->slice_mode, S5P_FIMV_ENC_MSLICE_CTRL);
-	if (p->slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) {
+	if (p->slice_mode == V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_MAX_MB) {
 		mfc_write(dev, p->slice_mb, S5P_FIMV_ENC_MSLICE_MB);
-	} else if (p->slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
+	} else if (p->slice_mode == V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
 		mfc_write(dev, p->slice_bit, S5P_FIMV_ENC_MSLICE_BIT);
 	} else {
 		mfc_write(dev, 0, S5P_FIMV_ENC_MSLICE_MB);
@@ -804,7 +804,7 @@ static int s5p_mfc_set_enc_params_h264(struct s5p_mfc_ctx *ctx)
 	}
 	mfc_write(dev, reg, S5P_FIMV_ENC_BETA_OFF);
 	/* entropy coding mode */
-	if (p_264->entropy_mode == V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC)
+	if (p_264->entropy_mode == V4L2_CODEC_VIDEO_H264_ENTROPY_MODE_CABAC)
 		mfc_write(dev, 1, S5P_FIMV_ENC_H264_ENTROPY_MODE);
 	else
 		mfc_write(dev, 0, S5P_FIMV_ENC_H264_ENTROPY_MODE);
@@ -903,7 +903,7 @@ static int s5p_mfc_set_enc_params_h264(struct s5p_mfc_ctx *ctx)
 	shm = s5p_mfc_read_info_v5(ctx, EXT_ENC_CONTROL);
 	/* vbv buffer size */
 	if (p->frame_skip_mode ==
-			V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT) {
+			V4L2_CODEC_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT) {
 		shm &= ~(0xFFFF << 16);
 		shm |= (p_264->cpb_size << 16);
 	}
@@ -982,7 +982,7 @@ static int s5p_mfc_set_enc_params_mpeg4(struct s5p_mfc_ctx *ctx)
 	shm = s5p_mfc_read_info_v5(ctx, EXT_ENC_CONTROL);
 	/* vbv buffer size */
 	if (p->frame_skip_mode ==
-			V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT) {
+			V4L2_CODEC_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT) {
 		shm &= ~(0xFFFF << 16);
 		shm |= (p->vbv_size << 16);
 	}
@@ -1031,7 +1031,7 @@ static int s5p_mfc_set_enc_params_h263(struct s5p_mfc_ctx *ctx)
 	shm = s5p_mfc_read_info_v5(ctx, EXT_ENC_CONTROL);
 	/* vbv buffer size */
 	if (p->frame_skip_mode ==
-			V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT) {
+			V4L2_CODEC_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT) {
 		shm &= ~(0xFFFF << 16);
 		shm |= (p->vbv_size << 16);
 	}
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v6.c b/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v6.c
index a1453053e31a..1422a0b84d7d 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v6.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v6.c
@@ -733,10 +733,10 @@ static int s5p_mfc_set_slice_mode(struct s5p_mfc_ctx *ctx)
 	/* multi-slice control */
 	/* multi-slice MB number or bit size */
 	writel(ctx->slice_mode, mfc_regs->e_mslice_mode);
-	if (ctx->slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) {
+	if (ctx->slice_mode == V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_MAX_MB) {
 		writel(ctx->slice_size.mb, mfc_regs->e_mslice_size_mb);
 	} else if (ctx->slice_mode ==
-			V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
+			V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
 		writel(ctx->slice_size.bits, mfc_regs->e_mslice_size_bits);
 	} else {
 		writel(0x0, mfc_regs->e_mslice_size_mb);
@@ -776,11 +776,11 @@ static int s5p_mfc_set_enc_params(struct s5p_mfc_ctx *ctx)
 	/* multi-slice MB number or bit size */
 	ctx->slice_mode = p->slice_mode;
 	reg = 0;
-	if (p->slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) {
+	if (p->slice_mode == V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_MAX_MB) {
 		reg |= (0x1 << 3);
 		writel(reg, mfc_regs->e_enc_options);
 		ctx->slice_size.mb = p->slice_mb;
-	} else if (p->slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
+	} else if (p->slice_mode == V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
 		reg |= (0x1 << 3);
 		writel(reg, mfc_regs->e_enc_options);
 		ctx->slice_size.bits = p->slice_bit;
@@ -978,7 +978,7 @@ static int s5p_mfc_set_enc_params_h264(struct s5p_mfc_ctx *ctx)
 
 	/* vbv buffer size */
 	if (p->frame_skip_mode ==
-			V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT) {
+			V4L2_CODEC_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT) {
 		writel(p_h264->cpb_size & 0xFFFF,
 				mfc_regs->e_vbv_buffer_size);
 
@@ -1149,7 +1149,7 @@ static int s5p_mfc_set_enc_params_h264(struct s5p_mfc_ctx *ctx)
 
 	if (p_h264->fmo) {
 		switch (p_h264->fmo_map_type) {
-		case V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_INTERLEAVED_SLICES:
+		case V4L2_CODEC_VIDEO_H264_FMO_MAP_TYPE_INTERLEAVED_SLICES:
 			if (p_h264->fmo_slice_grp > 4)
 				p_h264->fmo_slice_grp = 4;
 			for (i = 0; i < (p_h264->fmo_slice_grp & 0xF); i++)
@@ -1157,12 +1157,12 @@ static int s5p_mfc_set_enc_params_h264(struct s5p_mfc_ctx *ctx)
 					mfc_regs->e_h264_fmo_run_length_minus1_0
 					+ i * 4);
 			break;
-		case V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_SCATTERED_SLICES:
+		case V4L2_CODEC_VIDEO_H264_FMO_MAP_TYPE_SCATTERED_SLICES:
 			if (p_h264->fmo_slice_grp > 4)
 				p_h264->fmo_slice_grp = 4;
 			break;
-		case V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_RASTER_SCAN:
-		case V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_WIPE_SCAN:
+		case V4L2_CODEC_VIDEO_H264_FMO_MAP_TYPE_RASTER_SCAN:
+		case V4L2_CODEC_VIDEO_H264_FMO_MAP_TYPE_WIPE_SCAN:
 			if (p_h264->fmo_slice_grp > 2)
 				p_h264->fmo_slice_grp = 2;
 			writel(p_h264->fmo_chg_dir & 0x1,
@@ -1258,7 +1258,7 @@ static int s5p_mfc_set_enc_params_mpeg4(struct s5p_mfc_ctx *ctx)
 
 	/* vbv buffer size */
 	if (p->frame_skip_mode ==
-			V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT) {
+			V4L2_CODEC_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT) {
 		writel(p->vbv_size & 0xFFFF, mfc_regs->e_vbv_buffer_size);
 
 		if (p->rc_frame)
@@ -1332,7 +1332,7 @@ static int s5p_mfc_set_enc_params_h263(struct s5p_mfc_ctx *ctx)
 
 	/* vbv buffer size */
 	if (p->frame_skip_mode ==
-			V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT) {
+			V4L2_CODEC_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT) {
 		writel(p->vbv_size & 0xFFFF, mfc_regs->e_vbv_buffer_size);
 
 		if (p->rc_frame)
@@ -1404,7 +1404,7 @@ static int s5p_mfc_set_enc_params_vp8(struct s5p_mfc_ctx *ctx)
 
 	/* vbv buffer size */
 	if (p->frame_skip_mode ==
-			V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT) {
+			V4L2_CODEC_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT) {
 		writel(p->vbv_size & 0xFFFF, mfc_regs->e_vbv_buffer_size);
 
 		if (p->rc_frame)
@@ -1415,16 +1415,16 @@ static int s5p_mfc_set_enc_params_vp8(struct s5p_mfc_ctx *ctx)
 	reg = 0;
 	reg |= (p_vp8->imd_4x4 & 0x1) << 10;
 	switch (p_vp8->num_partitions) {
-	case V4L2_CID_MPEG_VIDEO_VPX_1_PARTITION:
+	case V4L2_CID_CODEC_VIDEO_VPX_1_PARTITION:
 		val = 0;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VPX_2_PARTITIONS:
+	case V4L2_CID_CODEC_VIDEO_VPX_2_PARTITIONS:
 		val = 2;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VPX_4_PARTITIONS:
+	case V4L2_CID_CODEC_VIDEO_VPX_4_PARTITIONS:
 		val = 4;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VPX_8_PARTITIONS:
+	case V4L2_CID_CODEC_VIDEO_VPX_8_PARTITIONS:
 		val = 8;
 		break;
 	}
@@ -1476,14 +1476,14 @@ static int s5p_mfc_set_enc_params_hevc(struct s5p_mfc_ctx *ctx)
 	writel(reg, mfc_regs->e_picture_profile);
 
 	switch (p_hevc->loopfilter) {
-	case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED:
+	case V4L2_CODEC_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED:
 		p_hevc->loopfilter_disable = 1;
 		break;
-	case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED:
+	case V4L2_CODEC_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED:
 		p_hevc->loopfilter_disable = 0;
 		p_hevc->loopfilter_across = 1;
 		break;
-	case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
+	case V4L2_CODEC_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
 		p_hevc->loopfilter_disable = 0;
 		p_hevc->loopfilter_across = 0;
 		break;
diff --git a/drivers/media/platform/sti/hva/hva-debugfs.c b/drivers/media/platform/sti/hva/hva-debugfs.c
index a86a07b6fbc7..9841eaaf22c0 100644
--- a/drivers/media/platform/sti/hva/hva-debugfs.c
+++ b/drivers/media/platform/sti/hva/hva-debugfs.c
@@ -41,8 +41,8 @@ static void format_ctx(struct seq_file *s, struct hva_ctx *ctx)
 		      stream->width, stream->height,
 		      stream->profile, stream->level);
 
-	bitrate_mode = V4L2_CID_MPEG_VIDEO_BITRATE_MODE;
-	aspect = V4L2_CID_MPEG_VIDEO_ASPECT;
+	bitrate_mode = V4L2_CID_CODEC_VIDEO_BITRATE_MODE;
+	aspect = V4L2_CID_CODEC_VIDEO_ASPECT;
 	seq_puts(s, "  |-[parameters]\n");
 	seq_printf(s, "  | |- %s\n"
 		      "  | |- bitrate=%d bps\n"
@@ -56,9 +56,9 @@ static void format_ctx(struct seq_file *s, struct hva_ctx *ctx)
 		      ctrls->time_per_frame.denominator,
 		      ctrls->time_per_frame.numerator);
 
-	entropy = V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE;
-	vui_sar = V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC;
-	sei_fp =  V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE;
+	entropy = V4L2_CID_CODEC_VIDEO_H264_ENTROPY_MODE;
+	vui_sar = V4L2_CID_CODEC_VIDEO_H264_VUI_SAR_IDC;
+	sei_fp =  V4L2_CID_CODEC_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE;
 	if (stream->streamformat == V4L2_PIX_FMT_H264) {
 		seq_printf(s, "  | |- %s entropy mode\n"
 			      "  | |- CPB size=%d kB\n"
diff --git a/drivers/media/platform/sti/hva/hva-h264.c b/drivers/media/platform/sti/hva/hva-h264.c
index 98cb00d2d868..8b910e660ffd 100644
--- a/drivers/media/platform/sti/hva/hva-h264.c
+++ b/drivers/media/platform/sti/hva/hva-h264.c
@@ -48,7 +48,7 @@
 #define H264_FILLER_DATA_SIZE 6
 
 struct h264_profile {
-	enum v4l2_mpeg_video_h264_level level;
+	enum v4l2_codec_video_h264_level level;
 	u32 max_mb_per_seconds;
 	u32 max_frame_size;
 	u32 max_bitrate;
@@ -57,22 +57,22 @@ struct h264_profile {
 };
 
 static const struct h264_profile h264_infos_list[] = {
-	{V4L2_MPEG_VIDEO_H264_LEVEL_1_0, 1485, 99, 64, 175, 2},
-	{V4L2_MPEG_VIDEO_H264_LEVEL_1B, 1485, 99, 128, 350, 2},
-	{V4L2_MPEG_VIDEO_H264_LEVEL_1_1, 3000, 396, 192, 500, 2},
-	{V4L2_MPEG_VIDEO_H264_LEVEL_1_2, 6000, 396, 384, 1000, 2},
-	{V4L2_MPEG_VIDEO_H264_LEVEL_1_3, 11880, 396, 768, 2000, 2},
-	{V4L2_MPEG_VIDEO_H264_LEVEL_2_0, 11880, 396, 2000, 2000, 2},
-	{V4L2_MPEG_VIDEO_H264_LEVEL_2_1, 19800, 792, 4000, 4000, 2},
-	{V4L2_MPEG_VIDEO_H264_LEVEL_2_2, 20250, 1620, 4000, 4000, 2},
-	{V4L2_MPEG_VIDEO_H264_LEVEL_3_0, 40500, 1620, 10000, 10000, 2},
-	{V4L2_MPEG_VIDEO_H264_LEVEL_3_1, 108000, 3600, 14000, 14000, 4},
-	{V4L2_MPEG_VIDEO_H264_LEVEL_3_2, 216000, 5120, 20000, 20000, 4},
-	{V4L2_MPEG_VIDEO_H264_LEVEL_4_0, 245760, 8192, 20000, 25000, 4},
-	{V4L2_MPEG_VIDEO_H264_LEVEL_4_1, 245760, 8192, 50000, 62500, 2},
-	{V4L2_MPEG_VIDEO_H264_LEVEL_4_2, 522240, 8704, 50000, 62500, 2},
-	{V4L2_MPEG_VIDEO_H264_LEVEL_5_0, 589824, 22080, 135000, 135000, 2},
-	{V4L2_MPEG_VIDEO_H264_LEVEL_5_1, 983040, 36864, 240000, 240000, 2}
+	{V4L2_CODEC_VIDEO_H264_LEVEL_1_0, 1485, 99, 64, 175, 2},
+	{V4L2_CODEC_VIDEO_H264_LEVEL_1B, 1485, 99, 128, 350, 2},
+	{V4L2_CODEC_VIDEO_H264_LEVEL_1_1, 3000, 396, 192, 500, 2},
+	{V4L2_CODEC_VIDEO_H264_LEVEL_1_2, 6000, 396, 384, 1000, 2},
+	{V4L2_CODEC_VIDEO_H264_LEVEL_1_3, 11880, 396, 768, 2000, 2},
+	{V4L2_CODEC_VIDEO_H264_LEVEL_2_0, 11880, 396, 2000, 2000, 2},
+	{V4L2_CODEC_VIDEO_H264_LEVEL_2_1, 19800, 792, 4000, 4000, 2},
+	{V4L2_CODEC_VIDEO_H264_LEVEL_2_2, 20250, 1620, 4000, 4000, 2},
+	{V4L2_CODEC_VIDEO_H264_LEVEL_3_0, 40500, 1620, 10000, 10000, 2},
+	{V4L2_CODEC_VIDEO_H264_LEVEL_3_1, 108000, 3600, 14000, 14000, 4},
+	{V4L2_CODEC_VIDEO_H264_LEVEL_3_2, 216000, 5120, 20000, 20000, 4},
+	{V4L2_CODEC_VIDEO_H264_LEVEL_4_0, 245760, 8192, 20000, 25000, 4},
+	{V4L2_CODEC_VIDEO_H264_LEVEL_4_1, 245760, 8192, 50000, 62500, 2},
+	{V4L2_CODEC_VIDEO_H264_LEVEL_4_2, 522240, 8704, 50000, 62500, 2},
+	{V4L2_CODEC_VIDEO_H264_LEVEL_5_0, 589824, 22080, 135000, 135000, 2},
+	{V4L2_CODEC_VIDEO_H264_LEVEL_5_1, 983040, 36864, 240000, 240000, 2}
 };
 
 enum hva_brc_type {
@@ -427,7 +427,7 @@ static int hva_h264_fill_slice_header(struct hva_ctx *pctx,
 	 * The part of host is precomputed and available through this array.
 	 */
 	struct device *dev = ctx_to_dev(pctx);
-	int  cabac = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC;
+	int  cabac = V4L2_CODEC_VIDEO_H264_ENTROPY_MODE_CABAC;
 	static const unsigned char slice_header[] = {
 		0x00, 0x00, 0x00, 0x01,
 		0x41, 0x34, 0x07, 0x00
@@ -598,10 +598,10 @@ static int hva_h264_prepare_task(struct hva_ctx *pctx,
 	struct hva_h264_td *td = &task->td;
 	struct hva_controls *ctrls = &pctx->ctrls;
 	struct v4l2_fract *time_per_frame = &pctx->ctrls.time_per_frame;
-	int cavlc =  V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC;
+	int cavlc =  V4L2_CODEC_VIDEO_H264_ENTROPY_MODE_CAVLC;
 	u32 frame_num = pctx->stream_num;
 	u32 addr_esram = hva->esram_addr;
-	enum v4l2_mpeg_video_h264_level level;
+	enum v4l2_codec_video_h264_level level;
 	dma_addr_t paddr = 0;
 	u8 *slice_header_vaddr;
 	u32 frame_width = frame->info.aligned_width;
@@ -641,7 +641,7 @@ static int hva_h264_prepare_task(struct hva_ctx *pctx,
 
 	/* useConstrainedIntraFlag set to false for better coding efficiency */
 	td->use_constrained_intra_flag = false;
-	td->brc_type = (ctrls->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+	td->brc_type = (ctrls->bitrate_mode == V4L2_CODEC_VIDEO_BITRATE_MODE_CBR)
 			? BRC_TYPE_CBR : BRC_TYPE_VBR;
 
 	td->entropy_coding_mode = (ctrls->entropy_mode == cavlc) ? CAVLC :
@@ -674,7 +674,7 @@ static int hva_h264_prepare_task(struct hva_ctx *pctx,
 	}
 
 	/* compute maximum bitrate depending on profile */
-	if (ctrls->profile >= V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)
+	if (ctrls->profile >= V4L2_CODEC_VIDEO_H264_PROFILE_HIGH)
 		max_bitrate = h264_infos_list[level].max_bitrate *
 			      H264_FACTOR_HIGH;
 	else
@@ -693,7 +693,7 @@ static int hva_h264_prepare_task(struct hva_ctx *pctx,
 	td->cpb_buffer_size = ctrls->cpb_size * 8000;
 
 	/* compute maximum cpb buffer size depending on profile */
-	if (ctrls->profile >= V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)
+	if (ctrls->profile >= V4L2_CODEC_VIDEO_H264_PROFILE_HIGH)
 		max_cpb_buffer_size =
 		    h264_infos_list[level].max_cpb_size * H264_FACTOR_HIGH;
 	else
@@ -712,7 +712,7 @@ static int hva_h264_prepare_task(struct hva_ctx *pctx,
 	td->brc_no_skip = 0;
 
 	/* initial delay */
-	if ((ctrls->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR) &&
+	if ((ctrls->bitrate_mode == V4L2_CODEC_VIDEO_BITRATE_MODE_CBR) &&
 	    td->bit_rate)
 		td->delay = 1000 * (td->cpb_buffer_size / td->bit_rate);
 	else
diff --git a/drivers/media/platform/sti/hva/hva-v4l2.c b/drivers/media/platform/sti/hva/hva-v4l2.c
index bb34d6997d99..2e24c8a8702a 100644
--- a/drivers/media/platform/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/sti/hva/hva-v4l2.c
@@ -623,57 +623,57 @@ static int hva_s_ctrl(struct v4l2_ctrl *ctrl)
 		ctrl->id, ctrl->val);
 
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_MODE:
 		ctx->ctrls.bitrate_mode = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
+	case V4L2_CID_CODEC_VIDEO_GOP_SIZE:
 		ctx->ctrls.gop_size = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE:
 		ctx->ctrls.bitrate = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_ASPECT:
+	case V4L2_CID_CODEC_VIDEO_ASPECT:
 		ctx->ctrls.aspect = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_H264_PROFILE:
 		ctx->ctrls.profile = ctrl->val;
 		snprintf(ctx->streaminfo.profile,
 			 sizeof(ctx->streaminfo.profile),
 			 "%s profile",
 			 v4l2_ctrl_get_menu(ctrl->id)[ctrl->val]);
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_H264_LEVEL:
 		ctx->ctrls.level = ctrl->val;
 		snprintf(ctx->streaminfo.level,
 			 sizeof(ctx->streaminfo.level),
 			 "level %s",
 			 v4l2_ctrl_get_menu(ctrl->id)[ctrl->val]);
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
+	case V4L2_CID_CODEC_VIDEO_H264_ENTROPY_MODE:
 		ctx->ctrls.entropy_mode = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE:
+	case V4L2_CID_CODEC_VIDEO_H264_CPB_SIZE:
 		ctx->ctrls.cpb_size = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
+	case V4L2_CID_CODEC_VIDEO_H264_8X8_TRANSFORM:
 		ctx->ctrls.dct8x8 = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_MIN_QP:
 		ctx->ctrls.qpmin = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_MAX_QP:
 		ctx->ctrls.qpmax = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
+	case V4L2_CID_CODEC_VIDEO_H264_VUI_SAR_ENABLE:
 		ctx->ctrls.vui_sar = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
+	case V4L2_CID_CODEC_VIDEO_H264_VUI_SAR_IDC:
 		ctx->ctrls.vui_sar_idc = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_SEI_FRAME_PACKING:
+	case V4L2_CID_CODEC_VIDEO_H264_SEI_FRAME_PACKING:
 		ctx->ctrls.sei_fp = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
+	case V4L2_CID_CODEC_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
 		ctx->ctrls.sei_fp_type = ctrl->val;
 		break;
 	default:
@@ -694,88 +694,88 @@ static int hva_ctrls_setup(struct hva_ctx *ctx)
 {
 	struct device *dev = ctx_to_dev(ctx);
 	u64 mask;
-	enum v4l2_mpeg_video_h264_sei_fp_arrangement_type sei_fp_type =
-		V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_TOP_BOTTOM;
+	enum v4l2_codec_video_h264_sei_fp_arrangement_type sei_fp_type =
+		V4L2_CODEC_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_TOP_BOTTOM;
 
 	v4l2_ctrl_handler_init(&ctx->ctrl_handler, 15);
 
 	v4l2_ctrl_new_std_menu(&ctx->ctrl_handler, &hva_ctrl_ops,
-			       V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
-			       V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
+			       V4L2_CID_CODEC_VIDEO_BITRATE_MODE,
+			       V4L2_CODEC_VIDEO_BITRATE_MODE_CBR,
 			       0,
-			       V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
+			       V4L2_CODEC_VIDEO_BITRATE_MODE_CBR);
 
 	v4l2_ctrl_new_std(&ctx->ctrl_handler, &hva_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_GOP_SIZE,
+			  V4L2_CID_CODEC_VIDEO_GOP_SIZE,
 			  1, 60, 1, 16);
 
 	v4l2_ctrl_new_std(&ctx->ctrl_handler, &hva_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_BITRATE,
+			  V4L2_CID_CODEC_VIDEO_BITRATE,
 			  1000, 60000000, 1000, 20000000);
 
-	mask = ~(1 << V4L2_MPEG_VIDEO_ASPECT_1x1);
+	mask = ~(1 << V4L2_CODEC_VIDEO_ASPECT_1x1);
 	v4l2_ctrl_new_std_menu(&ctx->ctrl_handler, &hva_ctrl_ops,
-			       V4L2_CID_MPEG_VIDEO_ASPECT,
-			       V4L2_MPEG_VIDEO_ASPECT_1x1,
+			       V4L2_CID_CODEC_VIDEO_ASPECT,
+			       V4L2_CODEC_VIDEO_ASPECT_1x1,
 			       mask,
-			       V4L2_MPEG_VIDEO_ASPECT_1x1);
+			       V4L2_CODEC_VIDEO_ASPECT_1x1);
 
-	mask = ~((1 << V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
-		 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
-		 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
-		 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH));
+	mask = ~((1 << V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE) |
+		 (1 << V4L2_CODEC_VIDEO_H264_PROFILE_MAIN) |
+		 (1 << V4L2_CODEC_VIDEO_H264_PROFILE_HIGH) |
+		 (1 << V4L2_CODEC_VIDEO_H264_PROFILE_STEREO_HIGH));
 	v4l2_ctrl_new_std_menu(&ctx->ctrl_handler, &hva_ctrl_ops,
-			       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
-			       V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH,
+			       V4L2_CID_CODEC_VIDEO_H264_PROFILE,
+			       V4L2_CODEC_VIDEO_H264_PROFILE_STEREO_HIGH,
 			       mask,
-			       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
+			       V4L2_CODEC_VIDEO_H264_PROFILE_HIGH);
 
 	v4l2_ctrl_new_std_menu(&ctx->ctrl_handler, &hva_ctrl_ops,
-			       V4L2_CID_MPEG_VIDEO_H264_LEVEL,
-			       V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+			       V4L2_CID_CODEC_VIDEO_H264_LEVEL,
+			       V4L2_CODEC_VIDEO_H264_LEVEL_4_2,
 			       0,
-			       V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
+			       V4L2_CODEC_VIDEO_H264_LEVEL_4_0);
 
 	v4l2_ctrl_new_std_menu(&ctx->ctrl_handler, &hva_ctrl_ops,
-			       V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE,
-			       V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+			       V4L2_CID_CODEC_VIDEO_H264_ENTROPY_MODE,
+			       V4L2_CODEC_VIDEO_H264_ENTROPY_MODE_CABAC,
 			       0,
-			       V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC);
+			       V4L2_CODEC_VIDEO_H264_ENTROPY_MODE_CAVLC);
 
 	v4l2_ctrl_new_std(&ctx->ctrl_handler, &hva_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE,
+			  V4L2_CID_CODEC_VIDEO_H264_CPB_SIZE,
 			  1, 10000, 1, 3000);
 
 	v4l2_ctrl_new_std(&ctx->ctrl_handler, &hva_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM,
+			  V4L2_CID_CODEC_VIDEO_H264_8X8_TRANSFORM,
 			  0, 1, 1, 0);
 
 	v4l2_ctrl_new_std(&ctx->ctrl_handler, &hva_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_MIN_QP,
+			  V4L2_CID_CODEC_VIDEO_H264_MIN_QP,
 			  0, 51, 1, 5);
 
 	v4l2_ctrl_new_std(&ctx->ctrl_handler, &hva_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_MAX_QP,
+			  V4L2_CID_CODEC_VIDEO_H264_MAX_QP,
 			  0, 51, 1, 51);
 
 	v4l2_ctrl_new_std(&ctx->ctrl_handler, &hva_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE,
+			  V4L2_CID_CODEC_VIDEO_H264_VUI_SAR_ENABLE,
 			  0, 1, 1, 1);
 
-	mask = ~(1 << V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_1x1);
+	mask = ~(1 << V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_1x1);
 	v4l2_ctrl_new_std_menu(&ctx->ctrl_handler, &hva_ctrl_ops,
-			       V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC,
-			       V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_1x1,
+			       V4L2_CID_CODEC_VIDEO_H264_VUI_SAR_IDC,
+			       V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_1x1,
 			       mask,
-			       V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_1x1);
+			       V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_1x1);
 
 	v4l2_ctrl_new_std(&ctx->ctrl_handler, &hva_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_SEI_FRAME_PACKING,
+			  V4L2_CID_CODEC_VIDEO_H264_SEI_FRAME_PACKING,
 			  0, 1, 1, 0);
 
 	mask = ~(1 << sei_fp_type);
 	v4l2_ctrl_new_std_menu(&ctx->ctrl_handler, &hva_ctrl_ops,
-			       V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE,
+			       V4L2_CID_CODEC_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE,
 			       sei_fp_type,
 			       mask,
 			       sei_fp_type);
diff --git a/drivers/media/platform/sti/hva/hva.h b/drivers/media/platform/sti/hva/hva.h
index 1226d60cc367..4ba1fb9b3660 100644
--- a/drivers/media/platform/sti/hva/hva.h
+++ b/drivers/media/platform/sti/hva/hva.h
@@ -85,21 +85,21 @@ struct hva_streaminfo {
  */
 struct hva_controls {
 	struct v4l2_fract					time_per_frame;
-	enum v4l2_mpeg_video_bitrate_mode			bitrate_mode;
+	enum v4l2_codec_video_bitrate_mode			bitrate_mode;
 	u32							gop_size;
 	u32							bitrate;
-	enum v4l2_mpeg_video_aspect				aspect;
-	enum v4l2_mpeg_video_h264_profile			profile;
-	enum v4l2_mpeg_video_h264_level				level;
-	enum v4l2_mpeg_video_h264_entropy_mode			entropy_mode;
+	enum v4l2_codec_video_aspect				aspect;
+	enum v4l2_codec_video_h264_profile			profile;
+	enum v4l2_codec_video_h264_level				level;
+	enum v4l2_codec_video_h264_entropy_mode			entropy_mode;
 	u32							cpb_size;
 	bool							dct8x8;
 	u32							qpmin;
 	u32							qpmax;
 	bool							vui_sar;
-	enum v4l2_mpeg_video_h264_vui_sar_idc			vui_sar_idc;
+	enum v4l2_codec_video_h264_vui_sar_idc			vui_sar_idc;
 	bool							sei_fp;
-	enum v4l2_mpeg_video_h264_sei_fp_arrangement_type	sei_fp_type;
+	enum v4l2_codec_video_h264_sei_fp_arrangement_type	sei_fp_type;
 };
 
 /**
-- 
2.30.1

