Return-Path: <linux-media+bounces-18665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE3E987C03
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 01:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D6951F242C5
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 23:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF12D1B0125;
	Thu, 26 Sep 2024 23:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHnc5xlA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44CA14F9E9
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 23:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727394689; cv=none; b=a15MG2wNM92+3Q2fi1rtAplS9rwYJeXsQHY12hHIwc5MXzT2eht1sypWwvYmJQ5S5jbQ4THWgrUALYxeHRsl2XG4lG66AvsQn3PFQD0TSiEM1RApFioc3SfbhsjbKOm0oBS0BFXS0nlLyAUCvMH2yTERvnIr4zYeY1L36xU4OPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727394689; c=relaxed/simple;
	bh=JwNUUL0MIAVlJYRLbFGBNTazvr8N7AlNqoKnIwfewnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pxscqabv1kjfaFXEMJPWcH6oe/dw4TUmOWf55CUfMG0nrg6CJSu5y7XsddigZTu6stAuIQtdt1L4I1HemUqLV1ZMzSvOMtN412RWfRi59rRYzGrIM3Tyjhx1C0n3uNcOyO54td0Nd/LLI2LdxnUJuidENDbDR3HFd9Ky2gpjDjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHnc5xlA; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso1129946a12.3
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 16:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727394686; x=1727999486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9VAhweZRKnXlTFj41v71IlHvC1esjQxSvn4r4/VgGYA=;
        b=NHnc5xlAt9TxKrKOQzhQZSSlZ05BNib3atI8I9UJ5CFp0A7apl3mzLps0TtBKu5qNd
         kIZhP3vZfDxSY5gPYXcC0xLrMypZGZySAwTo2S3FMGSM4Xrcqak7vG41F6OdwFhMRXVd
         A3niovk46wTjuBOtbNKPA2ilB3/IfhlLtl8dfS/aQuVDBrE5CXapO5J6x4a/Qa0TXW//
         oUUNVsUnXvV2MstsPHCb1FWuAIeKib78OZUuih0B1TZcdm0D2RuCyScR6hVYA5RxMCUJ
         0BGB9zLkH1+X2cysMsfQu1r7QyaHxOM9fWJxJT3jrcm3r43j+sRYkiKd0GQv07skaKx7
         YoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727394686; x=1727999486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VAhweZRKnXlTFj41v71IlHvC1esjQxSvn4r4/VgGYA=;
        b=VseFTsGqDzrHy9udHYP80/sh6oOW0UNK7Zcki/VBl/p/b1Dd5cOiX6bnba9mUn5uyf
         ruP/H+OzNrudeR1MZ4a2+8T6cvGIEzOar0T6DwEtunCskXGuR/91RlaLJMtrCZ8Rn8gP
         HeAop2qpdT1s8b4H4TEexHMDpWuTVQz/tQKCEUZkR3Wkpm2a+XAvVLWv+3juO8nbckIq
         Lk2TpMhYedqjzEWTf6C87ImjOwtycGmr/rp3Y5WGx1GbNhqDLqVytiU4khFYlYpImdUy
         /hIgk1gBzLZPan516D4dyUizlLxjCQx27c/an5Nuulpu0QbN0DXlnbZeh5brwGpaVQjn
         FgqQ==
X-Gm-Message-State: AOJu0YxB2IP8Kdcxm0e4ooSkmUpeI22GyfnWTpi+2RaV7G73LeoMp5KV
	CPVdo4gY27QZG66NybGAueyF/8kJKXw37gB5nrjRs7e/Z2Pf+3Ft9O78o5+kCUlD6Q==
X-Google-Smtp-Source: AGHT+IHZ5nBLMDt14fgA97p9ebouza1xS+JyjbVv77qFt3DUB0jfSy1AAVn6aFq7unhEWEJl2COjBQ==
X-Received: by 2002:a05:6a20:d49a:b0:1d2:e888:3982 with SMTP id adf61e73a8af0-1d4fa6a14d0mr2147561637.19.1727394686520;
        Thu, 26 Sep 2024 16:51:26 -0700 (PDT)
Received: from localhost.localdomain (n203-164-232-111.bla21.nsw.optusnet.com.au. [203.164.232.111])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b263553c2sm468602b3a.0.2024.09.26.16.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:51:26 -0700 (PDT)
From: Rohan Barar <rohan.barar@gmail.com>
To: linux-media@vger.kernel.org
Cc: Rohan Barar <rohan.barar@gmail.com>
Subject: [PATCH] Added ID 1d19:6108 Dexatek Technology Ltd. Video Grabber
Date: Fri, 27 Sep 2024 09:50:49 +1000
Message-ID: <20240926235048.283608-2-rohan.barar@gmail.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 drivers/media/usb/cx231xx/cx231xx-cards.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index 92efe6c1f..bda729b42 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -994,6 +994,8 @@ const unsigned int cx231xx_bcount = ARRAY_SIZE(cx231xx_boards);
 
 /* table of devices that work with this driver */
 struct usb_device_id cx231xx_id_table[] = {
+	{USB_DEVICE(0x1D19, 0x6108),
+	.driver_info = CX231XX_BOARD_PV_XCAPTURE_USB},
 	{USB_DEVICE(0x1D19, 0x6109),
 	.driver_info = CX231XX_BOARD_PV_XCAPTURE_USB},
 	{USB_DEVICE(0x0572, 0x5A3C),
-- 
2.46.1

Dear Maintainers,

This patch adds support for the USB device 1D19:6108 (Dexatek Technology Ltd. Video Grabber) to the cx231xx driver.

This device was sold by the supermarket chain 'ALDI' in Australia circa 2013 as part of the 'BAUHN DVD Maker (DK8723)'.

This device is very similar to the 1D19:6109 (https://www.linuxtv.org/wiki/index.php/SilverCrest_USB_2.0_Video_Grabber_SVG_2.0_A2).

I have confirmed that both video and audio capture are working correctly by compiling, signing and loading the patched driver into the kernel using modprobe:
* Video Capture: CONFIRMED WORKING in OBS & VLC.
* Audio Capture: CONFIRMED WORKING via command `arecord -D hw:1,0 -f S16_LE -r 48000 -c 2 audio_capture_test.wav`.

The sole modification is including a new entry to the device ID table, which can be found in `drivers/media/usb/cx231xx/cx231xx-cards.c`.

Note: I previously submitted this patch to vdr@linuxtv.org (https://linuxtv.org/mailman3/hyperkitty/list/vdr@linuxtv.org/thread/4QFRB6JX3WD7Q74XAR32DHUDODTPKNBE/), but was redirected here.

Signed-off-by: Rohan Barar rohan.barar@gmail.com

Thank you for considering my patch!

Kind regards,

Rohan Barar

