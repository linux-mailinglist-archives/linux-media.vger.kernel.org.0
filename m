Return-Path: <linux-media+bounces-18701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F558988663
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 15:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A1D11F23C96
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 13:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3ACD19C567;
	Fri, 27 Sep 2024 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fImNSDae"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31DD19AD85
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 13:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727444426; cv=none; b=NJNjc8UIxDa5pjRuszdLsGMYj+YQvHss5MO1s+iW+yAeLGwMlO71sq9KE1VUfKPVhZ1ivMibLQsyNoJEAqZYqvtp8gmTpfMDBJrsIqj5p/GSWXjoWehfvGK6qTRGenD776DeWEbXEQNyo3kW7BJDs1KBvguf+AzTZTreGH4X3T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727444426; c=relaxed/simple;
	bh=RMXp7priB5Y5j7nKppG92BHu2f1S/fC6r3jfeox3Jlw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QtIQd+q2wb+4hf1lBCxmyn8OtUflukef15Rk+7yBpvLmMFnve2Q22SmC29pLrwHokqE9oOAyIUXLLyC6MCqxmXj89GGEoTH/thip5cEPVobFsJCgs7oMgu5wVnKhW1tIcJRWUxcU9MlJCKjgC0GFhDnuRCzhTzDxbMpqjiYMtBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fImNSDae; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d6ac24a3bso395244066b.1
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 06:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727444423; x=1728049223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LnLrvve10Rvi05QdcUmc9qxadiCueCa9J3bDA0HtS/Y=;
        b=fImNSDae8CzVu0vkgjEEfIcI+NlWP3bXKrOATvFTKJqQIM5ZDktgiBgTR+2uN57G50
         IiXTmBe3I3oSFXcCiYeaP00W14NxykA4+cRQ/YQlvzgCAcB1R0r0yg2MrT7t83e8+ki/
         So1RZAm0VVWhnsZyKURbhsu1UCm9wvWZZVZNwouP6wgLk+d1bhbKqTGhpjC6QeEiLBEt
         3PSFw4fqaXje5DRRIXne7HO+oUwrcQhUmC6oWPODHmRyyHJmhsbpr28ePrWJwkn8tEWT
         S65K+UM3S/yxSwtZBIXZ9xNp5k4AYWcl2id086K+L4AD2BxmtdJG75IkIhcAXWKRScCJ
         9Low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727444423; x=1728049223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnLrvve10Rvi05QdcUmc9qxadiCueCa9J3bDA0HtS/Y=;
        b=qmIFm9qADrfK1CpZ1pW1s+qrKy1q5ZMxn6fdd7XanTrc/jVbjwmBil5+jthbSFPBHr
         +oSnUDgdBOhGqgXifGMae090vTgxdOV6dMxn3H3ciGMGrsmrjBsRkOm6mm8LEi126gP9
         gDFh/LYrtmi+nYwXW0K7GSj9LSw4QX2mP/Q7Ir4pPwz2brWBxUc1QQc0plxi2qKQ2vRs
         A0Ol8n6EXLaEZtod09v81MMj41z1PVsd2wbb8gCYw152GSyzW5Mqi+o8jfreYs/3z63I
         57DScKy/sk+YQBOXyhCKhbi13oo3oJXKgAz8y7uZNZgiRdK4jWP9RztAh03bUcfyqkcy
         gewg==
X-Gm-Message-State: AOJu0Yw0yV+osEO+0hL4SfGVPyQFzTBk2oUbdDsXJmG/6OPtsniSaKy6
	oF3rTylhyH3FPB5A5kfDu1g+E9VQsLgxtkGxP8vKvHTlryBATtIhaSrhgQ==
X-Google-Smtp-Source: AGHT+IETX83mp/YeKU9B7+xG1zvqisNuReklWY0ricqpDGCDDZQig0tpjSe3RHdKR0aOL0AIi+i3aw==
X-Received: by 2002:a17:907:3f26:b0:a8d:481a:563a with SMTP id a640c23a62f3a-a93b165ddd5mr681264866b.25.1727444422807;
        Fri, 27 Sep 2024 06:40:22 -0700 (PDT)
