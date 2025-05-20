Return-Path: <linux-media+bounces-32901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C50ABD4AF
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 12:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC99B7B38F4
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F5D26AA99;
	Tue, 20 May 2025 10:27:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B632690FA;
	Tue, 20 May 2025 10:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736849; cv=none; b=Sf5qPGeAhBri/WXPFwVPY0nHVZGs4qMdUA2JjAfdk3kmzX0JAMRPBQPd+OBeFq84OTTT8AlbMe/mv5H5Q7d/RKKjjCFd8a2Osg15EH2ufzMUSNmUy4cQIHTSNZWQg6OdTOCmkg9PFBvkAjhgIi/+NWZEXtXcnYmzSRIlOlK6MbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736849; c=relaxed/simple;
	bh=OAYwGvEWo5oe4fMHjy+qHLBlwJPN9jWuTWM4Fktkb8c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YX8XWeb08IGlzL4imYc+/0yIxBUkG/Qp8cILAAy+Kq+NAKVD/gN73Hb+A5k9YQC99VrDyYgKTGNstcEalaCZaq2rkWc78eTAU18UJeJI+oCCfeqkhDqhMphOtbInpQiKkOi0uaMzGOE2f07Mzal83shGhywVcsQa9jZfJ8PLztw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so56763955e9.1;
        Tue, 20 May 2025 03:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747736845; x=1748341645;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTqGUV4ksLYBe+HeSSbW60q/1vjC74ZoYzWhywmrigI=;
        b=m9PcBuGP88DxAGQ5if+ZMpVWc1M9T96yVI1UjxvhSVFfHPCSrdSDxlC4+bVdHquNls
         aRlVdVZZQjrqnTalsni44f4Fr2bl7o8tJJZceYHQ4TeakjEvShIpQKjDT5AdXmEmEO1A
         Gafv3cDEkdA/S4iiCDExSiNIDazKcI3iSnzoasABKpo6I/jGZdYZ+16NNE5M2+ZtmJrY
         l0LpxG6BtWCWvo/ILrUwwcbJ63rToUCFWwMfEOEOe6ZQL7ib/EQ4C4iY9yyCaGrpX3xS
         /i/dh2+q41crPyU1MAp1NBNK12zH7cOqCLEmy02MIcljA9D1i/z9LYYQqGr8UfXCu2mO
         vWgw==
X-Forwarded-Encrypted: i=1; AJvYcCU39YR7fjqaVLiPJ2/8hr4N8KlfofwpxNULBGFBzt+w1HTbA4nJ8+ubOKjGRxFkgI8SCbPHuZ4BskROv+k=@vger.kernel.org, AJvYcCUyFKbmi8sTtc3GWaQ4epxriSElSGrW/nR39swnMDNiyVSY8asB3qSXT2/qgGmfpYdThVwWaPoWyBk=@vger.kernel.org, AJvYcCWun4dFYRBaDg0D0cygV3THRHY12ZdwFHVXuMR5trsqZbypK0nYcFA08Ji9O/2rW8xIxRzSb/d0lsYS4hiU@vger.kernel.org
X-Gm-Message-State: AOJu0YxLaB4reIwvO6E8I3Z/4iy31AHB8ulUXCaX/mcI3WkvzQ4lb1KD
	dWDt0BSIawn/6dpDi9CqzjS/kvGqNEFFh2yrlmU+N0y79Reyo+roKIQFNuAzL494
X-Gm-Gg: ASbGncv+M/eTVmf9fj5a/pSeswSuKz/DP7F5DTMJvbienWkQDOKFlKaWRPmHH2l5ekC
	uIMDoZ5p14kxOw6bwFjml+BsiZ2/HSaxDjqG7YY46jaeLnxYCAZGl72uSwtHDfgXpDk/uUMFr4C
	jKitpo9uwigCuSH2fgo56FdxJFJOpNLj7vMPlhinyM5BQZlyEWUZ/4hqzkhdYOqj7M+dsy58nUr
	Vag1QML0XbfaXXm1iiSHnzrGQ41rMdWTuIn0U89xW2gao6dOWrRLw2hkwuwAJOWfskhERrcOPmW
	Dt25UxNwpA/okfzyJ3Mwszwrr73iF8ju9kMmDXsOZSY8GBZFVWK4G5gGmWlzr5Sv3n9VNyKre0e
	yLMBVTyVY0g==
X-Google-Smtp-Source: AGHT+IGQIlUJcRyY3tl7EezqGJ1tIgqTCFM3lHfZujGm8AzrqDj+5VJitvVUKwA4G018r4RFcqgl6Q==
X-Received: by 2002:a05:600c:6748:b0:442:e011:7eb with SMTP id 5b1f17b1804b1-442fd671befmr186270545e9.30.1747736845139;
        Tue, 20 May 2025 03:27:25 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3defsm24680025e9.18.2025.05.20.03.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:27:24 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v5 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Tue, 20 May 2025 12:26:53 +0200
Message-Id: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO5YLGgC/23O0QrCIBgF4FcJrzN+nVrrqveILpz+lkQzdEk19
 u65IGq0y3PgfJyeJIweE9kuehIx++RDW4JcLog56faI1NuSCQcuQDFOFWVAYzBn7GhdMWXRGSb
 MmpTFNaLz97e2P5R88qkL8fHGMxvbeSczChQUoNggai5h14UL3rJ/hhRWLXZk1DL/CBI4l1OBF
 8EK2xinxz9sXqi+gmRqKlRFWJdam7rotpkXxK9QTwUxflDWOdUIAxr/hWEYXhZ3XKNyAQAA
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
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

This series adds a new driver for the NPU that Rockchip includes in its
newer SoCs, developed by them on the NVDLA base.

In its current form, it supports the specific NPU in the RK3588 SoC.

The userspace driver is part of Mesa and an initial draft can be found at:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
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
      dt-bindings: npu: rockchip,rknn: Add bindings
      arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588s
      arm64: dts: rockchip: Enable the NPU on quartzpro64
      accel/rocket: Add registers header
      accel/rocket: Add a new driver for Rockchip's NPU
      accel/rocket: Add IOCTL for BO creation
      accel/rocket: Add job submission IOCTL
      accel/rocket: Add IOCTLs for synchronizing memory accesses

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/rocket/index.rst               |   25 +
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    |  147 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   87 +-
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   30 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   56 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/rocket/Kconfig                       |   25 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |   80 +
 drivers/accel/rocket/rocket_core.h                 |   59 +
 drivers/accel/rocket/rocket_device.c               |   36 +
 drivers/accel/rocket/rocket_device.h               |   31 +
 drivers/accel/rocket/rocket_drv.c                  |  316 ++
 drivers/accel/rocket/rocket_drv.h                  |   17 +
 drivers/accel/rocket/rocket_gem.c                  |  211 +
 drivers/accel/rocket/rocket_gem.h                  |   31 +
 drivers/accel/rocket/rocket_job.c                  |  723 ++++
 drivers/accel/rocket/rocket_job.h                  |   50 +
 drivers/accel/rocket/rocket_registers.h            | 4425 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  145 +
 23 files changed, 6516 insertions(+), 1 deletion(-)
---
base-commit: a6d708809579ed3d902465785666085ff07a1d7c
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>


