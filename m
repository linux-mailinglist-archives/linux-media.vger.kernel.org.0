Return-Path: <linux-media+bounces-29801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ADEA831D9
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 22:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DEE8179485
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 20:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E9520FA9E;
	Wed,  9 Apr 2025 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LnOEnTsk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EB41C5F25
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 20:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230210; cv=none; b=KyZ6Dt0IkPiNH+tSupw4ie+HNxDcHZhaojXillYQeFcg/jUbB/mpqmVrtRw+bU8OV4WmTsrx8HLAnFxsseJpgovQcO4Zno3ctntfWi06v2qNBjdUoTgJwrbdloCEwkTjvf1CoI4V2cPramUjNb0CcA694r2d0WqBPKom5ZUJ3JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230210; c=relaxed/simple;
	bh=kQ717V4tTVjc0EE8EAFgfTR7J4BpyB3OEtPYCOglf84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPmaLf4w9vX0yBQNyAIbED5zf5ys6qT+ctQWfQ19QtNsVcEhBBt+Mu2qw+5bXQAJuvV+6r60hf6L2wc7/JAOiDv7po22KdZls7lOcgZmtvdNvNAHlhe7aqwl6vS/V7di0iPzM9M7L1MBsQMQVbF/p0VOTicq4bEVu7B+l6pRYgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LnOEnTsk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D92E9CE;
	Wed,  9 Apr 2025 22:21:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744230088;
	bh=kQ717V4tTVjc0EE8EAFgfTR7J4BpyB3OEtPYCOglf84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LnOEnTskc0Bck214UnZTVvV1Dc5e5pW7ui1pgQTww9zAM3Ef01Ov4CTFDNhbsPPjA
	 dz//O6ODYOqdSBBKVupbLYGysWeJeOd8R3JCjuNpy5gDABWawqsRWaTxiD/hn6J0kM
	 31NPxRIZksqUcZvBw7AEswOMH1fj62ryf62qBllg=
Date: Wed, 9 Apr 2025 23:23:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org, hdegoede@redhat.com,
	hans@hansg.org, stanislaw.gruszka@linux.intel.com,
	jerry.w.hu@intel.com, tian.shu.qiu@intel.com, daxing.li@intel.com,
	hao.yao@intel.com, bingbu.cao@linux.intel.com
Subject: Re: [RFC PATCH 0/7] Intel IPU7 PCI and input system device drivers
Message-ID: <20250409202300.GE24388@pendragon.ideasonboard.com>
References: <20250221075252.3347582-1-bingbu.cao@intel.com>
 <Z7h3rUrwX8i3a-My@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z7h3rUrwX8i3a-My@kekkonen.localdomain>

Hi Sakari,

On Fri, Feb 21, 2025 at 12:55:09PM +0000, Sakari Ailus wrote:
> On Fri, Feb 21, 2025 at 03:52:45PM +0800, bingbu.cao@intel.com wrote:
> > From: Bingbu Cao <bingbu.cao@intel.com>
> > 
> > This patch series adds a driver for Intel IPU7 input system.
> > IPU7 is the seventh generation of Imaging Processing Unit, it is a
> > PCI device which can be found in some Intel Client Platforms such as
> > Intel Lunar Lake and Panther Lake, etc.
> > User can use IPU7 to capture images from MIPI camera sensors, support
> > both MIPI CSI DPHY and CPHY.
> > 
> > IPU7 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
> > 
> >  - ipu7.c: the IPU7 PCI device driver probe, basic hardware
> >    configuration and initialization
> >  - ipu7-bus: Initialise and register the auxiliary device for IS
> >  - ipu7-buttress: Hardware buttress interfaces to allow driver to
> >    program to enable the power, firmware authentication and interrupt
> >    handling.
> >  - ipu7-mmu and ipu7-dma: IPU MMU table setup and IPU DMA mapping APIs
> >  - ipu7-cpd and ipu7-boot: firmware format parse and firmware boot flow
> >  - abi: a series of ABI headers used by driver and firmware
> >  - ipu7-syscom: syscom communication interfaces used by driver to queue
> >    commands to firmware
> >  - ipu7-isys: main IPU7 input system driver, it registers CSI2 as v4l2
> >    sub-devices and the capture as video devices.
> 
> Given that much of the driver code is the same than in the IPU6 driver (in
> particular split into devices, DMA, MMU and V4L2 / MC API related code), we
> should share at least that instead of looking to maintain two copies of it
> separately. The IPU7 driver probably has had a different starting point for
> development than the current IPU6 driver so there are a fair amount of
> differences in that code now but it is largely not due to differences in
> the hardware itself, for instance, the lack of metadata or multiple virtual
> channel support you listed below.

Merging the two drivers in one seems a good idea to me, with lots of
upsides, and very few downsides, if any. If there are strong technical
reasons why this can't be done we should discuss them.

