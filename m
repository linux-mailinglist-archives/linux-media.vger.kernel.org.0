Return-Path: <linux-media+bounces-37582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2B0B034B3
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 05:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBBF91769DE
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 03:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E882E3709;
	Mon, 14 Jul 2025 03:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRFz8D8H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3242E3706;
	Mon, 14 Jul 2025 03:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752462006; cv=none; b=NEtPWF3++1P4Y7ei3ScjseTE0CP54TLmMRJ7ua+O5Sxe7qkQ5hQblmonZ3+AXSo9ctuFQj8caF8d8tCqjQBQelUOsHl9EevFEp+okbvLsoF42JMTkcZgqKLgeAYauNATra7pLMzWbQOetS3HS1043U0ieMdrK0/q5N8ERePG1Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752462006; c=relaxed/simple;
	bh=LZFxIGcaYkZxoWI8vAMHadDEgvq9NNtsNON8+he1Adc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ITG9zxup77xpDvP35OXKPdxF31ylGoELJHv2a91aG+ptOe0sUBjIfCGJI1e7mbHnDwF6LCwq+08mqUVaIFLRZRitlzlex0/Ty2YEV5mVzs1eexTqDuuZ7HQuiau5C5SSzunLs5K8RjJdodNMVeS/GzU0GiIO5oKz5QB+oyqI9gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRFz8D8H; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so3029580b3a.1;
        Sun, 13 Jul 2025 20:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752462004; x=1753066804; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6pstB75S20K2ggi+/G/IyUWheZt8LKcxEwRUgTMXz8=;
        b=DRFz8D8HpW+3dGpd50eamUUu0Tek/mAqe4me2hPfVT4pen+dxhn8r3hVuga+/9XlHZ
         Oho1ySDjRjEiA6jqoUje1JXdee5S56BZeczJEYDt90lxK0ueGkm1RmagPf+aKSy3bP+N
         tUjgFdm2XjCa74DlwRC/SmmKWtoXX6o3lMMpsxvudkzBmMQ5+Q0fp/Z0HjiNel90naGy
         ceqjYN3kOvwy1uv7eH1aA/dZTffmkHijaDLJlseMIEPLGlQ0LTA3bjqKK6+x50jV/TEM
         w0qXt3UJw5yTFp8KbhlAnz/og2U2UsxvSUWm7ivYtb2ii5OJZP80ZYd5M/4SuGuAAvra
         /uSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752462004; x=1753066804;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6pstB75S20K2ggi+/G/IyUWheZt8LKcxEwRUgTMXz8=;
        b=s0TIHuggU+IyqkcLLeWph5oEUbKEk7VnfNLJkxBvJLotecS2x5xenzqzA3zYFzXV+R
         42VWdvdfCUeAX8vqdOoQ2/giajn9VbVm5z81MhKW91Jfpd7YmHwnwNL/WgXj6XGwjzqN
         4juIoqiRsm+66C2I/0Twl9+hjiRg3N7aoIHOL1laLOxrqAfIauAwi+osa1GgcYrjXnfy
         PMmFQnNE+7BW3M4K0eKEuIQbqYsGj+NZ8994w8wgAKvHEu346cBqo8GjAqxUVWKAe3uH
         7Tnm33mSu3GABpP3Rl8uGN/RJy+CvgogpUt4+GLc4HXu6PpLJCUWy0QekUdhIaXi2yyO
         +how==
X-Forwarded-Encrypted: i=1; AJvYcCVY8YM2cdUSPAvLARvSJUL7+GfK5zY+pEkEF7Dnv+IL2dMH8Tc8hCaSuLkKFaPCHdaZQu/rYmvhPi+qbsw=@vger.kernel.org, AJvYcCXAj1wyRu1+H7b8mUVBun4S26g1Z4PRW7N7tRXYG7+QX4u+hHlJ74R6kCxHHRuqVpFzcPIG2L4rX5tHgJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMA3DNEMz95GKawhGZ0Gpn38l99bcLLr/PjB/mbfitVzTymboa
	qKnp0+xyHbQj+xm9BPPZUiYHImnDQfAtDOyou+aXI/nNoawxPbewKWVB
