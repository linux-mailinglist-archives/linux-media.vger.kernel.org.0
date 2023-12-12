Return-Path: <linux-media+bounces-2179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 199D180E1D2
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 03:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C93782827B1
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 02:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B7A5CBD;
	Tue, 12 Dec 2023 02:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RE32qoJK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C5710D;
	Mon, 11 Dec 2023 18:28:24 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5e190c4ce5cso7278907b3.0;
        Mon, 11 Dec 2023 18:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702348103; x=1702952903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=va2vHLw3Ty5+9zMdFDg2qigI4FO7sF4QYmqp/MMfS60=;
        b=RE32qoJKos+jUKofbWoUByihuaOXfd8fS/GWiJmLeAilLLxvicnfmMP95bKgkpv0OE
         njergsGPHQQ1bJDG6NjZCtP8sbMZaeSv21rKqTUdhVtVfsQJVMempODuu3lr9p2NUebg
         awgllwTB7eMfCC5RCt6HRcCmmgjWxCjeNrI8pQl61eH5JDRNmDX0kQxQfNabh8L7r044
         1NNfS7TIFqhNt946jEidL1gC+HCP6rd2SgA4nc8gG7ixMauz3GX+UnNQ5Qy2KTA9r80j
         1B3JH+NsejlWPu9cpxQXhrApvCL9ZNwlBvMNoYTkt5MTsm7Jlx6+4aDLjXNhcMU+vkYk
         6b4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702348103; x=1702952903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=va2vHLw3Ty5+9zMdFDg2qigI4FO7sF4QYmqp/MMfS60=;
        b=ih+wKtDEX8GyvLC/CKWz7AH6EImF9MSVa+2eqPqbL+CZ8tRDyHHi8Slh7+miXSHL6Y
         XAVX5GBndRLKKpeuUZXKSVtbDoPLhpeXl5woDdUQJm4GFArXV2PHHiJFZCsGAqV0GlgL
         F3dqLN3FON/Kk9YS4pnyTBRx7OVXfPn5VovMRRd99Yflvv21/wkNBO+PKd9gQGOuSx5D
         Lm+vMGEmgmtvO/1RqwvDh7QECVUGlZjD/4zx1vnggU8yAtglUcgi0QZw7/LnuCpw5Vjo
         plFQnhhnpHW/F8IgdO/szKH3kYpfXi66EwNXhEme0Q2z5ub63Rg63ATzcJvBp4YikZul
         O/6g==
X-Gm-Message-State: AOJu0YwG1CppKweHwbXfCkS5BlYsTfiXqkgPI7mWppn3854+KpJDuyCT
	mRYUrbh7gjk83fB4X8W5FHLIgOSJUwnLrg==
X-Google-Smtp-Source: AGHT+IHngUkzlUE6ykpfOt2noOpZx7E2f44wkktyKrcENOqj5Bj/OgMDPvA3unZcpysQrzoP1HwKsw==
X-Received: by 2002:a81:a190:0:b0:5e1:7f1f:c629 with SMTP id y138-20020a81a190000000b005e17f1fc629mr882344ywg.0.1702348103377;
        Mon, 11 Dec 2023 18:28:23 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:38aa:1c88:df05:9b73])
        by smtp.gmail.com with ESMTPSA id ee12-20020a05690c288c00b005e16c1c0bf9sm592682ywb.95.2023.12.11.18.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 18:28:22 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Jan Kara <jack@suse.cz>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v3 20/35] media: radio-shark: optimize the driver by using atomic find_bit() API
Date: Mon, 11 Dec 2023 18:27:34 -0800
Message-Id: <20231212022749.625238-21-yury.norov@gmail.com>
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

Despite that it's only 2- or 3-bit maps, convert for-loop followed by
test_bit() to for_each_test_and_clear_bit() as it makes the code cleaner.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/radio/radio-shark.c  | 5 +----
 drivers/media/radio/radio-shark2.c | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/radio/radio-shark.c b/drivers/media/radio/radio-shark.c
index 127a3be0e0f0..0c50b3a9623e 100644
--- a/drivers/media/radio/radio-shark.c
+++ b/drivers/media/radio/radio-shark.c
@@ -158,10 +158,7 @@ static void shark_led_work(struct work_struct *work)
 		container_of(work, struct shark_device, led_work);
 	int i, res, brightness, actual_len;
 
-	for (i = 0; i < 3; i++) {
-		if (!test_and_clear_bit(i, &shark->brightness_new))
-			continue;
-
+	for_each_test_and_clear_bit(i, &shark->brightness_new, 3) {
 		brightness = atomic_read(&shark->brightness[i]);
 		memset(shark->transfer_buffer, 0, TB_LEN);
 		if (i != RED_LED) {
diff --git a/drivers/media/radio/radio-shark2.c b/drivers/media/radio/radio-shark2.c
index f1c5c0a6a335..d9ef241e1778 100644
--- a/drivers/media/radio/radio-shark2.c
+++ b/drivers/media/radio/radio-shark2.c
@@ -145,10 +145,7 @@ static void shark_led_work(struct work_struct *work)
 		container_of(work, struct shark_device, led_work);
 	int i, res, brightness, actual_len;
 
-	for (i = 0; i < 2; i++) {
-		if (!test_and_clear_bit(i, &shark->brightness_new))
-			continue;
-
+	for_each_test_and_clear_bit(i, &shark->brightness_new, 2) {
 		brightness = atomic_read(&shark->brightness[i]);
 		memset(shark->transfer_buffer, 0, TB_LEN);
 		shark->transfer_buffer[0] = 0x83 + i;
-- 
2.40.1


