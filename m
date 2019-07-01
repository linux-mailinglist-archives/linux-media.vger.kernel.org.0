Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBFB5BCC2
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 15:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728589AbfGANWK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 09:22:10 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:38209 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728352AbfGANWK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 09:22:10 -0400
Received: by mail-qt1-f193.google.com with SMTP id n11so14575739qtl.5
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 06:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eng.ucsd.edu; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=ALgZ6/TH1TMMHtthc8F5W9I7v5d4Oi+UuqN4eyBdrw4=;
        b=V1jsTVUFpJBvfOluYHWnaCRRrKG/jSwC4bLkNxH+C2kE3lb+YfMwg/P8B6EPXwf/jj
         nEYkYvg8Fri7MktJ7oLoNgi5BlfUCoWbLOPQRaQqQ0NVP2G0qWPxy5g9wNVL+zIAkpyo
         icY46H9/oLXHEVI/LU5ek7vbEYvSIWs1vm32c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=ALgZ6/TH1TMMHtthc8F5W9I7v5d4Oi+UuqN4eyBdrw4=;
        b=lBFLfSNTavItKHb79Gx3tq/4WnALPoHUyKx+dpbPONKXWctxanse8U02b153QwCE6u
         i7kHzLA3XRfweY1P0vVk5UHC3eWPdaQZjhe72TZPJzxHFlxD9OXY1j3DzYIjXHC3sKaP
         1laFCjTjqy9to9Pfn2P3t5PA7aVm8W7bc8aaACcgT08/2MUdu+qhwMVslXKlqHqKlxXJ
         9ctJqHWT5tX8WiJxgADwNNctOx0/qfZSYnFiOksndYuGfb/zbmgB0YT3ikQ5iCvyp7v5
         uelx1MMdjeSjK0RchflGbrgO7DnrDvdKMI5cSD/ja+FfhJDiCsyEw6MWi6MHVX+zstb2
         UPkg==
X-Gm-Message-State: APjAAAUfiEcTKPGauo+93pWXjzJLbDcWzKPsDrb1bbHjry1MHMhWfdUi
        m3DBTK+DnEz7rcpOTZnqcMFGkg==
X-Google-Smtp-Source: APXvYqyXWtIpCN6ZL46YAlmlsFf8DaccfeQuuow9Vn/QDwfG8eI5fe7ow7HO62D6MUmTr0N/H76phw==
X-Received: by 2002:ac8:22ad:: with SMTP id f42mr20508420qta.271.1561987329030;
        Mon, 01 Jul 2019 06:22:09 -0700 (PDT)
Received: from luke-XPS-13 (ool-457dd03d.dyn.optonline.net. [69.125.208.61])
        by smtp.gmail.com with ESMTPSA id k40sm5627084qta.50.2019.07.01.06.22.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 01 Jul 2019 06:22:08 -0700 (PDT)
Date:   Mon, 1 Jul 2019 06:22:06 -0700
From:   Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
To:     hverkuil@xs4all.nl
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees,PATCH] media: hdpvr: Add device num check and
 handling
Message-ID: <20190701132206.GA8193@luke-XPS-13>
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
+			"max device number reached, device register failed\n");
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

