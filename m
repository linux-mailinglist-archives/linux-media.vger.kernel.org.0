Return-Path: <linux-media+bounces-40721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CFFB31066
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 09:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 573F13AC327
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 07:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E59C2EAB93;
	Fri, 22 Aug 2025 07:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="V7omne0H"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0DB2E9731
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 07:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755847647; cv=pass; b=sW+JVrLS+CVpogTRPewKomzcnu4/kNkYXYVTXg9RjRmUSJs8PJ0+Zo79x1ebW6rdgdE8WvlZVJ4P6kiahjjDBYJhFbClNOdgFCZYw8CnNNaEA6ajM/1FxuvNZCyXoXPKn5c2tT8nI2sJ1BZ0Kww2D+U0GnAnzLWGd57an2+YptM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755847647; c=relaxed/simple;
	bh=5y6zYFt3rXDG2hw72xYXkkd1xXhnoZ0hIJrdaA4b88I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cF7TVlGgY4zfxRGtxRoZXs7FpMyPZEbcQO53KbJbzUup0oqHFWHezlKaP9/DLL13nMHexZhuO2JE4lK9mSNHhRImBi/+GuF8x+N5atixtCu/l851Wro3ErCDZXfKeD5ctBewQ0sGwSqK4KZr2FO1LEd748ijb7zOz/fVU9Pt5kE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=V7omne0H; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4c7Wwm310tzySG;
	Fri, 22 Aug 2025 10:27:20 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1755847640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r4oWu1Fz0c5A7Opb5GZjp08ePYbO/927mS+KOJV683Q=;
	b=V7omne0HHeORZtT5IgBcfFLdiU4fEmmaVdy1xZC0S4AdWLJMI/WEHvA0sbKOr/dV5qQMe2
	5WS888kLk2nYUsppte3LQFdo4wzMui+N/y3NTWtByTmPN9D4TUpPx30hrgcEykoPDFs4ag
	4ytFVSgLvMbqRUKKAAOCIFlByOJS2QA=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1755847640; a=rsa-sha256; cv=none;
	b=MscaBj8RXG5nZyvcTSFCZ8QstCJ9zj+X8/QVnxs9s04BTFTc+OM2FVJ2bCquxVj3RC8gvG
	d/YcohkfIl0JRGMx2XxieaW3+Vw7RN1f7t3F7/Hyqww6mEg10F1oRm9ROgrRcjvcNaMKbH
	xgTBADd2by2F1HXgxQ+D7cJz8Yum5gI=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1755847640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r4oWu1Fz0c5A7Opb5GZjp08ePYbO/927mS+KOJV683Q=;
	b=MphOwjBVcaLzeXZaXLCIc/Gc0cJWZ7nJVI+uEZXCNB5rl15MdPM22TcuziFFtDqVylPt+1
	6+lQ5nopQ9lHfbwd/88xEHO9R9xTIal9ivaaU9Nxz3jqEocPuu6BRq6cQaIm4Qm9EeAW8T
	HLy4N8D3Apc3HDxWUZgvsDnI9B/llcc=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6C23B634C98;
	Fri, 22 Aug 2025 10:27:19 +0300 (EEST)
Date: Fri, 22 Aug 2025 07:27:19 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 6.18] Sub-device driver, framework improvements
Message-ID: <aKgb1xsFRDw4tR61@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Hans, Mauro,

