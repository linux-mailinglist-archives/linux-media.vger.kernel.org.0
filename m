Return-Path: <linux-media+bounces-34039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8B0ACD8F2
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 09:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 895931897674
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 07:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187E823E347;
	Wed,  4 Jun 2025 07:57:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE65086353;
	Wed,  4 Jun 2025 07:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023850; cv=none; b=BxxnvF13mxJL7xxeUyXUHlL3L5G9l/EYAAO5HPfekfvw/T/GDzea80XfDNZ/pBXHBENJt0tgPOs9TLkWGtglX33+A0625GI28nTWTpa7QvkbCdboGyPBNc5yW4Fk7H90/j4jU+vSwsS72F78DPHNNoKpQNbYg19jGOAA33+HnOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023850; c=relaxed/simple;
	bh=tJXVBVdAr9NhlM8lUyKuJcoeS79GxUPwpAXu3Lrwklg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i/z8be9VqXEuCtK1mP6+UUPr5WPxxOfCHI/56aP2i03j8onR3NnSDv/BW6pyZ1kX9Le/2BHQT44UxBYlJ0sdx4oMaDlEDfAiIitcjFb6Q8leAWIBs2TGVoJOiJLrTq5f5YGqUybJeT/6pDH+SIkJlQtRetYDPWBSqOAZhFeTBVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-601f278369bso13650051a12.1;
        Wed, 04 Jun 2025 00:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023843; x=1749628643;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uxxYGGPVhEVYQnWDmi0qjryVI8On5yy5JrIx7t0q32E=;
        b=pnBhEpkOtscVtcBQdjbOKrNR2csOK5yiYY5EXTgikPijsQpoUlwvCTtoQaZh6CTsTf
         jS3zOp/S84T4T/hy8bo58DRc4QFK4i88kydJLkagn47YZ99SBUXLMnqJpep5YVLTqhS0
         +EXU5N5oPsmphmFOVtHVYbSkzS5HGNRBkXSn56ZnsVbFpNO9AhvlDGZd8wWz+lt/3Jyf
         BYpAG48iMxZRFQlVqhyptsrWaZl/HG8Qlss5nnYA2XtHF4d/6QkTwFo+qxfO/i1f5/Fc
         Edi9QIhi70R1mY2KjB/SpFQ7UWye/Hv8gKe0Itb5rnaSc+24gFYZO6brIa7Hsqby0LM7
         q21w==
X-Forwarded-Encrypted: i=1; AJvYcCUVsxAaRo5TErwHc7W4gyUOhOIYE1lBYJcY1C/FRqtSrvz7au5NC4QNQnHgftBw7KKYNECjG2+m6/nZwQhs@vger.kernel.org, AJvYcCWslylCbpjRUR6BTh9hrMsw7t3wPNEG9RFN8FVnR2MyLe+OY/f7OW73OkbL9NAGEh9KhuFKQ6qBXef50Tg=@vger.kernel.org, AJvYcCXghq4jGc6n7h1vzZjrzeJ9S++gQGCdnPVzshCfejptDPrVt80YyBU85f3eJv9hQJYenO42eIMMBlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6aIW2xV67STV7Hsmfrp+0fYFTmdEunNT4kQrMyzs28XwclHEp
	zFw0CZKVCupxbhrBjcU6dSSGLZkIihsqjq66pzaZc7vfGQl3QM3tZ9m9vTa9Jp1J
X-Gm-Gg: ASbGncuEOab1G37aMjLJ6UY/Cya0Z91BIPrVXrFnVeA7b1iQAd4IT5ZVCQ26j9ZBEJ2
	lLI2NzDd7TwQd/HvnxBTkef2gW46z30AjZMOtVkxEu1oCG6g0FE1P11/S2CT3OcPsyCLAu1ww4b
	qpLkhoerWr+fk0tFUhPiTvTE7up73Bie43B4kmvd+78d14O8DFoxca+1MgynpYFQpUyDgBQznto
	7jVLOq01yAEn1MyRiqfxTUwqmhigJmducxt3b43RSkhd16cOzZLl3LA1EIGoD/xItgGQnSJZP+g
	rD0/Sqr0uQ0Qom113BQWoNr3nv0Yrvg1l23cXTjmWtR+sFgFcY2+J3NOD4WnX2oCZc8BxG/Hupx
	3c+qOmyyzVA==
X-Google-Smtp-Source: AGHT+IEZtmjhfMvdiTBqQ3KrjPtemiMa58uAXN8NL9Oz74jU+f3Xz3Mbx/uxfwFliJgWoAvBATYWXg==
X-Received: by 2002:a05:6402:40ca:b0:601:89d4:968e with SMTP id 4fb4d7f45d1cf-606f0ed4379mr1469272a12.27.1749023843024;
        Wed, 04 Jun 2025 00:57:23 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606fb36a160sm348569a12.45.2025.06.04.00.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:57:22 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v6 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Wed, 04 Jun 2025 09:57:13 +0200
Message-Id: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFn8P2gC/23OwWrDMBAE0F8JOldltZaUuKf8R8lBXq0aUWoVy
 RFNg/+9cqA0pj7OwDzmJgrnyEW87G4ic40lprEF+7QTdHbjG8voWxYIqMEqlFYqkDnRO0+y75T
 1HEhp2ou2+Mwc4tddez21fI5lSvl6x6ta2m2nKgkSLLA+MDs0cJzSB19q/E4lPY88iUWr+CsYQ
 DRrAZvgtR8ouOWP2ha6P8Eouxa6Juxb7ahvuh+2Bf0o9GtBLx+sD8EOmsDxtmAeBIS1YJqgDtS
 Tg0BDR/+FeZ5/AKJhlVG0AQAA
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
 Kever Yang <kever.yang@rock-chips.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
X-Mailer: b4 0.14.2

This series adds a new driver for the NPU that Rockchip includes in its
newer SoCs, developed by them on the NVDLA base.

In its current form, it supports the specific NPU in the RK3588 SoC.

The userspace driver is part of Mesa and an initial draft can be found at:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
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
      dt-bindings: npu: rockchip,rknn: Add bindings
      arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588-base
      arm64: dts: rockchip: Enable the NPU on quartzpro64
      accel/rocket: Add registers header
      accel/rocket: Add a new driver for Rockchip's NPU
      accel/rocket: Add IOCTL for BO creation
      accel/rocket: Add job submission IOCTL
      accel/rocket: Add IOCTLs for synchronizing memory accesses

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/rocket/index.rst               |   19 +
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    |  144 +
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
 drivers/accel/rocket/rocket_drv.c                  |  300 ++
 drivers/accel/rocket/rocket_drv.h                  |   17 +
 drivers/accel/rocket/rocket_gem.c                  |  208 +
 drivers/accel/rocket/rocket_gem.h                  |   31 +
 drivers/accel/rocket/rocket_job.c                  |  694 +++
 drivers/accel/rocket/rocket_job.h                  |   50 +
 drivers/accel/rocket/rocket_registers.h            | 4425 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  145 +
 23 files changed, 6455 insertions(+), 1 deletion(-)
---
base-commit: a6d708809579ed3d902465785666085ff07a1d7c
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>


