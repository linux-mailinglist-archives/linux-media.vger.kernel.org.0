Return-Path: <linux-media+bounces-55181-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLCtHKcvsGlHgwIAu9opvQ
	(envelope-from <linux-media+bounces-55181-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 15:50:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DC7252783
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 15:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF8473260DA6
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 13:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0BA6313E32;
	Tue, 10 Mar 2026 13:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="BJEhBGu7"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88E31A046
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 13:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773150313; cv=pass; b=lZEApII/NHxXXkCfV/zTCPQ96jmnebyQgEV6gV8CAkljFF51OSClP/zXTxlGcb2F99AEFL1DT2zm8CymjaNkJTPm92/W5AwBMvqwKNR3ri1zEq1yLvgW6kkdU6V5ftXiSzduvbhtAQ7BBYEVyJ1a+2zHrkRwE2V4/NOq95yH0n4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773150313; c=relaxed/simple;
	bh=H14oqF9ff7quUNusx5wNd0HNwPh5rtVfLBSzWw6e+dU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TCR+KN+KGopdpX7OboAEv2kl8kqg0xKb1dUOGpcZa54Ys2pFjKjMY+EnxmTRWhwF1dunZAOS4HZ2XSP8Ve+4if1TdbtnDISw721C/H52EeB7CE+jr1fDvqZTZI9Dt3iOvB6mszHQqE6x09Q6IhrFJYIlTu54yS4sgUZDWve5FWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=BJEhBGu7; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotp5c1dsf-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:1157:8c0f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fVZrP4vjmzyTs;
	Tue, 10 Mar 2026 15:45:09 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1773150309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=j48G2OLfGK/dke/2mjRmBC0o58JD+XrPbCBqxvD+n48=;
	b=BJEhBGu7VEfifBier8i9YUvCQFen0Ik0XMguhkoJNxKDC1l3jHGp4D1tUwWeNrxCpiNays
	xDzs/CHnLS0RZ+B4l9QbMOTRqYlvuDnGSqNfiZEypE1HTasr1s0MBMn4J32apPofOqpTxH
	qPGVJ8I8WLagRKP4Wv+wEdre4Lo+DwM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1773150309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=j48G2OLfGK/dke/2mjRmBC0o58JD+XrPbCBqxvD+n48=;
	b=NAzai34JBExOBD7v1s9G1MXmun/ud4e+EwLEtS2LWoYR/8Revg8cOCd40d/rT3gHogTprJ
	oDXrzYNF0bKYWMk71aXbXufho6wFrOb9Ta+UMS5ncvWW/PPbn416pBlIVMdiV/KvSNXhCu
	iG5nIZYKuOMs3dT5wjsfZMIhP/qeNVA=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1773150309;
	b=CNCmGN9/2eoPTQmBnTTdUohKXJyoI6ntQTOqm5f1ukUDSGL46fiuaF9iFYd+DgeVIwalcX
	N5IjuZuXTVUCTtyj8oLpxaB/xW8vwCnF8LL5y7kXSZkMYOUoDGtG5tfSxy89NMlweBZ9h3
	g5Tq419M6J4Eoos0M1Nd+PL2IUJsZrQ=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 37F71634C50;
	Tue, 10 Mar 2026 15:45:09 +0200 (EET)
Date: Tue, 10 Mar 2026 15:45:09 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 7.1] V4L2 cleanup, fixes, improvements
Message-ID: <abAgZWlNRTIDMFda@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: E2DC7252783
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-55181-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[iki.fi];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,iki.fi:dkim,valkosipuli.retiisi.eu:mid]
X-Rspamd-Action: no action

Hi Hans, Mauro,

Please pull.


