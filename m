Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95A96340A9
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 09:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbfFDHtV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 03:49:21 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:32778 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbfFDHtV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 03:49:21 -0400
Received: by mail-pg1-f195.google.com with SMTP id h17so9878416pgv.0;
        Tue, 04 Jun 2019 00:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0dEnqFti2YXtQ+SGgrU+y7p7F1e1QKCL0JuN/nDle0w=;
        b=qSCSBO5hjq1MTvWRs5IECdL+RaYyVZZK5WEvA8gtf507w9V/gD+djPDx0Bb7yzkmwi
         7HWCxiU34gdirN5WdQ98l/EXRPGUps3qIU9sKbSyqcDjyW2BD+JDHkmWS/J8bGm2qA1v
         ttV7DEz0WSkjCehneiEdPcqui56qirv0dwO/YUtnOyyx5yKSyZSX1W0LUMtrou+hxSpC
         fcMXMHEvzxpIGXJnJVfn+ytewEHf++JB4trsh1AhC4Yd5YlC5egUroZ527xeloTAByE3
         pFPq3kHjLpE/LYsOjx5ZDYQvluWsRURFezTClwcCqPdS9phcsodNgfGa24Ucy786FB96
         r/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0dEnqFti2YXtQ+SGgrU+y7p7F1e1QKCL0JuN/nDle0w=;
        b=EktE6kc9z6wM3LnTrXArnImN8r2mg6f/NeT3cxgJmcciozlysDIKq45UAdycTAz/HM
         4Ih1AAej1s37z7WYyeOAkLkPf9tHAY2M5LtXQC4ZjQf42m6/AVppf88uYhjrVb30P9AA
         +A1j220tJi+oR8UOCBlAhRQqxsb0CBhfm7diZqjRofqdz1gpfLEn8IhpD3mOhjGhUr+9
         IROta4sth4Xh2AzOvbCOVIXs/y/5aEMJRZyddZAs9b76wBMuiiZsXAubTljwo8OupPNS
         vYM1L8WMZKaDkb38ZAI19tFX/hCrjufLR/8/neGJrT/VWjQ1Rxcg7oyn+bS0DHmT+ver
         IR2A==
X-Gm-Message-State: APjAAAUuQDjnsL9hOsmnsCxKdkrR7NqHqf4COLGWz6xXen2wMxWgzc97
        cbzYHt4Pb0MfKdo4ymQA+0E=
X-Google-Smtp-Source: APXvYqwR3/qqkUWtVuOpkE4cdTOdma9vsrICt+qC+uUBUW3eIyK8DNzACK3QdRsdpQK6LD5qFtSMOQ==
X-Received: by 2002:a17:90a:2e87:: with SMTP id r7mr33960547pjd.112.1559634560323;
        Tue, 04 Jun 2019 00:49:20 -0700 (PDT)
Received: from xy-data.openstacklocal (ecs-159-138-22-150.compute.hwclouds-dns.com. [159.138.22.150])
        by smtp.gmail.com with ESMTPSA id k13sm9829540pgq.45.2019.06.04.00.49.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 04 Jun 2019 00:49:19 -0700 (PDT)
From:   Young Xiao <92siuyang@gmail.com>
To:     prabhakar.csengg@gmail.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl
Cc:     Young Xiao <92siuyang@gmail.com>
Subject: [PATCH] media: davinci: vpif_capture: fix memory leak in vpif_probe()
Date:   Tue,  4 Jun 2019 15:50:17 +0800
Message-Id: <1559634617-16264-1-git-send-email-92siuyang@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If vpif_probe() fails on v4l2_device_register() and vpif_probe_complete(),
then memory allocated at initialize_vpif() for global vpif_obj.dev[i]
become unreleased.

The patch adds deallocation of vpif_obj.dev[i] on the error path.

Signed-off-by: Young Xiao <92siuyang@gmail.com>
---
 drivers/media/platform/davinci/vpif_capture.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
index b5aacb0..277d500 100644
--- a/drivers/media/platform/davinci/vpif_capture.c
+++ b/drivers/media/platform/davinci/vpif_capture.c
@@ -1385,6 +1385,14 @@ static int initialize_vpif(void)
 	return err;
 }
 
+static void free_vpif_objs(void)
+{
+	int i;
+
+	for (i = 0; i < VPIF_DISPLAY_MAX_DEVICES; i++)
+		kfree(vpif_obj.dev[i]);
+}
+
 static int vpif_async_bound(struct v4l2_async_notifier *notifier,
 			    struct v4l2_subdev *subdev,
 			    struct v4l2_async_subdev *asd)
@@ -1654,7 +1662,7 @@ static __init int vpif_probe(struct platform_device *pdev)
 	err = v4l2_device_register(vpif_dev, &vpif_obj.v4l2_dev);
 	if (err) {
 		v4l2_err(vpif_dev->driver, "Error registering v4l2 device\n");
-		goto cleanup;
+		goto vpif_free;
 	}
 
 	while ((res = platform_get_resource(pdev, IORESOURCE_IRQ, res_idx))) {
@@ -1701,7 +1709,10 @@ static __init int vpif_probe(struct platform_device *pdev)
 				  "registered sub device %s\n",
 				   subdevdata->name);
 		}
-		vpif_probe_complete();
+		err = vpif_probe_complete();
+		if (err) {
+			goto probe_subdev_out;
+		}
 	} else {
 		vpif_obj.notifier.ops = &vpif_async_ops;
 		err = v4l2_async_notifier_register(&vpif_obj.v4l2_dev,
@@ -1720,6 +1731,8 @@ static __init int vpif_probe(struct platform_device *pdev)
 	kfree(vpif_obj.sd);
 vpif_unregister:
 	v4l2_device_unregister(&vpif_obj.v4l2_dev);
+vpif_free:
+	free_vpif_objs();
 cleanup:
 	v4l2_async_notifier_cleanup(&vpif_obj.notifier);
 
@@ -1748,8 +1761,8 @@ static int vpif_remove(struct platform_device *device)
 		ch = vpif_obj.dev[i];
 		/* Unregister video device */
 		video_unregister_device(&ch->video_dev);
-		kfree(vpif_obj.dev[i]);
 	}
+	free_vpif_objs();
 	return 0;
 }
 
-- 
2.7.4

