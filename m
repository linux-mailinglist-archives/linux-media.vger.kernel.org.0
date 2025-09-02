Return-Path: <linux-media+bounces-41511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC32B3F5F0
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 08:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77214485CFE
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 06:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579572E54CC;
	Tue,  2 Sep 2025 06:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVKx7zWv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B7F2DEA94;
	Tue,  2 Sep 2025 06:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756796006; cv=none; b=FwPzr+v6avpBqSbufDzZ8ndGZ8LJiLLGzK1Ijq72S+8A8fQCU+fzilIuIbUKfXZkT7dFtxS9UQw3LIj5ySVzGiegGHQWk/ZunyGKvWxzuyjs63+28jqLDNlPT0Y/j6TpB/8KhF/gb7GMCXda5Q4kp74CgVb38Hii1ZmMYMCrpLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756796006; c=relaxed/simple;
	bh=cVrq8S7OsCD2q4s3MgrJ/bVufPCakQkhjJvo1bN8dMY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mtnNzy7Qoe/nHOXBqHa+AXE/CAuFkoyPetyNrvT/rx2oOr4yybbrzG3Cjds+aYeosZKf/EcnMWukZXqtDIe7O5fFOymIa76hzJSPLfWyoiiB0YLng3Mrc3Iyx2F4AzKoqCu7eCj8lUqbA4U7aUmnMT5F9PRaks5XTgWqG5n1qds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVKx7zWv; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso4421572b3a.1;
        Mon, 01 Sep 2025 23:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756796004; x=1757400804; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n8L3h0fY9m0/QQwH+0igEz7ROkcJh1IoEWIXBgUPEvg=;
        b=fVKx7zWvaFnndJX5aezr1tMFBKgHY3rdN8WshNb9KAmqKSVkN8ewmaKvQlEqrx2s/I
         pzSqc2+WX8ODPWSxQ6BD2mXIREOpK2x2X5rvU0q3Esxb6634unk/PwF3VauGUbThqO2B
         3x9JpKzrtuXVnt6prKG3wnvBvksGzuwmCIf03Uam2kz47Vxv08nf0e6XZX0BXdhkGZZ7
         czi6WaUg77oXkSS+DOXRPeX8Y0f2qdres9UH8YwDkdXKs/8yjiR4ujNrA0wdqa5s6wft
         qIfayssQl+jYw6JZYdVHL47C+hpR6PvQ7IbVr8fPxfY1FfAuoPPTPHMPuNh5cnvtPz3j
         hmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756796004; x=1757400804;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8L3h0fY9m0/QQwH+0igEz7ROkcJh1IoEWIXBgUPEvg=;
        b=NLlgGwTv92QqubHhlUmi4SZi4yLgFV2HgFmzkWLRKoP5SmzqbVemeVxOlCgqGKXyoj
         qXjhElfGseU30mhQreUBBZlQm7q+96fX/6R5mMhv0qbbc8NU+JeIgXY23F2G1rXv496p
         dv816PX39dDoSUfrO6zLl/Ap7U2Y/gFPFZ5gr8SY/HkXn3QyCiwMoVJAxOyC82AwlZJp
         nWGxqawsB8naC5bf5eW0Qbl2IxcjC3Y4zRgYeKpBa/KzW5UYS/R9+Imfi/oMbUe3SiZ6
         oRsWGIn53PhhdJ74t3EEhjmHypYgwV49L+zk3zRhDM9mrGw/RsCaeRLCxh33EEVaKFfw
         xarw==
X-Forwarded-Encrypted: i=1; AJvYcCVPf5KFoseKmQODj9i5KuhFcmF+SEjFjc8ZfGMQir7AliETkUR01HUwB7IWNvDkCA5vnLjcUOROPL40K+Y=@vger.kernel.org, AJvYcCXvyKeOYJ/wmMv4f8Nk4MFcVnPoUtriI0rwXTvTPn2PjY7VOct/Hlu5sqEE8drtHem8zfDAvSrpKShcOss=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDMV//s41JZguE6mELrrISz2ABCpO7/8q3dvYAYp7TFk4ShVW0
	JQ014T0/oTOzBcEOBK4yB4mDDTX/+bFXFL8xLI3oPENGELXmedQ6WIPu
