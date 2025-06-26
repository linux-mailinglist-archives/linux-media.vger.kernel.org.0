Return-Path: <linux-media+bounces-36030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB96AAEA4E8
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 20:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 572451899712
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 18:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F7C2EE27D;
	Thu, 26 Jun 2025 18:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjSKrhN9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27412ED85F
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 18:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750961115; cv=none; b=ZGIvP5fCz0cpoUOPtrfVB99Wk/2hZdvv4MDMA0/RqEj79YB00kydNmjvf+HslBuXRnKkK+d5C+yCZ0iqyNo8rIh1rPRfxJeqS04irerLeDSxo3XQAcz8N69InSAB7zEhK+4oYiiQK1h27ecgjvCPy/dP9HP64sFkEe6bsiQ3eW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750961115; c=relaxed/simple;
	bh=HT1PZrDkhp6DI0bsi07qe2ZDkBoSKcXmqoFHOkEVHss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hh9D5CS9TcJ3y/I3sU9CWZ+r6f/BDzg9uIzOLbbyANhHFqbB7WABWaJNtu/pbRizyAV8ytFXV9+QIHnLBNVqZ+ZEG2a3T0AHborUAG0PwDLUsgluKKTthhOZpcGyJ9D6zlwXryyNNvpafrNXDwiW3bSYT+iQvG9z3UAxCgrFHVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjSKrhN9; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fad4a1dc33so13436666d6.1
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 11:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750961112; x=1751565912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QiZwuPd0AoWibuQALk3DmH+qz68nVTZ0UFoYX05f/uk=;
        b=cjSKrhN9i55CUBkiyawY16YeZ32z1ZbKIEHysAUDgdG3OjTTQxNoh7nV/xgWHZToPh
         q4mljyeq9MvIzCuymj3ZaNmLS+2lE4yxDGEyzQNGzRa6PZ4hReiB/FohTTjLZ7qCT/5C
         NWxyd62SMS2oLgqfGKw2UczbCIbdbRMKdLpjE9v7sy9Fx97OcUmYZWY4C8yAG9QqonNL
         5LUqTepr/sjwDt31BtF5Mfb+uTkA8FqPdscZP/NEbmhUlj27XeNBH+aN9rbPa1TRNjSV
         W0vSf914mBLeP9Qagn3NLxwwNQfjXkdGEg2XpR2NbtahWFCsCWPXgYjjII+JC2ALZ9Mv
         mRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750961112; x=1751565912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiZwuPd0AoWibuQALk3DmH+qz68nVTZ0UFoYX05f/uk=;
        b=HgJxSvhxUzWMO4nZb5BKPjR2teCPzKJT3IT4xPzerkuRHXJw24GOchMZK4Bz1ys87B
         LCrp8ZSNYozc+/7eoJOwF5iNHRPUXsW89fIhGbkNUZTbIaYHZG3IGE0PADt1JPsehohQ
         dCXejQz0p/TTmYgsQS8wrN8V5UK7b3ON6A1yoIuH/SBixTzC4yBcLSUCgf0N/Dj/4mO3
         GBbx6/3T9a1emrKB7V/tb382af6teW3ONECNkLAPSnPIkKFgLV5mkR3cNZuhBG/Pz1GE
         M9YVoNZUzqXt9Z8dEUAjGOyrPOVeN/z+9NsYuZvL0wgAO2kmUsBuiQg5YBDphIOKeB8H
         uKAw==
X-Forwarded-Encrypted: i=1; AJvYcCX6Mk6+qrT394zJJDfpaTfuvPdJ3Pc8gm+V8TwEHE+gc/+tWvM6eMQbFbxlh/oUu8JT7g3xXF5wscD+pA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz36c8pTYYoA2X9HJndlBjQ/tfdNLaU13NgvTLA4bu3pXzrkFZr
	hovJFROYcrCo9WDSuO2Z8nvbdHG1xn/KxPjo1GS+Q6FbYOKke+5I8YUQ/HRnsA==
