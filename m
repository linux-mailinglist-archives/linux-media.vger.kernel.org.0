Return-Path: <linux-media+bounces-23687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A52919F5F33
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 08:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E32D4168E5C
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 07:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FCF156F55;
	Wed, 18 Dec 2024 07:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="Kz/F77fM"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D434E155C83
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 07:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734506614; cv=pass; b=uhbMI9axuJ2S7QEE+rv3n7R1y9LxGLzzKPKZP/WwPWa0RgjOdEPEJiLy0fNmEtR9jTSYv1LGaqY5oYQgQN78BV33Io6PRCJEca+KuRAJr87QIurhyEy4Gz+o2PNU97BoaDH3AdtJcShKAJQYLfRKfKmPc9E9cNlUPK7uuCUR/R4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734506614; c=relaxed/simple;
	bh=8GBqflpHKbibAFveuwR8zmbKPO6pQEgw7d4TEVgp3as=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j96wRToAcAACcE9jOvuGIHoYGnUoWURXfiApTchPsNPbew92qMJ5fonxqewRCUxzgkXD24UFPTIuDzh1tQEgVqf5rpkS2VfyEDJOw86CpW5IJq7JeKc1dOGRpwD2FizrBI/+se0wdUKjEw/J6F/mAaC1wv3cCL/aX8pMDPusi5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=Kz/F77fM; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4YClXB4ShjzycN;
	Wed, 18 Dec 2024 09:23:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1734506602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t913t8+YieIgFS/WWRVz93rjaFGQRO0GGniRLBN9sw0=;
	b=Kz/F77fMvx1haeGiaHYrqj7l/vzxI7aZd/I9JYMua4XU4Gy6aQeblT7y/PxjcP/asEvpVT
	uH93F5eu2tI0pOB8oWrbhfQ/hgsdgsCVMVXZh95IHEKoafm1djloKAy2f4W2jIMa1/ehjx
	DLenARgdsVYyS+VFiBEfNPjNTcth+cM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1734506602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t913t8+YieIgFS/WWRVz93rjaFGQRO0GGniRLBN9sw0=;
	b=ZGbaxJrhQmtB5n+C4wpxYxqKgVAQkgfFMqSpNsEI6EF8KcyVlwmS0Aqnx8MO6zDN6QPtg0
	+T6dNTvcE5DzqKEUyUjP0vEPyOOg16ouBO2cDIgHxIvm1jXruTPUcgIPT7HIAmYohAcnsp
	unjwv82CirsJ0T/kBkZGFWEeHF5gzdU=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1734506602; a=rsa-sha256; cv=none;
	b=IUYz++IuKWkxD1f2bPC+6sBJGQ+GR0rFxC71j9XO/MASXYkqh3DYYnJFe0+JsjaT5LpEY0
	SxpqvJ/HN+VpwleuZ07CM3psvMQb1qkueU4EBdPeDRKbhaNEbMGvQcePTQa7Ul0zsN8RnP
	k28VLp+nod+egP7zV9T9faM3CGVIm/Y=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3949D634C96;
	Wed, 18 Dec 2024 09:23:22 +0200 (EET)
Date: Wed, 18 Dec 2024 07:23:22 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR 6.14] V4L2 fixes, imx462 support
Message-ID: <Z2J4arwqzIl9ltXC@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Mauro, Hans,

Here's a pile of patches for 6.14. Included are a large number of fixes to
a number of drivers, but also support for the imx462 sensor.

Please pull.


The following changes since commit e90c9612ac3969cb8206029a26bcd2b6f5d4a942:

  media: rockchip: rga: Fix Copyright description (2024-12-16 16:51:01 +0000)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.14-2.2-signed

for you to fetch changes up to 06022f4e6ab52b18dee64ac88fe4b7a8c60b484c:

  media: Documentation: PHY information can be obtained from OF endpoint too (2024-12-18 09:21:22 +0200)

----------------------------------------------------------------
V4L2 patches for 6.14

----------------------------------------------------------------
Cosmin Tanislav (1):
      media: mc: fix endpoint iteration

Dave Stevenson (5):
      media: i2c: imx290: Limit analogue gain according to module
      media: i2c: imx290: Register 0x3011 varies between imx327 and imx290
      media: dt-bindings: sony,imx290: Add IMX462 to the IMX290 binding
      media: i2c: imx290: Add configuration for IMX462
      media: i2c: ov9282: Correct the exposure offset

David Heidelberg (1):
      media: Documentation: PHY information can be obtained from OF endpoint too

Hans de Goede (4):
      media: ov2740: Debug log chip ID
      media: ov2740: Add camera orientation and sensor rotation controls
      media: ov2740: Add powerdown GPIO support
      media: ov2740: Add regulator support

Jiasheng Jiang (3):
      media: marvell: Add check for clk_enable()
      media: mipi-csis: Add check for clk_enable()
      media: camif-core: Add check for clk_enable()

Laurentiu Palcu (1):
      staging: media: max96712: fix kernel oops when removing module

