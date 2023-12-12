Return-Path: <linux-media+bounces-2276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B423080F62B
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 20:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E777B20E6D
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 19:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A46580059;
	Tue, 12 Dec 2023 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PuqhG47G"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EBB091
	for <linux-media@vger.kernel.org>; Tue, 12 Dec 2023 11:11:32 -0800 (PST)
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B49D510A;
	Tue, 12 Dec 2023 20:10:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702408246;
	bh=IeJe5ZsBwezanPNtkzn9/IcDQZb1sIOwEAZbW9U7rrE=;
	h=From:To:Cc:Subject:Date:From;
	b=PuqhG47G4Q+tujTBBj7wSrtzCs5R81du/XRhhyxmldxQF81JPCjR6lBQK3J94lhTo
	 qwFkagEewIRHqT/2rYvLKF1jZMyKeApRQ8zatB5EOt1AK68rSy9RF2+JiIibClAjDX
	 VygvWEeb4Y0qpW9Aq5++5S82CICKgZySbpy/wIS0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v7 0/2] media: i2c: Add driver for OmniVision OV64A40
Date: Tue, 12 Dec 2023 20:11:15 +0100
Message-ID: <20231212191117.133868-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a v4l2 sensor driver for OmniVision OV64A40

----------------- V4L2 Compliance ---------------------------------------------
./utils/v4l2-compliance/v4l2-compliance -d /dev/v4l-subdev0
v4l2-compliance 1.25.0-5100, 32 bits, 32-bit time_t
v4l2-compliance SHA: 8bf6cba8c0ef 2023-10-10 12:50:46
Total for device /dev/v4l-subdev0: 44, Succeeded: 44, Failed: 0, Warnings: 0

----------------- Build scripts -----------------------------------------------
date:                   Wed Dec  6 14:52:17 CET 2023
media-tree git repo:    git://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git
media-tree git branch:  jmondi/ov64a40/mainline-v5
media-tree git hash:    e7196a51fae1cbf69ca9891711019ddc20ed0a8a
v4l-utils git hash:     4a6a3725dd192759c2998311b00440b84c60df57
edid-decode git hash:   5f723267e04deb3aa9610483514a02bcee10d9c2
gcc version:            i686-linux-gcc (GCC) 13.1.0
ccache version:         ccache version 4.7.5
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:         v0.5.0-8526-gd4827317
sparse version:         v0.5.0-8526-gd4827317
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 745fc7cf5ba1a1a841374c61e8470852232584c1
host hardware:          x86_64
host os:                6.1.0-10-amd64

linux-git-powerpc64: OK
linux-git-arm: OK
linux-git-arm64: OK
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

drivers/media/i2c/adv7180.c:1514 adv7180_probe() warn: 'client->irq' from request_threaded_irq() not released on lines: 1514.
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/media/i2c/ov64a40.c:3562 ov64a40_probe() warn: passing zero to 'PTR_ERR'
drivers/media/platform/st/sti/hva/hva-hw.c:412 hva_hw_probe() warn: 'hva->clk' from clk_prepare() not released on lines: 412.

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
spec-git: OK
kerneldoc: OK
-------------------------------------------------------------------------------

The smatch() warning reported here above:
drivers/media/i2c/ov64a40.c:3562 ov64a40_probe() warn: passing zero to 'PTR_ERR'
has been fixed.

v6->v7:
- Make also bus-type and data-lanes mandatory in bindings
- Add Lee's signoff

v5->v6:
- Defined analogue_crop width and height as proper width/heights and subtract 1
  when writing X_END/Y_END to registers
- Make the DTS property link-frequencies required in bindings

v4->v5:
* Fix review comments received on RPi pull request (thanks Dave for review)
  https://github.com/raspberrypi/linux/pull/5708
* Handle runtime_pm in s_ctrl like it's done in CCS
* Add support for test patterns
* Add 8000x6000 mode
* Use decimal numbers in modes definitions

v3->v4:
* Fix a few additional warnings reported by kernel test robot (which arrived a
  few minutes after sending v3 out :(

v2->v3:
* Restore max size of 9248x6944
* Select V4L2_CCI_I2C in Kconfig
* Fix unused variable warning
* Fix a few minor checkpatch warnings

v1->v2:
* rebased on sailus master
  * Use new subdev state helpers
* link frequency support (456MHz, 360MHz)
* invert vflip bit setting
* remove 1280x720 mode as it was broken
* expanded VTS range to 24 bits
* Reduce max resolution output to 9152x6944. Using full output resolution causes
  green frames to be produced by the ISP (the raw frames are however correct)
* reduce max analogue gain to 16x

Jacopo Mondi (2):
  media: dt-bindings: Add OmniVision OV64A40
  media: i2c: Add driver for OmniVision OV64A40

 .../bindings/media/i2c/ovti,ov64a40.yaml      |  103 +
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov64a40.c                   | 3686 +++++++++++++++++
 5 files changed, 3809 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
 create mode 100644 drivers/media/i2c/ov64a40.c

--
2.41.0


