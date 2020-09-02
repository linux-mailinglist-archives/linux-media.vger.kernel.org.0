Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433B325B154
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgIBQSG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:18:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:53840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727963AbgIBQKs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:48 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D59CD20773;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=TNOI/VLtApvB6yPQmCUZBBC5lN9M1DLUltQ/CvohjAk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ulejFWlemy/ELe8wIxriEGQ+0t4Le5mwgc8X6SsTuH5DSfSTZx3GZS4LpUjSuPjE+
         QsPQDUtQyPNDEl72XFYmGWVeEyv9GhUXQdZWYEbv5ic4bpyEgd8hUBGpw0wcViIbaW
         UiDvY4++Z2Qjmkk9O8RhG/BYzZmxqwbaN+5Gf4uA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLP-000tA4-T2; Wed, 02 Sep 2020 18:10:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/38] media: vivid: place the logic which disables ioctl on a separate function
Date:   Wed,  2 Sep 2020 18:10:13 +0200
Message-Id: <04bdd5013c20f0a623039d0bb65eb722bfd7f497.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move this code out of the long vivid_create_instance() function.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 182 +++++++++---------
 1 file changed, 96 insertions(+), 86 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index d4785da440d9..f8cb4133e1ce 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -1001,6 +1001,100 @@ static int vivid_detect_feature_set(struct vivid_dev *dev, int inst,
 	return 0;
 }
 
+static void vivid_disable_unused_ioctls(struct vivid_dev *dev,
+					bool has_tuner,
+					bool has_modulator,
+					unsigned in_type_counter[4],
+					unsigned out_type_counter[4])
+{
+	/* disable invalid ioctls based on the feature set */
+	if (!dev->has_audio_inputs) {
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_AUDIO);
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_AUDIO);
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_ENUMAUDIO);
+		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_AUDIO);
+		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_AUDIO);
+		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_ENUMAUDIO);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_AUDIO);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_AUDIO);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_ENUMAUDIO);
+	}
+	if (!dev->has_audio_outputs) {
+		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_AUDOUT);
+		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_G_AUDOUT);
+		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_ENUMAUDOUT);
+		v4l2_disable_ioctl(&dev->vbi_out_dev, VIDIOC_S_AUDOUT);
+		v4l2_disable_ioctl(&dev->vbi_out_dev, VIDIOC_G_AUDOUT);
+		v4l2_disable_ioctl(&dev->vbi_out_dev, VIDIOC_ENUMAUDOUT);
+		v4l2_disable_ioctl(&dev->meta_out_dev, VIDIOC_S_AUDOUT);
+		v4l2_disable_ioctl(&dev->meta_out_dev, VIDIOC_G_AUDOUT);
+		v4l2_disable_ioctl(&dev->meta_out_dev, VIDIOC_ENUMAUDOUT);
+	}
+	if (!in_type_counter[TV] && !in_type_counter[SVID]) {
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_STD);
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_STD);
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_ENUMSTD);
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_QUERYSTD);
+	}
+	if (!out_type_counter[SVID]) {
+		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_STD);
+		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_G_STD);
+		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_ENUMSTD);
+	}
+	if (!has_tuner && !has_modulator) {
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_FREQUENCY);
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_FREQUENCY);
+		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_FREQUENCY);
+		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_FREQUENCY);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_FREQUENCY);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_FREQUENCY);
+	}
+	if (!has_tuner) {
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_TUNER);
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_TUNER);
+		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_TUNER);
+		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_TUNER);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_TUNER);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_TUNER);
+	}
+	if (in_type_counter[HDMI] == 0) {
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_EDID);
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_EDID);
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_DV_TIMINGS_CAP);
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_DV_TIMINGS);
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_DV_TIMINGS);
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_ENUM_DV_TIMINGS);
+		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_QUERY_DV_TIMINGS);
+	}
+	if (out_type_counter[HDMI] == 0) {
+		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_G_EDID);
+		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_DV_TIMINGS_CAP);
+		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_G_DV_TIMINGS);
+		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_DV_TIMINGS);
+		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_ENUM_DV_TIMINGS);
+	}
+	if (!dev->has_fb) {
+		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_G_FBUF);
+		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_FBUF);
+		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_OVERLAY);
+	}
+	v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
+	v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
+	v4l2_disable_ioctl(&dev->sdr_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
+	v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
+	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_FREQUENCY);
+	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_G_FREQUENCY);
+	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_ENUM_FRAMESIZES);
+	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_ENUM_FRAMEINTERVALS);
+	v4l2_disable_ioctl(&dev->vbi_out_dev, VIDIOC_S_FREQUENCY);
+	v4l2_disable_ioctl(&dev->vbi_out_dev, VIDIOC_G_FREQUENCY);
+	v4l2_disable_ioctl(&dev->meta_out_dev, VIDIOC_S_FREQUENCY);
+	v4l2_disable_ioctl(&dev->meta_out_dev, VIDIOC_G_FREQUENCY);
+	v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_S_PARM);
+	v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_ENUM_FRAMESIZES);
+	v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_ENUM_FRAMEINTERVALS);
+}
+
 static int vivid_create_instance(struct platform_device *pdev, int inst)
 {
 	static const struct v4l2_dv_timings def_dv_timings =
@@ -1189,92 +1283,8 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 			(u32)bt->pixelclock / (htot * vtot));
 	}
 