X-Gm-Gg: ASbGncvgxxGsm3CElk6YrYQ/o0G7mYb1LRB7X3vElsj2oRmzbsGIYfpUsYFEdzp5TLi
	/z/jnY9SadlMnnHeh8COkNDexO/0Ft+0IvobkX7nXJ/PZzXTD6W4xLIHjxgs2q71KSJfdmXk/wc
	RuS45FxhvkyKg9tCjlLxleA7+cBFGAjshgFexJDZHQ606Mbeen3cm0vr12s0MZ+54cCqVswo0qz
	RY/xbxpdNS1K0y2ilaJWH3CFsbFuCaFhj2rtUK2tA/ww1ek2TUbVSztsx1tR+CjcY91y/rPX4ku
	Rn1j96Zd4PvMn1swGFtBSruwF2SwOfAt5yptrHJEZIeIx3AR9sVgmcT7/xJGpA0ZN1f8bHzcCVz
	MnjBcy9btISh/Cb08K2WFISU9yA9aPTVohNRv9Bxq3VnP1csR8zM=
X-Google-Smtp-Source: AGHT+IHvBM1zgMPL/lGGPLbmfWf+OkqvgeYJS8nXhpxD8ghD9Yl03F3VqPgBKx2Mt6pprTqIftO/yw==
X-Received: by 2002:a05:6a20:3944:b0:243:b411:ae41 with SMTP id adf61e73a8af0-243d6f09c1fmr15720875637.32.1756796004244;
        Mon, 01 Sep 2025 23:53:24 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327e8d3d635sm12312558a91.1.2025.09.01.23.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 23:53:23 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH v5 0/3] Add support for Mayqueen Pixpaper e-ink panel
Date: Tue, 02 Sep 2025 14:53:17 +0800
Message-Id: <20250902-drm-v5-0-d77c678c4ae3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF2UtmgC/13MwQ6CMAzG8VcxOzvTlpWBJ9/DeFi2oktEzDBEY
 3h3JxxEjv+mv++teklRerXfvFWSIfaxu+Xg7Ub5i7udRceQWxEQg4VKh9TqEghDAxY5WJU/70m
 a+JxWjqfcl9g/uvSaRgf8Xv/9gBq0YWBuggu+codz6+J157tWff1AC4NmNpQNB3QkSLYu/doUC
 0M4myIbwdIXXsRSWayN+ZkKeDYmm9qIEw/IdRWWZhzHDy/DS0EyAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756796000; l=4874;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=cVrq8S7OsCD2q4s3MgrJ/bVufPCakQkhjJvo1bN8dMY=;
 b=RbM62ThyOvXOey7QFVEMVqQncbF77hNDrjoGJHiazNUD3ypzrOpqZh1MLf9N27j6BxaBZzPo7
 6J37hEO5kTAAVlDuvFeHYVZbUhEjmcUxjd6ed7falQaolcnmB/iQ0EK
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
Changes in v5:
- Integrated pixpaper-regs.h into pixpaper.c
- Added "L: dri-devel@lists.freedesktop.org" in MAINTAINERS
- Renamed helper to pixpaper_wait_for_panel()
- Fixed endianness with __le32 + le32_to_cpu()
- Replaced drm_err() with drm_err_once()
- Simplified connector get_modes() via drm_connector_helper_get_modes_fixed()
- Dropped manual drm_mode_validate_size() check
- Moved resolution validation to CRTC mode_valid()

- Link to v4: https://lore.kernel.org/r/20250805-drm-v4-0-94eaec01598d@gmail.com

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

 .../bindings/display/mayqueen,pixpaper.yaml        |   63 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 MAINTAINERS                                        |    7 +
 drivers/gpu/drm/tiny/Kconfig                       |   15 +
 drivers/gpu/drm/tiny/Makefile                      |    1 +
 drivers/gpu/drm/tiny/pixpaper.c                    | 1171 ++++++++++++++++++++
 6 files changed, 1259 insertions(+)
---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250708-drm-6021df0715d7

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>


