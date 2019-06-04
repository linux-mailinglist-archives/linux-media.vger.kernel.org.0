Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4432D34695
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 14:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbfFDMZZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 08:25:25 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44330 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfFDMZY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 08:25:24 -0400
Received: by mail-pg1-f194.google.com with SMTP id n2so10260569pgp.11;
        Tue, 04 Jun 2019 05:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wnihfRtnOZly/8sbh9urZ5IlVD0j11FdjgEyNkCSnR0=;
        b=E2HdfzpWcOtm9481R5yVrEJB1Cg7gFP3Uw9A8bL6m6QonZkiLDJYJbk757getw1IaH
         Fv5bP64xuaxdQ5b9w0BFh4u7BPnH3b0L4d8wTWRk/K0inaP0sdbYIK3by/SF77SSGnmv
         wD5wbDhZpaCtusxXLbmkvHj6aTkBjbDh2QQqp6yp2BaHNxQZN0GAfh9EqpOnxEgcMktg
         Ff+KtGLQ1UzSyKsl7+WRk7rXtZDon+MgvFwaD9LMwKyX5Bp7PglFWbKeG/jWkb677OUp
         6sBRDMotvgkjBB/VtJIBtX5EJIkQL0LAfVE9PFrCoOgLc2jwwVH97TBkINUsVpAv7PX8
         QqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wnihfRtnOZly/8sbh9urZ5IlVD0j11FdjgEyNkCSnR0=;
        b=daNTIJCLcy1sVUMjrTm0zpIcA9e0Utm7/WxlfV1cCWmlOzgVSl7f4F7uEQbaauxPJ4
         hA2giBkEnyv+eIN058ncSkQUvQ/1U5si/V2FrehxGbE8dRUQsagcAmuDfNm2urw5pjAX
         BimQ/wEHj9AgDtcdGLssTTpc2UXkRN2g8hx78vNtMcGUbZyS24M9GP4NQ/x6kxpMlaPt
         SaDHoqSRcWTGZLD2+D5VLjaFgqz2bJ/WI9SxQm0Besv04bw1P3naOs/zXs9OyblrUPYn
         fSAb4gSng/CDw8A/MWafA2i86pRQIWjqbV1187G4M7KnN7OyTzx8f5m3W1mRnbZFFknR
         FjXw==
X-Gm-Message-State: APjAAAUReISI1PYkmH1toEAHawNqM0kgiPQCrPyXChaHcV3QAdfBCwHj
        kyqifWzYt1PfCTl/F625Pbo=
X-Google-Smtp-Source: APXvYqzTlaNsaIjqCx2gUiMYqRlw5zgTvcx8dM1r+OCqK8xtt80+DErHL4mnu2N1mhYlevg/dow/Ug==
X-Received: by 2002:a62:a508:: with SMTP id v8mr37065808pfm.87.1559651124115;
        Tue, 04 Jun 2019 05:25:24 -0700 (PDT)
Received: from xy-data.openstacklocal (ecs-159-138-22-150.compute.hwclouds-dns.com. [159.138.22.150])
        by smtp.gmail.com with ESMTPSA id j22sm24660576pfn.121.2019.06.04.05.25.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 04 Jun 2019 05:25:23 -0700 (PDT)
From:   Young Xiao <92siuyang@gmail.com>
To:     prabhakar.csengg@gmail.com, mchehab@kernel.org, hverkuil@xs4all.nl,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Young Xiao <92siuyang@gmail.com>
Subject: [PATCH] media: davinci: vpif_capture: fix memory leak in vpif_probe()
Date:   Tue,  4 Jun 2019 20:26:33 +0800
Message-Id: <1559651193-17982-1-git-send-email-92siuyang@gmail.com>
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
 drivers/media/platform/davinci/vpif_capture.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
index b5aacb0..75c2c10 100644
--- a/drivers/media/platform/davinci/vpif_capture.c
+++ b/drivers/media/platform/davinci/vpif_capture.c
@@ -1385,6 +1385,14 @@ static int initialize_vpif(void)
 	return err;
 }
 
+static inline void free_vpif_objs(void)
+{
+	int i;
+
+	for (i = 0; i < VPIF_CAPTURE_MAX_DEVICES; i++)
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
@@ -1701,7 +1709,9 @@ static __init int vpif_probe(struct platform_device *pdev)
 				  "registered sub device %s\n",
 				   subdevdata->name);
 		}
-		vpif_probe_complete();
+		err = vpif_probe_complete();
+		if (err)
+			goto probe_subdev_out;
 	} else {
 		vpif_obj.notifier.ops = &vpif_async_ops;
 		err = v4l2_async_notifier_register(&vpif_obj.v4l2_dev,
@@ -1720,6 +1730,8 @@ static __init int vpif_probe(struct platform_device *pdev)
 	kfree(vpif_obj.sd);
 vpif_unregister:
 	v4l2_device_unregister(&vpif_obj.v4l2_dev);
+vpif_free:
+	free_vpif_objs();
 cleanup:
 	v4l2_async_notifier_cleanup(&vpif_obj.notifier);
 
-- 
2.7.4

