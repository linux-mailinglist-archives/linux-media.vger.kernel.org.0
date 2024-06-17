Return-Path: <linux-media+bounces-13451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D9190B568
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 17:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3D12B2B76B
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 15:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769571D9502;
	Mon, 17 Jun 2024 14:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S3SDmT+Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02C11D9504
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 14:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718635970; cv=none; b=rHzticHc+kWECFaBAUMzCRiujTAhe1KcqHEfPVjDBc5iyf+B7VpwU7FSSwAKtdQbhq39GrjRy3ub951j0nmRAwedcie2EIHf20D/oymflPx8RvA3xYFVtioKAN37xVj08OqFK+hikvg1tXJxZf00lqOsBAyi4uuj+TDzm7F8LX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718635970; c=relaxed/simple;
	bh=RU0pvqlRhDAd70K4pCQJ7dG666nO/iLyEW0rGdcF3kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2erZyW+2jJ4M4xFx3gjkeA3H+0TpfZr3UVwwKLqH01b8JepWPGnP2ltR22r+whWvvKynZJUVub7WrP8pP1x6iA4wDbSUCGg1Z3+OlYZ6mmEWyRriacicR8IutRH9LW7chCx/eYIgD2Lk/DEjpLoVe/Lnu4wmLoq9eywBXxYiz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S3SDmT+Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5342655C;
	Mon, 17 Jun 2024 16:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718635948;
	bh=RU0pvqlRhDAd70K4pCQJ7dG666nO/iLyEW0rGdcF3kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3SDmT+Yx9i+9o2khv8zi9tq+cXplzQVa4TTnLd112Dk0Ki3HZe7DLiE78EP4Fb95
	 eoTZbkHPhWcQM0aWbMWVllkRIcArcqg5hrHIl6v6VfmaKK3iSADOBKMV9IWzfnqy3V
	 oCEbcj4YEQAZs71s81+YLWc5zpNE3ucmq8lD5Rss=
Date: Mon, 17 Jun 2024 16:52:41 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	David Plowman <david.plowman@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v9 0/8]  media: raspberrypi: Add support for PiSP Back End
Message-ID: <fkhotca4iuvekscymydr2sqyuvqpledkmvugdoypifuk36bjdz@v7uqiabs4zvw>
References: <20240531080707.34568-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240531080707.34568-1-jacopo.mondi@ideasonboard.com>

Hi Sakari,
   I presume the series is now ready to be collected.

Do you want me to send a pull request or will you handle it ?

Thanks
  j

