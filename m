Return-Path: <linux-media+bounces-45244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50168BFC749
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09F8219A3714
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 14:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E532734C15D;
	Wed, 22 Oct 2025 14:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2vUu9hJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB6F346E5B
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 14:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142887; cv=none; b=o4nW6OVkxwgLeoJe0jtZ2bT9dWvYgOnEVhIzoqccEe8qfxgFxAw8Ku9RI+UVGDLK79hSnWPLrUrbu27skhD9KBW/JnCmqtNFvumTMJyEqquo4EAuJbXATe8kGbNUYq0t/v9HjqEjHnuG7NmXwMiMaZTuGA9pSXdgocsd5YACuy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142887; c=relaxed/simple;
	bh=F4SZ1baug0sKLNcK5yOAX/0o6/XwYc3DKBWTYRocoIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AiZewqe4kDzNkATM1i1wbXOkR5qhIAsIj5u0KmoFi4dlhmf5iBKSpxD2vAouYyk3fSbm16ePLv4YwWH6f/hXe1ya1hfTQY/2rMmJvtGLRkN+M4z8VG2k3JZa7NSu1UfS7807y8umSO61+/sKMoOzr2Cte7U6ZnTudo+I/eAf2hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2vUu9hJ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-426ed6f4db5so614408f8f.0
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 07:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142883; x=1761747683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1avBMUdXWZmaUoFxmEEoaqQEQTtmqca+2N7SyFudkqM=;
        b=c2vUu9hJeix3JnCsT6YjMeVWiNXJtiWBGRG8qWh/zIh9TKyXD6HPO+1L7ozUr/KhNx
         YB+8Qs9qxDxbCVWVYgvckt0KEktrpu13XvHfMNNcO1U6uYGUFmJ1PAh47ogoAwQENKFR
         c85VsAQSgw4VB2UnLYoOMTAEtD56EhyouUXMbgAsQZ6nw3Uu8lyHCMzmlKncUi+zQU/8
         WjArXmViaYnPUaXOjtv85is7xQnfQPNv5ACRfuZV9gsElpVFmMwtO4muVc0RmjazGT07
         79BZt1ZDJM9ilho9rG6iar6V0iPcP8FJngtHm1Hul+0OlNVXWkZ/g4N+E61ZOsAPjJcK
         QW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142883; x=1761747683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1avBMUdXWZmaUoFxmEEoaqQEQTtmqca+2N7SyFudkqM=;
        b=U758WTjlRnXAAfa/Nnh6ZKfByje8GYUniBUMP6pCXebf6k8b+IbzfTRr7E9sNlTiMR
         FJZeUOQUSFVNBG6dIox70706KKz/+0+1sjgfIPPIzOmTDlht5VauxrYYg9WnKVSPeId5
         PMKRmb4I9l0oasbY8KJ59k9CYzhTbMgGFOyQ1bNuPy00Tc7FFrhAXfwDuEZiahzXpmT5
         StMbhK0xiQGtRWa7d1qHvfuyRmc4iU+ALln4RWZIZnuvuSEGae4jDa5swh0eUBvV+KFj
         rYS+c57gSTwA8KN9DbAk20YGhyW2F4YP6ISXGnWjtDNSi6nUlpSXQhUFWLQGe3rBqyBy
         k7nw==
X-Forwarded-Encrypted: i=1; AJvYcCVgDP/8XNmcjwYeYXMegGR8mV95q5ka8l3ZUqhyJR+86rmAv6nKYnyLQANVr930wY/8I6raqNk1HleXZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy80zNrbKKoj0XvKZzWSqkrFDsUDMpKEErYfga1LgBiZJu+ZI4F
	1w8/sjzorBM1Sd3Qo05EMPW7+yHMypQMHlQGGOisrdkeJIboWkvPWuji
X-Gm-Gg: ASbGncs6qcmPM1gwd6HKAcbDQLikWpaTvz1NGBortT/Oi6fyBJLul9cisc0sqjfE9L4
	B3hJZDsqQi3vxII//cSVFzNlWp12CCxi2P7OWZc/lxxZWxllkPy8FQyWuEmyb1vWl8TkSMYMDL/
	BtaZsWghcLaK6PaGsjpPB83P92W3Nq0hduxWsxPVyY4YmH4xHYoRNy2EfBof7n/TrrpEieFjMtd
	aDT3mfRYDVCV2i3kKOPBlGh4f1WSSpkDsUaiVjpuIK7hyOTcvsprgDIYvREMMtrHz6yOrJPWi+B
	nC5JUML/l4wdAG85j5X9M1bQLimcRT0PXliT2Ab9qWXsf00Z8WcY6KEMhC1V1pHcn0P+T/pRfE4
	/ZE5jy4DHvC85M9to37DzUliAAn518mDzPtE+zOmcG5gezAFhpzRkmvqlvjx/fZQDld4=
X-Google-Smtp-Source: AGHT+IHhr40J7G357dorY7Ys4aV/f4VaCpjaK0a7rQ8N7yN/NLKDGy/LC+abGelcIoYIH1Dx+M00ng==
X-Received: by 2002:a05:6000:2c01:b0:401:2cbf:ccad with SMTP id ffacd0b85a97d-42856a6ac39mr1320405f8f.17.1761142882543;
        Wed, 22 Oct 2025 07:21:22 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:22 -0700 (PDT)
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
	linux-staging@lists.linux.dev
Subject: [PATCH v5 00/23] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Wed, 22 Oct 2025 17:20:28 +0300
Message-ID: <20251022142051.70400-1-clamor95@gmail.com>
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

Changes in v5:
- dropped patch 1/24 of v4 since it was picked to pinctrl tree
- added reasoning for tegra132 comaptible into commit desctiption
- moved clocks into common section in tegra20-csi schema
- added note regarding ERESTARTSYS
---

Svyatoslav Ryhel (23):
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
 .../display/tegra/nvidia,tegra20-csi.yaml     | 138 +++
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
 drivers/gpu/host1x/mipi.c                     | 525 ++---------
 drivers/gpu/host1x/tegra114-mipi.c            | 483 +++++++++++
 drivers/staging/media/tegra-video/Makefile    |   1 +
 drivers/staging/media/tegra-video/csi.c       |  70 +-
 drivers/staging/media/tegra-video/csi.h       |  16 +
 drivers/staging/media/tegra-video/tegra20.c   | 820 +++++++++++++++---
 drivers/staging/media/tegra-video/vi.c        |  56 +-
 drivers/staging/media/tegra-video/vi.h        |   6 +-
 drivers/staging/media/tegra-video/video.c     |   8 +-
 drivers/staging/media/tegra-video/vip.c       |   4 +-
 include/dt-bindings/clock/tegra30-car.h       |   3 +-
 include/linux/host1x.h                        |  10 -
 include/linux/tegra-mipi-cal.h                |  57 ++
 26 files changed, 1657 insertions(+), 670 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
 create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
 create mode 100644 include/linux/tegra-mipi-cal.h

-- 
2.48.1


