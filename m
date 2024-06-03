Return-Path: <linux-media+bounces-12453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9F98D7FAB
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 12:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3A1D1C208A0
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 10:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE8881AC9;
	Mon,  3 Jun 2024 10:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="afWAS6IJ"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0733C77A1E
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 10:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717409239; cv=pass; b=XC4S8mlfc9Eve9eXeW7Dx1M9F2i9FpOPCExO/Orzk+1r1570n0LHGNHvTMN3vLY/tiownfnTkScf9MkbCs/C7tQ0L5y1QuAeJu1KgcMTojgkXMvliQTzysYza7TlJBa3afosJikV1mg+Ik0+seKNXtPRQYYjI6GiaFTpSw3w1OU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717409239; c=relaxed/simple;
	bh=O2bs3x92HV+XzGWd7xERpspirT9FSWUygO0xbwmzsYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nFnp0dfT2Og+s5j8ycJlrq+EKj1McUb7QhsMOXj5Lk1JJ9wVKCK7gmMoI6va3+gHhyPgacpvipsv1hcJbKE8KeWFdwCWfhzUKadaUAI+24AVwnh80tqlEqsb8gIgLjsgDcnNhEoNFgkkt8ahUB1ODg5GoZS15bEBWdwkSKOTDRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=afWAS6IJ; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Vt8QS1g81z49Ptk;
	Mon,  3 Jun 2024 13:01:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1717408912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vBblULLj8iZz7yC1/sJhjh0mNQiriN/Jwc+vKvjJgTI=;
	b=afWAS6IJnX6uyvzpjPbJDhVZ/aeCoE03ECvjn54/WmAvuXAbdQQ2eAECTz+Yq/MSkKoLGx
	FPrrdESU4FVv/1AgYwgPCkbYm8/LxWI4dQYQPIAyoIdQwnF9KT4Fzy6mRIJyslA9Xou7Nk
	DqWN+ZeMUmsGKR1PyXVYQwNQtbpsnq/z2CQK6f723x2UMVPQv062ty7MNepLncyQoFO+mX
	zmUjoDGdLhaxD6UJ7KJJiWP6jH9Ij0LAHUycmjjHNFxt1v31rUtIpfFAnR7iWTjpmxb+Qq
	7VE6CL1HNpIjy21Gd34Zf8aRM6pQ/kXUVAyNy2Q3Lhv97W0QDMXN3qkYVTZnXQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1717408912; a=rsa-sha256;
	cv=none;
	b=suUJecgENrfubBI5C3+eLJPsB6iyQM45gfctOGLafdEl4oEcAxyyOeNB+me9902X0cGoYS
	++fc2b6A45lAi7MmRkWM2vH3V3YdXihGktRMv4785oi72qZc7gf4cIyFtejnRmslqxg7UK
	Qp2vFkdc+JtK0QEWXPpsweDw4IxPYs8E9pGPn48eMBLAEKQcsWDtpxhMA++btFGhkWeLyv
	nM31lDvfhJzNx7RKLI+cz0+i0ZaeGGfyniEkkOp1kaCEztH+rLFDIQ8tko7R6JcSm9fEQm
	W2gYzxyFdQYir1jLye1N4Zt87H281V+fxds3gdIZo6wc+j6cBXRgAgps7c2Tog==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1717408912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vBblULLj8iZz7yC1/sJhjh0mNQiriN/Jwc+vKvjJgTI=;
	b=PTLrg6UKkTJPnjUm6OP82HkhFK+olL7sFvJmBAJ2KdGTiRhkh5knOU2L7CUQGsPKwzP0y8
	lARoKFTzI6Y9u30gFe6sl7I97xazmp557MbG1Z1+RDIsyvp2uJxv/OcvRj22HjPK1wLKpb
	utNjFcdSOQJCKVFaQUVUjI0hsYrvhnvidbuvtk/OIszrJO630hIbCyWN4Be9pvnmkKLJoc
	YwtMNXbrJtC1fpJT2qv3IAkEk9BsdvA+ZXG6rkrHv+0UqI/eDBXdn5ajXl1KRuew1b0c2a
	HxGIhibM/f6ZX3gFz+yIZ5yF+0QCjLeg5sH1Q+i99p/mBGisAJqtlFL9cc3qbA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 07B87634C93;
	Mon,  3 Jun 2024 12:59:42 +0300 (EEST)
Date: Mon, 3 Jun 2024 09:59:41 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR 6.11] V4L2 patches
Message-ID: <Zl2UDUrUwuLNNOs6@valkosipuli.retiisi.eu>
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
deserialiser, fixes and improvements for imx258, ipu6, imx412, max96712 and
hi846 drivers as well as to v4l2-cci and v4l2-async. Trivial unused struct
definition removal patches from David Gilbert are included, too.

Please pull.


The following changes since commit 24147897507cd3a7d63745d1518a638bf4132238:

  media: imon: Fix race getting ictx->lock (2024-05-31 14:20:40 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.11-1.2-signed

for you to fetch changes up to 47eb7e0f84817776dad126b9e1bece6dbc35d90e:

  drivers: media: max96717: stop the csi receiver before the source (2024-06-03 12:43:40 +0300)

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

Julien Massot (5):
      dt-bindings: media: add Maxim MAX96717 GMSL2 Serializer
      dt-bindings: media: add Maxim MAX96714 GMSL2 Deserializer
      media: i2c: add MAX96717 driver
      media: i2c: add MAX96714 driver
      drivers: media: max96717: stop the csi receiver before the source

Kieran Bingham (1):
      media: i2c: Add imx283 camera sensor driver

Laurent Pinchart (2):
      media: v4l2-subdev: Fix v4l2_subdev_state_get_format() documentation
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
 30 files changed, 5291 insertions(+), 940 deletions(-)
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

