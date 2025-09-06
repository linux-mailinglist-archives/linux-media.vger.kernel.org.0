Return-Path: <linux-media+bounces-41886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CC6B46F31
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 15:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02B6C5A24B3
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 13:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14642F1FF4;
	Sat,  6 Sep 2025 13:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjOCrwVL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4122EDD41;
	Sat,  6 Sep 2025 13:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166846; cv=none; b=Vxa5j4zgl8WZssqUhJe4aJTwyTPT8NtyhktEaMcNILcG+F4pqbv3aWN3kSucCkt6OiB6m9sWXV3Onk82LogP6VDbuZ6tWPQb38SPgK/PLFPDhxGJnmacKARvuRRk2XRmVkq7fHeOLlbWNrZUf5oFKAy/mCDXt2KO9h0oTrCQeSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166846; c=relaxed/simple;
	bh=xkEfL9tKyJ9u5IYJCzBGBFDRUqugpsZZtkBEdlAkPOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i32W1bRDQfqzMPQI7FHwBk8mZF6ifA0KY4ZHN9vbBBr9/btkN/W6xpdOgIt/RSe0h2l/0Fmf71/28Fpm50eEnZHjYENZYDWmleXfUBvPzakGhW6GmLS+f/G7IbHPBzkrXY636Cdf3L6bYzYHJtSFFqhYzCuhl2kxITt6er9AQHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjOCrwVL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f6186cc17so2893286e87.2;
        Sat, 06 Sep 2025 06:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166842; x=1757771642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UPNxUXPxSXFgZu+p4pJj6Pw9/UY7PSbv42TZPM74sbk=;
        b=cjOCrwVLh52m0qRfZde/AInIk0yPgSS33m8FaYmN8Uhdo4pb3vo/qxZrIqHNl4Bn+b
         HgjXyKd8C4KAlTXfPQ8xyxvpxdXIu5THwDZfGMqXwNcEsPL6QHdK0/TmsTGmmoIJfJ1v
         2jl/n8XXulCteLiRQIp+b9vCEXObqxxgaYofiM54wzBLJJhxHsRfs43WOozi6nIOeGaN
         E7YScw5BkTmjHUj/qe0DhqlyHBWCAMspHTwp7dhyiV9yijqp+BM8U4nAvtF2z2kdjLIp
         lSfPg5V9w4Sc/jyG+1C7NOPwqtgCnm/B/33Oq/7RJSdxJ5vl9j8zhGlTAXWSRCpKHc6f
         mawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166842; x=1757771642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPNxUXPxSXFgZu+p4pJj6Pw9/UY7PSbv42TZPM74sbk=;
        b=uk+a0qBTNOZwEPitzpiN/SIBbFuZqA0+Hg7nsbPCuSbjfAxnOSJu8Tsm8MZNov89hq
         2rTMgtsfRmhqDq8IRxbhQXQ0CtK2aH7Ra9AIVsMSWpN4thuNbEj3LetKhXagmYStZs87
         R26w4ezAu+F9hwPB+aqo4NM1q0vUjp9nBI5gWBJt/Rpns5ZvTz7R5D/CiHg1S5A6b82r
         1mH2u7SULmPu3qo3tO1ws+5RCNh3pCZBAlPK93GpNzb/xdhR+iARIKDusAT9p6y98+4n
         TWyphZi+w4mJvXemdCclDOD7UxG1JPPiu88Gtz/0BAajyY/EC2Frdzss+ufQMiZ5xffh
         0ROQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa/uJFRR1MA0+mMBlxwGfAVGhlVcDiS17zyE7vdzT6HnUMlwqZjWNbvgn2EtoOwg0qwBYJ1Kde4s3W@vger.kernel.org, AJvYcCUeASV2QOewOyoly7dhRJBscOaNmbVi0ce3edyZ6EHKr1U+r3Uz7ggg5G4OBmNbwIzRR/bxcx2uJcf/@vger.kernel.org, AJvYcCViW6fQ5iNAVrtKmBlWmnLN7XOT2xdvnCcWX+EBTqbw1vVPeiWupm6NNbDjWGZ9BgEgHOwMrrdV1t0TAjQ=@vger.kernel.org, AJvYcCW84PslNm0o0OD7nsGHp85xI7O7m5MEzBVo1fcLah5jXSQO388e210AdcWRid3Kv7GYV/Y9hjixQqVC4l7g@vger.kernel.org, AJvYcCWQBeFSZgvRdq6V/oQVfuOOEOlCaF9TY0JIX3+8kGEQcPmQy4fCIOCLZXRPxyoXCLTmQaqTPagsRdKxC7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+VqqsNDgV6F8ntemJsMnOrN1pwUxWg/dcvHbVfcZKkj61Oi7c
	8/CoA+DtSXEQfDSd2QQZE58lNC9aINICQwOZUKHEcKZRgwB3/Kg4tPp4
