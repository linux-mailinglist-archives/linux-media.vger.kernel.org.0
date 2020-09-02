Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D05EE25B104
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbgIBQNw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:13:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:53842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728302AbgIBQK5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:57 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 003EC215A4;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=r+4c7QB4p852T49gME2IZW5IZmsU3UjeY+WL8JYG9rM=;
        h=From:To:Cc:Subject:Date:From;
        b=oF+zgOpExWFjUPBjQpLHZmYeyUxq0A2NGClPsw04AmB6f2T3o7JdNDh+2W0cor0jZ
         zILiWkwoNqmYPbjpi+ZExncPr4ZzmA0VvNk6ZJwJZTbfqIAH3LxgcuU1xQN9ER21/I
         pl0IQy/E6U+hnNVRWbLDRDVlR5xg8wshEElF+dWE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLP-000t9h-K8; Wed, 02 Sep 2020 18:10:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sean Young <sean@mess.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mike Rapoport <rppt@kernel.org>,
        Michel Lespinasse <walken@google.com>,
        linux-media@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Forest Crossman <cyrozap@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Colin Ian King <colin.king@canonical.com>,
        Antti Palosaari <crope@iki.fi>,
        Romain Perier <romain.perier@gmail.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Vandana BN <bnvandana@gmail.com>, devel@driverdev.osuosl.org,
        Takashi Iwai <tiwai@suse.de>,
        John Hubbard <jhubbard@nvidia.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 00/38] media sparse/smatch warn fixes
Date:   Wed,  2 Sep 2020 18:10:03 +0200
Message-Id: <cover.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While I was lately relying on Jenkins to report smatch/sparse issues,
I discovered this week that the reports were missing such warnings

I got it fixed already at builder.linuxtv.org, but there are several new
warnings that got added over time.

This series is meant to solve the ones that are reported on x86_64
without pre-building the smatch database.

It should allow receiving cleaner error reports.

While most of the patches are meant to shut up the static analizers,
some contain real bug fixes.

