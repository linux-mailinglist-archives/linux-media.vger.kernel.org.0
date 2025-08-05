Return-Path: <linux-media+bounces-38885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42565B1AD96
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 07:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 614AB1641C3
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 05:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF6C2144D2;
	Tue,  5 Aug 2025 05:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aweqrtRO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329D3175A5;
	Tue,  5 Aug 2025 05:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754372412; cv=none; b=GUOU0UMQ0ZUmelFM43PwLtOJApeBIzyR20I+oHzVEiOidHWIBeUr/7F9XoQXIIRs+Hmuag5LRUyzXnZiamFGcoJW3wAzAUOgyTAtWBaLr8X5IKmTcMD8rAtKkeKSFdUyIqdnWPapD1JPSk6yedhJ+vraib3iu66oWvEtGoYaBIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754372412; c=relaxed/simple;
	bh=N/pmzhrhBR41PCutlnpr0nlE6nslcrMo+1tEG23f7Dk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DbqBhdcVOawPIRf8QqyVOAGol6ykiDkVuz5GfQKDlvE9ez+Trc08aNpkZi1Z5/QLlUeGnpoEGJuljsJyX4jd/PY3cw9ktfByv1RXERodpS77+z+hyGqcXtxEJCfRe1kFrhUwLDyT7zk39UCFk/qio1muoOVmYujUin2PkBLVzO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aweqrtRO; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76bc5e68d96so4188256b3a.3;
        Mon, 04 Aug 2025 22:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754372410; x=1754977210; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LeEJhrhnwUrTVBP5B/ItjxYOvOdUNX9WUsE+fmf4AKc=;
        b=aweqrtRONwjeUoe1AkDvDjjoyg2i3DX8P74uLl0TgOD1WFqhIF+xrFC9C+FbZ2/BwD
         xJIBXdQS7RHWj+UI3CgtUBq4YZXh2ubCXm8/JGXFkMc7wuODnfjR+rMT9AHjvodazW1A
         IIuHXo0I2EYkt7DTerkTt7yCrbpucdnqXcRQ/f16x2a9OwxhinozZA4/+74iXgNQPkek
         nfuqpRSq4XHSDVzryckrY8GiqTlB0OZg8MKBNlLhuiG9zBKzhmxzyF2NgZdUmPMUmMs7
         scoXw7yIoVTFNGaTZE2D1LDdwtKjuDd8skicL0UJKD5InGODrQD17W5OKGF2xkuHzGMi
         +OEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754372410; x=1754977210;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LeEJhrhnwUrTVBP5B/ItjxYOvOdUNX9WUsE+fmf4AKc=;
        b=fv0j+HVefNjFu2bA3YRyy88CwpEPlCRR8mmCO2xYKRvvwVOv5FSvtY/L37GJJXj5XQ
         Fw1VHOZuD5o8DbTralyS9/Qh7xk9G25SWoi0QJUVAMNYwusD16mLsxcS0fzF/DUMifPe
         91deCpbHszHvreXn+WVp2DQD58TkGlNB4uKOpGwjGGlMCTrxIvr6u39jBIiMtlgbyrMg
         3Sx8NVKuuk7IhApYmZtb05LX0LGAtVBJeJxgB8KnAI73hCOFuHtYkhANy8D4+kkphHPx
         +zFp0Awzn1WLBuc6LYYbMYX3Zlak+DdFx7yDYTR8AQfn4h7cFSgexDOIV7/znJ+z+y4a
         Y+Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUswvs04XeU6r9n3V1SvR7SOB37IkK80Edahb65v4VZbX33I4/4ik12p4GU+9ZZ2qoe8Ex/0/TxHXWRMBw=@vger.kernel.org, AJvYcCXooV13dfG9Td98WBQ5T1yxaJJ7mnS2iQtPidfJbFl1GnbusjsHpJ4vCeJI2vgjQTXOzSkyJQUbke0UTyU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8lkkqw8f4vV2LbFy58jMdXvr2HH7iW76R7nguY1N5DCXF/t91
	VGNRWgSUT/q0hKW2lt0IesgvUDNz59eviH9/lUARkDYT56TVkz4rOazW
X-Gm-Gg: ASbGnctRzy+o9797QQaQpFU7FVAOreVKcxOIBMDWfJjtcyqt9T9o4kQMBjejA3y3Qem
	D5lpp9JoOAJGKRuI4ExVgriksi47bcO5mWoPWKHGH5gZMmEnjZgFy9J2wzaWVI7/9oxAqM9m0M4
	mvy7xurTLLK+c6of5yGUkQdbOtAfyCugRj7rdS0phOYLM4Oh315yRmiXr/PCFhjDITFc2TPQsA7
	0NCh8sAjpGyXVAPY6ma5X6+43meicpNrMCbM2crzs8oshLDPjgWKEjEDkj6IUlNITTb15u9g+ST
	7PxzHOI0ceIibTW6gPohUpR5op4cjAcwtMt1IQAY0nnE8D/BTdvzrxiWL+3VnnFch6M2Ume/USt
	MPvI3E8szK8LySacphfsFEtP4VWahPaMSM+EAHuvyvfYwNV0ISqw=
