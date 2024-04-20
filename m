Return-Path: <linux-media+bounces-9811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3648ABAD7
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 11:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 937241F218AC
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 09:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E401D17735;
	Sat, 20 Apr 2024 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M3KGDdVl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5032F14F65
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713606612; cv=none; b=AxCpeXk/RK5nhrvOwdasCspRPUIue0ytNNkjDEev8VZVuSGAUriHjAMSjj/bM7+2KTGvncG1BXHy7AVsCO9bjyzRAWe6v/CndLHW8dzxe6RLnXeygoVjUZIYYkPpEx773QAMGKVgCB0j0Lwcit9Vxk8tbRtgAWMN6URCbR+5bWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713606612; c=relaxed/simple;
	bh=BwiGGiEFHhlwv4/0/hTYmkEX4okwBzoMCYtKvWf0gcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gk9oGjxwnAOe+XsWqCxz3l4WaZ6AfwpWK0kRaltTLs+Pn/n09oRMQ/1DVjtm6hnH9Ls6dyA61zLTQBYY+gF8jXLYZ2ezjQS1ZeUiMhReGAfvsDCCyvs2ufoe5+r0uPQWt//OHBioO+6tDGjQ5tj7zwkdOxmIXZitWr7ORO9mCH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M3KGDdVl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE7541A2;
	Sat, 20 Apr 2024 11:49:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713606553;
	bh=BwiGGiEFHhlwv4/0/hTYmkEX4okwBzoMCYtKvWf0gcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3KGDdVl1XsJOM3vuE5YptOyfs0rdwR4SU2GHHdm1AfSj4l9wkjI7Qa70H//Ci2IK
	 aEK9JPK+HXRiYmvruSOEWEV68T4kQTKHHwSgglA5qfU0RoOlLxDX8ks3W2qhso1WoC
	 sRy8p4tuGZBDJ1MSHf+8jnR8ZKRG4BnYv/ZzPyUg=
Date: Sat, 20 Apr 2024 12:49:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 44/46] media: v4l: Add V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
 sub-device routing flag
Message-ID: <20240420094954.GC6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-45-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-45-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:33:17PM +0300, Sakari Ailus wrote:
> Add a flag to denote immutable routes, V4L2_SUBDEV_ROUTE_FL_IMMUTABLE.
> Such routes cannot be changed and they're always active.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/userspace-api/media/v4l/dev-subdev.rst         | 4 +++-
>  .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst      | 5 +++++
>  include/uapi/linux/v4l2-subdev.h                             | 5 +++++
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index de8dfd4f11a5..5c63c8c24108 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -572,7 +572,9 @@ internal pad always has a single stream only (0).
>  Routes from an internal sink pad to an external source pad are typically not
>  modifiable but they can be activated and deactivated using the
>  :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
> -on driver capabilities.
> +on driver capabilities. The :ref:`V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
> +<v4l2-subdev-routing-flags>` flag indicates that the
> +``V4L2_SUBDEV_ROUTE_FLAG_ACTIVE`` of the route may not be unset.
>  
>  Interaction between routes, streams, formats and selections
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> index 88df7bf80b00..c0f6d49cac6d 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> @@ -150,6 +150,11 @@ Also ``VIDIOC_SUBDEV_S_ROUTING`` may return more route than the user provided in
>      * - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>        - 0x0001
>        - The route is enabled. Set by applications.
> +    * - V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
> +      - 0x0002
> +      - The route is immutable. Set by the driver. Indicates that the
> +	``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag of an immutable route may not be
> +	unset.
>  
>  Return Value
>  ============
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 6a39128d0606..c6f1228d43b1 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -204,6 +204,11 @@ struct v4l2_subdev_capability {
>   * on a video node.
>   */
>  #define V4L2_SUBDEV_ROUTE_FL_ACTIVE		(1U << 0)
> +/*
> + * Is the route immutable. The ACTIVE flag of an immutable route may not be
> + * changed.

s/changed/unset/

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + */
> +#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1U << 1)
>  
>  /**
>   * struct v4l2_subdev_route - A route inside a subdev

-- 
Regards,

Laurent Pinchart

