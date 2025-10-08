Return-Path: <linux-media+bounces-43908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7504FBC391E
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 09:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2033C4E9CEF
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 07:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C978D21CFEF;
	Wed,  8 Oct 2025 07:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMI/xynq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0442253EE
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 07:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908677; cv=none; b=ZM3MiA2l+kTnGoof6eVEklKw8i7fxfNoexGBbjWrYiYCPsY8QI/m2SHJ/O/ygHpDvZwsh9DHsYA+effP8EUIU/reAQwM6VE5CjoG0PSjewsFkdZVh8Se3Vfr6P3dP2FMIJGcboy/3Ce76i8TZsOdXfG0kJykNr26qOLE6kL+Leg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908677; c=relaxed/simple;
	bh=AjUdUU9clCEIteMqZnK5UhkyrMwTL1Vgqjw3pbKqwu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iqRFRzh7e4OB+VyAADgEeZA4DnkyqXY98ahqH8PWgIEpi+4iJVbmgqKBHk6ANTl9xvZhtT6R75PpEOCJMpQVhPHiC8Y8KCyEP8BuBxZsS7XlcWxcDvwLt3ZqiaoblJJ+eqiVRk37eiXMGMlf04AcMfPycpAMOhnkoaiV55ENDKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMI/xynq; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso2398117e87.3
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 00:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908674; x=1760513474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KNXl+BMvGcWHYm5AdqooMALHOD7RIbmzWkhPJvrl09U=;
        b=gMI/xynq4kUkNbBGOcSDts/+H1eSlw3N0qTdLfFKXbHTQtJXT5klxXH3ckE1pPe/3Z
         ezusRMVsf64NU6Ki6exOLlrAq4blhgX0Sd/6pvYuONXxkr/gTg+Yl6RIGtSHv/6CUMfJ
         K3iVQiHSL/sL+RghViC9cxe26CDEtG3wknRYjVH7gylAOYDIop54H9crmAfqtgJkYQZ0
         UuIv53PVeeItvA9yxcoyBRVeOUgjDhwptvft0dK4V2yARjtgxNLoRI+lXdEMeO3EBRfk
         52SUTRSINX7FksNmPLXvH6pcJgqx0WKRVbenFgeswosKs6ZjUfMaFu9XLa4pGiC0CKIv
         C34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908674; x=1760513474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNXl+BMvGcWHYm5AdqooMALHOD7RIbmzWkhPJvrl09U=;
        b=Mvbhsep2jX/dfMSRNFqnwsClwfIa7QT9PpMdycfc3VduLT+z602k5qturBwHh4OlBV
         YF4F6jgLR7R25kYfJbW5815nBBNjcekG81RSdYIGN+rM0Uh08JYrh65EHtIbtWXHcjYH
         NU4weprALmwFpDD/V054293RYI1Yp7GFVs2JNCZLryJbPNdMPa77eGWIFqKr9hia8PuX
         mD3HNxbNl2eycY/dMoqtImLgriGb1jHF+p4oyzp1ncQeiz8tat5lZNc6TTJbz9fA8f+X
         waBX7lVHGoAmxVp1YTlZVhsBgzASCpHjEcCCI3geRP7px/Yw+aNO0XE6INrwFXjL9G32
         IefQ==
X-Forwarded-Encrypted: i=1; AJvYcCVElz16xPKnuBMnLHYlkj+HsjFeQryA6IQVHWNh0YXXhVfCyL6PezrntZtkAtovIcRMpqaIDDMpN2Cq+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTL/q4YSgEw4Je4MpGLc204IrBzhF9nrPwDyHTf9JIBTGASTJ4
	V/vcmQjtiDC6pjG5CM51A5YIdN+t+pFY9gH2gPaxElHwJ5HBU2JDzcvO
X-Gm-Gg: ASbGncs2zvjiUVvcOtXyfQHG5M/EJsaqRxqI2Hk9qUvwOE60SBiYUX7Ihmn+bSuy0PW
	mvGrfnqq6DG8AK3rMEucezEIorUiZ+4Gpj6X1Dp020ZjQiDxALe+t0dZrBXHSRwcIivd+dn3FwE
	Pxi4aek/XFy4uOcjmXEm7D6xQdjI7v5hqd2Tz4iGVCBiRmsVdhz6WfUvKYoJCsvw9V58EKBc5am
	dqBoxUTuRhWvKsYGOgszut51KYH8apOHdpROtIdwk+hzWITmZtz9vEbTfETZXfRw6wXZCPLUph6
	cfuj7kuJbAR6Ir50mUt+/KPvCSR0FRaapXmTsyZcv6qJhmFnhUvmvU+P0o31dcSbgcbO2RM242/
	aNGh73nknCRgBPIyULSFjd0bFw5O2Ygyl77NpwGGmb3jFaKCA
X-Google-Smtp-Source: AGHT+IFV3E4I3q4SCv11I4QSl5FglkY2KNmSqRcvzIhlPIX4IulY27ZI42wQ+IdYhbz62yo6igIseQ==
X-Received: by 2002:a05:6512:4015:b0:57b:517c:bf19 with SMTP id 2adb3069b0e04-5906d88ec80mr672523e87.19.1759908673445;
        Wed, 08 Oct 2025 00:31:13 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:13 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 00/24] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Wed,  8 Oct 2025 10:30:22 +0300
Message-ID: <20251008073046.23231-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
with a set of changes required for that.