X-Gm-Gg: ASbGncv6+TZzbWQ6tgVIdy294fM42r7EjKwGNZTQ0Y5xYzflYvGuQoUi+Gwye4Ss+Kd
	AiqRYIGyT4qKSg4by/VYn9QJUldRVdW16gDYjYA4i0267mbtLmF8hrcoDttaWRUGmNENB+7bw8+
	tc9afBv4Tu1CbXyIeiCyjTYeGd0MszhZ6jx/gK61Ugejo8P09yTgRinGBTLoGnuDLnvILpOQK6u
	gbHsoZ/F7l/hk8vHBEuED+GvnsCFXkeI75Sdx4wIq/68013a61tu3BLl6A1Mh5m1TSZ38MMpvDY
	dhjjmpn4PpCxMSe9exptjkcboYjTztCY17dji+bnZPHZECNCsEzUDti4foGDz8hyfWrrNnNVFvN
	wvoN6KRo65sj1W98exa8t0bcw
X-Google-Smtp-Source: AGHT+IESUrWBV6x89XWvgKOIImpxLehwahZXu+FMNGClISAqT36rK28RionSJf7lu3R6CGsKWJwi9w==
X-Received: by 2002:a05:6512:2212:b0:55f:3658:c3c3 with SMTP id 2adb3069b0e04-5626425c636mr724355e87.47.1757166842149;
        Sat, 06 Sep 2025 06:54:02 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:01 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 00/23] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Sat,  6 Sep 2025 16:53:21 +0300
Message-ID: <20250906135345.241229-1-clamor95@gmail.com>
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
---

Svyatoslav Ryhel (23):
  clk: tegra: set CSUS as vi_sensors gate for Tegra20, Tegra30 and
    Tegra114
  dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
  clk: tegra30: add CSI pad clock gates
  dt-bindings: display: tegra: document Tegra30 VI and VIP
  staging: media: tegra-video: expand VI and VIP support to Tegra30
  staging: media: tegra-video: vi: adjust get_selection op check
  staging: media: tegra-video: vi: add flip controls only if no source
    controls are provided
  staging: media: tegra-video: csi: move CSI helpers to header
  gpu: host1x: convert MIPI to use operations
  staging: media: tegra-video: csi: add support for SoCs with integrated
    MIPI calibration
  staging: media: tegra-video: csi: add a check to
    tegra_channel_get_remote_csi_subdev
  dt-bindings: display: tegra: move avdd-dsi-csi-supply from VI to CSI
  staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to
    CSI
  staging: media: tegra-video: tegra20: set correct maximum width and
    height
  staging: media: tegra-video: tegra20: add support for second output of
    VI
  staging: media: tegra-video: tegra20: simplify format align
    calculations
  staging: media: tegra-video: tegra20: set VI HW revision
  staging: media: tegra-video: tegra20: increase maximum VI clock
    frequency
  staging: media: tegra-video: tegra20: expand format support with
    RAW8/10 and YUV422 1X16
  staging: media: tegra-video: tegra20: adjust luma buffer stride
  dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
  ARM: tegra: add CSI nodes for Tegra20 and Tegra30
  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30

 .../display/tegra/nvidia,tegra20-csi.yaml     | 104 +++
 .../display/tegra/nvidia,tegra20-vi.yaml      |  22 +-
 .../display/tegra/nvidia,tegra20-vip.yaml     |   9 +-
 .../display/tegra/nvidia,tegra210-csi.yaml    |   3 +
 .../display/tegra/nvidia,tegra30-csi.yaml     | 115 +++
 arch/arm/boot/dts/nvidia/tegra20.dtsi         |  19 +-
 arch/arm/boot/dts/nvidia/tegra30.dtsi         |  24 +-
 drivers/clk/tegra/clk-tegra114.c              |   7 +-
 drivers/clk/tegra/clk-tegra20.c               |   7 +-
 drivers/clk/tegra/clk-tegra30.c               |  21 +-
 drivers/gpu/drm/tegra/dsi.c                   |   1 +
 drivers/gpu/host1x/mipi.c                     |  58 +-
 drivers/staging/media/tegra-video/Makefile    |   1 +
 drivers/staging/media/tegra-video/csi.c       |  66 +-
 drivers/staging/media/tegra-video/tegra20.c   | 793 +++++++++++++++---
 drivers/staging/media/tegra-video/tegra210.c  |   2 +-
 drivers/staging/media/tegra-video/vi.c        |  54 +-
 drivers/staging/media/tegra-video/vi.h        |   9 +-
 drivers/staging/media/tegra-video/video.c     |   8 +-
 drivers/staging/media/tegra-video/vip.c       |   4 +-
 include/dt-bindings/clock/tegra30-car.h       |   3 +-
 include/linux/host1x.h                        |  10 -
 .../csi.h => include/linux/tegra-csi.h        |  18 +
 include/linux/tegra-mipi-cal.h                | 143 ++++
 24 files changed, 1269 insertions(+), 232 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml
 rename drivers/staging/media/tegra-video/csi.h => include/linux/tegra-csi.h (88%)
 create mode 100644 include/linux/tegra-mipi-cal.h

-- 
2.48.1


