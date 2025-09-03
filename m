Return-Path: <linux-media+bounces-41743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE58B42C29
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 23:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9416F1C21207
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 21:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4342ECE84;
	Wed,  3 Sep 2025 21:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SndGctAV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3C62ECD14
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 21:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756936371; cv=none; b=ex58ZsSgTknqoOvkjTlseK57xukGkN5oW3JlzCorSKGqcsCJHlwrEtdl5/KqNweB5QJOM1gSndt0h71RrImXLEvjJ6Jhf/WNzBpO0s63hw+OgN1McFXPDJp4ft2A4oCzqdakawNZ7fPhJaf/5kvyzjfKV0Uhie81Ev7j7sVjZGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756936371; c=relaxed/simple;
	bh=aCf523gje0B0ppP4dNKjYaORrc5sZAz5xTw3AD7eKAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXf8ce56PEzdPZYRTd2DSYanS9hKpjWe2FdgB8UAaEX0/TeHTbQB/xmVFMoUnVMy9v/SXjznTbe2f9FBoCH3T/OmZOLWeL6DP3qhHLc2jfjAbVFyFKYzpcMrPxLXOPVzmNG1qfsmX9W7RwdYIKCSrAx7gwBGGZu8lvuNW8/9ZzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SndGctAV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4DDCC7E9;
	Wed,  3 Sep 2025 23:51:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756936297;
	bh=aCf523gje0B0ppP4dNKjYaORrc5sZAz5xTw3AD7eKAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SndGctAV0wlOln5CiXylTRWMDC1KYL7JrZOLJSN9Sm0Me5tKV4Bu7bG3UnXpTXfJ+
	 k+2xpZG4mpFpTsHgC9vmaRq8/+z+ud99XyDS9u8Na6GYWjAWYckUMowwf0+znOb1fM
	 ROXfnlK2qsSyebRSfYOiOG9WSJHNss9ZA5MsPBag=
Date: Wed, 3 Sep 2025 23:52:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 52/66] media: v4l: Add V4L2_SUBDEV_ROUTE_FL_STATIC
 sub-device routing flag
Message-ID: <20250903215224.GE3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-53-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-53-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Mon, Aug 25, 2025 at 12:50:53PM +0300, Sakari Ailus wrote:
> Add a flag to denote static routes, V4L2_SUBDEV_ROUTE_FL_STATIC. Such
> routes cannot be removed as they are related to hardware features.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst      | 5 +++++
>  include/uapi/linux/v4l2-subdev.h                             | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> index 0b90be43af57..3c7fde673b34 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> @@ -151,6 +151,11 @@ wants to retrieve the missing routes, it can issue a new
>        - The route is immutable. Set by the driver. Indicates that the
>  	``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag of an immutable route may not be
>  	unset.
> +    * - ``V4L2_SUBDEV_ROUTE_FL_STATIC``
> +      - 0x0004
> +      - The route is static. Set by the driver. Indicates that the route is
> +        always present and cannot be removed. Implies
> +        ``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE``.

It's the other way around. IMMUTABLE implies STATIC, but not all static
routes are immutable.

      - The route is static. Set by the driver. Indicates that the route is
        created by the driver and cannot be removed. Static routes may
	be immutable, or may allow userspace to enable and disable them.

I'm not fully happy with the last sentence, but "enable-able" isn't a
word :-)

>  
>  Return Value
>  ============
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 839b1329afb2..cb353fa4a4a6 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -209,6 +209,11 @@ struct v4l2_subdev_capability {
>   * unset.
>   */
>  #define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1U << 1)
> +/*
> + * Is the route static? The STATIC flag of an immutable route may not be
> + * unset.

The static flag can never be unset. We need to document this better
above. What happens if an application tries to unset it ?

> + */
> +#define V4L2_SUBDEV_ROUTE_FL_STATIC		(1U << 2)
>  
>  /**
>   * struct v4l2_subdev_route - A route inside a subdev

-- 
Regards,

Laurent Pinchart

