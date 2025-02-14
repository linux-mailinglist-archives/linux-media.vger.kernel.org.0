Return-Path: <linux-media+bounces-26144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0256A35792
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 08:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C5AC16E02C
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 07:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B8A204F66;
	Fri, 14 Feb 2025 07:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="tRMzOzSW"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23381127E18
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 07:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739516766; cv=pass; b=pYQcsKcQo5oUdfl7ZAdjhskkDhKgISzIJS/O/pb0PHstZz5dj6YwuelibN+/WspxfT98IkDVR2gGPUgvtJ3zPPPonWrgpg9MbpsNCvrKq39mEd9Ws4I6kzwWZSsn8AbNC7xKxZNlDmRLxFDJDl1XdERgzpDMNTk4oP0I6E8yh1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739516766; c=relaxed/simple;
	bh=TfuEhc6zKwv+qoPReT2Gg5YKxeDhSx4Lw49la1sELu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iE5WxPpj/dvcLkZoV9TQvdlbEYYxxX4jojUiXAHBR751gZYZVC5QDkRW6mZtfCKzg8tYEHd8suhtXiCCZuVhRtGrRll1F1GptpXD9+IXhJjSdViLoRLrHUbb9XLGIsNES3OAUc38Sloj2K2TJ5LHvc3eyEX/oFCGSblBIBd3BpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=tRMzOzSW; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4YvNPG31Wvz49PvR;
	Fri, 14 Feb 2025 09:05:54 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1739516754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HK0rnfDzRzxTf+VQ65Jt+4kItw806GFcj8pkA3mEHhE=;
	b=tRMzOzSWOA3qgGBg3GrBBGMmI5DFpsOLqFGby12Jnqi0Vd7hPNKS9zW+DdFDeaefghPosP
	YWa0PH3sGaQUavTq7M5vEIq3E/GfkGKxW9sVgaJXZHgFhYc59/bJKyvDn7ickIajZNcoAi
	EsXGtESqaH24SNKMCsziL7/GDAfXLv4h65hST6UOz3vQdsYRWqh6u5LM/5aCGf5aBfARNF
	xNNk0Wn9E5kBa4zZhADOSDvzyIbQxZi4amhOcX6jWMirTCbyPxO5aG9aPrOyhtFDLFf9qU
	C7hCXkC/f7bBSRdZQC8H8/3NuulyB7xwi2HcAa5zXNYkGvy54yv6b5iIXqTC6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1739516754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HK0rnfDzRzxTf+VQ65Jt+4kItw806GFcj8pkA3mEHhE=;
	b=db9OLBuAsMsdwsBlCQUkw8tNX8f6IYpeZWzT7UGjDGg92qb4aa+V1Tb7udwiEn6Ss0GZCR
	Ww+t+EdF1xjBQBr/u4m1LiIExI6OrUD2Hf0evmWGm2TNUfgq3OMIws9TRNrKBgtfpcqJYw
	AGRJ70di1fF7cPOar+GVjTLmaVBrCY3aTrTycMdahQrJGhJB89WkBj3U7f+2djO/8eZpAt
	0mgsEWgj/NsPBdlyalOZ6fNiNs+MKvUk89+aOut71+XLXGWDsqkiZqMado8hvcEL2M3Ixr
	vwXbtZps9PAmfyxq56HI+MxCvRLCVpT+K10sq25d2baeRqqkEaT6zC+pdA1JNw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1739516754; a=rsa-sha256;
	cv=none;
	b=wCH6FI55jB5SFbuZmOlKQuOXLp3FoS2p2H0Q5fHx622jiH13quN9V7jhYdNCIgltj1HZQV
	AIvvarNSnaxTQ7WGbfy5d9/PNRiqf1I2w+nswpeXLZ9FlY4fFZrqWmpLeghU9LSrcygGUM
	EDViFhjGhN0QBEqi3ur7duRvaaFJ96nr4YhMQlv+Jpi076/qxZzCQ3IQjYUEgJ7ponf34M
	gHiiTYZ2I7xjm9fHF/WL6XnuzZIE553aIknfIO5QcFdjAAreUz6/osuVHs3M3SBizhGqbV
	vL8j1hZFCrKnXFh4parGOZ3m3xHqpG91+JAyWhCkKyg7HalNFczunYzMQp63Ig==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 35B10634C93;
	Fri, 14 Feb 2025 09:05:52 +0200 (EET)
