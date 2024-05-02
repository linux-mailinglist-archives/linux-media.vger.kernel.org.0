Return-Path: <linux-media+bounces-10597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8798B99A8
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 13:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D12171C21D60
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 11:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9FD5FDA6;
	Thu,  2 May 2024 11:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IYwE8UUz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A2E5D903
	for <linux-media@vger.kernel.org>; Thu,  2 May 2024 11:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714647923; cv=none; b=EHDuT8gKRu8khm4m36JsxeHF3UqnB8pjJkDpH8YtvCdU1V8OQfn4MaaRpj9MgeL2o9XNaR5Wk5sUIr8VndiyO8niP1K/wx49cfObTputpuS+MeLsYjOQAwshHK/4D6yYLmquZRF88R9c7P96z//m5KPgsYBJzfE+OhITV8wGXqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714647923; c=relaxed/simple;
	bh=BlfCHWDPrAezAI3yjHriYrE/Jlrb3KIJfcuf1g0mOpY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rzI11nwsX8b3pDfx7uL6KncMYJWWaDaS5+T5pgL6aTqpjHzXsDi+z9VnrzYz27Tq2sTZY53tI+8S+wSTRr37bumsFcFwZcijY4AjCQwfDrURUN//6GEao8/EbKg8NZU2yMpw4QzsUYxoJ6HOW0O5vupPchIVWVRFEBB0IsZbHyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IYwE8UUz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E83E34D4;
	Thu,  2 May 2024 13:04:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714647861;
	bh=BlfCHWDPrAezAI3yjHriYrE/Jlrb3KIJfcuf1g0mOpY=;
	h=From:To:Cc:Subject:Date:From;
	b=IYwE8UUzv7YsUQgwGztKHgw95MCXCJJhQ3RjDL+kdLa+Y0B8ogwuEqgI95meX1gvT
	 y+nW9A/mUsEF2U02kcQwt/bJRFY8sHvJngRwhXxX8BmgaN4IFvuTamSJ5hNaPz/f3e
	 CAXq3lCflxKkKH+hdowBH/JpVy+B3rCGHMEV/W4Y=
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
Subject: [PATCH v6 0/7] media: raspberrypi: Add support for PiSP Back End
Date: Thu,  2 May 2024 13:04:55 +0200
Message-ID: <20240502110503.38412-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v6 with minor updates.

If no further comments, I think the series is ready to be collected (for v6.11)

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

A branch is available at

git://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git
#pispbe/media-staging/be-upstream-v6

-------------------- Hans' build scripts build summary ------------------------
date:                   Fri Feb  9 14:29:10 CET 2024
media-tree git repo:    git://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git
media-tree git branch:  jmondi/pispbe/media-staging/be-upstream
media-tree git hash:    728775b95062efdecedad4df4013a8db5382d470
v4l-utils git hash:     4a6a3725dd192759c2998311b00440b84c60df57
edid-decode git hash:   5f723267e04deb3aa9610483514a02bcee10d9c2
gcc version:            i686-linux-gcc (GCC) 13.1.0
ccache version:         ccache version 4.7.5
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:         v0.5.0-8575-g7162b9ec
sparse version:         v0.5.0-8575-g7162b9ec
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 745fc7cf5ba1a1a841374c61e8470852232584c1
host hardware:          x86_64
host os:                6.1.0-10-amd64

linux-git-arm: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-acpi.config: OK
no-of.config: OK
no-pm.config: OK
no-pm-sleep.config: OK
no-debug-fs.config: OK
sparse: WARNINGS:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

smatch: WARNINGS:

drivers/media/i2c/adv7180.c:1526 adv7180_probe() warn: 'client->irq' from request_threaded_irq() not released on lines: 1526.
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/media/platform/st/sti/hva/hva-hw.c:412 hva_hw_probe() warn: 'hva->clk' from clk_prepare() not released on lines: 412.

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
spec-git: OK
kerneldoc: WARNINGS:

