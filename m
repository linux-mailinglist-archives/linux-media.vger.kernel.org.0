Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F042A13001
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 16:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728125AbfECOWz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 10:22:55 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:55581 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728099AbfECOWz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 May 2019 10:22:55 -0400
Received: from [IPv6:2001:420:44c1:2579:95f7:4630:1fd:459b] ([IPv6:2001:420:44c1:2579:95f7:4630:1fd:459b])
        by smtp-cloud8.xs4all.net with ESMTPA
        id MZ5NhGPuEb8gSMZ5Rhb9l7; Fri, 03 May 2019 16:22:53 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] vicodec: correctly support unbinding of the driver
Message-ID: <0206bc64-f13b-71c2-17b8-0994bbe4eb27@xs4all.nl>
Date:   Fri, 3 May 2019 16:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHxmRtBIu1/GnmHET/cVSPDFjVLhETE80XoQXGkoksGTroSTtwFF4cMtJX1H43rPq3KdSFLg/jDmrU+CGdExqCT9vUvO4jUL01G8+cpnubvNtvsjzdmP
 Cx9P4E0ZG9bTCL5J+nAimNIdE5Yte+YP+9ZLFO7Vc4E95bAlp4wID2BZOZVtl8w81T4zPMH8bhOPJsKF6j1JdoEmZ/RlQWnWl/NLp9eGWLoF7uUP9dGB0FZZ
 Luopyr0nZYeveIt1qCidDNCdThvjpqNj/xCb7ojJiR/gnImk4nopRczB5AusE1EF
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Unbinding the driver while streaming caused the driver to hang.

The cause of this was failing to use the v4l2_device release
function and the use of devm_kmalloc for the state structure.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/vicodec/vicodec-core.c | 23 +++++++++++++++----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
index 1982e3f95f67..ee7f5b8b897f 100644
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -2153,18 +2153,31 @@ static int register_instance(struct vicodec_dev *dev,
 	return 0;
 }

+static void vicodec_v4l2_dev_release(struct v4l2_device *v4l2_dev)
+{
+	struct vicodec_dev *dev = container_of(v4l2_dev, struct vicodec_dev, v4l2_dev);
+
+	v4l2_device_unregister(&dev->v4l2_dev);
+	v4l2_m2m_release(dev->stateful_enc.m2m_dev);
+	v4l2_m2m_release(dev->stateful_dec.m2m_dev);
+	v4l2_m2m_release(dev->stateless_dec.m2m_dev);
+	kfree(dev);
+}
+
 static int vicodec_probe(struct platform_device *pdev)
 {
 	struct vicodec_dev *dev;
 	int ret;

-	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;

 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret)
-		return ret;
+		goto free_dev;
+
+	dev->v4l2_dev.release = vicodec_v4l2_dev_release;

 #ifdef CONFIG_MEDIA_CONTROLLER
 	dev->mdev.dev = &pdev->dev;
@@ -2242,6 +2255,8 @@ static int vicodec_probe(struct platform_device *pdev)
 	v4l2_m2m_release(dev->stateful_enc.m2m_dev);
 unreg_dev:
 	v4l2_device_unregister(&dev->v4l2_dev);
+free_dev:
+	kfree(dev);

 	return ret;
 }
@@ -2260,12 +2275,10 @@ static int vicodec_remove(struct platform_device *pdev)
 	media_device_cleanup(&dev->mdev);
 #endif

-	v4l2_m2m_release(dev->stateful_enc.m2m_dev);
-	v4l2_m2m_release(dev->stateful_dec.m2m_dev);
 	video_unregister_device(&dev->stateful_enc.vfd);
 	video_unregister_device(&dev->stateful_dec.vfd);
 	video_unregister_device(&dev->stateless_dec.vfd);
-	v4l2_device_unregister(&dev->v4l2_dev);
+	v4l2_device_put(&dev->v4l2_dev);

 	return 0;
 }
-- 
2.20.1

