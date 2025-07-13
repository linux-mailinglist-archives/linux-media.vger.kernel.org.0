Return-Path: <linux-media+bounces-37557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE501B02FFF
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 10:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C6ED3BA3F2
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 08:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F0E1F2C34;
	Sun, 13 Jul 2025 08:39:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D271A256B;
	Sun, 13 Jul 2025 08:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752395942; cv=none; b=jGGra0XWoNRFJsCs16NXBPwKNaNWpdtnH5i8i7R+f/CzpDf1vhUIC1PvIUPynsc7qbKZnGykThGe5aIqz9HB/Ubqepu6OXvI0opQWYJl5jfpvJNpXf438/eFFPsCzv7vNDD/FfFOATiyWmXxxZpJrdIJTC/cc5VDwZLbjqi/Tg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752395942; c=relaxed/simple;
	bh=6j9ufbnmTUPOoOsJbf5eVinNtSEavneK5YJvFC1njH0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pzz5e7Oe5vUQ4v1J3zR7KPsT9YGM7YjKBfxHP7Hbg8QQCMP2W2VWDBVBuCthOa8b7QTlyYrd73vqrzr81Zlti7ZGDboZ3VB4v0bnKV1jMkhxYTciYKxwsGal0tilnQaVyo4dycWVgwYp7OcyYqMhsvkNWnfDqJrtdUIm4wJZwno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae0d758c3a2so539324766b.2;
        Sun, 13 Jul 2025 01:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752395939; x=1753000739;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iox57DVjdaoaKfxo5AboCSCO4GMqqNFB8Dj9mmEAG9U=;
        b=VuRaoVUdhQNMU+o2ZLb4iAggUsVyOtfnS+ohqIDU7//P65cNPqG8zE9gXxuzmj05PS
         2LUOcuXQaOn26azO8vtaFJpVK8cVCUNqrnaGeIlr2W3mNpIDTPY7iSyolljFcflMykv1
         +90dNvIAFXPPS8xBELf6ouD/cBripaJliSWh0dC2MZ6/PjR0PPpGmxIWSeGADEMwpc0R
         Tt5wgTJzxYBBrlmnVjY1tISSirKRH5C9xiVzdh3hhPcG+Wfc2TosT6YuUvdDWZa1W0hj
         iOVCpToggLW3v8FAvg9CzDJxc4TCEimTGZQWQ0g/sbogLLCC6jq1mGnSMy2gywNQyKhx
         MDlw==
X-Forwarded-Encrypted: i=1; AJvYcCUvg8PULZsmYhCy+I1GH2eDwdWn1KPuNw2IRkuPvHsxoI5+k6/CNm3noALLdnx616AwqUxAxgcUxCI=@vger.kernel.org, AJvYcCVCQjGPho2aDpvu/xMmHAGLHtq7SXnE+RSwmCO44np+JuhfdzMUOoLhH9UzLiRK6P5JYGliNBbWKwMcvAMU@vger.kernel.org, AJvYcCWiUvQg/BuQu1QY+jpQnV8xKp3XzLIaKg9QTJu+i1oxjUr9ozTQhmVvNPPj/BFr+HrESSfgd6gkSIOMjKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFtUNS7wmj2LWdebixz0EKgcO0jg7dSTGg3Ed75JWk8J+pZ9n/
	uwEUHIPkShCY80Wl6uxRPOK8bfcCa3efMQeOjnAuSobEqFKKp+Ttw0KmnBpvQwMX
X-Gm-Gg: ASbGncuODk2iO2YswDT9zqInE0W7rl8H1BVi/eRC9wo2JCrouu6mhPuQkt9umtdl2UE
	yufJrQaSfLM2cRtN6sMOgBiMDh4aFw4F0Seq3vtDyDkorrLxcMm3AbiqcLyUA1cK5wAhbTBt2vV
	Wl9DQ6jjFvvx/JvWuRuocP2lMiOsdiu2vLClAptBIBFF5hkbhH7gc+81omf4lZMfSmcrbb9+0/X
	N2bNy4Fcyd9dwyBH5fsUQKuBoyRHa/+tr4GnaZu8hc4/iKAkuVfuk2/VKPksGGpHV8SlaIdgykW
	wrF4Yb9toB4HVpprBz5YyT09Qp3HGG551FSFI0dip1XyLHoa9RAi+WJCTNtMnra3zlNE/kdLE6j
	uzZhuRBkMgHvjYABJAByGcMpkuUZIm0w3b9JWxojsFX0w85bQYCPrjewf
X-Google-Smtp-Source: AGHT+IGQt4zhcJArH6o30HJl75IntEaAKyUOXg4i37WOL0jJEDPrPv4BbMBWt/Q2KxZH+6OQZBiXZg==
X-Received: by 2002:a17:907:3cc8:b0:ae6:f663:7232 with SMTP id a640c23a62f3a-ae701371015mr731574466b.61.1752395938613;
        Sun, 13 Jul 2025 01:38:58 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:38:58 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v8 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Sun, 13 Jul 2025 10:38:50 +0200
Message-Id: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJpwc2gC/3XQwUrEMBAG4FdZcjYySZNJ68n3EA/pZOIGsZG2F
 nXpu5suyLYSj//AfPwzFzHxmHgSD6eLGHlJU8pDCe3dSdDZDy8sUyhZaNAGUGmJUoEcM73yLLt
 GYeBIypATZeN95Jg+r9rTc8nnNM15/Lrii9qmdWdREiQgsGmZvbbwOOc3/ljSd57y/cCz2LRF/
 woWtLZHQRchmNBT9FsfVReam2AVHoWmCK6MPXVFD31dMHuhOwpm64AhRuwNgee6YHeChqNgi6B
 a6shDpL6huoA3AcEcBSyCbpwnZ0Po7T8d3F748we3XUEKKTJGNhVhXdcfpsU+mTgCAAA=
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


