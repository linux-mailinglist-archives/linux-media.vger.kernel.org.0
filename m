Return-Path: <linux-media+bounces-12189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F00A68D3E2B
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 20:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95A6A281B89
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 18:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEDE15CD56;
	Wed, 29 May 2024 18:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kHJYfeqT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADBADDA1;
	Wed, 29 May 2024 18:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717006514; cv=none; b=X25Veue2AetNQFTTUTpXLoOza4UKN3i91pVJKMvlLMsQ05NGeCa8e6a8ipTIHSnmLd9XAAen9HBkHdG4NZGGuS1EW83ZK2kyy3uyAOBRY4DGQZQ21d7j6MooaqBDy6BXYGkpjtwVyFQfQmXyDyIcawg5fGMUcp5+T3h1jqM0lRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717006514; c=relaxed/simple;
	bh=KW3tC/eVtpr9y5DkPXDrxg4ZHjgcWjKUM64ZfGeQpfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2oMgLZh2HdLRQZUGpNjkMVt92uIh8ydtJbEONxSuB4X1sv7yP6FMtvAvDwxab/mKgrpI3JjHtNn2HYJWRixSRbTtryEctl2IfHh4egyp49AvtdTJmJBdnSeywxseLzOQILqZDsp8az4VbYG2nH+7ddRC2+wqNiFtVmgkqlhESA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kHJYfeqT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 708722D54;
	Wed, 29 May 2024 20:15:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717006505;
	bh=KW3tC/eVtpr9y5DkPXDrxg4ZHjgcWjKUM64ZfGeQpfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kHJYfeqTYzNlDS4lqw8IrnvK5zom2gF+2APMIdZex6RLSS1T5vgrgPQk+qoaK4L7f
	 X1esPk77ZvdfewZOI3gQJycIbBOw0CwLmAl3jQBau37hNLTd/SDoaO6R2GWfgPOYcI
	 T4MZ/fkw995nlYLU46Fme8OMZ/w3cp0dBG054+Jw=
Date: Wed, 29 May 2024 21:14:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v5 01/16] media: uapi: Add MEDIA_BUS_FMT_RGB202020_1X60
 format code
Message-ID: <20240529181456.GA10586@pendragon.ideasonboard.com>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-2-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240529152858.183799-2-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Wed, May 29, 2024 at 04:28:43PM +0100, Daniel Scally wrote:
> The Mali-C55 ISP by ARM requires 20-bits per colour channel input on
> the bus. Add a new media bus format code to represent it.
> 
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v5:
> 
> 	- none
> 
> Changes in v4:
> 
> 	- None
> 
> Changes in v3:
> 
> 	- None
> 
> Changes in v2:
> 
> 	- none
>  .../media/v4l/subdev-formats.rst              | 168 ++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         |   3 +-
>  2 files changed, 170 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index d2a6cd2e1eb2..8d164a9a9e15 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -2224,6 +2224,174 @@ The following table list existing packed 48bit wide RGB formats.
>  
>      \endgroup
>  
> +The following table list existing packed 60bit wide RGB formats.
> +
> +.. tabularcolumns:: |p{4.0cm}|p{0.7cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|

Maybe one day we should try to make those tables more compact.

> +
> +.. _v4l2-mbus-pixelcode-rgb-60:
> +
> +.. raw:: latex
> +
> +    \begingroup
> +    \tiny
> +    \setlength{\tabcolsep}{2pt}
> +
> +.. flat-table:: 60bit RGB formats
> +    :header-rows:  3
> +    :stub-columns: 0
> +    :widths: 36 7 3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
> +
> +    * - Identifier
> +      - Code
> +      -
> +      - :cspan:`31` Data organization
> +    * -
> +      -
> +      - Bit
> +      -
> +      -
> +      -
> +      -
> +      - 59
> +      - 58
> +      - 57
> +      - 56
> +      - 55
> +      - 54
> +      - 53
> +      - 52
> +      - 51
> +      - 50
> +      - 49
> +      - 48
> +      - 47
> +      - 46
> +      - 45
> +      - 44
> +      - 43
> +      - 42
> +      - 41
> +      - 40
> +      - 39
> +      - 38
> +      - 37
> +      - 36
> +      - 35
> +      - 34
> +      - 33
> +      - 32
> +    * -
> +      -
> +      -
> +      - 31
> +      - 30
> +      - 29
> +      - 28
> +      - 27
> +      - 26
> +      - 25
> +      - 24
> +      - 23
> +      - 22
> +      - 21
> +      - 20
> +      - 19
> +      - 18
> +      - 17
> +      - 16
> +      - 15
> +      - 14
> +      - 13
> +      - 12
> +      - 11
> +      - 10
> +      - 9
> +      - 8
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +    * .. _MEDIA-BUS-FMT-RGB202020-1X60:
> +
> +      - MEDIA_BUS_FMT_RGB202020_1X60
> +      - 0x1026
> +      -
> +      -
> +      -
> +      -
> +      -
> +      - r\ :sub:`19`
> +      - r\ :sub:`18`
> +      - r\ :sub:`17`
> +      - r\ :sub:`16`
> +      - r\ :sub:`15`
> +      - r\ :sub:`14`
> +      - r\ :sub:`13`
> +      - r\ :sub:`12`
> +      - r\ :sub:`11`
> +      - r\ :sub:`10`
> +      - r\ :sub:`8`

I was thinking that reviews of this kind of patches were tedious and not
very useful, and then I found this mistake :-D With that fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +      - r\ :sub:`8`
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`19`
> +      - g\ :sub:`18`
> +      - g\ :sub:`17`
> +      - g\ :sub:`16`
> +      - g\ :sub:`15`
> +      - g\ :sub:`14`
> +      - g\ :sub:`13`
> +      - g\ :sub:`12`
> +    * -
> +      -
> +      -
> +      - g\ :sub:`11`
> +      - g\ :sub:`10`
> +      - g\ :sub:`9`
> +      - g\ :sub:`8`
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`19`
> +      - b\ :sub:`18`
> +      - b\ :sub:`17`
> +      - b\ :sub:`16`
> +      - b\ :sub:`15`
> +      - b\ :sub:`14`
> +      - b\ :sub:`13`
> +      - b\ :sub:`12`
> +      - b\ :sub:`11`
> +      - b\ :sub:`10`
> +      - b\ :sub:`9`
> +      - b\ :sub:`8`
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +.. raw:: latex
> +
> +    \endgroup
> +
>  On LVDS buses, usually each sample is transferred serialized in seven
>  time slots per pixel clock, on three (18-bit) or four (24-bit)
>  differential data pairs at the same time. The remaining bits are used
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index d4c1d991014b..49be328d9a3b 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -34,7 +34,7 @@
>  
>  #define MEDIA_BUS_FMT_FIXED			0x0001
>  
> -/* RGB - next is	0x1026 */
> +/* RGB - next is	0x1027 */
>  #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
> @@ -72,6 +72,7 @@
>  #define MEDIA_BUS_FMT_RGB888_1X36_CPADLO	0x1021
>  #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
>  #define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
> +#define MEDIA_BUS_FMT_RGB202020_1X60		0x1026
>  
>  /* YUV (including grey) - next is	0x202f */
>  #define MEDIA_BUS_FMT_Y8_1X8			0x2001

-- 
Regards,

Laurent Pinchart