Date: Fri, 14 Feb 2025 07:05:52 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR 6.15] V4L2 camera sensor patches mostly
Message-ID: <Z67rUOKJsmyolKtz@valkosipuli.retiisi.eu>
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

Here's a bunch of fixes and improvements to various drivers, mainly
including stm32 csi, imx214, imx415, hi556, ov08x40 and ov2740 imx219
drivers, power management related fixes to imx214, ov7251, ccs, imx219 and
imx319 drivers as well as V4L2 link frequency helper improvements
(including driver changes).

Please pull.


The following changes since commit c52643b241525c0f4bf8902eeaba0d74bc5af278:

  media: qcom: camss: add support for SDM670 camss (2025-02-12 09:01:34 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.15-1.1-signed

for you to fetch changes up to 87d199af7f765cccde18934e8b656b95b395cacb:

  media: dw9719: Add DW9761 support (2025-02-13 22:05:17 +0200)

----------------------------------------------------------------
V4L2 patches for 6.15

----------------------------------------------------------------
Alain Volmat (9):
      media: stm32: dcmipp: correct ret type in dcmipp_graph_notify_bound
      dt-bindings: media: clarify stm32 csi & simplify example
      media: stm32: csi: add missing pm_runtime_put on error
      media: stm32: csi: register subdev only at end of probe
      media: stm32: csi: use ARRAY_SIZE to search D-PHY table
      media: stm32: csi: simplify enable_streams error handling
      media: stm32: csi: remove useless fwnode_graph_get_endpoint call
      media: stm32: csi: correct unsigned or useless variable settings
      media: stm32: dcmipp: add has_csi2 & needs_mclk in match data

André Apitzsch (12):
      media: i2c: imx214: Use subdev active state
      media: i2c: imx214: Simplify with dev_err_probe()
      media: i2c: imx214: Convert to CCI register access helpers
      media: i2c: imx214: Replace register addresses with macros
      media: i2c: imx214: Drop IMX214_REG_EXPOSURE from mode reg arrays
      media: i2c: imx214: Check number of lanes from device tree
      media: i2c: imx214: Add vblank and hblank controls
      media: i2c: imx214: Implement vflip/hflip controls
      media: i2c: imx214: Add analogue/digital gain control
      media: i2c: imx214: Verify chip ID
      media: i2c: imx214: Add test pattern control
      media: i2c: imx214: Fix link frequency validation

Dave Stevenson (5):
      media: i2c: imx415: Add read/write control of VBLANK
      media: i2c: imx415: Make HBLANK controllable and in consistent units
      media: i2c: imx415: Link frequencies are not exclusive to num lanes
      media: imx219: Adjust PLL settings based on the number of MIPI lanes
      media: i2c: imx219: make HBLANK r/w to allow longer exposures

David Plowman (1):
      media: i2c: imx219: Correct the minimum vblanking value

Hans Verkuil (1):
      media: pci: ipu6: drop vb2_ops_wait_prepare/finish

Hans de Goede (15):
      media: hi556: Fix memory leak (on error) in hi556_check_hwcfg()
      media: hi556: Add missing '\n' to hi556 error messages
      media: hi556: Improve error logging when fwnode is not found
      media: hi556: Don't log hi556_check_hwcfg() errors twice
      media: ov08x40: Properly turn sensor on/off when runtime-suspended
      media: ov08x40: Move fwnode_graph_get_next_endpoint() call up
      media: ov08x40: Get reset GPIO and regulators on ACPI platforms too
      media: ov08x40: Get clock on ACPI platforms too
      media: ov08x40: Move ov08x40_identify_module() function up
      media: ov08x40: Improve ov08x40_identify_module() error logging
      media: ov08x40: Improve ov08x40_[read|write]_reg() error returns
      media: ov08x40: Add missing ov08x40_identify_module() call on stream-start
      media: ov08x40: Add missing '\n' to ov08x40_check_hwcfg() error messages
      media: ov08x40: Don't log ov08x40_check_hwcfg() errors twice
      media: dw9719: Add DW9761 support

Jai Luthra (3):
      media: i2c: imx219: Rename VTS to FRM_LENGTH
      media: i2c: imx219: Increase minimum LLP to fix blocky artefacts
      media: i2c: imx219: Scale the pixel rate for analog binning

Sakari Ailus (19):
      Revert "media: imx214: Fix the error handling in imx214_probe()"
      media: i2c: imx214: Rectify probe error handling related to runtime PM
      media: i2c: ov2740: Free control handler on error path
      media: i2c: ov2740: Small cleanups
      media: i2c: ccs: Set the device's runtime PM status correctly in remove
      media: i2c: ccs: Set the device's runtime PM status correctly in probe
      media: i2c: imx219: Rectify runtime PM handling in probe and remove
      media: i2c: imx319: Rectify runtime PM handling probe and remove
      media: i2c: ov7251: Set enable GPIO low in probe
      media: i2c: ov7251: Introduce 1 ms delay between regulators and en GPIO
      media: v4l: Support passing media pad argument to v4l2_get_link_freq()
      media: v4l: Support obtaining link frequency via get_mbus_config
      media: Documentation: Update link frequency driver documentation
      media: Documentation: tx-rx: Move transmitter control out of CSI-2 part
      media: Documentation: Receiver drivers should call v4l2_get_link_freq()
      media: v4l: Memset argument to 0 before calling get_mbus_config pad op
      media: intel/ipu6: Obtain link frequency from the remote subdev pad
      media: ivsc: csi: Obtain link frequency from the media pad
      media: v4l: Convert the users of v4l2_get_link_freq to call it on a pad

Vladimir Zapolskiy (1):
      media: qcom: camss: switch CSID to defined MIPI CSI data type IDs

 .../bindings/media/st,stm32mp25-csi.yaml           |    5 +-
 Documentation/driver-api/media/tx-rx.rst           |   26 +-
 drivers/media/i2c/Kconfig                          |    1 +
 drivers/media/i2c/ccs/ccs-core.c                   |    6 +-
 drivers/media/i2c/dw9719.c                         |  113 +-
 drivers/media/i2c/hi556.c                          |   45 +-
 drivers/media/i2c/imx214.c                         | 1281 ++++++++++++--------
 drivers/media/i2c/imx219.c                         |  313 +++--
 drivers/media/i2c/imx319.c                         |    9 +-
 drivers/media/i2c/imx415.c                         |  183 +--
 drivers/media/i2c/ov08x40.c                        |  167 +--
 drivers/media/i2c/ov2740.c                         |   27 +-
 drivers/media/i2c/ov7251.c                         |    4 +-
 drivers/media/i2c/st-mipid02.c                     |    5 +-
 drivers/media/i2c/tc358746.c                       |    4 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |   11 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |   12 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |    2 -
 drivers/media/pci/intel/ivsc/mei_csi.c             |   78 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |    4 +-
 drivers/media/platform/nxp/imx-mipi-csis.c         |    5 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |   11 +-
 drivers/media/platform/qcom/camss/camss-csid.c     |  121 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |   23 -
 drivers/media/platform/qcom/camss/camss-vfe-gen1.c |    9 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |    9 +-
 drivers/media/platform/qcom/camss/camss.c          |   27 +-
 drivers/media/platform/qcom/camss/camss.h          |    2 +-
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   |    4 +-
 drivers/media/platform/st/stm32/stm32-csi.c        |  106 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |   23 +-
 drivers/media/platform/ti/cal/cal-camerarx.c       |    3 +-
 drivers/media/platform/ti/cal/cal.c                |    4 +-
 drivers/media/platform/ti/cal/cal.h                |    1 +
 drivers/media/v4l2-core/v4l2-common.c              |   32 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |    2 +
 include/media/v4l2-common.h                        |   19 +-
 include/media/v4l2-mediabus.h                      |    2 +
 include/media/v4l2-subdev.h                        |    4 +-
 39 files changed, 1555 insertions(+), 1148 deletions(-)

-- 
Kind regards,

Sakari Ailus

