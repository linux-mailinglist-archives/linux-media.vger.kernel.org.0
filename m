Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4322EB0993
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 09:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbfILHgZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 03:36:25 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:35991 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725995AbfILHgZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 03:36:25 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 8JeNiARvZQUjz8JeQi8fVi; Thu, 12 Sep 2019 09:36:22 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Vandana B N <bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] v4l2-dev: refine selection of valid v4l-touch ioctls
Message-ID: <5234da10-2d65-b050-69bf-abe26d50ebbf@xs4all.nl>
Date:   Thu, 12 Sep 2019 09:36:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIHOhuF+omzfR60PgDwssHHv+gtni7ObBPBNrWTsYPI3c2TEP2rmLr5GbXur+cWLmTZo5CegbZ/oK4dpBHa+bjCUx1x5F6oq5g7wdn1ZtdOiOexS2RUX
 ndRUJ0ZABn+6/iwj+j6ZCeAhzdWYczic8nlmukTyrPicxUmLMC9xQYkcibpuSEEWDlRjmiAgR4SpiXsPCo7OSK1dDnnrTjOXzOU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The selection of which ioctls are valid for touch devices was too
wide. Refine this to only the set of ioctls that make sense for such
devices.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
This patch sits on top of Vandana's metadata patch:
https://patchwork.linuxtv.org/patch/58693/
---
 drivers/media/v4l2-core/v4l2-dev.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 8110127d0e3d..1fbc4af0e5ef 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -575,7 +575,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		set_bit(_IOC_NR(VIDIOC_TRY_EXT_CTRLS), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_querymenu)
 		set_bit(_IOC_NR(VIDIOC_QUERYMENU), valid_ioctls);
-	if (!is_meta) {
+	if (!is_tch && !is_meta) {
 		SET_VALID_IOCTL(ops, VIDIOC_G_FREQUENCY, vidioc_g_frequency);
 		SET_VALID_IOCTL(ops, VIDIOC_S_FREQUENCY, vidioc_s_frequency);
 	}
@@ -592,7 +592,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	if (ops->vidioc_enum_freq_bands || ops->vidioc_g_tuner || ops->vidioc_g_modulator)
 		set_bit(_IOC_NR(VIDIOC_ENUM_FREQ_BANDS), valid_ioctls);

-	if (is_vid || is_tch) {
+	if (is_vid) {
 		/* video and metadata specific ioctls */
 		if ((is_rx && (ops->vidioc_enum_fmt_vid_cap ||
 			       ops->vidioc_enum_fmt_vid_overlay)) ||
@@ -677,6 +677,19 @@ static void determine_valid_ioctls(struct video_device *vdev)
 			set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
 		if (ops->vidioc_try_fmt_sdr_out)
 			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
+	} else if (is_tch) {
+		/* touch specific ioctls */
+		set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
+		set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
+		set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
+		set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
+		SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
+		SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
+		SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
+		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FRAMESIZES, vidioc_enum_framesizes);
+		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FRAMEINTERVALS, vidioc_enum_frameintervals);
+		SET_VALID_IOCTL(ops, VIDIOC_G_PARM, vidioc_g_parm);
+		SET_VALID_IOCTL(ops, VIDIOC_S_PARM, vidioc_s_parm);
 	} else if (is_meta) {
 		/* metadata specific ioctls */
 		if ((is_rx && ops->vidioc_enum_fmt_meta_cap) ||
@@ -706,7 +719,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_STREAMOFF, vidioc_streamoff);
 	}

-	if (is_vid || is_vbi || is_tch) {
+	if (is_vid || is_vbi) {
 		/* ioctls valid for video or vbi */
 		if (ops->vidioc_s_std)
 			set_bit(_IOC_NR(VIDIOC_ENUMSTD), valid_ioctls);
@@ -746,7 +759,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_G_MODULATOR, vidioc_g_modulator);
 		SET_VALID_IOCTL(ops, VIDIOC_S_MODULATOR, vidioc_s_modulator);
 	}
-	if (is_rx && !is_meta) {
+	if (is_rx && !is_tch && !is_meta) {
 		/* receiver only ioctls */
 		SET_VALID_IOCTL(ops, VIDIOC_G_TUNER, vidioc_g_tuner);
 		SET_VALID_IOCTL(ops, VIDIOC_S_TUNER, vidioc_s_tuner);
-- 
2.23.0.rc1

