Return-Path: <linux-media+bounces-12459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 483C78D837D
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 15:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A95BB253A3
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 13:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1418C12C528;
	Mon,  3 Jun 2024 13:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="WEEu1Rac"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B33548F7
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 13:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717420102; cv=pass; b=mY6KWqFUDi5ZMGeavpBhYxEKLPmVzk3WdnHZ4tQNXQPwaoyNPu0YdNtcWlDCg09jO/LHMm4YFi0zy5AibJ3ed/wJNcb1b003/IQEg1aswA5kn729YhvMbnLUHwaJl9h3ZV+wLEc225EAYhkr5wiLIwfBa46+eGdGUpQrlChXqj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717420102; c=relaxed/simple;
	bh=5lVUzm8FVov+uP1S4ozxZRxy4brPy7PH5dRHhzRp/k8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oekq07f4Nh7ikEukuJobidwg0lgECM5rmj61p6QinbiX9AQsdzfsj8cNSdtbFT3R2XUk1NynpJ5u6gM1ADXpVEsTb2bIrZrtSbVg5rC98tpESNHXf6+FwLyANaRdkuCHTn3EgekoIWA1AdlbUIqEK8dn2PnviVZvHjN2vO+Ny/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=WEEu1Rac; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VtDYX6Gdkz49Pyc;
	Mon,  3 Jun 2024 16:08:16 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1717420097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iCXSoSmj3uCJO8Z7llK0ORpuJ/sOgMlZhAjTZZ377b0=;
	b=WEEu1RacmSD/O6jK1qlm86MVAjMWUS6s+KWytVSR37mUICMFywzuWxA5hNSDjYxKXNcODv
	r6b4bxHs5wNoT9hoZ+hkKsvaH2gv4MaqL0EEPjIhOizWjSvWTToi4wlB2sgnS0RaYaR9hc
	lCBxMozAVP62i8j6KhemxHDvCx5aykf52lgXUHspr/Py9kyUIiqR3OVOqTnjHxMUDLrI3p
	lYBUpjIN+kRHNCGRFK+hddPrpDZZ9ObBWGcKdlzqKfXwMILiiZQA8ozF9aCvuw215dfInc
	Bym8VoEO+Peqm1WTn+ecv923c2aky7khBYz38bb0GzDpSsZM+gjWUwmEwG3nug==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1717420097; a=rsa-sha256;
	cv=none;
	b=hsjQxWcyBH/d3NExPS3IMFb3htHrMYI5XFNe74oQI/Y9i9mECI/OB/xGlEz1jQENYtvKjT
	AmfOkOiCicawCcxmd3Z0y08JeVhO2447fxVu9y1PY9+amxvi00eJzuGmXbMQJF3LhRTYO1
	taAtNoJ4faGpQ3tBCTDYusfBQXYSIP8hF7mItjAipfpaZIyQLEEsVRlrzVtt3lKQ2+CkdQ
	Amjl2KxY7cBgHyZL0VpKr+b807r/kTDyk2AxtslgHwxoWNdvMhnJ1tdwUr51ucM415j0MX
	YknYrpKWDheNvhseOXI4If4bb11nUtY5nAPnlF/ks+3J9tPfgNJNaWB5346jbQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1717420097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iCXSoSmj3uCJO8Z7llK0ORpuJ/sOgMlZhAjTZZ377b0=;
	b=UqFLW6Rq7NuNuMeBXKaCunz2Artq0SwUzj3mr7zWQqBuh4FLZu4UeB79+yIYIZkBrEvG1S
	5WLwFq1eCVofKhI4iB1WjdrH9zgv1EUO9yrY0T/R0HGsxa1300mFtlxuCzyGwfeAl3UPhO
	EVymvTclFdeROrYu6miYGy0nUtLTgx9mdwg2wvMlca1b0G3KMNVmuuO5P0UpzW1ZsI4Dl8
	OzyvagGjqcv4393DbiSHkzkdA6tGSqD3MaTduyD0FddtED1XvMIlOLAU6TCEivpwCi59uA
	RxYlOzDDEGvCQ3K2MM3HgcTNZXitlGvI4PeqL8UYYbEuX9fLnmpFdemYc7IfpA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0BDC3634C93;
	Mon,  3 Jun 2024 16:06:08 +0300 (EEST)