include/media/v4l2-vp9.h:144: warning: Excess struct member 'partition' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'skip' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'intra_inter' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'tx32p' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'tx16p' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'tx8p' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'y_mode' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'uv_mode' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'comp' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'comp_ref' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'single_ref' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'mv_mode' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'filter' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'mv_joint' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'sign' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'classes' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'class0' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'bits' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'class0_fp' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'fp' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'class0_hp' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'hp' description in 'v4l2_vp9_frame_symbol_counts'


date:                   Fri Feb  9 15:38:02 CET 2024
-------------------------------------------------------------------------------

--------------------------- V4L2 compliance -----------------------------------
pi@raspberrypi:~/v4l-utils$ ./build/utils/v4l2-compliance/v4l2-compliance -d /dev/video4
v4l2-compliance 1.27.0-5174, 64 bits, 64-bit time_t
v4l2-compliance SHA: d700deb14368 2024-01-18 12:19:05

Compliance test for pispbe device /dev/video0:
Total for pispbe device /dev/video4: 47, Succeeded: 47, Failed: 0, Warnings: 0

Compliance test for pispbe device /dev/video1:
Total for pispbe device /dev/video4: 47, Succeeded: 47, Failed: 0, Warnings: 0

Compliance test for pispbe device /dev/video2:
Total for pispbe device /dev/video4: 47, Succeeded: 47, Failed: 0, Warnings: 0

Compliance test for pispbe device /dev/video3:
Total for pispbe device /dev/video4: 47, Succeeded: 47, Failed: 0, Warnings: 0

Compliance test for pispbe device /dev/video4:
Total for pispbe device /dev/video4: 47, Succeeded: 47, Failed: 0, Warnings: 0

Compliance test for pispbe device /dev/video5:
Total for pispbe device /dev/video0: 47, Succeeded: 47, Failed: 0, Warnings: 0

Compliance test for pispbe device /dev/video6:
Total for pispbe device /dev/video0: 47, Succeeded: 47, Failed: 0, Warnings: 0

Compliance test for pispbe device /dev/video7:
Total for pispbe device /dev/video0: 47, Succeeded: 47, Failed: 0, Warnings: 0
-------------------------------------------------------------------------------


Jacopo Mondi (6):
  media: uapi: pixfmt-luma: Document MIPI CSI-2 packing
  media: uapi: Add a pixel format for BGR48 and RGB48
  media: uapi: Add meta pixel format for PiSP BE config
  media: uapi: Add PiSP Compressed RAW Bayer formats
  media: dt-bindings: Add bindings for Raspberry Pi PiSP Back End
  media: admin-guide: Document the Raspberry Pi PiSP BE

Naushir Patuck (1):
  media: raspberrypi: Add support for PiSP BE

 .../admin-guide/media/raspberrypi-pisp-be.dot |   20 +
 .../admin-guide/media/raspberrypi-pisp-be.rst |  112 +
 .../admin-guide/media/v4l-drivers.rst         |    1 +
 .../bindings/media/raspberrypi,pispbe.yaml    |   63 +
 .../userspace-api/media/v4l/meta-formats.rst  |    1 +
 .../media/v4l/metafmt-pisp-be.rst             |   46 +
 .../userspace-api/media/v4l/pixfmt-bayer.rst  |    1 +
 .../userspace-api/media/v4l/pixfmt-rgb.rst    |   54 +
 .../media/v4l/pixfmt-srggb8-pisp-comp.rst     |   74 +
 .../media/v4l/pixfmt-yuv-luma.rst             |    4 +
 MAINTAINERS                                   |    8 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/raspberrypi/Kconfig    |    5 +
 drivers/media/platform/raspberrypi/Makefile   |    3 +
 .../platform/raspberrypi/pisp_be/Kconfig      |   12 +
 .../platform/raspberrypi/pisp_be/Makefile     |    6 +
 .../platform/raspberrypi/pisp_be/pisp_be.c    | 1848 +++++++++++++++++
 .../raspberrypi/pisp_be/pisp_be_formats.h     |  519 +++++
 drivers/media/v4l2-core/v4l2-common.c         |    2 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   13 +
 .../linux/media/raspberrypi/pisp_be_config.h  |  510 +++++
 .../linux/media/raspberrypi/pisp_common.h     |  199 ++
 include/uapi/linux/videodev2.h                |   17 +
 24 files changed, 3520 insertions(+)
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
2.44.0


