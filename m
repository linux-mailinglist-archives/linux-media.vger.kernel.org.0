Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79AE6677B16
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbjAWMiG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:38:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231598AbjAWMiF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:38:05 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB06FE38B
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:38:04 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id h12so6664339wrv.10
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9phcZUG9auLg0bxKIvGJannf7qVnTDPudwSDuLifXA=;
        b=VjvRJ6+FeMUv4R98Vg80kPUFvb3t4rOGG2L0n/BvBl++NQHpd83iX83lHSHjkapSY7
         XoHf2p7Zkx1XKYXOZiynZSPQHkFrYePAj/+o7gd99Mkvpq5zSJZS3h4o4PqmFPWvkyJ3
         bFtMfzAzaJ1R6lm/QrkQrjYSE6e3/V0Ipo0VBu31QY57Gsr+9/3fNrCshzCg6k8uqBLb
         dr0F0hmzqTGEHp5Mq4azBOxxQZdWuaFQX5rENuH8WAXneVMoDOiKSnr58lQCNoE5zWxQ
         8zaVgsPligmMhL1FG5AtQ3RS/q+/4uNdWPNIDxpkA0Yzbm1Ta6BC3apzW5zPQHjxhRqc
         O6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9phcZUG9auLg0bxKIvGJannf7qVnTDPudwSDuLifXA=;
        b=MSyDAL8LDep+XoY1u4cTiPlKj+UiMd2tcjuSdd7FPL9iHlp9UFI0io+p36YO2YMxSM
         JcDb0emnzyhs225e4Gfl/p66GnvdL/XV/khocK4XsIaqD7lEHHKeQPZV6GvlyENZ1X82
         mMew64MlcNvPoGX3CAQsn2wMNPf8uxex7BlVex7mXz5VLh0BwVr/mkzrLYBoCxy7iinG
         9ez5ExGmlSMFTnwsby2mI0a30VXYXgtiAxHyTIuJtYpM8jI+IEApfu1pLk47EOzLIvGW
         IfyGv6A6GYSCcgCH6X82f+HtPhezfl39iiI8XRy0yU8EEQKuEL9WxrRpKyVUsEtm1t3c
         ixPw==
X-Gm-Message-State: AFqh2kroqrCZ4CXd+Sb956x1F79sttw1sr2L/mOmkl/utmqKOBsB3JgT
        uobQeb1aRgDJQSWVy/XqG0s=
X-Google-Smtp-Source: AMrXdXtI/73PQmywuJOsSpQBR5sFyd6fzwCCApfuw/gzzfctaoucA/oesi0FCWUDars87FaJ7ZSjLg==
X-Received: by 2002:adf:f689:0:b0:2bd:d095:5590 with SMTP id v9-20020adff689000000b002bdd0955590mr21375825wrp.14.1674477483513;
        Mon, 23 Jan 2023 04:38:03 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d6e83000000b00289bdda07b7sm4284510wrz.92.2023.01.23.04.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:38:02 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
        tfiga@chromium.org, sebastian.wick@redhat.com, hverkuil@xs4all.nl,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, benjamin.gaignard@collabora.com,
        lmark@codeaurora.org, labbott@redhat.com, Brian.Starkey@arm.com,
        jstultz@google.com, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org
Subject: [PATCH 2/2] media: uvcvideo: expose dma-heap hint to userspace
Date:   Mon, 23 Jan 2023 13:37:56 +0100
Message-Id: <20230123123756.401692-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123123756.401692-1-christian.koenig@amd.com>
References: <20230123123756.401692-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Expose an indicator to let userspace know from which dma_heap
to allocate for buffers of this device.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e4bcb5011360..b247026b68c5 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/atomic.h>
+#include <linux/dma-heap.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -1909,6 +1910,8 @@ static void uvc_unregister_video(struct uvc_device *dev)
 
 	if (dev->vdev.dev)
 		v4l2_device_unregister(&dev->vdev);
+	dma_heap_remove_device_link(&dev->udev->dev);
+
 #ifdef CONFIG_MEDIA_CONTROLLER
 	if (media_devnode_is_registered(dev->mdev.devnode))
 		media_device_unregister(&dev->mdev);
@@ -2181,6 +2184,14 @@ static int uvc_probe(struct usb_interface *intf,
 			 dev->uvc_version >> 8, dev->uvc_version & 0xff);
 	}
 
+	/*
+	 * UVC exports DMA-buf buffers with dirty CPU caches. For compatibility
+	 * with device which can't snoop the CPU cache it's best practice to
+	 * allocate DMA-bufs from the system DMA-heap.
+	 */
+	if (dma_heap_create_device_link(&dev->udev->dev, "system"))
+		goto error;
+
 	/* Register the V4L2 device. */
 	if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
 		goto error;
-- 
2.34.1

