Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53D791E8EAF
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729175AbgE3G6i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:58:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:44902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728751AbgE3G4G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:06 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4D2E20776;
        Sat, 30 May 2020 06:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821763;
        bh=EgxMCHq9UHb+BoKq385rOO9Bugp1nWJhHrTvI7FsR5s=;
        h=From:To:Cc:Subject:Date:From;
        b=mx5IdCr2qrDgAvvgXC4iIHN/mIwI5cmsn0yBymrKdLLlJVaY3+drVeJ64BkcE/18F
         7l+5BDbueCf1pqFkCYEtLP/X9dqKpvy1S0QpS4AxasIpl0qW1Ei5gZ8VWcDkyRzGg7
         ev3GDIdjCSEt1jtKdWsMLUtPmF7pfmkeZOMpCqrk=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPU-001ho7-EY; Sat, 30 May 2020 08:56:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        clang-built-linux@googlegroups.com
Subject: [PATCH v2 00/41]  More atomisp fixes and cleanups
Date:   Sat, 30 May 2020 08:55:17 +0200
Message-Id: <cover.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The first 20 patches on this series were already submitted, but I forgot
to c/c linux-media. So, I'm just resending, without any changes.
Most of them are working at the memory management abstraction,
cleaning it, removing abstraction layers and getting rid of legacy stuff.

Patch 20 contains an important bug fix: the logic which configures 
the hardware pipelines add some "delay frames" that are NULL, causing
the driver to crash when userspace selects a resolution different
than the sensor resolution.

The other patches are other random cleanups, fixes and removal
of some abstraction layers,.

-

It took me a lot of time debugging the OOPS, due to all the weirdness 
and abstractions with the mm/ allocation, plus the 4+ abstraction
layers that it takes for the driver to actually do something.

We should try to get rid of at least some of the layers as soon as
possible, as it takes a lot of time to debug certain things with all
those layers.

Mauro Carvalho Chehab (35):
  media: atomisp: simplify hive_isp_css_mm_hrt wrapper
  media: atomisp: get rid of the hrt/hive_isp_css_mm_hrt abstraction
    layer
  media: atomisp: reduce abstraction at ia_css_memory_access
  media: atomisp: go one step further to drop ia_css_memory_access.c
  media: atomisp: get rid of mmgr_load and mmgr_store
  media: atomisp: get rid of unused memory_realloc code
  media: atomisp: change the type returned by mmgr alloc
  media: atomisp: get rid of memory_access.c
  media: atomisp: hmm_bo: untag user pointers
  media: atomisp: add debug message to help debugging hmm code
  media: atomisp: use Yocto Aero default hmm pool sizes
  media: atomisp: get rid of a warning message
  media: atomisp: fix driver caps
  media: atomisp: use pin_user_pages() for memory allocation
  media: atomisp: add debug for hmm alloc
  media: atomisp: improve warning for IRQ enable function
  media: atomisp: add debug functions for received events
  media: atomisp: add more comments about frame allocation
  media: atomisp: remove kvmalloc/kvcalloc abstractions
  media: atomisp: avoid OOPS due to non-existing ref_frames
  media: atomisp: avoid an extra memset() when alloc memory
  media: atomisp: remove some trivial wrappers from compat css20
  media: atomisp: do another round of coding style cleanup
  media: atomisp: get rid of non-Linux error codes
  media: atomisp: get rid of an error abstraction layer
  media: atomisp: don't cause a warn if probe failed
  media: atomisp: get rid of a bunch of other wrappers
  media: atomisp: get rid of system_types.h
  media: atomisp: provide more details about the firmware binaries
  media: atomisp: print firmware data during load
  media: atomisp: allow passing firmware name at modprobe time
  media: atomisp: add a debug message at hmm free
  media: atomisp: add some debug messages when binaries are used
  media: atomisp: get rid of set_fs() dirty hacks
  media: atomisp: add SPDX headers

