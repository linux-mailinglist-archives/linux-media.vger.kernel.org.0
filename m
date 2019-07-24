Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 314F7740A7
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 23:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387468AbfGXVJg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 17:09:36 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36715 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbfGXVJg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 17:09:36 -0400
Received: by mail-pg1-f193.google.com with SMTP id l21so21819214pgm.3
        for <linux-media@vger.kernel.org>; Wed, 24 Jul 2019 14:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=JoEE8gSxt66k/dUSpmzJSQ8wHyViOE9UUFOVkIM1uSk=;
        b=afRBggos2g+xFv+3mpyakpp/ifMbMVvFaLObNVx5Wgs1Pqvd++uObRSwBHl8xF/Jwa
         TfGEmDCaHWeGouhSdVTdJ2kfjJlQh9dCqVeSOm9n2p/Z4wi2/gzW3aLFQDNUBWwP1fO3
         qHhre6/ptS7GeS3VnjdMIvp03l8DZE3lX41Wi0/a3GZ0Bi5MCL0ZeP2+K9iAMrM5GRqf
         lzFzvPrKA+UShRDqIMDpM+5Sn8IZ9XfxtZUB1xrTmoYNQXxe/H/8hbAb8OcqhVY6mjIU
         KD2sv5GakRIttoDckaQR/W3HncgOb7JIS2dgDmbiBT+iIR5GS7R7wSbyYPF6JMPhAN3a
         fR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=JoEE8gSxt66k/dUSpmzJSQ8wHyViOE9UUFOVkIM1uSk=;
        b=g69cuQhedsOQho3F+dxqrjfQeS7WH9SSZcfPg22iKb/GKTuxxK7ZxGJNobxbJNmi8q
         lPIZX4jJ+O+1PRAIAAKRXLXNy1dOMzGnV4j9NyGvIzqSJrvCMwx0x9CGsA2Cwv4PNUro
         kWvrfh8dBNgFdVH6pWCgQEywa/k17UfOUwWosp2aLW8fpkCJ2ZNm1PiU7R/qNV3qVARD
         J7cOYtGNEOZlwBQoSTwryHLZjfVeoFksJfeu0j2/QWi3r8rM8EWpMmiDpU0zHwnrAhuz
         1hSUKesLPUjiFs5k3Osgik1SHOt67PDIJE/V5NE/KTm+TbBjHqPb0b6SH1qFIACeOKTH
         6bew==
X-Gm-Message-State: APjAAAV7B5CVxZ7EmEqg9L4Li3hr6lPcsvAuGBybyxgw3gU4LiDdWtT3
        aJOz8j7yaG+0zibpYsum1QDYVvCwINU=
X-Google-Smtp-Source: APXvYqzjTjeyFOdGM5hzY6tgrVtacthBASvX4zPID05vq8XZTaLJGx858/hegHkL0I9zT479IP8urA==
X-Received: by 2002:a63:1918:: with SMTP id z24mr79665970pgl.94.1564002575143;
        Wed, 24 Jul 2019 14:09:35 -0700 (PDT)
Received: from [10.0.2.15] (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id h9sm43164284pgh.51.2019.07.24.14.09.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 14:09:34 -0700 (PDT)
Subject: Re: [PATCH] media input infrastructure:tw686x: Added Added custom
 function to set vdev->release in tw686x driver
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <20190724151036.26868-1-mbalant3@gmail.com>
 <CAAEAJfAHLPqx41H_pQY=wG+xdQJv-HFvFu9zTYR5GNP=wmckcQ@mail.gmail.com>
From:   =?UTF-8?Q?Mark_Balan=c3=a7ian?= <mbalant3@gmail.com>
Cc:     linux-media@vger.kernel.org
Message-ID: <357ed539-6c9c-2674-d806-0f83a520bbf4@gmail.com>
Date:   Wed, 24 Jul 2019 14:05:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAAEAJfAHLPqx41H_pQY=wG+xdQJv-HFvFu9zTYR5GNP=wmckcQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

I just test built the kernel with my patch included and things run fine. 
To guide me in my assignment, could you please clarify what Hans Verkuil 
had been mentioning would be a good thing to code, he said in one of our 
previous emails:

What tw686x_video_free() does really should be done in the release function
of the video_device: vdev->release is currently set to video_device_release,
but that should be a custom function that calls dev->dma_ops->free.

But in order to provide a thorough explanation that makes sense, as you 
mentioned and that I'd like to do, does the custom function and edits I 
made provide the functionality Hans mentioned, as per how it is seen in 
the code below?:

(Please note I didn't provide a description this time as the purpose of 
this email is to get a better idea of how to make one)

 From 6d38673ca7d2206b21deb7d28971f52ee8453346 Mon Sep 17 00:00:00 2001
From: Mark Balantzyan <mbalant3@gmail.com>
Date: Wed, 24 Jul 2019 14:01:30 -0700
Subject: [PATCH] media input infrastructure:tw686x: Added custom 
function to provide dev->dma_ops->free for vdev->release in 
tw686x_video_init() in tw686x driver

---
  drivers/media/pci/tw686x/tw686x-video.c | 24 +++++++++++++++++++-----
  1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/tw686x/tw686x-video.c 
b/drivers/media/pci/tw686x/tw686x-video.c
index 3a06c000..1b875a7c 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -1151,18 +1151,32 @@ void tw686x_video_irq(struct tw686x_dev *dev, 
unsigned long requests,
      }
  }

+void tw686x_video_device_release(struct tw686x_video_channel *vc) {
+
+    struct tw686x_dev *dev = vc->dev;
+
+    unsigned int ch;
+
+    for (ch = 0; ch < max_channels(dev); ch++) {
+        struct tw686x_video_channel *vc = &dev->video_channels[ch];
+
+    }
+
+    dev->dma_ops->free;
+
+    video_device_release((struct video_device*)dev);
+
+}
+
  void tw686x_video_free(struct tw686x_dev *dev)
  {
-    unsigned int ch, pb;
+    unsigned int ch;

      for (ch = 0; ch < max_channels(dev); ch++) {
          struct tw686x_video_channel *vc = &dev->video_channels[ch];

          video_unregister_device(vc->device);

-        if (dev->dma_ops->free)
-            for (pb = 0; pb < 2; pb++)
-                dev->dma_ops->free(vc, pb);
      }
  }

@@ -1277,7 +1291,7 @@ int tw686x_video_init(struct tw686x_dev *dev)
          snprintf(vdev->name, sizeof(vdev->name), "%s video", dev->name);
          vdev->fops = &tw686x_video_fops;
          vdev->ioctl_ops = &tw686x_video_ioctl_ops;
-        vdev->release = video_device_release;
+        vdev->release = tw686x_video_device_release;
          vdev->v4l2_dev = &dev->v4l2_dev;
          vdev->queue = &vc->vidq;
          vdev->tvnorms = V4L2_STD_525_60 | V4L2_STD_625_50;
-- 
2.17.1

