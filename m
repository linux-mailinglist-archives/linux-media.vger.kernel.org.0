Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 680712790C5
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730170AbgIYSfo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729745AbgIYSfn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:35:43 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DBE3C0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:43 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b124so3985760pfg.13
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Nrs0liKFPLw0lqeJ+aeXPOZD9rbK+FOf/tQK8Eu/mWA=;
        b=LBVmRY7dVBUx8I/55/4YTbnkCvPQRN+glxQAAZUyF2NLhjNJKeMZrAVZ67WaVf8+Hy
         RS0Ba4aysh6lGef9T5Usr6Wcj7Scq9FFdM9HtFVSJ4KY3FgGChhAcI8MNCskMDBSTSUF
         g5l5WbFMWACfHO6WLVUZd/E5M7kfpjvSJG834WMzSLqRcXQs1Qo2Xpvn7Eg5cgfqBDoT
         lC1siSlFssmBxT0zw4NlelXkIWOXlN+tTOuZD7bl/2eGqUrfMyN9GZ6LQZ15CenHUyUV
         pa6+2IZ1nUEjya+tGxAbeuBgGQXr8qe3rrqu4DpOeFZaMDO2DSCDrFgDwp1hV7tUnIQE
         GNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Nrs0liKFPLw0lqeJ+aeXPOZD9rbK+FOf/tQK8Eu/mWA=;
        b=kt4cUPbX5Eaw+SKyV0g5Q082unA1CNr8n9gdMPT1F7g9HYj+Z6o4roiZ9MCwW5KeA+
         RSYPf8RO3ddtVeWbLHIWuJfawGD0n4+QWSTxszaySGrpfkC/n5YtZIqHL3d+C0aXiI+q
         TBwnH4DMJGuXY9H7CDhvfoenPYUHYJfW3/tFNY5ZbKtqCNWNjpQELQFflJk4dBnf2TfY
         D+aZ4ut3nW3i0ogMX/e7ERpr0vxh/t09VACuhQkEi65FXmHiAGHNoAkjKqBhO9crg0cn
         XVEW40gQglSgZup7F3XTAaiGsjmo3PKRA2bE9RBcQ/wxOmlDO0ZgSURFbpNEILCl9y4u
         zUXQ==
X-Gm-Message-State: AOAM533kQWL7HihRfkQHb48FkHOuW7Unaa3D9Nbj7qb9rV8/s375fPBO
        rvKXSbjDoswSgJGpIduFOfobOg==
X-Google-Smtp-Source: ABdhPJzXKDznCFSzQ3ygmDq9Wj32Gbep4J6seWnV/lUahadd8vEhgrQLDVHygSgfvDxQs5Rg+ZyJLA==
X-Received: by 2002:a17:902:c14a:b029:d2:4345:72e with SMTP id 10-20020a170902c14ab02900d24345072emr703743plj.75.1601058942804;
        Fri, 25 Sep 2020 11:35:42 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.35.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:35:42 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 45/47] staging: media: zoran: remove deprecated .vidioc_g_jpegcomp
Date:   Fri, 25 Sep 2020 18:30:55 +0000
Message-Id: <1601058657-14042-46-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchs removed the deprecated .vidioc_g_jpegcomp and replace it
with corresponding v4l2_ctrl_ops code.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c   | 22 ++++++++++
 drivers/staging/media/zoran/zoran_driver.c | 49 ----------------------
 2 files changed, 22 insertions(+), 49 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index d7b3efa9e39f..fe52be4292fe 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1066,6 +1066,25 @@ static void zoran_subdev_notify(struct v4l2_subdev *sd, unsigned int cmd, void *
 		GPIO(zr, 7, 1);
 }
 
+static int zoran_video_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct zoran *zr = container_of(ctrl->handler, struct zoran, hdl);
+
+	switch (ctrl->id) {
+	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
+		zr->jpg_settings.jpg_comp.quality = ctrl->val;
+		return zoran_check_jpg_settings(zr, &zr->jpg_settings, 0);
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops zoran_video_ctrl_ops = {
+	.s_ctrl = zoran_video_set_ctrl,
+};
+
 /*
  *   Scan for a Buz card (actually for the PCI controller ZR36057),
  *   request the irq and map the io memory
@@ -1106,6 +1125,9 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (v4l2_ctrl_handler_init(&zr->hdl, 10))
 		goto zr_unreg;
 	zr->v4l2_dev.ctrl_handler = &zr->hdl;
+	v4l2_ctrl_new_std(&zr->hdl, &zoran_video_ctrl_ops,
+			  V4L2_CID_JPEG_COMPRESSION_QUALITY, 0,
+			  100, 1, 50);
 	spin_lock_init(&zr->spinlock);
 	mutex_init(&zr->lock);
 	if (pci_enable_device(pdev))
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index ab9eec50abad..a6fb41d03186 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -1849,53 +1849,6 @@ static int zoran_s_selection(struct file *file, void *__fh, struct v4l2_selectio
 	return res;
 }
 
-static int zoran_g_jpegcomp(struct file *file, void *__fh,
-			    struct v4l2_jpegcompression *params)
-{
-	struct zoran *zr = video_drvdata(file);
-
-	memset(params, 0, sizeof(*params));
-
-	params->quality = zr->jpg_settings.jpg_comp.quality;
-	params->APPn = zr->jpg_settings.jpg_comp.APPn;
-	memcpy(params->APP_data, zr->jpg_settings.jpg_comp.APP_data,
-	       zr->jpg_settings.jpg_comp.APP_len);
-	params->APP_len = zr->jpg_settings.jpg_comp.APP_len;
-	memcpy(params->COM_data, zr->jpg_settings.jpg_comp.COM_data,
-	       zr->jpg_settings.jpg_comp.COM_len);
-	params->COM_len = zr->jpg_settings.jpg_comp.COM_len;
-	params->jpeg_markers = zr->jpg_settings.jpg_comp.jpeg_markers;
-
-	return 0;
-}
-
-static int zoran_s_jpegcomp(struct file *file, void *__fh,
-			    const struct v4l2_jpegcompression *params)
-{
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
-	int res = 0;
-	struct zoran_jpg_settings settings;
-
-	settings = zr->jpg_settings;
-
-	settings.jpg_comp = *params;
-
-	if (fh->buffers.active != ZORAN_FREE) {
-		pci_warn(zr->pci_dev, "VIDIOC_S_JPEGCOMP called while in playback/capture mode\n");
-		res = -EBUSY;
-		return res;
-	}
-
-	res = zoran_check_jpg_settings(zr, &settings, 0);
-	if (res)
-		return res;
-	if (!fh->buffers.allocated)
-		zr->buffer_size = zoran_v4l2_calc_bufsize(&zr->jpg_settings);
-	zr->jpg_settings.jpg_comp = settings.jpg_comp;
-	return res;
-}
-
 static __poll_t zoran_poll(struct file *file, poll_table  *wait)
 {
 	struct zoran_fh *fh = file->private_data;
@@ -2176,8 +2129,6 @@ static const struct v4l2_ioctl_ops zoran_ioctl_ops = {
 	.vidioc_s_output		    = zoran_s_output,*/
 	.vidioc_g_std			    = zoran_g_std,
 	.vidioc_s_std			    = zoran_s_std,
-	.vidioc_g_jpegcomp		    = zoran_g_jpegcomp,
-	.vidioc_s_jpegcomp		    = zoran_s_jpegcomp,
 	.vidioc_reqbufs			    = zoran_reqbufs,
 	.vidioc_querybuf		    = zoran_querybuf,
 	.vidioc_qbuf			    = zoran_qbuf,
-- 
2.26.2