Date: Mon, 3 Jun 2024 13:06:06 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL v2 FOR 6.11] V4L2 patches
Message-ID: <Zl2_vt9T6N-968WA@valkosipuli.retiisi.eu>
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

This PR contains Tomi's V4L2 sub-device
s_streaming/{enable,disable}_streams compatibility improvements, new
drivers for imx283 camera sensor, max9671[47] GMSL serialiser and
deserialiser, fixes and improvements for ov5693, imx258, ipu6, imx412,
max96712 and hi846 drivers as well as to v4l2-cci and v4l2-async. Trivial
unused struct definition removal patches from David Gilbert are included,
too.

since v1:

- Fix accidental squashing of Laurent's subdev state constness patches.

- Add Cc: stable to imx412 and hi846 sensor driver fixes.

- Include Hans's patch for GPIO cleanup for ov5693.

Please pull.


The following changes since commit 24147897507cd3a7d63745d1518a638bf4132238:

  media: imon: Fix race getting ictx->lock (2024-05-31 14:20:40 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.11-1.3-signed

for you to fetch changes up to c599a9865616fa1c63618002be05d3f90f4a51c3:

  media: ov5693: Drop privacy-LED GPIO control (2024-06-03 15:53:37 +0300)

----------------------------------------------------------------
V4L2 patches for 6.11

----------------------------------------------------------------
Bingbu Cao (1):
      media: ipu-bridge: add mod_devicetable.h header inclusion

Bryan O'Donoghue (1):
      media: i2c: Fix imx412 exposure control

ChiYuan Huang (1):
      media: v4l: async: Fix NULL pointer dereference in adding ancillary links

Dave Stevenson (20):
      media: i2c: imx258: Remove unused defines
      media: i2c: imx258: Make image geometry meet sensor requirements
      media: i2c: imx258: Disable digital cropping on binned modes
      media: i2c: imx258: Remove redundant I2C writes.
      media: i2c: imx258: Add regulator control
      media: i2c: imx258: Make V4L2_CID_VBLANK configurable.
      media: i2c: imx258: Split out common registers from the mode based ones
      media: i2c: imx258: Add support for 24MHz clock
      media: i2c: imx258: Add support for running on 2 CSI data lanes
      media: i2c: imx258: Follow normal V4L2 behaviours for clipping exposure
      media: i2c: imx258: Add get_selection for pixel array information
      media: i2c: imx258: Allow configuration of clock lane behaviour
      media: i2c: imx258: Correct max FRM_LENGTH_LINES value
      media: i2c: imx258: Issue reset before starting streaming
      media: i2c: imx258: Set pixel_rate range to the same as the value
      media: i2c: imx258: Support faster pixel rate on binned modes
      dt-bindings: media: imx258: Rename to include vendor prefix
      dt-bindings: media: imx258: Add alternate compatible strings
      media: i2c: imx258: Change register settings for variants of the sensor
      media: i2c: imx258: Make HFLIP and VFLIP controls writable

Dr. David Alan Gilbert (4):
      media: i2c: dw9768: remove unused struct 'regval_list'
      media: i2c: ks0127: remove unused struct 'adjust'
      media: i2c: tw9910: remove unused strust 'regval_list'
      media: i2c: adv7511: remove unused struct 'i2c_reg_value'

Hans de Goede (1):
      media: ov5693: Drop privacy-LED GPIO control

Julien Massot (5):
      dt-bindings: media: add Maxim MAX96717 GMSL2 Serializer
      dt-bindings: media: add Maxim MAX96714 GMSL2 Deserializer
      media: i2c: add MAX96717 driver
      media: i2c: add MAX96714 driver
      drivers: media: max96717: stop the csi receiver before the source

Kieran Bingham (1):
      media: i2c: Add imx283 camera sensor driver

Laurent Pinchart (3):
      media: v4l2-subdev: Fix v4l2_subdev_state_get_format() documentation
      media: v4l2-subdev: Provide const-aware subdev state accessors
      media: rkisp1: Mark subdev state pointers as const

Luis Garcia (2):
      media: i2c: imx258: Use v4l2_link_freq_to_bitmap helper
      media: i2c: imx258: Convert to new CCI register access helpers

Niklas Söderlund (1):
      media: staging: max96712: Store format in subdev active state

Ricardo Ribalda (1):
      media: i2c: hi846: Fix V4L2_SUBDEV_FORMAT_TRY get_selection()

Sakari Ailus (4):
      media: async: Warn on attept to create an ancillary link to a non-subdev
      media: ipu6: Rework CSI-2 sub-device streaming control
      media: ipu6: Print CSR messages using debug level
      media: v4l2-cci: Always assign *val

Tomi Valkeinen (11):
      media: subdev: Add privacy led helpers
      media: subdev: Use v4l2_subdev_has_op() in v4l2_subdev_enable/disable_streams()
      media: subdev: Add checks for subdev features
      media: subdev: Fix use of sd->enabled_streams in call_s_stream()
      media: subdev: Improve v4l2_subdev_enable/disable_streams_fallback
      media: subdev: Add v4l2_subdev_is_streaming()
      media: subdev: Support privacy led in v4l2_subdev_enable/disable_streams()
      media: subdev: Refactor v4l2_subdev_enable/disable_streams()
      media: subdev: Support single-stream case in v4l2_subdev_enable/disable_streams()
      media: subdev: Support non-routing subdevs in v4l2_subdev_s_stream_helper()
      media: subdev: Improve s_stream documentation

Umang Jain (1):
      media: dt-bindings: media: Add bindings for IMX283

 .../bindings/media/i2c/maxim,max96714.yaml         |  174 +++
 .../bindings/media/i2c/maxim,max96717.yaml         |  157 ++
 .../media/i2c/{imx258.yaml => sony,imx258.yaml}    |   11 +-
 .../devicetree/bindings/media/i2c/sony,imx283.yaml |  107 ++
 MAINTAINERS                                        |   25 +-
 drivers/media/i2c/Kconfig                          |   45 +
 drivers/media/i2c/Makefile                         |    3 +
 drivers/media/i2c/adv7511-v4l2.c                   |    5 -
 drivers/media/i2c/dw9768.c                         |    5 -
 drivers/media/i2c/hi846.c                          |    2 +-
 drivers/media/i2c/imx258.c                         | 1424 +++++++++--------
 drivers/media/i2c/imx283.c                         | 1605 ++++++++++++++++++++
 drivers/media/i2c/imx412.c                         |    9 +-
 drivers/media/i2c/ks0127.c                         |    8 -
 drivers/media/i2c/max96714.c                       | 1024 +++++++++++++
 drivers/media/i2c/max96717.c                       |  927 +++++++++++
 drivers/media/i2c/ov5693.c                         |   10 -
 drivers/media/i2c/tw9910.c                         |    5 -
 drivers/media/pci/intel/ipu6/ipu6-buttress.c       |    4 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |   98 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h      |    2 -
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |    3 -
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     |   43 +-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |    8 +-
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |    8 +-
 drivers/media/v4l2-core/v4l2-async.c               |    7 +
 drivers/media/v4l2-core/v4l2-cci.c                 |    9 +
 drivers/media/v4l2-core/v4l2-subdev.c              |  385 +++--
 drivers/staging/media/max96712/max96712.c          |   37 +-
 include/media/ipu-bridge.h                         |    1 +
 include/media/v4l2-subdev.h                        |   90 +-
 31 files changed, 5291 insertions(+), 950 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
 rename Documentation/devicetree/bindings/media/i2c/{imx258.yaml => sony,imx258.yaml} (88%)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
 create mode 100644 drivers/media/i2c/imx283.c
 create mode 100644 drivers/media/i2c/max96714.c
 create mode 100644 drivers/media/i2c/max96717.c

-- 
Kind regards,

Sakari Ailus

