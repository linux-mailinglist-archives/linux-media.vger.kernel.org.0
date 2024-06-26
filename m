Return-Path: <linux-media+bounces-14179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8499186BD
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 18:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40FF01F21441
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 16:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F8C18FC7F;
	Wed, 26 Jun 2024 16:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MJV8yx9Z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC2D18EFC0
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 16:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417724; cv=none; b=SZ++zdTbE7aRW87V640wy6Z0dR0ZNxWVoHOx81gyOWh9PxBJMx2Ycf2KPWM/zb4IE2QALzVoAScDn5SOPyM+AQLtpDvhbm679IXN8RR1FScnx+UyUaZV+HaWYXlfjwj0GRXQden1eOY53EbhdIqbMxbDntxK4ifhl+RTFRF/acs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417724; c=relaxed/simple;
	bh=XjQX8JlKTVklzl9zQCBuisUq/7yxWKoFBC00G+YyO0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tr6ncxqFBGMJWeF2w7XPNPJeTMevheQkgWB/laQcVEIPCg21Am7GM171P6DDFpXiffu2uOcSqrDj2Q/P19lULIwz5a2LDSr2AFUHftr8EPRrx2bUxXkKOBkeFCX/Ke8vMoiddvM8mGwS0y6LVrH+CYWOksnuYCT9pEL33YbgpTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MJV8yx9Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EA0D73E;
	Wed, 26 Jun 2024 18:01:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719417697;
	bh=XjQX8JlKTVklzl9zQCBuisUq/7yxWKoFBC00G+YyO0s=;
	h=From:To:Cc:Subject:Date:From;
	b=MJV8yx9ZNeeQ717ydQMKtgKBLdwt87IOHTFdHSjTlyz9Y713/McXVh3SIDEOavx8V
	 tKwvY+7N6pUMugQcfLT32ZgrnOJHrXKPggU3K6dqsbGoj7ktSVPx+D/CvLW3TCwX/a
	 AFKJUUJWkaEdH2XmYekY1vo6vpwRzE7F5Jq697kc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v10 0/8]  media: raspberrypi: Add support for PiSP Back End
Date: Wed, 26 Jun 2024 18:01:35 +0200
Message-ID: <20240626160144.87871-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v9->v10:
- Make the only uAPI field of type 'int' an '__u32' as suggested by Hans
- Rework the vb2 queue_setup() operation to correctly handle the CREATE_BUFS
  ioctl

  Report from the latest v4l2-compliance:
  Grand Total for pispbe device /dev/media1: 392, Succeeded: 392, Failed: 0, Warnings: 0

CI pipeline: https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1210895
Branch: https://gitlab.freedesktop.org/linux-media/users/jmondi/-/commits/pispbe/media-staging/be-upstream-v10

v8->v9:
- Remove reference to multiple contexts from the admin guide as suggested by
  Nick
- Fix the compressed RAW format description as suggested by Nick

v7->v8:
- Remove multiple-contexts and remove `struct pispbe_node_group`
- Address Sakari's style comments
- Remove CONFIG_PM dependency

v6->v7:
- Introduce uAPI headers earlier in the series to document them
- kernel-doc uAPI types in pisp_be_config.h
- Link pisp_be_config.h kernel documentation in metafmt documentation

v5->v6:
- minor updates
  If no further comments, I think the series is ready to be collected (for
  v6.11)

v5->v6:
- Rebase on recent media_stage master branch
  - Remove Y12 and Y14 formats as they have upstreamed already
- Squash in patch from Naush from
  https://github.com/raspberrypi/linux/pull/6140

v4->v5:
- Address Sakari's style comments on the driver
- Add Naush's tags

v3->v4:
- Rename the compressed RAW formats and change the page title
- Minor fixes to the RGB48 documentation
- Remove the clock name from bindings and driver

v2->v3:
- Expand documentation of RGB48 formats
- Add back to the bindings the 'aclk' clock-names property
  - Explicitly get the clock by name in the driver
