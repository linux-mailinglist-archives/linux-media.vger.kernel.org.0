Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29D5525B15F
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbgIBQSn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:18:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:53496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbgIBQKr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:47 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D5AAF207EA;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=mAfBaiRJRkp25BV0rN9ichUjyzowk2QtFfeZRpXBqio=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YrSjrgBqjLvEimNjiscWYcFi/Z9/Adwx0IFgc2usu33c7Pup8nyXZmXKAtw5NML4T
         Li0vbFaztxpJNQ1Dlti/ZM2IuMf8bs3pQv2HJVEt8APXbCegWINupstRUEiZMdEKnv
         DO0pCwH8Xi9IJn++lnqNg0RiPUoZ+Gs8qBl9N0tI=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLP-000tA7-U8; Wed, 02 Sep 2020 18:10:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/38] media: vivid: move set_capabilities logic to a separate function
Date:   Wed,  2 Sep 2020 18:10:14 +0200
Message-Id: <38814ad757c215a94c964c85b67b99fb327ad7f4.1599062230.git.mchehab+huawei@kernel.org>
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

Move such logic from vivid_create_instance(), as otherwise
smatch takes forever.

The vivid_create_instance() is still a too big for my taste.
So, further cleanups are still needed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 161 +++++++++---------
 1 file changed, 83 insertions(+), 78 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index f8cb4133e1ce..e3ffc2566623 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -1001,6 +1001,88 @@ static int vivid_detect_feature_set(struct vivid_dev *dev, int inst,
 	return 0;
 }
 
+static void vivid_set_capabilities(struct vivid_dev *dev)
+{
+	if (dev->has_vid_cap) {
+		/* set up the capabilities of the video capture device */
+		dev->vid_cap_caps = dev->multiplanar ?
+			V4L2_CAP_VIDEO_CAPTURE_MPLANE :
+			V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OVERLAY;
+		dev->vid_cap_caps |= V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
+		if (dev->has_audio_inputs)
+			dev->vid_cap_caps |= V4L2_CAP_AUDIO;
+		if (dev->has_tv_tuner)
+			dev->vid_cap_caps |= V4L2_CAP_TUNER;
+	}
+	if (dev->has_vid_out) {
+		/* set up the capabilities of the video output device */
+		dev->vid_out_caps = dev->multiplanar ?
+			V4L2_CAP_VIDEO_OUTPUT_MPLANE :
+			V4L2_CAP_VIDEO_OUTPUT;
+		if (dev->has_fb)
+			dev->vid_out_caps |= V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
+		dev->vid_out_caps |= V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
+		if (dev->has_audio_outputs)
+			dev->vid_out_caps |= V4L2_CAP_AUDIO;
+	}
+	if (dev->has_vbi_cap) {
+		/* set up the capabilities of the vbi capture device */
+		dev->vbi_cap_caps = (dev->has_raw_vbi_cap ? V4L2_CAP_VBI_CAPTURE : 0) |
+				    (dev->has_sliced_vbi_cap ? V4L2_CAP_SLICED_VBI_CAPTURE : 0);
+		dev->vbi_cap_caps |= V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
+		if (dev->has_audio_inputs)
+			dev->vbi_cap_caps |= V4L2_CAP_AUDIO;
+		if (dev->has_tv_tuner)
+			dev->vbi_cap_caps |= V4L2_CAP_TUNER;
+	}
+	if (dev->has_vbi_out) {
+		/* set up the capabilities of the vbi output device */
+		dev->vbi_out_caps = (dev->has_raw_vbi_out ? V4L2_CAP_VBI_OUTPUT : 0) |
+				    (dev->has_sliced_vbi_out ? V4L2_CAP_SLICED_VBI_OUTPUT : 0);
+		dev->vbi_out_caps |= V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
+		if (dev->has_audio_outputs)
+			dev->vbi_out_caps |= V4L2_CAP_AUDIO;
+	}
+	if (dev->has_sdr_cap) {
+		/* set up the capabilities of the sdr capture device */
+		dev->sdr_cap_caps = V4L2_CAP_SDR_CAPTURE | V4L2_CAP_TUNER;
+		dev->sdr_cap_caps |= V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
+	}
+	/* set up the capabilities of the radio receiver device */
+	if (dev->has_radio_rx)
+		dev->radio_rx_caps = V4L2_CAP_RADIO | V4L2_CAP_RDS_CAPTURE |
+				     V4L2_CAP_HW_FREQ_SEEK | V4L2_CAP_TUNER |
+				     V4L2_CAP_READWRITE;
+	/* set up the capabilities of the radio transmitter device */
+	if (dev->has_radio_tx)
+		dev->radio_tx_caps = V4L2_CAP_RDS_OUTPUT | V4L2_CAP_MODULATOR |
+				     V4L2_CAP_READWRITE;
+
+	/* set up the capabilities of meta capture device */
+	if (dev->has_meta_cap) {
+		dev->meta_cap_caps = V4L2_CAP_META_CAPTURE |
+				     V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
+		if (dev->has_audio_inputs)
+			dev->meta_cap_caps |= V4L2_CAP_AUDIO;
+		if (dev->has_tv_tuner)
+			dev->meta_cap_caps |= V4L2_CAP_TUNER;
+	}
+	/* set up the capabilities of meta output device */
+	if (dev->has_meta_out) {
+		dev->meta_out_caps = V4L2_CAP_META_OUTPUT |
+				     V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
+		if (dev->has_audio_outputs)
+			dev->meta_out_caps |= V4L2_CAP_AUDIO;
+	}
+	/* set up the capabilities of the touch capture device */
+	if (dev->has_touch_cap) {
+		dev->touch_cap_caps = V4L2_CAP_TOUCH | V4L2_CAP_STREAMING |
+				      V4L2_CAP_READWRITE;
+		dev->touch_cap_caps |= dev->multiplanar ?
+			V4L2_CAP_VIDEO_CAPTURE_MPLANE : V4L2_CAP_VIDEO_CAPTURE;
+	}
+}
+
 static void vivid_disable_unused_ioctls(struct vivid_dev *dev,
 					bool has_tuner,
 					bool has_modulator,
@@ -1153,84 +1235,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		return ret;
 	}
 
