Return-Path: <linux-media+bounces-2180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB6A80E1DB
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 03:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C018FB216E3
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 02:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9636B8F4F;
	Tue, 12 Dec 2023 02:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cul4rVnG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8D72183;
	Mon, 11 Dec 2023 18:28:34 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5df49931b4eso28081757b3.0;
        Mon, 11 Dec 2023 18:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702348114; x=1702952914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yslUM+PF1IQcJgkd1RsA03l4wDu0gk1L5Ed7C72uTkM=;
        b=Cul4rVnG8r1L7CEwwHT3Nz1ZKSJ2+l40/L5QiO/XnH92O9RhZBKL0loqGg/Wqkwv1d
         Tem4mg2JD43Z9fE5nzuGG6TxYd/vqnOb4JfRkhVMRPNqkXmB75KNR5LHNBki2e8yQL5n
         CyaOB3mnMFP7e3ZkemokkJnxtHl0sE7qbmq4puexGCTpHOYAlIDaSwj87WGwRsvYeKfK
         N6u8zgQS2vSPP2ELQ2sBEkI/2O3BFk7MyzZsmFKYrLeISTAcN8VGcqDQ7Vd/8yBpo+D1
         5WNGpdwszxGX/tRY1HA1b/2R3tE6LWABvUkWkXjJhUnUMZxGdQKLew1FTEbB07CnZbCE
         9Zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702348114; x=1702952914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yslUM+PF1IQcJgkd1RsA03l4wDu0gk1L5Ed7C72uTkM=;
        b=l/wfOzleAwvz+p5zph4o/dbsnQl6hcDEcu3v1ErsgfksrcUNOnzV4IQvgbfluCU/13
         +GTFVZBiW5hNsEy+7TwJ4lHzbEREF0kVYpS+Yeiv/iV1NpxspaKn8ydrlyBNScgbv/V1
         MELFcN62iD1rSpYucFSAvfKEq5ecd+K4zHSyHlr8gszVVHCTTFLxY15fvE2OAT6bW0cp
         UIeVWqcZDs9uSZEGaILtT2sjDR4XIsGJh2PI5GJA8+fxMpcXDfTQWMnvetbdOiYtW+Fy
         z5a66dKvCZZxT0iImKmSIbr3zBnYxcpa7FILyN8G/Bs2hUtFLMRIhDox14Bzi+6qT7pV
         PNQQ==
X-Gm-Message-State: AOJu0YwprIJG0/4Buc3D7amlmcEx0N/NuTQT4BFlH8TZ+bO3byUagTR0
	tpmjbM2laMu8NVf1O9rMuuryH6Fo0RjdMA==
X-Google-Smtp-Source: AGHT+IErkd3CQk1egn9GYBz17AVaD9Prvi3wZrqFMBTtL3rbxHsNJQO0bc310GxRK6OihbbD5G+ZVw==
X-Received: by 2002:a0d:f881:0:b0:5d7:1940:b391 with SMTP id i123-20020a0df881000000b005d71940b391mr4788605ywf.93.1702348113647;
        Mon, 11 Dec 2023 18:28:33 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:38aa:1c88:df05:9b73])
        by smtp.gmail.com with ESMTPSA id a200-20020a0dd8d1000000b005d35a952324sm3449321ywe.56.2023.12.11.18.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 18:28:33 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	linux-media@vger.kernel.org
Cc: Jan Kara <jack@suse.cz>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v3 27/35] media: em28xx: cx231xx: optimize drivers by using find_and_set_bit()
Date: Mon, 11 Dec 2023 18:27:41 -0800
Message-Id: <20231212022749.625238-28-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231212022749.625238-1-yury.norov@gmail.com>
References: <20231212022749.625238-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Functions in the media/usb drivers opencode find_and_set_bit(). Simplify
them by using the function.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/cx231xx/cx231xx-cards.c | 16 ++++------
 drivers/media/usb/em28xx/em28xx-cards.c   | 37 +++++++++--------------
 2 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index 92efe6c1f47b..b314603932d7 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1708,16 +1708,12 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
 		return -ENODEV;
 
 	/* Check to see next free device and mark as used */
-	do {
-		nr = find_first_zero_bit(&cx231xx_devused, CX231XX_MAXBOARDS);
-		if (nr >= CX231XX_MAXBOARDS) {
-			/* No free device slots */
-			dev_err(d,
-				"Supports only %i devices.\n",
-				CX231XX_MAXBOARDS);
-			return -ENOMEM;
-		}
-	} while (test_and_set_bit(nr, &cx231xx_devused));
+	nr = find_and_set_bit(&cx231xx_devused, CX231XX_MAXBOARDS);
+	if (nr >= CX231XX_MAXBOARDS) {
+		/* No free device slots */
+		dev_err(d, "Supports only %i devices.\n", CX231XX_MAXBOARDS);
+		return -ENOMEM;
+	}
 
 	udev = usb_get_dev(interface_to_usbdev(interface));
 
diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 4d037c92af7c..af4809fe74a8 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3684,17 +3684,14 @@ static int em28xx_duplicate_dev(struct em28xx *dev)
 		return -ENOMEM;
 	}
 	/* Check to see next free device and mark as used */
-	do {
-		nr = find_first_zero_bit(em28xx_devused, EM28XX_MAXBOARDS);
-		if (nr >= EM28XX_MAXBOARDS) {
-			/* No free device slots */
-			dev_warn(&dev->intf->dev, ": Supports only %i em28xx boards.\n",
-				 EM28XX_MAXBOARDS);
-			kfree(sec_dev);
-			dev->dev_next = NULL;
-			return -ENOMEM;
-		}
-	} while (test_and_set_bit(nr, em28xx_devused));
+	nr = find_and_set_bit(em28xx_devused, EM28XX_MAXBOARDS);
+	if (nr >= EM28XX_MAXBOARDS) {
+		/* No free device slots */
+		dev_warn(&dev->intf->dev, ": Supports only %i em28xx boards.\n", EM28XX_MAXBOARDS);
+		kfree(sec_dev);
+		dev->dev_next = NULL;
+		return -ENOMEM;
+	}
 	sec_dev->devno = nr;
 	snprintf(sec_dev->name, 28, "em28xx #%d", nr);
 	sec_dev->dev_next = NULL;
@@ -3827,17 +3824,13 @@ static int em28xx_usb_probe(struct usb_interface *intf,
 	udev = usb_get_dev(interface_to_usbdev(intf));
 
 	/* Check to see next free device and mark as used */
-	do {
-		nr = find_first_zero_bit(em28xx_devused, EM28XX_MAXBOARDS);
-		if (nr >= EM28XX_MAXBOARDS) {
-			/* No free device slots */
-			dev_err(&intf->dev,
-				"Driver supports up to %i em28xx boards.\n",
-			       EM28XX_MAXBOARDS);
-			retval = -ENOMEM;
-			goto err_no_slot;
-		}
-	} while (test_and_set_bit(nr, em28xx_devused));
+	nr = find_and_set_bit(em28xx_devused, EM28XX_MAXBOARDS);
+	if (nr >= EM28XX_MAXBOARDS) {
+		/* No free device slots */
+		dev_err(&intf->dev, "Driver supports up to %i em28xx boards.\n", EM28XX_MAXBOARDS);
+		retval = -ENOMEM;
+		goto err_no_slot;
+	}
 
 	/* Don't register audio interfaces */
 	if (intf->altsetting[0].desc.bInterfaceClass == USB_CLASS_AUDIO) {
-- 
2.40.1


