Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 373F160F9F
	for <lists+linux-media@lfdr.de>; Sat,  6 Jul 2019 11:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfGFJXt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Jul 2019 05:23:49 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35244 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfGFJXt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Jul 2019 05:23:49 -0400
Received: by mail-lj1-f194.google.com with SMTP id x25so4628918ljh.2
        for <linux-media@vger.kernel.org>; Sat, 06 Jul 2019 02:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eng.ucsd.edu; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=ALgZ6/TH1TMMHtthc8F5W9I7v5d4Oi+UuqN4eyBdrw4=;
        b=dg+5O6A3uPa8xOtRcfFX0oHBjZZWZV5meMagQazqVO4+KShJachCtOw9uhwUsdM5LM
         KEYjIyZskOEqbXsRqnT1N4mdlT4aFScBIFJQH7WYEl/LJMAvvunpegz9vo/mbpjsUeDO
         VXvw3VKSj/qH3kKUOmNJIuwxsgk+QRg9tia5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=ALgZ6/TH1TMMHtthc8F5W9I7v5d4Oi+UuqN4eyBdrw4=;
        b=aJ/E5JfJ2Mz9jEdTL1Z7vfaBvei5wesKAn46MVu5PKTTm+FfJZDS132EXoIN3wFXkI
         EpIxBC6qCdnBAkLyrkhm2T+f2cM5zOOy09wF24Y/oI8gG4Y00+wkXDPBHoFUyGfLEaBV
         btQBtEWjx+CsuLV7Vb2eyd+cuf42wTvnoJgnfTuBbSgj46LjvebsNz09s2fMj6viZUSt
         eM54+bBcHXS4wvIdUbEH25jpWs3yZ2SusgngQvsg7q9NsVOtpQJi4ZAq0Jd31YBWnBqy
         T8aQF4LaZ1Dx/JweRJJPubNYde27BVFFtLFJtZ4D+T7+JM/gPH8RriT5WM0m1nPdf+dm
         obmQ==
X-Gm-Message-State: APjAAAUbfEewJaRkymoBAxBtZu8PZvmn0ttMiOO4Qxf+/d5q8hR2lySY
        KMpuDF8QFqTFUYpGKWg5QzMuRs9FSjo=
X-Google-Smtp-Source: APXvYqw1ntoBeZnHh/HrOwmD43yT4LAlmjebxU5w4jF8XDt6jcy1ycTShdBv5CNWP/NlmqE0uhqfgA==
X-Received: by 2002:a2e:894a:: with SMTP id b10mr3893454ljk.99.1562405026913;
        Sat, 06 Jul 2019 02:23:46 -0700 (PDT)
Received: from luke-XPS-13 (77-255-206-190.adsl.inetia.pl. [77.255.206.190])
        by smtp.gmail.com with ESMTPSA id 137sm2278544ljj.46.2019.07.06.02.23.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 06 Jul 2019 02:23:46 -0700 (PDT)
Date:   Sat, 6 Jul 2019 02:23:43 -0700
From:   Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
To:     hverkuil@xs4all.nl
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH RESEND] media: hdpvr: Add device num check and handling
Message-ID: <20190706092343.GA5462@luke-XPS-13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add hdpvr device num check and error handling

We need to increment the device count atomically before we checkout a
device to make sure that we do not reach the max count, otherwise we get
out-of-bounds errors as reported by syzbot. 

Reported-and-tested-by: syzbot+aac8d0d7205f112045d2@syzkaller.appspotmail.com
Signed-off-by: Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
---
Changes in V1:
+ add storing of incremented index in dev_num var
+ add bounds check on dev_num and appropriate error handling
- remove attomic_inc_return from inside of hdpvr_register call

 drivers/media/usb/hdpvr/hdpvr-core.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-core.c b/drivers/media/usb/hdpvr/hdpvr-core.c
index 29ac7fc5b039..640ef83b57c9 100644
--- a/drivers/media/usb/hdpvr/hdpvr-core.c
+++ b/drivers/media/usb/hdpvr/hdpvr-core.c
@@ -275,6 +275,7 @@ static int hdpvr_probe(struct usb_interface *interface,
 #endif
 	size_t buffer_size;
 	int i;
+	int dev_num;
 	int retval = -ENOMEM;
 
 	/* allocate memory for our device state and initialize it */
@@ -371,9 +372,18 @@ static int hdpvr_probe(struct usb_interface *interface,
 		goto reg_fail;
 	}
 #endif
-
+
+	dev_num = atomic_inc_return(&dev_nr);
+	if (dev_num >= HDPVR_MAX) {
+		v4l2_err(&dev->v4l2_dev,
+			 "max device number reached, device register failed\n");
+		atomic_dec(&dev_nr);
+		retval = -ENODEV;
+		goto reg_fail;
+	}
+
 	retval = hdpvr_register_videodev(dev, &interface->dev,
-				    video_nr[atomic_inc_return(&dev_nr)]);
+				    video_nr[dev_num]);
 	if (retval < 0) {
 		v4l2_err(&dev->v4l2_dev, "registering videodev failed\n");
 		goto reg_fail;
-- 
2.20.1