-	if (dev->has_vid_cap) {
-		/* set up the capabilities of the video capture device */
-		dev->vid_cap_caps = dev->multiplanar ?
-			V4L2_CAP_VIDEO_CAPTURE_MPLANE :
-			V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OVERLAY;
-		dev->vid_cap_caps |= V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
-		if (dev->has_audio_inputs)
-			dev->vid_cap_caps |= V4L2_CAP_AUDIO;
-		if (dev->has_tv_tuner)
-			dev->vid_cap_caps |= V4L2_CAP_TUNER;
-	}
-	if (dev->has_vid_out) {
-		/* set up the capabilities of the video output device */
-		dev->vid_out_caps = dev->multiplanar ?
-			V4L2_CAP_VIDEO_OUTPUT_MPLANE :
-			V4L2_CAP_VIDEO_OUTPUT;
-		if (dev->has_fb)
-			dev->vid_out_caps |= V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
-		dev->vid_out_caps |= V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
-		if (dev->has_audio_outputs)
-			dev->vid_out_caps |= V4L2_CAP_AUDIO;
-	}
-	if (dev->has_vbi_cap) {
-		/* set up the capabilities of the vbi capture device */
-		dev->vbi_cap_caps = (dev->has_raw_vbi_cap ? V4L2_CAP_VBI_CAPTURE : 0) |
-				    (dev->has_sliced_vbi_cap ? V4L2_CAP_SLICED_VBI_CAPTURE : 0);
-		dev->vbi_cap_caps |= V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
-		if (dev->has_audio_inputs)
-			dev->vbi_cap_caps |= V4L2_CAP_AUDIO;
-		if (dev->has_tv_tuner)
-			dev->vbi_cap_caps |= V4L2_CAP_TUNER;
-	}
-	if (dev->has_vbi_out) {
-		/* set up the capabilities of the vbi output device */
-		dev->vbi_out_caps = (dev->has_raw_vbi_out ? V4L2_CAP_VBI_OUTPUT : 0) |
-				    (dev->has_sliced_vbi_out ? V4L2_CAP_SLICED_VBI_OUTPUT : 0);
-		dev->vbi_out_caps |= V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
-		if (dev->has_audio_outputs)
-			dev->vbi_out_caps |= V4L2_CAP_AUDIO;
-	}
-	if (dev->has_sdr_cap) {
-		/* set up the capabilities of the sdr capture device */
-		dev->sdr_cap_caps = V4L2_CAP_SDR_CAPTURE | V4L2_CAP_TUNER;
-		dev->sdr_cap_caps |= V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
-	}
-	/* set up the capabilities of the radio receiver device */
-	if (dev->has_radio_rx)
-		dev->radio_rx_caps = V4L2_CAP_RADIO | V4L2_CAP_RDS_CAPTURE |
-				     V4L2_CAP_HW_FREQ_SEEK | V4L2_CAP_TUNER |
-				     V4L2_CAP_READWRITE;
-	/* set up the capabilities of the radio transmitter device */
-	if (dev->has_radio_tx)
-		dev->radio_tx_caps = V4L2_CAP_RDS_OUTPUT | V4L2_CAP_MODULATOR |
-				     V4L2_CAP_READWRITE;
-
-	/* set up the capabilities of meta capture device */
-	if (dev->has_meta_cap) {
-		dev->meta_cap_caps = V4L2_CAP_META_CAPTURE |
-				     V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
-		if (dev->has_audio_inputs)
-			dev->meta_cap_caps |= V4L2_CAP_AUDIO;
-		if (dev->has_tv_tuner)
-			dev->meta_cap_caps |= V4L2_CAP_TUNER;
-	}
-	/* set up the capabilities of meta output device */
-	if (dev->has_meta_out) {
-		dev->meta_out_caps = V4L2_CAP_META_OUTPUT |
-				     V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
-		if (dev->has_audio_outputs)
-			dev->meta_out_caps |= V4L2_CAP_AUDIO;
-	}
-	/* set up the capabilities of the touch capture device */
-	if (dev->has_touch_cap) {
-		dev->touch_cap_caps = V4L2_CAP_TOUCH | V4L2_CAP_STREAMING |
-				      V4L2_CAP_READWRITE;
-		dev->touch_cap_caps |= dev->multiplanar ?
-			V4L2_CAP_VIDEO_CAPTURE_MPLANE : V4L2_CAP_VIDEO_CAPTURE;
-	}
+	vivid_set_capabilities(dev);
 
 	ret = -ENOMEM;
 	/* initialize the test pattern generator */
-- 
2.26.2

