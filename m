Return-Path: <linux-media+bounces-38122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 700E1B0BB2C
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 05:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99DA77ACA82
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 03:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092CF22D7A7;
	Mon, 21 Jul 2025 03:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HjzaQHbw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6B7226D0A;
	Mon, 21 Jul 2025 03:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753066871; cv=none; b=U2v7W7y09DN0rSqSySPb17OeGHOOqHgNyiSeAs8rm1Dr6SUGFZ98+3Oa+ps6oE65h/eWwRD2CtFH1F1BHmQlZG9MXn8Et2tJYfxfIWscAsGPduOCj5fFuq1/EfI+xzzegGygrYtrv71RJTgiEKRAQ+8DBb23xksZE1/qmw7L4Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753066871; c=relaxed/simple;
	bh=Nu/Vl9qRU9o6NkaUwTDQDHbqgwFFh2/bmVg/w5K5M8Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Jm3SM9ZaqH5d+t7DdCXWXHc7c+THg6PsFY8OblORmQSkqyW6rpOu+Y0sfBJRJZhtgQ3PQmnucpjKYa1HF2PW8EDV0YbZoC50Lrny7ef+tvns5FJT7qR7ML6AfsP/kLlJiosN6WLtsM7Ikkf+CWEXKHwV0ebTBc2bmzHixJ9f+ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HjzaQHbw; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso2805725a12.2;
        Sun, 20 Jul 2025 20:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753066869; x=1753671669; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kP6DtfLcjEFW0sJ0juaz2BmJKAUOX7mLl5N7KYvqwqQ=;
        b=HjzaQHbwNKCqk2BZOVDoPO2hh240kZ98xqCbI9Os3c/YIPPrHyfj9DfHAUGNwO08Lz
         dh+kC49U/gPxdmClUcGnLnoOAcWfiD95cdkZDPI561a0KHPmSjyhWKUegXBe0fE5rHPa
         Mcfzl/We2BLIOq7xDi/2A6CIRJtbZXsOp5vBVce5VsB+s1g0wHVasPVNfNCa5IQsT4pg
         Gh67OZsztP6K2zVxItvaT0I7pL3qUloyvxCzNtsjWKRESzclc5hnfhW+L3dhxMPVYpzp
         ODfyFp/S0Xw/r2PkkEp0gYybzpsjxYTUAzB0tyEDGdccG48F2rnR1L+LwIbr8S6PLGnG
         qrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753066869; x=1753671669;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kP6DtfLcjEFW0sJ0juaz2BmJKAUOX7mLl5N7KYvqwqQ=;
        b=gzCMEPJuoTNIBozMuTDsJ4NJIPdrrHJHHTc4nR1kXY/U2uLOL/t3yYo9nAMlQW2Xv8
         PjToWchV07hqLh09qNd5FSOSWEnPrDrHpprSdAYkPifnOn/oG9RV873UqppKtFl6VrgK
         uxkbCCY/+UNZa4HRZNkI5s8RXcrCsHnRsJxBWP+32FbW82gZoiGAcviix1rI9PhifWqw
         glrsxnVQyRSGfAeTjl3zqMnZ8Fgh8oZ6b9sDBiXlyIkj5+1wuFC2Xof3lTWp7egeP9Cj
         0CqIdf4ClZQfTfc5tl6YS63aKHB1GwY5SZpAVzSTtSrL6Dv5YD6eq2xOzQ4nFu3v6RuX
         sAHA==
X-Forwarded-Encrypted: i=1; AJvYcCUjn+1XUwCSgMBfGXgLf3yBPSmFFchvOjIt8vkRt9PIgeO1kfcP3ZFHzFaochcxqS5AnBpvKpKs6XGjcew=@vger.kernel.org, AJvYcCV1DbrvUFXvvrir3g6Mlw1u/CQpjgDFhWdbDrve/T6HcV777uS0QaO49hYbc+iYFlmQhVOU/r5Ij/pNYjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqRokb3hIZRJpIQGB3IwHwQc3E0rhUEi+NNBb7QQ7K/iaYSZDu
	RXxoITEX1D6rZpDiH3wa4xBPwOY9sR32VxSJCBt8rzAd03KQxY1TC12n
X-Gm-Gg: ASbGnctUlrmLPEL6zlm5sto1YKE1P/1/SG301iJsSs3KDaX5BqBG0sWrWUctopHwr5n
	e3vMM/oLzm/oSA77eK5ZSx5M7i2h78h98/jwtSEG/cPio4tQZpPGmntRKQzmsdxUr7DD5ZuKagB
	u243LWpmzpz+31o8tkRNShPemmCyDttMYKRj8DvDEllKjrwe2iAnKLwIvpvYqaeK3Bv9bA/58DM
	oigfNXtrqeqcFq8J+sDPy9KrNiEt8EBhSWf7LeViTvhKXEXGmrbtI9dtC7vhW6C6EfKBgT5WwK8
	ISeBcitfJGc+diMAKCFu73ij6tsjcgl5+UcV3qx7va+cmADtDc9i4G+FrPEdRbqQKXVwaSm2QJ7
	4ziiCV2IRFoUPhhUPMeyonaF+Jly8TAbwqTSVc7A/aoHu4TZCGco=
X-Google-Smtp-Source: AGHT+IHC5YpqSKWRri7rk5fu1QePjYKo2pweAe0uOj0zdiew0TvVAqes/0fbnU7iPkvxpGOm9Hcv+Q==
X-Received: by 2002:a17:903:1590:b0:237:f7f8:7453 with SMTP id d9443c01a7336-23e257915a1mr237719295ad.51.1753066869032;
        Sun, 20 Jul 2025 20:01:09 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6cfdbdsm48264795ad.150.2025.07.20.20.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 20:01:08 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH v3 0/3] Add support for Mayqueen Pixpaper e-ink panel
Date: Mon, 21 Jul 2025 11:00:46 +0800
Message-Id: <20250721-drm-v3-0-e16c3cee7263@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF6tfWgC/1XMQQ6CMBCF4auQWVszM1KKrryHcdG0BZoImNY0G
 tK7W3CDy38y31sguuBdhEu1QHDJRz9PJU6HCsygp94Jb0sDI0tU2AobRtEgk+1QkbQKyuczuM6
 /t5XbvfTg42sOn2000Xr994kEilqilJ3V1rT62o/aP45mHmH1iXeG6p/hYqQlzY5YnRuzNznnL
 wq2KjHKAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753066865; l=4077;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=Nu/Vl9qRU9o6NkaUwTDQDHbqgwFFh2/bmVg/w5K5M8Q=;
 b=OtkVDCc9rbFqK0SardhcA5STp5qHR8/AQ9ijEQVOp2pObcDTf74R3t3k+NU1R68i0Be6yK129
 MprjY4A3A6YBGKm3KNP5rzsODMnJOnFI0s3nnzx2o37X4wLpbDepTY5
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
 drivers/gpu/drm/tiny/pixpaper.c                    | 790 +++++++++++++++++++++
 7 files changed, 1306 insertions(+)
---
base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
change-id: 20250708-drm-6021df0715d7

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>


