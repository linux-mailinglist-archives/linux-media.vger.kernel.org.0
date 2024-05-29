Return-Path: <linux-media+bounces-12204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FD98D41F4
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 01:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E11E62833DE
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 23:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200541C0DC4;
	Wed, 29 May 2024 23:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hqyr1b1x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4F016133B;
	Wed, 29 May 2024 23:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717025264; cv=none; b=MchbBjp1sqBswAY4WyXYtUIcjILiB4C5YUeU8oovrUp8R5soUuOTv7Y6Q5sGoujgopFmloQzvNsZgj/kHeCzSbusDpHOzeU6ibukT3et9U4MNgnnv+DikiuCah2isTl6samwU+IW2g8qjS5zHJOZU3pcCotdXyJS2R92wVTp7QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717025264; c=relaxed/simple;
	bh=csN+NgG1133VRPaQJb1YaEGLKzjWolj5vnYKOHL+xtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsmiRHLCfNBg+hci8YYOXs4ALz3tIWGvLqgXVaiWb6rpM7kSXs7hNWf6F0X2AX07JUu3sD/yM08MhMm3QseeMunx0MEj1HqMyGhc5llbsigrJMBLv+5o/bUWyzPOmqc5c5zkZlhAVH2QKuXypEw86cJ4P8lHUJ3A9ZlwTajoyPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hqyr1b1x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CA454AB;
	Thu, 30 May 2024 01:27:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717025256;
	bh=csN+NgG1133VRPaQJb1YaEGLKzjWolj5vnYKOHL+xtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hqyr1b1xX1WYUSuy5c7idHHEv7bSEZScaXtbErJkLkoO5seJQHrlY+r+9S6FzTEix
	 2JNROcEhdj5zYPPAX39mqD3pCFW8UgOnHiZvqbbs4TqnizsltiW/Dj1CnTZCDVT/Ge
	 NPWQR5m4XFHLPJDToXmTxj1LhLklB9jfZ2D+0IXM=
Date: Thu, 30 May 2024 02:27:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v5 00/16] Add Arm Mali-C55 Image Signal Processor Driver
Message-ID: <20240529232728.GA31738@pendragon.ideasonboard.com>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240529152858.183799-1-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patches.

On Wed, May 29, 2024 at 04:28:42PM +0100, Daniel Scally wrote:
> Hello all
> 
> This patchset introduces a driver for Arm's Mali-C55 Image Signal Processor.
> The driver uses the V4L2 / media controller API and implements both of the ISP's
> capture pipelines allowing a range of output formats plus downscaling and
> cropping. The capture pipelines are named "Full resolution" and "Downscale" and
> so abbreviated FR and DS throughout the driver.
> 
> The driver exposes 4 V4L2 subdevices:
> 
> - mali-c55 isp: input data formatting
> - mali-c55 tpg: test pattern generator (modeled as a camera sensor entity)
> - mali-c55 resizer fr: downscale / crop and format setting for the FR pipe
> - mali-c55 resizer ds: downscale / crop and format setting for the DS pipe
> 
> Along with 4 V4L2 Video devices:
> 
> - mali-c55 fr: Capture device for the full resolution pipe
> - mali-c55 ds: Capture device for the downscale pipe
> - mali-c55 3a stats: Capture device for statistics to support 3A algorithms
> - mali-c55 3a params: Output device for parameter buffers to configure the ISP
> 
> Support is implemented in the parameters video device code for many of the ISP'S
> hardware blocks, but not yet all of them. The buffer format is (as far as I am
> aware anyway) a novel design that we intend to be extensible so that support for
> the C55's remaining hardware blocks can be added later.
> 
> Patches 1, 4, 5, 6 and 7 have already had 4 versions on the mailing list...I
> decided to post the additional work on the driver as extra patches rather than
> merge them all into the existing series as it's already a lot of code to review
> and I hoped that that might make it a little easier...if I'm wrong and that's
> not liked I can just squash them into a much smaller series.

Could you please include the v4l2-compliance report in v6 ? Make sure to
use the very latest version of v4l-utils, compiled from the master
branch.