Luca Weiss (1):
      media: i2c: imx412: Add missing newline to prints

Mehdi Djait (3):
      media: ccs: Fix cleanup order in ccs_probe()
      media: ccs: Print a warning on CCS static data parser failure
      media: ccs: Fail the probe on CCS static data parser failure

Naushir Patuck (5):
      media: imx296: Add standby delay during probe
      media: bcm2835-unicam: Improve frame sequence count handling
      media: bcm2835-unicam: Allow setting of unpacked formats
      media: bcm2835-unicam: Disable trigger mode operation
      media: bcm2835-unicam: Fix for possible dummy buffer overrun

Niklas Söderlund (4):
      media: dt-bindings: Add property to describe CSI-2 C-PHY line orders
      media: v4l: fwnode: Parse MiPI DisCo for C-PHY line-orders
      media: rcar-csi2: Allow specifying C-PHY line order
      media: rcar-csi2: Update D-PHY startup on V4M

Sakari Ailus (4):
      media: Documentation: ipu3: Remove unused and obsolete references
      media: ccs: Fix CCS static data parsing for large block sizes
      media: ccs: Clean up parsed CCS static data on parse failure
      media: Documentation: tx-rx: Fix formatting

Sam Bobrowicz (1):
      media: ov5640: fix get_light_freq on auto

Stanislaw Gruszka (2):
      media: intel/ipu6: remove cpu latency qos request on error
      media: intel/ipu6: move some boot messages to debug level

Thomas Weißschuh (1):
      media: i2c: imx208: Use const 'struct bin_attribute' callback

Tomi Valkeinen (15):
      media: i2c: ds90ub9x3: Fix extra fwnode_handle_put()
      media: i2c: ds90ub960: Fix UB9702 refclk register access
      media: i2c: ds90ub960: Fix use of non-existing registers on UB9702
      media: i2c: ds90ub960: Fix logging SP & EQ status only for UB9702
      media: i2c: ds90ub960: Fix UB9702 VC map
      media: i2c: ds90ub960: Use HZ_PER_MHZ
      media: i2c: ds90ub960: Add support for I2C_RX_ID
      media: i2c: ds90ub960: Add RGB24, RAW8 and RAW10 formats
      media: i2c: ds90ub953: Clear CRC errors in ub953_log_status()
      media: i2c: ds90ub960: Drop unused indirect block define
      media: i2c: ds90ub960: Reduce sleep in ub960_rxport_wait_locks()
      media: i2c: ds90ub960: Handle errors in ub960_log_status_ub960_sp_eq()
      media: i2c: ds90ub913: Add error handling to ub913_hw_init()
      media: i2c: ds90ub953: Add error handling for i2c reads/writes
      media: i2c: ds90ub960: Fix shadowing of local variables

 Documentation/admin-guide/media/ipu3.rst           |   6 +-
 .../devicetree/bindings/media/i2c/sony,imx290.yaml |   2 +
 .../bindings/media/video-interfaces.yaml           |  21 +++
 Documentation/driver-api/media/tx-rx.rst           |   9 +-
 drivers/media/i2c/ccs/ccs-core.c                   |  18 +-
 drivers/media/i2c/ccs/ccs-data.c                   |  15 +-
 drivers/media/i2c/ds90ub913.c                      |  26 ++-
 drivers/media/i2c/ds90ub953.c                      |  56 ++++--
 drivers/media/i2c/ds90ub960.c                      | 188 ++++++++++++++-------
 drivers/media/i2c/imx208.c                         |   2 +-
 drivers/media/i2c/imx290.c                         |  81 ++++++++-
 drivers/media/i2c/imx296.c                         |   2 +
 drivers/media/i2c/imx412.c                         |  42 ++---
 drivers/media/i2c/ov2740.c                         |  58 ++++++-
 drivers/media/i2c/ov5640.c                         |   1 +
 drivers/media/i2c/ov9282.c                         |   2 +-
 drivers/media/pci/intel/ipu6/ipu6-buttress.c       |   8 +-
 drivers/media/pci/intel/ipu6/ipu6-cpd.c            |   2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c           |   1 +
 drivers/media/platform/broadcom/bcm2835-unicam.c   |  42 +++--
 drivers/media/platform/marvell/mcam-core.c         |   7 +-
 drivers/media/platform/renesas/rcar-csi2.c         |  91 ++++++++--
 .../media/platform/samsung/exynos4-is/mipi-csis.c  |  10 +-
 .../media/platform/samsung/s3c-camif/camif-core.c  |  13 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |  43 ++++-
 drivers/media/v4l2-core/v4l2-mc.c                  |   2 +-
 drivers/staging/media/max96712/max96712.c          |   4 +-
 include/dt-bindings/media/video-interfaces.h       |   7 +
 include/media/v4l2-mediabus.h                      |  21 +++
 29 files changed, 602 insertions(+), 178 deletions(-)

-- 
Kind regards,

Sakari Ailus

