Return-Path: <linux-media+bounces-4524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9E384465F
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 18:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C99BB1F22111
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 17:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB20B12DDB3;
	Wed, 31 Jan 2024 17:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PmdKciS+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDD712DD8D;
	Wed, 31 Jan 2024 17:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706723040; cv=none; b=H+zZAoUfcoXyQ7L3ofY8GxwcSISkFoA0zA5BBMX8HYGu+SLRmK1x51yDsCDBnRcdGM/2RxL06KY9rLIR2t2+4mvX2ORx00bmKGcJcjBAOfU0rrHhz4qI33LgG2n1J09ERtw5j1nGNLGb/k+hPari3UQc6DgSGI1imR/r+vuENes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706723040; c=relaxed/simple;
	bh=5Rp1YLeuMWPJLWorStm4H0bHZvVJW3aCJ5HQghjrIME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6DaU1wsmg0yQzz6uR0KfF5L6g1XJ+pADgH/RUp/SQ0KWe9e98a7esykUbRVsIPN30GAvzj5s2HTMm9xnfOhJdFXfDEcM5w8D+xY5gyJUQOGmTXPlFA5Mwkj1sHUd/ry0i8pJnh0JXpop0iTL3bsal+yqIso1YLj+Pdt76jbAe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PmdKciS+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [94.107.229.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 313C0650D;
	Wed, 31 Jan 2024 18:42:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706722957;
	bh=5Rp1YLeuMWPJLWorStm4H0bHZvVJW3aCJ5HQghjrIME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PmdKciS+iPr+x4efC+JceOCWt5XXbaEfYPl09SkG6+0heJtzB2v5MbHbYFAr7bBly
	 v9UoKOdvqdFt0HiY7YeHWsOY0pk5qA0+HXre3ARQdulhU9Xuv7kmrf6Y5WV1pqxbsP
	 1kj1/42tvu1iq8AUFlDIF2mRScyjscwbDDmNBKfA=
Date: Wed, 31 Jan 2024 19:43:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 0/5] Add Arm Mali-C55 Image Signal Processor Driver
Message-ID: <20240131174355.GB20792@pendragon.ideasonboard.com>
References: <20240131164709.810587-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240131164709.810587-1-dan.scally@ideasonboard.com>

On Wed, Jan 31, 2024 at 04:47:04PM +0000, Daniel Scally wrote:
> Hello all
> 
> This patchset introduces a driver for Arm's Mali-C55 Image Signal Processor.
> The driver uses the media controller API and in this initial support implements
> both of the ISP's capture pipelines allowing a range of output formats plus
> downscaling and cropping. The capture pipelines are named "Full resolution" and
> "Downscale" and so abbreviated FR and DS throughout the driver.
> 
> The driver exposes 4 V4L2 subdevices:
> 
> - mali-c55 isp: input data formatting
> - mali-c55 tpg: test pattern generator (modeled as a camera sensor entity)
> - mali-c55 resizer fr: downscale / crop and format setting for the FR pipe
> - mali-c55 resizer ds: downscale / crop and format setting for the DS pipe

Answering a question I've received out-of-band: the driver doesn't
support ISP statistics and parameters yet. Active work is in progress in
that area, so one option would be to merge this driver in staging in the
meantime.

> Daniel Scally (5):
>   media: uapi: Add MEDIA_BUS_FMT_RGB202020_1X60 format code
>   dt-bindings: media: Add bindings for ARM mali-c55
>   media: mali-c55: Add Mali-C55 ISP driver
>   media: Documentation: Add Mali-C55 ISP Documentation
>   MAINTAINERS: Add entry for mali-c55 driver
> 
>  .../admin-guide/media/mali-c55-graph.dot      |   19 +
>  Documentation/admin-guide/media/mali-c55.rst  |  318 ++++++
>  .../admin-guide/media/v4l-drivers.rst         |    1 +
>  .../bindings/media/arm,mali-c55.yaml          |   51 +
>  .../media/v4l/subdev-formats.rst              |  168 +++
>  MAINTAINERS                                   |   10 +
>  drivers/media/platform/Kconfig                |    1 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/arm/Kconfig            |    5 +
>  drivers/media/platform/arm/Makefile           |    2 +
>  drivers/media/platform/arm/mali-c55/Kconfig   |   18 +
>  drivers/media/platform/arm/mali-c55/Makefile  |    9 +
>  .../platform/arm/mali-c55/mali-c55-capture.c  | 1013 +++++++++++++++++
>  .../platform/arm/mali-c55/mali-c55-common.h   |  263 +++++
>  .../platform/arm/mali-c55/mali-c55-core.c     |  717 ++++++++++++
>  .../platform/arm/mali-c55/mali-c55-isp.c      |  682 +++++++++++
>  .../arm/mali-c55/mali-c55-registers.h         |  180 +++
>  .../arm/mali-c55/mali-c55-resizer-coefs.h     |  382 +++++++
>  .../platform/arm/mali-c55/mali-c55-resizer.c  |  678 +++++++++++
>  .../platform/arm/mali-c55/mali-c55-tpg.c      |  425 +++++++
>  include/uapi/linux/media-bus-format.h         |    3 +-
>  21 files changed, 4945 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/admin-guide/media/mali-c55-graph.dot
>  create mode 100644 Documentation/admin-guide/media/mali-c55.rst
>  create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml
>  create mode 100644 drivers/media/platform/arm/Kconfig
>  create mode 100644 drivers/media/platform/arm/Makefile
>  create mode 100644 drivers/media/platform/arm/mali-c55/Kconfig
>  create mode 100644 drivers/media/platform/arm/mali-c55/Makefile
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-capture.c
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-common.h
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-core.c
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-isp.c
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-registers.h
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-resizer-coefs.h
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
>  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-tpg.c

-- 
Regards,

Laurent Pinchart

