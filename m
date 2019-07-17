Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8356BE1D
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 16:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbfGQOTu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 10:19:50 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:32821 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbfGQOTt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 10:19:49 -0400
Received: by mail-lj1-f193.google.com with SMTP id h10so23832562ljg.0
        for <linux-media@vger.kernel.org>; Wed, 17 Jul 2019 07:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eng.ucsd.edu; s=google;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=ALgZ6/TH1TMMHtthc8F5W9I7v5d4Oi+UuqN4eyBdrw4=;
        b=GbAckFZo8/FhS/sr0TgjOzcalYCkcrFtP/AfWtc1bYXaMcwMOhHoBYlG+eYqMNRKXF
         EARfkktXu8aBMkttzbAGOJy1LM8bVJX1FK40HivMaxhUz+zRbo4WdGN+OAXNFTjMCKkr
         S8FsublwaWgzchrOJhjHU4uJ7Fzuo5dSJTRug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=ALgZ6/TH1TMMHtthc8F5W9I7v5d4Oi+UuqN4eyBdrw4=;
        b=mitxDxHf38nmhmBJsZk3fmeUAASIiyN0Q+UxX4x2mZ2uMFpxNQGwa9zAH5xvW0SV8x
         QZpztUiD9Fi/s0fN2EuXBLoqVO6rJt/7rFuFHWSoc0VuXEKXrcw+WkIbVD7trnVvZlK+
         Gi6hDyXwLQy89gNY5C2RuL6sQjZupmwO4gnsOz967cZfvEOWQzM4mySuT7jYAvuTKpLU
         t2VucP/RZHUO2gXJNZb0D6WMlgfARxa6fpGFOwTfvtBoeNO2GagqpP5uIROgK6csmZ6C
         U1olHtSvlWtIKOYLhLjYXy8U40daNHDrcf2wfGTrLuVbr/I4poARU5ooFwKc3Up3DUEd
         8LWg==
X-Gm-Message-State: APjAAAV1A4lFYRySHk05Xs7Fye0n+R2Lc94G3H9IpAC6objgAOIsfvKQ
        UvQ7xwfYuIu3p8SVri3ZLpnmCA==
X-Google-Smtp-Source: APXvYqwBzJU+cWYO8PFAuszGvqL1iHP55OUYcRy+L0Sv2NnLdeDvpD6Z/2RqZi2sbUge04iKjAYLRA==
X-Received: by 2002:a2e:8756:: with SMTP id q22mr21364419ljj.108.1563373187770;
        Wed, 17 Jul 2019 07:19:47 -0700 (PDT)
Received: from [192.168.1.2] (178-37-168-43.adsl.inetia.pl. [178.37.168.43])
        by smtp.gmail.com with ESMTPSA id d3sm3472935lfb.92.2019.07.17.07.19.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 07:19:47 -0700 (PDT)
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
From:   Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
Subject: [PATCH RESEND] media: hdpvr: Add device num check and handling
Message-ID: <757f11e5-8463-4f48-1f42-1ecf9bd0a86e@eng.ucsd.edu>
Date:   Wed, 17 Jul 2019 07:19:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
