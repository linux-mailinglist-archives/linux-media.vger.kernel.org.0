Return-Path: <linux-media+bounces-36910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A70AFA745
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 20:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A6F617C0EF
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 18:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0921293C40;
	Sun,  6 Jul 2025 18:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbIrT/yY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585DC800;
	Sun,  6 Jul 2025 18:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751827477; cv=none; b=sqYUk/8pmk5Uhe2KttB5oGysksaBX3wnnBuGaXE3i9ByBhqDnI583mBeLS3xXrTAg/j7sslHtPwxlPucsZPZERVfiqle/n+N8Dm+RXbaqXp8ZcVxZxANdcr3OSJLkMzcY20v3HHzUP48VHTo9sozWSuJ88Pts+8KWq5p5BqH/FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751827477; c=relaxed/simple;
	bh=5cOnGwV3gzqMFT5vM9FUW1YYjKHNX124/bLLxN48RjM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=scYOsEA45B2Xa/NJoj2dIvfD81npb49cfCvuIefLzf4GcJE3QC5qPBjMKdh1vChjJ4phcFcdt9mh00FArVqQtOZimibrDKpo3ZKY800FrLk9J8MIoF/hj0wU32pXSq7R7yoUwtvhS5xxn4vzbG8/HCSBIH8Fu3LAMJZt2q4zZ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbIrT/yY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B25FC4CEED;
	Sun,  6 Jul 2025 18:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827476;
	bh=5cOnGwV3gzqMFT5vM9FUW1YYjKHNX124/bLLxN48RjM=;
	h=Date:From:Subject:To:Cc:From;
	b=SbIrT/yYP9+6IN1gbELJ4M+2rp/PP9n0eNOTtmvGm1imLtAb7KWG6OBST5VwOyrAi
	 rSS9leXTezp87uC67SFSSCU57bHiNzHF0mVQYDWu8CmM/bggjrCC/AxZnHp3klPKc7
	 Z1SKZVVsnMTv6U+7Gbi03bYUeaMFtY28yfv2ASMZYv5PjH3NGZB4zVInJIQtukxZfY
	 tMkMNUrRWecVuZeU6QNfm68XOqXpCVs5LDNMa6qlRZW4sjXKsV7DfsP9WGu6O5LmhC
	 ZKpyDLxYmCvYHTMf6usvZLqjbvezUm8vIp4eV0CCYXvsltIN8hOcT2gTk5uwCNCN2X
	 NRSv8Een1u7rg==
Message-ID: <0203a666-4e54-4c57-96a1-a9afb7f7fb4b@kernel.org>
Date: Sun, 6 Jul 2025 20:44:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hansg@kernel.org>
Subject: [GIT PULL] media: atomisp: Changes for 6.16-1
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-staging@lists.linux.dev,
 Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro, Hans,

Here are the atomisp changes for 6.17.
Note this PR is based on top of media-committers/next.

Highlights:
- Stop stream rework fixing crashes when sensors fail to start streaming
- Replace custom GPIO mapping code with the shared, generic and more
  capable GPIO mapping support from the IPU3 / IPU6 INT3472 code
- Final GC0310 sensor code cleanups, after this it can move out of staging
- Remove a bunch of custom sysfs attributes
- Misc. janitorial fixes

Regards,

Hans


