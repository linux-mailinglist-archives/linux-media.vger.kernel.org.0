Return-Path: <linux-media+bounces-34187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CBFACFC9A
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 08:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F27B18913AB
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 06:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E43250C19;
	Fri,  6 Jun 2025 06:29:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9DF1E5B6D;
	Fri,  6 Jun 2025 06:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749191341; cv=none; b=CxRR4fYZKxM3UpL3hiUeHGN8ON3tGhK2scYimoglpWcsnzx/98Nc4ZjrXccIeiVJGtWMJIk3KZTBTkDHBhkGX2mi5kH5G5nVrcfAy6W5gw0A9szIQ8Is/LnOii0cSanjbuvQ8yMmlzTuaUIpr7wckqbDt3/ulKrAkjBApCN5ZhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749191341; c=relaxed/simple;
	bh=3xAbZPGH9ibkSw2OQPvd5qNkxMgmKjzCh7ZIwvdJLro=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YW8z5hMcAHBoiN3HowqKXAYWa+hh04o+rsWawGT/rLgDHM0Xj0ByyT4cmcgtpkx14lKWe3dX1p32yb18yZN9Dkk4BrzVJlJjEC1QedDdWne1YeymEBeHwTsYxfAmhNS4Q9sF4CD/qzPReXzcltxlePIr7rxdTjThPMdbgiZwG4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so2914824a12.2;
        Thu, 05 Jun 2025 23:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191336; x=1749796136;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Azp50qUoKvhWib2z96ivM3bk0Xe8grvpHixajVtU5v4=;
        b=hfaZPKIbpNa1ScHnD4Dz9dnacVYanITzFerXx9xtr9dp4dnQPG1czculK5rjB9Rqdw
         5XgseD+Q7SSxA+3HqpGgqnCDXBix9pChnKdpYcEEQrvxdAnXe2K3oCTozR97kkMKCE+y
         RHtmWdRH2rt32Go3twZgpBKEJ6/cVH9tIVbL5EF9NfIn9aC1mHVuG3VpUFmGm3kqhnEb
         PIIMJ1XTgRMpqAzA9ZkjrDSN68q8DfzZ/W6YOs6Fxph4O7nfDCJdOf0hZX9hahso7OGl
         vQ16QHnaSUFwsgCODH4BK9Y4k5rzixoCiFWAvLbYB81X4bxh3zsHyoEB3P3njINyEbrQ
         jpnA==
X-Forwarded-Encrypted: i=1; AJvYcCUEoMv7YFNCYuxE3gS2p9MUfYGEaJPibBWA8MI+Rtfao74nM7H75TSo5Db/I7nrLSf/OzYf+vK9D3c=@vger.kernel.org, AJvYcCW32XIyW1fxMbkRWMduhXBDVwtR0nJHdQdoHCcixXbZ7EpHcbCctc4G68IaV3i8ODxiLRNpUf0Qd0d75sw=@vger.kernel.org, AJvYcCWownmWm2iBzTacHPbb9F8bka1qzT3PIn2AcTZn8H+DZTFrTaBPVDA8vKvzDhJVof43CGh3aZZRd+5teoHm@vger.kernel.org
X-Gm-Message-State: AOJu0YxgEE9HsWIzRCh4gyrSo6kBpmM/UbL2tbbjZSkSZMwS4fonvcOG
	l781t0SN2HaFJ3oUgix5iBxCf+G5Ir8nKeTSpuc4uEpt68jEIsZDscAt
X-Gm-Gg: ASbGncsVv4TizZbrGdfrEsvWpSt+B4uJqqirubjHGbol/Bh/PvGuSrB4o18hdbhGeTe
	LUYC7e9u1M87hEhLMjEP6PfM5XTBwr/DnEZ54xitHtuBjBSy3YYisRb4wVxBiYHcMxaOuXxD+9f
	Q9OlgpustO6dAbAxLRr8sLPZ57EWdQoPXXJBoh0fVGgTO6h6eyWmI/Os1I+4AORCVkXscd1tuOT
	imwLHAjOzaFWKdTz+JcVQ256Yoppa+SPSd8mgTtmzMJWz7HpcPLjfzi5GI9IOsWn265XVoGxicG
	1fjYX4gX5RADstcPWVpZ8nBrmHjnCzfQ0wN99VuJZBei1usojS15IVMbi/yrssSFOfagT21vKhf
	QkSP0vTHq0SZ8F9zAcXL8NnUpunEQNq0=
