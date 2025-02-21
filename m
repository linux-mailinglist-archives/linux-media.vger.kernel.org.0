Return-Path: <linux-media+bounces-26580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CC6A3F4BC
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 13:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21AC9860DB1
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 12:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE931FF7D3;
	Fri, 21 Feb 2025 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQJz1Uw4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59E91E493
	for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740142518; cv=none; b=W06RYEGeT5HknRQSYrVnUNHkCPbmbbQ171a5TSgN8Y3apE2bwCvsWXaCtNW99O3yLSe5yX04Ltc7y+KBiNkCGyuuIbUFigwV+Frl8KpgAW0XWgHfDVNYfxkCGeTwqFiukg3wiAmiO1G+D8Jjx3xxb1wyz4t6ScZnyN9QZVyJ9jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740142518; c=relaxed/simple;
	bh=0xK3Cv/rETWxY9Cj0+v+V4aSzPsQRvcAAlB8LfDqbXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGZrU5s/ml/QWZAqM6kU9twx2TCgcXI4keIo3Zio7ykDOhcjmYISUZp42pxc2hkmk+dGfWYwi43V3dR8f4YZLxi4PjxOqDXC3PBYvUJAXtjkvsnuNCKrAz4mdp/GS7fvd+RKDlAmwDo6Jc+tbaap/ji0jbhggnkCFTH2+wzJLbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQJz1Uw4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740142515; x=1771678515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0xK3Cv/rETWxY9Cj0+v+V4aSzPsQRvcAAlB8LfDqbXk=;
  b=hQJz1Uw4FZgVAXlpK4ZMMOSKS3yF6X5pULSy6kqjn8FBdr8g6pvqNVcL
   2vy3zxZ8U9kZ5sORAPqEOV7j/qdjchgck2Pj8BXBU1q+JDQbC3LREnGAY
   onW24joogqs4NO5aPqOmYHDFeoT+18DNETyaIajmxc1wavcQgGgRbt4O4
   +W4Sx6YrVtmdPLUFA7/cz7KqWtCmQGA1MKAcwEvDdOp27bRTeE6xX6VgG
   Z0IbSdX3JZ3C07WrsHGoW0+rmoelsD6L10Z6BEKB2YiLgjTrQFKNwFSOp
   vrgo9DyWq/UKvIFjXa62g+En07PpTv+Z8rJK+22bhTmTiKl4JoHzypAIa
   A==;
X-CSE-ConnectionGUID: 4pgt9QoYR1WyF6lTJvR8WA==
X-CSE-MsgGUID: VEssRB4RRS6zBQiQSJDguQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40835601"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="40835601"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 04:55:15 -0800
X-CSE-ConnectionGUID: mAG4G/08QB6WXdDkeCOchA==
X-CSE-MsgGUID: Y6/wySyNQy2DOrzKl9qmgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="120466016"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 04:55:12 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F24BF120289;
	Fri, 21 Feb 2025 14:55:09 +0200 (EET)
Date: Fri, 21 Feb 2025 12:55:09 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com, hans@hansg.org,
	stanislaw.gruszka@linux.intel.com, jerry.w.hu@intel.com,
	tian.shu.qiu@intel.com, daxing.li@intel.com, hao.yao@intel.com,
	bingbu.cao@linux.intel.com
Subject: Re: [RFC PATCH 0/7] Intel IPU7 PCI and input system device drivers
Message-ID: <Z7h3rUrwX8i3a-My@kekkonen.localdomain>
References: <20250221075252.3347582-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221075252.3347582-1-bingbu.cao@intel.com>

Hi Bingbu,

