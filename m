Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0DF3CAD7D
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 22:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240497AbhGOUFH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 16:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346563AbhGOUE4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 16:04:56 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 518D7C0613E6;
        Thu, 15 Jul 2021 12:50:02 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 70so4253768pgh.2;
        Thu, 15 Jul 2021 12:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qko599Uq/EcKOeMa5T6Nbxwrwz7YFbQgmwQPU6o2zKk=;
        b=TEHAbMt0EG92C22jB5zzkNiVLa1JG5U+5zkwDILA21nD3DHz4nsqWmpxMAXThr0ffx
         GC0uOu5iHTM2FgDEGPCZyv1BxjtM+37RMZmVbn9s98aWdwueIyR/N9fwiDGrg9LZqg1A
         Q+XAkVVGzgTbCG2HbM7IM/upocugVJVK3eUKk7Q8mE9CRYIEropQs9+PffCaVgv4Wgx7
         Oi92j/iDLnuWRuTwQG2xqk4t8sSt3ezjXCDIb7vSzW9ZI7a2kECb7B+lM3kyrV2Ipa/J
         QAhnoZ7cpE3UyZCnUxaAKXPJ7PnhJuBa/609Dp08uMSN2untVnkAh+/M4Lf2udX/bJqI
         vVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qko599Uq/EcKOeMa5T6Nbxwrwz7YFbQgmwQPU6o2zKk=;
        b=Em8PjWllnT9CL96BI4TbY3CV7jIYq4epolhmAurIzMnmmZ6pOKpTrsCSEW+YXHgXwP
         o/z5GlCu6XQsQoGvAcnrprYf25ZK1WHDmRCFsyoTg4JxtA15yHEmh51+XQOQksr8Jzo3
         dor/ZODkKLv76I9YbvVIeS1k6l/+8PD/DA8Az9oOQzrHiOJUHh6pZlZP5I+1jU6XncFz
         yS3l/YtGmheTipknDgA0fxcwZh9Ig2Xiv82yrwDiqB0ZGEGnn0JpdhDzD9XbW+htZAjq
         K7a3FJRczgIMCVVxe8nOoFlIHWB9lp/QPY/TqQwTZaAU0Pv+9HdWrpP9bAV3XFIFoCST
         1G+g==
X-Gm-Message-State: AOAM5313pB2MFm8rWVuzYm8dIodIao7sqNeAMo1emPVZlEPbtOPImb0L
        a0iS8ErsekMsg4Jew3pnmS8=
X-Google-Smtp-Source: ABdhPJy5Iy1XdpWlOnr8lZfv6Wh0OYsaY+OZCiV2nQD/fxlHso3X3itJOJBriBz6LnzNHgMlXPrQKw==
X-Received: by 2002:a63:1308:: with SMTP id i8mr6216999pgl.19.1626378601809;
        Thu, 15 Jul 2021 12:50:01 -0700 (PDT)
Received: from rishi-Nitro-AN515-52.. ([2405:201:9007:9a24:c780:f892:bcfb:77c9])
        by smtp.googlemail.com with ESMTPSA id a22sm7418045pfv.113.2021.07.15.12.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:50:01 -0700 (PDT)
From:   Saptarshi Patra <saptarshi.patra.22@gmail.com>
Cc:     saptarshi.patra.22@gmail.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <christian@brauner.io>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH] media: usb: uvc: uvc_driver: Added a function pr_info() in uvc_driver and staging: android: Decleared file operation with const keyword in android keyword
Date:   Fri, 16 Jul 2021 01:19:10 +0530
Message-Id: <20210715194911.8267-1-saptarshi.patra.22@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media: usb: uvc: uvc_driver: Decleared a function called
 pr_info()  with a string input "I changed uvcvideo driver in the Linux
 Kernel"

Added the function pr_info() to see the message / input string using dmesg

staging: android: Decleared file operation with const keyword

Warning found by the checkpatch.pl script

Signed-off-by: Saptarshi Patra <saptarshi.patra.22@gmail.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 +-
 drivers/staging/android/ashmem.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 9a791d8ef200..0b47ca75091b 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2352,7 +2352,7 @@ static int uvc_probe(struct usb_interface *intf,
 		(const struct uvc_device_info *)id->driver_info;
 	int function;
 	int ret;
-
+	pr_info("I changed uvcvideo driver in the Linux Kernel\n");
 	/* Allocate memory for the device and initialize it. */
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (dev == NULL)
diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
index ddbde3f8430e..4c6b420fbf4d 100644
--- a/drivers/staging/android/ashmem.c
+++ b/drivers/staging/android/ashmem.c
@@ -377,7 +377,7 @@ ashmem_vmfile_get_unmapped_area(struct file *file, unsigned long addr,
 
 static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
 {
-	static struct file_operations vmfile_fops;
+	static const struct file_operations vmfile_fops;
 	struct ashmem_area *asma = file->private_data;
 	int ret = 0;
 
-- 
2.30.2

