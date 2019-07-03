Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB0D5E8E8
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 18:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbfGCQ3F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 12:29:05 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37213 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbfGCQ3F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 12:29:05 -0400
Received: by mail-pl1-f193.google.com with SMTP id bh12so1522472plb.4;
        Wed, 03 Jul 2019 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WTPoqn8CSbIoCMVQ2nER3Fw2FFFBtKsXZetFkbEpLjQ=;
        b=Fwv33z2RbQDYeP/BBRyfjMj18Q/gq19jPWitm//Ck+muhSMn3RePYHZuoMn2fmiofM
         WOtLoznwgdhF7EYQYOFR6QZYWiSumAHxJPn18a8W2cWbgWn9o7DgzWxBKHAicFV6T4Fe
         8yTP3cBaKpba/vLZCM77LR/B9/WjNlk/iKlWP6sC6+fIpTVU2Fke04qsVaIp43IuFi5q
         S3yAxN3ERbDdPOqAjadQ32k7M5Wh45siiK/rktwDfUzP6TCC1SVhOpRE1RDvG6SFTAEx
         25SUZQ841IPDQEKorMEEGwz9Xb9GxX2PMQERAVgAQN2E9OqySyONq2xKtokFKgmPTDuA
         kkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WTPoqn8CSbIoCMVQ2nER3Fw2FFFBtKsXZetFkbEpLjQ=;
        b=Hsckt4aYI/oB0VuqT+QqoJgtU1YydWtXaW9J/7PaJnR6d5XGgJrdWtPVrmTTEEPpbj
         uqGzgS/lF5NPJisbhaxFxclUI0UThsavnmtUT5BZ6K6Q/wHOW+feediC8fVuP4LaTjPG
         KJuno9DcJp6ABToERZp5X6zGDGmezang4MYcqQPFyRKxS2LgOdtcsZtzstWSh2QsSXvZ
         r1adxujVjxft9d6TGRPgV0k+/pTWYc3jwyOEQAERNl7QxNkGLNK8cXeFCHEnhSkY+LuU
         x/92ZYnJ2VxDEE4irbaSu/M7QdTmVLlszjUVqRNqsf5guR0nrCxDcw6QVwqkTissOyeD
         Kb+Q==
X-Gm-Message-State: APjAAAVlfu16GD9J2ObQX8GLzvq2IomBoUSJTFtHFVIN3PJI2+NGeIOH
        ynu0Kpt3y9NCmv5GsRVqd7k=
X-Google-Smtp-Source: APXvYqx4RhzhvsPhhu2IsE3MGklbR4iTL9WJ66Wr86pl4WRq3FsjNXmqDGH99pfEyrSTD+j3sS8QYQ==
X-Received: by 2002:a17:902:8c98:: with SMTP id t24mr44631754plo.320.1562171344636;
        Wed, 03 Jul 2019 09:29:04 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id z186sm3060038pfz.7.2019.07.03.09.29.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 09:29:04 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Antoine Jacquet <royale@zerezo.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH v2 13/35] media/usb: Use kmemdup rather than duplicating its implementation
Date:   Thu,  4 Jul 2019 00:28:57 +0800
Message-Id: <20190703162857.32461-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

kmemdup is introduced to duplicate a region of memory in a neat way.
Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
Changes in v2:
  - Fix a typo in commit message (memset -> memcpy)

 drivers/media/usb/em28xx/em28xx-cards.c | 3 +--
 drivers/media/usb/zr364xx/zr364xx.c     | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 1283c7ca9ad5..6e33782c3ca6 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3566,13 +3566,12 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 static int em28xx_duplicate_dev(struct em28xx *dev)
 {
 	int nr;
-	struct em28xx *sec_dev = kzalloc(sizeof(*sec_dev), GFP_KERNEL);
+	struct em28xx *sec_dev = kmemdup(dev, sizeof(*sec_dev), GFP_KERNEL);
 
 	if (!sec_dev) {
 		dev->dev_next = NULL;
 		return -ENOMEM;
 	}
-	memcpy(sec_dev, dev, sizeof(*sec_dev));
 	/* Check to see next free device and mark as used */
 	do {
 		nr = find_first_zero_bit(em28xx_devused, EM28XX_MAXBOARDS);
diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/media/usb/zr364xx/zr364xx.c
index 37a7992585df..39df6bfece2c 100644
--- a/drivers/media/usb/zr364xx/zr364xx.c
+++ b/drivers/media/usb/zr364xx/zr364xx.c
@@ -199,12 +199,10 @@ static int send_control_msg(struct usb_device *udev, u8 request, u16 value,
 {
 	int status;
 
-	unsigned char *transfer_buffer = kmalloc(size, GFP_KERNEL);
+	unsigned char *transfer_buffer = kmemdup(cp, size, GFP_KERNEL);
 	if (!transfer_buffer)
 		return -ENOMEM;
 
-	memcpy(transfer_buffer, cp, size);
-
 	status = usb_control_msg(udev,
 				 usb_sndctrlpipe(udev, 0),
 				 request,
-- 
2.11.0

