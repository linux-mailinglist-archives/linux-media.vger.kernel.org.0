Return-Path: <linux-media+bounces-30980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D68A9BF00
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 08:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80E7A3B4211
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 06:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC4922D7A8;
	Fri, 25 Apr 2025 06:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="qx5AMvFn"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CFB22D78A
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 06:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564118; cv=pass; b=hR0BwhllDGlBPveayY5T16r9DiAscaN/3/cPinth+ABNwp7I30OduzGHLYYC8m5WR9WWCEkdpEy2vGuxto7pVVo+MUnAqMac9tK1IVa+BZrTYpnuzMM6WOjIu0vvrOLsW+8L7+dNDeZcqAiyuhb9PNzy1YFHMrwOvDB6ZglgVPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564118; c=relaxed/simple;
	bh=HbG7cBbphFTeAURqJiNPxkBAlA/x8mTMb2n3dLwJYbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ejBbTdTR5hUG8tQqHCMUhhg+44ie2KGb/5uZlqi+Fho+Q+HVsqNDTQ7FSRQvtySqubV4raO5yg79J3PTXXTjZcN3te8MwkJ6evqAsvrGddkq+s8KMm62EoFWLy1i5VudFqEfpJ16FNocqY2mn31M3q5o3MgX7PT0Bnqo0U4RlDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=qx5AMvFn; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4ZkNrc3zVvzyQr;
	Fri, 25 Apr 2025 09:55:12 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1745564112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vgQ4osbZ0a0YghtIagNOWhLinPCSEeBJwA1jgOcKFqM=;
	b=qx5AMvFn+HVScvYH9fYj/fmas/o9F0lw/ZdxoM3axE2WawaUz80sHd+2HEIUaGGdHDVfzP
	4s/SKObiHgGNMX7CyZAKJaFH4NNdDdUkDlavXr3RHW6MbAF2mYpS0vtO0WY7EHQ886W7wE
	nhUqaSTpxskaurpwZhSzsgSZLc+d0hk=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1745564112; a=rsa-sha256; cv=none;
	b=Ko7Kjce+E5Y9Q1ypTbmbl3Z8oNHFdh1nzsxCI4Z0D8NxKxkKvsTeCPZMhn26nov8Gc5oF+
	6fmfgAJLwigkJYajFZY0wRqe6QtdSnRdj+F6/XNfdE4mG6MxcXvfG8pUphYp58V4+M/K2t
	IOdIe87DTz/U9oBqCbgA0yogoMfIvM4=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1745564112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vgQ4osbZ0a0YghtIagNOWhLinPCSEeBJwA1jgOcKFqM=;
	b=rWSyg3CHHZPgae0XOCdXKJpLgmhmWC6gZ2JhtIX4bP67T6yuHGl9fnJGXQUAWXlsUKXnrD
	iaVyJ1WKb5ZHNSGARhEsN0pZjICoI3uYVtichMvO4/I2PrYzCB8w2wPoYD3ImlBtxeLezR
	tpZntJ8Cojsb/Vb3qP5YKpwHh6iNxT4=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BBBBD634C93;
	Fri, 25 Apr 2025 09:55:11 +0300 (EEST)
Date: Fri, 25 Apr 2025 06:55:11 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl
Subject: [GIT PULL FOR 6.16] Lots of V4L2 patches
Message-ID: <aAsxz0PYtnjBSqr5@valkosipuli.retiisi.eu>
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

This set includes a large number of fixes, cleanups and improvements to
various drivers (ov08x40, ov2740, ipu6, rcar-vin, ccs, imx334, imx219,
ds90ub* and ti cal), ccs pll calculator as well as a drivers for ov02e10
sensor. Included are also a few patches for aligning the DT binding
filenames.


Please pull.