X-Google-Smtp-Source: AGHT+IGXNQ/Kv/GAHaZTlEm0PZukBBO2kWUNKuvYaAwM9uxr8U9d/fuebZy2jBADIT8dDmhYUoCnRw==
X-Received: by 2002:a17:906:eecb:b0:ad8:8efe:31fe with SMTP id a640c23a62f3a-ade1ab876f7mr153758766b.43.1749191335712;
        Thu, 05 Jun 2025 23:28:55 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754653sm67989966b.20.2025.06.05.23.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 23:28:55 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v7 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Fri, 06 Jun 2025 08:28:20 +0200
Message-Id: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAISKQmgC/23OzWrDMBAE4FcJOldl9R/31PcIPUirVSNKrWK7J
 m3wu1cOlESg4wzMx1zZTFOmmb0crmyiNc+5jDW4pwPDsx/fiedYM5MgNVghueUC+FTwgxY+KGE
 jJRQaHauLr4lSvty001vN5zwvZfq54avY276zCg4cLJA+Enlp4HUpn/S95t8yl+eRFrZrq/wXD
 EhpWkFWIeoYMPn9j+gL6i4YYVtBVcHV2uNQ9Rj6gn4UhlbQ+wcbU7JBI3jqC+ZBkNAKpgriiAN
 6SBgU9gV7FyzoVrBVkMp5dCbGYDoftm37AzYXVxT2AQAA
X-Change-ID: 20240612-6-10-rocket-9316defc14c7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

This series adds a new driver for the NPU that Rockchip includes in its
newer SoCs, developed by them on the NVDLA base.

In its current form, it supports the specific NPU in the RK3588 SoC.

The userspace driver is part of Mesa and an initial draft can be found at:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
Changes in v7:
- Actually enable process isolation by allocating its own IOMMU domain
  to each DRM client.
- Link to v6: https://lore.kernel.org/r/20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net

Changes in v6:
- Make all cores depend on pclk and npu clocks
- Fix BO sync direction logic
- Misc. cleanups
- Link to v5: https://lore.kernel.org/r/20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net

Changes in v5:
- Use bulk clk API
- Rename bindings file
- Syntax improvement to bindings
- Link to v4: https://lore.kernel.org/r/20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net

Changes in v4:
- Several fixes to DT bindings.
- Link to v3: https://lore.kernel.org/r/20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net

Changes in v3:
- Reference in the device tree only the register blocks that are
  actually used.
- Several style and robustness fixes suggested in the mailing list.
- Added patches from Nicolas Frattaroli that add support to the NPU for
  the Rock 5B board.
- Link to v2: https://lore.kernel.org/r/20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net

Changes in v2:
- Drop patch adding the rk3588 compatible to rockchip-iommu (Sebastian Reichel)
- Drop patch adding support for multiple power domains to rockchip-iommu (Sebastian Reichel)
- Link to v1: https://lore.kernel.org/r/20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net

---
Nicolas Frattaroli (2):
      arm64: dts: rockchip: add pd_npu label for RK3588 power domains
      arm64: dts: rockchip: enable NPU on ROCK 5B

Tomeu Vizoso (8):
      accel/rocket: Add registers header
      accel/rocket: Add a new driver for Rockchip's NPU
      accel/rocket: Add IOCTL for BO creation
      accel/rocket: Add job submission IOCTL
      accel/rocket: Add IOCTLs for synchronizing memory accesses
      dt-bindings: npu: rockchip,rknn: Add bindings
      arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588-base
      arm64: dts: rockchip: Enable the NPU on quartzpro64

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/rocket/index.rst               |   19 +
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    |  118 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   89 +-
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   30 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   56 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/rocket/Kconfig                       |   25 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |   80 +
 drivers/accel/rocket/rocket_core.h                 |   59 +
 drivers/accel/rocket/rocket_device.c               |   31 +
 drivers/accel/rocket/rocket_device.h               |   30 +
 drivers/accel/rocket/rocket_drv.c                  |  301 ++
 drivers/accel/rocket/rocket_drv.h                  |   19 +
 drivers/accel/rocket/rocket_gem.c                  |  197 +
 drivers/accel/rocket/rocket_gem.h                  |   32 +
 drivers/accel/rocket/rocket_job.c                  |  700 ++++
 drivers/accel/rocket/rocket_job.h                  |   52 +
 drivers/accel/rocket/rocket_registers.h            | 4425 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  145 +
 23 files changed, 6430 insertions(+), 1 deletion(-)
---
base-commit: a6d708809579ed3d902465785666085ff07a1d7c
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>


