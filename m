Return-Path: <linux-media+bounces-28880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 183FEA73E6C
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 20:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ACB8189DC7A
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 19:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E4C1A8409;
	Thu, 27 Mar 2025 19:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YW3BkigU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997981A9B53;
	Thu, 27 Mar 2025 19:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743102739; cv=none; b=EV8akhjG/Ih4xtlLkcLtARmD7x17BfD0qLCQo1fck/RUZ33kE4q9xRBVf+hijisMyVb58/Ux/9d3bJAIdzRNH2scupWChW95epjKxEkcy806lzhDzXN3YbEGTcatQ4VTOdAJ1xtonXSFZrEQLV6hYrAhVJEtHP2RaUAHcAjP5Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743102739; c=relaxed/simple;
	bh=Ciuy7SYnjMYUooGCr49YaQJO0AOzZefzB1tqQvXWtdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B0ciyom5TQAjb+ALiXwM4pkw3WE3r8uXAP7lYT9ZepXwkdRXnWLdHm6xGl+xevW/EigbFY2BeNueejauZHBDsQ+DwFcLdiQVyzFxpJIKvAE6yUdDpy0hZdirt1r3pf0xoROmn7RZp5XIHJ/bM43jncZi4LKdZiRvv8F+gWE0yzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YW3BkigU; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54af09697f5so1299845e87.1;
        Thu, 27 Mar 2025 12:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743102735; x=1743707535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=StkVM+le25Hla98QLuBqf3lB3dQcljggHb+Tt9lM4Wk=;
        b=YW3BkigUZ0T/3AsisQM27TrpxehuozWR3pX/aX5imHNQ/y7FDk2y+6h9wdbMgPJhx3
         XEI9BqhMTbt5nuOO2DQodya9oxoFnvYAMXR3j4BwwlEw3SuCUvbpgJ3Lo+9VhCQVN/X8
         JZpArJPjswdNH9+1qgnsjdgEtUXl9xHRd5XcNNlV6kiiol94AD6BdwVGCeZx950JkEGG
         TwQve5AAdGUqhtWEuoEepSfcC8R4p6jX0i7mIsB56APYtpF3yzJ47h0m2NoWAKgTB4BX
         1mXIUuEN3kgdMPRVu4vzbAwX/QKxRrjRdEt19Lz26YG5yW8Mdvw6aC7MReMRgQzk3WRz
         gq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743102735; x=1743707535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=StkVM+le25Hla98QLuBqf3lB3dQcljggHb+Tt9lM4Wk=;
        b=plQWcNs6qATzAFNUYhbj8Q+Eyu+sZmDyUm5ovO/TXgntbdOUb7jdP1vk2FsSQq8rb2
         yklwuPl87nXhpZElkrFzQHy26nSOYYyBGBiU7a0Bw/wxr8Buev8Ry0El5t4cyiaGpwuq
         mM6RgeUvb+Z4prtn0MCPsS1l0ttQ+ocSkkUfITww72EcRfVLGQW1c1ZTOMBwFjjTje3r
         0X43hWbRkixMFyZGZGsS19MyvBIlWrwpspS1i/A4WiRAoxbztM9WkhuJryR5BbBYOjH4
         UJ2dEelGOg2wpQG2XNOi+cUXmttlsOhnS4C5Fju5MD8HWg9bikShHKvsebv3KejlYhPF
         Y7fg==
X-Forwarded-Encrypted: i=1; AJvYcCU6LS7vZ2Gcs24XTukrXzQ98ZxLtxTraLc62kttMuuKm4CohMeaGv6o6r6DvrJ2qbX6pYrNafQrPUcwRWw=@vger.kernel.org, AJvYcCWD2etJ7vvFwahGGc270AzFVqhRz9SLzkvc0+iXqCqR8xi8KlV8/h2YLlX8EkWN/6UCA/EBXzTbDZJzhZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOWm/9HZDqnXNbGgFYYMswqzLCxI/HuEsEElXTtr1+ngToYmxV
	g/U+a+JenB0tnEQinAVWOF/fLzCPUw8S9RMc51uzxRAQvkOhRxjQ5lrJUg==
