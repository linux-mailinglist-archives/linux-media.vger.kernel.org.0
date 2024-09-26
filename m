Return-Path: <linux-media+bounces-18662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AD8987B90
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 01:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 708271C22023
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 23:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9711B0100;
	Thu, 26 Sep 2024 23:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nX29XnYF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E84A157A41
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 23:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392702; cv=none; b=ciwacYe3v2V6QWo0pZJa3xpezsX0ePyH0UE2nTKohA2h3ux6cX4WMrOMAp8yPhCj18oNdVK8YCmn/1Uqz0rTW+o0Fl53WC3SkfZFB9/jqcSx8KUnvpmF8kmX7cKF0HptB9/PRgjZDq4MhtMW99WrNBVSuBEUmYtQ6z6rnhi/sUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392702; c=relaxed/simple;
	bh=JwNUUL0MIAVlJYRLbFGBNTazvr8N7AlNqoKnIwfewnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iY4zZv5FjDEFR1A4rHJkOAF5NPGqIokguQR3/3NtSOSNbshILqCjrOJ0pPfINw043iqpjeXbvhiFJlR3iPO68ksZhekOSUUeZKBuBavqzPx8DzeunGMSGH1wJCPfCNNtZk7AZn+JcisEXEonMMten7IZfEly+xJce7WE45e7yr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nX29XnYF; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20b01da232aso11785675ad.1
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 16:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392700; x=1727997500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9VAhweZRKnXlTFj41v71IlHvC1esjQxSvn4r4/VgGYA=;
        b=nX29XnYFmkpYSGgUyQ+uOptkzvXxznBK07hoY5nAu5YGtnuIObId3Iv105JsA60a6R
         GHVlv3dfmLJ9AuZkBgoYo4tX5q+6P14VWh/8ividYAjAKupad/Dbb5Por5eZkJbo8PWJ
         9W8TDexJoMfwTHwfRHL2CGYoOxeyaB9L46oufDFpZg77na4xToKLAfNlSmVktUAuIMnj
         N63FIHgK363Orzv+F6/rFct8/15oUOj81wqfSd8hSGscBYSLjYvye6pW1K+plMMXiqH6
         4WveFRC8Y54MDzvlGylVzssJEpNfTtD7+cBQ4f2F57akwykHh7zzoz/RldVkxd1nRjdK
         VaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392700; x=1727997500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VAhweZRKnXlTFj41v71IlHvC1esjQxSvn4r4/VgGYA=;
        b=B9uQdKnAgHMTIkGyYbomsJCt2sOaqZX8MGbTNjQr3lE54tOOWfSCbWufKrNks+do0F
         tHrvrxa6drjMv2/kW/3wL9MXve5GIF4ms2dG3NbCk/+hm9k3t+44IYvoghYiqhAiM5IK
         jJmYKzfkDCn3+8kYPYj61/UCZOATxOLrgVpnIMOpykKIXobKfdt8uwVvfUTxtzSxOxV5
         pE4z947byUtfMh7g+rTqZFCF3+kWtC4iTQXVGPhY02NGRf7YTX3LK/3B8eRHZuyYK1Nf
         dUk2xU9B4MGCYKq9ggCg949a1gdgSzccxVhh1bLS324RyKSGboFOA4HdU0nPjfmPVOXD
         QCKw==
X-Gm-Message-State: AOJu0YzUPDQ4Ti98L/7OsMvh+M4iyK+lQZt7UfzcInZxpm664qL+hqqM
	PoCWnvIDHQtWXVvLOrD4bq8ZyaeLuq31OqjG0iHhyrKIjCnayaMcqvXiT69MHE14ow==
X-Google-Smtp-Source: AGHT+IG82hvZ8TSZWNu+F+44BdSdJ1sEWua1JX69lQOgMvIgX6kneSc7RvRfF5C39l2Xx76utSK3fg==
X-Received: by 2002:a17:902:f78c:b0:205:7b03:ec3f with SMTP id d9443c01a7336-20b366725e1mr24196895ad.19.1727392700214;
        Thu, 26 Sep 2024 16:18:20 -0700 (PDT)
Received: from localhost.localdomain (n203-164-232-111.bla21.nsw.optusnet.com.au. [203.164.232.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e51330sm3308965ad.254.2024.09.26.16.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:18:19 -0700 (PDT)
From: Rohan Barar <rohan.barar@gmail.com>
To: linux-media@vger.kernel.org
Cc: Rohan Barar <rohan.barar@gmail.com>
Subject: [PATCH] Added ID 1d19:6108 Dexatek Technology Ltd. Video Grabber
Date: Fri, 27 Sep 2024 08:49:45 +1000
Message-ID: <20240926224944.248487-2-rohan.barar@gmail.com>
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

