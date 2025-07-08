Return-Path: <linux-media+bounces-37077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D4DAFC7E2
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 12:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 004ED5647EA
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF7F267B89;
	Tue,  8 Jul 2025 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJyWLTfx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281BB22ACF3;
	Tue,  8 Jul 2025 10:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751969211; cv=none; b=CJ+YvY76LV/1KwoB5v/HRuv+pXMyRn+nTUo40XAvEAYpTQirGCg+9UUs/hP8/Sl4nkOWH8l0miR2gBMN+pO+AiiliRoCpaDNU3PfH3aeWL46D49VJceSdDzPrQMp6D4EAKafeFtx3CgBLaNVap+5tWFGsRwdUo82j9v9z3Xw9S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751969211; c=relaxed/simple;
	bh=DJs59o4WehjmGxNS4SUdfWEn70hAjnKKeH5GnQIdDbU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HcUHM/UflMZl1ByXVSz6X2QPD2WjNrHQmE3EIlu8IFlC2PMm3+eN0g2FPyRbX83FoJK5t4kopffO5xQmB4KkC4t0Z3V8XqaKa5mAP++J5LNnrS5JHP8AeakbIF8JpUFUsSO83D6Aw1mC1i7IDD2dW2c5aHA34U+IP+1VXSb6g14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJyWLTfx; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7490acf57b9so2823363b3a.2;
        Tue, 08 Jul 2025 03:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751969209; x=1752574009; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xtGT7Kvk1kcayZ2sMv2QOI6IWederxGXIfdOJOm/QhM=;
        b=bJyWLTfxjL+mZybH016DTw4dro/FiMKvGcQLMwy0ntiaxb4yWL/RCzRxSj+OBva6TH
         Ygul+k+e42UhT1nx242XLhAldU0QKDuIikMCdFK/hos24/4pVOddmf28FA4C4ueYD9yS
         ufWWfV34BOibFkoMlK3x4c9r+HuBw1IQhROANBDDpJKKHf/Oadob9M34GPqcMQ+gHBCY
         +kgRGIgHYxdoOTIf91QV/A5bo9rIFxNFhp3QCn+whFLXXD+hU3Aw8y7bQQhNB1bNz+Th
         ArTjz4jayN8KrVoVElxH4hb0EL1423IST/8nAjaLu7pjOd8F8dX4MemoId09knANTrmN
         H1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969209; x=1752574009;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtGT7Kvk1kcayZ2sMv2QOI6IWederxGXIfdOJOm/QhM=;
        b=Ouin41NF7EtwFZRIus1lUWP73WSETQeJCy/rXzu/ATk8GVYHmqnD0T5LK6QHCn0Of1
         wAgZSfeR8cRq/uz7+M6jpwWrp0yZxwOV3G/NjOblsJAiWS4VQwTb/cpXqI25EzP42Lni
         edQKqKenE0IlB1DJTLPao9BzZ2bKCNXXbfRDBBv4oJ0BTyL9A9i7vfeZlwvTmHGTtw7Y
         XK6z43hT0+03ZiZB1gAxQJ3VJeGojE7qkytdD4JrZIvRhnsBzFkUYojQdTJJNRveDJCK
         E2a2umCYKvGFaByXkFhwtt8ZafWuYpo9n4FvtT8rmcs+SWp2zXudJUzZl5fNNMsZ0xgG
         EylQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRo4nFZnukKVnXA53ZU2ZtbUASTpxl3Pu/l/UthWENKKWzsHiENTn/pqBjEYj/oMvOVbLLdYTA9VgLRAM=@vger.kernel.org, AJvYcCXzp0taV5T/9w831zATQGUvm6NYAvY8xOESxP9Cchx/yJnlcqZxUGlVqEHvIIqYVRr6Iszi6KvKlLmbJkA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Xy1Di6k93pfJZsIZpMfccfgxnDMH0tE/t2cKMvzADEjkuW4u
	IypTVp4fA7impl6KbaAV2cPDZZdiMQkeJ+TVYMxSssUCzvCbcADLnI+q
