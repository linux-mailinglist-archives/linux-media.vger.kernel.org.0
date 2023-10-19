Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA7117CF08A
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 08:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232825AbjJSG6z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 02:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232821AbjJSG6y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 02:58:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C97411B
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 23:58:52 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C927C433C8;
        Thu, 19 Oct 2023 06:58:51 +0000 (UTC)
Message-ID: <eac5ceb2-bae0-4780-b494-e3f2e742f369@xs4all.nl>
Date:   Thu, 19 Oct 2023 08:58:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: pci: cx23885: check cx23885_vdev_init() return
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Language: en-US, nl
Cc:     huangsicong@iie.ac.cn
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

cx23885_vdev_init() can return a NULL pointer, but that pointer
is used in the next line without a check.

Add a NULL pointer check and go to the error unwind if it is NULL.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Sicong Huang <huangsicong@iie.ac.cn>
---
diff --git a/drivers/media/pci/cx23885/cx23885-video.c b/drivers/media/pci/cx23885/cx23885-video.c
index 9af2c5596121..51d7d720ec48 100644
--- a/drivers/media/pci/cx23885/cx23885-video.c
+++ b/drivers/media/pci/cx23885/cx23885-video.c
@@ -1354,6 +1354,10 @@ int cx23885_video_register(struct cx23885_dev *dev)
 	/* register Video device */
 	dev->video_dev = cx23885_vdev_init(dev, dev->pci,
 		&cx23885_video_template, "video");
+	if (!dev->video_dev) {
+		err = -ENOMEM;
+		goto fail_unreg;
+	}
 	dev->video_dev->queue = &dev->vb2_vidq;
 	dev->video_dev->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
 				      V4L2_CAP_AUDIO | V4L2_CAP_VIDEO_CAPTURE;
@@ -1382,6 +1386,10 @@ int cx23885_video_register(struct cx23885_dev *dev)
 	/* register VBI device */
 	dev->vbi_dev = cx23885_vdev_init(dev, dev->pci,
 		&cx23885_vbi_template, "vbi");
+	if (!dev->vbi_dev) {
+		err = -ENOMEM;
+		goto fail_unreg;
+	}
 	dev->vbi_dev->queue = &dev->vb2_vbiq;
 	dev->vbi_dev->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
 				    V4L2_CAP_AUDIO | V4L2_CAP_VBI_CAPTURE;
