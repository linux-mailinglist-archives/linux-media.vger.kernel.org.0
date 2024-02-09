Return-Path: <linux-media+bounces-4888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B433D84FA14
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 17:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42CC728C87C
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 16:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA75B128378;
	Fri,  9 Feb 2024 16:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uRqglfik"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D064364D2
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 16:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707497331; cv=none; b=QO4vyoQNdvB0pZVYDmY15h/jn1Bs3MXrmPV4VHUAu9M3Pz3vaYdMQP7mcU8VMmqizW8+aiqcFNOR+zgUxDc4hiW5yFRaOFoWjHyipPOBOoRCKnCcGBhOFFr2OvBfqbqV25OUmWy8dOZa+0PGCp8uXsHoN5IH4h8cr1gZVTefXSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707497331; c=relaxed/simple;
	bh=Y9ffWKJE/JDaQ92xtCbHyW34ljgmIoV9+tNo1UFE1Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=obZysx7vipaCfA8gyaswzBEi1ktgWIgevYc7Y5nn20J+cH6385gC3Uz0dRbrN6X206Vbu99BkyGB/GePC11rYHOctkr8Jyrc4Lf1wDZS7IFkt02wp5TJ9jKI3RLwzkU+HmjyeHkznSpH5GfEZ4grx3bxxGLHOj3R+FrICqR6lJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uRqglfik; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D8FA9CE;
	Fri,  9 Feb 2024 17:47:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707497239;
	bh=Y9ffWKJE/JDaQ92xtCbHyW34ljgmIoV9+tNo1UFE1Q8=;
	h=From:To:Cc:Subject:Date:From;
	b=uRqglfikbFHep/CLj7uvKab9f8a/F3mDEeT+UfnlHF7ommcmDXP42RWx9xTHJIq/0
	 1O/pa2bT3q2GpHtInCpOYQSoPXG3LesRfXLJJP2qnKEs5g7vW2I2JhOtrUeridEmj7
	 uPvX0vVF7KUaWyjKn/Auu+K3g8FNQGJF9YJ19TfU=
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
Subject: [PATCH 0/8] media: raspberrypi: Add support for PiSP Back End
Date: Fri,  9 Feb 2024 17:48:15 +0100
Message-ID: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
#pispbe/media-staging/be-upstream

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

Dave Stevenson (2):
  media: Add a pixel format for MIPI packed 12bit luma only.
  media: Add a pixel format for MIPI packed 14bit luma only

Jacopo Mondi (6):
  media: Add a pixel format for BRG48 and RGB48
  media: Add meta pixel format for PiSP BE config
  media: Add PiSP Compressed RAW Bayer formats
  media: dt-bindings: Add bindings for Raspberry Pi PiSP Back End
  media: raspberrypi: Add support for PiSP BE
  media: admin-guide: Document the Raspberry Pi PiSP BE

 Documentation/admin-guide/media/pisp-be.dot   |   22 +
 Documentation/admin-guide/media/pisp-be.rst   |  117 ++
 .../admin-guide/media/v4l-drivers.rst         |    1 +
 .../bindings/media/raspberrypi,pispbe.yaml    |   68 +
 .../userspace-api/media/v4l/meta-formats.rst  |    1 +
 .../media/v4l/metafmt-pisp-be.rst             |   46 +
 .../userspace-api/media/v4l/pixfmt-bayer.rst  |    1 +
 .../media/v4l/pixfmt-pisp-comp-rggb.rst       |   70 +
 .../userspace-api/media/v4l/pixfmt-rgb.rst    |   39 +
 .../userspace-api/media/v4l/pixfmt-y12p.rst   |   38 +
 .../userspace-api/media/v4l/pixfmt-y14p.rst   |   47 +
 .../userspace-api/media/v4l/yuv-formats.rst   |    2 +
 MAINTAINERS                                   |   11 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/raspberrypi/Kconfig    |    5 +
 drivers/media/platform/raspberrypi/Makefile   |    3 +
 .../platform/raspberrypi/pisp_be/Kconfig      |   13 +
 .../platform/raspberrypi/pisp_be/Makefile     |    6 +
 .../platform/raspberrypi/pisp_be/pisp_be.c    | 1842 +++++++++++++++++
 .../raspberrypi/pisp_be/pisp_be_formats.h     |  519 +++++
 drivers/media/v4l2-core/v4l2-common.c         |    2 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   15 +
 .../linux/media/raspberrypi/pisp_be_config.h  |  531 +++++
 .../linux/media/raspberrypi/pisp_common.h     |  199 ++
 include/uapi/linux/videodev2.h                |   21 +
 26 files changed, 3621 insertions(+)
 create mode 100644 Documentation/admin-guide/media/pisp-be.dot
 create mode 100644 Documentation/admin-guide/media/pisp-be.rst
 create mode 100644 Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-pisp-comp-rggb.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y12p.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y14p.rst
 create mode 100644 drivers/media/platform/raspberrypi/Kconfig
 create mode 100644 drivers/media/platform/raspberrypi/Makefile
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Kconfig
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Makefile
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h
 create mode 100644 include/uapi/linux/media/raspberrypi/pisp_be_config.h
 create mode 100644 include/uapi/linux/media/raspberrypi/pisp_common.h

--
2.43.0