X-Google-Smtp-Source: AGHT+IHYPgdA0GQ9owG/1e3TrYAgjSvBMzlvWf2Zgn2fzmwlOXUmTfEe6wtES4ekW7qNSW7tVKHLZA==
X-Received: by 2002:a05:6a00:3d0f:b0:732:2484:e0ce with SMTP id d2e1a72fcca58-76bec4c537amr14636092b3a.17.1754372410238;
        Mon, 04 Aug 2025 22:40:10 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce89125sm11990006b3a.33.2025.08.04.22.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 22:40:09 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH v4 0/3] Add support for Mayqueen Pixpaper e-ink panel
Date: Tue, 05 Aug 2025 13:40:04 +0800
Message-Id: <20250805-drm-v4-0-94eaec01598d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADSZkWgC/13MQQ7CIBCF4as0rMUwQ4HqynsYFwSmLYm1BgzRN
 L27tN1Ul/9kvjexRDFQYudqYpFySGF8lKgPFXO9fXTEgy/NUKASRjTcx4FrgeBbYUB5w8rnM1I
 b3uvK9Va6D+k1xs86mmG5/voMXPBaCaVab71r7KUbbLgf3TiwxWfcGag3g8UoDxYJ0Jy0+zdyZ
 xA2I4sh0E46IoNa7s08z18s8fyW/gAAAA==
X-Change-ID: 20250708-drm-6021df0715d7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>, LiangCheng Wang <zaq14760@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754372406; l=4414;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=N/pmzhrhBR41PCutlnpr0nlE6nslcrMo+1tEG23f7Dk=;
 b=EMUuPFvBDlpo2snWJLgaqTIGP2JwNUP2YFITzZ6fglmGFr1BO2fYzTpxF/x97kZG0flZeEY1a
 v4hEgG+FZL8DgUZIxoMD8hoYl5Bridtc8anmzusrv71pKs6eQD0z9z+
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
Changes in v4:
- Applied BIT() macro for all register bit definitions (per checkpatch)
- Fixed alignment and indentation based on checkpatch suggestions
- Removed unnecessary blank lines after braces
- Fixed universal plane init() call indentation
- Link to v3: https://lore.kernel.org/r/20250721-drm-v3-0-e16c3cee7263@gmail.com

Changes in v3:
- MAINTAINERS
    - Added pixpaper-regs.h

- Kconfig
    - Rename config symbol to DRM_PIXPAPER (drop TINYDRM_ prefix).
    - Reordered Kconfig select lines alphabetically.

- Code structure & style
    - Fix include order: move <linux/> headers above <drm/> headers.
    - Removed forward declarations; placed static functions next to usage
    - Switched logging to drm_err()/drm_warn()/drm_dbg() (legacy DRM_ERROR/WARN removed)
    - Remove dev_info() statements.
    - Switched encoder type to DRM_MODE_ENCODER_NONE
    - Moved pixpaper_panel_hw_init() from atomic_enable() to probe() to avoid redundant hardware init.
    - Use helper to_pixpaper_panel() instead of container_of() on crtc.

- Robustness
    - Added timeout + warning in pixpaper_wait_busy() to ensure robustness if BUSY line gets stuck.
    - Introduced struct pixpaper_error_ctx to propagate SPI/GPIO errors

- Clean‑ups
    - Removed drm_plane_enable_fb_damage_clips() (full‑frame updates)
    - Removed noisy info prints; kept drm_dbg() only where helpful
    - Consolidated all magic register values/commands into new
      pixpaper-regs.h with datasheet‑aligned naming

- Memory helpers
    - Driver now uses GEM SHMEM helpers; GEM DMA helpers dropped
      (panel has no bus‑mastering DMA)

- Functionality fixes
    - Rewrote pack_pixels_to_byte() to correctly handle 4-color (B/W/R/Y) layout
      based on expected panel color encoding

- DRM callback safety
    - Add missing drm_dev_enter()/drm_dev_exit() in callbacks.

- Tags added
    - Reviewed-by: Rob Herring <robh@kernel.org> (from v1)
    - Acked-by: Rob Herring <robh@kernel.org> (from v1)
    - Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (from v2)

- Link to v2: https://lore.kernel.org/r/20250714-drm-v2-0-5d1a2e12796c@gmail.com

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

Thanks to all reviewers for feedback across earlier versions.

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
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/tiny/Kconfig                       |  15 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/pixpaper-regs.h               | 428 +++++++++++
 drivers/gpu/drm/tiny/pixpaper.c                    | 789 +++++++++++++++++++++
 7 files changed, 1305 insertions(+)
---
base-commit: 7e161a991ea71e6ec526abc8f40c6852ebe3d946
change-id: 20250708-drm-6021df0715d7

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>


