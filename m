Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD33F73276
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 17:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387549AbfGXPKt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 11:10:49 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33515 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387547AbfGXPKt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 11:10:49 -0400
Received: by mail-pf1-f194.google.com with SMTP id g2so21115720pfq.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jul 2019 08:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=uAVI3O07kr7HDutT3AXMuJQCAY3APJ11Wj6qTEh0q5A=;
        b=bX6A5d5Rxbtxy4d7H74PdlrXTXVjZlWfrapSUPVYztdDm3g9MoengJktbg66sirpMN
         WCIUJ/03HS3oTzWDsjiL+DwtD1XSWaTJzzpv5K3Ap01RoOVc/HB22BFK3nNj/tI0qQYk
         ffGgXSDC2nT85ayMBC7fy++Y0279KQwsxdIDZQwqnxeBaExH4vvkuL69gA9Atk+scwNe
         Ic5yIgrr00fw4QdnmPnxnb7tPxtNKYg6HLVX7eGTI7DgxpHeytkp1kaxzAtCBZyxX5nJ
         VMs31BdGKUMmsZv404MtS9Zc9tgWAZ5B/BcnAvYax2z1wF8v4MQKOmInwUcW9ci2tsgG
         ooug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uAVI3O07kr7HDutT3AXMuJQCAY3APJ11Wj6qTEh0q5A=;
        b=JZbyZDyaPiWeQ9iFFdsvtVoLINoXAPp39MQmQnfzyk/nrVckUJOCz/jfo0+cwik7XN
         Q17FaStWVJQqEkQqSCMR57xgRHyZ8qeVRYQRZC1B+YJmdao46UadXNfidEctRNhFN++0
         LcxluQT+DevfWYkvWDwNtlomp9KLsze2gTFUBBZr+Nfg1KTS1xV0ae2x6Hn0BbE5y8Gs
         TazgpoK2gdOEjIvepL1FAoVHFtcbHgW3UjBjyK9VlmnByTugOQQq5gjJ6Y2RuITCj8ke
         LWntLqzqcbhu4rYX46Ed+cs7kYgoFxbFB6Y1taC2c9MaX95oF+hfWnU5uFpriRnFoUqw
         rUyQ==
X-Gm-Message-State: APjAAAWLz3lTJ/uoPTIwy0nuZeSym0RTeAXp3KHPospWUl4WcWXyP0d5
        QdLz1BPPZdLbpdcccdiac8DQKcYBtRo=
X-Google-Smtp-Source: APXvYqyo75K4PmR2gczia3Pakogdca0LEuYXi2Kqm2vnvykY3yxvPalK5KrM0QCCmoZqCX11sWgArQ==
X-Received: by 2002:aa7:8651:: with SMTP id a17mr11718819pfo.138.1563981048626;
        Wed, 24 Jul 2019 08:10:48 -0700 (PDT)
Received: from localhost.localdomain (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id i9sm38195101pjj.2.2019.07.24.08.10.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 08:10:48 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Mark Balantzyan <mbalant3@gmail.com>
Subject: [PATCH] media input infrastructure:tw686x: Added Added custom function to set vdev->release in tw686x driver
Date:   Wed, 24 Jul 2019 08:10:36 -0700
Message-Id: <20190724151036.26868-1-mbalant3@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>
---
This patch adds a custom function to release video device in assignment to vdev->release member in tw686x driver.

 drivers/media/pci/tw686x/tw686x-video.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
index 3a06c000..3631d0f5 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -1151,6 +1151,21 @@ void tw686x_video_irq(struct tw686x_dev *dev, unsigned long requests,
 	}
 }
 
+
+
+void tw686x_video_device_release(struct tw686x_video_channel *vc) {
+	struct tw686x_dev *dev = vc->dev;
+	unsigned int ch, pb;
+
+	for (ch = 0; ch < max_channels(dev); ch++) {
+		struct tw686x_video_channel *vc = &dev->video_channels[ch];
+
+	dev->dma_ops->free;
+	
+	video_device_release((struct video_device*)dev);
+
+}
+
 void tw686x_video_free(struct tw686x_dev *dev)
 {
 	unsigned int ch, pb;
@@ -1160,9 +1175,6 @@ void tw686x_video_free(struct tw686x_dev *dev)
 
 		video_unregister_device(vc->device);
 
-		if (dev->dma_ops->free)
-			for (pb = 0; pb < 2; pb++)
-				dev->dma_ops->free(vc, pb);
 	}
 }
 
@@ -1277,7 +1289,7 @@ int tw686x_video_init(struct tw686x_dev *dev)
 		snprintf(vdev->name, sizeof(vdev->name), "%s video", dev->name);
 		vdev->fops = &tw686x_video_fops;
 		vdev->ioctl_ops = &tw686x_video_ioctl_ops;
-		vdev->release = video_device_release;
+		vdev->release = tw686x_video_device_release;
 		vdev->v4l2_dev = &dev->v4l2_dev;
 		vdev->queue = &vc->vidq;
 		vdev->tvnorms = V4L2_STD_525_60 | V4L2_STD_625_50;
-- 
2.17.1

