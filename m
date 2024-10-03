Return-Path: <linux-media+bounces-19025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B2898EC63
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 11:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E1E01F23686
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 09:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C89E1474A2;
	Thu,  3 Oct 2024 09:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jx6d1uVV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A599F7F48C;
	Thu,  3 Oct 2024 09:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727948497; cv=none; b=qxN0kcmMf1SpgGpyINjJltyu1b2HmtKX4SPk0gaOjyzx7B8Em4q+nL/bWV8nMrTvUm0lu1pMIg1kJwuceQGPOvEBeoB0/AKMl2m0VqweQZ8xsjsIBivfskq2ctHc49rM7vcO8FkJLiEJOkaCuRScVN8h+ajpUYwo+NGzn+WGBu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727948497; c=relaxed/simple;
	bh=KwdiU7e6jwQOUK4JMjIqWgd/iGKoH3nUSss+p9So8YE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hKEEJDs+z5FAy1huot14t3QR7oGMEd6w19UTOcZx6irIWYzGW++GApvxD9ggV/ZTM2nfJ+gBSxrEAgdyAFz3dY8oIs+21ZeKsEvPwTF8SkOSnHfIESBeKqmydsA10t2aNHNMnBjz8ZzX1Jcy3O89kbUDQ5FJIPtdjAMD+7re1Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jx6d1uVV; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7db174f9050so158356a12.3;
        Thu, 03 Oct 2024 02:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727948495; x=1728553295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaAziZ5BzdqeZgTYUzIk4JiJJBELIKK3NVIKrTIoSy0=;
        b=Jx6d1uVVXA1gVOPIllzZ1jv45pT0nAiFUo5nyLy94gFTjWucLyyZOY8DMNffo/bVLz
         wZcY6xZqW0F3BZloNSxli+DFGF9S6vz5COjg2tpy+7Wy7pStxggl7AECjEjCuFEgyp31
         nuET3TRGS9gm6NgNszxyQwUgKp5Rm2kaH9ZwjAgJxpLiOns/pWJpgaeluay9teM5TsTC
         Y00MoIL8dT2hiplQWggj5/qrbxzUk/5tPfe8Clr9y7pirNwPJXnRVZsY5UMeXLaXl5X8
         +2QEOY0/yzs3d3eXygc7OGJfDbfsnGtnFAxdChPcXC1bluqd6g7wKgNYIPbJc00tYguB
         tapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727948495; x=1728553295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LaAziZ5BzdqeZgTYUzIk4JiJJBELIKK3NVIKrTIoSy0=;
        b=H8+dMameAGbeLRZdkjHBXZrvlTh/SKI7TgiCa1wN3fk0XpaTte1xr/UZhPwl3uOrVR
         O9iPz/Oo2yiCzq/60iI9hI2wS+CQQ8WtPoxnY0senFOwJm5YciX6j66XT9gbk1ivIHRZ
         zCOvK5Rf1p7Zi4czimViCpYeI+TUyJo+dXE5oUejl7tKXIorINTlhmNK2CMwx6W7qLFV
         NUtCUOzPcCB+4nHVPaFupoU2vsdLzCXv0YhxWgYNS9/FYBHpmbaFmNJU02m7dy/NFEJi
         11qdFQ2ct3llG4pzu3F2FepayU6EKvI808T3saX+sQ4t11tBW5fTkoMzApm7y7D/i7sy
         6Kkw==
X-Forwarded-Encrypted: i=1; AJvYcCXWJIlAv2KQtV2jfOSK/tEL44Bzi+nWZKCePR/mQ8K2DtUcItyCxgR8JzP0uBn/m/FD6Z52Mv/buMXcQJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO3W/NYNmpNk9HimymnAk7Xg1g/kAF4YNxs6IT8q8ZG3DuNDHc
	PMfMbkWB1qDny2gP3R3BAGBbOGEFx4H9/WbMjvwG8M2FdA1hzuKb
X-Google-Smtp-Source: AGHT+IHzp87d8RlBHgGq6QEtWCw9cP0+SIVZM0Si98O7W13b6emrK07fZOu0Jjc9/Oy55CFtXXJjoA==
X-Received: by 2002:a17:90b:4b4e:b0:2e0:944b:9524 with SMTP id 98e67ed59e1d1-2e1846c9f16mr7147308a91.22.1727948494799;
        Thu, 03 Oct 2024 02:41:34 -0700 (PDT)
Received: from localhost.localdomain (n203-164-232-111.bla21.nsw.optusnet.com.au. [203.164.232.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1bfd2a08asm1084624a91.46.2024.10.03.02.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 02:41:34 -0700 (PDT)
From: Rohan Barar <rohan.barar@gmail.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rohan Barar <rohan.barar@gmail.com>
Subject: [PATCH v3] media: cx231xx: Add support for Dexatek USB Video Grabber 1d19:6108
Date: Thu,  3 Oct 2024 19:40:40 +1000
Message-ID: <20241003094039.2893301-2-rohan.barar@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930232500.1700330-2-rohan.barar@gmail.com>
References: <20240930232500.1700330-2-rohan.barar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Dexatek Technology Ltd USB Video Grabber 1d19:6108 to the cx231xx
driver. This device is sold under the name "BAUHN DVD Maker (DK8723)" by
ALDI in Australia.

This device is similar to 1d19:6109, which is already included in cx231xx.

Both video and audio capture function correctly after installing the
patched cx231xx driver.

Patch Changelog
v1:
 - Initial submission.
v2:
 - Fix SoB + Improve subject.
v3:
 - Rephrase message to not exceed 75 characters per line.
 - Removed reference to external GitHub URL.

Signed-off-by: Rohan Barar <rohan.barar@gmail.com>

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

