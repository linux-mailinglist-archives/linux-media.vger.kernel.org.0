Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B98DB772E8
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 22:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbfGZUjs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 16:39:48 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36750 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfGZUjs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 16:39:48 -0400
Received: by mail-pg1-f194.google.com with SMTP id l21so25289907pgm.3
        for <linux-media@vger.kernel.org>; Fri, 26 Jul 2019 13:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=bQ7MMoOSrAZIn8FxRgv3QzzRq2X4oVBfVFoto8m98G8=;
        b=mqpp7A1OlyMHRkuBwxn3X0xO1VmcMxZkhkXAPij1Kf69eBJrjKX1ARPM99k+r+4tg0
         SiKxv/ik87QNyxAo66BqWISS8/Lnxe8w+XRfxqINv517ePphjcMU/p/UvhotmyQmugJh
         RRgUfPuFnUZYv2dGmn1HPpey2S9p3fNgFweFLwHmXtPE1oaDNrYbHd3QonyS17z1hDLF
         DDqtA9eWzaz2XxSpdVzs62DrD/bVLPVSsTaDfDDsNqMgA6Eim1ZPVNE+RODnc6TLGAZ9
         M7XMs6aJF/hy15ntguObrddJzfpEVYd2GAbu2leewfXQRnpTRlF/46ZQXB2wXx8KR3ru
         62pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bQ7MMoOSrAZIn8FxRgv3QzzRq2X4oVBfVFoto8m98G8=;
        b=bGHjp1c8HeI7I5pwi1caFXoKArJaKlZuo6bh2ajN2aLaSi8nBu1cZpEW8lIKM6Ufgg
         +N0wsA4eEUFYjDuB2g1WbL1R+Ir1I4lU1L2cHMGHx+Jv1h3B7hWQuLJLvIpi2eZCMzWa
         s/dO8/sQCTrynzPzXzUyLiadW3650oXo1uYtXPN9RJ2xpFEGakGE2ecihCN/8H5IQAz7
         urT/Akuc92vI2l1sPcyhTNaqkqCN+wQmwvuV2JzFNuIhDhTPW8gNl0I0h4MgnojrW6sM
         ZlVxroQbdP+vSQBJgOHsyCNaZuCss4Ypug7agUuKrtCQ93Yx8uxCLGNjBzpvzG9BAtxt
         oP5A==
X-Gm-Message-State: APjAAAW0pSe3zr2SZXvMYcX6LuL6o9ZPg4++Lfwne0o0NrUK45OlHpZs
        LmZzAXEU/7ASUgeC0n04BR6gLU8eO0o=
X-Google-Smtp-Source: APXvYqw4Qwlw1JRvmOHXFaMwSwEKB1JfVuHR+5RHYRnj+ayWWjM5dxQmf+PvRq0bnjli2fUz5XRWuw==
X-Received: by 2002:a65:690f:: with SMTP id s15mr87281877pgq.432.1564173587672;
        Fri, 26 Jul 2019 13:39:47 -0700 (PDT)
Received: from localhost.localdomain (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id r13sm76223292pfr.25.2019.07.26.13.39.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 13:39:47 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Mark Balantzyan <mbalant3@gmail.com>
Subject: [PATCH] Added custom function for video device release functionality in tw686x driver
Date:   Fri, 26 Jul 2019 13:39:41 -0700
Message-Id: <20190726203941.29453-1-mbalant3@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>
Reported-by: kbuild test robot <lkp@intel.com>
---
This patch adds a custom function in tw686x-video.c to provide a release mechanism for the driver for the tw686x video device.

 drivers/media/pci/tw686x/tw686x-video.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
index 3a06c000..cabc4f89 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -1151,18 +1151,32 @@ void tw686x_video_irq(struct tw686x_dev *dev, unsigned long requests,
 	}
 }
 
+void tw686x_video_device_release(struct tw686x_video_channel *vc) {
+
+	struct tw686x_dev *dev = vc->dev;
+
+	unsigned int ch;
+
+	for (ch = 0; ch < max_channels(dev); ch++) {
+		struct tw686x_video_channel *vc = &dev->video_channels[ch];
+
+	}
+	
+	dev->dma_ops->free(vc,0);
+	
+	video_device_release((struct video_device*)dev);
+
+}
+
 void tw686x_video_free(struct tw686x_dev *dev)
 {
-	unsigned int ch, pb;
+	unsigned int ch;
 
 	for (ch = 0; ch < max_channels(dev); ch++) {
 		struct tw686x_video_channel *vc = &dev->video_channels[ch];
 
 		video_unregister_device(vc->device);
 
-		if (dev->dma_ops->free)
-			for (pb = 0; pb < 2; pb++)
-				dev->dma_ops->free(vc, pb);
 	}
 }
 
@@ -1277,7 +1291,6 @@ int tw686x_video_init(struct tw686x_dev *dev)
 		snprintf(vdev->name, sizeof(vdev->name), "%s video", dev->name);
 		vdev->fops = &tw686x_video_fops;
 		vdev->ioctl_ops = &tw686x_video_ioctl_ops;
-		vdev->release = video_device_release;
 		vdev->v4l2_dev = &dev->v4l2_dev;
 		vdev->queue = &vc->vidq;
 		vdev->tvnorms = V4L2_STD_525_60 | V4L2_STD_625_50;
-- 
2.17.1