Nathan Chancellor (6):
  media: atomisp: Clean up if block in sh_css_sp_init_stage
  media: atomisp: Remove second increment of count in
    atomisp_subdev_probe
  media: atomisp: Remove unnecessary NULL checks in
    ia_css_pipe_load_extension
  media: atomisp: Remove unnecessary NULL check in atomisp_param
  media: atomisp: Avoid overflow in compute_blending
  media: atomisp: Remove binary_supports_input_format

 drivers/staging/media/atomisp/Kconfig         |    1 +
 drivers/staging/media/atomisp/Makefile        |    9 +-
 drivers/staging/media/atomisp/TODO            |    7 +-
 drivers/staging/media/atomisp/i2c/Kconfig     |    3 +-
 .../media/atomisp/i2c/atomisp-gc0310.c        |    2 +-
 .../media/atomisp/i2c/atomisp-gc2235.c        |    1 +
 .../atomisp/i2c/atomisp-libmsrlisthelper.c    |    1 +
 .../media/atomisp/i2c/atomisp-lm3554.c        |    1 +
 .../media/atomisp/i2c/atomisp-mt9m114.c       |    1 +
 .../media/atomisp/i2c/atomisp-ov2680.c        |    3 +-
 .../media/atomisp/i2c/atomisp-ov2722.c        |    1 +
 drivers/staging/media/atomisp/i2c/gc0310.h    |    1 +
 drivers/staging/media/atomisp/i2c/gc2235.h    |    1 +
 drivers/staging/media/atomisp/i2c/mt9m114.h   |    1 +
 drivers/staging/media/atomisp/i2c/ov2680.h    |    3 +
 drivers/staging/media/atomisp/i2c/ov2722.h    |    1 +
 .../staging/media/atomisp/i2c/ov5693/Kconfig  |    1 +
 .../staging/media/atomisp/i2c/ov5693/ad5823.h |    1 +
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c |    5 +-
 .../staging/media/atomisp/i2c/ov5693/ov5693.h |    1 +
 .../staging/media/atomisp/include/hmm/hmm.h   |    8 +-
 .../media/atomisp/include/hmm/hmm_bo.h        |   12 +-
 .../media/atomisp/include/hmm/hmm_common.h    |    1 +
 .../media/atomisp/include/hmm/hmm_pool.h      |    1 +
 .../media/atomisp/include/linux/atomisp.h     |    5 +-
 .../include/linux/atomisp_gmin_platform.h     |    1 +
 .../atomisp/include/linux/atomisp_platform.h  |    1 +
 .../atomisp/include/linux/libmsrlisthelper.h  |    1 +
 .../media/atomisp/include/media/lm3554.h      |    1 +
 .../media/atomisp/include/mmu/isp_mmu.h       |    1 +
 .../media/atomisp/include/mmu/sh_mmu_mrfld.h  |    1 +
 .../staging/media/atomisp/pci/atomisp-regs.h  |    1 +
 .../staging/media/atomisp/pci/atomisp_acc.c   |   32 +-
 .../staging/media/atomisp/pci/atomisp_acc.h   |    1 +
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  178 +-
 .../staging/media/atomisp/pci/atomisp_cmd.h   |    1 +
 .../media/atomisp/pci/atomisp_common.h        |    1 +
 .../media/atomisp/pci/atomisp_compat.h        |   90 +-
 .../media/atomisp/pci/atomisp_compat_css20.c  |  508 ++----
 .../media/atomisp/pci/atomisp_compat_css20.h  |   19 +-
 .../atomisp/pci/atomisp_compat_ioctl32.c      |   90 +-
 .../atomisp/pci/atomisp_compat_ioctl32.h      |    1 +
 .../staging/media/atomisp/pci/atomisp_csi2.c  |    5 +-
 .../staging/media/atomisp/pci/atomisp_csi2.h  |    1 +
 .../media/atomisp/pci/atomisp_dfs_tables.h    |    1 +
 .../staging/media/atomisp/pci/atomisp_drvfs.c |    6 +-
 .../staging/media/atomisp/pci/atomisp_drvfs.h |    1 +
 .../staging/media/atomisp/pci/atomisp_file.c  |    8 +-
 .../staging/media/atomisp/pci/atomisp_file.h  |    1 +
 .../staging/media/atomisp/pci/atomisp_fops.c  |    9 +-
 .../staging/media/atomisp/pci/atomisp_fops.h  |    1 +
 .../media/atomisp/pci/atomisp_gmin_platform.c |    6 +-
 .../media/atomisp/pci/atomisp_helper.h        |    1 +
 .../media/atomisp/pci/atomisp_internal.h      |    1 +
 .../staging/media/atomisp/pci/atomisp_ioctl.c |   73 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.h |    1 +
 .../media/atomisp/pci/atomisp_subdev.c        |    9 +-
 .../media/atomisp/pci/atomisp_subdev.h        |    1 +
 .../media/atomisp/pci/atomisp_tables.h        |    1 +
 .../staging/media/atomisp/pci/atomisp_tpg.c   |    1 +
 .../staging/media/atomisp/pci/atomisp_tpg.h   |    1 +
 .../media/atomisp/pci/atomisp_trace_event.h   |    1 +
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   79 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.h  |    1 +
 .../base/circbuf/interface/ia_css_circbuf.h   |    1 +
 .../circbuf/interface/ia_css_circbuf_comm.h   |    1 +
 .../circbuf/interface/ia_css_circbuf_desc.h   |    1 +
 .../atomisp/pci/base/circbuf/src/circbuf.c    |    1 +
 .../base/refcount/interface/ia_css_refcount.h |   18 +-
 .../atomisp/pci/base/refcount/src/refcount.c  |   34 +-
 drivers/staging/media/atomisp/pci/bits.h      |    1 +
 .../pipe/interface/ia_css_pipe_binarydesc.h   |   17 +-
 .../pipe/interface/ia_css_pipe_stagedesc.h    |    1 +
 .../camera/pipe/interface/ia_css_pipe_util.h  |    1 +
 .../pci/camera/pipe/src/pipe_binarydesc.c     |   29 +-
 .../pci/camera/pipe/src/pipe_stagedesc.c      |    1 +
 .../atomisp/pci/camera/pipe/src/pipe_util.c   |    1 +
 .../pci/camera/util/interface/ia_css_util.h   |   22 +-
 .../media/atomisp/pci/camera/util/src/util.c  |   68 +-
 .../staging/media/atomisp/pci/cell_params.h   |    1 +
 .../css_2400_system/hive/ia_css_isp_configs.c |    1 +
 .../css_2400_system/hive/ia_css_isp_params.c  |    1 +
 .../css_2400_system/hive/ia_css_isp_states.c  |    3 +-
 .../hrt/hive_isp_css_irq_types_hrt.h          |    1 +
 .../hrt/isp2400_mamoiada_params.h             |    1 +
 .../pci/css_2401_system/csi_rx_global.h       |    1 +
 .../css_2401_system/hive/ia_css_isp_configs.c |    2 +-
 .../css_2401_system/hive/ia_css_isp_params.c  |    1 +
 .../css_2401_system/hive/ia_css_isp_states.c  |    3 +-
 .../atomisp/pci/css_2401_system/host/csi_rx.c |    1 +
 .../pci/css_2401_system/host/csi_rx_local.h   |    1 +
 .../pci/css_2401_system/host/csi_rx_private.h |    1 +
 .../pci/css_2401_system/host/ibuf_ctrl.c      |    1 +
 .../css_2401_system/host/ibuf_ctrl_local.h    |    1 +
 .../css_2401_system/host/ibuf_ctrl_private.h  |    1 +
 .../pci/css_2401_system/host/isys_dma.c       |    1 +
 .../pci/css_2401_system/host/isys_dma_local.h |    1 +
 .../css_2401_system/host/isys_dma_private.h   |    1 +
 .../pci/css_2401_system/host/isys_irq.c       |    1 +
 .../pci/css_2401_system/host/isys_irq_local.h |    1 +
 .../css_2401_system/host/isys_irq_private.h   |    1 +
 .../css_2401_system/host/isys_stream2mmio.c   |    1 +
 .../host/isys_stream2mmio_local.h             |    1 +
 .../host/isys_stream2mmio_private.h           |    1 +
 .../pci/css_2401_system/host/pixelgen_local.h |    1 +
 .../css_2401_system/host/pixelgen_private.h   |    1 +
 .../hrt/PixelGen_SysBlock_defs.h              |    1 +
 .../pci/css_2401_system/hrt/ibuf_cntrl_defs.h |    1 +
 .../hrt/mipi_backend_common_defs.h            |    1 +
 .../css_2401_system/hrt/mipi_backend_defs.h   |    1 +
 .../pci/css_2401_system/hrt/rx_csi_defs.h     |    1 +
 .../css_2401_system/hrt/stream2mmio_defs.h    |    1 +
 .../pci/css_2401_system/ibuf_ctrl_global.h    |    1 +
 .../pci/css_2401_system/isys_dma_global.h     |    2 +
 .../pci/css_2401_system/isys_irq_global.h     |    1 +
 .../css_2401_system/isys_stream2mmio_global.h |    1 +
 .../pci/css_2401_system/pixelgen_global.h     |    1 +
 .../pci/css_receiver_2400_common_defs.h       |    1 +
 .../atomisp/pci/css_receiver_2400_defs.h      |    1 +
 drivers/staging/media/atomisp/pci/css_trace.h |    2 +-
 drivers/staging/media/atomisp/pci/defs.h      |    1 +
 .../staging/media/atomisp/pci/dma_v2_defs.h   |    1 +
 .../staging/media/atomisp/pci/gdc_v2_defs.h   |    1 +
 .../staging/media/atomisp/pci/gp_timer_defs.h |    1 +
 .../media/atomisp/pci/gpio_block_defs.h       |    1 +
 .../pci/hive_isp_css_2401_irq_types_hrt.h     |    1 +
 .../pci/hive_isp_css_common/debug_global.h    |    1 +
 .../pci/hive_isp_css_common/dma_global.h      |    1 +
 .../hive_isp_css_common/event_fifo_global.h   |    1 +
 .../hive_isp_css_common/fifo_monitor_global.h |    1 +
 .../pci/hive_isp_css_common/gdc_global.h      |    1 +
 .../hive_isp_css_common/gp_device_global.h    |    1 +
 .../pci/hive_isp_css_common/gp_timer_global.h |    1 +
 .../pci/hive_isp_css_common/gpio_global.h     |    1 +
 .../pci/hive_isp_css_common/hmem_global.h     |    1 +
 .../pci/hive_isp_css_common/host/debug.c      |   17 +-
 .../hive_isp_css_common/host/debug_local.h    |    1 +
 .../hive_isp_css_common/host/debug_private.h  |   11 +-
 .../pci/hive_isp_css_common/host/dma.c        |    1 +
 .../pci/hive_isp_css_common/host/dma_local.h  |    1 +
 .../hive_isp_css_common/host/dma_private.h    |    1 +
 .../pci/hive_isp_css_common/host/event_fifo.c |    1 +
 .../host/event_fifo_local.h                   |    1 +
 .../host/event_fifo_private.h                 |    1 +
 .../hive_isp_css_common/host/fifo_monitor.c   |    1 +
 .../host/fifo_monitor_local.h                 |    1 +
 .../host/fifo_monitor_private.h               |    1 +
 .../pci/hive_isp_css_common/host/gdc.c        |    1 +
 .../pci/hive_isp_css_common/host/gdc_local.h  |    1 +
 .../hive_isp_css_common/host/gdc_private.h    |    1 +
 .../pci/hive_isp_css_common/host/gp_device.c  |    1 +
 .../host/gp_device_local.h                    |    1 +
 .../host/gp_device_private.h                  |    1 +
 .../pci/hive_isp_css_common/host/gp_timer.c   |    1 +
 .../hive_isp_css_common/host/gp_timer_local.h |    1 +
 .../host/gp_timer_private.h                   |    1 +
 .../pci/hive_isp_css_common/host/gpio_local.h |    1 +
 .../hive_isp_css_common/host/gpio_private.h   |    1 +
 .../pci/hive_isp_css_common/host/hmem.c       |    1 +
 .../pci/hive_isp_css_common/host/hmem_local.h |    1 +
 .../hive_isp_css_common/host/hmem_private.h   |    1 +
 .../host/input_formatter.c                    |    1 +
 .../host/input_formatter_local.h              |    1 +
 .../host/input_formatter_private.h            |    1 +
 .../hive_isp_css_common/host/input_system.c   |    1 +
 .../pci/hive_isp_css_common/host/irq.c        |    1 +
 .../pci/hive_isp_css_common/host/irq_local.h  |    1 +
 .../hive_isp_css_common/host/irq_private.h    |    1 +
 .../pci/hive_isp_css_common/host/isp.c        |    1 +
 .../pci/hive_isp_css_common/host/isp_local.h  |    1 +
 .../hive_isp_css_common/host/isp_private.h    |    1 +
 .../pci/hive_isp_css_common/host/mmu.c        |    1 +
 .../pci/hive_isp_css_common/host/mmu_local.h  |    1 +
 .../atomisp/pci/hive_isp_css_common/host/sp.c |    1 +
 .../pci/hive_isp_css_common/host/sp_local.h   |    1 +
 .../pci/hive_isp_css_common/host/sp_private.h |    1 +
 .../pci/hive_isp_css_common/host/timed_ctrl.c |    1 +
 .../host/timed_ctrl_local.h                   |    1 +
 .../host/timed_ctrl_private.h                 |    1 +
 .../hive_isp_css_common/host/vamem_local.h    |    1 +
 .../pci/hive_isp_css_common/host/vmem.c       |    1 +
 .../pci/hive_isp_css_common/host/vmem_local.h |    1 +
 .../hive_isp_css_common/host/vmem_private.h   |    1 +
 .../input_formatter_global.h                  |    3 +-
 .../pci/hive_isp_css_common/irq_global.h      |    3 +-
 .../pci/hive_isp_css_common/isp_global.h      |    3 +-
 .../pci/hive_isp_css_common/mmu_global.h      |    1 +
 .../pci/hive_isp_css_common/sp_global.h       |    3 +-
 .../hive_isp_css_common/timed_ctrl_global.h   |    1 +
 .../pci/hive_isp_css_common/vamem_global.h    |    1 +
 .../pci/hive_isp_css_common/vmem_global.h     |    1 +
 .../media/atomisp/pci/hive_isp_css_defs.h     |    1 +
 .../pci/hive_isp_css_include/assert_support.h |    1 +
 .../pci/hive_isp_css_include/bitop_support.h  |    1 +
 .../atomisp/pci/hive_isp_css_include/csi_rx.h |    1 +
 .../atomisp/pci/hive_isp_css_include/debug.h  |    1 +
 .../device_access/device_access.h             |    3 +-
 .../atomisp/pci/hive_isp_css_include/dma.h    |    1 +
 .../pci/hive_isp_css_include/error_support.h  |   39 -
 .../pci/hive_isp_css_include/event_fifo.h     |    1 +
 .../pci/hive_isp_css_include/fifo_monitor.h   |    1 +
 .../pci/hive_isp_css_include/gdc_device.h     |    1 +
 .../pci/hive_isp_css_include/gp_device.h      |    1 +
 .../pci/hive_isp_css_include/gp_timer.h       |    1 +
 .../atomisp/pci/hive_isp_css_include/gpio.h   |    1 +
 .../atomisp/pci/hive_isp_css_include/hmem.h   |    1 +
 .../hive_isp_css_include/host/csi_rx_public.h |    1 +
 .../hive_isp_css_include/host/debug_public.h  |    8 +-
 .../hive_isp_css_include/host/dma_public.h    |    3 +-
 .../host/event_fifo_public.h                  |    3 +-
 .../host/fifo_monitor_public.h                |    3 +-
 .../hive_isp_css_include/host/gdc_public.h    |    1 +
 .../host/gp_device_public.h                   |    3 +-
 .../host/gp_timer_public.h                    |    3 +-
 .../hive_isp_css_include/host/gpio_public.h   |    3 +-
 .../hive_isp_css_include/host/hmem_public.h   |    1 +
 .../host/ibuf_ctrl_public.h                   |    1 +
 .../host/input_formatter_public.h             |    3 +-
 .../hive_isp_css_include/host/irq_public.h    |    3 +-
 .../hive_isp_css_include/host/isp_public.h    |    3 +-
 .../host/isys_dma_public.h                    |    3 +-
 .../host/isys_irq_public.h                    |    1 +
 .../hive_isp_css_include/host/isys_public.h   |    1 +
 .../host/isys_stream2mmio_public.h            |    1 +
 .../hive_isp_css_include/host/mmu_public.h    |    3 +-
 .../host/pixelgen_public.h                    |    1 +
 .../pci/hive_isp_css_include/host/sp_public.h |    3 +-
 .../hive_isp_css_include/host/tag_public.h    |    1 +
 .../host/timed_ctrl_public.h                  |    3 +-
 .../hive_isp_css_include/host/vamem_public.h  |    1 +
 .../hive_isp_css_include/host/vmem_public.h   |    1 +
 .../pci/hive_isp_css_include/ibuf_ctrl.h      |    1 +
 .../hive_isp_css_include/input_formatter.h    |    1 +
 .../pci/hive_isp_css_include/input_system.h   |    1 +
 .../atomisp/pci/hive_isp_css_include/irq.h    |    1 +
 .../atomisp/pci/hive_isp_css_include/isp.h    |    1 +
 .../pci/hive_isp_css_include/isys_dma.h       |    1 +
 .../pci/hive_isp_css_include/isys_irq.h       |    1 +
 .../hive_isp_css_include/isys_stream2mmio.h   |    1 +
 .../pci/hive_isp_css_include/math_support.h   |    1 +
 .../memory_access/memory_access.h             |  174 --
 .../pci/hive_isp_css_include/memory_realloc.h |   38 -
 .../pci/hive_isp_css_include/misc_support.h   |    1 +
 .../pci/hive_isp_css_include/mmu_device.h     |    1 +
 .../pci/hive_isp_css_include/pixelgen.h       |    1 +
 .../hive_isp_css_include/platform_support.h   |    1 +
 .../pci/hive_isp_css_include/print_support.h  |    1 +
 .../atomisp/pci/hive_isp_css_include/queue.h  |    1 +
 .../pci/hive_isp_css_include/resource.h       |    1 +
 .../atomisp/pci/hive_isp_css_include/sp.h     |    1 +
 .../pci/hive_isp_css_include/string_support.h |   18 +-
 .../pci/hive_isp_css_include/system_types.h   |   24 -
 .../atomisp/pci/hive_isp_css_include/tag.h    |    1 +
 .../pci/hive_isp_css_include/timed_ctrl.h     |    1 +
 .../pci/hive_isp_css_include/type_support.h   |    1 +
 .../atomisp/pci/hive_isp_css_include/vamem.h  |    1 +
 .../atomisp/pci/hive_isp_css_include/vmem.h   |    1 +
 .../hive_isp_css_shared/host/queue_local.h    |    1 +
 .../hive_isp_css_shared/host/queue_private.h  |    1 +
 .../pci/hive_isp_css_shared/host/tag.c        |    1 +
 .../pci/hive_isp_css_shared/host/tag_local.h  |    1 +
 .../hive_isp_css_shared/host/tag_private.h    |    1 +
 .../pci/hive_isp_css_shared/queue_global.h    |    1 +
 .../pci/hive_isp_css_shared/sw_event_global.h |    1 +
 .../pci/hive_isp_css_shared/tag_global.h      |    1 +
 ...hive_isp_css_streaming_to_mipi_types_hrt.h |    1 +
 .../staging/media/atomisp/pci/hive_types.h    |    4 +-
 drivers/staging/media/atomisp/pci/hmm/hmm.c   |   40 +-
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    |  154 +-
 .../media/atomisp/pci/hmm/hmm_dynamic_pool.c  |    1 +
 .../media/atomisp/pci/hmm/hmm_reserved_pool.c |    1 +
 .../pci/hrt/hive_isp_css_custom_host_hrt.h    |    1 +
 .../atomisp/pci/hrt/hive_isp_css_mm_hrt.c     |  124 --
 .../atomisp/pci/hrt/hive_isp_css_mm_hrt.h     |   57 -
 drivers/staging/media/atomisp/pci/ia_css.h    |    1 +
 drivers/staging/media/atomisp/pci/ia_css_3a.h |    3 +-
 .../media/atomisp/pci/ia_css_acc_types.h      |    7 +-
 .../staging/media/atomisp/pci/ia_css_buffer.h |    1 +
 .../media/atomisp/pci/ia_css_control.h        |   17 +-
 .../media/atomisp/pci/ia_css_device_access.c  |    3 +-
 .../media/atomisp/pci/ia_css_device_access.h  |    3 +-
 .../staging/media/atomisp/pci/ia_css_dvs.h    |    5 +-
 .../staging/media/atomisp/pci/ia_css_env.h    |    1 +
 .../staging/media/atomisp/pci/ia_css_err.h    |   22 +-
 .../media/atomisp/pci/ia_css_event_public.h   |   19 +-
 .../media/atomisp/pci/ia_css_firmware.h       |    7 +-
 .../staging/media/atomisp/pci/ia_css_frac.h   |    1 +
 .../media/atomisp/pci/ia_css_frame_format.h   |    1 +
 .../media/atomisp/pci/ia_css_frame_public.h   |   17 +-
 .../media/atomisp/pci/ia_css_host_data.h      |    1 +
 .../media/atomisp/pci/ia_css_input_port.h     |    1 +
 .../staging/media/atomisp/pci/ia_css_irq.h    |    9 +-
 .../media/atomisp/pci/ia_css_isp_configs.h    |    1 +
 .../media/atomisp/pci/ia_css_isp_params.h     |    1 +
 .../media/atomisp/pci/ia_css_isp_states.h     |    3 +-
 .../media/atomisp/pci/ia_css_memory_access.c  |   85 -
 .../media/atomisp/pci/ia_css_metadata.h       |    1 +
 .../staging/media/atomisp/pci/ia_css_mipi.h   |    7 +-
 .../staging/media/atomisp/pci/ia_css_mmu.h    |    1 +
 .../media/atomisp/pci/ia_css_mmu_private.h    |    1 +
 .../staging/media/atomisp/pci/ia_css_morph.h  |    1 +
 .../staging/media/atomisp/pci/ia_css_pipe.h   |    5 +-
 .../media/atomisp/pci/ia_css_pipe_public.h    |   73 +-
 .../staging/media/atomisp/pci/ia_css_prbs.h   |    1 +
 .../media/atomisp/pci/ia_css_properties.h     |    1 +
 .../media/atomisp/pci/ia_css_shading.h        |    1 +
 .../staging/media/atomisp/pci/ia_css_stream.h |    3 +-
 .../media/atomisp/pci/ia_css_stream_format.h  |    1 +
 .../media/atomisp/pci/ia_css_stream_public.h  |   71 +-
 .../staging/media/atomisp/pci/ia_css_timer.h  |    5 +-
 .../staging/media/atomisp/pci/ia_css_tpg.h    |    1 +
 .../staging/media/atomisp/pci/ia_css_types.h  |    2 +-
 .../media/atomisp/pci/ia_css_version.h        |    3 +-
 .../media/atomisp/pci/ia_css_version_data.h   |    1 +
 drivers/staging/media/atomisp/pci/if_defs.h   |    1 +
 .../pci/input_formatter_subsystem_defs.h      |    1 +
 .../media/atomisp/pci/input_selector_defs.h   |    1 +
 .../atomisp/pci/input_switch_2400_defs.h      |    1 +
 .../atomisp/pci/input_system_ctrl_defs.h      |    1 +
 .../media/atomisp/pci/input_system_defs.h     |    1 +
 .../media/atomisp/pci/input_system_global.h   |    1 +
 .../media/atomisp/pci/input_system_local.h    |    1 +
 .../media/atomisp/pci/input_system_private.h  |    1 +
 .../media/atomisp/pci/input_system_public.h   |    1 +
 .../media/atomisp/pci/irq_controller_defs.h   |    1 +
 .../pci/isp/kernels/aa/aa_2/ia_css_aa2.host.c |    1 +
 .../pci/isp/kernels/aa/aa_2/ia_css_aa2.host.h |    1 +
 .../isp/kernels/aa/aa_2/ia_css_aa2_param.h    |    1 +
 .../isp/kernels/aa/aa_2/ia_css_aa2_types.h    |    1 +
 .../isp/kernels/anr/anr_1.0/ia_css_anr.host.c |    1 +
 .../isp/kernels/anr/anr_1.0/ia_css_anr.host.h |    1 +
 .../kernels/anr/anr_1.0/ia_css_anr_param.h    |    1 +
 .../kernels/anr/anr_1.0/ia_css_anr_types.h    |    1 +
 .../isp/kernels/anr/anr_2/ia_css_anr2.host.c  |    1 +
 .../isp/kernels/anr/anr_2/ia_css_anr2.host.h  |    1 +
 .../isp/kernels/anr/anr_2/ia_css_anr2_param.h |    3 +-
 .../anr/anr_2/ia_css_anr2_table.host.c        |    1 +
 .../anr/anr_2/ia_css_anr2_table.host.h        |    1 +
 .../isp/kernels/anr/anr_2/ia_css_anr2_types.h |    1 +
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.c  |    2 +-
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.h  |    1 +
 .../pci/isp/kernels/bh/bh_2/ia_css_bh_param.h |    1 +
 .../pci/isp/kernels/bh/bh_2/ia_css_bh_types.h |    1 +
 .../pci/isp/kernels/bnlm/ia_css_bnlm.host.c   |    3 +-
 .../pci/isp/kernels/bnlm/ia_css_bnlm.host.h   |    1 +
 .../pci/isp/kernels/bnlm/ia_css_bnlm_param.h  |    1 +
 .../pci/isp/kernels/bnlm/ia_css_bnlm_types.h  |    1 +
 .../kernels/bnr/bnr2_2/ia_css_bnr2_2.host.c   |    1 +
 .../kernels/bnr/bnr2_2/ia_css_bnr2_2.host.h   |    1 +
 .../kernels/bnr/bnr2_2/ia_css_bnr2_2_param.h  |    1 +
 .../kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h  |    1 +
 .../isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c |    1 +
 .../isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.h |    1 +
 .../kernels/bnr/bnr_1.0/ia_css_bnr_param.h    |    1 +
 .../isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c |    1 +
 .../isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.h |    1 +
 .../kernels/cnr/cnr_1.0/ia_css_cnr_param.h    |    1 +
 .../isp/kernels/cnr/cnr_2/ia_css_cnr2.host.c  |    1 +
 .../isp/kernels/cnr/cnr_2/ia_css_cnr2.host.h  |    1 +
 .../isp/kernels/cnr/cnr_2/ia_css_cnr2_param.h |    1 +
 .../isp/kernels/cnr/cnr_2/ia_css_cnr2_types.h |    1 +
 .../conversion_1.0/ia_css_conversion.host.c   |    1 +
 .../conversion_1.0/ia_css_conversion.host.h   |    1 +
 .../conversion_1.0/ia_css_conversion_param.h  |    1 +
 .../conversion_1.0/ia_css_conversion_types.h  |    1 +
 .../copy_output_1.0/ia_css_copy_output.host.c |    1 +
 .../copy_output_1.0/ia_css_copy_output.host.h |    1 +
 .../ia_css_copy_output_param.h                |    1 +
 .../kernels/crop/crop_1.0/ia_css_crop.host.c  |    1 +
 .../kernels/crop/crop_1.0/ia_css_crop.host.h  |    1 +
 .../kernels/crop/crop_1.0/ia_css_crop_param.h |    1 +
 .../kernels/crop/crop_1.0/ia_css_crop_types.h |    1 +
 .../isp/kernels/csc/csc_1.0/ia_css_csc.host.c |    1 +
 .../isp/kernels/csc/csc_1.0/ia_css_csc.host.h |    1 +
 .../kernels/csc/csc_1.0/ia_css_csc_param.h    |    1 +
 .../kernels/csc/csc_1.0/ia_css_csc_types.h    |    1 +
 .../kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c   |    1 +
 .../kernels/ctc/ctc1_5/ia_css_ctc1_5.host.h   |    1 +
 .../kernels/ctc/ctc1_5/ia_css_ctc1_5_param.h  |    1 +
 .../isp/kernels/ctc/ctc2/ia_css_ctc2.host.c   |    1 +
 .../isp/kernels/ctc/ctc2/ia_css_ctc2.host.h   |    1 +
 .../isp/kernels/ctc/ctc2/ia_css_ctc2_param.h  |    1 +
 .../isp/kernels/ctc/ctc2/ia_css_ctc2_types.h  |    1 +
 .../isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.c |    1 +
 .../isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.h |    1 +
 .../kernels/ctc/ctc_1.0/ia_css_ctc_param.h    |    1 +
 .../ctc/ctc_1.0/ia_css_ctc_table.host.c       |    1 +
 .../ctc/ctc_1.0/ia_css_ctc_table.host.h       |    1 +
 .../kernels/ctc/ctc_1.0/ia_css_ctc_types.h    |    1 +
 .../isp/kernels/de/de_1.0/ia_css_de.host.c    |    1 +
 .../isp/kernels/de/de_1.0/ia_css_de.host.h    |    1 +
 .../isp/kernels/de/de_1.0/ia_css_de_param.h   |    1 +
 .../isp/kernels/de/de_1.0/ia_css_de_types.h   |    1 +
 .../pci/isp/kernels/de/de_2/ia_css_de2.host.c |    1 +
 .../pci/isp/kernels/de/de_2/ia_css_de2.host.h |    1 +
 .../isp/kernels/de/de_2/ia_css_de2_param.h    |    1 +
 .../isp/kernels/de/de_2/ia_css_de2_types.h    |    1 +
 .../isp/kernels/dp/dp_1.0/ia_css_dp.host.c    |    1 +
 .../isp/kernels/dp/dp_1.0/ia_css_dp.host.h    |    1 +
 .../isp/kernels/dp/dp_1.0/ia_css_dp_param.h   |    1 +
 .../isp/kernels/dp/dp_1.0/ia_css_dp_types.h   |    1 +
 .../pci/isp/kernels/dpc2/ia_css_dpc2.host.c   |    1 +
 .../pci/isp/kernels/dpc2/ia_css_dpc2.host.h   |    1 +
 .../pci/isp/kernels/dpc2/ia_css_dpc2_param.h  |    1 +
 .../pci/isp/kernels/dpc2/ia_css_dpc2_types.h  |    1 +
 .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c |   14 +-
 .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h |    5 +-
 .../kernels/dvs/dvs_1.0/ia_css_dvs_param.h    |    1 +
 .../kernels/dvs/dvs_1.0/ia_css_dvs_types.h    |    1 +
 .../isp/kernels/eed1_8/ia_css_eed1_8.host.c   |    1 +
 .../isp/kernels/eed1_8/ia_css_eed1_8.host.h   |    1 +
 .../isp/kernels/eed1_8/ia_css_eed1_8_param.h  |    1 +
 .../isp/kernels/eed1_8/ia_css_eed1_8_types.h  |    1 +
 .../kernels/fc/fc_1.0/ia_css_formats.host.c   |    1 +
 .../kernels/fc/fc_1.0/ia_css_formats.host.h   |    1 +
 .../kernels/fc/fc_1.0/ia_css_formats_param.h  |    1 +
 .../kernels/fc/fc_1.0/ia_css_formats_types.h  |    1 +
 .../fixedbds_1.0/ia_css_fixedbds_param.h      |    1 +
 .../fixedbds_1.0/ia_css_fixedbds_types.h      |    1 +
 .../isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c |    1 +
 .../isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h |    1 +
 .../kernels/fpn/fpn_1.0/ia_css_fpn_param.h    |    1 +
 .../kernels/fpn/fpn_1.0/ia_css_fpn_types.h    |    1 +
 .../isp/kernels/gc/gc_1.0/ia_css_gc.host.c    |    1 +
 .../isp/kernels/gc/gc_1.0/ia_css_gc.host.h    |    1 +
 .../isp/kernels/gc/gc_1.0/ia_css_gc_param.h   |    1 +
 .../kernels/gc/gc_1.0/ia_css_gc_table.host.c  |    1 +
 .../kernels/gc/gc_1.0/ia_css_gc_table.host.h  |    1 +
 .../isp/kernels/gc/gc_1.0/ia_css_gc_types.h   |    1 +
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2.host.c |    1 +
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2.host.h |    1 +
 .../isp/kernels/gc/gc_2/ia_css_gc2_param.h    |    1 +
 .../kernels/gc/gc_2/ia_css_gc2_table.host.c   |    1 +
 .../kernels/gc/gc_2/ia_css_gc2_table.host.h   |    1 +
 .../isp/kernels/gc/gc_2/ia_css_gc2_types.h    |    1 +
 .../pci/isp/kernels/hdr/ia_css_hdr.host.c     |    1 +
 .../pci/isp/kernels/hdr/ia_css_hdr.host.h     |    1 +
 .../pci/isp/kernels/hdr/ia_css_hdr_param.h    |    1 +
 .../pci/isp/kernels/hdr/ia_css_hdr_types.h    |    1 +
 .../bayer_io_ls/ia_css_bayer_io.host.c        |    1 +
 .../bayer_io_ls/ia_css_bayer_io.host.h        |    1 +
 .../bayer_io_ls/ia_css_bayer_io_param.h       |    1 +
 .../bayer_io_ls/ia_css_bayer_io_types.h       |    1 +
 .../common/ia_css_common_io_param.h           |    1 +
 .../common/ia_css_common_io_types.h           |    1 +
 .../yuv444_io_ls/ia_css_yuv444_io.host.c      |    1 +
 .../yuv444_io_ls/ia_css_yuv444_io.host.h      |    1 +
 .../yuv444_io_ls/ia_css_yuv444_io_param.h     |    1 +
 .../yuv444_io_ls/ia_css_yuv444_io_types.h     |    1 +
 .../iterator_1.0/ia_css_iterator.host.c       |    5 +-
 .../iterator_1.0/ia_css_iterator.host.h       |    3 +-
 .../iterator_1.0/ia_css_iterator_param.h      |    1 +
 .../macc/macc1_5/ia_css_macc1_5.host.c        |    1 +
 .../macc/macc1_5/ia_css_macc1_5.host.h        |    1 +
 .../macc/macc1_5/ia_css_macc1_5_param.h       |    3 +-
 .../macc/macc1_5/ia_css_macc1_5_table.host.c  |    1 +
 .../macc/macc1_5/ia_css_macc1_5_table.host.h  |    1 +
 .../macc/macc1_5/ia_css_macc1_5_types.h       |    1 +
 .../kernels/macc/macc_1.0/ia_css_macc.host.c  |    1 +
 .../kernels/macc/macc_1.0/ia_css_macc.host.h  |    1 +
 .../kernels/macc/macc_1.0/ia_css_macc_param.h |    1 +
 .../macc/macc_1.0/ia_css_macc_table.host.c    |    1 +
 .../macc/macc_1.0/ia_css_macc_table.host.h    |    1 +
 .../kernels/macc/macc_1.0/ia_css_macc_types.h |    1 +
 .../kernels/norm/norm_1.0/ia_css_norm.host.c  |    1 +
 .../kernels/norm/norm_1.0/ia_css_norm.host.h  |    1 +
 .../kernels/norm/norm_1.0/ia_css_norm_param.h |    1 +
 .../pci/isp/kernels/ob/ob2/ia_css_ob2.host.c  |    1 +
 .../pci/isp/kernels/ob/ob2/ia_css_ob2.host.h  |    1 +
 .../pci/isp/kernels/ob/ob2/ia_css_ob2_param.h |    1 +
 .../pci/isp/kernels/ob/ob2/ia_css_ob2_types.h |    1 +
 .../isp/kernels/ob/ob_1.0/ia_css_ob.host.c    |    1 +
 .../isp/kernels/ob/ob_1.0/ia_css_ob.host.h    |    1 +
 .../isp/kernels/ob/ob_1.0/ia_css_ob_param.h   |    1 +
 .../isp/kernels/ob/ob_1.0/ia_css_ob_types.h   |    1 +
 .../output/output_1.0/ia_css_output.host.c    |    1 +
 .../output/output_1.0/ia_css_output.host.h    |    1 +
 .../output/output_1.0/ia_css_output_param.h   |    1 +
 .../output/output_1.0/ia_css_output_types.h   |    1 +
 .../qplane/qplane_2/ia_css_qplane.host.c      |    1 +
 .../qplane/qplane_2/ia_css_qplane.host.h      |    1 +
 .../qplane/qplane_2/ia_css_qplane_param.h     |    1 +
 .../qplane/qplane_2/ia_css_qplane_types.h     |    1 +
 .../isp/kernels/raw/raw_1.0/ia_css_raw.host.c |    1 +
 .../isp/kernels/raw/raw_1.0/ia_css_raw.host.h |    1 +
 .../kernels/raw/raw_1.0/ia_css_raw_param.h    |    1 +
 .../kernels/raw/raw_1.0/ia_css_raw_types.h    |    1 +
 .../raw_aa_binning_1.0/ia_css_raa.host.c      |    2 +-
 .../raw_aa_binning_1.0/ia_css_raa.host.h      |    1 +
 .../isp/kernels/ref/ref_1.0/ia_css_ref.host.c |   14 +-
 .../isp/kernels/ref/ref_1.0/ia_css_ref.host.h |    1 +
 .../kernels/ref/ref_1.0/ia_css_ref_param.h    |    5 +-
 .../kernels/ref/ref_1.0/ia_css_ref_state.h    |    1 +
 .../kernels/ref/ref_1.0/ia_css_ref_types.h    |    1 +
 .../isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c |    1 +
 .../isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.h |    1 +
 .../kernels/s3a/s3a_1.0/ia_css_s3a_param.h    |    1 +
 .../kernels/s3a/s3a_1.0/ia_css_s3a_types.h    |    1 +
 .../isp/kernels/sc/sc_1.0/ia_css_sc.host.c    |    1 +
 .../isp/kernels/sc/sc_1.0/ia_css_sc.host.h    |    1 +
 .../isp/kernels/sc/sc_1.0/ia_css_sc_param.h   |    1 +
 .../isp/kernels/sc/sc_1.0/ia_css_sc_types.h   |    1 +
 .../sdis/common/ia_css_sdis_common.host.h     |    5 +-
 .../sdis/common/ia_css_sdis_common_types.h    |    1 +
 .../kernels/sdis/sdis_1.0/ia_css_sdis.host.c  |   28 +-
 .../kernels/sdis/sdis_1.0/ia_css_sdis.host.h  |    3 +-
 .../kernels/sdis/sdis_1.0/ia_css_sdis_types.h |    1 +
 .../kernels/sdis/sdis_2/ia_css_sdis2.host.c   |   18 +-
 .../kernels/sdis/sdis_2/ia_css_sdis2.host.h   |    3 +-
 .../kernels/sdis/sdis_2/ia_css_sdis2_types.h  |    1 +
 .../isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.c |    1 +
 .../isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.h |    1 +
 .../kernels/tdf/tdf_1.0/ia_css_tdf_param.h    |    1 +
 .../kernels/tdf/tdf_1.0/ia_css_tdf_types.h    |    1 +
 .../isp/kernels/tnr/tnr3/ia_css_tnr3_types.h  |    1 +
 .../isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c |    1 +
 .../isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h |    1 +
 .../kernels/tnr/tnr_1.0/ia_css_tnr_param.h    |    3 +-
 .../kernels/tnr/tnr_1.0/ia_css_tnr_state.h    |    1 +
 .../kernels/tnr/tnr_1.0/ia_css_tnr_types.h    |    1 +
 .../kernels/uds/uds_1.0/ia_css_uds_param.h    |    1 +
 .../isp/kernels/vf/vf_1.0/ia_css_vf.host.c    |   25 +-
 .../isp/kernels/vf/vf_1.0/ia_css_vf.host.h    |    5 +-
 .../isp/kernels/vf/vf_1.0/ia_css_vf_param.h   |    1 +
 .../isp/kernels/vf/vf_1.0/ia_css_vf_types.h   |    1 +
 .../isp/kernels/wb/wb_1.0/ia_css_wb.host.c    |    1 +
 .../isp/kernels/wb/wb_1.0/ia_css_wb.host.h    |    1 +
 .../isp/kernels/wb/wb_1.0/ia_css_wb_param.h   |    1 +
 .../isp/kernels/wb/wb_1.0/ia_css_wb_types.h   |    1 +
 .../isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c |    1 +
 .../isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.h |    1 +
 .../kernels/xnr/xnr_1.0/ia_css_xnr_param.h    |    1 +
 .../xnr/xnr_1.0/ia_css_xnr_table.host.c       |    1 +
 .../xnr/xnr_1.0/ia_css_xnr_table.host.h       |    1 +
 .../kernels/xnr/xnr_1.0/ia_css_xnr_types.h    |    1 +
 .../kernels/xnr/xnr_3.0/ia_css_xnr3.host.c    |    3 +-
 .../kernels/xnr/xnr_3.0/ia_css_xnr3.host.h    |    1 +
 .../kernels/xnr/xnr_3.0/ia_css_xnr3_param.h   |    1 +
 .../kernels/xnr/xnr_3.0/ia_css_xnr3_types.h   |    1 +
 .../isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c |    1 +
 .../isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.h |    1 +
 .../kernels/ynr/ynr_1.0/ia_css_ynr_param.h    |    1 +
 .../kernels/ynr/ynr_1.0/ia_css_ynr_types.h    |    1 +
 .../isp/kernels/ynr/ynr_2/ia_css_ynr2.host.c  |    1 +
 .../isp/kernels/ynr/ynr_2/ia_css_ynr2.host.h  |    1 +
 .../isp/kernels/ynr/ynr_2/ia_css_ynr2_param.h |    1 +
 .../isp/kernels/ynr/ynr_2/ia_css_ynr2_types.h |    1 +
 .../pci/isp/modes/interface/input_buf.isp.h   |    1 +
 .../pci/isp/modes/interface/isp_const.h       |    1 +
 .../pci/isp/modes/interface/isp_types.h       |    1 +
 .../atomisp/pci/isp2400_input_system_global.h |    1 +
 .../atomisp/pci/isp2400_input_system_local.h  |    1 +
 .../pci/isp2400_input_system_private.h        |    1 +
 .../atomisp/pci/isp2400_input_system_public.h |    1 +
 .../media/atomisp/pci/isp2400_support.h       |    1 +
 .../media/atomisp/pci/isp2400_system_global.h |    1 +
 .../media/atomisp/pci/isp2400_system_local.h  |    6 +
 .../atomisp/pci/isp2401_input_system_global.h |    1 +
 .../atomisp/pci/isp2401_input_system_local.h  |    1 +
 .../pci/isp2401_input_system_private.h        |    1 +
 .../atomisp/pci/isp2401_mamoiada_params.h     |    1 +
 .../media/atomisp/pci/isp2401_system_global.h |    1 +
 .../media/atomisp/pci/isp2401_system_local.h  |    6 +
 .../media/atomisp/pci/isp_acquisition_defs.h  |    1 +
 .../media/atomisp/pci/isp_capture_defs.h      |    1 +
 .../media/atomisp/pci/memory_realloc.c        |   81 -
 .../staging/media/atomisp/pci/mmu/isp_mmu.c   |    1 +
 .../media/atomisp/pci/mmu/sh_mmu_mrfld.c      |    4 +-
 drivers/staging/media/atomisp/pci/mmu_defs.h  |    1 +
 .../runtime/binary/interface/ia_css_binary.h  |   15 +-
 .../atomisp/pci/runtime/binary/src/binary.c   |  137 +-
 .../pci/runtime/bufq/interface/ia_css_bufq.h  |   33 +-
 .../runtime/bufq/interface/ia_css_bufq_comm.h |    1 +
 .../media/atomisp/pci/runtime/bufq/src/bufq.c |   92 +-
 .../runtime/debug/interface/ia_css_debug.h    |    5 +-
 .../debug/interface/ia_css_debug_internal.h   |    1 +
 .../debug/interface/ia_css_debug_pipe.h       |    1 +
 .../pci/runtime/debug/src/ia_css_debug.c      |    6 +-
 .../runtime/event/interface/ia_css_event.h    |    1 +
 .../atomisp/pci/runtime/event/src/event.c     |    3 +-
 .../runtime/eventq/interface/ia_css_eventq.h  |    9 +-
 .../atomisp/pci/runtime/eventq/src/eventq.c   |    5 +-
 .../runtime/frame/interface/ia_css_frame.h    |   11 +-
 .../frame/interface/ia_css_frame_comm.h       |    5 +-
 .../atomisp/pci/runtime/frame/src/frame.c     |  154 +-
 .../runtime/ifmtr/interface/ia_css_ifmtr.h    |    3 +-
 .../atomisp/pci/runtime/ifmtr/src/ifmtr.c     |   29 +-
 .../inputfifo/interface/ia_css_inputfifo.h    |    1 +
 .../pci/runtime/inputfifo/src/inputfifo.c     |    1 +
 .../isp_param/interface/ia_css_isp_param.h    |    7 +-
 .../interface/ia_css_isp_param_types.h        |    1 +
 .../pci/runtime/isp_param/src/isp_param.c     |   32 +-
 .../pci/runtime/isys/interface/ia_css_isys.h  |   13 +-
 .../runtime/isys/interface/ia_css_isys_comm.h |    1 +
 .../pci/runtime/isys/src/csi_rx_rmgr.c        |   13 +-
 .../pci/runtime/isys/src/csi_rx_rmgr.h        |    1 +
 .../pci/runtime/isys/src/ibuf_ctrl_rmgr.c     |    1 +
 .../pci/runtime/isys/src/ibuf_ctrl_rmgr.h     |    1 +
 .../pci/runtime/isys/src/isys_dma_rmgr.c      |    1 +
 .../pci/runtime/isys/src/isys_dma_rmgr.h      |    1 +
 .../atomisp/pci/runtime/isys/src/isys_init.c  |    1 +
 .../runtime/isys/src/isys_stream2mmio_rmgr.c  |    1 +
 .../runtime/isys/src/isys_stream2mmio_rmgr.h  |    1 +
 .../media/atomisp/pci/runtime/isys/src/rx.c   |   21 +-
 .../pci/runtime/isys/src/virtual_isys.c       |    1 +
 .../pci/runtime/isys/src/virtual_isys.h       |    1 +
 .../pipeline/interface/ia_css_pipeline.h      |   29 +-
 .../interface/ia_css_pipeline_common.h        |    1 +
 .../pci/runtime/pipeline/src/pipeline.c       |   89 +-
 .../runtime/queue/interface/ia_css_queue.h    |   31 +-
 .../queue/interface/ia_css_queue_comm.h       |    1 +
 .../atomisp/pci/runtime/queue/src/queue.c     |   45 +-
 .../pci/runtime/queue/src/queue_access.c      |   28 +-
 .../pci/runtime/queue/src/queue_access.h      |    4 +-
 .../pci/runtime/rmgr/interface/ia_css_rmgr.h  |    3 +-
 .../runtime/rmgr/interface/ia_css_rmgr_vbuf.h |    8 +-
 .../media/atomisp/pci/runtime/rmgr/src/rmgr.c |   11 +-
 .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  |   17 +-
 .../runtime/spctrl/interface/ia_css_spctrl.h  |   11 +-
 .../spctrl/interface/ia_css_spctrl_comm.h     |    1 +
 .../atomisp/pci/runtime/spctrl/src/spctrl.c   |   42 +-
 .../tagger/interface/ia_css_tagger_common.h   |    1 +
 .../atomisp/pci/runtime/timer/src/timer.c     |    7 +-
 .../pci/scalar_processor_2400_params.h        |    1 +
 drivers/staging/media/atomisp/pci/sh_css.c    | 1621 ++++++++---------
 .../staging/media/atomisp/pci/sh_css_defs.h   |    4 +-
 .../media/atomisp/pci/sh_css_dvs_info.h       |    1 +
 .../media/atomisp/pci/sh_css_firmware.c       |  120 +-
 .../media/atomisp/pci/sh_css_firmware.h       |    9 +-
 .../staging/media/atomisp/pci/sh_css_frac.h   |    1 +
 .../media/atomisp/pci/sh_css_host_data.c      |    5 +-
 .../staging/media/atomisp/pci/sh_css_hrt.c    |    5 +-
 .../staging/media/atomisp/pci/sh_css_hrt.h    |    3 +-
 .../media/atomisp/pci/sh_css_internal.h       |   85 +-
 .../staging/media/atomisp/pci/sh_css_legacy.h |    7 +-
 .../media/atomisp/pci/sh_css_metadata.c       |    1 +
 .../media/atomisp/pci/sh_css_metrics.c        |   10 +-
 .../media/atomisp/pci/sh_css_metrics.h        |    1 +
 .../staging/media/atomisp/pci/sh_css_mipi.c   |   65 +-
 .../staging/media/atomisp/pci/sh_css_mipi.h   |    9 +-
 .../staging/media/atomisp/pci/sh_css_mmu.c    |    2 +-
 .../staging/media/atomisp/pci/sh_css_morph.c  |    1 +
 .../media/atomisp/pci/sh_css_param_dvs.c      |   46 +-
 .../media/atomisp/pci/sh_css_param_dvs.h      |    1 +
 .../media/atomisp/pci/sh_css_param_shading.c  |    8 +-
 .../media/atomisp/pci/sh_css_param_shading.h  |    1 +
 .../staging/media/atomisp/pci/sh_css_params.c |  730 ++++----
 .../staging/media/atomisp/pci/sh_css_params.h |   17 +-
 .../atomisp/pci/sh_css_params_internal.h      |    1 +
 .../staging/media/atomisp/pci/sh_css_pipe.c   |    1 +
 .../media/atomisp/pci/sh_css_properties.c     |    1 +
 .../media/atomisp/pci/sh_css_shading.c        |    1 +
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  130 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.h |    1 +
 .../staging/media/atomisp/pci/sh_css_stream.c |    1 +
 .../media/atomisp/pci/sh_css_stream_format.c  |    1 +
 .../media/atomisp/pci/sh_css_stream_format.h  |    1 +
 .../staging/media/atomisp/pci/sh_css_struct.h |    6 +-
 .../staging/media/atomisp/pci/sh_css_uds.h    |    1 +
 .../media/atomisp/pci/sh_css_version.c        |    7 +-
 .../staging/media/atomisp/pci/str2mem_defs.h  |    1 +
 .../atomisp/pci/streaming_to_mipi_defs.h      |    1 +
 .../staging/media/atomisp/pci/system_global.h |    1 +
 .../staging/media/atomisp/pci/system_local.h  |    1 +
 .../media/atomisp/pci/timed_controller_defs.h |    1 +
 drivers/staging/media/atomisp/pci/version.h   |    1 +
 666 files changed, 3311 insertions(+), 3748 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/error_support.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_realloc.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/system_types.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hrt/hive_isp_css_mm_hrt.c
 delete mode 100644 drivers/staging/media/atomisp/pci/hrt/hive_isp_css_mm_hrt.h
 delete mode 100644 drivers/staging/media/atomisp/pci/ia_css_memory_access.c
 delete mode 100644 drivers/staging/media/atomisp/pci/memory_realloc.c

-- 
2.26.2