-	/* disable invalid ioctls based on the feature set */
-	if (!dev->has_audio_inputs) {
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_AUDIO);
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_AUDIO);
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_ENUMAUDIO);
-		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_AUDIO);
-		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_AUDIO);
-		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_ENUMAUDIO);
-		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_AUDIO);
-		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_AUDIO);
-		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_ENUMAUDIO);
-	}
-	if (!dev->has_audio_outputs) {
-		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_AUDOUT);
-		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_G_AUDOUT);
-		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_ENUMAUDOUT);
-		v4l2_disable_ioctl(&dev->vbi_out_dev, VIDIOC_S_AUDOUT);
-		v4l2_disable_ioctl(&dev->vbi_out_dev, VIDIOC_G_AUDOUT);
-		v4l2_disable_ioctl(&dev->vbi_out_dev, VIDIOC_ENUMAUDOUT);
-		v4l2_disable_ioctl(&dev->meta_out_dev, VIDIOC_S_AUDOUT);
-		v4l2_disable_ioctl(&dev->meta_out_dev, VIDIOC_G_AUDOUT);
-		v4l2_disable_ioctl(&dev->meta_out_dev, VIDIOC_ENUMAUDOUT);
-	}
-	if (!in_type_counter[TV] && !in_type_counter[SVID]) {
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_STD);
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_STD);
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_ENUMSTD);
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_QUERYSTD);
-	}
-	if (!out_type_counter[SVID]) {
-		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_STD);
-		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_G_STD);
-		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_ENUMSTD);
-	}
-	if (!has_tuner && !has_modulator) {
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_FREQUENCY);
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_FREQUENCY);
-		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_FREQUENCY);
-		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_FREQUENCY);
-		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_FREQUENCY);
-		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_FREQUENCY);
-	}
-	if (!has_tuner) {
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_TUNER);
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_TUNER);
-		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_TUNER);
-		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_TUNER);
-		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_TUNER);
-		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_TUNER);
-	}
-	if (in_type_counter[HDMI] == 0) {
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_EDID);
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_EDID);
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_DV_TIMINGS_CAP);
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_DV_TIMINGS);
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_DV_TIMINGS);
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_ENUM_DV_TIMINGS);
-		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_QUERY_DV_TIMINGS);
-	}
-	if (out_type_counter[HDMI] == 0) {
-		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_G_EDID);
-		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_DV_TIMINGS_CAP);
-		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_G_DV_TIMINGS);
-		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_DV_TIMINGS);
-		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_ENUM_DV_TIMINGS);
-	}
-	if (!dev->has_fb) {
-		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_G_FBUF);
-		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_FBUF);
-		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_OVERLAY);
-	}
-	v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
-	v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
-	v4l2_disable_ioctl(&dev->sdr_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
-	v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
-	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_FREQUENCY);
-	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_G_FREQUENCY);
-	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_ENUM_FRAMESIZES);
-	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_ENUM_FRAMEINTERVALS);
-	v4l2_disable_ioctl(&dev->vbi_out_dev, VIDIOC_S_FREQUENCY);
-	v4l2_disable_ioctl(&dev->vbi_out_dev, VIDIOC_G_FREQUENCY);
-	v4l2_disable_ioctl(&dev->meta_out_dev, VIDIOC_S_FREQUENCY);
-	v4l2_disable_ioctl(&dev->meta_out_dev, VIDIOC_G_FREQUENCY);
-	v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_S_PARM);
-	v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_ENUM_FRAMESIZES);
-	v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_ENUM_FRAMEINTERVALS);
+	vivid_disable_unused_ioctls(dev, has_tuner, has_modulator,
+				    in_type_counter, out_type_counter);
 
 	/* configure internal data */
 	dev->fmt_cap = &vivid_formats[0];
-- 
2.26.2