X-Gm-Gg: ASbGncueN2WprgEnvf86O6PfLIQd94Tbb+WHyf80Zp3MmSipSjv1NCSXVG8BDGSzfQs
	2cYv/CtIl9Wrc93ku4g3C0Ta7IAQh86SX257pgHLAWl25IGilCNFJTM+5eUmZNXGragSPtu4EU3
	7xBmMg8L/nwdqqWQh9NWeoGsP/XBsbCpBL6cQeQpK2DqhpmAc8B6+lQ3AzYreNM5PPfcP7dQHqW
	5UDMQq7YQk8mmjyZYj4OlPFo9E8Tmuf9fau/yRxKt8+KHH8pNs/TJLEaGRe4n2NvnI6ekGsDelR
	oFR4psBuITljUVCwHimAboSfyHIAu8m7NZU32tnRHXRWhy6HS/4y/npnOTgvJkvRXYPHuBEsNSo
	tFciLG0mbhxiWKXRh5eKphzOTQfcLPzcTQxvA/0oPzdMz8I9Udk0=
X-Google-Smtp-Source: AGHT+IFgq0CJoameSLgVhDrFKZgmjgscNozjW68vpXSBJzGFC5r8RB4R1SvSETsoFDPJWdr6HbwT7w==
X-Received: by 2002:a05:6a00:b90:b0:746:25d1:b712 with SMTP id d2e1a72fcca58-74ed0f37dbbmr15568022b3a.7.1752462003454;
        Sun, 13 Jul 2025 20:00:03 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4af33sm9034577b3a.122.2025.07.13.20.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 20:00:02 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH v2 0/3] Add support for Mayqueen Pixpaper e-ink panel
Date: Mon, 14 Jul 2025 10:59:38 +0800
Message-Id: <20250714-drm-v2-0-5d1a2e12796c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJpydGgC/1WMQQ7CIBBFr9LMWsxARBpX3sN0QRhoJ5FioCGah
 ruL3bl8P/+9HYrP7Avchh2yr1w4rR3UaQC32HX2gqkzKFQaDY6CchRXVJICGqnJQH++sg/8Piq
 PqfPCZUv5c0Sr/K3/fpUCxUWj1oEsudHe52j5eXYpwtRa+wKED8UslgAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752462000; l=2106;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=LZFxIGcaYkZxoWI8vAMHadDEgvq9NNtsNON8+he1Adc=;
 b=AzcZ8ioBOR/11C1FrgwE4k8EJtaaO5keijkJ/PnwnqqSPRedLhDtKBYmTk9UYQWNx97c53s8l
 /znIl5IF3FyDp0E9Dx8MAo39n3kDa4P4zg0Vb1fNS3AexJJmCduCUbQ
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

---
Changes in v2:
- Reordered patches so that DT bindings come before the driver (suggested by Rob Herring)
- Fixed sparse warning: removed duplicate `.reset` initializer in `pixpaper_plane_funcs`
- Fixed checkpatch issues reported by Media CI:
  - Removed unnecessary blank line before closing brace
  - Moved opening parentheses up to function call lines (e.g., `DRM_WARN(...)`)
  - Fixed alignment of conditionals
  - Fixed `dev_warn(` and `drm_universal_plane_init(` formatting
- Thanks to Rob Herring for ack on vendor-prefix patch
- Link to v1: https://lore.kernel.org/r/20250708-drm-v1-0-45055fdadc8a@gmail.com

Thanks for the feedback!

Best regards,
LiangCheng Wang
<zaq14760@gmail.com>

---
LiangCheng Wang (2):
      dt-bindings: display: Add Mayqueen Pixpaper e-ink panel
      drm: tiny: Add support for Mayqueen Pixpaper e-ink panel

Wig Cheng (1):
      dt-bindings: vendor-prefixes: Add Mayqueen name

 .../bindings/display/mayqueen,pixpaper.yaml        |  63 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/tiny/Kconfig                       |  15 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/pixpaper.c                    | 777 +++++++++++++++++++++
 6 files changed, 864 insertions(+)
---
base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
change-id: 20250708-drm-6021df0715d7

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>