Mauro Carvalho Chehab (38):
  media: tda10086: cleanup symbol_rate setting logic
  media: v4l2-ioctl: avoid memory leaks on some time32 compat functions
  media: qt1010: fix usage of unititialized value
  media: av7110_v4l: avoid a typecast
  media: wl128x: get rid of a potential spectre issue
  media: venus: place extern venus_fw_debug on a header file
  media: tda10021: avoid casts when using symbol_rate
  media: serial_ir: use the right type for a dma address
  media: vivid: move the detection part out of vivid_create_instance
  media: vivid: place the logic which disables ioctl on a separate
    function
  media: vivid: move set_capabilities logic to a separate function
  media: vivid: place dt timings init code on a separate function
  media: vivid: move the create queues to a separate function
  media: vivid: move the devnode creation logic to a separate function
  media: vivid: fix error path
  media: videobuf-dma-sg: number of pages should be unsigned long
  media: cx25821-alsa: number of pages should be unsigned long
  media: cx23885-alsa: number of pages should be unsigned long
  media: cx88-alsa: number of pages should be unsigned long
  media: saa7134-alsa.c: number of pages should be unsigned long
  media: dvb-ttusb-budget: don't use stack for USB transfers
  media: dvb-ttusb-budget: cleanup printk logic
  media: saa7134: avoid a shift overflow
  media: atomisp: fix casts at atomisp_compat_ioctl32.c
  media: atomisp: get rid of some unused code
  media: atomisp: cleanup ifdefs from ia_css_debug.c
  media: atomisp: get rid of version-dependent globals
  media: atomisp: get rid of isys_dma.h and isys_dma_local.h
  media: atomisp: get rid of ibuf_ctrl abstraction
  media: atomisp: don't check for ISP version for includes
  media: atomisp: unify INPUT error return type
  media: atomisp: de-duplicate names at *_input_system_global.h
  media: atomisp: reorder functions at pixelgen_private.h
  media: atomisp: remove compile-time tests from input_system_global.h
  media: atomisp: fix some bad indents
  media: atomisp: csi_rx.c: add a missing includes
  media: atomisp: atomisp_gmin_platform: check before use
  media: atomisp: cleanup isys_irq headers

 drivers/media/dvb-frontends/tda10021.c        |  38 +-
 drivers/media/dvb-frontends/tda10086.c        |  22 +-
 drivers/media/pci/cx23885/cx23885-alsa.c      |   7 +-
 drivers/media/pci/cx23885/cx23885.h           |   4 +-
 drivers/media/pci/cx25821/cx25821-alsa.c      |  11 +-
 drivers/media/pci/cx88/cx88-alsa.c            |  13 +-
 drivers/media/pci/saa7134/saa7134-alsa.c      |   7 +-
 drivers/media/pci/saa7134/saa7134-tvaudio.c   |   3 +-
 drivers/media/pci/saa7134/saa7134.h           |   2 +-
 drivers/media/pci/ttpci/av7110_v4l.c          |   4 +-
 drivers/media/platform/qcom/venus/core.h      |   2 +
 drivers/media/platform/qcom/venus/dbgfs.c     |   2 -
 drivers/media/radio/wl128x/fmdrv_common.c     |  16 +-
 drivers/media/rc/serial_ir.c                  |   2 +-
 drivers/media/test-drivers/vivid/vivid-core.c | 645 ++++++------
 drivers/media/tuners/qt1010.c                 |  25 +-
 .../media/usb/ttusb-budget/dvb-ttusb-budget.c | 197 ++--
 drivers/media/v4l2-core/v4l2-ioctl.c          |  48 +-
 drivers/media/v4l2-core/videobuf-dma-sg.c     |  22 +-
 drivers/staging/media/atomisp/Makefile        |  12 +-
 .../atomisp/pci/atomisp_compat_ioctl32.c      |  84 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c |   5 +-
 .../atomisp/pci/css_2401_system/host/csi_rx.c |   1 +
 .../pci/css_2401_system/host/ibuf_ctrl.c      |   1 +
 .../css_2401_system/host/ibuf_ctrl_local.h    |   1 +
 .../css_2401_system/host/ibuf_ctrl_private.h  | 268 -----
 .../pci/css_2401_system/host/isys_dma.c       |  10 +-
 .../pci/css_2401_system/host/isys_dma_local.h |  21 -
 .../css_2401_system/host/isys_dma_private.h   |  12 +-
 .../pci/css_2401_system/host/isys_irq.c       |   3 +-
 .../pci/css_2401_system/host/isys_irq_local.h |   4 +-
 .../css_2401_system/host/isys_irq_private.h   |  12 +-
 .../css_2401_system/host/pixelgen_private.h   |  73 +-
 .../pci/css_2401_system/ibuf_ctrl_global.h    |   6 +-
 .../pci/css_2401_system/isys_irq_global.h     |   4 +-
 .../pci/css_2401_system/pixelgen_global.h     |   8 +-
 .../host/input_formatter.c                    |   2 +-
 .../hive_isp_css_common/host/input_system.c   |  70 +-
 .../hive_isp_css_include/host/csi_rx_public.h |   4 +-
 .../host/ibuf_ctrl_public.h                   |  94 --
 .../host/isys_dma_public.h                    |   8 +-
 .../host/isys_irq_public.h                    |  29 +-
 .../hive_isp_css_include/host/isys_public.h   |   4 +-
 .../host/pixelgen_public.h                    |   4 +-
 .../pci/hive_isp_css_include/ibuf_ctrl.h      |  47 -
 .../pci/hive_isp_css_include/isys_dma.h       |  47 -
 .../pci/hive_isp_css_include/isys_irq.h       |  16 +-
 drivers/staging/media/atomisp/pci/hmm/hmm.c   |   6 +-
 .../staging/media/atomisp/pci/ia_css_mipi.h   |   2 -
 .../staging/media/atomisp/pci/ia_css_stream.h |   4 +-
 .../media/atomisp/pci/input_system_global.h   |  29 +-
 .../kernels/ctc/ctc_1.0/ia_css_ctc_param.h    |   7 -
 .../ctc/ctc_1.0/ia_css_ctc_table.host.c       | 145 ---
 .../kernels/gc/gc_1.0/ia_css_gc_table.host.c  | 144 ---
 .../kernels/gc/gc_2/ia_css_gc2_table.host.c   |  53 -
 .../isp/kernels/raw/raw_1.0/ia_css_raw.host.c |   4 +-
 .../kernels/xnr/xnr_1.0/ia_css_xnr_param.h    |   7 -
 .../xnr/xnr_1.0/ia_css_xnr_table.host.c       |  31 -
 .../atomisp/pci/isp2400_input_system_global.h |  21 +-
 .../atomisp/pci/isp2400_input_system_local.h  |  17 +-
 .../atomisp/pci/isp2400_input_system_public.h |  26 +-
 .../media/atomisp/pci/isp2400_system_global.h |  16 -
 .../atomisp/pci/isp2401_input_system_global.h |  30 +-
 .../atomisp/pci/isp2401_input_system_local.h  |   3 -
 .../pci/isp2401_input_system_private.h        | 224 ++++-
 .../media/atomisp/pci/isp2401_system_global.h |  19 -
 .../atomisp/pci/runtime/binary/src/binary.c   | 919 +++++++++---------
 .../runtime/bufq/interface/ia_css_bufq_comm.h |  10 -
 .../media/atomisp/pci/runtime/bufq/src/bufq.c |  26 +-
 .../runtime/debug/interface/ia_css_debug.h    |   6 -
 .../pci/runtime/debug/src/ia_css_debug.c      | 193 +---
 .../atomisp/pci/runtime/ifmtr/src/ifmtr.c     |   2 +-
 .../pci/runtime/inputfifo/src/inputfifo.c     |  10 -
 .../pci/runtime/isys/interface/ia_css_isys.h  |  18 +-
 .../runtime/isys/interface/ia_css_isys_comm.h |   4 +-
 .../pci/runtime/isys/src/csi_rx_rmgr.c        |   2 +-
 .../pci/runtime/isys/src/isys_dma_rmgr.c      |   2 +-
 .../atomisp/pci/runtime/isys/src/isys_init.c  |  20 +-
 .../runtime/isys/src/isys_stream2mmio_rmgr.c  |   2 +-
 .../media/atomisp/pci/runtime/isys/src/rx.c   |  24 +-
 .../pci/runtime/isys/src/virtual_isys.c       |  58 +-
 .../pipeline/interface/ia_css_pipeline.h      |   2 +-
 .../pci/runtime/pipeline/src/pipeline.c       |   4 +-
 drivers/staging/media/atomisp/pci/sh_css.c    | 296 ++----
 .../staging/media/atomisp/pci/sh_css_defs.h   |   4 -
 .../staging/media/atomisp/pci/sh_css_hrt.c    |   4 -
 .../media/atomisp/pci/sh_css_internal.h       |  36 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   |  34 +-
 .../media/atomisp/pci/sh_css_param_shading.c  |   2 +-
 .../staging/media/atomisp/pci/sh_css_params.c | 538 ----------
 .../media/atomisp/pci/sh_css_properties.c     |  10 -
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  39 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.h |   8 +-
 .../staging/media/atomisp/pci/sh_css_struct.h |   2 -
 .../staging/media/atomisp/pci/system_global.h |  23 -
 include/media/videobuf-dma-sg.h               |   2 +-
 96 files changed, 1708 insertions(+), 3300 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl_private.h
 delete mode 100644 drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_local.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/host/ibuf_ctrl_public.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/ibuf_ctrl.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_dma.h
 delete mode 100644 drivers/staging/media/atomisp/pci/isp2400_system_global.h
 delete mode 100644 drivers/staging/media/atomisp/pci/isp2401_system_global.h

-- 
2.26.2


