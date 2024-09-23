Return-Path: <linux-media+bounces-18466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ACC97EA38
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 12:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A330F280D38
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 10:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1C917C60;
	Mon, 23 Sep 2024 10:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eekd+sRa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F47F195FF0;
	Mon, 23 Sep 2024 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727088982; cv=none; b=nC5EI9dTJrna39xF9r9t84UxUckQySSpv5rcDuKj6/E8TslZZT+jbrfNSYiiL+aVDNOp80ivovs6Bsahcy3LEsecepmWmPxkLywCj9UXmjMnJXROikcF8hJpli4nEmkx7oReuzrU0kIdCS6x21ZlxFoNiPKYl9pV2bC8XlkhXFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727088982; c=relaxed/simple;
	bh=/sGGpYZ1AKW/9kZWEzOrmSlFU0/b7O6nG2jyegviSrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eHszbD+YizJXVgbiHIP3URGtT+XNNoHDDKdC3Q6FenBhkhOvtmUKqGRZPMIv2t0qNlT6/PP2FpmPxXcwCpQLKgrb9LO83+acMBxVL6iRVTt+xShhk5MTJpZasmVwvQZQrfSWuQ/qK8PXnQGZ1SsVrAMNT7m5LU2CF8TXjOBQHk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eekd+sRa; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727088961; x=1758624961;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/sGGpYZ1AKW/9kZWEzOrmSlFU0/b7O6nG2jyegviSrA=;
  b=Eekd+sRaARqmc0B1DPhCh5/H6RbQ6V7j6C0NDZ6+jzGagI0SJs0QkinS
   o04HvUOwRubgWOeUqR0mMw6DYS22LNJNqhu18IrUXHsAfsAxKm/W7gG9Z
   17q4CmOhF0yDpnBmyeFcaLgYOYCFwjoRAyBF7OxtWbYxaM2RHeyRCewQx
   AGD1pRtO4QRY6/VcXVoNKbQpPy94DIzL88LtrXOtDZdpwdSUmdp8SvR5z
   0IDlmsgcycl6C3Gddg3V7IDYpMSVkIV6XGo/GBmm91JZi7WeslC+LoCQd
   ICobt1qrvWLCrYMzwSqvQlpDRXeFcZaaXF9kcxBckO/zsAb5LA8KKfFUM
   Q==;
X-CSE-ConnectionGUID: 26HO5O4SRVe2bCjcrz0QZg==
X-CSE-MsgGUID: Fq79OhNLRJOWRTB77oE7nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26221065"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="26221065"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 03:55:57 -0700
X-CSE-ConnectionGUID: 10QI7bBXR1GXoe2zJa09Og==
X-CSE-MsgGUID: 835SrLjoSPiKJQs9VbzvNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="101877432"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2024 03:55:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B29022E1; Mon, 23 Sep 2024 13:55:49 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Bergh <bergh.jonathan@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Roshan Khatri <topofeverest8848@gmail.com>,
	Dipendra Khadka <kdipendra88@gmail.com>,
	Sergio de Almeida Cipriano Junior <sergiosacj@riseup.net>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Kartik Kulkarni <kartik.koolks@gmail.com>,
	Kathara Sasikumar <katharasasikumar007@gmail.com>,
	Tchadel Icard <hello@tchadelicard.fr>,
	Kate Hsuan <hpa@redhat.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 1/1] media: atomisp: Remove License information boilerplate