X-Gm-Gg: ASbGncsvpsLEDxMCiNvs5Rmb8Q804qKZYjFj1nnpovM40ivBKDr2HJAl9UrCzKwEdh1
	pxwO+kZyl9+BHXjH6L3GvkTvgj5bzBIiBb2B1zNsHa2SqDx9GuaKjw+ft2PTwqpJruZ61wCHpry
	EpQNrlG7Dmi6FKFlFUi+BlwYx7wHNLRQ+LhzUyjdkI3EQOsKZO3lveBNwsLLU3nSoLRkUbRVC9E
	yuM+Jld113z8J+keNyXq36HF0QBHQqno5kmkF7rwR1bu7U0oAK5gHOe9NuOqhp26G5txHzLN1HG
	EppPjfpZ9PdxUDKJ5HSiwQNf/DsvDT70dx46zeKceylc+1PRwA/aweR9SV3/0JbhCnfsGQlDWf7
	MOmy4fZo=
X-Google-Smtp-Source: AGHT+IHY1i46M+bs9tCWsv/F4fXogE3fPvbPST4Ryrgrjr+AS7twse2VWiJ7kMyFqfokFZOVRz9TJA==
X-Received: by 2002:a05:6512:6c4:b0:545:f4b:ed58 with SMTP id 2adb3069b0e04-54b011d5d58mr1743966e87.18.1743102735252;
        Thu, 27 Mar 2025 12:12:15 -0700 (PDT)
Received: from localhost (dsl-hkibng12-50dd15-219.dhcp.telia.fi. [80.221.21.219])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b095a0b39sm51058e87.229.2025.03.27.12.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:12:13 -0700 (PDT)
From: Petja Patjas <pp01415943@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Petja Patjas <pp01415943@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rc: add keymap for Hauppauge Credit Card RC
Date: Thu, 27 Mar 2025 20:56:04 +0200
Message-ID: <20250327191109.76679-1-pp01415943@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add keymap for the black Hauppauge Credit Card Remote Control.

Signed-off-by: Petja Patjas <pp01415943@gmail.com>
---
 drivers/media/rc/keymaps/rc-hauppauge.c | 42 +++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/media/rc/keymaps/rc-hauppauge.c b/drivers/media/rc/keymaps/rc-hauppauge.c
index d7156774aa0e..9e64c0b2d18e 100644
--- a/drivers/media/rc/keymaps/rc-hauppauge.c
+++ b/drivers/media/rc/keymaps/rc-hauppauge.c
@@ -261,6 +261,48 @@ static struct rc_map_table rc5_hauppauge_new[] = {
 	{ 0x001e, KEY_RED },	/* Reserved */
 	{ 0x0000, KEY_NUMERIC_0 },
 	{ 0x0026, KEY_SLEEP },	/* Minimize */
+
+	/*
+	 * Keycodes for the black Credit Card Remote Control shipped with, for
+	 * example, the WinTV-dualHD tuner.
+	 * Keycodes start with address = 0x19
+	 */
+	{ 0x190a, KEY_LAST },		/* <- */
+	{ 0x192f, KEY_MENU },		/* List */
+	{ 0x1910, KEY_CHANNELUP },
+	{ 0x192e, KEY_CHANNELDOWN },
+	{ 0x192c, KEY_OK },
+
+	{ 0x1911, KEY_TV },
+	{ 0x190c, KEY_POWER },
+
+	{ 0x1900, KEY_NUMERIC_0 },
+	{ 0x1938, KEY_NUMERIC_1 },
+	{ 0x1920, KEY_NUMERIC_2 },
+	{ 0x1901, KEY_NUMERIC_3 },
+	{ 0x1902, KEY_NUMERIC_4 },
+	{ 0x1904, KEY_NUMERIC_5 },
+	{ 0x1905, KEY_NUMERIC_6 },
+	{ 0x1907, KEY_NUMERIC_7 },
+	{ 0x1908, KEY_NUMERIC_8 },
+	{ 0x190f, KEY_NUMERIC_9 },
+
+	{ 0x1921, KEY_VOLUMEUP },
+	{ 0x1903, KEY_VOLUMEDOWN },
+	{ 0x1906, KEY_MUTE },
+
+	{ 0x1909, KEY_CAMERA },		/* Snap */
+	{ 0x1922, KEY_SUBTITLE },	/* CC */
+	{ 0x192b, KEY_INFO },
+
+	{ 0x1929, KEY_END },		/* Skip to live TV */
+	{ 0x190d, KEY_PLAYPAUSE },
+	{ 0x1926, KEY_STOP },
+	{ 0x192a, KEY_RECORD },
+	{ 0x193a, KEY_PREVIOUS },	/* |< */
+	{ 0x193b, KEY_REWIND },		/* << */
+	{ 0x193c, KEY_FASTFORWARD },	/* >> */
+	{ 0x193d, KEY_NEXT },		/* >| */
 };
 
 static struct rc_map_list rc5_hauppauge_new_map = {
-- 
2.49.0


