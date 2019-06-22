Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7C324F301
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2019 03:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfFVBEm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jun 2019 21:04:42 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34596 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfFVBEm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jun 2019 21:04:42 -0400
Received: by mail-pf1-f193.google.com with SMTP id c85so4427372pfc.1
        for <linux-media@vger.kernel.org>; Fri, 21 Jun 2019 18:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eng.ucsd.edu; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=GfizAMGSCO2YDH0saSeDriLC3WuBj3aonCixX8hvm+M=;
        b=WjE0UV2zFRzt+OwF5oLL6YtpYoOZvtc1PCDVPa6t6K+AwAxebcFBGTwvu0jFojzJFt
         uXMdlRxqk9OEjOWC1GmwYKunk9GjEt8hWVgDfbX5ZAb7dZXYzsBdG1NfPuhMBBGpZ1IR
         Qd3j8PePYowCqtIwRkeDXdIRU2kh/BX10Ya7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=GfizAMGSCO2YDH0saSeDriLC3WuBj3aonCixX8hvm+M=;
        b=IMwxMIWqbgeMQ4NheNKOyrT0a2yrGl1oNlXmAKHIyveLIhJgT8vHnXSbvOP5jaXD5U
         0SMSzIDbRJb5WY7UVthezgPSQTeQKs2s5Uh4nVMGkrrQkxbgg7tESRmbprApHWkiJpII
         36TypYCycEafLmmAOFNn8RoVaVCeViw/yBZBzYggDmx3rk+fV1UwxgFfhHIcXa+y4sUd
         eG3urqMh53j80lfml0ni8zn4D7CjL3xD12SE8kpDzHIx1Gdq1zJVwCvVAemirzQUyI9F
         bvL+nt/s9fFi5Mbdx6838mN/1xo01r7hu+k/qsLjbjYtHEUHhTe+Yd7182maAgZRJ0E/
         6oSg==
X-Gm-Message-State: APjAAAUVfYaHtNuZ2TNJWtyQVMBAJcvdy9iX7330Gul4yHiv+ftLZj5g
        fvnCmMt8okllYe4TO/nEhyziHA==
X-Google-Smtp-Source: APXvYqxZCTGfZsPDZqVX7ZBMfh8KlIfIG/U6ZDitvqNpfZviVk1euhZK0v3XmyusRjcBbpkndQUnsg==
X-Received: by 2002:a63:db05:: with SMTP id e5mr21195210pgg.121.1561165481427;
        Fri, 21 Jun 2019 18:04:41 -0700 (PDT)
Received: from luke-XPS-13 (cpe-66-75-255-136.san.res.rr.com. [66.75.255.136])
        by smtp.gmail.com with ESMTPSA id s24sm3814436pfh.133.2019.06.21.18.04.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 18:04:40 -0700 (PDT)
Date:   Fri, 21 Jun 2019 18:04:38 -0700
From:   Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
To:     hverkuil@xs4all.nl
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 RESEND] Media: Radio: Change
 devm_k*alloc to k*alloc
Message-ID: <20190622010438.GA10125@luke-XPS-13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change devm_k*alloc to k*alloc to manually allocate memory 

The manual allocation and freeing of memory is necessary because when
the USB radio is disconnected, the memory associated with devm_k*alloc
is freed. Meaning if we still have unresolved references to the radio
device, then we get use-after-free errors. 

This patch fixes this by manually allocating memory, and freeing it in 
the v4l2.release callback that gets called when the last radio device
exits. 

