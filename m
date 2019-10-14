Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54E49D61E5
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 14:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731867AbfJNMBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 08:01:08 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:42983 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731643AbfJNMBI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 08:01:08 -0400
Received: from [IPv6:2001:983:e9a7:1:c8e8:9e43:7e19:64a2] ([IPv6:2001:983:e9a7:1:c8e8:9e43:7e19:64a2])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Jz29iHOy9op0AJz2AielHW; Mon, 14 Oct 2019 14:01:06 +0200
Subject: [PATCHv6 4/3] v4l2-dev: disable frequency and tuner ioctls for touch
To:     linux-media@vger.kernel.org
Cc:     Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20191014084021.54191-1-hverkuil-cisco@xs4all.nl>
 <20191014084021.54191-4-hverkuil-cisco@xs4all.nl>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <44ce4b09-9452-37d5-f7c4-26a26b4adfd7@xs4all.nl>
Date:   Mon, 14 Oct 2019 14:01:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014084021.54191-4-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOR8KjTOTC9S83NImHDFDq+j6+pP3DKEB97PNVyNct7a228gjHjFh69XYMnJKyo9VawEPZkqpUA1luR74K3iuzTM8x3bqb+g+EAp4T/h9DCEeEPGskCG
 nL2/+JdTgS3dIbEhIKVe+mi2JAicblFvgRnn8/HWXm+2fvgGN9/KKka4ffD4MhOl3bTApDWnMQApjvDogqGjAiNFAzDEpa2HhrTDp4d/C9P0QMANVpQe+4RU
 3rQrHco9TnUZPM0XrHO3KV08tHtsu/3C9t1aBjiJC2NyrGHHt3yR8Vja6GBmhe2SC6q45mcBJmBvXaExzC4lc9+uBBpqv0cM9Segq1MwMaDjjXgKhMzXdvsk
 ++rgWGXKDu6dowR5j9Kyks8t+BFK4Gu2KmAbQSTrFgiwfNrxql8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Touch devices have obviously no tuner, so don't attempt to enable those ioctls
for such devices.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index cec588b04711..da42d172714a 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -581,8 +581,10 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		set_bit(_IOC_NR(VIDIOC_TRY_EXT_CTRLS), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_querymenu)
 		set_bit(_IOC_NR(VIDIOC_QUERYMENU), valid_ioctls);
-	SET_VALID_IOCTL(ops, VIDIOC_G_FREQUENCY, vidioc_g_frequency);
-	SET_VALID_IOCTL(ops, VIDIOC_S_FREQUENCY, vidioc_s_frequency);
+	if (!is_tch) {
+		SET_VALID_IOCTL(ops, VIDIOC_G_FREQUENCY, vidioc_g_frequency);
+		SET_VALID_IOCTL(ops, VIDIOC_S_FREQUENCY, vidioc_s_frequency);
+	}
 	SET_VALID_IOCTL(ops, VIDIOC_LOG_STATUS, vidioc_log_status);
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 	set_bit(_IOC_NR(VIDIOC_DBG_G_CHIP_INFO), valid_ioctls);
@@ -754,7 +756,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_G_MODULATOR, vidioc_g_modulator);
 		SET_VALID_IOCTL(ops, VIDIOC_S_MODULATOR, vidioc_s_modulator);
 	}
-	if (is_rx) {
+	if (is_rx && !is_tch) {
 		/* receiver only ioctls */
 		SET_VALID_IOCTL(ops, VIDIOC_G_TUNER, vidioc_g_tuner);
 		SET_VALID_IOCTL(ops, VIDIOC_S_TUNER, vidioc_s_tuner);