On Fri, Feb 21, 2025 at 03:52:45PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> This patch series adds a driver for Intel IPU7 input system.
> IPU7 is the seventh generation of Imaging Processing Unit, it is a
> PCI device which can be found in some Intel Client Platforms such as
> Intel Lunar Lake and Panther Lake, etc.
> User can use IPU7 to capture images from MIPI camera sensors, support
> both MIPI CSI DPHY and CPHY.
> 
> IPU7 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
> 
>  - ipu7.c: the IPU7 PCI device driver probe, basic hardware
>    configuration and initialization
>  - ipu7-bus: Initialise and register the auxiliary device for IS
>  - ipu7-buttress: Hardware buttress interfaces to allow driver to
>    program to enable the power, firmware authentication and interrupt
>    handling.
>  - ipu7-mmu and ipu7-dma: IPU MMU table setup and IPU DMA mapping APIs
>  - ipu7-cpd and ipu7-boot: firmware format parse and firmware boot flow
>  - abi: a series of ABI headers used by driver and firmware
>  - ipu7-syscom: syscom communication interfaces used by driver to queue
>    commands to firmware
>  - ipu7-isys: main IPU7 input system driver, it registers CSI2 as v4l2
>    sub-devices and the capture as video devices.

Given that much of the driver code is the same than in the IPU6 driver (in
particular split into devices, DMA, MMU and V4L2 / MC API related code), we
should share at least that instead of looking to maintain two copies of it
separately. The IPU7 driver probably has had a different starting point for
development than the current IPU6 driver so there are a fair amount of
differences in that code now but it is largely not due to differences in
the hardware itself, for instance, the lack of metadata or multiple virtual
channel support you listed below.

