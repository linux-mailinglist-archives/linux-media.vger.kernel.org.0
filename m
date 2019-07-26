Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE93772ED
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 22:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfGZUla (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 16:41:30 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34086 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbfGZUla (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 16:41:30 -0400
Received: by mail-pf1-f193.google.com with SMTP id b13so25040566pfo.1
        for <linux-media@vger.kernel.org>; Fri, 26 Jul 2019 13:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Bb9W8HGpknIfV7cjp47FpQf0Q+kLqAzlJFDTd3TC6/M=;
        b=jT6zSbw198KpBhmrtZqkgtqcr69T/pgjhj2jibTg2J42/psTKY7zZkUo6N7X1iEY/X
         u4MEh33c5rqTXYK/T9CHlv7637STEvVawXzHfj8fpNRd/K/dRwFi9d3WHV5Bz3QdlVkA
         4gjrst+Pv55j3zOTw81+DWuMv+nzGbH38GHtFKBUOnAhj9hi3JhPyY+ITjDo5qh39Dzs
         m6t+bvHB7sac2Qi/Ji20jbW2VYjUP0ufguSHRirusXvZUi9qN3zQXRDCAirX99aGG3uu
         ypz8xzUMA4sCzd4Albo9HG25PDI+Np2lLtGjlcksd9RVb0zMY620kw8uVadqc7OKHw5X
         cqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Bb9W8HGpknIfV7cjp47FpQf0Q+kLqAzlJFDTd3TC6/M=;
        b=XgE+AbSqARZH8rfmVVl+FQFySShzKE93fh4k3or7OXzn0AHAYfS2P+C35fr3gmGYRZ
         NCqB/NHb6stqvxC222crbuEMmyJEk9YBwrlvwlOyCIp7TzTal+UrYc+6b37Yz8vDUM8u
         lli7iHl2ISwwGwnbQBEjwIiH4bbvKX5S8nTFEk8WGZWaxRf3RWqjCFBGJzBAtnM3dP7W
         Jh5WcGYhEq2hb4M7rd5zrxYHvOGsEJEBVVHCtduPuamu4NlLpctWVXhECe/6LFO3z7nO
         4VrcslI1Ii3EkMWyTFkvwg+y3dUW25k85/oEIgf/5AqWN27RTSPumwULFC9KPtOTA2WU
         L6TQ==
X-Gm-Message-State: APjAAAUb9s9Q6DBejNbPjpKl4oLuZbxWr2rttx4WBBxQyEJyxQe6SwQ4
        Tcm5GTZj6msWDduQuKFmoI7NarXFNUU=
X-Google-Smtp-Source: APXvYqw976P7gM+vYqqxQXdaD3UOspZUWZ9tWua/mzaUsMPNm1OptWcdv/81CZa3Pk7phfK9LEwXmw==
X-Received: by 2002:aa7:8e17:: with SMTP id c23mr24273135pfr.227.1564173689312;
        Fri, 26 Jul 2019 13:41:29 -0700 (PDT)
Received: from localhost.localdomain (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id i74sm100366447pje.16.2019.07.26.13.41.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 13:41:28 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Mark Balantzyan <mbalant3@gmail.com>
Subject: [PATCH] media input infrastructure:tw686x: Added custom function for video device release functionality in tw686x driver
Date:   Fri, 26 Jul 2019 13:41:23 -0700
Message-Id: <20190726204123.30384-1-mbalant3@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>
Reported-by: kbuild test robot <lkp@intel.com>
---
This patch adds a custom function for releasing the video device for the tw686x video device driver.

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