On Fri, May 31, 2024 at 10:06:59AM GMT, Jacopo Mondi wrote:
> v8->v9:
> - Remove reference to multiple contexts from the admin guide as suggested by
>   Nick
> - Fix the compressed RAW format description as suggested by Nick
>
> v7->v8:
> - Remove multiple-contexts and remove `struct pispbe_node_group`
> - Address Sakari's style comments
> - Remove CONFIG_PM dependency
>
> v6->v7:
> - Introduce uAPI headers earlier in the series to document them
> - kernel-doc uAPI types in pisp_be_config.h
> - Link pisp_be_config.h kernel documentation in metafmt documentation
>
> v5->v6:
> - minor updates
>   If no further comments, I think the series is ready to be collected (for
>   v6.11)
>
> v5->v6:
> - Rebase on recent media_stage master branch
>   - Remove Y12 and Y14 formats as they have upstreamed already
> - Squash in patch from Naush from
>   https://github.com/raspberrypi/linux/pull/6140
>
> v4->v5:
> - Address Sakari's style comments on the driver
> - Add Naush's tags
>
> v3->v4:
> - Rename the compressed RAW formats and change the page title
> - Minor fixes to the RGB48 documentation
> - Remove the clock name from bindings and driver
>
> v2->v3:
> - Expand documentation of RGB48 formats
> - Add back to the bindings the 'aclk' clock-names property
>   - Explicitly get the clock by name in the driver
> - minor fixes
>
> v1->v2:
> - Add Y12P and Y14P formats to yuv-luma.rst instead of documenting them
>   separately
> - Fix typos in formats and documentation
> - Adjust bindings as suggested during review
> - Fix admin-guide with an up-to-media media graph (remove the HOG node)
> - Add a patch to the driver to safely clean-up the video devices buffer queues
>   in case of errors
>   https://github.com/raspberrypi/linux/commit/9fcfb8ee070ecc2ca9b4fcf4629c4545f9cf178e
>
> Add support for the Raspberry Pi PiSP Back End memory-2-memory ISP.
> Documentation available at:
> https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
>
> The PiSP Back End is the memory-2-memory ISP found on Raspberry Pi 5. In
> conjunction with the PiSP Front End, for which a driver is expected to
> hit mainline in the next weeks, it implements the Raspberry Pi 5 camera
> system.
>
> The ISP is fully supported in the Raspberry Pi libcamera version and once
> patches for the PiSP Front End will hit mainline the support will land in
> mainline libcamera as well.
>
> Patch based on media-stage master branch.
>
> A branch is available at
>
> git://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git
> #pispbe/media-staging/be-upstream-v8
>
> -------------------- Hans' build scripts build summary ------------------------
> date:                   Tue May 28 16:25:12 CEST 2024
> media-tree git repo:    git://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git
> media-tree git branch:  jmondi/pispbe/media-staging/be-upstream-v8
> media-tree git hash:    009fac2170dd037c036a95787175562bf5186e13
> v4l-utils git hash:     4a6a3725dd192759c2998311b00440b84c60df57
> edid-decode git hash:   5f723267e04deb3aa9610483514a02bcee10d9c2
> gcc version:            i686-linux-gcc (GCC) 13.1.0
> ccache version:         ccache version 4.7.5
> smatch/sparse repo:     git://repo.or.cz/smatch.git
> smatch version:         v0.5.0-8639-gff1cc4d4
> sparse version:         v0.5.0-8639-gff1cc4d4
> build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
> build-scripts git hash: 745fc7cf5ba1a1a841374c61e8470852232584c1
> host hardware:          x86_64
> host os:                6.1.0-18-amd64
>
> linux-git-arm: OK
> linux-git-powerpc64: OK
> linux-git-arm64: OK
> linux-git-i686: OK
> linux-git-x86_64: OK
> no-acpi.config: OK
> no-of.config: OK
> no-pm.config: OK
> no-pm-sleep.config: OK
> no-debug-fs.config: OK
> sparse: OK
> smatch: WARNINGS:
>
> drivers/media/pci/ivtv/ivtv-driver.c:1296 ivtv_probe() warn: 'itv->dec_mem' from ioremap() not released on lines: 1296.
> drivers/media/pci/ivtv/ivtv-driver.c:1296 ivtv_probe() warn: 'itv->enc_mem' from ioremap() not released on lines: 1296.
>
> COMPILE_TEST: WARNINGS: VIDEO_INTEL_IPU6
> strcpy/strncpy/strlcpy: OK
> abi-compliance: ABI OK
> pahole: ABI OK
> spec-git: OK
> kerneldoc: OK
>
> date:                   Tue May 28 17:31:58 CEST 2024
> -------------------------------------------------------------------------------
>
> --------------------------- V4L2 compliance -----------------------------------
> v4l2-compliance 1.27.0-5208, 64 bits, 64-bit time_t
> v4l2-compliance SHA: b13cb2cdedb2 2024-05-28 08:52:30
>
> Compliance test for pispbe device /dev/video0:
> Total for pispbe device /dev/video4: 48, Succeeded: 48, Failed: 0, Warnings: 0
>
> Compliance test for pispbe device /dev/video1:
> Total for pispbe device /dev/video4: 48, Succeeded: 48, Failed: 0, Warnings: 0
>
> Compliance test for pispbe device /dev/video2:
> Total for pispbe device /dev/video4: 48, Succeeded: 48, Failed: 0, Warnings: 0
>
> Compliance test for pispbe device /dev/video3:
> Total for pispbe device /dev/video4: 48, Succeeded: 48, Failed: 0, Warnings: 0
>
> Compliance test for pispbe device /dev/video4:
> Total for pispbe device /dev/video4: 48, Succeeded: 48, Failed: 0, Warnings: 0
>
> Compliance test for pispbe device /dev/video5:
> Total for pispbe device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
>
> Compliance test for pispbe device /dev/video6:
> Total for pispbe device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
>
> Compliance test for pispbe device /dev/video7:
> Total for pispbe device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
> -------------------------------------------------------------------------------
>
>
> Jacopo Mondi (7):
>   media: uapi: pixfmt-luma: Document MIPI CSI-2 packing
>   media: uapi: Add a pixel format for BGR48 and RGB48
>   media: uapi: Add Raspberry Pi PiSP Back End uAPI
>   media: uapi: Add meta pixel format for PiSP BE config
>   media: uapi: Add PiSP Compressed RAW Bayer formats
>   media: dt-bindings: Add bindings for Raspberry Pi PiSP Back End
>   media: admin-guide: Document the Raspberry Pi PiSP BE
>
> Naushir Patuck (1):
>   media: raspberrypi: Add support for PiSP BE
>
>  .../admin-guide/media/raspberrypi-pisp-be.dot |   20 +
>  .../admin-guide/media/raspberrypi-pisp-be.rst |  109 +
>  .../admin-guide/media/v4l-drivers.rst         |    1 +
>  .../bindings/media/raspberrypi,pispbe.yaml    |   63 +
>  .../userspace-api/media/v4l/meta-formats.rst  |    1 +
>  .../media/v4l/metafmt-pisp-be.rst             |   56 +
>  .../userspace-api/media/v4l/pixfmt-bayer.rst  |    1 +
>  .../userspace-api/media/v4l/pixfmt-rgb.rst    |   54 +
>  .../media/v4l/pixfmt-srggb8-pisp-comp.rst     |   74 +
>  .../media/v4l/pixfmt-yuv-luma.rst             |    4 +
>  MAINTAINERS                                   |    9 +
>  drivers/media/platform/Kconfig                |    1 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/raspberrypi/Kconfig    |    5 +
>  drivers/media/platform/raspberrypi/Makefile   |    3 +
>  .../platform/raspberrypi/pisp_be/Kconfig      |   12 +
>  .../platform/raspberrypi/pisp_be/Makefile     |    6 +
>  .../platform/raspberrypi/pisp_be/pisp_be.c    | 1809 +++++++++++++++++
>  .../raspberrypi/pisp_be/pisp_be_formats.h     |  519 +++++
>  drivers/media/v4l2-core/v4l2-common.c         |    2 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   13 +
>  .../linux/media/raspberrypi/pisp_be_config.h  |  927 +++++++++
>  .../linux/media/raspberrypi/pisp_common.h     |  199 ++
>  include/uapi/linux/videodev2.h                |   17 +
>  24 files changed, 3906 insertions(+)
>  create mode 100644 Documentation/admin-guide/media/raspberrypi-pisp-be.dot
>  create mode 100644 Documentation/admin-guide/media/raspberrypi-pisp-be.rst
>  create mode 100644 Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggb8-pisp-comp.rst
>  create mode 100644 drivers/media/platform/raspberrypi/Kconfig
>  create mode 100644 drivers/media/platform/raspberrypi/Makefile
>  create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Kconfig
>  create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Makefile
>  create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
>  create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h
>  create mode 100644 include/uapi/linux/media/raspberrypi/pisp_be_config.h
>  create mode 100644 include/uapi/linux/media/raspberrypi/pisp_common.h
>
> --
> 2.45.1
>
>

