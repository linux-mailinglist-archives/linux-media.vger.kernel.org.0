Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9340E798B1
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 22:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730370AbfG2UJP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 16:09:15 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44242 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730188AbfG2UJP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 16:09:15 -0400
Received: by mail-pg1-f195.google.com with SMTP id i18so28790764pgl.11;
        Mon, 29 Jul 2019 13:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:user-agent:mime-version;
        bh=fBfBw2wkhiVUlzKRrybQChsuOJLRt+8izpDdk9CY/Nw=;
        b=itX+YlvedKY4fzRJQgV8KR91wHxBTELBREIy6gRJ1SnVaGf8KOzDxp/Mo1UCKVNbYn
         YmeEEpb++7Xb2MmG4WBZv35xHPGgtC954vfVzAkjAnJsDyVbGwKlx4TaA7lsaGEIVU7t
         mJzeA9NIXmlBC3Nhndc4sqUhCFAxDU/ZNCrLnXRJM334siKWj9Z/gJmCNP/kgKmteM6v
         9fqrTApA0o/HsMAVxEngZ5+FEWG2EGEc0hxGKq8mIlV2CYCdY0moT0dPJgvX5uPBFa2c
         g9tllaQTKnK/uJMj1bZbI9CN0sypo/DOoeduDUXnsA1X1rru6bo1lLIGBHlkHJYrR7yz
         6nyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:user-agent
         :mime-version;
        bh=fBfBw2wkhiVUlzKRrybQChsuOJLRt+8izpDdk9CY/Nw=;
        b=gA/6KCOZlk/luGsmhEcbtJ0hCmTOKyY8M25oKIxNCunRHR/HZhVMxnuUMymCFyqb4D
         Q2tks60iOWTtoGpyEA2fPKjDWZrWalRsDfPAYy7E2eBx1bObiOVnqosS7vRaBMBtgrt+
         nbyA1IWFbp/8zhT6+Tf/EsUK0zi/LlI1tfwDHEcUEv/ohsB1mGFah6/UOa7XzqBa08dN
         Po0HtIWk9WBfX1luUyGupuEU99tQp5SOL6Nw4U/VkqN45JQzqpCcO8DGGyCgl421skOJ
         iliVaUKJwVdP3dqIs8kszm64V+ZFcuZeYrWp+J5kOUQ/IjdZfNmyjyFazGjYKaUqNwVc
         MwZQ==
X-Gm-Message-State: APjAAAWXipAkaRJaBukiNTCjE/OcTjx6E45OdiZLR7yZ1AWxlO0qfYoS
        AmvzenmZ7e3NFQRQVp6Enq/lIzR4skY=
X-Google-Smtp-Source: APXvYqw64sHT7u8AAtryI2j1MfjOmW9ev5iXn+VhM8gdPdBzitofVG1Wz8aoXhGzm/hkiCwz6d96zQ==
X-Received: by 2002:a63:8a43:: with SMTP id y64mr104911456pgd.104.1564430954506;
        Mon, 29 Jul 2019 13:09:14 -0700 (PDT)
Received: from mbalantz-desktop (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id m20sm65250324pff.79.2019.07.29.13.09.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 13:09:14 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
X-Google-Original-From: Mark Balantzyan <mbalantz@mbalantz-desktop>
Date:   Mon, 29 Jul 2019 13:09:09 -0700 (PDT)
To:     ezequiel@vanguardiasur.com.ar
cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media input infrastructure:tw686x: Fix of possibleinconsistent
 memory deallocation and/or race condition by implementation of custom
 video_device_release function in tw686x driver
Message-ID: <alpine.DEB.2.21.1907291256080.16959@mbalantz-desktop>
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

  drivers/media/pci/tw686x/tw686x-video.c | 15 +++++++++++----
  1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/tw686x/tw686x-video.c 
b/drivers/media/pci/tw686x/tw686x-video.c
index 3a06c000..29e10c85 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -1151,18 +1151,25 @@ void tw686x_video_irq(struct tw686x_dev *dev, 
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
-	unsigned int ch, pb;
+	unsigned int ch;

  	for (ch = 0; ch < max_channels(dev); ch++) {
  		struct tw686x_video_channel *vc = 
&dev->video_channels[ch];

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

