Return-Path: <linux-media+bounces-35850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BFAAE7B03
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 10:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C059F3BF8E7
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 08:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F9028469D;
	Wed, 25 Jun 2025 08:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="QWjYZSwK"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDD920DD40
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 08:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841768; cv=pass; b=RgTC0RLR2jxXvYNh2W+iZIp25gU0vdD/c8y4GbnzR5mIKRQ+3UEPYFqqp4IgIH0Bs4XI3GXjVCJGqe9977eQRMYFj9iI52kp+ndJHeQVFKI2bVIaVefA5LP48uDglivtbt1Jb0rsf+pe8E64AOd6OXcurhD6hTz0JL66WQ6LBcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841768; c=relaxed/simple;
	bh=bClblmsEGSFVXUs16MzyZHbEmX2PujJwD0UIM+tri+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X082/hRLrqE+goKckmh4VznHDCqeZ+L9xXKdNp4cJB//sBS8PgjCRdqxmIsDwPughrb5a7egsAnV6MitkW8O2hnG5mTJ/6VN9VNz4ujz7BNNDhmNTb9sQs4gLTZIW+1Bkvc+yFMhZ6J7vBaEr7Am/SUFlj4iw08YZxNcqYzc4eM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=QWjYZSwK; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4bRwdp143wz49Q5s;
	Wed, 25 Jun 2025 11:55:57 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1750841758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r92Axn/7dprQex3MRVG9QSwFYWG4zHWyr4V1KtRICl4=;
	b=QWjYZSwKWK5jRF2+8cURr03vXKFiaXypmZjOxSB8guf4qAXuMi/tu2S86MoYWFIqq5ylax
	2rM5qdMrhRnY5e37XcbuxHTkdpkqN8Fq2nrjrd4GcCxHUPvyuvertZkO2gREqyUozfkEQJ
	eamIKD+KCzK/PbXvYEKDek2Y0bPMaP0lwRt3Q0yjI6jWsU8/gW339Lcp3wdSJj4xy5heTO
	Fb/65J9W1e+Y5FmNy5WOBDWB1JVPz4KEZ959k02cJ6TquhEM44HwId+C77Umb+VotQu+lg
	9+IsZWTd+ioiB/9eRyUWQZVLuP1gz+7X+HvXrvmSftQ2np2T+Eje+XZGdEwuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1750841758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r92Axn/7dprQex3MRVG9QSwFYWG4zHWyr4V1KtRICl4=;
	b=be1pNXYAZIsiTFJr3dF3fsEMedEmNvlQqgpVr57kOiKxnCHrCG+QERYxM2WmxAQuhdl/M9
	pk/RJlFAnzuonsuRMa5Spvnv04+cxLv0mIHWMdieKtMN6wUlByNe/EgKNqajDMKi4+SlFI
	NVhxTWH0mef0wzNIgSiRQ4shXW6Nx1OJHFWzdHH9cWwnvMhC8b9mX7VsaiQCxo5SsLIz8U
	XLpbKp2tS8IHcKanLwHjzWuxJEKjCmrStAnkhy1blM/uEyRkzt/h8rZzbF+aZpz+Ll9liO
	Bt1WnpdaAY72qG2N7rJ0ZDPaiZ4YskJpwsoQomThyE/jnDomwLn2U0bF1VYfcA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1750841758; a=rsa-sha256;
	cv=none;
	b=s1q9MfRnaKk7fg6a4Iar/DITtl4eMVIoHLMYEzCS8tNYf7BaxDrcxt8H6H0tqFuSdXFh2c
	mJ/51REV8FSAWzJDDwEC5hcz4CHk5FJ1mornnfjIDxHlsoOg6L5BqnVC6AZGUMjVCOxuoY
	lib3+nOlLU1BFXZzpcu1pzkSQqWi/DeQvF5WIfXivQziW1kaCcj6Sh7bCMPdt/EIhjBf/Z
	gsz/vMt1FFh+FQJCanLs2gK9+bQBLRtZCepG0DgS4i9frppUfiXuxpKS3cm3X4aNA34z49
	A6QRSl8D4Hqtyc/fw5px/0c0Qqzlb1NhJ8yzpvaCFn/VTfqg72GK+MHHnEm/yA==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9701D634C93;
	Wed, 25 Jun 2025 11:55:57 +0300 (EEST)
