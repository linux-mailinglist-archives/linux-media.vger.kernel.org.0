Return-Path: <linux-media+bounces-21784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8314A9D5A9C
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A20F282092
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 08:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BFF189F3E;
	Fri, 22 Nov 2024 08:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jbtec3hm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96E4154454
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 08:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732262688; cv=none; b=Vzr8IZUv17aWuQy0z4P9C+V1bGJjPapcoV7bOiO2/KMjPypp2pU694pjvVD0PvHYbqIVvf2zz0qBjFYcmOTDKV61Cy+Py7Fe66MPmir8AaCH3/BK0utl8sr4xcBmcwXh+MAx07/pNPUGDGVtMjnOlGpfKK0rOmJb1P99fz6RVE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732262688; c=relaxed/simple;
	bh=KMMNvpSUMBgpLJwpRYLirsu56PRoVQHdFKvZp8gukOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=flytDhB7eyCSgiW6TC1P2Hs3su6/5UB68+sMxhB1w+LtDwi5m53mFd7qrN2Jk2bOtGHpORjL4D6qbjKTJ+wa6tMwSxUkMYh2P3ugZhBEzAeBJmZPd1O4jj8b1pbS7fQCtbrq72Xnrf2WkrLR8b3AgBS4iAukdzfnUvsSTRIEfZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jbtec3hm; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4609d8874b1so11940941cf.3
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 00:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732262686; x=1732867486; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nRSEsk+jnxtZC+QBMSM7CyE8fqgmSJ2RND/ZUIbuhQs=;
        b=jbtec3hmvvub1DXKSDjT3ALLdVidIZKATxdhR5jYi5xnZ0KgYiK7D+fluKkEZyqG0z
         5vC8tXUdhsx0ry1KAWnKkh0HlhcbuLfGcp0IzX8bHZff7yHmBSVrfG525RZbtO0C6dBR
         mHNZEUdXxe2Tm3Lk1odHYbje7+YJuVM58VP4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732262686; x=1732867486;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRSEsk+jnxtZC+QBMSM7CyE8fqgmSJ2RND/ZUIbuhQs=;
        b=mk/VqrTzg32L0lgaDFVhb9K/tpu0oF8S8l2Rr+s4V0efCPZNyemxwC+60Glc49esv7
         5rEmI1a6BvP3hlr+CKu9s8xa53h3X2u7Xnfw3L7Z9UdU7UJu+BRGXoEm0AKVNNCqWaya
         Kh9recsJSuyNkK9aCTsAdxGiqbEHvUzMDdeXGS7If6fjfo9/xMfKbAsmMcu6IDCx0lfX
         A0FI6igp9gz+GCkMNSB5nDuY2dhS8YG49WHIDHSUuR9W81iQaTtGsaSiQ30jtgvgssEt
         zfVw9Nwa2kDZQQWfT6Yl7uFuTIqWJVLeO9NGLUYYmIf2gtMuimUWhBa6LhIY24Xx/3of
         WBZA==
X-Forwarded-Encrypted: i=1; AJvYcCXOWXIAB6gLaZAVUKvTrzTYpcE49S4BfsUD5dHcCYJtjxeo4fCkRQaua3ZCFcTSUSapmAg1+VeRrUxd2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5zc4BDA6SOKexB3pqeOPSFnyafWuNFcyqSW92/6qGSObW2nOR
	t7OkqmxsRN7hHw6KLfAvuCxjSqBBRX96xGvaz+FWsgGFnuqMr9VaapwSiN8VZA==
X-Gm-Gg: ASbGncuRSE4hOHJlV+6hLX7me2owBf6nQxah6HN/NpHn2yIMlhU6pejm5eVj9+2ZWaJ
	4vV3F5CzUMUdrY5Chr6giNDZiROxoBiZ0BnTK9CTEy700zqwYprmXhVIbOKRSGqCOfTtr0qNRNt
	VkBPkFO1i+Vnr6PYRPJinaAfoDJAT1TXitT+ZL42THvoNaG+UHcQlv99FLKjeUWFAkk1DJuZFvM
	rFd0hmp4cYNTpvepZxcu561gPsWDAFI2GJi4fLUd3fOnG54izXy8WTvxCy1is6u9f2HuTP2HI5x
	0Dd5Q9kKVMe+KbXN5qGEnXDX
X-Google-Smtp-Source: AGHT+IFRpRVmK/Ci1GiF9yVhFA6k4CWLrX0LrX2/0uhY5wmo4O/l6ydSGyOikiNPDsrYICpyDxTahg==
X-Received: by 2002:a05:622a:4a86:b0:461:17e6:27ae with SMTP id d75a77b69052e-4653d5a6b9cmr29910881cf.24.1732262685728;
        Fri, 22 Nov 2024 00:04:45 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c3ee43esm8570451cf.22.2024.11.22.00.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 00:04:44 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Nov 2024 08:04:42 +0000
Subject: [PATCH] media: ipu-bridge: Fix smatch warning for COMPILE_TEST
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-fix-ipu-v1-1-246e254cb77c@chromium.org>
X-B4-Tracking: v=1; b=H4sIABk7QGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyMj3bTMCt3MglLdRKO0VCMLSwMLSzMTJaDqgqJUoBTYpOjY2loA18M
 e/1kAAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

One of the quirks that we introduced to build with !ACPI && COMPILE_TEST
throws the following warning:
drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented

Fix it by replacing the condition

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index a0e9a71580b5..be82bc3e27d0 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -774,7 +774,7 @@ static int ipu_bridge_ivsc_is_ready(void)
 
 		for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
 #else
-		while (true) {
+		while (false) {
 			sensor_adev = NULL;
 #endif
 			if (!ACPI_PTR(sensor_adev->status.enabled))

---
base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
change-id: 20241122-fix-ipu-a2fe28908964

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