Received: from fedora.to.infn.it (eduroam.to.infn.it. [192.84.137.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27ecfedsm137315766b.95.2024.09.27.06.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 06:40:22 -0700 (PDT)
From: Fabio Luongo <f.langufo.l@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	Fabio Luongo <f.langufo.l@gmail.com>
Subject: [PATCH] Fix the S-Video capture on August VGB100
Date: Fri, 27 Sep 2024 15:38:41 +0200
Message-ID: <20240927133841.109973-1-f.langufo.l@gmail.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are three separate issues preventing color capture with S-Video
on August VGB100 with the cx231xx driver (same vid/pid as OTG102):

1. `cx231xx_set_decoder_video_input` is called with a u32 passed
   as its third argument, yet this functions expects a u8 instead.
   Some information about the configuration of the video mux is lost
   in the conversion, so that ch2 and ch3 do not get set by
   `cx231xx_afe_set_input_mux` (expecting a u32 but being passed a u8).

2. The input pin for the chroma signal is not correctly specified
   in cx231xx-cards.c, which can be verified by looking at the inf file
   coming with the VGB100 and OTG102' drivers for Windows.
   The mistake in the cx231xx driver likely stems from a wrong comment
   in the same file, suggesting VIN1_2 for chroma,
   while VIN3_2 is actually used.

3. Even after fixing the two issues above, the captured stream remains
   essentially B&W (although acquiring some pale green shades, suggesting
   we're moving in the right direction).
   After tests with somewhat random changes, it was found that removing
   `CX25840_SVIDEO_ON` from the vmux configuration in cx231xx-cards.c
   results in a captured stream with the expected colors.

Signed-off-by: Fabio Luongo <f.langufo.l@gmail.com>
---
 drivers/media/usb/cx231xx/cx231xx-avcore.c | 2 +-
 drivers/media/usb/cx231xx/cx231xx-cards.c  | 3 +--
 drivers/media/usb/cx231xx/cx231xx.h        | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-avcore.c b/drivers/media/usb/cx231xx/cx231xx-avcore.c
index 3d3c881c8e58..9025693bc295 100644
--- a/drivers/media/usb/cx231xx/cx231xx-avcore.c
+++ b/drivers/media/usb/cx231xx/cx231xx-avcore.c
@@ -623,7 +623,7 @@ int cx231xx_set_video_input_mux(struct cx231xx *dev, u8 input)
 }
 
 int cx231xx_set_decoder_video_input(struct cx231xx *dev,
-				u8 pin_type, u8 input)
+				u8 pin_type, u32 input)
 {
 	int status = 0;
 	u32 value = 0;
diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index 92efe6c1f47b..f68a6ab9d5aa 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -679,8 +679,7 @@ struct cx231xx_board cx231xx_boards[] = {
 			}, {
 				.type = CX231XX_VMUX_SVIDEO,
 				.vmux = CX231XX_VIN_1_1 |
-					(CX231XX_VIN_1_2 << 8) |
-					CX25840_SVIDEO_ON,
+					(CX231XX_VIN_3_2 << 8),
 				.amux = CX231XX_AMUX_LINE_IN,
 				.gpio = NULL,
 			}
diff --git a/drivers/media/usb/cx231xx/cx231xx.h b/drivers/media/usb/cx231xx/cx231xx.h
index 74339a6a2f71..228ecea4cfe4 100644
--- a/drivers/media/usb/cx231xx/cx231xx.h
+++ b/drivers/media/usb/cx231xx/cx231xx.h
@@ -916,7 +916,7 @@ int cx231xx_enable_i2c_port_3(struct cx231xx *dev, bool is_port_3);
 /* video audio decoder related functions */
 void video_mux(struct cx231xx *dev, int index);
 int cx231xx_set_video_input_mux(struct cx231xx *dev, u8 input);
-int cx231xx_set_decoder_video_input(struct cx231xx *dev, u8 pin_type, u8 input);
+int cx231xx_set_decoder_video_input(struct cx231xx *dev, u8 pin_type, u32 input);
 int cx231xx_do_mode_ctrl_overrides(struct cx231xx *dev);
 int cx231xx_set_audio_input(struct cx231xx *dev, u8 input);
 
-- 
2.46.1