The following changes since commit 14423fc3a4a21fb436dda85450339ec2bf191b36:

  media: venus: pm_helpers: add compatibility for dev_pm_genpd_set_hwmode on V4 (2025-04-11 13:29:07 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.16-1.4-signed

for you to fetch changes up to 89ab468e21243b2c37e03a2cdb55ec41ff6137e0:

  media: i2c: imx334: switch to {enable,disable}_streams (2025-04-25 08:50:39 +0300)

----------------------------------------------------------------
V4L2 patches for 6.16

----------------------------------------------------------------
Bryan O'Donoghue (1):
      media: dt-bindings: Add OmniVision OV02E10

David Heidelberg (2):
      media: dt-bindings: media: i2c: align filenames format with standard
      media: dt-bindings: Convert Analog Devices ad5820 to DT schema

Dongcheng Yan (1):
      media: ipu-bridge: add ACPI HID for lt6911uxe bridge

Hans de Goede (2):
      media: ov08x40: Extend sleep after reset to 5 ms
      media: ov2740: Move pm-runtime cleanup on probe-errors to proper place

Hao Yao (1):
      media: ipu6: Remove workaround for Meteor Lake ES2

Jai Luthra (4):
      media: i2c: ds90ub953: Speed-up I2C watchdog timer
      media: dt-bindings: ti,ds90ub960: Allow setting serializer address
      media: i2c: ds90ub960: Configure serializer using back-channel
      media: i2c: ds90ub9xx: Set serializer temperature ramp

Jingjing Xiong (1):
      media: i2c: ov02e10: add OV02E10 image sensor driver

Niklas Söderlund (5):
      media: rcar-vin: Remove emulated SEQ_{TB,BT}
      media: rcar-vin: Remove superfluous suspended state
      media: rcar-vin: Remove superfluous starting state
      media: rcar-vin: Simplify the shutdown process
      media: rcar-csi2: Remove hack to detect NTSC content

Philipp Stanner (2):
      media: ipu3-cio2: Replace deprecated PCI functions
      media: intel/ipu6: Replace deprecated PCI functions

Sakari Ailus (16):
      media: ccs-pll: Start OP pre-PLL multiplier search from correct value
      media: ccs-pll: Start VT pre-PLL multiplier search from correct value
      media: ccs-pll: Check for too high VT PLL multiplier in dual PLL case
      media: ccs-pll: Correct the upper limit of maximum op_pre_pll_clk_div
      media: ccs-pll: Print a debug message on too high VT PLL OP clock
      media: ccs-pll: Drop LINK_DECOUPLED flag
      media: ccs-pll: Print missing PLL flags
      media: ccs-pll: Add a flag for even PLL multipliers
      media: ccs-pll: Better validate VT PLL branch
      media: ccs-pll: Print PLL calculator flags in the beginning
      media: ccs-pll: Document the CCS PLL flags
      media: ccs: Try a little longer to access the sensor before giving up
      media: ccs: Use read_poll_timeout() in reset polling
      media: ccs: Remove I²C write retry hack
      media: ccs: Don't complain about lack of quirks
      media: ccs: Don't complain about missing "clock-frequency" property

Shravan Chippa (4):
      media: i2c: imx334: Optimized 4k and 2k mode register arrays
      media: i2c: imx334: update mode_3840x2160_regs array
      media: i2c: imx334: add modes for 720p and 480p resolutions
      media: i2c: imx334: common reg value correction

Stanislaw Gruszka (11):
      media: intel/ipu6: Remove unused IPU6_BUS_NAME
      media: intel/ipu6: Remove ipu6_buttress_ctrl started field
      media: intel/ipu6: Constify ipu6_buttress_ctrl structure
      media: intel/ipu6: Remove unused ipu6_isys_subdev_link_validate()
      media: intel/ipu6: Add missing new line character in error message
      media: intel/ipu6: Make two functions static
      media: intel/ipu6: Use timestamp value directly
      media: intel/ipu6: Abstract buf ready function
      media: intel/ipu6: Remove unused dev field from ipu6_isys_queue
      media: intel/ipu6: Minor dma_mask clenaup
      media: intel/ipu6: Fix dma mask for non-secure mode

Tarang Raval (11):
      media: i2c: imx219: switch to {enable,disable}_streams
      media: i2c: imx219: media: i2c: imx219: Enable runtime PM autosuspend
      media: i2c: imx334: Simplify with dev_err_probe()
      media: i2c: imx334: Convert to CCI register access helpers
      media: i2c: imx334: Remove redundant register entries
      media: i2c: imx334: Configure lane mode dynamically
      media: i2c: imx334: Fix power management and control handling
      media: i2c: imx334: Fix runtime PM handling in remove function
      media: i2c: imx334: Enable runtime PM before sub-device registration
      media: i2c: imx334: Use subdev state lock for synchronization
      media: i2c: imx334: switch to {enable,disable}_streams

Tomi Valkeinen (18):
      media: i2c: ds90ub953: Fix error prints
      media: i2c: ds90ub913: Fix returned fmt from .set_fmt()
      media: i2c: ds90ub913: Align ub913_read() with other similar functions
      media: i2c: ds90ub9xx: Add err parameter to read/write funcs
      media: i2c: ds90ub960: Add error handling to multiple places
      media: i2c: ds90ub953: Add error handling to ub953_log_status()
      media: i2c: ds90ub913: Add error handling to ub913_log_status()
      media: i2c: ds90ub960: Move UB9702 registers to a separate section
      media: i2c: ds90ub960: Add UB9702 specific registers
      media: i2c: ds90ub960: Split ub960_init_tx_ports()
      media: i2c: ds90ub960: Refresh ub960_init_tx_ports_ub9702()
      media: i2c: ds90ub960: Add RX port iteration support
      media: i2c: ds90ub960: Move all RX port init code into ub960_init_rx_ports()
      media: i2c: ds90ub960: Update UB9702 init sequences
      media: i2c: ds90ub953: Move reg defines to a header file
      media: ti: cal: Use printk's fourcc formatting
      media: ti: cal: Fix wrong goto on error path
      media: ti: cal: Add streams support

 .../devicetree/bindings/media/i2c/ad5820.txt       |   28 -
 .../devicetree/bindings/media/i2c/adi,ad5820.yaml  |   56 +
 .../media/i2c/{adp1653.txt => adi,adp1653.txt}     |    0
 .../media/i2c/{adv7180.yaml => adi,adv7180.yaml}   |    2 +-
 .../media/i2c/{adv7343.txt => adi,adv7343.txt}     |    0
 .../media/i2c/{adv748x.yaml => adi,adv748x.yaml}   |    2 +-
 .../media/i2c/{adv7604.yaml => adi,adv7604.yaml}   |    2 +-
 .../media/i2c/{mt9v032.txt => aptina,mt9v032.txt}  |    0
 .../media/i2c/{max2175.txt => maxim,max2175.txt}   |    0
 .../media/i2c/{mt9m111.txt => micron,mt9m111.txt}  |    0
 .../media/i2c/{tda1997x.txt => nxp,tda1997x.txt}   |    0
 .../media/i2c/{mt9m001.txt => onnn,mt9m001.txt}    |    0
 .../bindings/media/i2c/ovti,ov02e10.yaml           |  113 +
 .../media/i2c/{ov2640.txt => ovti,ov2640.txt}      |    0
 .../media/i2c/{ov2659.txt => ovti,ov2659.txt}      |    0
 .../media/i2c/{ov7670.txt => ovti,ov7670.txt}      |    0
 .../media/i2c/{ov7740.txt => ovti,ov7740.txt}      |    0
 .../media/i2c/{ov9650.txt => ovti,ov9650.txt}      |    0
 .../media/i2c/{imx219.yaml => sony,imx219.yaml}    |    2 +-
 .../bindings/media/i2c/ti,ds90ub953.yaml           |   77 +-
 .../bindings/media/i2c/ti,ds90ub960.yaml           |   16 +-
 .../media/i2c/{ths8200.txt => ti,ths8200.txt}      |    0
 .../media/i2c/{tvp514x.txt => ti,tvp514x.txt}      |    0
 .../media/i2c/{tvp5150.txt => ti,tvp5150.txt}      |    0
 .../media/i2c/{tvp7002.txt => ti,tvp7002.txt}      |    0
 .../i2c/{tc358743.txt => toshiba,tc358743.txt}     |    0
 MAINTAINERS                                        |   31 +-
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ccs-pll.c                        |   49 +-
 drivers/media/i2c/ccs-pll.h                        |   29 +-
 drivers/media/i2c/ccs/ccs-core.c                   |   55 +-
 drivers/media/i2c/ccs/ccs-quirk.c                  |    3 +-
 drivers/media/i2c/ccs/ccs-reg-access.c             |    9 +-
 drivers/media/i2c/ccs/ccs.h                        |    2 +
 drivers/media/i2c/ds90ub913.c                      |   82 +-
 drivers/media/i2c/ds90ub953.c                      |  242 ++-
 drivers/media/i2c/ds90ub953.h                      |  104 +
 drivers/media/i2c/ds90ub960.c                      | 2166 +++++++++++++++-----
 drivers/media/i2c/imx219.c                         |   38 +-
 drivers/media/i2c/imx334.c                         | 1034 +++++-----
 drivers/media/i2c/ov02e10.c                        |  969 +++++++++
 drivers/media/i2c/ov08x40.c                        |    2 +-
 drivers/media/i2c/ov2740.c                         |    4 +-
 drivers/media/pci/intel/ipu-bridge.c               |    2 +
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |    5 +-
 drivers/media/pci/intel/ipu6/ipu6-bus.c            |    2 +-
 drivers/media/pci/intel/ipu6/ipu6-bus.h            |    7 +-
 drivers/media/pci/intel/ipu6/ipu6-buttress.c       |    6 +-
 drivers/media/pci/intel/ipu6/ipu6-buttress.h       |    5 +-
 drivers/media/pci/intel/ipu6/ipu6-dma.c            |    4 +-
 drivers/media/pci/intel/ipu6/ipu6-dma.h            |    3 -
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |   45 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h     |    5 -
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h    |    4 -
 drivers/media/pci/intel/ipu6/ipu6.c                |   13 +-
 drivers/media/platform/renesas/rcar-csi2.c         |    8 +-
 .../media/platform/renesas/rcar-vin/rcar-core.c    |    6 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |  132 +-
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |    7 -
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h |   40 +-
 drivers/media/platform/ti/cal/cal-camerarx.c       |  270 ++-
 drivers/media/platform/ti/cal/cal-video.c          |  157 +-
 drivers/media/platform/ti/cal/cal.c                |   45 +-
 drivers/media/platform/ti/cal/cal.h                |    3 +-
 65 files changed, 4133 insertions(+), 1765 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ad5820.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml
 rename Documentation/devicetree/bindings/media/i2c/{adp1653.txt => adi,adp1653.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{adv7180.yaml => adi,adv7180.yaml} (98%)
 rename Documentation/devicetree/bindings/media/i2c/{adv7343.txt => adi,adv7343.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{adv748x.yaml => adi,adv748x.yaml} (98%)
 rename Documentation/devicetree/bindings/media/i2c/{adv7604.yaml => adi,adv7604.yaml} (98%)
 rename Documentation/devicetree/bindings/media/i2c/{mt9v032.txt => aptina,mt9v032.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{max2175.txt => maxim,max2175.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{mt9m111.txt => micron,mt9m111.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{tda1997x.txt => nxp,tda1997x.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{mt9m001.txt => onnn,mt9m001.txt} (100%)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
 rename Documentation/devicetree/bindings/media/i2c/{ov2640.txt => ovti,ov2640.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{ov2659.txt => ovti,ov2659.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{ov7670.txt => ovti,ov7670.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{ov7740.txt => ovti,ov7740.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{ov9650.txt => ovti,ov9650.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{imx219.yaml => sony,imx219.yaml} (97%)
 rename Documentation/devicetree/bindings/media/i2c/{ths8200.txt => ti,ths8200.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{tvp514x.txt => ti,tvp514x.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{tvp5150.txt => ti,tvp5150.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{tvp7002.txt => ti,tvp7002.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{tc358743.txt => toshiba,tc358743.txt} (100%)
 create mode 100644 drivers/media/i2c/ds90ub953.h
 create mode 100644 drivers/media/i2c/ov02e10.c

-- 
Kind regards,

Sakari Ailus