> 
> 
> TODO list:
>  1. ABI headers cleanup (currently a copy from firmware as it is
>     still in development and updating regularly, need cleanup to unifiy
>     the headers)
>  2. add metadata capture support
>  3. add multiple virtual-channels capture support
>  4. remove unsecure mode code as secure mode is force to enabled in
>     product
> 
> Bingbu Cao (7):
>   media: Rename the IPU PCI device table header and add IPU7 PCI IDs
>   media: ipu7: add Intel IPU7 PCI device driver
>   media: ipu7: add IPU7 DMA APIs and MMU mapping
>   media: ipu7: add firmware parse, syscom interface and boot sequence
>   media: ipu7: add IPU7 firmware ABI headers
>   media: ipu7: add IPU7 input system device driver
>   media: ipu7: add Makefile and Kconfig for IPU7
> 
>  drivers/media/pci/intel/Kconfig               |    1 +
>  drivers/media/pci/intel/Makefile              |    1 +
>  drivers/media/pci/intel/ipu6/ipu6.c           |    2 +-
>  drivers/media/pci/intel/ipu7/Kconfig          |   18 +
>  drivers/media/pci/intel/ipu7/Makefile         |   23 +
>  .../pci/intel/ipu7/abi/ipu7_fw_boot_abi.h     |  164 +
>  .../pci/intel/ipu7/abi/ipu7_fw_common_abi.h   |  243 ++
>  .../pci/intel/ipu7/abi/ipu7_fw_config_abi.h   |   19 +
>  .../intel/ipu7/abi/ipu7_fw_insys_config_abi.h |   19 +
>  .../pci/intel/ipu7/abi/ipu7_fw_isys_abi.h     |  495 +++
>  .../pci/intel/ipu7/abi/ipu7_fw_msg_abi.h      |  509 +++
>  .../intel/ipu7/abi/ipu7_fw_psys_config_abi.h  |   22 +
>  .../pci/intel/ipu7/abi/ipu7_fw_syscom_abi.h   |   60 +
>  drivers/media/pci/intel/ipu7/ipu7-boot.c      |  434 +++
>  drivers/media/pci/intel/ipu7/ipu7-boot.h      |   21 +
>  drivers/media/pci/intel/ipu7/ipu7-bus.c       |  158 +
>  drivers/media/pci/intel/ipu7/ipu7-bus.h       |   69 +
>  .../media/pci/intel/ipu7/ipu7-buttress-regs.h |  465 +++
>  drivers/media/pci/intel/ipu7/ipu7-buttress.c  | 1187 +++++++
>  drivers/media/pci/intel/ipu7/ipu7-buttress.h  |   84 +
>  drivers/media/pci/intel/ipu7/ipu7-cpd.c       |  230 ++
>  drivers/media/pci/intel/ipu7/ipu7-cpd.h       |   62 +
>  drivers/media/pci/intel/ipu7/ipu7-dma.c       |  509 +++
>  drivers/media/pci/intel/ipu7/ipu7-dma.h       |   50 +
>  drivers/media/pci/intel/ipu7/ipu7-fw-isys.c   |  300 ++
>  drivers/media/pci/intel/ipu7/ipu7-fw-isys.h   |   39 +
>  .../media/pci/intel/ipu7/ipu7-isys-csi-phy.c  | 1051 +++++++
>  .../media/pci/intel/ipu7/ipu7-isys-csi-phy.h  |   16 +
>  .../pci/intel/ipu7/ipu7-isys-csi2-regs.h      | 1197 +++++++
>  drivers/media/pci/intel/ipu7/ipu7-isys-csi2.c |  565 ++++
>  drivers/media/pci/intel/ipu7/ipu7-isys-csi2.h |   73 +
>  .../media/pci/intel/ipu7/ipu7-isys-queue.c    |  836 +++++
>  .../media/pci/intel/ipu7/ipu7-isys-queue.h    |   79 +
>  .../media/pci/intel/ipu7/ipu7-isys-subdev.c   |  381 +++
>  .../media/pci/intel/ipu7/ipu7-isys-subdev.h   |   55 +
>  .../media/pci/intel/ipu7/ipu7-isys-video.c    | 1130 +++++++
>  .../media/pci/intel/ipu7/ipu7-isys-video.h    |  117 +
>  drivers/media/pci/intel/ipu7/ipu7-isys.c      | 1170 +++++++
>  drivers/media/pci/intel/ipu7/ipu7-isys.h      |  150 +
>  drivers/media/pci/intel/ipu7/ipu7-mmu.c       |  853 +++++
>  drivers/media/pci/intel/ipu7/ipu7-mmu.h       |  414 +++
>  .../media/pci/intel/ipu7/ipu7-platform-regs.h |  146 +
>  drivers/media/pci/intel/ipu7/ipu7-syscom.c    |   79 +
>  drivers/media/pci/intel/ipu7/ipu7-syscom.h    |   36 +
>  drivers/media/pci/intel/ipu7/ipu7.c           | 2791 +++++++++++++++++
>  drivers/media/pci/intel/ipu7/ipu7.h           |  244 ++
>  drivers/media/pci/intel/ivsc/mei_csi.c        |    2 +-
>  .../{ipu6-pci-table.h => ipu-pci-table.h}     |   14 +-
>  48 files changed, 16578 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/media/pci/intel/ipu7/Kconfig
>  create mode 100644 drivers/media/pci/intel/ipu7/Makefile
>  create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_boot_abi.h
>  create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_common_abi.h
>  create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_config_abi.h
>  create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_insys_config_abi.h
>  create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_isys_abi.h
>  create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_msg_abi.h
>  create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_psys_config_abi.h
>  create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_syscom_abi.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-boot.c
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-boot.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-bus.c
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-bus.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-buttress-regs.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-buttress.c
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-buttress.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-cpd.c
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-cpd.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-dma.c
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-dma.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-fw-isys.c
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-fw-isys.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi-phy.c
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi-phy.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi2-regs.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi2.c
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi2.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-queue.c
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-queue.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-subdev.c
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-subdev.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-video.c
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-video.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys.c
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-mmu.c
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-mmu.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-platform-regs.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-syscom.c
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-syscom.h
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7.c
>  create mode 100644 drivers/media/pci/intel/ipu7/ipu7.h
>  rename include/media/{ipu6-pci-table.h => ipu-pci-table.h} (68%)
> 

-- 
Regards,

Sakari Ailus