Reported-and-tested-by: syzbot+a4387f5b6b799f6becbf@syzkaller.appspotmail.com
Signed-off-by: Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
---
Changes in RESEND: 
+ Added reported-and-tested-by tag
+ Further updated description
- Removed whitespace in patch description
Changes in v4:
- Removed whitespace to fix checkpatch.pl errors
Changes in v3:
+ Update release method in v2 for v4l2.release callback 
+ Assign v4l2.release callback to release method
- Remove vdev.release callback used in v2
Changes in v2:
+ Create raremono_device_release method
+ Assign vdev.release to release method
+ Added gotos for better memory cleanup
- Removed incorrect kfrees in usb_release in v1
Changes in v1: 
+ Added k*allocs to raremono_device struct, and buffs
+ Added kfrees on error conditions in usb_probe
+ Added kfrees in usb_release
- Removed devm_k*allocs

 drivers/media/radio/radio-raremono.c | 31 +++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/media/radio/radio-raremono.c b/drivers/media/radio/radio-raremono.c
index 5e782b3c2fa9..a5b12372eccb 100644
--- a/drivers/media/radio/radio-raremono.c
+++ b/drivers/media/radio/radio-raremono.c
@@ -271,6 +271,15 @@ static int vidioc_g_frequency(struct file *file, void *priv,
 	return 0;
 }
 
+static void raremono_device_release(struct v4l2_device *v4l2_dev)
+{
+	struct raremono_device *radio = to_raremono_dev(v4l2_dev);
+
+	kfree(radio->buffer);
+	kfree(radio);
+}
+
+
 /* File system interface */
 static const struct v4l2_file_operations usb_raremono_fops = {
 	.owner		= THIS_MODULE,
@@ -295,12 +304,14 @@ static int usb_raremono_probe(struct usb_interface *intf,
 	struct raremono_device *radio;
 	int retval = 0;
 
-	radio = devm_kzalloc(&intf->dev, sizeof(struct raremono_device), GFP_KERNEL);
-	if (radio)
-		radio->buffer = devm_kmalloc(&intf->dev, BUFFER_LENGTH, GFP_KERNEL);
-
-	if (!radio || !radio->buffer)
+	radio = kzalloc(sizeof(struct raremono_device), GFP_KERNEL);
+	if (!radio)
+		return -ENOMEM;
+	radio->buffer = kmalloc(BUFFER_LENGTH, GFP_KERNEL);
+	if (!radio->buffer) {
+		kfree(radio);
 		return -ENOMEM;
+	}
 
 	radio->usbdev = interface_to_usbdev(intf);
 	radio->intf = intf;
@@ -324,7 +335,8 @@ static int usb_raremono_probe(struct usb_interface *intf,
 	if (retval != 3 ||
 	    (get_unaligned_be16(&radio->buffer[1]) & 0xfff) == 0x0242) {
 		dev_info(&intf->dev, "this is not Thanko's Raremono.\n");
-		return -ENODEV;
+		retval = -ENODEV;
+		goto free_mem;
 	}
 
 	dev_info(&intf->dev, "Thanko's Raremono connected: (%04X:%04X)\n",
@@ -333,7 +345,7 @@ static int usb_raremono_probe(struct usb_interface *intf,
 	retval = v4l2_device_register(&intf->dev, &radio->v4l2_dev);
 	if (retval < 0) {
 		dev_err(&intf->dev, "couldn't register v4l2_device\n");
-		return retval;
+		goto free_mem;
 	}
 
 	mutex_init(&radio->lock);
@@ -345,6 +357,7 @@ static int usb_raremono_probe(struct usb_interface *intf,
 	radio->vdev.ioctl_ops = &usb_raremono_ioctl_ops;
 	radio->vdev.lock = &radio->lock;
 	radio->vdev.release = video_device_release_empty;
+	radio->v4l2_dev.release = raremono_device_release;
 
 	usb_set_intfdata(intf, &radio->v4l2_dev);
 
@@ -360,6 +373,10 @@ static int usb_raremono_probe(struct usb_interface *intf,
 	}
 	dev_err(&intf->dev, "could not register video device\n");
 	v4l2_device_unregister(&radio->v4l2_dev);
+
+free_mem:
+	kfree(radio->buffer);
+	kfree(radio);
 	return retval;
 }
 
-- 
2.20.1

