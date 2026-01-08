Return-Path: <linux-media+bounces-50192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ECBD01E0D
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 10:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5087C3126363
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 08:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C256C397ABC;
	Thu,  8 Jan 2026 08:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="PiVzaaoz"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D439396D39
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767859545; cv=pass; b=P81NRDKm9+cd1dkbDXKh+FM/vwhsvWXPH1oeZ6N0EFSrL3XGPdirAH4M7W4ALrSsTf/m5CjqRa8eXAOjwTaC1MszeN3gMRkG4K0aIxolf+xqvqEoHju8s9vujN4X6OAxcoiJkryBN0miufGOEt1zCyWBNUkw7EuyzdHU86TnhYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767859545; c=relaxed/simple;
	bh=/bW82dAdIljh6B8duJnETDnZsYt3RNEW6wcGSiiWkPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iZHiMtQkFTAHWE/gdWuh2hMPS4phJmbC9kkPuf6xTgzXhsKnBVB06KGtoGAg4psemRJLRRCyibwSJCZn3dJ9W706/y++teHLFdZhM/H/mWPHqP8/N9x5NGa1gGmc7I+KZSosL1Qnze6VMoeu9uoLHo/qRYgMN3NWMqeT6OANr0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=PiVzaaoz; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4dmyBQ59tqz49QBk;
	Thu, 08 Jan 2026 10:05:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1767859519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=+XVR1983hXM9FGC1iinq3r9Q2YqTt4n4l7I1DxTrtfo=;
	b=PiVzaaozTPj9Ey3WaJKt2ab2lC2zxHfTRMfZ+XwLeshnfwGB6yvL7XXtTDch5U6x5+EFTH
	EZIbWbqD33NniU2wdH8edt8pn2JikghYwAxOvSaf/aQp9F0VB3e1z4iisxXrl/sWEMTQP+
	Pe+ZdpN/l2MdsOs5921DUeUja6WwTf1/7tjVJDH7tWGOXuvP9l0C2YzpF9bVzGveELjM2S
	0g5E9cfYZSynwcc5GxgVtMF1qS5t3epqAxKoR3VmR9c0y2/YGx547zZ9pZmqgBK+Ntvo1T
	O56TRmToE57t+TjyC+CLu5qUisrvWUDeF5wYsKmv2y2TCrNrTKOuO4KP1+c+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1767859519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=+XVR1983hXM9FGC1iinq3r9Q2YqTt4n4l7I1DxTrtfo=;
	b=KW/B+bTE1DN+l3e55zl+zLb1lwLBpwEk0PmqUBJKR91En7AJHdyZJN699PFzsETPwtnYm2
	Sa76EThsOKCRgJQv5VgM6SijQdg6ONlEpB50rqbehr5QQZiYKc+gnbmcLxAxMxM+6vmB/R
	ZvVHH5cRxjEx0u/pKdl0YvXau6tO1c3iBSV82UfEwFCABHbm3Bcxqb5GP3MWxp6Ot8G0jw
	jNw4zi3K4xoy7L/V6WdkqPQKiBjXrr2tTGtPLGkpcjYqrnApRiBsyaUDnQQaZbQIIRceth
	ELL+ufm3ylkzxUfZ3NJOQLIAX6DrqFawqxESJsW+ET4fOfEvG62nQfuPTAOgCA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1767859519;
	b=Iee8ZZaQWJSgtoGtXuMFiM19f9Q8+PT0xf6Zjbk+oqkbNxqc+BsmU842QQ2UL7jJp4Bh6J
	STGy0j6sjXJYErzqf/3zRXgbt/DaiblryzhSZ8bP99++grejFoGzWM3M6rcwoDaOTjWzda
	RFS2/1t19+nr13Tg5/Z2jU+C+jP9ywVB3LARZDaMmn3SQld5c95f7rIhHrxbPfjfefc+LO
	nt6EjMRDnskL3f2z3cgGc0cbik92mfycG9vsExWetAig1DQVe0kFbHRri2xqvs+Ui6M/Jx
	rmPUm7Q4ZejTCJAMc3fKansWdC1soRzkMH48u7V+QUlzV4R7i5EzGBFXzXLTyw==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1D813634C50;
	Thu, 08 Jan 2026 10:05:18 +0200 (EET)
