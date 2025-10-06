Return-Path: <linux-media+bounces-43766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1993BBCECD
	for <lists+linux-media@lfdr.de>; Mon, 06 Oct 2025 03:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0993B4E60AB
	for <lists+linux-media@lfdr.de>; Mon,  6 Oct 2025 01:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4C51A238F;
	Mon,  6 Oct 2025 01:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oanwC028"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BA379CD;
	Mon,  6 Oct 2025 01:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759713518; cv=none; b=mKsQlkxJ5cR4kSyHaMgIDB7pcKPgFu4wxrEpWcKh5amXgD/A9ynQUZn3iUdru5i3u+pQa2oKL/GgBn42kq6KwkQRCLx3JoccDfHhjLyu0jWCUydeA3EN3nR3L+N5ktAFviIPhh84lGHS6LjNPf/P6COfTMBywZpuhVozo3sDkRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759713518; c=relaxed/simple;
	bh=2Z3QGL4wAK5QOKF4a4Gd1Zf6tzhgZNVyrlQQhXpXGKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teX0wzXhL+u7ugN5l/reIahqWtXThEtAGtsdNiNpFeQrzQQL365wfrFMmtnmVoYbT7nli47m7N+RUROgxiUIlZ+yjp4XeNX5TyjKlDBT/diRPVmTdu4kE61RAhiZFgTIPj/vzRasQKgDSqlAMVAYaJBV7nX/w+JH8gv+qDE8EOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oanwC028; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F02C51741;
	Mon,  6 Oct 2025 03:17:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759713423;
	bh=2Z3QGL4wAK5QOKF4a4Gd1Zf6tzhgZNVyrlQQhXpXGKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oanwC028YZpnPsTnwkl1LQCcnvaR8MtpmUk6cIVMc6kA665gVCey2NZMxby19QMWy
	 zAFyjhFWAYeHd1rhftu7IW8AbSkPSyVRVqRGumsipm5wMMjssDv6jOhIf9gau0ml8a
	 0ScVaWyji7biGZa+E2M1dARpaXYDOONpEDjpYQUw=
Date: Mon, 6 Oct 2025 04:18:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antoine Bouyer <antoine.bouyer@nxp.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 8/8] media: Documentation: kapi: Add v4l2 generic ISP
 support
Message-ID: <20251006011829.GC29231@pendragon.ideasonboard.com>
References: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
 <20250915-extensible-parameters-validation-v5-8-e6db94468af3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250915-extensible-parameters-validation-v5-8-e6db94468af3@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, Sep 15, 2025 at 07:18:17PM +0200, Jacopo Mondi wrote:
> Add to the driver-api documentation the v4l2-isp.h types and
> helpers documentation.
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  Documentation/driver-api/media/v4l2-core.rst |  1 +
>  Documentation/driver-api/media/v4l2-isp.rst  | 37 ++++++++++++++++++++++++++++
>  MAINTAINERS                                  |  1 +
>  3 files changed, 39 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
> index ad987c34ad2a8460bb95e97adc4d850d624e0b81..a5f5102c64cca57b57b54ab95882b26286fb27de 100644
> --- a/Documentation/driver-api/media/v4l2-core.rst
> +++ b/Documentation/driver-api/media/v4l2-core.rst
> @@ -27,3 +27,4 @@ Video4Linux devices
>      v4l2-common
>      v4l2-tveeprom
>      v4l2-jpeg
> +    v4l2-isp

At what point we should structure the documentation. At one point :-)

> diff --git a/Documentation/driver-api/media/v4l2-isp.rst b/Documentation/driver-api/media/v4l2-isp.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..d778aa799347bfd0a95bd6887dd944ddad0fe4d1
> --- /dev/null
> +++ b/Documentation/driver-api/media/v4l2-isp.rst
> @@ -0,0 +1,37 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +V4L2 generic ISP parameters and statistics support
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +ISP configuration parameters and statistics are processed and collected by
> +drivers and exchanged with userspace through data types that usually
> +reflect the ISP peripheral registers layout.
> +
> +Each ISP driver defines its own metadata format for parameters and statistics,
> +and exposing the registers layout in the format definition, part of the Linux
> +kernel uAPI/uABI interface, makes it really hard, if not impossible, to extend
> +the format in a backward compatible way to support new hardware blocks or
> +different revisions of the same peripheral IP.
> +
> +For these reasons Video4Linux2 defines generic types for ISP configuration
> +parameters and statistics with a set of associated helpers to support drivers
> +and users using generic types.
> +
> +Generic ISP configuration parameters
> +====================================
> +
> +Drivers can use the generic and extensible configuration parameters format by
> +re-using the types defined in the include/uapi/linux/media/v4l2-isp.h uAPI
> +header file.
> +
> +The uAPI header defines generic types which the driver is expected to re-use and
> +provide definitions for the types of supported ISP blocks, their control
> +flags and the expected maximum size of a buffer of parameters.
> +
> +When a driver receives a buffer of parameters from userspace it shall validate
> +it by using the helper functions and types available in include/media/v4l2-isp.h
> +before accessing the buffer to apply the parameters to the hardware registers.
> +

Same comments are for the UAPI, I think this will need a full rewrite later.

> +Generic ISP support driver documentation
> +========================================
> +.. kernel-doc:: include/media/v4l2-isp.h
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5e0e4208ebe6c58a9ea0834e1ebb36abd2de06e1..b0c5e6c2b21a5d5ebc63d2ae8b5c1b68fa912b33 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26414,6 +26414,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
>  M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/driver-api/media/v4l2-isp.rst
>  F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
>  F:	drivers/media/v4l2-core/v4l2-isp.c
>  F:	include/media/v4l2-isp.h

-- 
Regards,

Laurent Pinchart