> > TODO list:
> >  1. ABI headers cleanup (currently a copy from firmware as it is
> >     still in development and updating regularly, need cleanup to unifiy
> >     the headers)
> >  2. add metadata capture support
> >  3. add multiple virtual-channels capture support
> >  4. remove unsecure mode code as secure mode is force to enabled in
> >     product
> > 
> > Bingbu Cao (7):
> >   media: Rename the IPU PCI device table header and add IPU7 PCI IDs
> >   media: ipu7: add Intel IPU7 PCI device driver
> >   media: ipu7: add IPU7 DMA APIs and MMU mapping
> >   media: ipu7: add firmware parse, syscom interface and boot sequence
> >   media: ipu7: add IPU7 firmware ABI headers
> >   media: ipu7: add IPU7 input system device driver
> >   media: ipu7: add Makefile and Kconfig for IPU7
> > 
> >  drivers/media/pci/intel/Kconfig               |    1 +
> >  drivers/media/pci/intel/Makefile              |    1 +
> >  drivers/media/pci/intel/ipu6/ipu6.c           |    2 +-
> >  drivers/media/pci/intel/ipu7/Kconfig          |   18 +
> >  drivers/media/pci/intel/ipu7/Makefile         |   23 +
> >  .../pci/intel/ipu7/abi/ipu7_fw_boot_abi.h     |  164 +
> >  .../pci/intel/ipu7/abi/ipu7_fw_common_abi.h   |  243 ++
> >  .../pci/intel/ipu7/abi/ipu7_fw_config_abi.h   |   19 +
> >  .../intel/ipu7/abi/ipu7_fw_insys_config_abi.h |   19 +
> >  .../pci/intel/ipu7/abi/ipu7_fw_isys_abi.h     |  495 +++
> >  .../pci/intel/ipu7/abi/ipu7_fw_msg_abi.h      |  509 +++
> >  .../intel/ipu7/abi/ipu7_fw_psys_config_abi.h  |   22 +
> >  .../pci/intel/ipu7/abi/ipu7_fw_syscom_abi.h   |   60 +
> >  drivers/media/pci/intel/ipu7/ipu7-boot.c      |  434 +++
> >  drivers/media/pci/intel/ipu7/ipu7-boot.h      |   21 +
> >  drivers/media/pci/intel/ipu7/ipu7-bus.c       |  158 +
> >  drivers/media/pci/intel/ipu7/ipu7-bus.h       |   69 +
> >  .../media/pci/intel/ipu7/ipu7-buttress-regs.h |  465 +++
> >  drivers/media/pci/intel/ipu7/ipu7-buttress.c  | 1187 +++++++
> >  drivers/media/pci/intel/ipu7/ipu7-buttress.h  |   84 +
> >  drivers/media/pci/intel/ipu7/ipu7-cpd.c       |  230 ++
> >  drivers/media/pci/intel/ipu7/ipu7-cpd.h       |   62 +
> >  drivers/media/pci/intel/ipu7/ipu7-dma.c       |  509 +++
> >  drivers/media/pci/intel/ipu7/ipu7-dma.h       |   50 +
> >  drivers/media/pci/intel/ipu7/ipu7-fw-isys.c   |  300 ++
> >  drivers/media/pci/intel/ipu7/ipu7-fw-isys.h   |   39 +
> >  .../media/pci/intel/ipu7/ipu7-isys-csi-phy.c  | 1051 +++++++
> >  .../media/pci/intel/ipu7/ipu7-isys-csi-phy.h  |   16 +
> >  .../pci/intel/ipu7/ipu7-isys-csi2-regs.h      | 1197 +++++++
> >  drivers/media/pci/intel/ipu7/ipu7-isys-csi2.c |  565 ++++
> >  drivers/media/pci/intel/ipu7/ipu7-isys-csi2.h |   73 +
> >  .../media/pci/intel/ipu7/ipu7-isys-queue.c    |  836 +++++
> >  .../media/pci/intel/ipu7/ipu7-isys-queue.h    |   79 +
> >  .../media/pci/intel/ipu7/ipu7-isys-subdev.c   |  381 +++
> >  .../media/pci/intel/ipu7/ipu7-isys-subdev.h   |   55 +
> >  .../media/pci/intel/ipu7/ipu7-isys-video.c    | 1130 +++++++
> >  .../media/pci/intel/ipu7/ipu7-isys-video.h    |  117 +
> >  drivers/media/pci/intel/ipu7/ipu7-isys.c      | 1170 +++++++
> >  drivers/media/pci/intel/ipu7/ipu7-isys.h      |  150 +
> >  drivers/media/pci/intel/ipu7/ipu7-mmu.c       |  853 +++++
> >  drivers/media/pci/intel/ipu7/ipu7-mmu.h       |  414 +++
> >  .../media/pci/intel/ipu7/ipu7-platform-regs.h |  146 +
> >  drivers/media/pci/intel/ipu7/ipu7-syscom.c    |   79 +
> >  drivers/media/pci/intel/ipu7/ipu7-syscom.h    |   36 +
> >  drivers/media/pci/intel/ipu7/ipu7.c           | 2791 +++++++++++++++++
> >  drivers/media/pci/intel/ipu7/ipu7.h           |  244 ++
> >  drivers/media/pci/intel/ivsc/mei_csi.c        |    2 +-
> >  .../{ipu6-pci-table.h => ipu-pci-table.h}     |   14 +-
> >  48 files changed, 16578 insertions(+), 5 deletions(-)
> >  create mode 100644 drivers/media/pci/intel/ipu7/Kconfig
> >  create mode 100644 drivers/media/pci/intel/ipu7/Makefile
> >  create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_boot_abi.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_common_abi.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_config_abi.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_insys_config_abi.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_isys_abi.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_msg_abi.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_psys_config_abi.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_syscom_abi.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-boot.c
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-boot.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-bus.c
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-bus.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-buttress-regs.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-buttress.c
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-buttress.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-cpd.c
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-cpd.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-dma.c
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-dma.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-fw-isys.c
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-fw-isys.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi-phy.c
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi-phy.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi2-regs.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi2.c
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi2.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-queue.c
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-queue.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-subdev.c
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-subdev.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-video.c
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-video.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys.c
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-mmu.c
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-mmu.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-platform-regs.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-syscom.c
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7-syscom.h
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7.c
> >  create mode 100644 drivers/media/pci/intel/ipu7/ipu7.h
> >  rename include/media/{ipu6-pci-table.h => ipu-pci-table.h} (68%)

-- 
Regards,

Laurent Pinchart