Date: Thu, 8 Jan 2026 10:05:17 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR v6.20] V4L2 camera cleanups, fixes and other
 improvements
Message-ID: <aV9lPV3_nwjD_f6N@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Please pull.


The following changes since commit 336367fab9b96db7b0ee174443c426fc6c53b912:

  media: chips-media: wave5: Fix Potential Probe Resource Leak (2026-01-05 15:56:32 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.20-1.1-signed

for you to fetch changes up to 9fca471943736b094a6ac48f095c88ff85722a68:

  media: i2c: ov5647: use our own mutex for the ctrl lock (2026-01-08 10:03:21 +0200)

----------------------------------------------------------------
V4L2 patches for 6.20
- ov5647: Locking fix (and cleanup!)
- mt9m114: ACPI support and many other improvements
- ccs: Fix for setting sub-device state and preparation for metadata
- ov2735: GPIO initial state fix
- og0ve1b, ov6211: Make vblank control writable
- ti,omap3isp: Convert bindings to YAML
- atomisp: Trivial fixes
- ov5647: Many improvements and cleanups
- dw9714: Power-on sequence fix
- v4l2-subdev: Extend S_ROUTING IOCTL error codes by -ENXIO
- ccs: Avoid potential division by zero
- v4l2-fwnode: Allow passing NULL fwnode to endpoint parsers
- v4l2-async: Fixed error handling after finding a match
- v4l2-ctrls: Set error in v4l2_ctrl_new_fwnode_properties consistently
- Other documentation fixes

----------------------------------------------------------------
Alex Tran (2):
      media: dt-bindings: i2c: toshiba,et8ek8: Convert to DT schema
      media: dt-bindings: ti,omap3isp: Convert to DT schema

Arjun Changla (1):
      staging: media: atomisp: fix trailing statement

Dave Stevenson (7):
      media: i2c: ov5647: Add support for regulator control
      media: i2c: ov5647: Use v4l2_async_register_subdev_sensor for lens binding
      media: i2c: ov5647: Add control of V4L2_CID_HBLANK
      media: i2c: ov5647: Tidy up mode registers to make the order common
      media: i2c: ov5647: Separate out the common registers.
      media: i2c: ov5647: Use the same PLL config for full, 1080p, and binned modes
      media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY control

David Plowman (4):
      media: i2c: ov5647: Correct pixel array offset
      media: i2c: ov5647: Correct minimum VBLANK value
      media: i2c: ov5647: Sensor should report RAW color space
      media: i2c: ov5647: Support HFLIP and VFLIP

Elgin Perumbilly (1):
      media: i2c: ov2735: request reset GPIO as initially asserted

Hans de Goede (14):
      media: aptina-pll: Debug log p1 min and max values
      media: mt9m114: Use aptina-PLL helper to get PLL values
      media: mt9m114: Lower minimum vblank value
      media: mt9m114: Fix default hblank and vblank values
      media: mt9m114: Tweak default hblank and vblank for more accurate fps
      media: mt9m114: Avoid a reset low spike during probe()
      media: mt9m114: Put sensor in reset on power down
      media: mt9m114: Add and use mt9m114_ifp_get_border() helper function
      media: mt9m114: Adjust IFP selections and source format when source format changes to/from RAW10
      media: mt9m114: Update source pad selection and format when sink pad format changes
      media: mt9m114: Don't allow changing the IFP crop/compose selections when bypassing the scaler
      media: mt9m114: Drop start-, stop-streaming sequence from initialize
      media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
      media: mt9m114: Add ACPI enumeration support

Jai Luthra (5):
      media: i2c: ov5647: Initialize subdev before controls
      media: i2c: ov5647: Fix PIXEL_RATE value for VGA mode
      dt-bindings: media: ov5647: Add optional regulators
      dt-bindings: media: ov5647: Allow props from video-interface-devices
      media: i2c: ov5647: Tidy up PIXEL_RATE control

Laurent Pinchart (1):
      media: i2c: ov5647: Parse and register properties

Ricardo Ribalda (1):
      media: dw9714: Fix powerup sequence

Sakari Ailus (16):
      media: v4l2-ctrls: Set error v4l2_ctrl_new_fwnode_properties consistently
      media: v4l2-fwnode: Allow passing NULL fwnode to endpoint parsers
      media: ccs: Avoid possible division by zero
      media: v4l2-async: Fix error handling on steps after finding a match
      media: Documentation: Clean up figure titles
      media: Documentation: Fix routing documentation flag references
      media: Documentation: Document -ENXIO for VIDIOC_SUBDEV_S_ROUTING
      media: v4l2-subdev: Extend VIDIOC_SUBDEV_S_ROUTING error codes
      media: ccs: No need to set streaming to false in power off
      media: ccs: Move ccs_pm_get_init function up
      media: ccs: Rename out label of ccs_start_streaming
      media: ccs: Move ccs_validate_csi_data_format up
      media: ccs: Fix setting initial sub-device state
      media: ccs: Use {enable,disable}_streams operations
      media: ccs: Track streaming state
      media: ccs: Support frame descriptors

Vladimir Zapolskiy (2):
      media: i2c: ov6211: make configurable vblank control of the sensor
      media: i2c: og0ve1b: make configurable vblank control of the sensor

Xiaolei Wang (1):
      media: i2c: ov5647: use our own mutex for the ctrl lock

Zixuan Dong (1):
      media: staging: atomisp: remove redundant OOM error messages

 .../devicetree/bindings/media/i2c/ovti,ov5647.yaml |  14 +-
 .../bindings/media/i2c/toshiba,et8ek8.txt          |  55 ---
 .../bindings/media/i2c/toshiba,et8ek8.yaml         |  87 ++++
 .../devicetree/bindings/media/ti,omap3isp.txt      |  71 ----
 .../devicetree/bindings/media/ti,omap3isp.yaml     | 189 +++++++++
 .../userspace-api/media/v4l/dev-raw-vbi.rst        |   6 +-
 .../userspace-api/media/v4l/dev-subdev.rst         |  17 +-
 .../userspace-api/media/v4l/subdev-formats.rst     |   2 +-
 .../media/v4l/vidioc-subdev-g-routing.rst          |   9 +-
 MAINTAINERS                                        |   1 +
 drivers/media/i2c/Kconfig                          |   1 +
 drivers/media/i2c/aptina-pll.c                     |   2 +
 drivers/media/i2c/ccs/ccs-core.c                   | 304 ++++++++------
 drivers/media/i2c/ccs/ccs.h                        |   6 +-
 drivers/media/i2c/dw9714.c                         |   2 +-
 drivers/media/i2c/mt9m114.c                        | 271 ++++++++----
 drivers/media/i2c/og0ve1b.c                        |  55 ++-
 drivers/media/i2c/ov2735.c                         |   2 +-
 drivers/media/i2c/ov5647.c                         | 467 ++++++++++-----------
 drivers/media/i2c/ov6211.c                         |  55 ++-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |   2 +-
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.c  |   2 +-
 drivers/media/v4l2-core/v4l2-async.c               |  45 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |   3 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |   3 +
 drivers/media/v4l2-core/v4l2-subdev.c              |   2 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |   5 +-
 .../isp/kernels/fc/fc_1.0/ia_css_formats.host.c    |   3 +-
 include/media/v4l2-ctrls.h                         |   3 +
 include/media/v4l2-fwnode.h                        |   8 +-
 30 files changed, 1050 insertions(+), 642 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/ti,omap3isp.txt
 create mode 100644 Documentation/devicetree/bindings/media/ti,omap3isp.yaml

-- 
Kind regards,

Sakari Ailus

