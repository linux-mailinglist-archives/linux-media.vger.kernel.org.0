Return-Path: <linux-media+bounces-9778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5698AB43F
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 19:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEFA81F218B9
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 17:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2D01386D5;
	Fri, 19 Apr 2024 17:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T4zecm3s"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807BD77F13
	for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 17:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713547052; cv=none; b=GHKU0pPtufVlTmYf7Rosma3Y4r8cgaPJXvqSvgEu9bHW5LJsxjBtPmJedEc89s/aHoTnKG1D0BWCrBPtEUe2EKG4u2lacUWjthuDbU7d0C2EIM7xdo9fbm0BkX/UG5vw1/1hbIPxjfcsdNVso6VcgVhwiAUWJTphzJPTXjL4SIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713547052; c=relaxed/simple;
	bh=eXHuu5b9GHmNcU6LBqNSrN1PcGrRYC8w9ZjQKzlVYiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTgL4p2ur3t15drZOjp8ewxj2klyYcamcQhN+PAIajWER6QPPHGeYSADWXkpvAm5YbyBMWBM6R+4jdtkIKsMdE6zcQSHfwEt/xvycXspvA0Kphh1NC0NZBtL2wR+UaTpwFZZaJZ6dnjEEeHHvJtrr1nT8jkOKsUC/IhVoHnewxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T4zecm3s; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 989468D0;
	Fri, 19 Apr 2024 19:16:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713546999;
	bh=eXHuu5b9GHmNcU6LBqNSrN1PcGrRYC8w9ZjQKzlVYiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4zecm3sZTsZ7fz12qw9cAWkdqtpwP+aaU82AG84GUIChDVphRAOWwH5nnD6PIj/U
	 t4Pu+71+t2bHtPtm3LNv6SXhLNAr1SHUj+XUJQwfKWMPBcnM6lNEOFo+QVvE3hLRjL
	 a7AiF1RyjYRiZVFAk4AoTbx5CcZLtqBmVWLjQ8s0=
Date: Fri, 19 Apr 2024 20:17:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 11/46] media: Documentation: Document S_ROUTING
 behaviour
Message-ID: <20240419171720.GH6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-12-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-12-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:32:44PM +0300, Sakari Ailus wrote:
> Document S_ROUTING behaviour for different devices.
> 
> Generally in devices that produce streams the streams are static and some
> can be enabled and disabled, whereas in devices that just transport them
> or write them to memory, more configurability is allowed. Document this.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../userspace-api/media/v4l/dev-subdev.rst    | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index d30dcb9e2537..de8dfd4f11a5 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -593,6 +593,30 @@ Any configurations of a stream within a pad, such as format or selections,
>  are independent of similar configurations on other streams. This is
>  subject to change in the future.
>  
> +Device types and routing setup
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Different kinds of sub-devices have differing behaviour for route activation,
> +depending on the hardware. In all cases, however, only routes that have the
> +``V4L2_SUBDEV_STREAM_FL_ACTIVE`` flag set are active.
> +
> +Devices generating the streams may allow enabling and disabling some of the
> +routes or the configuration is fixed. If the routes can be disabled, not

"... some of the routes, or have a fixed routing configuration."

> +declaring the routes (or declaring them without
> +``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will
> +disable the routes while the sub-device driver retains the streams and their
> +format and selection configuration.

I still find the "retains their format and selection configuration"
quite unclear :-S

> The ``VIDIOC_SUBDEV_S_ROUTING`` will still

s/will still/ioctl will still/

> +return such routes back to the user in the routes array, with the
> +``V4L2_SUBDEV_STREAM_FL_ACTIVE`` flag unset.
> +
> +Devices transporting the streams almost always have more configurability with
> +respect to routing. Typically any route between the sub-device's sink and source
> +pads is possible, and multiple routes (usually up to certain limited number) may
> +be active simultaneously. For such devices, no routes are created by the driver
> +and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
> +called on the sub-device. Such newly created routes have the device's default
> +configuration for format and selection rectangles.
> +
>  Configuring streams
>  ^^^^^^^^^^^^^^^^^^^
>  

-- 
Regards,

Laurent Pinchart

