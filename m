Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684B03D173A
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 21:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbhGUTCm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 15:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbhGUTCm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 15:02:42 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46913C061575;
        Wed, 21 Jul 2021 12:43:18 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id l1so3828369edr.11;
        Wed, 21 Jul 2021 12:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9DyEqM+ou6CvfIYyiIpmWP6ULsbRUlC6gxSHlAoCFBo=;
        b=IkxPBT6rYUeFD3pEnM0sR3iFySrR1W3ZseLvmrpZbAyDqLlLg9IcdS1SU8DhRtOgNh
         OknnZj8BoE7E7a91lZajImSqdYLV1HCRfkgyrhNNcrySFUx4xi1muiQpWmsEzDCVX1J1
         xS1Iho82An6eAZ7qmJIz99QDzwl1qMedorINlJq5aNolbDC7ay81ddXAG6KKERaYdzjP
         wIasTLoMOfx1Q6ItaRFQtkPoRcSz4YWw/iihaxNT4DB3t3RjiSiypXmDmR5u++UwW+8e
         7Q1xd4NvUrX5Lv1QTGVtdFUdlbTMmiYWSQlBldH4b3r8Ud8s/UyNsNblTSgnIFXGuARb
         H79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9DyEqM+ou6CvfIYyiIpmWP6ULsbRUlC6gxSHlAoCFBo=;
        b=h36Pbc4kJdVxBVjQ9hhkLwBd0mM7h1flpH1TP4iNkW3AcDQnVt3R1SK+RJkykQuoT/
         /N9d03rYu19h8Wh1AcX7ILwQ/6nP6ggHkt98zT1Ft8G10ff2mAQfhn577onizCkddSjX
         KJtASkO7kX6/Y17dMrwxcrsqhcXczhdemjYbgdb6Ta6wycMOdNu52PUaLmJtv9it4/VF
         72NYjf+43KqmdcaQatUDBHbzdarID7ujEKnA/9GE6lPUhqoZrcYmbLkp3NcRlbkS7znQ
         tOXdAvwdWE+z4vhmBssgbnvIwsQ5kd6XrcRddWpuTQdD8EOlMyg7AwBACdFL1NQpHwT2
         Jbeg==
X-Gm-Message-State: AOAM533Rpp/DUS08O3ap/0IGU81AQTqpp41qrZl1QgQM0cNn2e9v5YiC
        mZffSABdG0/Zd+1xH89u+VI=
X-Google-Smtp-Source: ABdhPJzTKu7cz1ySoc1NAfQGF10UNkUqZ5dLAqZTNwJXUWdSrOpQp0HuayD57Qbo2FjQbbdEeqXkQQ==
X-Received: by 2002:a05:6402:26c5:: with SMTP id x5mr33434396edd.237.1626896596810;
        Wed, 21 Jul 2021 12:43:16 -0700 (PDT)
Received: from localhost.localdomain ([176.30.239.20])
        by smtp.gmail.com with ESMTPSA id j21sm11219926edq.76.2021.07.21.12.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 12:43:16 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
Subject: [PATCH v2] media: em28xx: add missing em28xx_close_extension
Date:   Wed, 21 Jul 2021 22:43:07 +0300
Message-Id: <20210721194307.12155-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <7df1705e-b2c7-ddfc-9cc5-582fb1a304e5@xs4all.nl>
References: <7df1705e-b2c7-ddfc-9cc5-582fb1a304e5@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If em28xx dev has ->dev_next pointer, we need to delete dev_next list node
from em28xx_extension_devlist on disconnect to avoid UAF bugs and
corrupted list bugs, since driver frees this pointer on disconnect.

Fixes: 1a23f81b7dc3 ("V4L/DVB (9979): em28xx: move usb probe code to a proper place")
Reported-and-tested-by: syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

Changes in v2:
	Previous patch was completely broken. I've done some debugging
	again and found true root case of the reported bug.

---
 drivers/media/usb/em28xx/em28xx-cards.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index c1e0dccb7408..d56b040e1bd7 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -4139,8 +4139,10 @@ static void em28xx_usb_disconnect(struct usb_interface *intf)
 
 	em28xx_close_extension(dev);
 
-	if (dev->dev_next)
+	if (dev->dev_next) {
 		em28xx_release_resources(dev->dev_next);
+		em28xx_close_extension(dev->dev_next);
+	}
 	em28xx_release_resources(dev);
 
 	if (dev->dev_next) {
-- 
2.32.0