> Daniel Scally (15):
>   media: uapi: Add MEDIA_BUS_FMT_RGB202020_1X60 format code
>   media: uapi: Add 20-bit bayer formats
>   media: v4l2-common: Add RAW16 format info
>   dt-bindings: media: Add bindings for ARM mali-c55
>   media: mali-c55: Add Mali-C55 ISP driver
>   media: Documentation: Add Mali-C55 ISP Documentation
>   MAINTAINERS: Add entry for mali-c55 driver
>   media: Add MALI_C55_3A_STATS meta format
>   media: uapi: Add 3a stats buffer for mali-c55
>   media: platform: Add mali-c55 3a stats devnode
>   media: platform: Fill stats buffer on ISP_START
>   Documentation: mali-c55: Add Statistics documentation
>   media: uapi: Add parameters structs to mali-c55-config.h
>   media: platform: Add mali-c55 parameters video node
>   Documentation: mali-c55: Document the mali-c55 parameter setting
> 
> Jacopo Mondi (1):
>   media: mali-c55: Add image formats for Mali-C55 parameters buffer
> 
>  .../admin-guide/media/mali-c55-graph.dot      |  19 +
>  Documentation/admin-guide/media/mali-c55.rst  | 406 ++++++++
>  .../admin-guide/media/v4l-drivers.rst         |   1 +
>  .../bindings/media/arm,mali-c55.yaml          |  66 ++
>  .../userspace-api/media/v4l/meta-formats.rst  |   1 +
>  .../media/v4l/metafmt-arm-mali-c55.rst        |  87 ++
>  .../media/v4l/subdev-formats.rst              | 268 +++++
>  MAINTAINERS                                   |  10 +
>  drivers/media/platform/Kconfig                |   1 +
>  drivers/media/platform/Makefile               |   1 +
>  drivers/media/platform/arm/Kconfig            |   5 +
>  drivers/media/platform/arm/Makefile           |   2 +
>  drivers/media/platform/arm/mali-c55/Kconfig   |  18 +
>  drivers/media/platform/arm/mali-c55/Makefile  |  11 +
>  .../platform/arm/mali-c55/mali-c55-capture.c  | 951 ++++++++++++++++++
>  .../platform/arm/mali-c55/mali-c55-common.h   | 312 ++++++
>  .../platform/arm/mali-c55/mali-c55-core.c     | 825 +++++++++++++++
>  .../platform/arm/mali-c55/mali-c55-isp.c      | 626 ++++++++++++
>  .../platform/arm/mali-c55/mali-c55-params.c   | 615 +++++++++++
>  .../arm/mali-c55/mali-c55-registers.h         | 365 +++++++
>  .../arm/mali-c55/mali-c55-resizer-coefs.h     | 382 +++++++
>  .../platform/arm/mali-c55/mali-c55-resizer.c  | 779 ++++++++++++++
>  .../platform/arm/mali-c55/mali-c55-stats.c    | 350 +++++++
>  .../platform/arm/mali-c55/mali-c55-tpg.c      | 402 ++++++++
>  drivers/media/v4l2-core/v4l2-common.c         |   4 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
>  include/uapi/linux/media-bus-format.h         |   9 +-
>  .../uapi/linux/media/arm/mali-c55-config.h    | 851 ++++++++++++++++
>  include/uapi/linux/videodev2.h                |   3 +
>  29 files changed, 7370 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/admin-guide/media/mali-c55-graph.dot
>  create mode 100644 Documentation/admin-guide/media/mali-c55.rst
>  create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
>  create mode 100644 drivers/media/platform/arm/Kconfig
>  create mode 100644 drivers/media/platform/arm/Makefile
>  create mode 100644 drivers/media/platform/arm/mali-c55/Kconfig
>  create mode 100644 drivers/media/platform/arm/mali-c55/Makefile
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-capture.c
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-common.h
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-core.c
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-isp.c
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-params.c
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-registers.h
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-resizer-coefs.h
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-stats.c
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
>  create mode 100644 include/uapi/linux/media/arm/mali-c55-config.h

-- 
Regards,

Laurent Pinchart

