Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8A107953D
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 21:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389131AbfG2TkQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 15:40:16 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38401 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389128AbfG2TkQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 15:40:16 -0400
Received: by mail-pf1-f194.google.com with SMTP id y15so28543725pfn.5
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 12:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:user-agent:mime-version;
        bh=/pXWJ8ddDvfTuu0JB4WoRwgGG7E8bOmWDQnDjXLn3gk=;
        b=Dod9sqp1g7zsfgwy7ejaT3Cd54HrZ/QKaxmiG3beIKLbvfkfCQWSXQW6M+226oBb4S
         m4jKEZO4/kz/ikjIOntuxwBN1YTVUno9b6tDstv12ehZw6m0o4JVDmBueD+IHbd02TqH
         hmmvzxtFg9WgYjQSVoMY3C2X+iIXzvNBfrhMn62ZWmHRepgcYSIUg3ickEHZTlMGrHxy
         /1CfPF3iPXpNwqXIVfVowY5MYZQa5e1dRaw4pTd+WW+jIWYOQkF0wJRg9vJyRK/+WHOY
         cuiF8hJ1D5K7eetZMYq91tRAserMTB8oQBDUxy7WLhLiDhy8CiClDuuZw+oTPTu8Livn
         2C6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:user-agent
         :mime-version;
        bh=/pXWJ8ddDvfTuu0JB4WoRwgGG7E8bOmWDQnDjXLn3gk=;
        b=ksWB1Tt/8MSTUdG0cST1h6x8jp/+ZAbxzrJQ2VhjBDASal4pP6fM5IvkkhY8adLpOu
         8Pwlo2Fv6rf337ZQf9O/+oQDgAiJiEOZDECDNDQ0OK+vvXFKRw9U6c45FLanLoo2Ii3v
         fdjMYhWvNyXmf57tYmedTxAJQKqT/7MPPkoMTkjd3VAR6EwMy+RiSUkqWG/iFaSsOEZT
         n9ws9RjLu5JtVGbNO3Lq/pfXVoRS5x6NCN9urDUFYnVR87M5hVN5imzHqcyTUCCg6FTN
         8XHLC4TdKAM/UazE3cT8ENQGQIrox8EKyhU4x4SdSWx+nva8dlv1U/2rdm5TtMddSCIE
         Zh2g==
X-Gm-Message-State: APjAAAWGQ0MBnPC1cYM8Fz6oF/Y9e0K299lteG1TZkmV/KnMXI+yrAtj
        RgxDltb4lfOFMv4NLTK4Ykg=
X-Google-Smtp-Source: APXvYqxVQzX0+YvVhKVTApzLzroKfR1o3WNyamIC6Kf7pqeElglCiQHQFqL1oWV9ij3ZrLHx7C3FCw==
X-Received: by 2002:aa7:9481:: with SMTP id z1mr38427359pfk.92.1564429215244;
        Mon, 29 Jul 2019 12:40:15 -0700 (PDT)
Received: from mbalantz-desktop (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id 65sm65334032pgf.30.2019.07.29.12.40.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 12:40:14 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
X-Google-Original-From: Mark Balantzyan <mbalantz@mbalantz-desktop>
Date:   Mon, 29 Jul 2019 12:40:10 -0700 (PDT)
To:     ezequiel@vanguardiasur.com.ar, hverkuil@xs4all.nl
cc:     linux-media@vger.kernel.org
Subject: [PATCH] media input infrastructure:tw686x: Fix of possible inconsistent
 memory deallocation and/or race condition by implementation of custom
 video_device_release function in tw686x driver
Message-ID: <alpine.DEB.2.21.1907291238290.12821@mbalantz-desktop>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Possible inconsistent memory deallocation and/or race conditions were 
detected specifically with respect to remaining open handles to the video 
device handled by the tw686x driver. This patch addresses this by 
implementing a revised independent instance of the video_device_release 
function to free the remaining resources and memory where the last open 
handle(s) is/were closed.

Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>
---
  drivers/media/pci/tw686x/tw686x-video.c | 13 ++++++++++---
  1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/tw686x/tw686x-video.c 
b/drivers/media/pci/tw686x/tw686x-video.c
index 3a06c000..741e15ac 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -1151,6 +1151,13 @@ void tw686x_video_irq(struct tw686x_dev *dev, 
unsigned long requests,
  	}
  }

+void video_device_release(tw686x_dev *dev) {
+	for (int pb = 0; pb < 2; pb++) {
+		dev->dma_ops->free(dev->video_channels,pb);
+	}
+	kfree(dev);
+}
+
  void tw686x_video_free(struct tw686x_dev *dev)
  {
  	unsigned int ch, pb;
@@ -1160,9 +1167,9 @@ void tw686x_video_free(struct tw686x_dev *dev)

  		video_unregister_device(vc->device);

-		if (dev->dma_ops->free)
-			for (pb = 0; pb < 2; pb++)
-				dev->dma_ops->free(vc, pb);
+		if (dev->dma_ops->free) {
+			video_device_release(dev);
+		}
  	}
  }

-- 
2.17.1
