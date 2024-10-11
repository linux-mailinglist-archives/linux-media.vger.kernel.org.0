Return-Path: <linux-media+bounces-19473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD1699AD94
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 22:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D340B1C22822
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 20:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61AD1D0142;
	Fri, 11 Oct 2024 20:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="HHFkGa8a"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7723E19B3CB
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 20:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728678897; cv=fail; b=RvfRTKIqnhMAqMpcVZffAAjFlJYCzITf7PBalxzJ+PTkIMTyBIoDL+f1vSwMVlnsMtBleFF/48pmpEU+ajxUxTFU7++pVT4F3zMrrj+N2TDS825XLDI07dPy+3mQKIiMdWQEm5L0O3oLppC/4D7hK5eSlJ6ZoQNGqj5ok4YDZ1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728678897; c=relaxed/simple;
	bh=ZFh9FxDceKpIQ62mEr7btk7mhQ29UpKiU+HNlvFGT2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=edUoTb7D9gDPh344fSXu4xAqaDHcHDUvBjotxjE6hiomFCT71mAWSSq1m8xXctihph67uhG391TctpYM2iPDQ2NXsKnNeWvy/pUlbKDfCBVjS2QmoQpINK7M7G0AVC0Th13Ubx6suU3iJhDJDg7hp0Lh4UGPf+SfirRSZzo8PN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=HHFkGa8a; arc=fail smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4XQJJh109QzyQK;
	Fri, 11 Oct 2024 23:34:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1728678885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TSqrIJuCw06YQ2SwbJiKgNbRJRk2jlUR6UZwrZKW6CU=;
	b=HHFkGa8aH3Hccx8O8lxrMuDXFK3cFFBu3K5kkbi1FQm4Nssz9+LyBwkvoYY4mMyZq2Dk8W
	nwpHB2JOeeR3xixXC7zm5aRr3VlvpqRa6KbQ0yCfKzimUhuTNYfbDNbrfi0Gz11j/7wcZW
	cECH/KS25FO81dKeiBQ9qNOsQaxuk8E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1728678885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TSqrIJuCw06YQ2SwbJiKgNbRJRk2jlUR6UZwrZKW6CU=;
	b=yLxcfRxc3pE0JP30BCq2+wEBGRjyRZFAaW+rA30NLwwg1cleb50h/Fd6H4hQu7tZFcky/P
	uuaiwlpRqwk7NqYSt58QVTWuiYcV1wUIqd1ZcbmL/ho8005vRrtRoj/1u0OjKQ4y2je8/E
	QEZzyWdam/8sAFKd/OfReErqxyHSyd0=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1728678885; a=rsa-sha256; cv=none;
	b=NUrH/zbhEkTTUGHa7dFwRjPR0piZqKO4n/kUJUQzXH+nJcAgDUFoX+4pH4LTdfhahvKpF0
	RKbuH5Rc9sgGUaxIxZ+1NziUNf7NiiDBV4F+A5VTI2YE1RUH82SntI+G3VHzeEkeQl88Fl
	4LNTXviS4WcbaTCVf9OFuPp9YIcg9Kw=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4007B634C93;
	Fri, 11 Oct 2024 23:34:43 +0300 (EEST)
Date: Fri, 11 Oct 2024 20:34:43 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR 6.13] Mostly camera sensor patches
Message-ID: <ZwmL46t9qYvpXxe5@valkosipuli.retiisi.eu>
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

Here's again a big, big PR with lots of various patches -- hopefully we can
transition to the new process soon!

Noteworthy additions are the PiSP FE driver, additional hardware support
for rcar-csi2 and max96712 drivers. The rest are mostly small fixes in
drivers here and there. Prabhakar's get_frame_desc caller improvements and
a few streaming documentation updates are included, too.

Please pull.