Here's a big bunch of fixes and other improvements. Included are sensor
(imx214, vd55g1, ov02c10, ov5648, imx296, imx334, mt9m114 and rj54n1cb0c),
serdes (ds90ub913), CSI-2 and parallel receiver (j721e-csi2rx, cdns-csi2rx,
rzg2l-cru, stm32-csi, ipu6, ipu7) driver fixes and cleanups, moving gc0310
out of staging, MC link validation fix (cc'd to stable), removing vimc bus
name setting, getting rid of v4l2_get_link_freq() on control handler
workaround, flagging buggy gpiod API usage in a few imx* drivers,
documentation cleanups as well as event subscription cleanups in a number
of drivers. Also included are a few MAINTAINERS updates.

Please pull.


The following changes since commit a75b8d198c55e9eb5feb6f6e155496305caba2dc:

  media: imon: Remove unused defines (2025-08-15 09:47:13 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.18-1.2-signed

for you to fetch changes up to 3e5dada5c202c47abe8e82b789526a2c0ccef37f:

  media: mc: Improve unconnected pads debugging message in link exploration (2025-08-22 10:24:54 +0300)

----------------------------------------------------------------
V4L2 patches for 6.18

----------------------------------------------------------------
André Apitzsch (5):
      media: i2c: imx214: Remove unneeded parentheses
      media: i2c: imx214: Drop dev argument from imx214_parse_fwnode()
      media: i2c: imx214: Use __free(fwnode_handle)
      media: i2c: imx214: Move imx214_pll_update to imx214_ctrls_init
      media: i2c: imx214: Separate legacy link frequency check from PLL calculation

Benjamin Mugnier (1):
      media: i2c: vd55g1: Fix duster register address

Biju Das (1):
      media: rzg2l-cru: Drop function pointer to configure CSI

Bingbu Cao (3):
      media: staging/ipu7: convert to use pci_alloc_irq_vectors() API
      media: staging/ipu7: Don't set name for IPU7 PCI device
      media: staging/ipu7: cleanup the MMU correctly in IPU7 driver release

Chandra Mohan Sundar (1):
      media: stm32-csi: Fix dereference before NULL check

Colin Ian King (1):
      media: i2c: ov5648: make read-only arrays regs and values static const

Hans de Goede (1):
      media: Move gc0310 sensor drivers to drivers/media/i2c/

Jai Luthra (6):
      media: ti: j721e-csi2rx: Use devm_of_platform_populate
      media: ti: j721e-csi2rx: Use fwnode_get_named_child_node
      media: ti: j721e-csi2rx: Fix source subdev link creation
      media: cadence: csi2rx: Implement get_fwnode_pad op
      media: cadence: cdns-csi2rx: Support multiple pixels per clock cycle
      media: ti: j721e-csi2rx: Support multiple pixels per clock

Julien Massot (1):
      media: i2c: vgxy61: Report stream using frame descriptors

Krzysztof Kozlowski (1):
      media: i2c: imx: Add note to prevent buggy code re-use

Laurent Pinchart (10):
      media: i2c: ds90ub913: Stop accessing streams configs directly
      media: staging/ipu7: Disallow source multiplexing
      media: v4l2-subdev: Make struct v4l2_subdev_stream_config private
      media: omap3isp: Drop custom .unsubscribe_event() handler
      media: staging: atomisp: Drop custom .unsubscribe_event() handler
      media: staging: imx: Drop custom .unsubscribe_event() handler
      media: ipu6: isys: Use v4l2_ctrl_subdev_subscribe_event()
      media: staging/ipu7: Use v4l2_ctrl_subdev_subscribe_event()
      media: mc: Fix MUST_CONNECT handling for pads with no links
      media: mc: Improve unconnected pads debugging message in link exploration

Liao Yuanhong (1):
      media: imx296: Remove redundant semicolons

Mathis Foerst (2):
      media: mt9m114: Allow set_selection while streaming
      media: mt9m114: Set pad-slew-rate

Nai-Chen Cheng (1):
      staging: media: ipu3: use string_choices API instead of ternary operator

Sakari Ailus (13):
      media: vimc: Don't explicitly set bus_info
      media: Documentation: Add a hyphen to list-based
      media: Documentation: Reword split of sensor driver to two classes
      media: MAINTAINERS: Remove Stanislaw from IVCS and IPU6 reviewers
      media: ipu6: isys: Set embedded data type correctly for metadata formats
      media: Documentation: Move streams documentation one level up
      media: MAINTAINERS: Change rcar-jpu maintainer
      media: vim2m: Remove compilation conditional to CONFIG_MEDIA_CONTROLLER
      media: ov02c10: Don't include linux/version.h
      media: uapi: Documentation: Improve column width hints for examples
      media: amlogic: c3-mipi-csi2: Call v4l2_get_link_freq() on source pad
      media: v4l2-common: Drop the workaround from v4l2_get_link_freq()
      media: v4l2-common: Update v4l2_get_link_freq() documentation

Shravan Chippa (1):
      media: i2c: imx334: add support for additional test patterns

Tomi Valkeinen (1):
      media: v4l2-subdev: Fix alloc failure check in v4l2_subdev_call_state_try()

Zhang Shurong (1):
      media: rj54n1cb0c: Fix memleak in rj54n1_probe()

 .../userspace-api/media/drivers/camera-sensor.rst  |  16 +-
 .../userspace-api/media/v4l/dev-subdev.rst         |  12 +-
 .../userspace-api/media/v4l/metafmt-generic.rst    |   8 +-
 MAINTAINERS                                        |  11 +-
 drivers/media/i2c/Kconfig                          |  10 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/ds90ub913.c                      |  17 +-
 .../i2c/atomisp-gc0310.c => media/i2c/gc0310.c}    |   0
 drivers/media/i2c/imx214.c                         | 245 ++++++++++-----------
 drivers/media/i2c/imx219.c                         |   4 +
 drivers/media/i2c/imx274.c                         |   2 +
 drivers/media/i2c/imx296.c                         |   2 +-
 drivers/media/i2c/imx334.c                         |  13 ++
 drivers/media/i2c/mt9m114.c                        |  69 ++++--
 drivers/media/i2c/ov02c10.c                        |   1 -
 drivers/media/i2c/ov5648.c                         |   4 +-
 drivers/media/i2c/rj54n1cb0c.c                     |   9 +-
 drivers/media/i2c/vd55g1.c                         |   2 +-
 drivers/media/i2c/vgxy61.c                         |  16 ++
 drivers/media/mc/mc-entity.c                       |   6 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |   2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c    |   6 +
 .../platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c   |   7 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |  75 +++++--
 drivers/media/platform/renesas/rcar_jpu.c          |   2 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |   2 -
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |   9 -
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |  30 +--
 drivers/media/platform/st/stm32/stm32-csi.c        |   4 +-
 drivers/media/platform/ti/Kconfig                  |   3 +-
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  |  65 ++++--
 drivers/media/platform/ti/omap3isp/ispccdc.c       |   8 +-
 drivers/media/platform/ti/omap3isp/isph3a_aewb.c   |   2 +-
 drivers/media/platform/ti/omap3isp/isph3a_af.c     |   2 +-
 drivers/media/platform/ti/omap3isp/isphist.c       |   2 +-
 drivers/media/platform/ti/omap3isp/ispstat.c       |   7 -
 drivers/media/platform/ti/omap3isp/ispstat.h       |   3 -
 drivers/media/test-drivers/vim2m.c                 |  13 +-
 drivers/media/test-drivers/vimc/vimc-capture.c     |   2 -
 drivers/media/test-drivers/vimc/vimc-core.c        |   2 -
 drivers/media/v4l2-core/v4l2-common.c              |  17 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |  24 ++
 drivers/staging/media/atomisp/i2c/Kconfig          |   9 -
 drivers/staging/media/atomisp/i2c/Makefile         |   1 -
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |   9 +-
 drivers/staging/media/imx/imx-media-csi.c          |   8 +-
 drivers/staging/media/ipu3/ipu3-css.c              |   3 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |   5 +-
 drivers/staging/media/ipu7/ipu7-isys-csi2.c        |   2 +-
 drivers/staging/media/ipu7/ipu7-isys-queue.c       |   3 +-
 drivers/staging/media/ipu7/ipu7-isys-subdev.c      |  35 +--
 drivers/staging/media/ipu7/ipu7-isys-subdev.h      |   1 -
 drivers/staging/media/ipu7/ipu7-isys-video.c       |  35 +--
 drivers/staging/media/ipu7/ipu7.c                  |  28 +--
 include/media/cadence/cdns-csi2rx.h                |  19 ++
 include/media/v4l2-common.h                        |  27 +--
 include/media/v4l2-subdev.h                        |  55 ++---
 57 files changed, 516 insertions(+), 459 deletions(-)
 rename drivers/{staging/media/atomisp/i2c/atomisp-gc0310.c => media/i2c/gc0310.c} (100%)
 create mode 100644 include/media/cadence/cdns-csi2rx.h

-- 
Kind regards,

Sakari Ailus

