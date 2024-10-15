Return-Path: <linux-media+bounces-19685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 296A199F1A7
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 17:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A394A1F2884D
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 15:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D29E1F6665;
	Tue, 15 Oct 2024 15:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="QWo1CmNG"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4F91D9580
	for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729006955; cv=fail; b=rq6gkLp7NbzXwI7o0zh03X8HGh2JHqAugspYuDNRRIvhtinjIfGCnRqZIfFmAcKH2l5F00DTAQ+46deHAkKdgmRJ4sCOll4lBSE0Ynkc1QEusp0UkMziPyi8M0anp4O5CnuM0Bsrh2ylEXaZdeMo77yj0ueRWcUHCNaGeQRZYDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729006955; c=relaxed/simple;
	bh=fFYCYLvlbaGPP+RYM+47elyvFOk1Ydp14+PoX/mq7rw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nd2/5OVFurjkVeoXWFaTEUUUYfh540xrP71gaEhDPerWD/inZ3YAI5lkhlZPR2xlPbeNpWeFv88EbmjGwkFoEEH+9Z1k/aBmoyqvjfCPBbK4EURTNVm7BRLPHMTsyGMW/bmuCr+/C3OUX2NDLbQfZZgdkhaxFLNMxxNP+Qz+cXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=QWo1CmNG; arc=fail smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4XSddX0rkRz49Q6m;
	Tue, 15 Oct 2024 18:42:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1729006944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fu4KwJDsf10jFX1YsTWWiIWPoREXUatIf9j47QnxEEI=;
	b=QWo1CmNGBjMhQT+W43LBnBdepOnifZOJ5eJEB73eE52or0iNOHE0SsD7Ct11wp7rfkCvZp
	rg2NUdyUZWe0+ok5NyS099PedKy6lJ25EsLbma5Jwnk2MAB9k0m0Icb39nEr+Kc6WIQKLT
	SiAddIh94TEc2pwzJaw32E13h8fwlIXGZ5/kGRQavSjCL0elpyniek3w+kC1AHaqWks9ho
	22byFBSe3QOpgMQ0iv5D5xNVQMrXz9ZjmEEdb1dJVk7+T6y8e0EmlMXzWqbf5yvSzDgkac
	eidM5v++Txzl3s3vS7DrScCR7z9B0nRPyCYkcvlFKqv2LDApTReWsBoBlZUhiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1729006944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fu4KwJDsf10jFX1YsTWWiIWPoREXUatIf9j47QnxEEI=;
	b=jjxxURAoQ+2X4/uNSGltkXfRxXyTROwKP063t98npma6FIPc2gU7E8jTeWBgpwf3XXRE1X
	NqZqB0GOHFuaGlec12p3lX0mn78nfPEV1+P9LKcHuENkRqyFyrQ+CxJ4t0Q9jgnTyO5JiN
	cQZR58Pm87uSPy+MGZoMTUepfgT3JsRVzpLl2atGOw6qD01WxDrpx9ILUy8Kzl/9UeZnd+
	VN3/5x1vFcs2/v50jefQpxiEOt7c3qT0ZE9jXInhRbo0n/2e354bL5YzyNNeinOnAwo872
	qB+VYuIUvwn+3PcMq013kBZuedZrZsSWszrgFEEJRVFl1TW9feUwitmgookzVQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1729006944; a=rsa-sha256;
	cv=none;
	b=BPKkwM3I2uS+bGyY0HEalT5Qfy7HugLw/zuTX5jkuzYjIMjqp05GPj9+i1pF6uAgC4pZHh
	4mj+3hyE6vReEg4NSZl56Kt87F+orS3jJelkhzno5YIyZ6scZ8qVXpZorpMh8iyv5QsaCS
	7wisIUnrDPJv+wSU6pmA1dYxNH1lOZZ3YsCOH9eGxjilqBgCfKowKaMzCTKL5VA/JqV2c4
	9XhYLI3s8o+g3xvfQYL28WdSCk8n6e2p3lBI2YVHjBgx8kZIfH8WtVTYxNIhYgAJ70V969
	n19W6vCqDO7l3Jqc2QMVXyz2WWHkIlr5SrDZqbel1p/F5fjYvn9Zn41qxnnOQQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 718C6634C99;
	Tue, 15 Oct 2024 18:42:23 +0300 (EEST)
Date: Tue, 15 Oct 2024 15:42:23 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL v2 FOR 6.13] Mostly camera sensor patches
Message-ID: <Zw6NXzWiKsQccI32@valkosipuli.retiisi.eu>
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

since v1:

- Address Coccinelle and checkpatch.pl warnings.

- Pick a ov2740 cleanup by Hans de Goede.


The following changes since commit bcd4f091cf1ea7184d813afc115af82ac9326b25:

  media: verisilicon: Use V4L2_FMTDESC_FLAG_ENUM_ALL flag (2024-10-12 19:56:16 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.13-1.1-signed

for you to fetch changes up to 13db34be662982993ef9b870d50e2206b51f9b29:

  media: ov2740: Don't log ov2740_check_hwcfg() errors twice (2024-10-15 13:16:52 +0300)

----------------------------------------------------------------
V4L2 patches fpr 6.13

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

Hans de Goede (1):
      media: ov2740: Don't log ov2740_check_hwcfg() errors twice

Hridesh MG (1):
      staging: media: ipu3: fix spelling mistakes

Lad Prabhakar (1):
      media: v4l2-subdev: Return -EOPNOTSUPP for unsupported pad type in call_get_frame_desc()

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
 drivers/media/i2c/ov2740.c                         |    7 +-
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
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   | 2503 ++++++++++++++++++++
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
 69 files changed, 5895 insertions(+), 219 deletions(-)
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