- minor fixes

v1->v2:
- Add Y12P and Y14P formats to yuv-luma.rst instead of documenting them
  separately
- Fix typos in formats and documentation
- Adjust bindings as suggested during review
- Fix admin-guide with an up-to-media media graph (remove the HOG node)
- Add a patch to the driver to safely clean-up the video devices buffer queues
  in case of errors
  https://github.com/raspberrypi/linux/commit/9fcfb8ee070ecc2ca9b4fcf4629c4545f9cf178e

Add support for the Raspberry Pi PiSP Back End memory-2-memory ISP.
Documentation available at:
https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf

The PiSP Back End is the memory-2-memory ISP found on Raspberry Pi 5. In
conjunction with the PiSP Front End, for which a driver is expected to
hit mainline in the next weeks, it implements the Raspberry Pi 5 camera
system.

The ISP is fully supported in the Raspberry Pi libcamera version and once
patches for the PiSP Front End will hit mainline the support will land in
mainline libcamera as well.

Patch based on media-stage master branch.

Jacopo Mondi (7):
  media: uapi: pixfmt-luma: Document MIPI CSI-2 packing
  media: uapi: Add a pixel format for BGR48 and RGB48
  media: uapi: Add Raspberry Pi PiSP Back End uAPI
  media: uapi: Add meta pixel format for PiSP BE config
  media: uapi: Add PiSP Compressed RAW Bayer formats
  media: dt-bindings: Add bindings for Raspberry Pi PiSP Back End
  media: admin-guide: Document the Raspberry Pi PiSP BE

Naushir Patuck (1):
  media: raspberrypi: Add support for PiSP BE

 .../admin-guide/media/raspberrypi-pisp-be.dot |   20 +
 .../admin-guide/media/raspberrypi-pisp-be.rst |  109 +
 .../admin-guide/media/v4l-drivers.rst         |    1 +
 .../bindings/media/raspberrypi,pispbe.yaml    |   63 +
 .../userspace-api/media/v4l/meta-formats.rst  |    1 +
 .../media/v4l/metafmt-pisp-be.rst             |   56 +
 .../userspace-api/media/v4l/pixfmt-bayer.rst  |    1 +
 .../userspace-api/media/v4l/pixfmt-rgb.rst    |   54 +
 .../media/v4l/pixfmt-srggb8-pisp-comp.rst     |   74 +
 .../media/v4l/pixfmt-yuv-luma.rst             |    4 +
 MAINTAINERS                                   |    9 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/raspberrypi/Kconfig    |    5 +
 drivers/media/platform/raspberrypi/Makefile   |    3 +
 .../platform/raspberrypi/pisp_be/Kconfig      |   12 +
 .../platform/raspberrypi/pisp_be/Makefile     |    6 +
 .../platform/raspberrypi/pisp_be/pisp_be.c    | 1810 +++++++++++++++++
 .../raspberrypi/pisp_be/pisp_be_formats.h     |  519 +++++
 drivers/media/v4l2-core/v4l2-common.c         |    2 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   13 +
 .../linux/media/raspberrypi/pisp_be_config.h  |  927 +++++++++
 .../linux/media/raspberrypi/pisp_common.h     |  199 ++
 include/uapi/linux/videodev2.h                |   17 +
 24 files changed, 3907 insertions(+)
 create mode 100644 Documentation/admin-guide/media/raspberrypi-pisp-be.dot
 create mode 100644 Documentation/admin-guide/media/raspberrypi-pisp-be.rst
 create mode 100644 Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggb8-pisp-comp.rst
 create mode 100644 drivers/media/platform/raspberrypi/Kconfig
 create mode 100644 drivers/media/platform/raspberrypi/Makefile
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Kconfig
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Makefile
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h
 create mode 100644 include/uapi/linux/media/raspberrypi/pisp_be_config.h
 create mode 100644 include/uapi/linux/media/raspberrypi/pisp_common.h

--
2.45.2


