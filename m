Return-Path: <linux-media+bounces-38131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1175B0BFD8
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 11:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C27B87A5F6F
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 09:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573D52882AD;
	Mon, 21 Jul 2025 09:18:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE15F27462;
	Mon, 21 Jul 2025 09:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753089486; cv=none; b=H+Fv+ljPLx0FSzgTMNgG1lZrkIJXtVUzk5Kf2IxFVQ8eB4okiaj2pd58DfpzYgl4h1x25afmeJ8CC1h4m9fYJGTRQG5tT8w2UKuqUlSWXCkpBN4k7s3gY4nsvbPWYYc5gOebOp4kot8YLPUFrP+eaTEVV1GkigjDOnmB4li2TqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753089486; c=relaxed/simple;
	bh=Q+DqUPOC/vJz1agwFs9+r+mEvbZAoSgyOpkBS/8JrKg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RBylqYBYgChyCZ7P4Lu4U9zQMy/ghCCdVWC2VPEyKSOWU3HQ1qYj9UqaUGaW283B2EQKdb5lODwQ1fazNYOU9vQWE1PpwJkSnoE6f1YfRNgOwNSnuiyvonVUg19Y3Gl7ZbgSv54tOBsTV6r5RUhZXIz+s+naJbSlWBGf+blOR6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-612bc52ac2bso6482085a12.2;
        Mon, 21 Jul 2025 02:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753089482; x=1753694282;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTeHDjGkhFkvg/YRWgLqjcyb9gjsvev3mCT5Vhm+++g=;
        b=L6Mip+PFrhPoMr09zNzhrP3MV0ziYEEf/DBY3mNKrZt8GPZep2qhSspy5PNSxWyTUt
         nYvpNc4PNsNDT9IaDZ9alt0mYU9nAZMNbrqduo62sD/gXPqOEj4PPi16PXw2k+x9L4Mn
         FRJH4RD6eOF2T6OtTCL2nf1jEU9RjYyrjSb6idcYx9gfs5yWo6bANt6orxsUcU/9nZtN
         zprBOfgULWpLVJvi8RmZ7JF/IHTcOqk+vfX6EVOtHD2n8LPGPcgNsw0ml9ESSTW5RgjR
         DegzWMusGqOVwvTzmlqoV3abKoE8aYodOXShuD6ewo0uJOqsbYl/BuGq+wPtD9EGzVR/
         i2KA==
X-Forwarded-Encrypted: i=1; AJvYcCUC+DvFDJnL4t8GTaXQAuHjhAdqX/BpZw0ezhUM7e0fnoBXRw5nIwgMBNtai0j5twCQR4uJFGvyNhxKlDY=@vger.kernel.org, AJvYcCVgk+sG0kkd6ec14MKjMmPaicM2zUxWYLf9X50rXIvttayCoIRWM9mK9GUlxElw9dZ3SI0gYAz6ldzGKnnx@vger.kernel.org, AJvYcCXloCWA++jcbr9B1PSt4ET4fMOVygw/1DxCLELhAnA4Tut/p9bG3+1xIHJH1aaWn2kH9gYn3H/lKpw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1OZlYAHZPBL0dfzIX2JtsEcJCM/93TNaCFoSScBh2gbZy8RtX
	6Fp2+MGhAST7qWE/V+FFIQMKEsjZpNk22pSlYPSiByqbuL0hUAltrgMv
X-Gm-Gg: ASbGnctwQSl03sNNIfCZC5Qqpse6mQGmkYyvWgcEyPzCA1jg+PGOLHxsrYbXPcmxNpk
	lVuVUy5BiLSzIvkgWsCffptFHwM+zKweDgHmd/o2gMmt1TZQ3cJzEALwjjcTVoHO0VgP2IfVYE1
	tqKF+S9pwDRv3npRJ0z0sybr2t6r85SEfzk7x6FFaqVkLyJaveADGwtYFGZw0wwURBoYyV6CzP0
	ul9hb2j0fdiIUN/prUG36a9QtUIIqh2rsMdU6Qn4AboFkOYLffltoczt51K+xXBTAXVyyx0esSt
	M+F+iXlPHhoJaS1pRKZUYQebJ5wQSkBunY4ANgQmjczm6iTzROfBRGVZ109eBZYx77yJlR8i9hJ
	YxALd+U66ixYGYLmPcKKf3i+HwPW67hIcrlUMx7KHy2NR6rWpEkBde9DDRt5pjJ4wQFU=
X-Google-Smtp-Source: AGHT+IHl+0nahXzPJ+TOdKgEbWmzdgqogdIzkQS4hORjMP1a1LTh3JgaQ8eJnMZ77b9c8piYcC6LIQ==
X-Received: by 2002:a17:906:9fc9:b0:ae3:5e2d:a8bf with SMTP id a640c23a62f3a-ae9cddd7bb8mr1956533166b.14.1753089481637;
        Mon, 21 Jul 2025 02:18:01 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2efc1sm643125266b.83.2025.07.21.02.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 02:18:01 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v9 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Mon, 21 Jul 2025 11:17:27 +0200
Message-Id: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKcFfmgC/3XR3UrEMBAF4FdZcm0kk59J65XvIV6kk4kbxHZpa
 1GXvrvpgrSV7uUZyMeZzFUM3GcexNPpKnqe8pC7toT64SToHNo3ljmWLLTSViFoiRKU7Dt651H
 WBjByIrDkRXlx6Tnlr5v28lryOQ9j13/f8AmW6bEzgVRSoWJbMQft1PPYffDnlH+6oXtseRSLN
 uk/wSmt3V7QRYg2NpTC0geOBbMKDnAvmCL4Mg5UFz02x4LdCvVesEsHjClhY0kFPhbcRtBqL7g
 iQEU1BZWoMXQs4CqgsnsBi6CND+RdjI2708FvhX//4JctCJASY2J7R6hWwYPZC1UR0KZgABzXc
 HDNeZ5/AXSl78d6AgAA
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
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Robert Foss <rfoss@kernel.org>, 
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
Changes in v9:
- Rename the DT reference for the IOMMU for core 0
- Link to v8: https://lore.kernel.org/r/20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net

Changes in v8:
- Kconfig improvements
- Removed notion of top core, all cores are equivalent now
- Explicitly allocate DMA addresses
- Sync BOs always in both directions
- UAPI improvements
- Simplified job scheduling
- Misc. style improvements
- Link to v7: https://lore.kernel.org/r/20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net

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
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    |  112 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   93 +-
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   30 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   |   57 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/rocket/Kconfig                       |   24 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |  110 +
 drivers/accel/rocket/rocket_core.h                 |   64 +
 drivers/accel/rocket/rocket_device.c               |   60 +
 drivers/accel/rocket/rocket_device.h               |   30 +
 drivers/accel/rocket/rocket_drv.c                  |  290 ++
 drivers/accel/rocket/rocket_drv.h                  |   30 +
 drivers/accel/rocket/rocket_gem.c                  |  181 +
 drivers/accel/rocket/rocket_gem.h                  |   34 +
 drivers/accel/rocket/rocket_job.c                  |  636 +++
 drivers/accel/rocket/rocket_job.h                  |   52 +
 drivers/accel/rocket/rocket_registers.h            | 4404 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  142 +
 23 files changed, 6390 insertions(+), 1 deletion(-)
---
base-commit: 156faa3ffe21347203b35a3edb6d2bcb663f429b
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>


