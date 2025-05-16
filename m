Return-Path: <linux-media+bounces-32642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A2CABA127
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 18:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91077A25437
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 16:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913031DE3B7;
	Fri, 16 May 2025 16:53:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B3119CC27;
	Fri, 16 May 2025 16:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747414411; cv=none; b=qnfqkkgMPgVSNlHSsIV9c+S0BhON/CXyKp9O32A9GjJskiE5cRV3nIp4pT3DBCusimmoomyP5jZmdTdtLM1HC5kvLW7rPYt64C9f0o32jZxt16wnMWgfSxGyVQ4tCv2EennMjubXVh58EW6s4YypgJHia9JOGxTKvSd9aG8/Rko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747414411; c=relaxed/simple;
	bh=hhs3FGcn8tdYcYNA+c0yVqziQ6ixryuNilAWsptvP9k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TvQSi/dZ/oKlJtqMSmCPZb5Fnc4G2LqXsaTsN5jKrviFlCUsVJY4Zwkp4n/QyYmyqfhgsakNagenFcrBbgVkKnLR4PHzUkVFeJggkacTtjnHveOWIwsOOiD1eoidUT1VqvsuxzFBmfTkoQ9dPyXmJkV1/S7S0KMcoY1lScFfQKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so17781625e9.1;
        Fri, 16 May 2025 09:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747414407; x=1748019207;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjWgWtoIZo8y/TKpOs5rk2BDTL4bgGyGDJJ1PVIbYcw=;
        b=s6S1t8VejJ3obkwYSfHOMAqOoeC48Ktj6Of3zpt+8z2kWyNMpfGU9YyBEanD8iKwYz
         o0f6K4TVk4VdCg+TScyW6yAvgbehSdceaF2XjZlfw5MuA5IOg8tvC6jGgJu26Ceb8lFl
         ujqOmc7HCqqm7tcKI/I75tAPcPj+X1axk+Qn+KMTimf+XTO3NODq+KzR3bhC97eyWROn
         PCr0TB45Nt7qd+S14j51iAkE6jvAZ4GnAPrQbnSYtmX1QXg6Sq7fYCZyrFkWm/ZDzV7h
         b5HmEaigevxToYgJizqzMZB+egddKo3UWn1Wp95GLDSUp6tOzfH+EdVNP/rJb19aq4qL
         A9uw==
X-Forwarded-Encrypted: i=1; AJvYcCXWHXGTjJTuPRQJ1yTIz44bRZWJ7EzUTnvikt8GrzsO0zMzbVSHax1bnWU3oE3G1uxDZvDdXC7Cy4w=@vger.kernel.org, AJvYcCXhrpvopJDWYxdWU2d4ebe/VquRioLEhBjGEVj71bqfkevqZv0dxGS4iYKWSjwAYorCFXwPnd9Zmv0QCYo=@vger.kernel.org, AJvYcCXw3E0X1ABmzMZyPEDgMvp1S0t0vS3fYGGjUETpDc5RefV5RciIaX17bqeypW3145QkSUuFy2xVvEhUUm7M@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp6i8mjMlg3t7ZHIw1p+FeJpCmUkhmmERK9kGQQq2TfpA5uHE3
	+0mGMgOiiXrTjRTz6DyGguBrLVjCEzJw+7oZw/fxqmTaTs/pynkxInUf
X-Gm-Gg: ASbGnctsrOJucuH4FjTpqgVJGdDPmJuadP/7wX0Ko5IY+a03kvFyYwIvhH8mUkbbWSp
	RLzymPwkFG4lNW2L3zxWXCo7lvbLfueI8PwbuPJ93pQdiIucFPHivzOiYhF5KgNDFPfAMRVwWAM
	YIV4JzDVt9qyX4haNv93NAFrWXZPnwsqYipISPMzobfc48DCs6B8OIaG0y1aED2XoDE/wy8kzxC
	En34w4ZBCuCvevylh5Vu8zY4RM9ML/mFWEjxkOpKSc7T+YoaImxaPtuoL+gnrWkuVQDjGUfOM1r
	Ac4cTll+PkVOmso1uENvFHeaspFFjTKGStOYkZQNDuq3swwEpO4C8mA3k0Eb/5QckrF8pbCME+6
	YVoZ7UGa1ANljVGSAkjt7
X-Google-Smtp-Source: AGHT+IFKbF9gN1yX2abHe3gEHPJVfqjkBh9yk3mcerUyAXMO/v4S+hII+M7JTfdRqYHVCzhKlPw+sw==
X-Received: by 2002:a05:600c:870c:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-442fd268c7cmr48300955e9.4.1747414406901;
        Fri, 16 May 2025 09:53:26 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380498sm116511755e9.11.2025.05.16.09.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 09:53:25 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v3 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Fri, 16 May 2025 18:53:14 +0200
Message-Id: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHptJ2gC/23OTQrCMBCG4avIrI1Mpmn8WXkPcVGTqQ1iI0kMa
 undTQsuRJfvB/MwA0QOjiPsFgMEzi4635eolgswXdOfWThbGghJoZYktJAogjcXTmJbSW25NVK
 ZNZSLW+DWPWbtcCzduZh8eM54ltP638lSoECNrDbMDdW4T/7K9+xePvpVzwkmLdNHqJGo/haoC
 FbZk2mb6R/5K4zj+AY3RKj87gAAAA==
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
 .../bindings/npu/rockchip,rknn-core.yaml           |  162 +
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
 23 files changed, 6584 insertions(+), 1 deletion(-)
---
base-commit: 46bfbcd135a6df00c49cf043bf2c9c9387bc882d
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>


