Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE146660744
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 20:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232849AbjAFTkv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 14:40:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbjAFTku (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 14:40:50 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0086245
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 11:40:48 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id d17so2235906wrs.2
        for <linux-media@vger.kernel.org>; Fri, 06 Jan 2023 11:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsW+m3ul5OQdcVnmzwNhWTuRKTcC+JZAol0W+lGLwXk=;
        b=q00azvJz0ZDXV7IZ3WIisHnygM9r4eoV9ffFzYogNUeqW6COjpVbmUXQD1HcER46Wv
         A6JOlNhmLiSu9wQZLHwVMMauoPwy0KDHaCkxhLU9RCW4gNvgxcWdWeTW7Y2quA8tbUam
         d9wkydX2qZxezAxzKqHF+fUzu2AKHPIp3hornqmB79WHW1xs5IZ1uO6oUq+SurKUiEc2
         hxiyNf+dLKy9EoLa3tg/B2tHzA5NUB/qgXwNFz3OhOVrDzutxeU1F5oAd9dnilBgKtlu
         MNT6xlpWgI+6BK5djZ/+UvHFZDaE+Ts9kvIrIlB5lZrH1XBw2OHQsegJWpYqyC/k2+ng
         E0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AsW+m3ul5OQdcVnmzwNhWTuRKTcC+JZAol0W+lGLwXk=;
        b=1JqGnVnHZFxqE1v1DJusSmVd60lCRpWy43XWU4IltuCZDMRndxf04BswgXZCg7etAu
         N+e0saZbfpD1QhZXqHn5rhwdZ1M+B/nxv6J/IsL0jv3MTWRERZUaz+5ao0wOiiiTvX+m
         BEY3euUAn2FvX+GM0Apu5b68IAB8yVQIQdHENgHpLHPwUHtuKu3rnfjNRVHqZukRJw4B
         CpFTbEKHMm4TpTUJjHadZyyrQw/Y/HqhS3H3ke/PD8xGwjwBrYg66udavKm853fLJWrP
         6ZWuOaMiOHVVxKNboiC1IJrPLXVVY7lbicvLTJA79RjD8ekMMix0V8tB5CcZ6Nui3gYN
         3CXw==
X-Gm-Message-State: AFqh2krMR+tjsRcdEc8egOETbVsDWEEKNM0fKTS049/AiejDVFuWeWL4
        T0feQolyWoq3GbOdleqEifpFW4wurDFdiQ==
X-Google-Smtp-Source: AMrXdXv1yiO0KMkIhb11kmOe9UwhRGrUnDUzUMhysGvmoSAuv42gax0gvOWnRmIvbxOwN5QGQiTTgA==
X-Received: by 2002:adf:d4c7:0:b0:241:bc33:b188 with SMTP id w7-20020adfd4c7000000b00241bc33b188mr38980470wrk.18.1673034047147;
        Fri, 06 Jan 2023 11:40:47 -0800 (PST)
Received: from localhost.localdomain ([90.242.19.250])
        by smtp.gmail.com with ESMTPSA id bx9-20020a5d5b09000000b0023662245d3csm1968650wrb.95.2023.01.06.11.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 11:40:46 -0800 (PST)
Sender: Adam Pigg <piggz1@gmail.com>
From:   adam@piggz.co.uk
To:     linux-media@vger.kernel.org
Cc:     yong.deng@magewell.com, mchehab@kernel.org,
        linux-sunxi@lists.linux.dev, paul.kocialkowski@bootlin.com,
        laurent.pinchart@ideasonboard.com, Adam Pigg <adam@piggz.co.uk>
Subject: [PATCH 2/3] media: sun6i-csi: implement V4L2_CAP_IO_MC
Date:   Fri,  6 Jan 2023 19:40:37 +0000
Message-Id: <20230106194038.16018-3-adam@piggz.co.uk>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106194038.16018-1-adam@piggz.co.uk>
References: <20230106194038.16018-1-adam@piggz.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Adam Pigg <adam@piggz.co.uk>

modify sun6i_csi_capture_enum_fmt to check the mbus_codes from the
pixel format array for the supplied format

Signed-off-by: Adam Pigg <adam@piggz.co.uk>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 36 +++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 69578075421c..54beba4d2b2f 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -666,13 +666,43 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *private,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
 	u32 index = fmtdesc->index;
+	unsigned int i;
 
 	if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
 		return -EINVAL;
 
-	fmtdesc->pixelformat = sun6i_csi_capture_formats[index].pixelformat;
+	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++) {
+		const struct sun6i_csi_capture_format *format =
+			&sun6i_csi_capture_formats[i];
 
-	return 0;
+		/*
+		 * If a media bus code is specified, only consider formats that
+		 * match it.
+		 */
+		if (fmtdesc->mbus_code) {
+			unsigned int j;
+
+			if (!format->mbus_codes)
+				continue;
+
+			for (j = 0; format->mbus_codes[j]; j++) {
+				if (fmtdesc->mbus_code == format->mbus_codes[j])
+					break;
+			}
+
+			if (!format->mbus_codes[j])
+				continue;
+		}
+
+		if (index == 0) {
+			fmtdesc->pixelformat = format->pixelformat;
+			return 0;
+		}
+
+		index--;
+	}
+
+	return -EINVAL;
 }
 
 static int sun6i_csi_capture_g_fmt(struct file *file, void *private,
@@ -978,7 +1008,7 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
 
 	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
 		sizeof(video_dev->name));
-	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
 	video_dev->vfl_dir = VFL_DIR_RX;
 	video_dev->release = video_device_release_empty;
 	video_dev->fops = &sun6i_csi_capture_fops;
-- 
2.39.0

