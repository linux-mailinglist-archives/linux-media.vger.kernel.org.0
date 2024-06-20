Return-Path: <linux-media+bounces-13859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A17EC911014
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 20:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57BC1281C4F
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 18:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0393A1CCCC0;
	Thu, 20 Jun 2024 17:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7tf5tcQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AD51CCCA5;
	Thu, 20 Jun 2024 17:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906306; cv=none; b=Jiv6ZMxUMQHZO56erfKSCitcqnobr5Xtphw36L3fhL/fzhHM2jp/6T3VmdYzyWSkZkJrda1oYqijHw1QLNoWHv7GpP2g1RS/4P/TqqTiRnuc9PcsHY0JuSZQbLcDlyMBxfBMiyZZczJ8ykOVFqLNVqx671cu9q2vcXhw01/X36c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906306; c=relaxed/simple;
	bh=JZiYOORmljoK1sw2ane9GWAOBNpWFrHsg6e0OWJ8vSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t3+OpDNxvhlse8w6M6ItVukiFyBm1GVud4FILQ45j8qPTQguMhW7ZYAuMMwaJaKHDwFbK+bMLgwIauC1+fmp1cXy+NGIk9upAM1q5GLFXrDNqtMl7Txd00BAc5bSUM3i25AaQy2pIyaPlduGOaHys7ulxw8+0o0nCVNlLSUS6zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7tf5tcQ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f99fe4dc5aso10187265ad.0;
        Thu, 20 Jun 2024 10:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718906303; x=1719511103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ML3sp6993QhuntHDiwMgBg5++AU4tTHxgPTWBrSRxD4=;
        b=Q7tf5tcQdUK5OwNm3iP6c/cOYh+E6F12X6Gf7qGvh9OYF4/XrLJM84inLbVIg+OdSX
         89SX6RwCZEzVjLevRLmx8LRMSzsVtmX+Ne4AdcsoYjIBl9ZJzhzoKVp1aUx40Ehlf1wm
         h6pV4691kzAsmp5s2YEeh4y9sn0LRcgBXhKepxtGPnN0lmza/AsRZKOdxSgPXnPUYr2K
         s1rLdrmHTv+3pEFsqR7P1pFo38BKXeK+p0S+dnFklkWjMbXcxIR13mMnLQS/X6DLvlOk
         xyKyzcT0TKzsrkOnUXmkOrUsTkgsIjFkkw4iRA6ULusGW/IQi8Qls4uKEj8NYwicujCU
         aweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906303; x=1719511103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ML3sp6993QhuntHDiwMgBg5++AU4tTHxgPTWBrSRxD4=;
        b=URNvW+8R0iOXQCezgzQT8uZPKtDJjLRhYrYWQBiTCw87qL1CCqpLADDCWjw6BSE42G
         iH3JdupvyVJBV8/1EqSfn/Q/thiZm0KUrVFoufKOv7AYxfgQFXCb+ShVrlhyX0UpTKIh
         NlcgLB0eQAYjCtR4q9cQ0xYEhukXZR+tsiNX3HASI+GG3343IrWMjSl/dOjcrityRLh4
         XfgwbKJoEPDInquozllB1F9OlSnwpv7SiS1G+l88eQqtszQR6jO1Ykswtj1MOtSGwCXB
         TL9pK4XpBeg5iJZO6k6Dq6eHq+ohjNWpTNwrMrp0yvn/BvQIfYz3gnGYbxmA8VBSvM/z
         Erlw==
X-Forwarded-Encrypted: i=1; AJvYcCUoNGf7L2LzKEQPiTB51EcpeuW7pnXwWG59+d7NAN6+nbG08IWqOpIysWdY990KIsHpSMnK0z/IGU+7ZP0kV+4vPGNRcCmdBYJ7wh8=
X-Gm-Message-State: AOJu0YwtItbCBdbJKbujhs82kTjZRHsjiygGgmSZj9xxelIZNcipTUPv
	gvts/Pwu2oByT8jyFcomRhEtfR42l7BC2brAiKkBF9mOXnHqXtrLQiZhmTtuMF0=
X-Google-Smtp-Source: AGHT+IFBQBMGehB+oQoKQYHD/qYtBbqhxOtOkxopDaJNky+s/Sb/aQTrReWOcCKSQ26MccV2yDTi7g==
X-Received: by 2002:a17:902:cf11:b0:1f3:1061:60fe with SMTP id d9443c01a7336-1f9aa3d24f7mr77142485ad.18.1718906303339;
        Thu, 20 Jun 2024 10:58:23 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9c81f48e3sm19719915ad.230.2024.06.20.10.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:58:22 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	linux-media@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Jan Kara <jack@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v4 26/40] media: em28xx: cx231xx: optimize drivers by using find_and_set_bit()
Date: Thu, 20 Jun 2024 10:56:49 -0700
Message-ID: <20240620175703.605111-27-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240620175703.605111-1-yury.norov@gmail.com>
References: <20240620175703.605111-1-yury.norov@gmail.com>
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
 drivers/media/usb/cx231xx/cx231xx-cards.c | 17 +++++-----
 drivers/media/usb/em28xx/em28xx-cards.c   | 38 ++++++++++-------------
 2 files changed, 23 insertions(+), 32 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index 92efe6c1f47b..8bdfbc4454f1 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -9,6 +9,7 @@
  */
 
 #include "cx231xx.h"
+#include <linux/find_atomic.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -1708,16 +1709,12 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
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
index bae76023cf71..59e6d7f894ad 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -11,6 +11,7 @@
 
 #include "em28xx.h"
 
+#include <linux/find_atomic.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -3684,17 +3685,14 @@ static int em28xx_duplicate_dev(struct em28xx *dev)
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
@@ -3827,17 +3825,13 @@ static int em28xx_usb_probe(struct usb_interface *intf,
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
2.43.0