The following changes since commit 4115edeff98f2ce9f821a8bddcd7a646cfdde77a:

  media: uvcvideo: Exit early if there is not int_urb (2024-10-08 16:04:45 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.13-1-signed

for you to fetch changes up to 85084ffc6015c449c16924bfe65c8e9ff4089cb0:

  media: atomisp: Replace ternary operator with if (2024-10-11 09:47:18 +0300)

----------------------------------------------------------------
V4L2 patches for 6.13

----------------------------------------------------------------
Benjamin Bara (3):
      media: i2c: imx290: Remove CHIP_ID reg definition
      media: i2c: imx290: Avoid communication during probe()
      media: i2c: imx290: Check for availability in probe()

Biju Das (1):
      media: platform: rzg2l-cru: rzg2l-video: Move request_irq() to probe()

Bingbu Cao (2):
      media: ipu6: fix the wrong type casting and 64-bit division
      media: ipu6: remove redundant dependency in Kconfig

Chen Ni (1):
      media: ti: j721e-csi2rx: Convert comma to semicolon

Christophe JAILLET (1):
      media: i2c: vgxy61: Fix an error handling path in vgxy61_detect()

Colin Ian King (1):
      media: i2c: ds90ub960: Fix missing return check on ub960_rxport_read call

Dan Carpenter (1):
      media: i2c: max96717: clean up on error in max96717_subdev_init()

Hridesh MG (1):
      staging: media: ipu3: fix spelling mistakes

Lad Prabhakar (1):
      v4l2-subdev: Return -EOPNOTSUPP for unsupported pad type in call_get_frame_desc()

Niklas Söderlund (17):
      dt-bindings: media: renesas,csi2: Add binding for V4M
      media: rcar-csi2: Correct field size for PHTW writes
      media: rcar-csi2: Allow writing any code and data value to PHTW
      media: rcar-csi2: Abstract PHTW and PHYPLL register offsets
      media: rcar-csi2: Add helper to lookup mbps settings
      media: rcar-csi2: Move PHTW write helpers
      media: rcar-csi2: Add documentation for PHY_EN and PHY_MODE registers
      media: rcar-csi2: Add support for R-Car V4M
      dt-bindings: i2c: maxim,max96712: Add compatible for MAX96724
      media: staging: max96712: Remove device id check
      media: staging: max96712: Move link frequency setting to device struct
      media: staging: max96712: Document the DEBUG_EXTRA register
      media: staging: max96712: Add support for MAX96724
      dt-bindings: media: renesas,isp: Add Gen4 family fallback
      media: rcar-isp: Add family compatible for R-Car Gen4 family
      dt-bindings: media: renesas,isp: Add binding for V4M
      media: rcar-vin: Add support for RAW10

Paul Elder (1):
      media: platform: video-mux: Fix mutex locking

Ricardo Ribalda (1):
      media: atomisp: Replace ternary operator with if

Sakari Ailus (3):
      media: Documentation: Deprecate s_stream video op, update docs
      media: Documentation: Update {enable,disable}_streams documentation
      media: Documentation: Improve v4l2_subdev_{en,dis}able_streams documentation

Shen Lichuan (1):
      media: staging/intel-ipu3: css: Convert comma to semicolon

Tomi Valkeinen (4):
      media: uapi: Add meta formats for PiSP FE config and stats
      dt-bindings: media: Add bindings for raspberrypi,rp1-cfe
      media: raspberrypi: Add support for RP1-CFE
      media: admin-guide: Document the Raspberry Pi CFE (rp1-cfe)

Tommaso Merciai (2):
      media: i2c: max96714: add HAS_EVENTS support
      media: i2c: max96717: add HAS_EVENTS support

Yu Jiaoliang (1):
      media: i2c: Fix typos in comments across various files

 .../admin-guide/media/raspberrypi-rp1-cfe.dot      |   27 +
 .../admin-guide/media/raspberrypi-rp1-cfe.rst      |   78 +
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../bindings/media/i2c/maxim,max96712.yaml         |    5 +-
 .../bindings/media/raspberrypi,rp1-cfe.yaml        |   93 +
 .../devicetree/bindings/media/renesas,csi2.yaml    |    1 +
 .../devicetree/bindings/media/renesas,isp.yaml     |    4 +-
 Documentation/driver-api/media/camera-sensor.rst   |    8 +-
 Documentation/driver-api/media/tx-rx.rst           |   13 +-
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-pisp-fe.rst    |   39 +
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/ds90ub960.c                      |    2 +-
 drivers/media/i2c/hi556.c                          |    2 +-
 drivers/media/i2c/imx290.c                         |   30 +-
 drivers/media/i2c/max96714.c                       |    6 +-
 drivers/media/i2c/max96717.c                       |   12 +-
 drivers/media/i2c/ov2740.c                         |    2 +-
 drivers/media/i2c/ov5640.c                         |    2 +-
 drivers/media/i2c/ov5670.c                         |    2 +-
 drivers/media/i2c/ov5675.c                         |    4 +-
 drivers/media/i2c/ov772x.c                         |    2 +-
 drivers/media/i2c/ov7740.c                         |    2 +-
 drivers/media/i2c/ov8856.c                         |    2 +-
 drivers/media/i2c/ov9650.c                         |    2 +-
 drivers/media/i2c/ov9734.c                         |    2 +-
 drivers/media/i2c/vgxy61.c                         |    2 +-
 drivers/media/pci/intel/ipu6/Kconfig               |    2 +-
 drivers/media/pci/intel/ipu6/ipu6-cpd.c            |    6 +-
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c         |    8 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c   |    4 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     |    6 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c           |    6 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h           |    2 +-
 drivers/media/pci/intel/ipu6/ipu6.c                |    3 +-
 drivers/media/platform/raspberrypi/Kconfig         |    1 +
 drivers/media/platform/raspberrypi/Makefile        |    1 +
 drivers/media/platform/raspberrypi/rp1-cfe/Kconfig |   15 +
 .../media/platform/raspberrypi/rp1-cfe/Makefile    |    6 +
 .../media/platform/raspberrypi/rp1-cfe/cfe-fmts.h  |  332 +++
 .../media/platform/raspberrypi/rp1-cfe/cfe-trace.h |  202 ++
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   | 2504 ++++++++++++++++++++
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.h   |   43 +
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.c  |  586 +++++
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.h  |   89 +
 drivers/media/platform/raspberrypi/rp1-cfe/dphy.c  |  181 ++
 drivers/media/platform/raspberrypi/rp1-cfe/dphy.h  |   27 +
 .../media/platform/raspberrypi/rp1-cfe/pisp-fe.c   |  605 +++++
 .../media/platform/raspberrypi/rp1-cfe/pisp-fe.h   |   53 +
 drivers/media/platform/renesas/rcar-csi2.c         |  518 +++-
 drivers/media/platform/renesas/rcar-isp.c          |    4 +-
 .../media/platform/renesas/rcar-vin/rcar-core.c    |    1 +
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |   30 +
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |   43 +
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h |    4 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |   13 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |    6 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |   15 +-
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  |    6 +-
 drivers/media/platform/video-mux.c                 |    6 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 drivers/media/v4l2-core/v4l2-subdev.c              |    5 +
 drivers/staging/media/atomisp/pci/sh_css_frac.h    |    6 +-
 drivers/staging/media/ipu3/ipu3-css-params.c       |    6 +-
 drivers/staging/media/max96712/max96712.c          |   56 +-
 include/media/v4l2-subdev.h                        |   17 +-
 .../uapi/linux/media/raspberrypi/pisp_fe_config.h  |  273 +++
 .../linux/media/raspberrypi/pisp_fe_statistics.h   |   64 +
 include/uapi/linux/videodev2.h                     |    2 +
 69 files changed, 5893 insertions(+), 217 deletions(-)
 create mode 100644 Documentation/admin-guide/media/raspberrypi-rp1-cfe.dot
 create mode 100644 Documentation/admin-guide/media/raspberrypi-rp1-cfe.rst
 create mode 100644 Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-pisp-fe.rst
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/Kconfig
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/Makefile
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/cfe-fmts.h
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/cfe-trace.h
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/cfe.h
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/csi2.c
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/csi2.h
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/dphy.c
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/dphy.h
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/pisp-fe.c
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/pisp-fe.h
 create mode 100644 include/uapi/linux/media/raspberrypi/pisp_fe_config.h
 create mode 100644 include/uapi/linux/media/raspberrypi/pisp_fe_statistics.h

-- 
Kind regards,

Sakari Ailus

