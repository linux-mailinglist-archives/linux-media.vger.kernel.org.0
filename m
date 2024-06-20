Return-Path: <linux-media+bounces-13858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C686E911003
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 20:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C2DC1F22F5A
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 18:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3F31C68B5;
	Thu, 20 Jun 2024 17:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTnd2+Ww"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83CD1C689B;
	Thu, 20 Jun 2024 17:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906288; cv=none; b=VbByJxYfXpVoxy3txFkb7d7hyivi/fG5N58cccLyhzt+dstQ3dOYhs+Gu/XkSDnQhFoojU5J24aOrXUMfKaJ4kt1gPvi4Waz73jQG3ZZWfSBM+xYNLyc9NzSeF8QibTuDad7TVsEWFpWCDaDrlsY+cKhHLMOaNzSYAmpqPC+fuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906288; c=relaxed/simple;
	bh=rbpkUlmlOme1ikdxKqZBWeti6AjXTa90yhLh7ntoYNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjvnAhWj00yYCdT2ylyQpEPFsyUZilTFspcE7C2oxzBYrPvQ4E4kc0yl9uFMWKS1eWKwvu2KxxlEKr9KA2GJnYfWnxIaynp19Y7P8m9ltoQmxnLfWlkPiXgtwSauoJFT1j3S5IvT8kmSXenAcP+4uZMOlbaBihaUpSxkms/8Lx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTnd2+Ww; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f44b45d6abso9824665ad.0;
        Thu, 20 Jun 2024 10:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718906286; x=1719511086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFjixNs7es/to5XyEjk1SDKnVmCrXPTnsKlxKMUnV5E=;
        b=RTnd2+Ww4D8I3qYAX+wiRl47Ig/lyjyAHqWZ2Sd3TlnxQHuGzxZx6ngzqlFhmhGQt6
         N9mk/PUfHTWE2rbV+grMl03x2h9BB9mM02ZyZG+HixVzU/BNZwOZnhbd03IJPSHmLLQ8
         kvFcQxOurvVzGnXVx6i8HWlgs7VsB96LvPkE9dy394+mJccSeJ6jw9aYDjszWWhwabpB
         Uik/C7EJIx0YYLcK1KYgihn6IJMn/K+YtLcf1ciKmBiFGRW3vEG0QSRgQ3ax+7dUJ4pk
         /lQUesoG/4o7RA9YxhOfqXn84q6N15woGm4JKJhY8YP/3KpuZ8fIwO0EvjT01J3A3X0p
         RZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906286; x=1719511086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFjixNs7es/to5XyEjk1SDKnVmCrXPTnsKlxKMUnV5E=;
        b=s0ivuSK4n9XW1EhAto3B0BTdEOK3a36qBpH4TOerExHogQQhSERDxoGRbXypAkiTNh
         PTvtuaI2kfjfAHuCJRj2j0mzWgyb8a44Yog/WZvNvQOX6+4V2pG2H5Mcq84l+yrK5pOe
         uC/4U3H7qRAS51DBxnvKptyTqw5esyXJMMHSeiPfUCQo0nRxFkEkWRRChZxjPQ9KrMjG
         8g+qu+QKSkUUbxvwQi0mset7TGGbRE6nC4uEiI6qJB7thlt3FK75SJTJj6JWDYWeRLR9
         ReqZw4Ioon3nzLFUy2bxKakZb0EctbONEN9F8ioAsbliMp5meogSJaULHMPpTC+UbxWO
         PgEg==
X-Forwarded-Encrypted: i=1; AJvYcCWOuo7/0GjkmXHeYeQd3OA+j8SXl6xeNyxkwzU2Aiw6fkLDwPMhZa+AKZsh5hLC5D4C6O4IKbCgfgrWEsI9y0HMJ7BjrRzTK+qOHCk=
X-Gm-Message-State: AOJu0YyDj6hy4ZC7+5BHePtDL+IlEHn8YffqdQ7dOGeCdL9560mbRkMS
	PFnlZS3sELecJ6MeQQX/d0VDhGdMT48flq4R7E4kY+2H//nXJ9jmMFXaElfo6p0=
X-Google-Smtp-Source: AGHT+IF/POMq9aLYdhYAN8mGl+02ev+tjcxf5SZfsiQcx3hYPUqBs5YJM468bSW3OlFox/Lm2qYWhA==
X-Received: by 2002:a17:903:2c6:b0:1f4:977e:bf with SMTP id d9443c01a7336-1f9aa3c1bf6mr80297755ad.19.1718906286292;
        Thu, 20 Jun 2024 10:58:06 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e55c96sm139667235ad.61.2024.06.20.10.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:58:05 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Jan Kara <jack@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v4 20/40] media: radio-shark: optimize the driver by using atomic find_bit() API
Date: Thu, 20 Jun 2024 10:56:43 -0700
Message-ID: <20240620175703.605111-21-yury.norov@gmail.com>
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

Despite that it's only 2- or 3-bit maps, convert for-loop followed by
test_bit() to for_each_test_and_clear_bit() as it makes the code cleaner.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/radio/radio-shark.c  | 6 ++----
 drivers/media/radio/radio-shark2.c | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/radio/radio-shark.c b/drivers/media/radio/radio-shark.c
index 127a3be0e0f0..c7e5c08d034a 100644
--- a/drivers/media/radio/radio-shark.c
+++ b/drivers/media/radio/radio-shark.c
@@ -21,6 +21,7 @@
  * GNU General Public License for more details.
 */
 
+#include <linux/find_atomic.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
@@ -158,10 +159,7 @@ static void shark_led_work(struct work_struct *work)
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
index e3e6aa87fe08..d897a3e6fcb0 100644
--- a/drivers/media/radio/radio-shark2.c
+++ b/drivers/media/radio/radio-shark2.c
@@ -21,6 +21,7 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/find_atomic.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
@@ -145,10 +146,7 @@ static void shark_led_work(struct work_struct *work)
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
2.43.0