Date: Wed, 25 Jun 2025 08:55:57 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com
Subject: [GIT PULL FOR 6.17] V4L2 fixes for camera sensors (imx214, vd55g1,
 ov5693, ov7251, ov8865 and ov5670) mostly, V4L2 framework improvements, more
Message-ID: <aFu5ndWbP149qCeB@valkosipuli.retiisi.eu>
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

This PR includes:

- Fixes and other improvements to various sensor drivers: imx214, vd55g1,
  ov5670, ov5693, ov7251, ov8865, ov8858, ov2740, mt9m114, imx415), serdes
  devices (ds90ub913, ds90ub953, ds90ub960, max96714 and max96717) and
  lt6911uxe HDMI to CSI-2 bridge.

- Control handler freeing improvements.

- Miscellaneous MAINTAINER patches for Alvium, ivsc drivers.

- DT binding improvements for imx214, imx258, mt9m114 and ov8858.

- V4L2 sub-device framework improvements for routing.

- New device support in IPU bridge.

- Moving IPU3-CIO2 to use sub-device active state.

- Documentation cleanups and a small vimc cleanup.

- Dan Scally's int3472 board code amendment for Dell 7212 is also
  included, acked by Ilpo to be merged via the Media tree.

Please pull.


The following changes since commit c0b1da281d84d33281fc49289f0c7f8aada450ff:

  media: rc: ir-spi: avoid overflow in multiplication (2025-06-23 12:11:04 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.17-1.4-signed

for you to fetch changes up to 83fb1a87f82933fca5de354917d3a5b136f35919:

  media: i2c: max96714: Drop check on number of active routes (2025-06-24 15:49:50 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.17

----------------------------------------------------------------
André Apitzsch (5):
      media: i2c: imx214: Reorder imx214_parse_fwnode call
      media: i2c: imx214: Prepare for variable clock frequency
      media: i2c: imx214: Make use of CCS PLL calculator
      media: dt-bindings: sony,imx214: Deprecate property clock-frequency
      media: i2c: imx214: Remove hard-coded external clock frequency

Andy Shevchenko (1):
      media: i2c: max96717: Drop unused field assignment

Benjamin Mugnier (4):
      media: i2c: vd55g1: Fix RATE macros not being expressed in bps
      media: i2c: vd55g1: Fix return code in vd55g1_enable_streams error path
      media: i2c: vd55g1: Setup sensor external clock before patching
      media: i2c: vd55g1: Use first index of mbus codes array as default

Daniel Scally (3):
      media: i2c: Defer ov5670_probe() if endpoint not found
      platform/x86: int3472: Add board data for Dell 7212
      media: ipu-bridge: Add _HID for OV5670

Dongcheng Yan (1):
      media: i2c: set lt6911uxe's reset_gpio to GPIOD_OUT_LOW

Hanne-Lotta Mäenpää (1):
      media: Documentation: Improve grammar, formatting in Video4Linux

Hans de Goede (8):
      media: ipu-bridge: Add link-frequency to the GC0310 entry
      media: ivsc: Fix crash at shutdown due to missing mei_cldev_disable() calls
      media: ipu-bridge: Add Toshiba T4KA3 HID to list of supported sensor
      media: ipu-bridge: Add Onsemi MT9M114 HID to list of supported sensors
      media: ov5693: Improve error logging when fwnode is not found
      media: ov7251: Improve error logging when fwnode is not found
      media: ov8865: Improve error logging when fwnode is not found
      media: ipu-bridge: Improve error logging when waiting for IVSC to become ready

Jason Chen (1):
      media: ipu-bridge: Add support for additional link frequencies

Laurent Pinchart (6):
      media: ipu3-cio2: Use V4L2 subdev active state
      media: v4l2-subdev: Limit the number of active routes to V4L2_FRAME_DESC_ENTRY_MAX
      media: i2c: ds90ub913: Drop check on number of active routes
      media: i2c: ds90ub953: Drop check on number of active routes
      media: i2c: ds90ub960: Drop check on number of active routes
      media: i2c: max96714: Drop check on number of active routes

Martin Hecht (1):
      MAINTAINERS: Update my email address to gmail.com

Mathis Foerst (4):
      media: dt-bindings: mt9m114: Add slew-rate DT-binding
      media: mt9m114: Bypass PLL if required
      media: mt9m114: Factor out mt9m114_configure_pa
      media: mt9m114: Fix deadlock in get_frame_interval/set_frame_interval

Matthias Fend (4):
      media: i2c: imx415: Request the sensor clock without a name
      media: dw9714: coding style fixes
      media: dw9714: move power sequences to dedicated functions
      media: dw9714: add support for powerdown pin

Niklas Söderlund (1):
      media: v4l2-common: Reduce warnings about missing V4L2_CID_LINK_FREQ control

Olivier Benjamin (2):
      dt-bindings: media: ov8858: inherit video-interface-devices properties
      dt-bindings: media: imx258: inherit video-interface-devices properties

Sakari Ailus (8):
      media: dt-bindings: mipi-ccs: Refer to video-interface-devices.yaml
      media: vimc: Don't explicitly set bus_info
      media: v4l2-ctrls: Don't reset handler's error in v4l2_ctrl_handler_free()
      media: v4l2-ctrls: Return the handler's error in v4l2_ctrl_handler_free()
      media: Documentation: Document new v4l2_ctrl_handler_free() behaviour
      media: ivsc: Remove Wentong's e-mail address
      media: ivsc: Add MAINTAINERS entry
      media: ov2740: Remove shorthand variables

 .../devicetree/bindings/media/i2c/mipi-ccs.yaml    |  13 +-
 .../bindings/media/i2c/onnn,mt9m114.yaml           |   9 +
 .../devicetree/bindings/media/i2c/ovti,ov8858.yaml |   4 +-
 .../devicetree/bindings/media/i2c/sony,imx214.yaml |  29 ++-
 .../devicetree/bindings/media/i2c/sony,imx258.yaml |   4 +-
 Documentation/driver-api/media/v4l2-controls.rst   |   9 +-
 Documentation/userspace-api/media/v4l/biblio.rst   |   2 +-
 .../userspace-api/media/v4l/dev-sliced-vbi.rst     |   4 +-
 .../userspace-api/media/v4l/ext-ctrls-fm-rx.rst    |  11 +-
 .../userspace-api/media/v4l/ext-ctrls-fm-tx.rst    |  21 +-
 .../userspace-api/media/v4l/pixfmt-srggb12p.rst    |   4 +-
 .../userspace-api/media/v4l/pixfmt-srggb14p.rst    |   2 +-
 MAINTAINERS                                        |  12 +-
 drivers/media/i2c/Kconfig                          |   5 +-
 drivers/media/i2c/ds90ub913.c                      |   8 -
 drivers/media/i2c/ds90ub953.c                      |   8 -
 drivers/media/i2c/ds90ub960.c                      |   8 -
 drivers/media/i2c/dw9714.c                         |  62 +++--
 drivers/media/i2c/imx214.c                         | 263 ++++++++++++++++-----
 drivers/media/i2c/imx415.c                         |   2 +-
 drivers/media/i2c/lt6911uxe.c                      |   2 +-
 drivers/media/i2c/max96714.c                       |   7 -
 drivers/media/i2c/max96717.c                       |   1 -
 drivers/media/i2c/mt9m114.c                        | 171 ++++++++------
 drivers/media/i2c/ov2740.c                         |  18 +-
 drivers/media/i2c/ov5670.c                         |   9 +-
 drivers/media/i2c/ov5693.c                         |   7 +-
 drivers/media/i2c/ov7251.c                         |   7 +-
 drivers/media/i2c/ov8865.c                         |   3 +-
 drivers/media/i2c/vd55g1.c                         |  32 +--
 drivers/media/pci/intel/ipu-bridge.c               |  13 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |  82 +++----
 drivers/media/pci/intel/ipu3/ipu3-cio2.h           |   2 -
 drivers/media/pci/intel/ivsc/mei_ace.c             |   4 +-
 drivers/media/pci/intel/ivsc/mei_csi.c             |   4 +-
 drivers/media/test-drivers/vimc/vimc-capture.c     |   2 -
 drivers/media/test-drivers/vimc/vimc-core.c        |   2 -
 drivers/media/v4l2-core/v4l2-common.c              |   8 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  12 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |  14 ++
 .../x86/intel/int3472/tps68470_board_data.c        | 128 ++++++++++
 include/media/v4l2-ctrls.h                         |   4 +-
 42 files changed, 668 insertions(+), 344 deletions(-)

-- 
Kind regards,

Sakari Ailus