The following changes since commit a8598c7de1bcd94461ca54c972efa9b4ea501fb9:

  media: ipu7: Drop IPU8 PCI ID for now (2025-07-04 08:22:32 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.17-1

for you to fetch changes up to 532fd10da0f58e7f313ff576bb1e6cab1f758bbe:

  media: atomisp: Remove custom sysfs attributes from atomisp_drvfs.c (2025-07-06 18:24:46 +0200)

----------------------------------------------------------------
atomisp staging driver changes for 6.17-1

Highlights:
- Stop stream rework fixing crashes when sensors fail to start streaming
- Replace custom GPIO mapping code with the shared, generic and more
  capable GPIO mapping support from the IPU3 / IPU6 INT3472 code
- Final GC0310 sensor code cleanups, after this it can move out of staging
- Remove a bunch of custom sysfs attributes
- Misc. janitorial fixes

----------------------------------------------------------------
Abdelrahman Fekry (3):
      media: atomisp: Remove debug sysfs attributes active_bo and free_bo
      media: atomisp: Fix premature setting of HMM_BO_DEVICE_INITED flag
      media: atomisp: Remove custom sysfs attributes from atomisp_drvfs.c

Andy Shevchenko (3):
      media: atomisp: Remove unused header
      media: atomisp: Replace macros from math_support.h
      media: atomisp: Remove no more used macros from math_support.h

Hans de Goede (28):
      media: atomisp: Move atomisp_stop_streaming() above atomisp_start_streaming()
      media: atomisp: Properly stop the ISP stream on sensor streamon errors
      media: atomisp: Stop pipeline on atomisp_css_start() failure
      media: atomisp: Always free MIPI / CSI-receiver buffers from ia_css_uninit()
      media: atomisp: Fix "stop stream timeout." error
      media: atomisp: Switch to int3472 driver sensor GPIO mapping code
      media: atomisp: gc0310: Rename "dev" function variable to "sensor"
      media: atomisp: gc0310: Drop unused GC0310_FOCAL_LENGTH_NUM define
      media: atomisp: gc0310: Modify vblank value to run at 30 fps
      media: atomisp: gc0310: Switch to CCI register access helpers
      media: atomisp: gc0310: Use V4L2_CID_ANALOGUE_GAIN for gain control
      media: atomisp: gc0310: Add selection API support
      media: atomisp: gc0310: Add link-frequency and pixelrate controls
      media: atomisp: gc0310: Add vblank and hblank controls
      media: atomisp: gc0310: Add camera orientation and sensor rotation controls
      media: atomisp: gc0310: Limit max exposure value to mode-height + vblank
      media: atomisp: gc0310: Add check_hwcfg() function
      media: atomisp: gc0310: Fix power on/off sleep times
      media: atomisp: gc0310: Remove unused is_streaming variable
      media: atomisp: gc0310: Switch to {enable,disable}_streams
      media: atomisp: gc0310: Switch to using the sub-device state lock
      media: atomisp: gc0310: Implement internal_ops.init_state
      media: atomisp: gc0310: Use v4l2_subdev_get_fmt() as v4l2_subdev_pad_ops.get_fmt()
      media: atomisp: gc0310: Switch to using sd.active_state fmt
      media: atomisp: gc0310: Move and rename suspend/resume functions
      media: atomisp: gc0310: runtime-PM fixes
      media: atomisp: gc0310: Drop gc0310_get_frame_interval()
      media: atomisp: gc0310: Drop gc0310_g_skip_frames()

Pablo (1):
      media: atomisp: Fix ia_css_vf.host.c coding style

Thomas Andreatta (3):
      media: atomisp: gc0310: Remove redundant debug message
      media: atomisp: gc2235: Fix struct definition style
      media: atomisp: ov2722: Fix struct definition style

 drivers/staging/media/atomisp/Kconfig              |   1 +
 drivers/staging/media/atomisp/Makefile             |   1 -
 drivers/staging/media/atomisp/TODO                 |   2 -
 drivers/staging/media/atomisp/i2c/Kconfig          |   1 +
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 627 ++++++++++++---------
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |   2 -
 drivers/staging/media/atomisp/i2c/gc2235.h         |  16 +-
 drivers/staging/media/atomisp/i2c/ov2722.h         |  16 +-
 .../media/atomisp/pci/atomisp_compat_css20.c       |   2 +-
 drivers/staging/media/atomisp/pci/atomisp_csi2.h   |  17 -
 .../media/atomisp/pci/atomisp_csi2_bridge.c        | 239 +-------
 drivers/staging/media/atomisp/pci/atomisp_drvfs.c  | 155 -----
 drivers/staging/media/atomisp/pci/atomisp_drvfs.h  |  15 -
 drivers/staging/media/atomisp/pci/atomisp_fops.c   |   5 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  | 129 ++---
 drivers/staging/media/atomisp/pci/atomisp_subdev.h |   3 -
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |   5 +-
 .../pci/hive_isp_css_include/math_support.h        |   5 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c        |  91 ---
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     |   5 +-
 drivers/staging/media/atomisp/pci/ia_css_pipe.h    |   2 -
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h |   4 +-
 .../pci/isp/kernels/dpc2/ia_css_dpc2_param.h       |   6 +-
 .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c  |   4 +-
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h   |  22 +-
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c  |   6 +-
 .../pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h    |   2 +-
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c     |   3 +-
 .../pci/isp/modes/interface/input_buf.isp.h        |   6 +-
 .../atomisp/pci/isp/modes/interface/isp_const.h    | 157 ------
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |   1 -
 .../media/atomisp/pci/runtime/frame/src/frame.c    |  29 +-
 .../media/atomisp/pci/runtime/ifmtr/src/ifmtr.c    |  11 +-
 .../atomisp/pci/runtime/isys/src/virtual_isys.c    |   2 +-
 .../runtime/pipeline/interface/ia_css_pipeline.h   |   1 -
 .../atomisp/pci/runtime/pipeline/src/pipeline.c    |   2 -
 drivers/staging/media/atomisp/pci/sh_css.c         |  27 -
 drivers/staging/media/atomisp/pci/sh_css_defs.h    |  12 +-
 .../staging/media/atomisp/pci/sh_css_internal.h    |   8 +-
 drivers/staging/media/atomisp/pci/sh_css_mipi.c    |  11 -
 drivers/staging/media/atomisp/pci/sh_css_mipi.h    |   2 -
 .../staging/media/atomisp/pci/sh_css_param_dvs.h   |  22 +-
 drivers/staging/media/atomisp/pci/sh_css_params.c  |  12 +-
 43 files changed, 538 insertions(+), 1151 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_drvfs.c
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_drvfs.h
 delete mode 100644 drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h


