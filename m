Return-Path: <linux-media+bounces-32783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9ABABBF6E
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B23A1651E8
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B6027AC3D;
	Mon, 19 May 2025 13:43:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87AB1DE4FB;
	Mon, 19 May 2025 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747662238; cv=none; b=h4GHszmh5LFZ3oLXfVsSpyO4s2gn0bXBufn9hZnhC4S9R0M/7xN9xRw+QRmIKzFExs6kbpz7+EEsGA1pHx3eo3KfF/dblCJpv7LPVcbLgtvUJqs7g39L81iWcrNfPcFL01slZw1T387IIBzn0RpcxX3RXYaz7JFQ4AsrPLU0EDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747662238; c=relaxed/simple;
	bh=GRHUPQctyM68MpR/kycrCPxQjMCp7rSPYYfDRZgprVo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=THHmjrcRz9Kos9kkjOekXxP3WEGGybJt4azYC47F6wo8mwMWGFN5pLa6FJ1OPPrRu45lVh0fRohAuf5W+5NAPfmdSZ0VFKcPjSILt+rF6tyoYXxAavU6RfSRdrCtX0xVcawQFLfycWvRUUERpv2SKZbiWsaWk4J5WmH/lSeH71o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so48231465e9.3;
        Mon, 19 May 2025 06:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747662233; x=1748267033;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2iDm7AFMMtjAMcYjTVMDQj0KlbNPAJT0z73iR1jFKk=;
        b=SkAaNYtGXsxvy+hZRisQV/uwlKnDmmXcCtDg/dHeYUZtDX2Y5ZRPGMpOc/Aop3HDfY
         TobAIHBq/d7QJ8pUP9ZVqSU9CPGqNhxyoJPs+xsOXFb3VeyjOVhL8nInNoZDMRMtLNXi
         Gzf1Ngp/MhV4BFjacdvsbWUToUBDXTN/RoCjPkiVOP53bxIJYjGYlWoAgMu1ePhZJhDW
         dP73yW237/3S6ewNa/U1YJRcgNqOca5bmdQg0gpSsPRbtfaTFqMAgIDQSwH39kQC2dNP
         f9ZzcpCNirSrVV5Ndc82Fgscr9PD5vxlGkS5ogAVg7xUUmqwMsuYs8rfc+fZHAjxranp
         ybbA==
X-Forwarded-Encrypted: i=1; AJvYcCU0bCrb74ts9mNh7YdYLvmSIYpCKTe9lj49kAPfoovXr6f+oiCFpoqstr8zVAQXZqPo9wv2VOqhZ/o=@vger.kernel.org, AJvYcCUaAA182yHeRn3y9O9UxG8/wFoAcN5KlfCT5bYc+INU8wHIM+T7njuprOQYHEBRh6qn3RlDImjJ7xLNQ8yO@vger.kernel.org, AJvYcCWe6IjsBIukZ87Yrw6IohwfYjUDGsZi2AuHh1cqdKI1DQkFhQPasVa7F7rWwtAOXzudTpUa90h7ygvU9e8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLujAEQCWLXbxXhWCL9i/TH6GCmYI610Dbx2tRaeRsNKDQVaEX
	gzhKDTAooVR1xqmHnn2KUSrqmR/873Sx+iQqrPGWY/mSoN14am4YPgdu
X-Gm-Gg: ASbGncvg5E0NZtLZsyOeJPmfKUXN5luQUTG4Td5bB5G/i5rPlgN4Y+ho2GFGtL2whxk
	ieYH34b85xNuJsnzrRJvtnH+FyzutVGH8oymAwGPIBXpDoP++DrY4jBmD4viTT783UhrBIOstKL
	M/BnBXZw36Mk8M1otNXehaizrapmNZze5ufxfEPtvT+QBxs24o60Rnwr+sufrdqqsHVd34cD3oy
	2gJAfY9jrW6bPj9yOCIuDIwRhPIEEwJhNdfOeVesyLe8TUngbZCrnEdb0XiF8z9OiVoAsAX+cTn
	TeskVfCy6N4Z6ABACobhRPeOcbW0PzF0fhDcbxdCb6BPFAaxbPpSxfNR61YGaYuMuOh1Vx5BTTi
	LN6IQIxlh8A==
X-Google-Smtp-Source: AGHT+IGz9sr1GGSvtPUN+7MYE3oLrizZuU8xFUXM1pTYI0T7p9vNGQVR6GSJnDp0kkH0OTjmfvI/5g==
X-Received: by 2002:a05:6000:2913:b0:3a3:655e:d472 with SMTP id ffacd0b85a97d-3a3655ed55cmr5479104f8f.47.1747662232893;
        Mon, 19 May 2025 06:43:52 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f8ab839esm171263005e9.17.2025.05.19.06.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:43:52 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v4 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Mon, 19 May 2025 15:43:32 +0200
Message-Id: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIQ1K2gC/23O0QrCIBTG8VcZXmfombrqqveILjY9axLNUJNq7
 N1zg4jRLv8fnB9nIAG9xUAOxUA8Jhus63OITUF0V/cXpNbkJsBAMMWBKsoZ9U5fMdJ9yZXBVnO
 hK5Iv7h5b+5y10zl3Z0N0/jXjiU/rupM4ZZQphmKHWINkx+hu+Ej27YLb9hjJpCX4CpIByKUAW
 TDCNLqtp3/4ulD+BMnVUiizUOW51vusm+ZfGMfxAx/82SowAQAA
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
 .../bindings/npu/rockchip,rknn-core.yaml           |  149 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   87 +-
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   30 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   56 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/rocket/Kconfig                       |   25 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |  103 +
 drivers/accel/rocket/rocket_core.h                 |   59 +
 drivers/accel/rocket/rocket_device.c               |   45 +
 drivers/accel/rocket/rocket_device.h               |   31 +
 drivers/accel/rocket/rocket_drv.c                  |  337 ++
 drivers/accel/rocket/rocket_drv.h                  |   17 +
 drivers/accel/rocket/rocket_gem.c                  |  211 +
 drivers/accel/rocket/rocket_gem.h                  |   31 +
 drivers/accel/rocket/rocket_job.c                  |  723 ++++
 drivers/accel/rocket/rocket_job.h                  |   50 +
 drivers/accel/rocket/rocket_registers.h            | 4425 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  145 +
 23 files changed, 6571 insertions(+), 1 deletion(-)
---
base-commit: a6d708809579ed3d902465785666085ff07a1d7c
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>