X-Gm-Gg: ASbGncs7DgnKv1VfCAmjJ9V0Wwuag6YqsUdmeEyiGzmOxr9cida3Pxfy6dkRRdYi+KB
	VzW7cotNKi3cOv0tGrS/DdCzfOhdZkMQJdKfHu+j3Rcbz1AoqaGDpyYcw5+Vo3joz3aXTKapdFC
	DXDJTVGCS98D+Ky8V4XoEcebvegO6ZCLwtlYCFFKgGO8FfN5BUtrOz/MfraZzZC0wU/weMHXvAj
	PPikT3eEGIa90AAHM3R3gIwVra6OTUiXHgJHZeJC0qK3HpS3RjGMh9o1gXKDYW8BJcV+WmnCQrK
	8Pvq7xdUvOX9wWEjn6jhYETbiIzw2Wn8YG93ahTSvGsAZlPVkosHpzzpKsmMBkw=
X-Google-Smtp-Source: AGHT+IHYFaQB5GHbsOCYeA1UF1X/ISUE8ktNNkR0Io1Lwu5YgHalrnr3AC+l4k9aMZGTFwqnzb6Q/w==
X-Received: by 2002:a05:6214:5508:b0:6fa:b954:2c32 with SMTP id 6a1803df08f44-70009088d35mr8716736d6.35.1750961112237;
        Thu, 26 Jun 2025 11:05:12 -0700 (PDT)
Received: from fushigibana ([2601:405:4a00:186f::50e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ae40sm10283336d6.106.2025.06.26.11.05.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 11:05:11 -0700 (PDT)
Received: from pnariyoshi (uid 1000)
	(envelope-from pedro.nariyoshi@gmail.com)
	id c5e35
	by fushigibana (DragonFly Mail Agent v0.14 on fushigibana);
	Thu, 26 Jun 2025 14:05:10 -0400
From: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	MrChromebox <mrchromebox@gmail.com>
Cc: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
Subject: [PATCH] media : cros-ec-cec: Add Fizz board variants, so driver can detect them
Date: Thu, 26 Jun 2025 14:03:41 -0400
Message-ID: <20250626180429.463420-1-pedro.nariyoshi@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I recently reflashed a Chromebox (Wukong variant of the Fizz board) with
coreboot and I noticed that the cec driver refused to load with a bit of
tinkering, I realized that the dmi_match_table was expecting the product
name to be Fizz, but `dmidecode` reports `Wukong` as the product name. I
am not sure if this is the best approach, but adding this patch lets me
load the driver and it works properly.

Alternatively, we could instead match the DMI_PRODUCT_FAMILY, instead of
DMI_SYS_VENDOR and DMI_PRODUCT_NAME. In my board at least, that says
"Google_Fizz".

I am open to suggestions for alternative solutions and I hope I did't
break any rules (this is my first kernel patch). (And sorry for the
previous error in the subject line)

Signed-off-by: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 419b9a7abcce..a26473c3cd84 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -302,8 +302,15 @@ static const char *const port_ab_conns[] = { "Port A", "Port B", NULL };
 static const char *const port_d_conns[] = { "Port D", NULL };
 
 static const struct cec_dmi_match cec_dmi_match_table[] = {
-	/* Google Fizz */
+	/* Google Fizz and variants*/
 	{ "Google", "Fizz", "0000:00:02.0", port_b_conns },
+	{ "Google", "Bleemo", "0000:00:02.0", port_b_conns },
+	{ "Google", "Excelsior", "0000:00:02.0", port_b_conns },
+	{ "Google", "Jax", "0000:00:02.0", port_b_conns },
+	{ "Google", "Kench", "0000:00:02.0", port_b_conns },
+	{ "Google", "Sion", "0000:00:02.0", port_b_conns },
+	{ "Google", "Teemo", "0000:00:02.0", port_b_conns },
+	{ "Google", "Wukong", "0000:00:02.0", port_b_conns },
 	/* Google Brask */
 	{ "Google", "Brask", "0000:00:02.0", port_b_conns },
 	/* Google Moli */
-- 
2.49.0