Date: Mon, 23 Sep 2024 13:53:06 +0300
Message-ID: <20240923105539.3569110-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have the respective SPDX identifiers that are already being applied
to the files in question. Remove the License information boilerplate.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Here to fix one of the missed TODO item before moving from staging.
This depends on 20240923085652.3457117-1-andriy.shevchenko@linux.intel.com.
But can be applied before that (it's trivial to adjust).

 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c  | 10 ----------
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c  | 10 ----------
 .../media/atomisp/i2c/atomisp-libmsrlisthelper.c    | 11 -----------
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 11 -----------
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c  | 10 ----------
 drivers/staging/media/atomisp/i2c/gc2235.h          | 13 -------------
 drivers/staging/media/atomisp/i2c/mt9m114.h         | 11 -----------
 drivers/staging/media/atomisp/i2c/ov2722.h          | 11 -----------
 drivers/staging/media/atomisp/include/hmm/hmm.h     | 11 -----------
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h  | 11 -----------
 .../staging/media/atomisp/include/hmm/hmm_common.h  | 11 -----------
 .../staging/media/atomisp/include/linux/atomisp.h   | 11 -----------
 .../atomisp/include/linux/atomisp_gmin_platform.h   |  9 ---------
 .../media/atomisp/include/linux/atomisp_platform.h  | 11 -----------
 .../media/atomisp/include/linux/libmsrlisthelper.h  | 11 -----------
 drivers/staging/media/atomisp/include/mmu/isp_mmu.h | 11 -----------
 .../media/atomisp/include/mmu/sh_mmu_mrfld.h        | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp-regs.h    | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp_cmd.c     | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp_cmd.h     | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp_common.h  | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp_compat.h  | 11 -----------
 .../media/atomisp/pci/atomisp_compat_css20.c        |  9 ---------
 .../media/atomisp/pci/atomisp_compat_css20.h        | 11 -----------
 .../media/atomisp/pci/atomisp_compat_ioctl32.h      | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp_csi2.c    | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp_csi2.h    | 11 -----------
 .../staging/media/atomisp/pci/atomisp_dfs_tables.h  | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp_drvfs.c   | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp_drvfs.h   | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp_fops.c    | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp_fops.h    | 11 -----------
 .../staging/media/atomisp/pci/atomisp_internal.h    | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c   | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp_ioctl.h   | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp_subdev.c  | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp_subdev.h  | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp_tables.h  | 11 -----------
 .../staging/media/atomisp/pci/atomisp_trace_event.h | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c    | 11 -----------
 drivers/staging/media/atomisp/pci/atomisp_v4l2.h    | 11 -----------
 .../pci/base/circbuf/interface/ia_css_circbuf.h     |  9 ---------
 .../base/circbuf/interface/ia_css_circbuf_comm.h    |  9 ---------
 .../base/circbuf/interface/ia_css_circbuf_desc.h    |  9 ---------
 .../media/atomisp/pci/base/circbuf/src/circbuf.c    |  9 ---------
 .../pci/base/refcount/interface/ia_css_refcount.h   |  9 ---------
 .../media/atomisp/pci/base/refcount/src/refcount.c  |  9 ---------
 drivers/staging/media/atomisp/pci/bits.h            |  9 ---------
 .../camera/pipe/interface/ia_css_pipe_binarydesc.h  |  9 ---------
 .../camera/pipe/interface/ia_css_pipe_stagedesc.h   |  9 ---------
 .../pci/camera/pipe/interface/ia_css_pipe_util.h    |  9 ---------
 .../atomisp/pci/camera/pipe/src/pipe_binarydesc.c   |  9 ---------
 .../atomisp/pci/camera/pipe/src/pipe_stagedesc.c    |  9 ---------
 .../media/atomisp/pci/camera/pipe/src/pipe_util.c   |  9 ---------
 .../atomisp/pci/camera/util/interface/ia_css_util.h |  9 ---------
 .../media/atomisp/pci/camera/util/src/util.c        |  9 ---------
 drivers/staging/media/atomisp/pci/cell_params.h     |  9 ---------
 .../atomisp/pci/css_2401_system/csi_rx_global.h     |  9 ---------
 .../media/atomisp/pci/css_2401_system/host/csi_rx.c |  9 ---------
 .../atomisp/pci/css_2401_system/host/csi_rx_local.h |  9 ---------
 .../pci/css_2401_system/host/csi_rx_private.h       |  9 ---------
 .../atomisp/pci/css_2401_system/host/ibuf_ctrl.c    |  9 ---------
 .../pci/css_2401_system/host/ibuf_ctrl_local.h      |  9 ---------
 .../atomisp/pci/css_2401_system/host/isys_dma.c     |  9 ---------
 .../pci/css_2401_system/host/isys_dma_private.h     |  9 ---------
 .../atomisp/pci/css_2401_system/host/isys_irq.c     |  9 ---------
 .../pci/css_2401_system/host/isys_irq_local.h       |  9 ---------
 .../pci/css_2401_system/host/isys_irq_private.h     |  9 ---------
 .../pci/css_2401_system/host/isys_stream2mmio.c     |  9 ---------
 .../css_2401_system/host/isys_stream2mmio_local.h   |  9 ---------
 .../css_2401_system/host/isys_stream2mmio_private.h |  9 ---------
 .../pci/css_2401_system/host/pixelgen_local.h       |  9 ---------
 .../pci/css_2401_system/host/pixelgen_private.h     |  9 ---------
 .../css_2401_system/hrt/PixelGen_SysBlock_defs.h    |  9 ---------
 .../pci/css_2401_system/hrt/ibuf_cntrl_defs.h       |  9 ---------
 .../css_2401_system/hrt/mipi_backend_common_defs.h  |  9 ---------
 .../pci/css_2401_system/hrt/mipi_backend_defs.h     |  9 ---------
 .../atomisp/pci/css_2401_system/hrt/rx_csi_defs.h   |  9 ---------
 .../pci/css_2401_system/hrt/stream2mmio_defs.h      |  9 ---------
 .../atomisp/pci/css_2401_system/ibuf_ctrl_global.h  |  9 ---------
 .../atomisp/pci/css_2401_system/isys_dma_global.h   |  9 ---------
 .../atomisp/pci/css_2401_system/isys_irq_global.h   |  9 ---------
 .../pci/css_2401_system/isys_stream2mmio_global.h   |  9 ---------
 .../atomisp/pci/css_2401_system/pixelgen_global.h   |  9 ---------
 .../atomisp/pci/css_receiver_2400_common_defs.h     |  9 ---------
 .../media/atomisp/pci/css_receiver_2400_defs.h      |  9 ---------
 drivers/staging/media/atomisp/pci/css_trace.h       |  9 ---------
 drivers/staging/media/atomisp/pci/dma_v2_defs.h     |  9 ---------
 drivers/staging/media/atomisp/pci/gdc_v2_defs.h     |  9 ---------
 drivers/staging/media/atomisp/pci/gp_timer_defs.h   |  9 ---------
 drivers/staging/media/atomisp/pci/gpio_block_defs.h |  9 ---------
 .../atomisp/pci/hive_isp_css_common/debug_global.h  |  9 ---------
 .../atomisp/pci/hive_isp_css_common/dma_global.h    | 10 ----------
 .../pci/hive_isp_css_common/event_fifo_global.h     |  9 ---------
 .../pci/hive_isp_css_common/fifo_monitor_global.h   |  9 ---------
 .../atomisp/pci/hive_isp_css_common/gdc_global.h    |  9 ---------
 .../pci/hive_isp_css_common/gp_device_global.h      |  9 ---------
 .../pci/hive_isp_css_common/gp_timer_global.h       |  9 ---------
 .../atomisp/pci/hive_isp_css_common/gpio_global.h   |  9 ---------
 .../atomisp/pci/hive_isp_css_common/hmem_global.h   |  9 ---------
 .../atomisp/pci/hive_isp_css_common/host/debug.c    |  9 ---------
 .../pci/hive_isp_css_common/host/debug_local.h      |  9 ---------
 .../pci/hive_isp_css_common/host/debug_private.h    |  9 ---------
 .../atomisp/pci/hive_isp_css_common/host/dma.c      |  9 ---------
 .../pci/hive_isp_css_common/host/dma_local.h        |  9 ---------
 .../pci/hive_isp_css_common/host/dma_private.h      |  9 ---------
 .../pci/hive_isp_css_common/host/event_fifo.c       |  9 ---------
 .../pci/hive_isp_css_common/host/event_fifo_local.h |  9 ---------
 .../hive_isp_css_common/host/event_fifo_private.h   |  9 ---------
 .../pci/hive_isp_css_common/host/fifo_monitor.c     |  9 ---------
 .../hive_isp_css_common/host/fifo_monitor_local.h   |  9 ---------
 .../hive_isp_css_common/host/fifo_monitor_private.h |  9 ---------
 .../atomisp/pci/hive_isp_css_common/host/gdc.c      |  9 ---------
 .../pci/hive_isp_css_common/host/gdc_local.h        |  9 ---------
 .../pci/hive_isp_css_common/host/gdc_private.h      |  9 ---------
 .../pci/hive_isp_css_common/host/gp_device.c        |  9 ---------
 .../pci/hive_isp_css_common/host/gp_device_local.h  |  9 ---------
 .../hive_isp_css_common/host/gp_device_private.h    |  9 ---------
 .../atomisp/pci/hive_isp_css_common/host/gp_timer.c |  9 ---------
 .../pci/hive_isp_css_common/host/gp_timer_local.h   |  9 ---------
 .../pci/hive_isp_css_common/host/gp_timer_private.h |  9 ---------
 .../pci/hive_isp_css_common/host/gpio_private.h     |  9 ---------
 .../atomisp/pci/hive_isp_css_common/host/hmem.c     |  9 ---------
 .../pci/hive_isp_css_common/host/hmem_local.h       |  9 ---------
 .../pci/hive_isp_css_common/host/hmem_private.h     |  9 ---------
 .../pci/hive_isp_css_common/host/input_formatter.c  |  9 ---------
 .../host/input_formatter_local.h                    |  9 ---------
 .../host/input_formatter_private.h                  |  9 ---------
 .../pci/hive_isp_css_common/host/input_system.c     |  9 ---------
 .../atomisp/pci/hive_isp_css_common/host/irq.c      |  9 ---------
 .../pci/hive_isp_css_common/host/irq_local.h        |  9 ---------
 .../pci/hive_isp_css_common/host/irq_private.h      |  9 ---------
 .../atomisp/pci/hive_isp_css_common/host/isp.c      |  9 ---------
 .../pci/hive_isp_css_common/host/isp_local.h        |  9 ---------
 .../pci/hive_isp_css_common/host/isp_private.h      |  9 ---------
 .../atomisp/pci/hive_isp_css_common/host/mmu.c      |  9 ---------
 .../pci/hive_isp_css_common/host/mmu_local.h        |  9 ---------
 .../media/atomisp/pci/hive_isp_css_common/host/sp.c |  9 ---------
 .../atomisp/pci/hive_isp_css_common/host/sp_local.h |  9 ---------
 .../pci/hive_isp_css_common/host/sp_private.h       |  9 ---------
 .../pci/hive_isp_css_common/host/timed_ctrl.c       |  9 ---------
 .../pci/hive_isp_css_common/host/timed_ctrl_local.h |  9 ---------
 .../hive_isp_css_common/host/timed_ctrl_private.h   |  9 ---------
 .../pci/hive_isp_css_common/host/vamem_local.h      |  9 ---------
 .../atomisp/pci/hive_isp_css_common/host/vmem.c     |  9 ---------
 .../pci/hive_isp_css_common/host/vmem_local.h       |  9 ---------
 .../pci/hive_isp_css_common/host/vmem_private.h     |  9 ---------
 .../hive_isp_css_common/input_formatter_global.h    |  9 ---------
 .../atomisp/pci/hive_isp_css_common/irq_global.h    |  9 ---------
 .../atomisp/pci/hive_isp_css_common/isp_global.h    |  9 ---------
 .../atomisp/pci/hive_isp_css_common/mmu_global.h    |  9 ---------
 .../atomisp/pci/hive_isp_css_common/sp_global.h     |  9 ---------
 .../pci/hive_isp_css_common/timed_ctrl_global.h     |  9 ---------
 .../atomisp/pci/hive_isp_css_common/vamem_global.h  |  9 ---------
 .../atomisp/pci/hive_isp_css_common/vmem_global.h   |  9 ---------
 .../staging/media/atomisp/pci/hive_isp_css_defs.h   |  9 ---------
 .../pci/hive_isp_css_include/assert_support.h       |  9 ---------
 .../pci/hive_isp_css_include/bitop_support.h        |  9 ---------
 .../media/atomisp/pci/hive_isp_css_include/csi_rx.h |  9 ---------
 .../media/atomisp/pci/hive_isp_css_include/debug.h  |  9 ---------
 .../device_access/device_access.h                   |  8 --------
 .../media/atomisp/pci/hive_isp_css_include/dma.h    |  9 ---------
 .../atomisp/pci/hive_isp_css_include/event_fifo.h   |  9 ---------
 .../atomisp/pci/hive_isp_css_include/fifo_monitor.h |  9 ---------
 .../atomisp/pci/hive_isp_css_include/gdc_device.h   |  9 ---------
 .../atomisp/pci/hive_isp_css_include/gp_device.h    |  9 ---------
 .../atomisp/pci/hive_isp_css_include/gp_timer.h     |  9 ---------
 .../media/atomisp/pci/hive_isp_css_include/hmem.h   |  9 ---------
 .../pci/hive_isp_css_include/host/csi_rx_public.h   |  9 ---------
 .../pci/hive_isp_css_include/host/debug_public.h    |  9 ---------
 .../pci/hive_isp_css_include/host/dma_public.h      |  9 ---------
 .../hive_isp_css_include/host/event_fifo_public.h   |  9 ---------
 .../hive_isp_css_include/host/fifo_monitor_public.h |  9 ---------
 .../pci/hive_isp_css_include/host/gdc_public.h      |  9 ---------
 .../hive_isp_css_include/host/gp_device_public.h    |  9 ---------
 .../pci/hive_isp_css_include/host/gp_timer_public.h |  9 ---------
 .../pci/hive_isp_css_include/host/hmem_public.h     |  9 ---------
 .../host/input_formatter_public.h                   |  9 ---------
 .../pci/hive_isp_css_include/host/irq_public.h      |  9 ---------
 .../pci/hive_isp_css_include/host/isp_public.h      |  9 ---------
 .../pci/hive_isp_css_include/host/isys_dma_public.h |  9 ---------
 .../pci/hive_isp_css_include/host/isys_irq_public.h |  9 ---------
 .../host/isys_stream2mmio_public.h                  |  9 ---------
 .../pci/hive_isp_css_include/host/mmu_public.h      |  9 ---------
 .../pci/hive_isp_css_include/host/pixelgen_public.h |  9 ---------
 .../pci/hive_isp_css_include/host/sp_public.h       |  9 ---------
 .../pci/hive_isp_css_include/host/tag_public.h      |  9 ---------
 .../hive_isp_css_include/host/timed_ctrl_public.h   |  9 ---------
 .../pci/hive_isp_css_include/host/vamem_public.h    |  9 ---------
 .../pci/hive_isp_css_include/host/vmem_public.h     |  9 ---------
 .../pci/hive_isp_css_include/input_formatter.h      |  9 ---------
 .../atomisp/pci/hive_isp_css_include/input_system.h |  9 ---------
 .../media/atomisp/pci/hive_isp_css_include/irq.h    |  9 ---------
 .../media/atomisp/pci/hive_isp_css_include/isp.h    |  9 ---------
 .../atomisp/pci/hive_isp_css_include/isys_irq.h     |  9 ---------
 .../pci/hive_isp_css_include/isys_stream2mmio.h     |  9 ---------
 .../atomisp/pci/hive_isp_css_include/math_support.h |  9 ---------
 .../atomisp/pci/hive_isp_css_include/misc_support.h |  9 ---------
 .../atomisp/pci/hive_isp_css_include/mmu_device.h   |  9 ---------
 .../atomisp/pci/hive_isp_css_include/pixelgen.h     |  9 ---------
 .../pci/hive_isp_css_include/platform_support.h     |  9 ---------
 .../pci/hive_isp_css_include/print_support.h        |  9 ---------
 .../media/atomisp/pci/hive_isp_css_include/queue.h  |  9 ---------
 .../atomisp/pci/hive_isp_css_include/resource.h     |  9 ---------
 .../media/atomisp/pci/hive_isp_css_include/sp.h     |  9 ---------
 .../media/atomisp/pci/hive_isp_css_include/tag.h    |  9 ---------
 .../atomisp/pci/hive_isp_css_include/timed_ctrl.h   |  9 ---------
 .../atomisp/pci/hive_isp_css_include/type_support.h |  9 ---------
 .../media/atomisp/pci/hive_isp_css_include/vamem.h  |  9 ---------
 .../media/atomisp/pci/hive_isp_css_include/vmem.h   |  9 ---------
 .../pci/hive_isp_css_shared/host/queue_local.h      |  9 ---------
 .../pci/hive_isp_css_shared/host/queue_private.h    |  9 ---------
 .../atomisp/pci/hive_isp_css_shared/host/tag.c      |  9 ---------
 .../pci/hive_isp_css_shared/host/tag_local.h        |  9 ---------
 .../pci/hive_isp_css_shared/host/tag_private.h      |  9 ---------
 .../atomisp/pci/hive_isp_css_shared/queue_global.h  |  9 ---------
 .../pci/hive_isp_css_shared/sw_event_global.h       |  9 ---------
 .../atomisp/pci/hive_isp_css_shared/tag_global.h    |  9 ---------
 .../pci/hive_isp_css_streaming_to_mipi_types_hrt.h  |  9 ---------
 drivers/staging/media/atomisp/pci/hive_types.h      |  9 ---------
 drivers/staging/media/atomisp/pci/hmm/hmm.c         | 11 -----------
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c      | 11 -----------
 drivers/staging/media/atomisp/pci/ia_css.h          |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_3a.h       |  9 ---------
 .../staging/media/atomisp/pci/ia_css_acc_types.h    |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_buffer.h   |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_control.h  |  9 ---------
 .../media/atomisp/pci/ia_css_device_access.c        |  9 ---------
 .../media/atomisp/pci/ia_css_device_access.h        |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_dvs.h      |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_env.h      |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_err.h      |  9 ---------
 .../staging/media/atomisp/pci/ia_css_event_public.h |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_firmware.h |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_frac.h     |  9 ---------
 .../staging/media/atomisp/pci/ia_css_frame_format.h |  9 ---------
 .../staging/media/atomisp/pci/ia_css_frame_public.h |  9 ---------
 .../staging/media/atomisp/pci/ia_css_host_data.h    |  9 ---------
 .../staging/media/atomisp/pci/ia_css_input_port.h   |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_irq.h      |  9 ---------
 .../staging/media/atomisp/pci/ia_css_isp_configs.c  |  9 ---------
 .../staging/media/atomisp/pci/ia_css_isp_configs.h  |  9 ---------
 .../staging/media/atomisp/pci/ia_css_isp_params.c   |  9 ---------
 .../staging/media/atomisp/pci/ia_css_isp_params.h   |  9 ---------
 .../staging/media/atomisp/pci/ia_css_isp_states.c   |  9 ---------
 .../staging/media/atomisp/pci/ia_css_isp_states.h   |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_metadata.h |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_mipi.h     |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_mmu.h      |  9 ---------
 .../staging/media/atomisp/pci/ia_css_mmu_private.h  |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_morph.h    |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_pipe.h     |  9 ---------
 .../staging/media/atomisp/pci/ia_css_pipe_public.h  |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_prbs.h     |  9 ---------
 .../staging/media/atomisp/pci/ia_css_properties.h   |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_shading.h  |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_stream.h   |  9 ---------
 .../media/atomisp/pci/ia_css_stream_format.h        |  9 ---------
 .../media/atomisp/pci/ia_css_stream_public.h        |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_timer.h    |  8 --------
 drivers/staging/media/atomisp/pci/ia_css_types.h    |  9 ---------
 drivers/staging/media/atomisp/pci/ia_css_version.h  |  9 ---------
 .../staging/media/atomisp/pci/ia_css_version_data.h |  9 ---------
 drivers/staging/media/atomisp/pci/if_defs.h         |  9 ---------
 .../atomisp/pci/input_formatter_subsystem_defs.h    |  9 ---------
 .../staging/media/atomisp/pci/input_selector_defs.h |  9 ---------
 .../media/atomisp/pci/input_switch_2400_defs.h      |  9 ---------
 .../media/atomisp/pci/input_system_ctrl_defs.h      |  9 ---------
 .../staging/media/atomisp/pci/input_system_defs.h   |  9 ---------
 .../staging/media/atomisp/pci/irq_controller_defs.h |  9 ---------
 drivers/staging/media/atomisp/pci/irq_types_hrt.h   |  9 ---------
 .../pci/isp/kernels/aa/aa_2/ia_css_aa2.host.c       |  9 ---------
 .../pci/isp/kernels/aa/aa_2/ia_css_aa2.host.h       |  9 ---------
 .../pci/isp/kernels/aa/aa_2/ia_css_aa2_param.h      |  9 ---------
 .../pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h      |  9 ---------
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c   |  9 ---------
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h   |  9 ---------
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr_param.h  |  9 ---------
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h  |  9 ---------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c    |  9 ---------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h    |  9 ---------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2_param.h   |  9 ---------
 .../isp/kernels/anr/anr_2/ia_css_anr2_table.host.c  |  9 ---------
 .../isp/kernels/anr/anr_2/ia_css_anr2_table.host.h  |  9 ---------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2_types.h   |  9 ---------
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.c        |  9 ---------
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.h        |  9 ---------
 .../pci/isp/kernels/bh/bh_2/ia_css_bh_param.h       |  9 ---------
 .../pci/isp/kernels/bh/bh_2/ia_css_bh_types.h       |  9 ---------
 .../atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c |  9 ---------
 .../atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.h |  9 ---------
 .../pci/isp/kernels/bnlm/ia_css_bnlm_param.h        |  9 ---------
 .../pci/isp/kernels/bnlm/ia_css_bnlm_types.h        |  9 ---------
 .../pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2.host.c |  9 ---------
 .../pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2.host.h |  9 ---------
 .../isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_param.h    |  9 ---------
 .../isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h    |  9 ---------
 .../pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c   |  9 ---------
 .../pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.h   |  9 ---------
 .../pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr_param.h  |  9 ---------
 .../pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c   |  9 ---------
 .../pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.h   |  9 ---------
 .../pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr_param.h  |  9 ---------
 .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.host.c    |  9 ---------
 .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.host.h    |  9 ---------
 .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_param.h   |  9 ---------
 .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_types.h   |  9 ---------
 .../conversion_1.0/ia_css_conversion.host.c         |  9 ---------
 .../conversion_1.0/ia_css_conversion.host.h         |  9 ---------
 .../conversion_1.0/ia_css_conversion_param.h        |  9 ---------
 .../conversion_1.0/ia_css_conversion_types.h        |  9 ---------
 .../copy_output_1.0/ia_css_copy_output.host.c       |  9 ---------
 .../copy_output_1.0/ia_css_copy_output.host.h       |  9 ---------
 .../copy_output_1.0/ia_css_copy_output_param.h      |  9 ---------
 .../isp/kernels/crop/crop_1.0/ia_css_crop.host.c    |  9 ---------
 .../isp/kernels/crop/crop_1.0/ia_css_crop.host.h    |  9 ---------
 .../isp/kernels/crop/crop_1.0/ia_css_crop_param.h   |  9 ---------
 .../isp/kernels/crop/crop_1.0/ia_css_crop_types.h   |  9 ---------
 .../pci/isp/kernels/csc/csc_1.0/ia_css_csc.host.c   |  9 ---------
 .../pci/isp/kernels/csc/csc_1.0/ia_css_csc.host.h   |  9 ---------
 .../pci/isp/kernels/csc/csc_1.0/ia_css_csc_param.h  |  9 ---------
 .../pci/isp/kernels/csc/csc_1.0/ia_css_csc_types.h  |  9 ---------
 .../pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c |  9 ---------
 .../pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.h |  9 ---------
 .../isp/kernels/ctc/ctc1_5/ia_css_ctc1_5_param.h    |  9 ---------
 .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c     |  9 ---------
 .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.h     |  9 ---------
 .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2_param.h    |  9 ---------
 .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h    |  9 ---------
 .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.c   |  9 ---------
 .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.h   |  9 ---------
 .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_param.h  |  9 ---------
 .../isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.c |  9 ---------
 .../isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.h |  9 ---------
 .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_types.h  |  9 ---------
 .../pci/isp/kernels/de/de_1.0/ia_css_de.host.c      |  9 ---------
 .../pci/isp/kernels/de/de_1.0/ia_css_de.host.h      |  9 ---------
 .../pci/isp/kernels/de/de_1.0/ia_css_de_param.h     |  9 ---------
 .../pci/isp/kernels/de/de_1.0/ia_css_de_types.h     |  9 ---------
 .../pci/isp/kernels/de/de_2/ia_css_de2.host.c       |  9 ---------
 .../pci/isp/kernels/de/de_2/ia_css_de2.host.h       |  9 ---------
 .../pci/isp/kernels/de/de_2/ia_css_de2_param.h      |  9 ---------
 .../pci/isp/kernels/de/de_2/ia_css_de2_types.h      |  9 ---------
 .../pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c      |  9 ---------
 .../pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.h      |  9 ---------
 .../pci/isp/kernels/dp/dp_1.0/ia_css_dp_param.h     |  9 ---------
 .../pci/isp/kernels/dp/dp_1.0/ia_css_dp_types.h     |  9 ---------
 .../atomisp/pci/isp/kernels/dpc2/ia_css_dpc2.host.c |  9 ---------
 .../atomisp/pci/isp/kernels/dpc2/ia_css_dpc2.host.h |  9 ---------
 .../pci/isp/kernels/dpc2/ia_css_dpc2_param.h        |  9 ---------
 .../pci/isp/kernels/dpc2/ia_css_dpc2_types.h        |  9 ---------
 .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c   |  9 ---------
 .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h   |  9 ---------
 .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_param.h  |  9 ---------
 .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_types.h  |  9 ---------
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c     |  9 ---------
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8.host.h     |  9 ---------
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h    |  9 ---------
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h    |  9 ---------
 .../pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c |  9 ---------
 .../pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.h |  9 ---------
 .../isp/kernels/fc/fc_1.0/ia_css_formats_param.h    |  9 ---------
 .../isp/kernels/fc/fc_1.0/ia_css_formats_types.h    |  9 ---------
 .../fixedbds/fixedbds_1.0/ia_css_fixedbds_param.h   |  9 ---------
 .../fixedbds/fixedbds_1.0/ia_css_fixedbds_types.h   |  9 ---------
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c   |  9 ---------
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h   |  9 ---------
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_param.h  |  9 ---------
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_types.h  |  9 ---------
 .../pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c      |  9 ---------
 .../pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.h      |  9 ---------
 .../pci/isp/kernels/gc/gc_1.0/ia_css_gc_param.h     |  9 ---------
 .../isp/kernels/gc/gc_1.0/ia_css_gc_table.host.c    |  9 ---------
 .../isp/kernels/gc/gc_1.0/ia_css_gc_table.host.h    |  9 ---------
 .../pci/isp/kernels/gc/gc_1.0/ia_css_gc_types.h     |  9 ---------
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2.host.c       |  9 ---------
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2.host.h       |  9 ---------
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2_param.h      |  9 ---------
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.c |  9 ---------
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.h |  9 ---------
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2_types.h      |  9 ---------
 .../atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.c   |  9 ---------
 .../atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.h   |  9 ---------
 .../atomisp/pci/isp/kernels/hdr/ia_css_hdr_param.h  |  9 ---------
 .../atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h  |  9 ---------
 .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c   |  9 ---------
 .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.h   |  9 ---------
 .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io_param.h  |  9 ---------
 .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io_types.h  |  9 ---------
 .../ipu2_io_ls/common/ia_css_common_io_param.h      |  8 --------
 .../ipu2_io_ls/common/ia_css_common_io_types.h      |  8 --------
 .../ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c |  8 --------
 .../ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.h |  8 --------
 .../yuv444_io_ls/ia_css_yuv444_io_param.h           |  8 --------
 .../yuv444_io_ls/ia_css_yuv444_io_types.h           |  8 --------
 .../iterator/iterator_1.0/ia_css_iterator.host.c    |  9 ---------
 .../iterator/iterator_1.0/ia_css_iterator.host.h    |  9 ---------
 .../iterator/iterator_1.0/ia_css_iterator_param.h   |  9 ---------
 .../isp/kernels/macc/macc1_5/ia_css_macc1_5.host.c  |  9 ---------
 .../isp/kernels/macc/macc1_5/ia_css_macc1_5.host.h  |  9 ---------
 .../isp/kernels/macc/macc1_5/ia_css_macc1_5_param.h |  9 ---------
 .../macc/macc1_5/ia_css_macc1_5_table.host.c        |  9 ---------
 .../macc/macc1_5/ia_css_macc1_5_table.host.h        |  9 ---------
 .../isp/kernels/macc/macc1_5/ia_css_macc1_5_types.h |  9 ---------
 .../isp/kernels/macc/macc_1.0/ia_css_macc.host.c    |  9 ---------
 .../isp/kernels/macc/macc_1.0/ia_css_macc.host.h    |  9 ---------
 .../isp/kernels/macc/macc_1.0/ia_css_macc_param.h   |  9 ---------
 .../kernels/macc/macc_1.0/ia_css_macc_table.host.c  |  9 ---------
 .../kernels/macc/macc_1.0/ia_css_macc_table.host.h  |  9 ---------
 .../isp/kernels/macc/macc_1.0/ia_css_macc_types.h   |  9 ---------
 .../isp/kernels/norm/norm_1.0/ia_css_norm.host.c    |  9 ---------
 .../isp/kernels/norm/norm_1.0/ia_css_norm.host.h    |  9 ---------
 .../isp/kernels/norm/norm_1.0/ia_css_norm_param.h   |  9 ---------
 .../pci/isp/kernels/ob/ob2/ia_css_ob2.host.c        |  9 ---------
 .../pci/isp/kernels/ob/ob2/ia_css_ob2.host.h        |  9 ---------
 .../pci/isp/kernels/ob/ob2/ia_css_ob2_param.h       |  9 ---------
 .../pci/isp/kernels/ob/ob2/ia_css_ob2_types.h       |  9 ---------
 .../pci/isp/kernels/ob/ob_1.0/ia_css_ob.host.c      |  9 ---------
 .../pci/isp/kernels/ob/ob_1.0/ia_css_ob.host.h      |  9 ---------
 .../pci/isp/kernels/ob/ob_1.0/ia_css_ob_param.h     |  9 ---------
 .../pci/isp/kernels/ob/ob_1.0/ia_css_ob_types.h     |  9 ---------
 .../kernels/output/output_1.0/ia_css_output.host.c  |  9 ---------
 .../kernels/output/output_1.0/ia_css_output.host.h  |  9 ---------
 .../kernels/output/output_1.0/ia_css_output_param.h |  9 ---------
 .../kernels/output/output_1.0/ia_css_output_types.h |  9 ---------
 .../kernels/qplane/qplane_2/ia_css_qplane.host.c    |  9 ---------
 .../kernels/qplane/qplane_2/ia_css_qplane.host.h    |  9 ---------
 .../kernels/qplane/qplane_2/ia_css_qplane_param.h   |  9 ---------
 .../kernels/qplane/qplane_2/ia_css_qplane_types.h   |  9 ---------
 .../pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c   |  9 ---------
 .../pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.h   |  9 ---------
 .../pci/isp/kernels/raw/raw_1.0/ia_css_raw_param.h  |  9 ---------
 .../pci/isp/kernels/raw/raw_1.0/ia_css_raw_types.h  |  9 ---------
 .../raw_aa_binning_1.0/ia_css_raa.host.c            |  9 ---------
 .../raw_aa_binning_1.0/ia_css_raa.host.h            |  9 ---------
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c   |  9 ---------
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.h   |  9 ---------
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref_param.h  |  9 ---------
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref_state.h  |  9 ---------
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref_types.h  |  9 ---------
 .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c   |  9 ---------
 .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.h   |  9 ---------
 .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_param.h  |  9 ---------
 .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h  |  9 ---------
 .../pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.c      |  9 ---------
 .../pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.h      |  9 ---------
 .../pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h     |  9 ---------
 .../pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h     |  9 ---------
 .../kernels/sdis/common/ia_css_sdis_common.host.h   |  9 ---------
 .../kernels/sdis/common/ia_css_sdis_common_types.h  |  9 ---------
 .../isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c    |  9 ---------
 .../isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.h    |  9 ---------
 .../isp/kernels/sdis/sdis_1.0/ia_css_sdis_types.h   |  9 ---------
 .../pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c |  9 ---------
 .../pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.h |  9 ---------
 .../isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h    |  9 ---------
 .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.c   |  9 ---------
 .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.h   |  9 ---------
 .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_param.h  |  9 ---------
 .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_types.h  |  9 ---------
 .../pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h    |  8 --------
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c   |  9 ---------
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h   |  9 ---------
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_param.h  |  9 ---------
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_state.h  |  9 ---------
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_types.h  |  9 ---------
 .../pci/isp/kernels/uds/uds_1.0/ia_css_uds_param.h  |  9 ---------
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c      |  9 ---------
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.h      |  9 ---------
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf_param.h     |  9 ---------
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf_types.h     |  9 ---------
 .../pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c      |  9 ---------
 .../pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.h      |  9 ---------
 .../pci/isp/kernels/wb/wb_1.0/ia_css_wb_param.h     |  9 ---------
 .../pci/isp/kernels/wb/wb_1.0/ia_css_wb_types.h     |  9 ---------
 .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c   |  9 ---------
 .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.h   |  9 ---------
 .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_param.h  |  9 ---------
 .../isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.c |  9 ---------
 .../isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.h |  9 ---------
 .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_types.h  |  9 ---------
 .../pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c  |  9 ---------
 .../pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.h  |  9 ---------
 .../pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_param.h |  9 ---------
 .../pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h |  9 ---------
 .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c   |  9 ---------
 .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.h   |  9 ---------
 .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_param.h  |  9 ---------
 .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_types.h  |  9 ---------
 .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.c    |  9 ---------
 .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.h    |  9 ---------
 .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_param.h   |  9 ---------
 .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_types.h   |  9 ---------
 .../atomisp/pci/isp/modes/interface/input_buf.isp.h |  8 --------
 .../atomisp/pci/isp/modes/interface/isp_const.h     |  8 --------
 .../atomisp/pci/isp/modes/interface/isp_types.h     |  9 ---------
 .../media/atomisp/pci/isp2400_input_system_global.h |  9 ---------
 .../media/atomisp/pci/isp2400_input_system_local.h  |  9 ---------
 .../atomisp/pci/isp2400_input_system_private.h      |  9 ---------
 .../media/atomisp/pci/isp2400_input_system_public.h |  9 ---------
 drivers/staging/media/atomisp/pci/isp2400_support.h |  9 ---------
 .../media/atomisp/pci/isp2401_input_system_global.h |  9 ---------
 .../media/atomisp/pci/isp2401_input_system_local.h  |  9 ---------
 .../atomisp/pci/isp2401_input_system_private.h      |  9 ---------
 .../media/atomisp/pci/isp_acquisition_defs.h        |  9 ---------
 .../staging/media/atomisp/pci/isp_capture_defs.h    |  9 ---------
 drivers/staging/media/atomisp/pci/mamoiada_params.h |  9 ---------
 drivers/staging/media/atomisp/pci/mmu/isp_mmu.c     | 11 -----------
 .../staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c    | 11 -----------
 drivers/staging/media/atomisp/pci/mmu_defs.h        |  9 ---------
 .../pci/runtime/binary/interface/ia_css_binary.h    |  9 ---------
 .../media/atomisp/pci/runtime/binary/src/binary.c   |  9 ---------
 .../pci/runtime/bufq/interface/ia_css_bufq.h        |  9 ---------
 .../pci/runtime/bufq/interface/ia_css_bufq_comm.h   |  9 ---------
 .../media/atomisp/pci/runtime/bufq/src/bufq.c       |  9 ---------
 .../pci/runtime/debug/interface/ia_css_debug.h      |  9 ---------
 .../runtime/debug/interface/ia_css_debug_internal.h |  9 ---------
 .../pci/runtime/debug/interface/ia_css_debug_pipe.h |  9 ---------
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c    |  9 ---------
 .../pci/runtime/event/interface/ia_css_event.h      |  9 ---------
 .../media/atomisp/pci/runtime/event/src/event.c     |  9 ---------
 .../pci/runtime/eventq/interface/ia_css_eventq.h    |  9 ---------
 .../media/atomisp/pci/runtime/eventq/src/eventq.c   |  9 ---------
 .../pci/runtime/frame/interface/ia_css_frame.h      |  9 ---------
 .../pci/runtime/frame/interface/ia_css_frame_comm.h |  9 ---------
 .../media/atomisp/pci/runtime/frame/src/frame.c     |  9 ---------
 .../pci/runtime/ifmtr/interface/ia_css_ifmtr.h      |  9 ---------
 .../media/atomisp/pci/runtime/ifmtr/src/ifmtr.c     |  9 ---------
 .../runtime/inputfifo/interface/ia_css_inputfifo.h  |  9 ---------
 .../atomisp/pci/runtime/inputfifo/src/inputfifo.c   |  9 ---------
 .../runtime/isp_param/interface/ia_css_isp_param.h  |  9 ---------
 .../isp_param/interface/ia_css_isp_param_types.h    |  8 --------
 .../atomisp/pci/runtime/isp_param/src/isp_param.c   |  9 ---------
 .../pci/runtime/isys/interface/ia_css_isys.h        |  9 ---------
 .../pci/runtime/isys/interface/ia_css_isys_comm.h   |  9 ---------
 .../atomisp/pci/runtime/isys/src/csi_rx_rmgr.c      |  9 ---------
 .../atomisp/pci/runtime/isys/src/csi_rx_rmgr.h      |  9 ---------
 .../atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c   |  9 ---------
 .../atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.h   |  9 ---------
 .../atomisp/pci/runtime/isys/src/isys_dma_rmgr.c    |  9 ---------
 .../atomisp/pci/runtime/isys/src/isys_dma_rmgr.h    |  9 ---------
 .../media/atomisp/pci/runtime/isys/src/isys_init.c  |  9 ---------
 .../pci/runtime/isys/src/isys_stream2mmio_rmgr.c    |  9 ---------
 .../pci/runtime/isys/src/isys_stream2mmio_rmgr.h    |  9 ---------
 .../staging/media/atomisp/pci/runtime/isys/src/rx.c |  9 ---------
 .../atomisp/pci/runtime/isys/src/virtual_isys.c     |  9 ---------
 .../atomisp/pci/runtime/isys/src/virtual_isys.h     |  9 ---------
 .../runtime/pipeline/interface/ia_css_pipeline.h    |  9 ---------
 .../pipeline/interface/ia_css_pipeline_common.h     |  9 ---------
 .../atomisp/pci/runtime/pipeline/src/pipeline.c     |  9 ---------
 .../pci/runtime/queue/interface/ia_css_queue.h      |  9 ---------
 .../pci/runtime/queue/interface/ia_css_queue_comm.h |  9 ---------
 .../media/atomisp/pci/runtime/queue/src/queue.c     |  9 ---------
 .../atomisp/pci/runtime/queue/src/queue_access.c    |  9 ---------
 .../atomisp/pci/runtime/queue/src/queue_access.h    |  9 ---------
 .../pci/runtime/rmgr/interface/ia_css_rmgr.h        |  9 ---------
 .../pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h   |  9 ---------
 .../media/atomisp/pci/runtime/rmgr/src/rmgr.c       |  9 ---------
 .../media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  |  9 ---------
 .../pci/runtime/spctrl/interface/ia_css_spctrl.h    |  9 ---------
 .../runtime/spctrl/interface/ia_css_spctrl_comm.h   |  9 ---------
 .../media/atomisp/pci/runtime/spctrl/src/spctrl.c   |  9 ---------
 .../runtime/tagger/interface/ia_css_tagger_common.h |  9 ---------
 .../media/atomisp/pci/runtime/timer/src/timer.c     |  9 ---------
 .../atomisp/pci/scalar_processor_2400_params.h      |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css.c          |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_defs.h     |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_firmware.c |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_firmware.h |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_frac.h     |  9 ---------
 .../staging/media/atomisp/pci/sh_css_host_data.c    |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_hrt.c      |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_hrt.h      |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_internal.h |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_legacy.h   |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_metrics.c  |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_metrics.h  |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_mipi.c     |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_mipi.h     |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_mmu.c      |  9 ---------
 .../staging/media/atomisp/pci/sh_css_param_dvs.c    |  9 ---------
 .../staging/media/atomisp/pci/sh_css_param_dvs.h    |  9 ---------
 .../media/atomisp/pci/sh_css_param_shading.c        |  9 ---------
 .../media/atomisp/pci/sh_css_param_shading.h        |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_params.c   |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_params.h   |  9 ---------
 .../media/atomisp/pci/sh_css_params_internal.h      |  9 ---------
 .../staging/media/atomisp/pci/sh_css_properties.c   |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_sp.c       |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_sp.h       |  9 ---------
 .../media/atomisp/pci/sh_css_stream_format.c        |  9 ---------
 .../media/atomisp/pci/sh_css_stream_format.h        |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_struct.h   |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_uds.h      |  9 ---------
 drivers/staging/media/atomisp/pci/sh_css_version.c  |  9 ---------
 drivers/staging/media/atomisp/pci/str2mem_defs.h    |  9 ---------
 .../media/atomisp/pci/streaming_to_mipi_defs.h      |  9 ---------
 drivers/staging/media/atomisp/pci/system_local.c    |  9 ---------
 drivers/staging/media/atomisp/pci/system_local.h    |  9 ---------
 .../media/atomisp/pci/timed_controller_defs.h       |  9 ---------
 drivers/staging/media/atomisp/pci/version.h         |  9 ---------
 601 files changed, 5483 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 5bcd634a2a44..d35394f1ddbb 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -4,16 +4,6 @@
  *
  * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
  * Copyright (c) 2023 Hans de Goede <hdegoede@redhat.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
  */
 
 #include <linux/delay.h>
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 994b8bceb4f5..857d7175942c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -3,16 +3,6 @@
  * Support for GalaxyCore GC2235 2M camera sensor.
  *
  * Copyright (c) 2014 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
  */
 
 #include <linux/module.h>
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
index 3499353f8ea5..bd0b8032229c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
@@ -1,17 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 #include <linux/i2c.h>
 #include <linux/firmware.h>
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 918ea4fa9f6b..6e72038c3dd8 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -3,17 +3,6 @@
  * Support for mt9m114 Camera Sensor.
  *
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #include <linux/module.h>
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index c31a81d64950..c7de7800799a 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -3,16 +3,6 @@
  * Support for OmniVision OV2722 1080p HD camera sensor.
  *
  * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
  */
 
 #include <linux/module.h>
diff --git a/drivers/staging/media/atomisp/i2c/gc2235.h b/drivers/staging/media/atomisp/i2c/gc2235.h
index ade28950db73..6c743a17f198 100644
--- a/drivers/staging/media/atomisp/i2c/gc2235.h
+++ b/drivers/staging/media/atomisp/i2c/gc2235.h
@@ -3,19 +3,6 @@
  * Support for GalaxyCore GC2235 2M camera sensor.
  *
  * Copyright (c) 2014 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.
- *
  */
 
 #ifndef __GC2235_H__
diff --git a/drivers/staging/media/atomisp/i2c/mt9m114.h b/drivers/staging/media/atomisp/i2c/mt9m114.h
index b0cd1b724394..97820db90827 100644
--- a/drivers/staging/media/atomisp/i2c/mt9m114.h
+++ b/drivers/staging/media/atomisp/i2c/mt9m114.h
@@ -3,17 +3,6 @@
  * Support for mt9m114 Camera Sensor.
  *
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #ifndef __A1040_H__
diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
index 5920a4d45d06..bc36133f3722 100644
--- a/drivers/staging/media/atomisp/i2c/ov2722.h
+++ b/drivers/staging/media/atomisp/i2c/ov2722.h
@@ -3,17 +3,6 @@
  * Support for OmniVision OV2722 1080p HD camera sensor.
  *
  * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #ifndef __OV2722_H__
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index 2bc323b34f89..a7aef27f54de 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -5,17 +5,6 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #ifndef	__HMM_H__
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index b4c03e0ca9c0..4be1dd310190 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -5,17 +5,6 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #ifndef	__HMM_BO_H__
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_common.h b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
index d8610b135de0..b251e96cc19d 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_common.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
@@ -5,17 +5,6 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #ifndef	__HMM_BO_COMMON_H__
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 4cfe9a0e0d56..3c8fa3f5808d 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -3,17 +3,6 @@
  * Support for Medifield PNW Camera Imaging ISP subsystem.
  *
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #ifndef _ATOM_ISP_H
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
index ecd82220f04a..426c5ee4ec18 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
@@ -3,15 +3,6 @@
  * Support for Intel MID SoC Camera Imaging ISP subsystem.
  *
  * Copyright (c) 2014 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 #ifndef ATOMISP_GMIN_PLATFORM_H_
 #define ATOMISP_GMIN_PLATFORM_H_
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 064449fd51af..049246774ced 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -3,17 +3,6 @@
  * Support for Medifield PNW Camera Imaging ISP subsystem.
  *
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 #ifndef ATOMISP_PLATFORM_H_
 #define ATOMISP_PLATFORM_H_
diff --git a/drivers/staging/media/atomisp/include/linux/libmsrlisthelper.h b/drivers/staging/media/atomisp/include/linux/libmsrlisthelper.h
index abc8fa809bce..d3bfa3db11d7 100644
--- a/drivers/staging/media/atomisp/include/linux/libmsrlisthelper.h
+++ b/drivers/staging/media/atomisp/include/linux/libmsrlisthelper.h
@@ -1,17 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 #ifndef __LIBMSRLISTHELPER_H__
 #define __LIBMSRLISTHELPER_H__
diff --git a/drivers/staging/media/atomisp/include/mmu/isp_mmu.h b/drivers/staging/media/atomisp/include/mmu/isp_mmu.h
index 268560954792..ee9839b080a6 100644
--- a/drivers/staging/media/atomisp/include/mmu/isp_mmu.h
+++ b/drivers/staging/media/atomisp/include/mmu/isp_mmu.h
@@ -5,17 +5,6 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 /*
  * ISP MMU driver for classic two-level page tables
diff --git a/drivers/staging/media/atomisp/include/mmu/sh_mmu_mrfld.h b/drivers/staging/media/atomisp/include/mmu/sh_mmu_mrfld.h
index 84fe7a368c14..bdec30ff8309 100644
--- a/drivers/staging/media/atomisp/include/mmu/sh_mmu_mrfld.h
+++ b/drivers/staging/media/atomisp/include/mmu/sh_mmu_mrfld.h
@@ -5,17 +5,6 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #ifndef	__SH_MMU_MRFLD_H__
diff --git a/drivers/staging/media/atomisp/pci/atomisp-regs.h b/drivers/staging/media/atomisp/pci/atomisp-regs.h
index a7b0196686be..15e61098a675 100644
--- a/drivers/staging/media/atomisp/pci/atomisp-regs.h
+++ b/drivers/staging/media/atomisp/pci/atomisp-regs.h
@@ -3,17 +3,6 @@
  * Support for Medifield PNW Camera Imaging ISP subsystem.
  *
  * Copyright (c) 2012 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #ifndef ATOMISP_REGS_H
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 102d39a45c9c..02ccf80e6559 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -5,17 +5,6 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 #include <linux/errno.h>
 #include <linux/firmware.h>
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index e69ca14645b9..82199dc9284e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -5,17 +5,6 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #ifndef	__ATOMISP_CMD_H__
diff --git a/drivers/staging/media/atomisp/pci/atomisp_common.h b/drivers/staging/media/atomisp/pci/atomisp_common.h
index 2d0a77df6c88..a2462fc306fb 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_common.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_common.h
@@ -5,17 +5,6 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #ifndef	__ATOMISP_COMMON_H__
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index e9e4bfb0f5f9..f0704a7e3bff 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -3,17 +3,6 @@
  * Support for Clovertrail PNW Camera Imaging ISP subsystem.
  *
  * Copyright (c) 2012 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #ifndef __ATOMISP_COMPAT_H__
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index cbd57b52e7ea..e20eb35672a9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -3,15 +3,6 @@
  * Support for Clovertrail PNW Camera Imaging ISP subsystem.
  *
  * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/io.h>
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
index e0601534380f..75781807544a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
@@ -3,17 +3,6 @@
  * Support for Clovertrail PNW Camera Imaging ISP subsystem.
  *
  * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #ifndef __ATOMISP_COMPAT_CSS20_H__
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h
index 762520ed87a5..23d798f3085c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h
@@ -3,17 +3,6 @@
  * Support for Intel Camera Imaging ISP subsystem.
  *
  * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 #ifndef __ATOMISP_COMPAT_IOCTL32_H__
 #define __ATOMISP_COMPAT_IOCTL32_H__
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 9288910eeb6c..28afc0bfc43b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -3,17 +3,6 @@
  * Support for Medifield PNW Camera Imaging ISP subsystem.
  *
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #include <media/v4l2-event.h>
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.h b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
index 8a112acba1e0..bb998c82a438 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
@@ -3,17 +3,6 @@
  * Support for Medifield PNW Camera Imaging ISP subsystem.
  *
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 #ifndef __ATOMISP_CSI2_H__
 #define __ATOMISP_CSI2_H__
diff --git a/drivers/staging/media/atomisp/pci/atomisp_dfs_tables.h b/drivers/staging/media/atomisp/pci/atomisp_dfs_tables.h
index 8f1cc3fca13a..03d7c08b67e6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_dfs_tables.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_dfs_tables.h
@@ -3,17 +3,6 @@
  * Support for Intel Camera Imaging ISP subsystem.
  *
  * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 #ifndef	__ATOMISP_DFS_TABLES_H__
 #define	__ATOMISP_DFS_TABLES_H__
diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
index ba7dd569a55a..31c82c3c0d33 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
@@ -3,17 +3,6 @@
  * Support for atomisp driver sysfs interface
  *
  * Copyright (c) 2014 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #include <linux/device.h>
diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.h b/drivers/staging/media/atomisp/pci/atomisp_drvfs.h
index 8495cc133c06..46ad59b8df28 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.h
@@ -3,17 +3,6 @@
  * Support for atomisp driver sysfs interface.
  *
  * Copyright (c) 2014 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #ifndef	__ATOMISP_DRVFS_H__
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index b180fcbea9b1..c15a584045b1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -5,17 +5,6 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #include <linux/module.h>
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.h b/drivers/staging/media/atomisp/pci/atomisp_fops.h
index ad1cb1ac8aa4..a5c84029b025 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.h
@@ -5,17 +5,6 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #ifndef	__ATOMISP_FOPS_H__
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 9c2bc5332fa4..775506757471 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -5,17 +5,6 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 #ifndef __ATOMISP_INTERNAL_H__
 #define __ATOMISP_INTERNAL_H__
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d7e8a9871522..b1b23c35b29b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -5,17 +5,6 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #include <linux/delay.h>
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
index 56d3df86c706..4feaa0338cb4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
@@ -5,17 +5,6 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #ifndef	__ATOMISP_IOCTL_H__
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 202497695e46..22c0ae0b1b7b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -3,17 +3,6 @@
  * Support for Medifield PNW Camera Imaging ISP subsystem.
  *
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 #include <linux/module.h>
 #include <linux/uaccess.h>
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index b6c66a5d523c..bd1a198cda30 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -3,17 +3,6 @@
  * Support for Medifield PNW Camera Imaging ISP subsystem.
  *
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 #ifndef __ATOMISP_SUBDEV_H__
 #define __ATOMISP_SUBDEV_H__
diff --git a/drivers/staging/media/atomisp/pci/atomisp_tables.h b/drivers/staging/media/atomisp/pci/atomisp_tables.h
index e718a3f661f9..33e6079aa73b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_tables.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_tables.h
@@ -5,17 +5,6 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 #ifndef	__ATOMISP_TABLES_H__
 #define	__ATOMISP_TABLES_H__
diff --git a/drivers/staging/media/atomisp/pci/atomisp_trace_event.h b/drivers/staging/media/atomisp/pci/atomisp_trace_event.h
index 538d45e008b5..4c58a8f5c7e8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_trace_event.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_trace_event.h
@@ -3,17 +3,6 @@
  * Support Camera Imaging tracer core.
  *
  * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 #undef TRACE_SYSTEM
 #define TRACE_SYSTEM atomisp
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index c9984f1557b0..7d58615d9c71 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -5,17 +5,6 @@
  * Copyright (c) 2010-2017 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 #include <linux/module.h>
 #include <linux/pci.h>
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.h b/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
index fad9573374b3..f1b740360009 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
@@ -5,17 +5,6 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 
 #ifndef __ATOMISP_V4L2_H__
diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
index e9846951f4ed..86300991d30e 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_CIRCBUF_H
diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
index b0f20563c3a3..971e07f2acc5 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_CIRCBUF_COMM_H
diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
index 1071813a284c..5645a7bf493c 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_CIRCBUF_DESC_H_
diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
index 198c9f6e6191..cb34d0b5abb5 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_circbuf.h"
diff --git a/drivers/staging/media/atomisp/pci/base/refcount/interface/ia_css_refcount.h b/drivers/staging/media/atomisp/pci/base/refcount/interface/ia_css_refcount.h
index 78cf0cbfb3be..d78859e3a5b0 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/interface/ia_css_refcount.h
+++ b/drivers/staging/media/atomisp/pci/base/refcount/interface/ia_css_refcount.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_REFCOUNT_H_
diff --git a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
index 69798bb6101b..cf1cfacc9c73 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
+++ b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "hmm.h"
diff --git a/drivers/staging/media/atomisp/pci/bits.h b/drivers/staging/media/atomisp/pci/bits.h
index f7a66287d763..ebd9393d910f 100644
--- a/drivers/staging/media/atomisp/pci/bits.h
+++ b/drivers/staging/media/atomisp/pci/bits.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _HRT_BITS_H
diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_binarydesc.h b/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_binarydesc.h
index e42eeaeb3ee4..4e687f318c0e 100644
--- a/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_binarydesc.h
+++ b/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_binarydesc.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_PIPE_BINARYDESC_H__
diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_stagedesc.h b/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_stagedesc.h
index 7a0c988d89ee..61d1bf66fbd6 100644
--- a/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_stagedesc.h
+++ b/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_stagedesc.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_PIPE_STAGEDESC_H__
diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_util.h b/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_util.h
index c23d1bd915a3..a0bdcc37553f 100644
--- a/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_util.h
+++ b/drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_util.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_PIPE_UTIL_H__
diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
index 06664ce75b60..8d7925a7ee0c 100644
--- a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
+++ b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
index 6c93fa1c683b..a9f736398f50 100644
--- a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
+++ b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_pipe_stagedesc.h"
diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_util.c b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_util.c
index 03d9d168fcc9..c7c42b472cc7 100644
--- a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_util.c
+++ b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_util.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_pipe_util.h"
diff --git a/drivers/staging/media/atomisp/pci/camera/util/interface/ia_css_util.h b/drivers/staging/media/atomisp/pci/camera/util/interface/ia_css_util.h
index d4de1e9293a1..24cd99a659ca 100644
--- a/drivers/staging/media/atomisp/pci/camera/util/interface/ia_css_util.h
+++ b/drivers/staging/media/atomisp/pci/camera/util/interface/ia_css_util.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_UTIL_H__
diff --git a/drivers/staging/media/atomisp/pci/camera/util/src/util.c b/drivers/staging/media/atomisp/pci/camera/util/src/util.c
index 9d7025a00beb..3a7abdc8f6b3 100644
--- a/drivers/staging/media/atomisp/pci/camera/util/src/util.c
+++ b/drivers/staging/media/atomisp/pci/camera/util/src/util.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_util.h"
diff --git a/drivers/staging/media/atomisp/pci/cell_params.h b/drivers/staging/media/atomisp/pci/cell_params.h
index 3c21a18990ba..a2a07b78f2a0 100644
--- a/drivers/staging/media/atomisp/pci/cell_params.h
+++ b/drivers/staging/media/atomisp/pci/cell_params.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _cell_params_h
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/csi_rx_global.h b/drivers/staging/media/atomisp/pci/css_2401_system/csi_rx_global.h
index 3aabd0248e4f..ab9d091acb4e 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/csi_rx_global.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/csi_rx_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __CSI_RX_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.c b/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.c
index 9a8d8f546da7..f82522e2da94 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.c
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "system_global.h"
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_local.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_local.h
index 6489ee644a4a..81e83554d317 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_local.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __CSI_RX_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_private.h
index ece45d80eb2a..989f55bec519 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __CSI_RX_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl.c b/drivers/staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl.c
index 8d19c9875a71..a99928a13e75 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl.c
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <type_support.h>
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl_local.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl_local.h
index f71841195ac1..814687251ec5 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl_local.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IBUF_CTRL_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma.c b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma.c
index 2a5159945a44..dfa7edefdff8 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma.c
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "system_local.h"
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h
index d65fe9ec9049..da51b44d48a9 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISYS_DMA_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq.c b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq.c
index b6135c4b6eea..3847884e2dc0 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq.c
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <system_local.h>
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_local.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_local.h
index 0f585a7e0fa4..0c5f1094f901 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_local.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISYS_IRQ_LOCAL_H__
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h
index d94c8e6add72..4bd8209aaa01 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISYS_IRQ_PRIVATE_H__
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio.c b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio.c
index b7d893aea88d..21b19b4abeaa 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio.c
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "isys_stream2mmio.h"
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio_local.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio_local.h
index 4fbbcc2338d3..de985674bddd 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio_local.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISYS_STREAM2MMIO_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio_private.h
index 4a5646a229b8..3210dd6bf9ca 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISYS_STREAM2MMIO_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_local.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_local.h
index efaa4da8d36d..4e091406efa9 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_local.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __PIXELGEN_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
index 8f79424bedb2..b8b98106bd31 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __PIXELGEN_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/hrt/PixelGen_SysBlock_defs.h b/drivers/staging/media/atomisp/pci/css_2401_system/hrt/PixelGen_SysBlock_defs.h
index ae471dd51737..323925ba2971 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/hrt/PixelGen_SysBlock_defs.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/hrt/PixelGen_SysBlock_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _PixelGen_SysBlock_defs_h
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/hrt/ibuf_cntrl_defs.h b/drivers/staging/media/atomisp/pci/css_2401_system/hrt/ibuf_cntrl_defs.h
index 374466e6b7bf..a41e2b957bd1 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/hrt/ibuf_cntrl_defs.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/hrt/ibuf_cntrl_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _ibuf_cntrl_defs_h_
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/hrt/mipi_backend_common_defs.h b/drivers/staging/media/atomisp/pci/css_2401_system/hrt/mipi_backend_common_defs.h
index ac8be2d49227..bc7639adcd8d 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/hrt/mipi_backend_common_defs.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/hrt/mipi_backend_common_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _css_receiver_2400_common_defs_h_
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/hrt/mipi_backend_defs.h b/drivers/staging/media/atomisp/pci/css_2401_system/hrt/mipi_backend_defs.h
index 6fae1c262446..91747af997c5 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/hrt/mipi_backend_defs.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/hrt/mipi_backend_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _mipi_backend_defs_h
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/hrt/rx_csi_defs.h b/drivers/staging/media/atomisp/pci/css_2401_system/hrt/rx_csi_defs.h
index d0e5b54d1afc..12df1ab491a0 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/hrt/rx_csi_defs.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/hrt/rx_csi_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _csi_rx_defs_h
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/hrt/stream2mmio_defs.h b/drivers/staging/media/atomisp/pci/css_2401_system/hrt/stream2mmio_defs.h
index e17783f96b23..495db4770e84 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/hrt/stream2mmio_defs.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/hrt/stream2mmio_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _STREAM2MMMIO_DEFS_H
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/ibuf_ctrl_global.h b/drivers/staging/media/atomisp/pci/css_2401_system/ibuf_ctrl_global.h
index 56c5ed89b3cc..cab7236dc292 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/ibuf_ctrl_global.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/ibuf_ctrl_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IBUF_CTRL_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/isys_dma_global.h b/drivers/staging/media/atomisp/pci/css_2401_system/isys_dma_global.h
index f423f34134d3..de89bc4829f0 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/isys_dma_global.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/isys_dma_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISYS_DMA_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/isys_irq_global.h b/drivers/staging/media/atomisp/pci/css_2401_system/isys_irq_global.h
index 16336ed73036..bd584ccc1a9a 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/isys_irq_global.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/isys_irq_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISYS_IRQ_GLOBAL_H__
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/isys_stream2mmio_global.h b/drivers/staging/media/atomisp/pci/css_2401_system/isys_stream2mmio_global.h
index 0611047eabbc..c6d8d9e72981 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/isys_stream2mmio_global.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/isys_stream2mmio_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISYS_STREAM2MMIO_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/pixelgen_global.h b/drivers/staging/media/atomisp/pci/css_2401_system/pixelgen_global.h
index f131f03cb8fa..59e0b44bfdc3 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/pixelgen_global.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/pixelgen_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __PIXELGEN_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/css_receiver_2400_common_defs.h b/drivers/staging/media/atomisp/pci/css_receiver_2400_common_defs.h
index d2c39f9600bd..fc733a72d1e3 100644
--- a/drivers/staging/media/atomisp/pci/css_receiver_2400_common_defs.h
+++ b/drivers/staging/media/atomisp/pci/css_receiver_2400_common_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _css_receiver_2400_common_defs_h_
diff --git a/drivers/staging/media/atomisp/pci/css_receiver_2400_defs.h b/drivers/staging/media/atomisp/pci/css_receiver_2400_defs.h
index 180ff7cd9ff5..6dd6e7290eb8 100644
--- a/drivers/staging/media/atomisp/pci/css_receiver_2400_defs.h
+++ b/drivers/staging/media/atomisp/pci/css_receiver_2400_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _css_receiver_2400_defs_h_
diff --git a/drivers/staging/media/atomisp/pci/css_trace.h b/drivers/staging/media/atomisp/pci/css_trace.h
index d2ce50fcfb7a..5b878a6735a1 100644
--- a/drivers/staging/media/atomisp/pci/css_trace.h
+++ b/drivers/staging/media/atomisp/pci/css_trace.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __CSS_TRACE_H_
diff --git a/drivers/staging/media/atomisp/pci/dma_v2_defs.h b/drivers/staging/media/atomisp/pci/dma_v2_defs.h
index 27299e3a185d..79cbdc7242d5 100644
--- a/drivers/staging/media/atomisp/pci/dma_v2_defs.h
+++ b/drivers/staging/media/atomisp/pci/dma_v2_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _dma_v2_defs_h
diff --git a/drivers/staging/media/atomisp/pci/gdc_v2_defs.h b/drivers/staging/media/atomisp/pci/gdc_v2_defs.h
index 804df8179e36..ca2fee141f76 100644
--- a/drivers/staging/media/atomisp/pci/gdc_v2_defs.h
+++ b/drivers/staging/media/atomisp/pci/gdc_v2_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef HRT_GDC_v2_defs_h_
diff --git a/drivers/staging/media/atomisp/pci/gp_timer_defs.h b/drivers/staging/media/atomisp/pci/gp_timer_defs.h
index 9bc04e5b4292..4b1b8ae1c194 100644
--- a/drivers/staging/media/atomisp/pci/gp_timer_defs.h
+++ b/drivers/staging/media/atomisp/pci/gp_timer_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _gp_timer_defs_h
diff --git a/drivers/staging/media/atomisp/pci/gpio_block_defs.h b/drivers/staging/media/atomisp/pci/gpio_block_defs.h
index 55c39067a9bf..a4ce5a6dbd93 100644
--- a/drivers/staging/media/atomisp/pci/gpio_block_defs.h
+++ b/drivers/staging/media/atomisp/pci/gpio_block_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _gpio_block_defs_h_
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/debug_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/debug_global.h
index f2e17945fd45..15fb0ad4a5f0 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/debug_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/debug_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __DEBUG_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/dma_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/dma_global.h
index 135034c7245a..05b10e3d19dc 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/dma_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/dma_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __DMA_GLOBAL_H_INCLUDED__
@@ -34,7 +25,6 @@
  *    param id[4] channel id[5] cmd id[6]
  *	| b14 .. b11 | b10 ... b6 | b5 ... b0 |
  *
- *
  * fast transfer:
  *    height[5]     width[8]      width[8]  channel id[5] cmd id[6]
  *	| b31 .. b26 | b25 .. b18 | b17 .. b11 | b10 ... b6 | b5 ... b0 |
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/event_fifo_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/event_fifo_global.h
index a50635b717e3..f4ec956b6035 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/event_fifo_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/event_fifo_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __EVENT_FIFO_GLOBAL_H
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/fifo_monitor_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/fifo_monitor_global.h
index d941c82d530b..6ac588579b9d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/fifo_monitor_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/fifo_monitor_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __FIFO_MONITOR_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/gdc_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/gdc_global.h
index 599d993b832e..06f88305e18b 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/gdc_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/gdc_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __GDC_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/gp_device_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/gp_device_global.h
index c8f416515e2c..958837a40feb 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/gp_device_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/gp_device_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __GP_DEVICE_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/gp_timer_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/gp_timer_global.h
index 163003f2c759..1bc698530e4c 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/gp_timer_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/gp_timer_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __GP_TIMER_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/gpio_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/gpio_global.h
index 06b6cb3842f4..a756f175362d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/gpio_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/gpio_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __GPIO_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/hmem_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/hmem_global.h
index 746b07097681..0cbd06b50bba 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/hmem_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/hmem_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __HMEM_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
index a502ba9f8c7f..8513e78856b2 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2016, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "debug.h"
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_local.h
index 536a4dcf0f62..f80becfb7cab 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __DEBUG_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_private.h
index 3fea43a2125e..568f9bf92ad8 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __DEBUG_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma.c
index 0b6647b2eb76..f7a8cb38d068 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2016, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_local.h
index 1a71dbebbbe2..7e51dea39b1a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __DMA_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_private.h
index 1f62bc2f176f..02553f2d9375 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __DMA_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo.c
index 62d4809e33dd..8f61d9054e55 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "event_fifo.h"
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_local.h
index 25d3823026e8..ce1916637a92 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _EVENT_FIFO_LOCAL_H
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_private.h
index f59d45cc78b7..439c69444942 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __EVENT_FIFO_PRIVATE_H
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c
index 01698064bbe1..f0de78815456 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "fifo_monitor.h"
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor_local.h
index dfdca944a40b..e02ccaee34ab 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __FIFO_MONITOR_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor_private.h
index 10d9c076c140..53a3fb796aab 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __FIFO_MONITOR_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
index 25e082d6a94a..8bb78b4d7c67 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 /* The name "gdc.h is already taken" */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc_local.h
index 4b2b3282c1b2..bde637b519b3 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __GDC_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc_private.h
index 73051112f354..03ffb16c956d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __GDC_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device.c
index a80e547d47b3..b934d20c88ea 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "assert_support.h"
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_local.h
index 320ed35269ea..2fcb95cf1b95 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __GP_DEVICE_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_private.h
index f11a19f21d10..71f20992ee98 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __GP_DEVICE_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer.c
index 2a58dba3c87b..d04c179a5ecd 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <type_support.h> /*uint32_t */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer_local.h
index efede25587fd..779eeee650d4 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __GP_TIMER_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer_private.h
index 3e1b36105bb6..45ea7daaaa1b 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __GP_TIMER_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gpio_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gpio_private.h
index 85fcde0b8615..bcf6538ac0dc 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gpio_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gpio_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __GPIO_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/hmem.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/hmem.c
index be102d5cec87..8b999acd6253 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/hmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/hmem.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "hmem.h"
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/hmem_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/hmem_local.h
index a3ee274bdf19..e9f8024a01b4 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/hmem_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/hmem_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __HMEM_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/hmem_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/hmem_private.h
index 80d81983bd06..0d58b321552f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/hmem_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/hmem_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __HMEM_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
index e01f30f137a0..40b3f1e48c56 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "system_global.h"
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_local.h
index dfb593c109af..84cd031f8b8d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __INPUT_FORMATTER_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_private.h
index e2bc952e6694..6b6ba49656e5 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __INPUT_FORMATTER_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 8f2f4e8eddd9..1484776d1c91 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "system_global.h"
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
index 4697d8d7b915..b66560bca625 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "assert_support.h"
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_local.h
index 8fd1bce85214..c74cd18c7aec 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IRQ_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_private.h
index e98663ef0fcd..ae0a8466a70a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IRQ_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
index b78cc324da6a..39cccbfa3fca 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/delay.h>
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_local.h
index fb98696cc44d..b5c1ba55c991 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISP_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_private.h
index 2f9aeb3bd9d4..177770a9bc1d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISP_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
index eb02835aa98a..064e88a5e064 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 /* The name "mmu.h is already taken" */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu_local.h
index 913150504f0f..f62651953873 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __MMU_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c
index 3dc4d1289ea1..0fb8a675439e 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "sp.h"
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_local.h
index e22d25a902f4..48546491eb83 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __SP_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h
index 05e6b438d2c8..c69778411f2f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __SP_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl.c
index bc9e7f10f1ab..948b0b0a0272 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "timed_ctrl.h"
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_local.h
index f58ee6afcff9..bf97f272adba 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __TIMED_CTRL_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_private.h
index c19eeafed3a3..7b90b4cf0402 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __TIMED_CTRL_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vamem_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vamem_local.h
index c68ed984ca48..2882849660ce 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vamem_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vamem_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __VAMEM_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index d9cdfbc50197..722b684fbc37 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2016, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "isp.h"
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_local.h
index d0ba59cedc92..47895fa70950 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __VMEM_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_private.h
index 39cf1316b404..ca685cf15676 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __VMEM_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/input_formatter_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/input_formatter_global.h
index 605cf02e520c..b8ed8964c7b8 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/input_formatter_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/input_formatter_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __INPUT_FORMATTER_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
index 4a1dea6dfd40..2c47e7820bd7 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IRQ_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/isp_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/isp_global.h
index 5c6891c9b451..2df468bd76d6 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/isp_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/isp_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISP_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/mmu_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/mmu_global.h
index 8738fed6afdf..be8977f6233d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/mmu_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/mmu_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __MMU_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/sp_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/sp_global.h
index b8338f9b5c0c..db72d7b29f73 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/sp_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/sp_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __SP_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/timed_ctrl_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/timed_ctrl_global.h
index 3f2915a78031..2dc0fb88399f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/timed_ctrl_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/timed_ctrl_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __TIMED_CTRL_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/vamem_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/vamem_global.h
index 0d290e815767..0042925f1d2b 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/vamem_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/vamem_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __VAMEM_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/vmem_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/vmem_global.h
index 537b074211da..6d8bde959b52 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/vmem_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/vmem_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __VMEM_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_defs.h b/drivers/staging/media/atomisp/pci/hive_isp_css_defs.h
index e9cf2743868c..0e2c8ec534a1 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_defs.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _hive_isp_css_defs_h__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/assert_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/assert_support.h
index c5ab13511db8..4010976eb4f3 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/assert_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/assert_support.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ASSERT_SUPPORT_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/bitop_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/bitop_support.h
index 29f14e900580..fda1adf6c601 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/bitop_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/bitop_support.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __BITOP_SUPPORT_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/csi_rx.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/csi_rx.h
index 4602885d50e8..8fd1b846d827 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/csi_rx.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/csi_rx.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __CSI_RX_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/debug.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/debug.h
index 0f8195ba8d1a..fc6de151ac64 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/debug.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/debug.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __DEBUG_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/device_access/device_access.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/device_access/device_access.h
index 492f9e26cfff..ca33a1e03d8d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/device_access/device_access.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/device_access/device_access.h
@@ -3,14 +3,6 @@
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
-This program is free software; you can redistribute it and/or modify it
-under the terms and conditions of the GNU General Public License,
-version 2, as published by the Free Software Foundation.
-
-This program is distributed in the hope it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-more details.
 */
 
 #ifndef __DEVICE_ACCESS_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/dma.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/dma.h
index 2f5ebfcd7e8b..1e0731391ad8 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/dma.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/dma.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __DMA_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/event_fifo.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/event_fifo.h
index 0a085abd3ade..cd1a0fb57267 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/event_fifo.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/event_fifo.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __EVENT_FIFO_H
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/fifo_monitor.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/fifo_monitor.h
index 19a1bdd9171a..e85b50d78003 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/fifo_monitor.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/fifo_monitor.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __FIFO_MONITOR_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/gdc_device.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/gdc_device.h
index 4ed57fb4530e..d8633859c393 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/gdc_device.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/gdc_device.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __GDC_DEVICE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_device.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_device.h
index d122bdeae7e7..33ab0642a931 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_device.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_device.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __GP_DEVICE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
index 0b7e92b963d0..94f81af70007 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __GP_TIMER_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/hmem.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/hmem.h
index 898facd7b17a..c916618a0fb9 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/hmem.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/hmem.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __HMEM_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
index 7e37f0809034..2002960f078e 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __CSI_RX_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h
index 5660bd4221be..947381e5b8a8 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __DEBUG_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/dma_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/dma_public.h
index 6fed47f04594..fe3b1b8ecc50 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/dma_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/dma_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __DMA_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/event_fifo_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/event_fifo_public.h
index 22f1875f038e..9c2365e59b63 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/event_fifo_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/event_fifo_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __EVENT_FIFO_PUBLIC_H
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/fifo_monitor_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/fifo_monitor_public.h
index 7c1c3d2f24c6..37cb9eb13919 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/fifo_monitor_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/fifo_monitor_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __FIFO_MONITOR_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gdc_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gdc_public.h
index 385b79254455..77654b163598 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gdc_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gdc_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __GDC_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_device_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_device_public.h
index f017742d9ac4..b93cd00a0b1d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_device_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_device_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __GP_DEVICE_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_timer_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_timer_public.h
index 13baf7236375..cc016eb9e84d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_timer_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_timer_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __GP_TIMER_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/hmem_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/hmem_public.h
index 8d271fb84209..7cfc2228c0b8 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/hmem_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/hmem_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __HMEM_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/input_formatter_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/input_formatter_public.h
index 81dc58640d83..e67d252aa43f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/input_formatter_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/input_formatter_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __INPUT_FORMATTER_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
index 43787ab64078..901e10f8743c 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IRQ_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
index 34dd7f912df6..78abd77c5bdb 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISP_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
index f18a057adb0f..fceab6dcbddb 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISYS_DMA_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_irq_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_irq_public.h
index 2b13688256cf..a728b9b9fd52 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_irq_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_irq_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISYS_IRQ_PUBLIC_H__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_stream2mmio_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_stream2mmio_public.h
index 73bcc424e472..7ed55d427cf6 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_stream2mmio_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_stream2mmio_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISYS_STREAM2MMIO_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index b8c7bbb71b01..1a435a348318 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __MMU_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
index da10e6b98c63..dc31ce3cd741 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __PIXELGEN_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/sp_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/sp_public.h
index e9166535ce09..15faa52d4ab6 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/sp_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/sp_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __SP_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/tag_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/tag_public.h
index b18b4a4e13ac..ad83ff97bbd6 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/tag_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/tag_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __TAG_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/timed_ctrl_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/timed_ctrl_public.h
index 563a2833d1d9..51e0bc0d0f97 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/timed_ctrl_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/timed_ctrl_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __TIMED_CTRL_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/vamem_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/vamem_public.h
index 823e3857e83c..7aede5b00dee 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/vamem_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/vamem_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __VAMEM_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/vmem_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/vmem_public.h
index c510d6a08017..0257079437be 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/vmem_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/vmem_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __VMEM_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/input_formatter.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/input_formatter.h
index daeb919b5384..21d9ea26f929 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/input_formatter.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/input_formatter.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __INPUT_FORMATTER_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/input_system.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/input_system.h
index 0d951fbf42e9..97a698ce83d9 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/input_system.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/input_system.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __INPUT_SYSTEM_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/irq.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/irq.h
index 3a83a85111a2..0f6c8f081a07 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/irq.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/irq.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IRQ_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/isp.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/isp.h
index cb64e62c5569..0ffea40ff001 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/isp.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/isp.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISP_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h
index 952b633fdca7..a4a8e92df592 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_ISYS_IRQ_H__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_stream2mmio.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_stream2mmio.h
index b0f09ffb4f18..e88710c65cb9 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_stream2mmio.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_stream2mmio.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISYS_STREAM2MMIO_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
index 907f9ebcc60d..6d45d0d8d060 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __MATH_SUPPORT_H
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/misc_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/misc_support.h
index 393452d7a3d6..f8c5a88ae1ad 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/misc_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/misc_support.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __MISC_SUPPORT_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/mmu_device.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/mmu_device.h
index b6f6eda4c55e..761909efac44 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/mmu_device.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/mmu_device.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __MMU_DEVICE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/pixelgen.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/pixelgen.h
index e34cd3c58dd7..3215098ee60a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/pixelgen.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/pixelgen.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __PIXELGEN_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
index 0cdef4a5e8b1..473d8d4fb9ba 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __PLATFORM_SUPPORT_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/print_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/print_support.h
index a3c7f3de6d17..e6ce7b51d341 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/print_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/print_support.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __PRINT_SUPPORT_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/queue.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/queue.h
index e6978750a362..d778bcb56646 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/queue.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/queue.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __QUEUE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/resource.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/resource.h
index 9be45b679386..c7a92b530f89 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/resource.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/resource.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __RESOURCE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h
index a7d00c7bb8bc..92724ae59e6b 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __SP_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/tag.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/tag.h
index 98d7e922aed9..b335222c7334 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/tag.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/tag.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __TAG_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/timed_ctrl.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/timed_ctrl.h
index 65b2871fb4ea..b8f48b3c9f1e 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/timed_ctrl.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/timed_ctrl.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __TIMED_CTRL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h
index 9a640f18eed9..097be6bd3cb5 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __TYPE_SUPPORT_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/vamem.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/vamem.h
index 3ea6758aa798..0c3328074571 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/vamem.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/vamem.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __VAMEM_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/vmem.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/vmem.h
index da479b370192..8e8d187d1221 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/vmem.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/vmem.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __VMEM_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/queue_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/queue_local.h
index 31121a22d13d..fe10cad60f5c 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/queue_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/queue_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __QUEUE_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/queue_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/queue_private.h
index be6162dfbc66..e0a8d8493d45 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/queue_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/queue_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __QUEUE_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag.c b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag.c
index 8931539a4c01..c68b096444de 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "tag.h"
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag_local.h
index 921e50a4554a..138b55be5d9d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __TAG_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag_private.h
index b14f09adef07..bc98fcab9a55 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __TAG_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/queue_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/queue_global.h
index 6ae453782515..f133348f4c04 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/queue_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/queue_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __QUEUE_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/sw_event_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/sw_event_global.h
index b256ea19c0eb..c9ee03d60498 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/sw_event_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/sw_event_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __SW_EVENT_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/tag_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/tag_global.h
index af5a47ace32a..7aef49429f98 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/tag_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/tag_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __TAG_GLOBAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_streaming_to_mipi_types_hrt.h b/drivers/staging/media/atomisp/pci/hive_isp_css_streaming_to_mipi_types_hrt.h
index 301dd923950c..7579b1ec2596 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_streaming_to_mipi_types_hrt.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_streaming_to_mipi_types_hrt.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _hive_isp_css_streaming_to_mipi_types_hrt_h_
diff --git a/drivers/staging/media/atomisp/pci/hive_types.h b/drivers/staging/media/atomisp/pci/hive_types.h
index 34f462c0c9f9..c5c5ce3f2228 100644
--- a/drivers/staging/media/atomisp/pci/hive_types.h
+++ b/drivers/staging/media/atomisp/pci/hive_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _HRT_HIVE_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index e8c5d728fd55..84102c3aaf97 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -5,17 +5,6 @@
  * Copyright (c) 2010-2017 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 /*
  * This file contains entry functions for memory management of ISP driver
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index b90efac771e2..07ed33464d71 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -5,17 +5,6 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 /*
  * This file contains functions for buffer object structure management
diff --git a/drivers/staging/media/atomisp/pci/ia_css.h b/drivers/staging/media/atomisp/pci/ia_css.h
index 421056287853..0186f7e5ce06 100644
--- a/drivers/staging/media/atomisp/pci/ia_css.h
+++ b/drivers/staging/media/atomisp/pci/ia_css.h
@@ -3,15 +3,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_H_
diff --git a/drivers/staging/media/atomisp/pci/ia_css_3a.h b/drivers/staging/media/atomisp/pci/ia_css_3a.h
index fc2075c7bd01..1a10f91a77d4 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_3a.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_3a.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_3A_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
index f6838a8fc9d5..e13ca0d84847 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_ACC_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_buffer.h b/drivers/staging/media/atomisp/pci/ia_css_buffer.h
index b1e8357b94b5..7c00dd1d33fd 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_buffer.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_buffer.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_BUFFER_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_control.h b/drivers/staging/media/atomisp/pci/ia_css_control.h
index 6a473459b346..d374ceaf7574 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_control.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_control.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CONTROL_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_device_access.c b/drivers/staging/media/atomisp/pci/ia_css_device_access.c
index 9cd2d3caa5c9..8ee7656f614b 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_device_access.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_device_access.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_device_access.h"
diff --git a/drivers/staging/media/atomisp/pci/ia_css_device_access.h b/drivers/staging/media/atomisp/pci/ia_css_device_access.h
index 07d611fdd19f..f2ea16c093b6 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_device_access.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_device_access.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_DEVICE_ACCESS_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_dvs.h b/drivers/staging/media/atomisp/pci/ia_css_dvs.h
index 41a81561bbef..6930f1ec3aee 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_dvs.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_dvs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_DVS_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_env.h b/drivers/staging/media/atomisp/pci/ia_css_env.h
index 42bb1ec1c22d..42bf739c51f5 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_env.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_env.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_ENV_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_err.h b/drivers/staging/media/atomisp/pci/ia_css_err.h
index 98401a4a171d..5d3ffed9e7fb 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_err.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_err.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_ERR_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_event_public.h b/drivers/staging/media/atomisp/pci/ia_css_event_public.h
index b052648d4fc2..f7215dd96739 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_event_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_event_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_EVENT_PUBLIC_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_firmware.h b/drivers/staging/media/atomisp/pci/ia_css_firmware.h
index d3a66128b4de..fcfa400cfdd1 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_firmware.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_firmware.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_FIRMWARE_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_frac.h b/drivers/staging/media/atomisp/pci/ia_css_frac.h
index 661af9225b19..f3f92da6a3f0 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_frac.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_frac.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_FRAC_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_frame_format.h b/drivers/staging/media/atomisp/pci/ia_css_frame_format.h
index 093e23a9b079..0cb9c0fbe88c 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_frame_format.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_frame_format.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_FRAME_FORMAT_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
index a26d9598e400..7acfedb541d8 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_FRAME_PUBLIC_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_host_data.h b/drivers/staging/media/atomisp/pci/ia_css_host_data.h
index f54cc504f5d4..0e45650cc1ab 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_host_data.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_host_data.h
@@ -3,15 +3,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __SH_CSS_HOST_DATA_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_input_port.h b/drivers/staging/media/atomisp/pci/ia_css_input_port.h
index 9772b6928239..f138dfa8f6b2 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_input_port.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_input_port.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 /* For MIPI_PORT0_ID to MIPI_PORT2_ID */
diff --git a/drivers/staging/media/atomisp/pci/ia_css_irq.h b/drivers/staging/media/atomisp/pci/ia_css_irq.h
index 00e2fd1f9647..2a4f11f9d785 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_irq.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_irq.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_IRQ_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
index d28a76a68e43..38c9c62366d6 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 /* Generated code: do not edit or commmit. */
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.h b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.h
index fffcfc871bd2..226902d2100b 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifdef IA_CSS_INCLUDE_CONFIGURATIONS
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_params.c b/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
index 503ac65da69b..1cd3322b0da0 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #define IA_CSS_INCLUDE_PARAMETERS
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_params.h b/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
index c2de689877d1..a542f8979905 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 /* Generated code: do not edit or commmit. */
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_states.c b/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
index a6bc2e9eddea..af1765040464 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 /* Generated code: do not edit or commmit. */
 
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_states.h b/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
index 9f6c342a1705..d637ea1d13f6 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #define IA_CSS_INCLUDE_STATES
diff --git a/drivers/staging/media/atomisp/pci/ia_css_metadata.h b/drivers/staging/media/atomisp/pci/ia_css_metadata.h
index a3e759a3eee7..348836175770 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_metadata.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_metadata.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_METADATA_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_mipi.h b/drivers/staging/media/atomisp/pci/ia_css_mipi.h
index cd6e0111d9f4..9fb178c8f3a5 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_mipi.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_mipi.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_MIPI_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_mmu.h b/drivers/staging/media/atomisp/pci/ia_css_mmu.h
index 8f04d196c646..8dc02c8f60a0 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_mmu.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_mmu.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_MMU_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_mmu_private.h b/drivers/staging/media/atomisp/pci/ia_css_mmu_private.h
index dc6542aa64f2..4b5e09e051b5 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_mmu_private.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_mmu_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_MMU_PRIVATE_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_morph.h b/drivers/staging/media/atomisp/pci/ia_css_morph.h
index 9c4b41b94256..68997b26c70a 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_morph.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_morph.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_MORPH_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_pipe.h b/drivers/staging/media/atomisp/pci/ia_css_pipe.h
index 22522968b9e6..c97d2ae356fd 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_pipe.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_pipe.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_PIPE_H__
diff --git a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
index 8ac1586dce4e..2bb06b0ff5db 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_PIPE_PUBLIC_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_prbs.h b/drivers/staging/media/atomisp/pci/ia_css_prbs.h
index 53bbf1dce3bf..abdbcb8fda53 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_prbs.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_prbs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_PRBS_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_properties.h b/drivers/staging/media/atomisp/pci/ia_css_properties.h
index 2cd014f7ae29..3f087e2df99a 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_properties.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_properties.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_PROPERTIES_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_shading.h b/drivers/staging/media/atomisp/pci/ia_css_shading.h
index de7ae5cabf7d..99ad21c4bd68 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_shading.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_shading.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_SHADING_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_stream.h b/drivers/staging/media/atomisp/pci/ia_css_stream.h
index cf847586dc61..c8de632a8e12 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_stream.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_stream.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_STREAM_H_
diff --git a/drivers/staging/media/atomisp/pci/ia_css_stream_format.h b/drivers/staging/media/atomisp/pci/ia_css_stream_format.h
index aac22d8581a0..6188e281189b 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_stream_format.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_stream_format.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_STREAM_FORMAT_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
index aad860e54d3a..a505f3797962 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_STREAM_PUBLIC_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_timer.h b/drivers/staging/media/atomisp/pci/ia_css_timer.h
index c78fbda907a1..da752834adf4 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_timer.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_timer.h
@@ -3,14 +3,6 @@
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
-This program is free software; you can redistribute it and/or modify it
-under the terms and conditions of the GNU General Public License,
-version 2, as published by the Free Software Foundation.
-
-This program is distributed in the hope it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-more details.
 */
 
 #ifndef __IA_CSS_TIMER_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_types.h b/drivers/staging/media/atomisp/pci/ia_css_types.h
index f5df564c86e8..676d7e20b282 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_types.h
@@ -3,15 +3,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_version.h b/drivers/staging/media/atomisp/pci/ia_css_version.h
index cf1d010baceb..13b192dec8f6 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_version.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_version.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_VERSION_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_version_data.h b/drivers/staging/media/atomisp/pci/ia_css_version_data.h
index 428d78e1616f..33fabac99bb7 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_version_data.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_version_data.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 //
diff --git a/drivers/staging/media/atomisp/pci/if_defs.h b/drivers/staging/media/atomisp/pci/if_defs.h
index e21efa749368..7a6b23748550 100644
--- a/drivers/staging/media/atomisp/pci/if_defs.h
+++ b/drivers/staging/media/atomisp/pci/if_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IF_DEFS_H
diff --git a/drivers/staging/media/atomisp/pci/input_formatter_subsystem_defs.h b/drivers/staging/media/atomisp/pci/input_formatter_subsystem_defs.h
index 594fc36a01c7..f29a3cab76ee 100644
--- a/drivers/staging/media/atomisp/pci/input_formatter_subsystem_defs.h
+++ b/drivers/staging/media/atomisp/pci/input_formatter_subsystem_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _if_subsystem_defs_h__
diff --git a/drivers/staging/media/atomisp/pci/input_selector_defs.h b/drivers/staging/media/atomisp/pci/input_selector_defs.h
index 61882e4cb813..8d67aabb898e 100644
--- a/drivers/staging/media/atomisp/pci/input_selector_defs.h
+++ b/drivers/staging/media/atomisp/pci/input_selector_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _input_selector_defs_h
diff --git a/drivers/staging/media/atomisp/pci/input_switch_2400_defs.h b/drivers/staging/media/atomisp/pci/input_switch_2400_defs.h
index 8ea1d7991d38..c56e00913204 100644
--- a/drivers/staging/media/atomisp/pci/input_switch_2400_defs.h
+++ b/drivers/staging/media/atomisp/pci/input_switch_2400_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _input_switch_2400_defs_h
diff --git a/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h b/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h
index b2076a96987c..e26b9ba3356a 100644
--- a/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h
+++ b/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _input_system_ctrl_defs_h
diff --git a/drivers/staging/media/atomisp/pci/input_system_defs.h b/drivers/staging/media/atomisp/pci/input_system_defs.h
index 0c6a74b1891f..ae07d1952146 100644
--- a/drivers/staging/media/atomisp/pci/input_system_defs.h
+++ b/drivers/staging/media/atomisp/pci/input_system_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _input_system_defs_h
diff --git a/drivers/staging/media/atomisp/pci/irq_controller_defs.h b/drivers/staging/media/atomisp/pci/irq_controller_defs.h
index e49e61e17ee7..4703d991a8b8 100644
--- a/drivers/staging/media/atomisp/pci/irq_controller_defs.h
+++ b/drivers/staging/media/atomisp/pci/irq_controller_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _irq_controller_defs_h
diff --git a/drivers/staging/media/atomisp/pci/irq_types_hrt.h b/drivers/staging/media/atomisp/pci/irq_types_hrt.h
index 4212bb01c8d8..3579fdaee37a 100644
--- a/drivers/staging/media/atomisp/pci/irq_types_hrt.h
+++ b/drivers/staging/media/atomisp/pci/irq_types_hrt.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _HIVE_ISP_CSS_IRQ_TYPES_HRT_H_
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2.host.c
index daf2f25c1ed6..968766c1bd2a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2.host.h
index 3abc125debd0..2232d725c5f4 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_AA_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_param.h
index 4f8bb4de4edc..be0db7304946 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_AA_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
index 900ba8f5e30c..2f568a7062da 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_AA2_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 3f079c954c1f..899d566234b9 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h
index a4720c4a948a..4f77900871c8 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_ANR_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_param.h
index 37dcb013b76d..39ebcb0efc10 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_ANR_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
index 1dd345ece44c..bc2a78dff004 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_ANR_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
index 9cdefedc6312..09599884bdae 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h
index 2b3ab01c279d..2b1105f21c1e 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_ANR2_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_param.h
index 4b83b8100160..f0e0f2a0f30b 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_ANR2_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_table.host.c
index 649283bd44f2..87cc5cb5dd5d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_table.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "system_global.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_table.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_table.host.h
index 9e383e030ac4..bda174abd54d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_table.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_table.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_ANR2_TABLE_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_types.h
index e12aae819dce..2c7c3c3fd8ce 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_ANR2_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
index 2091f001502d..69c87e53f3c2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
index 736b6e3f9512..36b360cfe62e 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_BH_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_param.h
index 05d5c43e6b16..634783fd0b5b 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_HB_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_types.h
index 4c0e92f13d6c..c717c636f666 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_BH_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c
index 45e37dc4f1e3..cd867937ee13 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "type_support.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.h
index 3632bf27cc21..2e47ce5e5524 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_BNLM_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm_param.h
index 30672db269df..1d389a60d2bc 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_BNLM_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm_types.h
index 407b5a3b0fcd..150d3960caee 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_BNLM_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2.host.c
index c42fcb1d9100..b3a9b2f794a0 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "type_support.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2.host.h
index f6ab5d2bb218..08d2c4c7f493 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 #ifndef __IA_CSS_BNR2_2_HOST_H
 #define __IA_CSS_BNR2_2_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_param.h
index 087723795476..1b1c1beae667 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_BNR2_2_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h
index 5f3dfa59f950..387909c35c1a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_BNR2_2_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c
index b75cfd3096d8..0c08077c741b 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.h
index 7fc2a728a6c2..a5f0a12f42b1 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_BNR_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr_param.h
index 4f6469315386..2afda7192171 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_BNR_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c
index 0eb40517e08c..54789d28a9bc 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.h
index 4d046b730f06..d4ffe59ff8a0 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CNR_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr_param.h
index 971ab87af2c5..6a8daab667a1 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CNR_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.host.c
index 495dc1f33ca6..a333c3aa5709 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.host.h
index 38f848137eda..213009192f09 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CNR2_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_param.h
index 3709aa4d3652..5346f98ab8aa 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CNR2_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_types.h
index d0a25616727c..9bb9ca7f7ad2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CNR2_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion.host.c
index ff452e2cc23a..958120b82e47 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion.host.h
index 520623e27349..69eadaffa4ce 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CONVERSION_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion_param.h
index fcbec189eff8..f0601e236d73 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CONVERSION_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion_types.h
index 34152d6d09be..374261d25520 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CONVERSION_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output.host.c
index cc415c72ad8f..a42064dd1c85 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_copy_output.host.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output.host.h
index 44e3e45b0ec3..9257b99bf8dd 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_COPY_OUTPUT_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output_param.h
index 56daa1d96747..32e526717f59 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_COPY_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.c
index 8c1d50f7aae4..7ec230986872 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <assert_support.h>
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.h
index e700149c1e95..9f51ecfdad14 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CROP_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop_param.h
index 7416e74dd782..b766847e5bcb 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CROP_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop_types.h
index aaaae5e2abb9..0571302014f8 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CROP_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc.host.c
index 284c17970e55..0f5ea8b3e5b3 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc.host.h
index 6b0256a73e52..9dcef6693939 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CSC_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc_param.h
index 3809ef73e490..f0380b2c571d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CSC_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc_types.h
index 160f19bdfca0..1e56d78e5ab9 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CSC_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c
index 149adbc57730..0089402bc12d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.h
index 8c17e7b921b5..6dba55261c08 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CTC1_5_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5_param.h
index c18cfc930db6..35ef610ed226 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CTC1_5_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c
index e3d3f1253422..38751b8e9e6a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.h
index eb10c3884020..84ab060d6c88 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CTC2_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_param.h
index 94844da665e5..41337538abbb 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CTC2_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h
index f9f329a58737..187c22f8da51 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CTC2_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.c
index 82f2adbbfac3..f60cbe49ffab 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.h
index 57d1d08e1bc8..6ed1fe8b0b3c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CTC_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_param.h
index eaad708c611c..ae3d183b4142 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CTC_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.c
index 6a7925c8493a..632807fbbd1d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/string.h> /* for memcpy() */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.h
index 33e8a05455a3..b78fc46231d4 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CTC_TABLE_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_types.h
index b2d42f3c1f4d..67f4e01a3197 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_CTC_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c
index e66faeda3613..52a07feb48ec 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.h
index cb91062029cf..b00d1c0fa249 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_DE_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de_param.h
index 2070ce040470..07db16340ef2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_DE_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de_types.h
index daac1275c129..e1f025846b83 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_DE_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2.host.c
index f90da39296ec..16426b2cbfb4 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2.host.h
index 294f619a3b15..0ce9e363aa2c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_DE2_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2_param.h
index 4c9d5c630cb0..ff6c6ed2fc13 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_DE2_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2_types.h
index 372cd9d2b803..ca36c001607c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_DE2_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c
index eff428c67c86..98144a1a9db4 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.h
index e5f5a2716010..93c48de872cc 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_DP_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp_param.h
index e0e7f2d48237..ff8061e820ec 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_DP_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp_types.h
index c1666ebf1d3b..036727f3772d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_DP_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2.host.c
index f6fe064bdda4..82521aed7aff 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_dpc2.host.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2.host.h
index f6e019a65208..85419182c1f5 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_DPC2_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_param.h
index 3b2e99065968..b1bbc283e367 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_DPC2_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_types.h
index f742a8dc1d67..c261899bcaa0 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_DPC2_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
index a47fe523e1d9..e9d6dd0bbfe2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "hmm.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h
index 332aa5496c04..98995c9ed0a1 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_DVS_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_param.h
index 2963bb10b129..368f5b2b1ee8 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_DVS_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_types.h
index e99ff0ce8bab..7057fac6e293 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_DVS_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
index 55d102b479ac..1d53d0a5d89a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef IA_CSS_NO_DEBUG
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.h
index f1ad07e78b3a..4af4bae15190 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_EED1_8_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h
index 27cf6ad7e293..19b829d732c3 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_EED1_8_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h
index 836e348c184f..0b977eb7ad71 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_EED1_8_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c
index bae1ca2cd505..6a10d3545278 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_formats.host.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.h
index 540423d85e9d..17a57ddaa321 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_FORMATS_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats_param.h
index 5275a1dadefa..2a16d93abf82 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_FORMATS_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats_types.h
index 16b6a3ddcd08..5958e7b2ddfe 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_FORMATS_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fixedbds/fixedbds_1.0/ia_css_fixedbds_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/fixedbds/fixedbds_1.0/ia_css_fixedbds_param.h
index 6cd635f3ee27..f7e5669d5125 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fixedbds/fixedbds_1.0/ia_css_fixedbds_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fixedbds/fixedbds_1.0/ia_css_fixedbds_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_FIXEDBDS_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fixedbds/fixedbds_1.0/ia_css_fixedbds_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/fixedbds/fixedbds_1.0/ia_css_fixedbds_types.h
index 3a55d4c698e6..7626dfe82642 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fixedbds/fixedbds_1.0/ia_css_fixedbds_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fixedbds/fixedbds_1.0/ia_css_fixedbds_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_FIXEDBDS_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
index 4b83b828cbbe..e701b7e41ef4 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/math.h>
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h
index bd341fa287fe..cdd4350c082c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_FPN_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_param.h
index b21415743705..94edd1d21e9a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_FPN_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_types.h
index 14dc5e183184..8b246c80e105 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_FPN_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c
index 7f3f87920dc7..afef48ebd818 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.h
index c2dc1574a3da..785bc5329dd3 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_GC_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_param.h
index a81233add437..fcd16196cc5a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_GC_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_table.host.c
index 7dbe2dc0591d..b0427a9d6628 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_table.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/string.h> /* for memcpy() */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_table.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_table.host.h
index ee6fa07b3511..f24e6d84e40a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_table.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_table.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_GC_TABLE_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_types.h
index ccd3d91a24d3..09d3fb41b73f 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_GC_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2.host.c
index 76209b7c14cb..3a32026a8f60 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2.host.h
index eabf78737bfc..a7ac7241d477 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_GC2_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_param.h
index af456e75e476..76c8521f0e15 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_GC2_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.c
index 34795011907a..101f703443ec 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/string.h> /* for memcpy() */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.h
index 13049fbfab84..f2ce0cc47f86 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_GC2_TABLE_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_types.h
index ae16409d84a5..abb0d3d871b3 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_GC2_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.c
index 85a02b6adb52..7a53928ef26c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.c
@@ -3,15 +3,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_hdr.host.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.h
index 83277b683c47..916b72b082ec 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.h
@@ -3,15 +3,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_HDR_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_param.h
index 998c6d801756..da787654440c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_param.h
@@ -3,15 +3,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_HDR_PARAMS_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
index ecc98686f5cf..e32290d1c86b 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
@@ -3,15 +3,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_HDR_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
index c32659894c29..38f371b6d6d5 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/bitops.h>
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.h
index 9c7e5a1ad57b..3c82bbd79c4c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __BAYER_IO_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io_param.h
index 283ace8385b0..1586decb3c1e 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_BAYER_IO_PARAM
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io_types.h
index d06d25c9b81c..ec84c120d4f6 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_BAYER_IO_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_css_common_io_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_css_common_io_param.h
index 5e0e4cd5bfba..c9a3f7bfaa90 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_css_common_io_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_css_common_io_param.h
@@ -3,14 +3,6 @@
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
-This program is free software; you can redistribute it and/or modify it
-under the terms and conditions of the GNU General Public License,
-version 2, as published by the Free Software Foundation.
-
-This program is distributed in the hope it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-more details.
 */
 
 #ifndef __IA_CSS_COMMON_IO_PARAM
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_css_common_io_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_css_common_io_types.h
index 0801481c4b49..c1c93b2245c5 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_css_common_io_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_css_common_io_types.h
@@ -3,14 +3,6 @@
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
-This program is free software; you can redistribute it and/or modify it
-under the terms and conditions of the GNU General Public License,
-version 2, as published by the Free Software Foundation.
-
-This program is distributed in the hope it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-more details.
 */
 
 #ifndef __IA_CSS_COMMON_IO_TYPES
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
index 5b2d5023b5ee..13054ffc0b35 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
@@ -3,14 +3,6 @@
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
-This program is free software; you can redistribute it and/or modify it
-under the terms and conditions of the GNU General Public License,
-version 2, as published by the Free Software Foundation.
-
-This program is distributed in the hope it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-more details.
 */
 
 #include <linux/bitops.h>
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.h
index 13e50590f91e..e6ce0cba44b9 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.h
@@ -3,14 +3,6 @@
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
-This program is free software; you can redistribute it and/or modify it
-under the terms and conditions of the GNU General Public License,
-version 2, as published by the Free Software Foundation.
-
-This program is distributed in the hope it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-more details.
 */
 
 #ifndef __YUV444_IO_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io_param.h
index 9b7537d508ad..429fcdb73f60 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io_param.h
@@ -3,14 +3,6 @@
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
-This program is free software; you can redistribute it and/or modify it
-under the terms and conditions of the GNU General Public License,
-version 2, as published by the Free Software Foundation.
-
-This program is distributed in the hope it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-more details.
 */
 
 #ifndef __IA_CSS_YUV444_IO_PARAM
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io_types.h
index 137a2a05c65b..485ad17cb29b 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io_types.h
@@ -3,14 +3,6 @@
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
-This program is free software; you can redistribute it and/or modify it
-under the terms and conditions of the GNU General Public License,
-version 2, as published by the Free Software Foundation.
-
-This program is distributed in the hope it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-more details.
 */
 
 #ifndef __IA_CSS_YUV444_IO_TYPES
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.c
index 15386a773dc5..b8ba26f56cfa 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_iterator.host.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.h
index 1419fa9a07f0..01b1dc76651a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_ITERATOR_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator_param.h
index e062f8d06128..45151d903944 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_ITERATOR_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5.host.c
index a70bce1179da..c4f3afb85828 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5.host.h
index 6c1189e1d263..631839aa3c57 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_MACC1_5_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_param.h
index 66b8fb259218..0f38cd7ea9b1 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_MACC1_5_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_table.host.c
index d205d64e0b94..aea74be18fe9 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_table.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "system_global.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_table.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_table.host.h
index d451efbaa184..76a3a5035d10 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_table.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_table.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_MACC1_5_TABLE_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_types.h
index 5492af0dfa9f..b0538808ae56 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_MACC1_5_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc.host.c
index f2d3832a0039..6e2159f7b395 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc.host.h
index 912db92540e6..faba2dc79ed3 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_MACC_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_param.h
index 71665204e4dd..e8c91a12b944 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_MACC_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c
index d25bf59273ba..1720fa9d4f72 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "system_global.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.h
index 35099cb79d6a..620a72f7cb1f 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_MACC_TABLE_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_types.h
index 172a518cb935..20e34f53bec2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_MACC_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/norm/norm_1.0/ia_css_norm.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/norm/norm_1.0/ia_css_norm.host.c
index 69283b631da7..16e400b3cdaa 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/norm/norm_1.0/ia_css_norm.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/norm/norm_1.0/ia_css_norm.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_norm.host.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/norm/norm_1.0/ia_css_norm.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/norm/norm_1.0/ia_css_norm.host.h
index 3987abcae85c..7e1d334273e6 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/norm/norm_1.0/ia_css_norm.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/norm/norm_1.0/ia_css_norm.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_NORM_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/norm/norm_1.0/ia_css_norm_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/norm/norm_1.0/ia_css_norm_param.h
index 06c39fdfc9e3..0481213edf93 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/norm/norm_1.0/ia_css_norm_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/norm/norm_1.0/ia_css_norm_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_NORM_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c
index c4ffff630b64..5c9e56a0bd59 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.h
index 26c2e43202dc..3bb192250d68 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_OB2_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2_param.h
index c3c9fc3f9064..e64fb1a9a26c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_OB2_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2_types.h
index 51e4c35cf659..9e5cd58df563 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_OB2_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob.host.c
index 12191cd36d5c..6801a5d60513 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob.host.h
index dfcac0c64040..636c6d5242f7 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_OB_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob_param.h
index 991aa3c4051b..366b5900fd28 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_OB_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob_types.h
index b74296517b03..b1470f8b424c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_OB_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
index be9e4ef29fce..d09365e0c471 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_frame.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.h
index c8523e95a394..25408f1aede5 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_OUTPUT_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output_param.h
index df125674bb35..940d03e909b1 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_OUTPUT_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output_types.h
index e5f9c05d2120..7c17ef200571 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_OUTPUT_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.c
index 9fd4435e96b0..6296deb72bd4 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_frame.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.h
index b3f8fa30c8ce..2fa1de5e3633 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_QPLANE_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane_param.h
index 9ae290450865..a50c98ea3f30 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_QPLANE_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane_types.h
index 549f1a36bb7e..ae9707e1f761 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_QPLANE_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
index 40d4a0521562..a00f8d049a33 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_frame.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.h
index 23da51aabc8d..cae9c7fcb7f1 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_RAW_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw_param.h
index c4b5f719a336..24b34083d0e9 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_RAW_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw_types.h
index 1ccaa3c48407..ee25414ea8cd 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_RAW_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_binning_1.0/ia_css_raa.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_binning_1.0/ia_css_raa.host.c
index 9b756daddee0..cd7d1c13605a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_binning_1.0/ia_css_raa.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_binning_1.0/ia_css_raa.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_binning_1.0/ia_css_raa.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_binning_1.0/ia_css_raa.host.h
index 4c2b3de7281e..f800a05fe1dd 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_binning_1.0/ia_css_raa.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_binning_1.0/ia_css_raa.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_RAA_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
index 9288a7a37b37..d9b68b08dd3c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <assert_support.h>
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.h
index 388cd4c367ba..f0556bbcc868 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_REF_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_param.h
index c727e27a8e14..ec1be8b6c65c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_REF_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_state.h b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_state.h
index d4f7a66763eb..b057e440a22f 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_state.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_state.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_REF_STATE_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_types.h
index 07d040bcf281..abc6af2da91b 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_REF_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c
index bd7b89d9475b..13678138c48c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.h
index f9926e297568..f000b4347472 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_S3A_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_param.h
index 9cb75b220678..f88264781a20 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_S3A_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h
index f369e9b95ca8..b8206d2f3d31 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_S3A_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.c
index 6974b3424d91..16b7d36e1cc2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.h
index d103103c9a87..1730b368d191 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_SC_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h
index ace918baeadc..b49761ad39ca 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_SC_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h
index 1d70f6b9a0ec..2f91934f2c06 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_SC_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common.host.h
index 7b661e49b4d0..bad400b2fd37 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_SDIS_COMMON_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common_types.h
index c2ec30b4abd4..1a3790c1c353 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_SDIS_COMMON_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
index bf0a768f8fe1..a4e019e74e6b 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "hmm.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.h
index 0d0ed96e08fe..c8566dafcbe5 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_SDIS_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis_types.h
index a8f2b8afcfd6..02a91968c37a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_SDIS_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
index c13de289a3db..027eae0ca69e 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "hmm.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.h
index e0e6b9c338ad..e8ec4066c1cb 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_SDIS2_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
index d75b72e9551b..f37802878528 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_SDIS2_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.c
index fef8c5457cda..ce93a07a7961 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_debug.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.h
index 7e44d78c5d5d..22ec8745a083 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_TDF_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_param.h
index e904f7122142..512063894ee5 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_TDF_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_types.h
index 0f69f9128f0e..a462365783af 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_TDF_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h
index 4b53fddfcd2d..42b760ffac67 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h
@@ -3,14 +3,6 @@
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
-This program is free software; you can redistribute it and/or modify it
-under the terms and conditions of the GNU General Public License,
-version 2, as published by the Free Software Foundation.
-
-This program is distributed in the hope it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-more details.
 */
 
 #ifndef _IA_CSS_TNR3_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
index a5fea753ec64..31b96d93c3cc 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h
index acf92052b442..3ab82458b945 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_TNR_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_param.h
index 551dd5cfa9f1..1782a95aa0f2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_TNR_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_state.h b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_state.h
index d57238423947..867a6211c0ea 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_state.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_state.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_TNR_STATE_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_types.h
index 92dbe13895c6..574444750986 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_TNR_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/uds/uds_1.0/ia_css_uds_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/uds/uds_1.0/ia_css_uds_param.h
index 784b5c4facd2..520324949aa7 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/uds/uds_1.0/ia_css_uds_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/uds/uds_1.0/ia_css_uds_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_UDS_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index aecdcbe04ce1..ece5e3da34ee 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "atomisp_internal.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.h
index d6b45d3754b0..d2085b7f4501 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_VF_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_param.h
index 487ddf163324..cf1e4f401cd1 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_VF_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_types.h
index 24fbb61d349c..0319fb1a33db 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_VF_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c
index 01d1a2d361c3..bc18bdaaaf0d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.h
index ffd75c8a64fb..841b6c6f7e7c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_WB_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb_param.h
index 51b2ba8efc18..7a57c47e9246 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_WB_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb_types.h
index 20ae73c0ef8c..3a59c7de7387 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_WB_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c
index 1cd59660857f..9f9f3af9fb41 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.h
index 686101c0b6a9..b8e63486a8a5 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_XNR_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_param.h
index 93754f7c797d..0e92c32242f3 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_XNR_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.c
index e5c15308693d..ce8eef985e5d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/string.h> /* for memcpy() */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.h
index 2f4ab8ad402b..dbe236f80d30 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_XNR_TABLE_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_types.h
index 9a4d2e470524..42ad8b9b51d3 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_XNR_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
index c8a56ee9e3c6..39ba986b74b7 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/log2.h>
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.h
index 6b57990b72da..a5e1294527fc 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_XNR3_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_param.h
index c728db7ce917..8997099dff5a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_XNR3_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h
index 4447ba31ad69..c012c1865d1e 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_XNR3_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c
index 048ffbc90b8e..d43a3539c6d4 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.h
index 049706e1ffa9..ed5c17cc081f 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_YNR_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_param.h
index 8d9069ec28a1..51221f83fc87 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_YNR_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_types.h
index da1ba21a0726..bf5c388938ef 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_YNR_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.c
index 08e9d72c143f..9e75cb641577 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.h
index eaf253d59c4d..cad590e76fcf 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_YNR2_HOST_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_param.h
index 96c80b3af426..9553f16f9d2f 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_YNR2_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_types.h
index ab77f4e85319..502e104d7226 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_YNR2_TYPES_H
diff --git a/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h b/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h
index 7c021a83c05b..cdb18bed4ba0 100644
--- a/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h
+++ b/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h
@@ -3,14 +3,6 @@
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
-This program is free software; you can redistribute it and/or modify it
-under the terms and conditions of the GNU General Public License,
-version 2, as published by the Free Software Foundation.
-
-This program is distributed in the hope it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-more details.
 */
 
 #ifndef _INPUT_BUF_ISP_H_
diff --git a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h b/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
index f79764ad7e85..d4106b06a2ce 100644
--- a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
+++ b/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
@@ -3,14 +3,6 @@
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
-This program is free software; you can redistribute it and/or modify it
-under the terms and conditions of the GNU General Public License,
-version 2, as published by the Free Software Foundation.
-
-This program is distributed in the hope it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-more details.
 */
 
 #ifndef _COMMON_ISP_CONST_H_
diff --git a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_types.h b/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_types.h
index d1c42c77fa50..e5c77a95d702 100644
--- a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_types.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _ISP_TYPES_H_
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
index c00acf764b93..df4378fd3540 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <type_support.h>
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
index f9b9c3ae50aa..56a4db033044 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __INPUT_SYSTEM_2400_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_private.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_private.h
index e011920f00e1..a6762683a0ac 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_private.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __INPUT_SYSTEM_2400_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
index 03b7ab7a70d9..2147929392e1 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __INPUT_SYSTEM_2400_PUBLIC_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/isp2400_support.h b/drivers/staging/media/atomisp/pci/isp2400_support.h
index 06d04853d4ee..6e0b563c6c48 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_support.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_support.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _isp2400_support_h
diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
index b116be415074..4aadeb1336ba 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 /* CSI reveiver has 3 ports. */
diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
index d9a8d575c58e..50e585530750 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __INPUT_SYSTEM_2401_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_private.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_private.h
index 845ed0add027..36ae5445fdb4 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_input_system_private.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_private.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __INPUT_SYSTEM_2401_PRIVATE_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/isp_acquisition_defs.h b/drivers/staging/media/atomisp/pci/isp_acquisition_defs.h
index 7e8f6f2178aa..b04404ad59d9 100644
--- a/drivers/staging/media/atomisp/pci/isp_acquisition_defs.h
+++ b/drivers/staging/media/atomisp/pci/isp_acquisition_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _isp_acquisition_defs_h
diff --git a/drivers/staging/media/atomisp/pci/isp_capture_defs.h b/drivers/staging/media/atomisp/pci/isp_capture_defs.h
index b9e5ed932702..b1fbf492a809 100644
--- a/drivers/staging/media/atomisp/pci/isp_capture_defs.h
+++ b/drivers/staging/media/atomisp/pci/isp_capture_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _isp_capture_defs_h
diff --git a/drivers/staging/media/atomisp/pci/mamoiada_params.h b/drivers/staging/media/atomisp/pci/mamoiada_params.h
index e18e5f3576df..a4831f1e02db 100644
--- a/drivers/staging/media/atomisp/pci/mamoiada_params.h
+++ b/drivers/staging/media/atomisp/pci/mamoiada_params.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 /* Version */
diff --git a/drivers/staging/media/atomisp/pci/mmu/isp_mmu.c b/drivers/staging/media/atomisp/pci/mmu/isp_mmu.c
index 72287de75a63..5193a7eb7d9f 100644
--- a/drivers/staging/media/atomisp/pci/mmu/isp_mmu.c
+++ b/drivers/staging/media/atomisp/pci/mmu/isp_mmu.c
@@ -5,17 +5,6 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 /*
  * ISP MMU management wrap code
diff --git a/drivers/staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c b/drivers/staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c
index 0fbb361f5661..c9890892c8aa 100644
--- a/drivers/staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c
+++ b/drivers/staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c
@@ -5,17 +5,6 @@
  * Copyright (c) 2012 Intel Corporation. All Rights Reserved.
  *
  * Copyright (c) 2012 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
  */
 #include "type_support.h"
 #include "mmu/isp_mmu.h"
diff --git a/drivers/staging/media/atomisp/pci/mmu_defs.h b/drivers/staging/media/atomisp/pci/mmu_defs.h
index 03cfb5833027..6a26f2cad52a 100644
--- a/drivers/staging/media/atomisp/pci/mmu_defs.h
+++ b/drivers/staging/media/atomisp/pci/mmu_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _mmu_defs_h
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h b/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
index 9935ac860bc2..9c682f2ecbb2 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
@@ -3,14 +3,6 @@
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
-This program is free software; you can redistribute it and/or modify it
-under the terms and conditions of the GNU General Public License,
-version 2, as published by the Free Software Foundation.
-
-This program is distributed in the hope it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-more details.
 */
 
 #ifndef _IA_CSS_BINARY_H_
@@ -186,7 +178,6 @@ ia_css_binary_find(struct ia_css_binary_descr *descr,
  * @param[out] pipe_config: The pipe configuration.
  *		The shading information related to ISP (but, not necessary as API) is stored in the pipe_config.
  * @return	0 or error code upon error.
- *
  */
 int
 ia_css_binary_get_shading_info(const struct ia_css_binary *binary,
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 7ce2b2d6da11..43cef830aad9 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/math.h>
diff --git a/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq.h b/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq.h
index a461b0ed03f1..3e7dadca6d70 100644
--- a/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq.h
+++ b/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_BUFQ_H
diff --git a/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq_comm.h b/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq_comm.h
index 567d94d91e3c..fb8067fd64a1 100644
--- a/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq_comm.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_BUFQ_COMM_H
diff --git a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
index 6a75cba4886f..bda35614c862 100644
--- a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
+++ b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "assert_support.h"		/* assert */
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
index e9a09117e5e5..2d0e906530af 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_DEBUG_H_
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug_internal.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug_internal.h
index 8ec487ad4298..d4accfc5d9a7 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug_internal.h
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug_internal.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 /* TO DO: Move debug related code from ia_css_internal.h in */
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug_pipe.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug_pipe.h
index 538918cfb2fc..80c58cb934d5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug_pipe.h
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug_pipe.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_DEBUG_PIPE_H_
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index dfb8bef6897d..1efb5dfb6f7b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "debug.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/event/interface/ia_css_event.h b/drivers/staging/media/atomisp/pci/runtime/event/interface/ia_css_event.h
index ebbd90b14bff..d0c3278b0fd9 100644
--- a/drivers/staging/media/atomisp/pci/runtime/event/interface/ia_css_event.h
+++ b/drivers/staging/media/atomisp/pci/runtime/event/interface/ia_css_event.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_EVENT_H
diff --git a/drivers/staging/media/atomisp/pci/runtime/event/src/event.c b/drivers/staging/media/atomisp/pci/runtime/event/src/event.c
index e702297b0a76..6154dda2d968 100644
--- a/drivers/staging/media/atomisp/pci/runtime/event/src/event.c
+++ b/drivers/staging/media/atomisp/pci/runtime/event/src/event.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "sh_css_sp.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/eventq/interface/ia_css_eventq.h b/drivers/staging/media/atomisp/pci/runtime/eventq/interface/ia_css_eventq.h
index fd001ae3522d..9b058e296c93 100644
--- a/drivers/staging/media/atomisp/pci/runtime/eventq/interface/ia_css_eventq.h
+++ b/drivers/staging/media/atomisp/pci/runtime/eventq/interface/ia_css_eventq.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_EVENTQ_H
diff --git a/drivers/staging/media/atomisp/pci/runtime/eventq/src/eventq.c b/drivers/staging/media/atomisp/pci/runtime/eventq/src/eventq.c
index df75cef46a51..fb1710ddcf48 100644
--- a/drivers/staging/media/atomisp/pci/runtime/eventq/src/eventq.c
+++ b/drivers/staging/media/atomisp/pci/runtime/eventq/src/eventq.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_types.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h
index 90c17884968b..45d4bb87af7a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_FRAME_H__
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h
index ce6110efbfc9..d1031f824896 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_FRAME_COMM_H__
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 3adcefb2feeb..eea9bf5b99d2 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/bitops.h>
diff --git a/drivers/staging/media/atomisp/pci/runtime/ifmtr/interface/ia_css_ifmtr.h b/drivers/staging/media/atomisp/pci/runtime/ifmtr/interface/ia_css_ifmtr.h
index 2c440feec3ce..01b89cdaf835 100644
--- a/drivers/staging/media/atomisp/pci/runtime/ifmtr/interface/ia_css_ifmtr.h
+++ b/drivers/staging/media/atomisp/pci/runtime/ifmtr/interface/ia_css_ifmtr.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_IFMTR_H__
diff --git a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
index f8d184483a58..50b0b31d734a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/math.h>
diff --git a/drivers/staging/media/atomisp/pci/runtime/inputfifo/interface/ia_css_inputfifo.h b/drivers/staging/media/atomisp/pci/runtime/inputfifo/interface/ia_css_inputfifo.h
index 7950c5c36693..a95c3098c82a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/inputfifo/interface/ia_css_inputfifo.h
+++ b/drivers/staging/media/atomisp/pci/runtime/inputfifo/interface/ia_css_inputfifo.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_INPUTFIFO_H
diff --git a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
index 2d06e124007e..8e1efeb6372c 100644
--- a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
+++ b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "platform_support.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param.h b/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param.h
index 0ea5d6fdc88b..ff9050fede10 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_ISP_PARAM_H_
diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h b/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h
index 8cdeae98bda8..d6d60508c1bf 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h
@@ -3,14 +3,6 @@
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
-This program is free software; you can redistribute it and/or modify it
-under the terms and conditions of the GNU General Public License,
-version 2, as published by the Free Software Foundation.
-
-This program is distributed in the hope it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-more details.
 */
 
 #ifndef _IA_CSS_ISP_PARAM_TYPES_H_
diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
index 99c2f3a533ab..251dd75a7613 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "hmm.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
index d067b9fc43c7..29eebe8f9078 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_ISYS_H__
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h
index 784afc82c8d2..3d4c0cd2f2a6 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_ISYS_COMM_H
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c
index 881036c67baf..7490d189f39d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "system_global.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.h b/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.h
index 11f730dc1c08..e68386e54469 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __CSI_RX_RMGR_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c
index 9710493c47ac..b8d431dcd6c1 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "system_global.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.h b/drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.h
index 7c754ec7224a..2345dee7ba08 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IBUF_CTRL_RMGR_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c
index 4df0a9188ee6..2ce2f32a1946 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "system_global.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.h b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.h
index 88c3d5581999..070a06df5f0c 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISYS_DMA_RMGR_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
index 18bfe1010989..46bb3569e139 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "input_system.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c
index b6be63746c3e..9217d26cf632 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "system_global.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.h b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.h
index 78a4c867fb1b..c07ee12746d4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __ISYS_STREAM2MMIO_RMGR_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index deb4130f710c..9cfb8bc97e24 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #define __INLINE_INPUT_SYSTEM__
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index 05d6bfaf921e..e6c11d5f77b4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/bitops.h>
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.h b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.h
index fbdbca0cfcc8..a911766b7d49 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __VIRTUAL_ISYS_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
index 5f5dab7252aa..316eaa2070ea 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_PIPELINE_H__
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline_common.h b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline_common.h
index cc44f03c3b34..dff453b37db1 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline_common.h
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline_common.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_PIPELINE_COMMON_H__
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
index 9d2b5f9cbb14..aabebe61ec77 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "hmm.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
index 08112be4633f..c097d912d87f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_QUEUE_H
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
index 1379ae8f8c01..0bed6425a07f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_QUEUE_COMM_H
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index 0e430388b331..afe77d4373f8 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_queue.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
index 424e7a15a389..2591d157870c 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "hmm.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
index d5107adccef9..d62133a8fe6f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __QUEUE_ACCESS_H
diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h b/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h
index 9cd3d92b34c9..00b903d950df 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_RMGR_H
diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h b/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h
index ac969afc8bb4..6820bfc77432 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _IA_CSS_RMGR_VBUF_H
diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr.c
index c94a428aadde..3e014fd0e548 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_rmgr.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
index 1f24db77fe38..940b28c66e99 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010-2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "hmm.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
index efe6c4a82caf..3cd69284f4b4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_SPCTRL_H__
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl_comm.h b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl_comm.h
index de68616482f0..f358785fa5b6 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl_comm.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_SPCTRL_COMM_H__
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
index c34bfc5f970d..78f00f07baaa 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "hmm.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/tagger/interface/ia_css_tagger_common.h b/drivers/staging/media/atomisp/pci/runtime/tagger/interface/ia_css_tagger_common.h
index 49801fbc1924..79006c325de6 100644
--- a/drivers/staging/media/atomisp/pci/runtime/tagger/interface/ia_css_tagger_common.h
+++ b/drivers/staging/media/atomisp/pci/runtime/tagger/interface/ia_css_tagger_common.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2010 - 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __IA_CSS_TAGGER_COMMON_H__
diff --git a/drivers/staging/media/atomisp/pci/runtime/timer/src/timer.c b/drivers/staging/media/atomisp/pci/runtime/timer/src/timer.c
index 08f5c3ea6d29..391308e563cb 100644
--- a/drivers/staging/media/atomisp/pci/runtime/timer/src/timer.c
+++ b/drivers/staging/media/atomisp/pci/runtime/timer/src/timer.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <type_support.h>		/* for uint32_t */
diff --git a/drivers/staging/media/atomisp/pci/scalar_processor_2400_params.h b/drivers/staging/media/atomisp/pci/scalar_processor_2400_params.h
index 7e7188797b0a..e31da83d3106 100644
--- a/drivers/staging/media/atomisp/pci/scalar_processor_2400_params.h
+++ b/drivers/staging/media/atomisp/pci/scalar_processor_2400_params.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _scalar_processor_2400_params_h
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 131defbce0cc..68101793b0c0 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 /*! \file */
diff --git a/drivers/staging/media/atomisp/pci/sh_css_defs.h b/drivers/staging/media/atomisp/pci/sh_css_defs.h
index bc81e3aa8f6b..ffc345144592 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_defs.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _SH_CSS_DEFS_H_
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 197ab2085e8d..bed599223717 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/string.h> /* for memcpy() */
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.h b/drivers/staging/media/atomisp/pci/sh_css_firmware.h
index a73ce703adfb..1c6bc29f68d5 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _SH_CSS_FIRMWARE_H_
diff --git a/drivers/staging/media/atomisp/pci/sh_css_frac.h b/drivers/staging/media/atomisp/pci/sh_css_frac.h
index 8ba65161f7a9..9ad371b44324 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_frac.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_frac.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __SH_CSS_FRAC_H
diff --git a/drivers/staging/media/atomisp/pci/sh_css_host_data.c b/drivers/staging/media/atomisp/pci/sh_css_host_data.c
index 39a9b9812682..39efd8933034 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_host_data.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_host_data.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/slab.h>
diff --git a/drivers/staging/media/atomisp/pci/sh_css_hrt.c b/drivers/staging/media/atomisp/pci/sh_css_hrt.c
index 879c85311038..d4633572f8f3 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_hrt.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_hrt.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "platform_support.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_hrt.h b/drivers/staging/media/atomisp/pci/sh_css_hrt.h
index 168bbd579798..c2d88b4607c4 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_hrt.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_hrt.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _SH_CSS_HRT_H_
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index b4623d044225..9155a83fcc03 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _SH_CSS_INTERNAL_H_
diff --git a/drivers/staging/media/atomisp/pci/sh_css_legacy.h b/drivers/staging/media/atomisp/pci/sh_css_legacy.h
index cdf239b070a8..1d3549c52a46 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_legacy.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_legacy.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _SH_CSS_LEGACY_H_
diff --git a/drivers/staging/media/atomisp/pci/sh_css_metrics.c b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
index 8ded6cdd1575..edf473dd86ca 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_metrics.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "assert_support.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_metrics.h b/drivers/staging/media/atomisp/pci/sh_css_metrics.h
index f4bcd08384e9..0ae995b80d07 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_metrics.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_metrics.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _SH_CSS_METRICS_H_
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 80f0395cc560..923ff25f3408 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_mipi.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.h b/drivers/staging/media/atomisp/pci/sh_css_mipi.h
index e6c86d0ac483..6f7389f44baa 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __SH_CSS_MIPI_H
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mmu.c b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
index 27740c394c2c..88fd02152ca1 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mmu.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_mmu.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
index 5174bc210ae1..7fa4aab35b06 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "sh_css_param_dvs.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h
index 308e3d804d4a..23f7461fab9f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _SH_CSS_PARAMS_DVS_H_
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
index 1f95447ea5af..b6fb4c35286f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/math.h>
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.h b/drivers/staging/media/atomisp/pci/sh_css_param_shading.h
index 7cdfaaec0b1c..b4ca8815dc1b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __SH_CSS_PARAMS_SHADING_H
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index bcb26b2dc56b..f50e9edf3520 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/math.h>
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.h b/drivers/staging/media/atomisp/pci/sh_css_params.h
index bbca19d0e8fc..75957dea3c38 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _SH_CSS_PARAMS_H_
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params_internal.h b/drivers/staging/media/atomisp/pci/sh_css_params_internal.h
index 8e5e6f273a95..b832e18b42e4 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_params_internal.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _SH_CSS_PARAMS_INTERNAL_H_
diff --git a/drivers/staging/media/atomisp/pci/sh_css_properties.c b/drivers/staging/media/atomisp/pci/sh_css_properties.c
index 8ecd93d65a68..caeeaf9a9536 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_properties.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_properties.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "ia_css_properties.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index c2ab70f8fafe..6da151e7a873 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "hmm.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.h b/drivers/staging/media/atomisp/pci/sh_css_sp.h
index c12f57f5befc..78aec5b7e8fa 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _SH_CSS_SP_H_
diff --git a/drivers/staging/media/atomisp/pci/sh_css_stream_format.c b/drivers/staging/media/atomisp/pci/sh_css_stream_format.c
index a798f0537050..24ec09703d9a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_stream_format.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_stream_format.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "sh_css_stream_format.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_stream_format.h b/drivers/staging/media/atomisp/pci/sh_css_stream_format.h
index 84b7942147ad..7f5a3be00c6b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_stream_format.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_stream_format.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __SH_CSS_STREAM_FORMAT_H
diff --git a/drivers/staging/media/atomisp/pci/sh_css_struct.h b/drivers/staging/media/atomisp/pci/sh_css_struct.h
index eb8960ebae34..c51fcb725208 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_struct.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_struct.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __SH_CSS_STRUCT_H
diff --git a/drivers/staging/media/atomisp/pci/sh_css_uds.h b/drivers/staging/media/atomisp/pci/sh_css_uds.h
index 8d9c5c92b692..951f32da9aed 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_uds.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_uds.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _SH_CSS_UDS_H_
diff --git a/drivers/staging/media/atomisp/pci/sh_css_version.c b/drivers/staging/media/atomisp/pci/sh_css_version.c
index f5ff8ca66b50..ba8660f0cb81 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_version.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_version.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "../../include/linux/atomisp.h"
diff --git a/drivers/staging/media/atomisp/pci/str2mem_defs.h b/drivers/staging/media/atomisp/pci/str2mem_defs.h
index e8cb456ac9c7..fc06d4e4589f 100644
--- a/drivers/staging/media/atomisp/pci/str2mem_defs.h
+++ b/drivers/staging/media/atomisp/pci/str2mem_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _ST2MEM_DEFS_H
diff --git a/drivers/staging/media/atomisp/pci/streaming_to_mipi_defs.h b/drivers/staging/media/atomisp/pci/streaming_to_mipi_defs.h
index e0e3a6a66245..8efbaa55f752 100644
--- a/drivers/staging/media/atomisp/pci/streaming_to_mipi_defs.h
+++ b/drivers/staging/media/atomisp/pci/streaming_to_mipi_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _streaming_to_mipi_defs_h
diff --git a/drivers/staging/media/atomisp/pci/system_local.c b/drivers/staging/media/atomisp/pci/system_local.c
index 4ca8569d7feb..a8a93760d5b1 100644
--- a/drivers/staging/media/atomisp/pci/system_local.c
+++ b/drivers/staging/media/atomisp/pci/system_local.c
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include "system_local.h"
diff --git a/drivers/staging/media/atomisp/pci/system_local.h b/drivers/staging/media/atomisp/pci/system_local.h
index a47258c2e8a8..970f4ef990ec 100644
--- a/drivers/staging/media/atomisp/pci/system_local.h
+++ b/drivers/staging/media/atomisp/pci/system_local.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __SYSTEM_LOCAL_H_INCLUDED__
diff --git a/drivers/staging/media/atomisp/pci/timed_controller_defs.h b/drivers/staging/media/atomisp/pci/timed_controller_defs.h
index 9ddad87702de..37a9226c6941 100644
--- a/drivers/staging/media/atomisp/pci/timed_controller_defs.h
+++ b/drivers/staging/media/atomisp/pci/timed_controller_defs.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef _timed_controller_defs_h
diff --git a/drivers/staging/media/atomisp/pci/version.h b/drivers/staging/media/atomisp/pci/version.h
index a74a7bbfdb0e..90688034c491 100644
--- a/drivers/staging/media/atomisp/pci/version.h
+++ b/drivers/staging/media/atomisp/pci/version.h
@@ -2,15 +2,6 @@
 /*
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef HRT_VERSION_H
-- 
2.43.0.rc1.1336.g36b5255a03ac


