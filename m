Return-Path: <linux-media+bounces-12195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CDE8D3F54
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 22:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A955B25117
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 20:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA511C2332;
	Wed, 29 May 2024 20:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="Otl0aylM"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B226113B290
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 20:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717013022; cv=pass; b=ELxfgKE3SZ7qGvh+P+74TEUa5HU/cJ8GCeqdQI4q00OdmCEE0pdYC4ZSr2WF8xR8AjODIEblaPp6yAyKs96F8SIrk3m5RFkVC6WbdQzjODW8sFDviytjca/smtiOqoJUNiT8TXwcRPdlQ5bBY+1lREDHPkwYXPsWSDrXf9oJueg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717013022; c=relaxed/simple;
	bh=+ih+BD0Fgi3olc1GIxlj9UoM2iNncoD5aLmqmx2x27k=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LymrjnFVknzOTO8cGZ5CfP5PrqFIsMmAxe/SG8u5KkTpxcsZ0t7rcmjFqwWQPB/VizpTun8+STW3tOQBqKaongZaVNDC9FJ4cWCUEsXPbYii4twcq3ptp3NygI+JA6YOrht1CuvRl1TP6qknWEkAHVC4+9DconLc/W6S0oRell0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=Otl0aylM; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4VqL0y45c7zyS1
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 23:03:30 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1717013010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YA/pO+1PLiNXTolaOvIV6v58W/oFHwNBJ7pxOyU1L7s=;
	b=Otl0aylMXuSAbE4Rrpu5CBcihbs8cH+0pLiD6l5/OtPvlcj5xthSWWKrJF7a7B7Z/lxXDR
	0Ptwt01uWnZCgGCYjpzm6dsQxV6rci9euowaUtvgq12GqbJ4kdO3E6PX76bTIevXr19hXM
	aUXXqyyPtWAtZ/mAqa6EKPJvaRhIXlA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1717013010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YA/pO+1PLiNXTolaOvIV6v58W/oFHwNBJ7pxOyU1L7s=;
	b=bpRnmXDQu58+DPAspSPsbHvVSza3I6T8SsQht1Ym85TiAQYbY2JwyCsOMTzYjVEYTvc99e
	QWKGz4fGvdXH7VHzFBQLR42TUZXV+Bj1pEA181rOqkwdnFJ6+O8uSRPaWYQXsmdU9EUIkg
	fsbou0/9DjLNkat9MgoyBaeWk69K4CA=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1717013010; a=rsa-sha256; cv=none;
	b=vr+DJmBDKJwtJvZ7YoT3FZ/TZtmG0m5wBfzFr7yS2pmGnPigl7tV7gY7DYIcEEkAjOsi7G
	6rBLVy7uw+XGp5+qWIJNUAHpwyb9MKsO1gJLrJThAWtLaxZ338wipiUtg20VyVM1Zutrii
	U7wDdBPPeWSlVFfXSae9IvDWrfeRF68=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0C0F9634C93
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 23:00:23 +0300 (EEST)
Date: Wed, 29 May 2024 20:00:23 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.11] V4L2 patches
Message-ID: <ZleJV5YSl92-13CT@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Hans,

Here's a bunch of patches for 6.11. Included are a new driver for imx283,
fixes and other improvements for imx412, imx258, max96712, IPU6,
ipu-bridge, hi848 drivers. Fixes and improvements are included for V4L2
async and compatibility improvements between s_stream and
{enable,disable}_streams, v4l2-cci and random cleanups removing unused
struct definitions.

Please pull.


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.11-1.1-signed

for you to fetch changes up to 378e20fc2e3d5e3a5976a91f2cb542feb228fac2:

  media: v4l2-cci: Always assign *val (2024-05-29 22:29:00 +0300)

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

Kieran Bingham (1):
      media: i2c: Add imx283 camera sensor driver

Luis Garcia (2):
      media: i2c: imx258: Use v4l2_link_freq_to_bitmap helper
      media: i2c: imx258: Convert to new CCI register access helpers

Niklas Söderlund (1):
      media: staging: max96712: Store format in subdev active state

Ricardo Ribalda (1):
      media: i2c: hi846: Fix V4L2_SUBDEV_FORMAT_TRY get_selection()

Sakari Ailus (3):
      media: async: Warn on attept to create an ancillary link to a non-subdev
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

 .../media/i2c/{imx258.yaml => sony,imx258.yaml}    |   11 +-
 .../devicetree/bindings/media/i2c/sony,imx283.yaml |  107 ++
 MAINTAINERS                                        |   11 +-
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/adv7511-v4l2.c                   |    5 -
 drivers/media/i2c/dw9768.c                         |    5 -
 drivers/media/i2c/hi846.c                          |    2 +-
 drivers/media/i2c/imx258.c                         | 1424 +++++++++--------
 drivers/media/i2c/imx283.c                         | 1605 ++++++++++++++++++++
 drivers/media/i2c/imx412.c                         |    9 +-
 drivers/media/i2c/ks0127.c                         |    8 -
 drivers/media/i2c/tw9910.c                         |    5 -
 drivers/media/pci/intel/ipu6/ipu6-buttress.c       |    4 +-
 drivers/media/v4l2-core/v4l2-async.c               |    7 +
 drivers/media/v4l2-core/v4l2-cci.c                 |    9 +
 drivers/media/v4l2-core/v4l2-subdev.c              |  385 +++--
 drivers/staging/media/max96712/max96712.c          |   37 +-
 include/media/ipu-bridge.h                         |    1 +
 include/media/v4l2-subdev.h                        |   34 +-
 20 files changed, 2865 insertions(+), 816 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{imx258.yaml => sony,imx258.yaml} (88%)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
 create mode 100644 drivers/media/i2c/imx283.c

-- 
Kind regards,

Sakari Ailus