---
Changes in v2:
- vi_sensor gated through csus
- TEGRA30_CLK_CLK_MAX moved to clk-tegra30
- adjusted commit titles and messages
- clk_register_clkdev dropped from pad clock registration
- removed tegra30-vi/vip and used tegra20 fallback
- added separate csi schema for tegra20-csi and tegra30-csi
- fixet number of VI channels
- adjusted tegra_vi_out naming
- fixed yuv_input_format to main_input_format
- MIPI calibration refsctored for Tegra114+ and added support for
  pre-Tegra114 to use CSI as a MIPI calibration device
- switched ENOMEM to EBUSY
- added check into tegra_channel_get_remote_csi_subdev
- moved avdd-dsi-csi-supply into CSI
- next_fs_sp_idx > next_fs_sp_value
- removed host1x_syncpt_incr from framecounted syncpoint
- csi subdev request moved before frame cycle

Changes in v3:
- tegra20 and tegra30 csi schema merged
- removed unneeded properties and requirements from schema
- improved vendor specific properties description
- added tegra20 csus parent mux
- improved commit descriptions
- redesigned MIPI-calibration to expose less SoC related data into header
- commit "staging: media: tegra-video: csi: add support for SoCs with integrated
  MIPI calibration" dropped as unneeded
- improved tegra_channel_get_remote_device_subdev logic
- avdd-dsi-csi-supply moved from vi to csi for p2597 and p3450-0000
- software syncpoint counters switched to direct reading
- adjusted planar formats offset calculation

Changes in v4:
- removed ifdefs from tegra_mipi_driver
- document Tegra132 MIPI calibration device
- switched to use BIT macro in tegra114-mipi
- pinctrl changes moved to a separate patch
- ERESTARTSYS workaround preserved for now
- tegra_mipi_add_provider replaced with devm_tegra_mipi_add_provider
- reworked bytesperline and sizeimage calculaion
---

Svyatoslav Ryhel (24):
  pinctrl: tegra20: register csus_mux clock
  clk: tegra: set CSUS as vi_sensor's gate for Tegra20, Tegra30 and
    Tegra114
  dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
  clk: tegra30: add CSI pad clock gates
  dt-bindings: display: tegra: document Tegra30 VI and VIP
  staging: media: tegra-video: expand VI and VIP support to Tegra30
  staging: media: tegra-video: vi: adjust get_selection op check
  staging: media: tegra-video: vi: add flip controls only if no source
    controls are provided
  staging: media: tegra-video: csi: move CSI helpers to header
  gpu: host1x: convert MIPI to use operation function pointers
  dt-bindings: display: tegra: document Tegra132 MIPI calibration device
  staging: media: tegra-video: vi: improve logic of source requesting
  staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to
    CSI
  arm64: tegra: move avdd-dsi-csi-supply into CSI node
  staging: media: tegra-video: tegra20: set correct maximum width and
    height
  staging: media: tegra-video: tegra20: add support for second output of
    VI
  staging: media: tegra-video: tegra20: adjust format align calculations
  staging: media: tegra-video: tegra20: set VI HW revision
  staging: media: tegra-video: tegra20: increase maximum VI clock
    frequency
  staging: media: tegra-video: tegra20: expand format support with
    RAW8/10 and YUV422/YUV420p 1X16
  staging: media: tegra-video: tegra20: adjust luma buffer stride
  dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
  ARM: tegra: add CSI nodes for Tegra20 and Tegra30
  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30

 .../display/tegra/nvidia,tegra114-mipi.yaml   |   1 +
 .../display/tegra/nvidia,tegra20-csi.yaml     | 135 +++
 .../display/tegra/nvidia,tegra20-vi.yaml      |  19 +-
 .../display/tegra/nvidia,tegra20-vip.yaml     |   9 +-
 arch/arm/boot/dts/nvidia/tegra20.dtsi         |  19 +-
 arch/arm/boot/dts/nvidia/tegra30.dtsi         |  24 +-
 .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi |   4 +-
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   |   4 +-
 drivers/clk/tegra/clk-tegra114.c              |   7 +-
 drivers/clk/tegra/clk-tegra20.c               |  20 +-
 drivers/clk/tegra/clk-tegra30.c               |  21 +-
 drivers/gpu/drm/tegra/dsi.c                   |   1 +
 drivers/gpu/host1x/Makefile                   |   1 +
 drivers/gpu/host1x/mipi.c                     | 525 ++----------
 drivers/gpu/host1x/tegra114-mipi.c            | 483 +++++++++++
 drivers/pinctrl/tegra/pinctrl-tegra20.c       |  11 +-
 drivers/staging/media/tegra-video/Makefile    |   1 +
 drivers/staging/media/tegra-video/csi.c       |  70 +-
 drivers/staging/media/tegra-video/csi.h       |  16 +
 drivers/staging/media/tegra-video/tegra20.c   | 808 +++++++++++++++---
 drivers/staging/media/tegra-video/vi.c        |  56 +-
 drivers/staging/media/tegra-video/vi.h        |   6 +-
 drivers/staging/media/tegra-video/video.c     |   8 +-
 drivers/staging/media/tegra-video/vip.c       |   4 +-
 include/dt-bindings/clock/tegra30-car.h       |   3 +-
 include/linux/host1x.h                        |  10 -
 include/linux/tegra-mipi-cal.h                |  57 ++
 27 files changed, 1651 insertions(+), 672 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
 create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
 create mode 100644 include/linux/tegra-mipi-cal.h

-- 
2.48.1


