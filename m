Return-Path: <linux-media+bounces-26897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AB3A43697
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 08:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 240F13A8C67
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 07:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA4A25A645;
	Tue, 25 Feb 2025 07:56:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A02E1DF964;
	Tue, 25 Feb 2025 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740470162; cv=none; b=qXHEPGA4WQnvHmtYK2/pM1FCZ8AdnQfuqWzTG4r+S8xrIn0MOHocr3rOe2xfI0u/kkt+WpJgXSNF0TZWxiRsivxnQAcs/MgrdKVjia4/Hk2eqebPECcP2KY/4nRTbZBOms6Rwg5lrST0ADaDM8gxmru2ZLXKrT82RNBDHziq1Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740470162; c=relaxed/simple;
	bh=jwdq7nbXVEptLJlR1b3xoawFzmC+03+BZ6/zXiGnYGU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bFaGd92x2hBbRpthcUib0qiuvKfq0VjISANEHHWcgQne6lLQ7m5XZJ5vTsuYIVuQFqystVBReuAYMJr7m+0ERiQj7zCX1DTFHHYan3NME9wOw9PVQj93sWISdcCL6reDlo0P2jTZvFa2LbkV5+hA+utZCGJ2y758gfUOQlfqAZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-439946a49e1so32791655e9.0;
        Mon, 24 Feb 2025 23:55:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740470158; x=1741074958;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKWfJnlIU/VwviwhZqgb3CnRb75dZOnMnqdVJJtv9ws=;
        b=t9vEJJzMbYO6/R/Z2kNvDvTreMYR+9xNkMeh0s4FNQ++Kja8OkEsZ3qKJG2KObloYe
         w1wQDW60E1Bq61O7DGSMAY+AiVzXEx60sujLuv0FuC9uxR6dDTxKMfT3diQua8OCEOXg
         mgtC2Ojn+RebWM28rsbP4sBCFLHYCffzoFMl6AW3WDqeQc6EI+LHSwcTgpYQDBLo38u1
         kb6zNcYJKN3mYyHSGi9xnHH1Y4IMilHaOIY6DWSf6bw0oWYcZOaK6jQnjtmzHzokwF+d
         DQMQ36XY+f78cn012ssFqn1Ut0u3hhqQAyTlHui4um4LlJS/+jxRBiWg+0b6JRs+JozK
         HFwA==
X-Forwarded-Encrypted: i=1; AJvYcCU13FgntieiQABJi9z3mrfg59qvzothOkNiuzCrd5kcQWTpuW3CY4i+9cUWwPmsO0MuPIKgYY8Hy+E=@vger.kernel.org, AJvYcCUbvnIlSmnKQMDUNjbQRovqDMbvTspEWUFmWt43eRpq8l2VZR49V4D9yLmy7wU/aymoOVVWGHHPTZZMoYU=@vger.kernel.org, AJvYcCW/iDtZ/c1UWLxNwqJo8RS+187x+q3N/cEGeA9NmZ72S5eMg9rINkXIAnlvUJ+sTwq3/4kSmvPBbSJiy8IW@vger.kernel.org
X-Gm-Message-State: AOJu0YxTQSEow1gxEC5QNQNAguG6K1L6CdDopGv4ydZL6q0mP8wuHq9R
	5vIO5iD4xFWgYSR6U+Tq+p7mPkiYJ06Yuz0FzY5DbdHMKDMeU6zu
X-Gm-Gg: ASbGncs59Rl96Ocd3pYxnfCHaBc5YuqqstJiLxx5rouoBLaNX9eqCsatkx8F6Dc1GVM
	G8G01d/LEORHfK1912m7Z/0a1DpiwBxFqDbDrJ2A+kzEQ4b/R+qReiMkZ0YtEY8lhNHgPOAsVme
	Cc3bhQqJjvZqRhJuX+PWWfMLjKPkN9S6yddoFkFBRFBYAilkmqCmmJvIS2t33gmroIPuzuOuLN/
	XxWYZ0lLxEQVt0f6si3nW6n8WZvUSrcrGL7aUpUXU5PlKumqHEPPscp/xN6p5U7GxL0/q4mg4M5
	NpU6B8PhaFyjHuMOCZmBHMJuioU+NLGCwn0+dDsbGigw2N1MAq2j4wfHgg==
X-Google-Smtp-Source: AGHT+IGyKE9ou1PLve6oe1JIwGuGEar++UthHGMcf8nHUEw8AgRnWz/gHdtZb9HVpd+SBEqA45A1bg==
X-Received: by 2002:a05:600c:5115:b0:439:7b5e:820a with SMTP id 5b1f17b1804b1-439ae1e670emr149646185e9.11.1740470158037;
        Mon, 24 Feb 2025 23:55:58 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-37-50.cust.vodafone.cz. [46.135.37.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02f2475sm130299475e9.20.2025.02.24.23.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 23:55:56 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v2 0/7] New DRM accel driver for Rockchip's RKNN NPU
Date: Tue, 25 Feb 2025 08:55:46 +0100
Message-Id: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJ3vWcC/23Myw7CIBCF4VdpZu2YAREvK9/DdNHQqZ0YSwNI1
 IZ3F7t2+Z/kfAtEDsIRzs0CgbNE8VMNvWnAjd10Y5S+NmjShqzSaFERBu/unPC0U7bnwSnjDlA
 fc+BBXqt2bWuPEpMP7xXP6rf+d7JCQrLE5sjc6T1dkn/wM8vHR7+dOEFbSvkC3oBjFawAAAA=
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
 Jeffrey Hugo <quic_jhugo@quicinc.com>
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
Changes in v2:
- Drop patch adding the rk3588 compatible to rockchip-iommu (Sebastian Reichel)
- Drop patch adding support for multiple power domains to rockchip-iommu (Sebastian Reichel)
- Link to v1: https://lore.kernel.org/r/20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net

---
Tomeu Vizoso (7):
      dt-bindings: npu: rockchip,rknn: Add bindings
      arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588s
      arm64: dts: rockchip: Enable the NPU on quartzpro64
      accel/rocket: Add a new driver for Rockchip's NPU
      accel/rocket: Add IOCTL for BO creation
      accel/rocket: Add job submission IOCTL
      accel/rocket: Add IOCTLs for synchronizing memory accesses

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/rocket/index.rst               |   19 +
 .../bindings/npu/rockchip,rknn-core.yaml           |  152 +
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   76 +
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   30 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/rocket/Kconfig                       |   25 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |   77 +
 drivers/accel/rocket/rocket_core.h                 |   43 +
 drivers/accel/rocket/rocket_device.c               |   35 +
 drivers/accel/rocket/rocket_device.h               |   33 +
 drivers/accel/rocket/rocket_drv.c                  |  295 ++
 drivers/accel/rocket/rocket_drv.h                  |   17 +
 drivers/accel/rocket/rocket_gem.c                  |  216 +
 drivers/accel/rocket/rocket_gem.h                  |   32 +
 drivers/accel/rocket/rocket_job.c                  |  710 ++++
 drivers/accel/rocket/rocket_job.h                  |   50 +
 drivers/accel/rocket/rocket_registers.h            | 4425 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  116 +
 22 files changed, 6372 insertions(+)
---
base-commit: 585e191534efe95712df88a22eaa8d51228bcb43
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>


