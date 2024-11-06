Return-Path: <linux-media+bounces-20985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8729BDFAE
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 08:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EDC728510B
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 07:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBD41CC8A3;
	Wed,  6 Nov 2024 07:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="k4rOFj9G"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEC313C80E
	for <linux-media@vger.kernel.org>; Wed,  6 Nov 2024 07:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730879304; cv=pass; b=KTFbyHf4UfdMso9ie7ESdVceNDkuU4QLg2mfatuITNQ6QxHXyZny6LkSKB+hHvm9VyQGak/5NRKSwTkK7cCc8vDaHVkB+Rn3HbXfZbuTrReDWDz8lYYOFy2LCbKtOMTnl2f8MkxKgbZNEbZzdX5IGatmWdzHvNywMAfieewdYgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730879304; c=relaxed/simple;
	bh=oZXcVjxHHe4tv/a54Jm1zfKF2kChnxbdVvSZfSevjU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lOjhK++mo8N4sbdwINIA0To1TDuocdQt85JmZG+fd3SFLf61EGAfRAy7lz/NYUnAjJCLixL1pNwBoIj4H7m5BBJKzDHXQ8FVfq9iyzfvddsOcGJESowtRu325M/uHN709FPGRQvzocpdZ85t/R1JA8DzjaQyITblWCtZWVyX3WU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=k4rOFj9G; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Xjy4J69cgz49QDf;
	Wed,  6 Nov 2024 09:48:16 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1730879297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5jg97+PJHzFWVz2voRdxN+02b0Eby0VPLBAoyGco5do=;
	b=k4rOFj9GavFaKEuRVcYBJCjgH+PeHja1ZU8mx8PtmihxU91n9OE8X2V5gaVSczxcOo6Yei
	aRf4iw8UIItStI80NxnGy0aWZB15BYvdzFDOYX0rE9gEGBFgUHg5pSC/dXqruwyzqjqhhJ
	v4Z62lJbZECJ5UMWOFtL2slgI/7EHwRNGvFNDwRvcpXWnIfGKC2x2Iiciwnm4yiDxCFpLm
	bdehbiZBTAg1X+Uq5cT5BgS7t1VCp/TbArjqjf+jpSFcVSpOfYb6xLHFNxr87l5MKzPRdB
	2BQRsSC5DHNJlsG7aMqSs5I1YoR4duJ5FdOSi69MkKS+/Tr56Uu4xY709kru/w==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1730879297; a=rsa-sha256;
	cv=none;
	b=JpSv3qyx02IRCOFZ9pwmq/rmQ6Se/eBCAlPc85O3dImS4XCLhncu6RIv4rRHXXXhIF7cw5
	EMuizFAM/IB9Zt7jtYnO3E7XNOCsdazAubc2j9+BqkRzVX+D0E5C4jTMJnLcQ5OszJLSOu
	utYnCJLY7+bbswTBDE1BRkh30WT0HPq/ia/Tiep0DRLVtYQv6x6k99UmWJhw84U7z23hpz
	hY2P+cRRBV4O3IM43MgLmOKektNinmcCb0UlYIgpQ0sH5xeTLkm7jTD9m92sxJQTUobN4h
	B48SMYNKdFHqxI14IlIlTm3Mh2I2wuHpidRovgvCyh9tb++IMgsDGKsxsphsYw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1730879297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5jg97+PJHzFWVz2voRdxN+02b0Eby0VPLBAoyGco5do=;
	b=EbOOMkbaOgheRrhXXZlXPY50atTbt21sRM++rA6rDpGsMw7jFFROcLFx9X5v9/WTVpWswK
	uHQFw+2KmZ1XNEBh8OuyGkmyuwfCgznnUuod2mg3tf68TXQ0uaTXYnaorsp1/8c9MHUkWh
	EwkaVuiSSjT5JVRTi+3UTLai9GnVDoVSa0gu+sU2eBVkyD8AUuL1pflGeOlygjgx5QtgZX
	NwnrqS7pPfH2ihYnIQtVIsuNxhj1JwIXyu8Xxe59SLIjxZUOXhVkZiQlJqNBRKw9HLLyUq
	NbYwMZXUPzCxZdkQvlwEedhRP5OXnWVQnE2apQKJjBwzb2I3fqk98Y/xa41LUg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 504AE634C94;
	Wed,  6 Nov 2024 09:48:16 +0200 (EET)
Date: Wed, 6 Nov 2024 07:48:16 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR 6.13] Lots of fixes but also PiSP support
Message-ID: <ZysfQDjGpNrbjU6F@valkosipuli.retiisi.eu>
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

This PR contains a number of important fixes, to the IPU6, max96717, imx290,
vgxy61, rcar-csi2, max9671[47] as well as support for PiSP FE, RP1-CFE and
s_stream and {enable,disable}_streams documentation improvements.

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