X-Gm-Gg: ASbGncs23u0L3pcU4TDAB5gjtfEveqAogHZuVHATeqpajvzBqzqpEF1PVI4U4Nq6yj3
	h5cIoBtenKkJVHPA4RnMJH1IumN7aB79iTX3j5Z0fi9zSceX1kUUx7hmNxV5AC75V8WUfssPZfY
	SLKJeLHpsrm+ZQE+iHdzF36wlncFDJv3SAan8fERI0OZxSepi+E/c5n8ln5alPw0WhrG/fOc+El
	w312CSXQyXInVm3cQwV0n/KuFnkGnZ4uUgdWi0eDApKOqwxRAY0HrLnKfmTBcHue3F0GcEf9Yq0
	cYv8GYAlWiTm93r9c9CFr6NbVfF68clhaRq8ULL85x6lx9zPFR1jVksFAPl/CkeX6DUQk1IzZlZ
	GJk4udPsKBTI0QTlKe02qs9SjqA==
X-Google-Smtp-Source: AGHT+IFRU9SPSrsf/41KjrBcwlW/zEtRYuveA0rctF6AoroRJA4BdYDJj+EpRvTzswKq41+iFOjpHw==
X-Received: by 2002:a05:6a00:2794:b0:748:68dd:ecc8 with SMTP id d2e1a72fcca58-74ce65fdd7cmr20633885b3a.22.1751969209291;
        Tue, 08 Jul 2025 03:06:49 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce359ecd6sm11971174b3a.24.2025.07.08.03.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:06:48 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH 0/3] Add support for Mayqueen Pixpaper e-ink panel
Date: Tue, 08 Jul 2025 18:06:43 +0800
Message-Id: <20250708-drm-v1-0-45055fdadc8a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALPtbGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwML3ZSiXF0zAyPDlDQDc0PTFHMloMqCotS0zAqwKdGxtbUAx0P6GFU
 AAAA=
X-Change-ID: 20250708-drm-6021df0715d7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751969205; l=1527;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=DJs59o4WehjmGxNS4SUdfWEn70hAjnKKeH5GnQIdDbU=;
 b=Cddh6f7PYm3rLh7hGUFh8fC8fYCmyZAGFkavUUPQkPthhX6pajTOcq9wShhDXhev1VSDI76LZ
 tLwkgNYMeAFA6tUsfB8XUgLmxsQn3B2llKzwxsA7f5xXXlqR0ySokmD
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

This patch series adds support for the Mayqueen Pixpaper e-ink display panel,
controlled via SPI.

The series includes:
- A new vendor-prefix entry for "mayqueen"
- Device tree binding documentation for the Pixpaper panel
- A DRM tiny driver implementation for the Pixpaper panel
- A MAINTAINERS entry for the Pixpaper DRM driver and binding

The panel supports 122x250 resolution with XRGB8888 format and uses SPI,
along with GPIO lines for reset, busy, and data/command control.

The driver has been tested on:
- Raspberry Pi 2 Model B
with Linux kernel 6.16.

Feedback is welcome.

Best regards,  
LiangCheng Wang  
<zaq14760@gmail.com>

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
LiangCheng Wang (2):
      drm: tiny: Add support for Mayqueen Pixpaper e-ink panel
      dt-bindings: display: Add Mayqueen Pixpaper e-ink panel

Wig Cheng (1):
      dt-bindings: vendor-prefixes: Add Mayqueen name

 .../bindings/display/mayqueen,pixpaper.yaml        |  63 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/tiny/Kconfig                       |  15 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/pixpaper.c                    | 784 +++++++++++++++++++++
 6 files changed, 871 insertions(+)
---
base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
change-id: 20250708-drm-6021df0715d7

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>