The following changes since commit a7da7fb57f2a787412da1a62292a17fa00fbfbdf:

  Merge tag 'v7.0-rc2' into __tmp-hverkuil-media-tags_br_v7_1a (2026-03-05 10:55:47 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-7.1-1.1-signed

for you to fetch changes up to 621887bc7b9a6c37a5ed3b1f24dd446e3034253e:

  staging: media: ipu3: fix function argument alignment (2026-03-10 13:07:48 +0200)

----------------------------------------------------------------
V4L2 patches for v7.1:
- Fixes and improvements to imx412, ds90ub960, rcar, exynos4-is, dcmi,
  ov9282, rkcif, synopsys hdmirx, synopsys csi2rx, omap3isp, ipu3-imgu,
  ipu6 and ov5647, max9286, imx283, og01a1b, imx355, atomisp, mt9p031,
  vgxy61 and ar0521 drivers and CCS PLL
- Add more systems to IPU bridge quirk list for upside-down sensors
- Add support for ov5675 in IPU bridge
- Add support for DS90UB954-Q1 serdes device and mi1040 camera sensor
- Add v4l2_subdev_get_frame_desc_passthrough() helper
- Drop starfive-camss staging drive

----------------------------------------------------------------
Alain Volmat (10):
      media: stm32: dcmi: Switch from __maybe_unused to pm_ptr()
      media: stm32: dcmi: perform dmaengine_slave_config at probe
      media: stm32: dcmi: only create dma descriptor once at buf_prepare
      media: stm32: dcmi: stop the dma transfer on overrun
      media: stm32: dcmi: rework spin_lock calls
      media: stm32: dcmi: perform all dma handling within irq_thread
      media: stm32: dcmi: use dmaengine_terminate_async in irq context
      media: stm32: dcmi: continuous mode capture in JPEG
      dt-bindings: media: st: dcmi: add DMA-MDMA chaining properties
      media: stm32: dcmi: addition of DMA-MDMA chaining support

Alexander Shiyan (1):
      media: ccs-pll: Fix pre-PLL divider calculation for EXT_IP_PLL_DIVIDER flag

Chen Ni (4):
      media: i2c: imx219: Check return value of devm_gpiod_get_optional() in imx219_probe()
      media: i2c: mt9p031: Check return value of devm_gpiod_get_optional() in mt9p031_probe()
      media: i2c: vgxy61: Check return value of devm_gpiod_get_optional() in vgxy61_probe()
      media: i2c: ar0521: Check return value of devm_gpiod_get_optional() in ar0521_probe()

Dan Carpenter (1):
      media: rockchip: rkcif: fix off by one bugs

Dang Huynh (1):
      media: rockchip: rkcif: Add missing MUST_CONNECT flag to pads

Dmitry Torokhov (1):
      media: i2c: max9286: normalize return value of gpio_get

Ethan Nelson-Moore (1):
      media: remove unnecessary module_init/exit functions

Ethan Tidmore (1):
      media: intel/ipu6: fix error pointer dereference

Geert Uytterhoeven (1):
      media: synopsys: VIDEO_DW_MIPI_CSI2RX should depend on ARCH_ROCKCHIP

Hans de Goede (1):
      media: ipu-bridge: Add upside-down sensor DMI quirk for Dell XPS 13 9340 and XPS 14 9440

Haoxiang Li (1):
      media: omap3isp: drop the use count of v4l2 pipeline

Jai Luthra (4):
      media: staging: Drop starfive-camss from staging
      media: dt-bindings: Drop starfive,jh7110-camss from staging
      media: i2c: imx283: Enter full standby when stopping streaming
      media: i2c: imx283: Fix hang when going from large to small resolution

Krzysztof Kozlowski (1):
      media: samsung: exynos4-is: Simplify with scoped for each OF child loop

Leif Skunberg (1):
      media: ipu-bridge: Add OV5675 sensor config

Mark Brown (1):
      media: synopsys: hdmirx: support use with sleeping GPIOs

Michael Riesch (1):
      media: rockchip: rkcif: comply with minimum number of buffers requirement

Omer El Idrissi (1):
      staging: media: ipu3: fix function argument alignment

Richard Acayan (3):
      dt-bindings: media: qcom,sdm670-camss: Remove clock-lanes requirement
      dt-bindings: media: i2c: Add Sony IMX355
      media: i2c: imx355: Support devicetree and power management

Sakari Ailus (1):
      staging: media: atomisp: Disallow all private IOCTLs

Svyatoslav Ryhel (2):
      dt-bindings: media: mt9m114: document MI1040 sensor
      media: i2c: mt9m114: add support for Aptina MI1040

Tomi Valkeinen (8):
      media: rcar-isp: Improve ISPPROCMODE_DT_PROC_MODE_VC
      media: rcar-csi2: Improve FLD_FLD_EN macros
      media: rcar-csi2: Move rcsi2_calc_mbps()
      media: rcar-csi2: Simplify rcsi2_calc_mbps()
      media: rcar-csi2: Optimize rcsi2_calc_mbps()
      media: subdev: Add v4l2_subdev_get_frame_desc_passthrough helper
      media: i2c: ds90ub953: Use v4l2_subdev_get_frame_desc_passthrough
      media: i2c: ds90ub913: Use v4l2_subdev_get_frame_desc_passthrough

Vladimir Zapolskiy (6):
      media: i2c: og01a1b: Fix V4L2 subdevice data initialization on probe
      media: i2c: og01a1b: Switch from .s_stream to .enable_streams/.disable_streams
      media: i2c: og01a1b: Change I2C interface controls to V4L2 CCI
      media: i2c: og01a1b: Replace .open with .init_state internal ops
      media: i2c: og01a1b: Use generic v4l2_subdev_get_fmt() to get format
      media: i2c: og01a1b: Add support of 8-bit media bus format

Wenmeng Liu (2):
      media: i2c: imx412: Assert reset GPIO during probe
      media: i2c: imx412: Extend the power-on waiting time

Xiaolei Wang (4):
      media: i2c: ov9282: Convert to CCI register access helpers
      media: i2c: ov9282: Switch to using the sub-device state lock
      media: i2c: ov9282: switch to {enable,disable}_streams
      media: i2c: ov5647: Fix runtime PM refcount leak in s_ctrl

Yemike Abhilash Chandra (4):
      media: dt-bindings: ti,ds90ub960: Refactor port definitions
      media: i2c: ds90ub960: Use enums for chip type and chip family
      media: dt-bindings: ti,ds90ub960: Add support for DS90UB954-Q1
      media: i2c: ds90ub960: Add support for DS90UB954-Q1

Ziyi Guo (1):
      media: i2c: imx258: add missing mutex protection for format code access

 Documentation/admin-guide/media/starfive_camss.rst |  72 --
 .../admin-guide/media/starfive_camss_graph.dot     |  12 -
 Documentation/admin-guide/media/v4l-drivers.rst    |   1 -
 .../bindings/media/i2c/onnn,mt9m114.yaml           |   4 +-
 .../devicetree/bindings/media/i2c/sony,imx355.yaml | 111 +++
 .../bindings/media/i2c/ti,ds90ub960.yaml           | 213 ++---
 .../bindings/media/qcom,sdm670-camss.yaml          |   3 -
 .../devicetree/bindings/media/st,stm32-dcmi.yaml   |  11 +-
 .../bindings/media/starfive,jh7110-camss.yaml      | 180 -----
 MAINTAINERS                                        |   9 -
 drivers/media/common/b2c2/flexcop.c                |  14 -
 drivers/media/common/saa7146/saa7146_fops.c        |  13 -
 drivers/media/i2c/Kconfig                          |   6 +-
 drivers/media/i2c/ar0521.c                         |   3 +
 drivers/media/i2c/ccs-pll.c                        |   5 +-
 drivers/media/i2c/ds90ub913.c                      |  59 +-
 drivers/media/i2c/ds90ub953.c                      |  61 +-
 drivers/media/i2c/ds90ub960.c                      | 216 +++--
 drivers/media/i2c/imx219.c                         |   3 +
 drivers/media/i2c/imx258.c                         |  14 +-
 drivers/media/i2c/imx283.c                         |  15 +-
 drivers/media/i2c/imx355.c                         | 111 ++-
 drivers/media/i2c/imx412.c                         |   8 +-
 drivers/media/i2c/max9286.c                        |   2 +-
 drivers/media/i2c/mt9m114.c                        |  35 +-
 drivers/media/i2c/mt9p031.c                        |   4 +
 drivers/media/i2c/og01a1b.c                        | 899 ++++++++++-----------
 drivers/media/i2c/ov5647.c                         |  12 +-
 drivers/media/i2c/ov9282.c                         | 679 ++++++----------
 drivers/media/i2c/vgxy61.c                         |   3 +
 drivers/media/pci/intel/ipu-bridge.c               |  16 +
 drivers/media/pci/intel/ipu6/ipu6.c                |   2 +-
 drivers/media/platform/renesas/rcar-csi2.c         | 116 +--
 drivers/media/platform/renesas/rcar-isp/csisp.c    |  13 +-
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   |  10 +-
 .../platform/rockchip/rkcif/rkcif-interface.c      |   3 +-
 .../media/platform/rockchip/rkcif/rkcif-stream.c   |  46 +-
 .../media/platform/samsung/exynos4-is/fimc-is.c    |   5 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c       | 475 +++++++----
 drivers/media/platform/synopsys/Kconfig            |   1 +
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   |   6 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c      |   1 +
 drivers/media/usb/gspca/gspca.c                    |  13 -
 drivers/media/v4l2-core/v4l2-subdev.c              | 113 +++
 drivers/staging/media/Kconfig                      |   2 -
 drivers/staging/media/Makefile                     |   1 -
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |   4 +
 drivers/staging/media/ipu3/ipu3.c                  |   2 +-
 drivers/staging/media/starfive/Kconfig             |   5 -
 drivers/staging/media/starfive/Makefile            |   2 -
 drivers/staging/media/starfive/camss/Kconfig       |  18 -
 drivers/staging/media/starfive/camss/Makefile      |  13 -
 drivers/staging/media/starfive/camss/TODO.txt      |   4 -
 drivers/staging/media/starfive/camss/stf-camss.c   | 438 ----------
 drivers/staging/media/starfive/camss/stf-camss.h   | 134 ---
 drivers/staging/media/starfive/camss/stf-capture.c | 605 --------------
 drivers/staging/media/starfive/camss/stf-capture.h |  86 --
 .../staging/media/starfive/camss/stf-isp-hw-ops.c  | 445 ----------
 drivers/staging/media/starfive/camss/stf-isp.c     | 379 ---------
 drivers/staging/media/starfive/camss/stf-isp.h     | 428 ----------
 drivers/staging/media/starfive/camss/stf-video.c   | 570 -------------
 drivers/staging/media/starfive/camss/stf-video.h   | 100 ---
 include/media/v4l2-subdev.h                        |  22 +
 63 files changed, 1788 insertions(+), 5068 deletions(-)
 delete mode 100644 Documentation/admin-guide/media/starfive_camss.rst
 delete mode 100644 Documentation/admin-guide/media/starfive_camss_graph.dot
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
 delete mode 100644 drivers/staging/media/starfive/Kconfig
 delete mode 100644 drivers/staging/media/starfive/Makefile
 delete mode 100644 drivers/staging/media/starfive/camss/Kconfig
 delete mode 100644 drivers/staging/media/starfive/camss/Makefile
 delete mode 100644 drivers/staging/media/starfive/camss/TODO.txt
 delete mode 100644 drivers/staging/media/starfive/camss/stf-camss.c
 delete mode 100644 drivers/staging/media/starfive/camss/stf-camss.h
 delete mode 100644 drivers/staging/media/starfive/camss/stf-capture.c
 delete mode 100644 drivers/staging/media/starfive/camss/stf-capture.h
 delete mode 100644 drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
 delete mode 100644 drivers/staging/media/starfive/camss/stf-isp.c
 delete mode 100644 drivers/staging/media/starfive/camss/stf-isp.h
 delete mode 100644 drivers/staging/media/starfive/camss/stf-video.c
 delete mode 100644 drivers/staging/media/starfive/camss/stf-video.h

-- 
Sakari Ailus

