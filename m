Return-Path: <linux-media+bounces-34114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 294E3ACEEF7
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 14:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AB033AB97F
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7B3214A9B;
	Thu,  5 Jun 2025 12:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PlyCM7gm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C4220C026
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 12:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749125403; cv=none; b=HHkprR+cIqGVli7sHQryHGo92OwMRCwXVi7yQL+DXn7Q1QQkY0ZVrCgerM1ndXjBG9TEuIf6PtStkpib/c+jdM3jeuLZr7vUOxnPOUncG5RbAzfn8yq5rEkB7DWCZwf+peWxx/pJS76KwhtEVcdi4iTTE4Js9/YYmrdoKHMmO84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749125403; c=relaxed/simple;
	bh=+ivU3gkt4SpCQ5TYqeHrefq/wrJaKo0mk1rh8nQMpBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O/D7kP/+BlzydC1x1ad8sgtfjIcNlLigshgRnrlPDifgizdfk1FrU+uIfDxtEVyWavw/7dyklFjEjkD3aPbyVl+HDYIFRVUrpWCHKg0SuN44FYXIAkcys8spRIdxyWvO4cSzuJaxTkufrPV9XP7ZKOenAIk8ZGymIG4YbS0KCVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PlyCM7gm; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5534edc646dso990704e87.1
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 05:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749125400; x=1749730200; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bJAdfwVVk53py3pC93ZvZIaIc+ZNJlWI4kSjfAqlXMI=;
        b=PlyCM7gmhobhBUYztyy7gzr21ciiyatS42KlKCQYQiyWJseQHnGW44DKhMWj5Z1sUP
         sCKzwymvHYI4cZWEh8nxxObJ4vJRrw+k29p4eDdIKyrRj4vXdKKWfVcfXjHmvtiR7MsO
         p2L07HdmbBpYyUD/e6z7MtWQaTzqGMUz+s2FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749125400; x=1749730200;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJAdfwVVk53py3pC93ZvZIaIc+ZNJlWI4kSjfAqlXMI=;
        b=gJ1hzGINSLJa0mbjOa8QPkwKa7KmCUdvBZxNhiqrxpQEOrwwvWKhp1atn4eDtSIAfC
         SeT+pF6x/KbQhKj0cD9hXq2UvDaPmNws04NnL/wOgRF77R74i932U/d+lIlo+n0oG0gh
         /iFCSaVIDGZvPaZeM6kD2taykxUUjtSqY+93voPxJOdK9s+7IIkOXwkHyNXvC2GnR6mE
         aAaUGV60Z7BIlAeQFZUb+pCJDY3RnpYCyjP+uDQBPZ8CeyiE6HXQKFi9oaTv2Xh09fuo
         qbFRrBTvBRSsLsHMc5EnDDk9z0HKbfIhiw1ZE+Zk6LA/CMEQw8S+Fx7ivuMQBbgiZ/nT
         haDg==
X-Gm-Message-State: AOJu0YyEpnoy9sGPOaPPgEUVxHL+IZdEy4dNNIpajiZWrN12pk3ZD2Zv
	kKcOSFGK3Ybw+QqW6nV6UgHkhunLBt2N6SVXZyp5qHhb2yQaQxEYKBKR0Rbp9Sgm3zzNNqCqNDm
	bDIg=
X-Gm-Gg: ASbGncvCA6VAjP4rpODDoIOejYRxR2jvZcu98gJSjXl6EVNHrGnPSR4HRQPiaGQ8GUH
	zknw1A7UQipsrnKH5J2RTKZmme6YIDiHhoPEQZfMQdtsgDeMxh4SWEz+RHIZPNJXX0ZHtnX15AI
	Y92b/fWqhsJG3zUZnfrR+iAO1oO/Sj026LnvAeganqyuFBubyR4rR1Srgm5KZiGVnkf+w+TccGp
	wOUUx9rq/NzL5zNB6t7Os6AykOZ4XRY0DBoIiK9ME1ULwaL/EqYimctAYgKXMTcPntSRxNULDrL
	St+zGrDn2T6tZFNt2XBccdbhlVtNP0O4PThQ1xtqwRj8DnyEJTQhsUVRGruNCkYKQmfS9aWdpqV
	pqtDGsDqP4cNHwxUSGjW7xQanDM+HwxsoZzUc
X-Google-Smtp-Source: AGHT+IFGLG58OgGD4xH5F5ysTiZd8xDP4C9hzrRF0srfD5zOKm2hKwjOg26ZdPuSxneUmRnXkJYFUA==
X-Received: by 2002:a05:6512:3d10:b0:54f:c6b0:4b67 with SMTP id 2adb3069b0e04-55356ae5707mr1953218e87.4.1749125399700;
        Thu, 05 Jun 2025 05:09:59 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378a1273sm2590085e87.85.2025.06.05.05.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 05:09:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 12:09:57 +0000
Subject: [PATCH v4l-utils] CONTRIBUTE: Add simple contribution instructions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-prefix-v1-1-450aff98308a@chromium.org>
X-B4-Tracking: v=1; b=H4sIABSJQWgC/yWMQQqAIBAAvxJ7TtDQhL4SHbbcakEstCSI/p7Uc
 YZhbkgUmRJ01Q2RMifeQgFVVzCtGBYS7ApDIxsjW2nEHmnmS6BCbd3oEK2BEv/6G/WQtRfnwT7
 B8Dwvog2wlGMAAAA=
X-Change-ID: 20250605-prefix-a1a47dbdaa75
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

In the media summit we discussed the need of a special prefix for
v4l-utils. This helps patchwork and media-ci.

Create a new file with a brief introductions on how to contribute and
make the `v4l-utils` official.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 CONTRIBUTE.md | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/CONTRIBUTE.md b/CONTRIBUTE.md
new file mode 100644
index 0000000000000000000000000000000000000000..19a2c5814b45462f3cfeea921e277f8da00ccbd1
--- /dev/null
+++ b/CONTRIBUTE.md
@@ -0,0 +1,19 @@
+## Repository
+
+v4l-utils official repository is hosted at https://git.linuxtv.org/v4l-utils.git
+
+## Contributions
+
+Patches are welcome! Please send your patches to `linux-media@vger.kernel.org`
+using the prefix `[PATCH v4l-utils]`.
+
+## b4 config
+
+If you use b4[1] for your contributor workflow you can use these options:
+
+```
+git config set b4.send-series-cc linux-media@vger.kernel.org
+git config set b4.send-prefixes v4l-utils
+```
+
+[1] https://b4.docs.kernel.org/en/latest/contributor/overview.html

---
base-commit: 0d4e8e2d4e2d9d87863222e03fd3a6a4a3ff3d86
change-id: 20250605-prefix-a1a47dbdaa75

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


