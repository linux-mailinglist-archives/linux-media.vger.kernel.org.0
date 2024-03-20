Return-Path: <linux-media+bounces-7346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 307AB880891
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 01:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 549F01C2282D
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 00:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63E1A32;
	Wed, 20 Mar 2024 00:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KpXGv9Rn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BE7629
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 00:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710894803; cv=none; b=bFDo+Gng4rYgP3AS5PDxOynQX7Kb/5nIsfwrtrgo/8gslFRrG6hb9DGmkEU9+eqDdQcmCGwIm/YJMAoXv3Mbfo8EUw/2IuANw6Lw7lEXpzCq4dx/oGQW4J3xY9H4KYgo0rPiGQe+lTEiAk1kB03pIOwbiW1vjgklWMLrBz1Tg4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710894803; c=relaxed/simple;
	bh=Od+NKr4vqLX9pL3zvXkJE+cbpiwHshMplTqXjK0uPxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZbw7Ta027LKf+1HhHscV4SpmhhD3+eAs4JgTtkIu/fOrkJSPLb1AgJX1DShd/Vp0KZiUnRHO2+w5Lh8AL8hVBwT8ura8/kSuYDrA1/SCGyZ40JgpCiIjEWXHLMZlFCw6XX3VAHpTUQXtBaRoHepAhaQ7JrhRpzLOnQ+LJPa0JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KpXGv9Rn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3632FB1;
	Wed, 20 Mar 2024 01:32:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710894772;
	bh=Od+NKr4vqLX9pL3zvXkJE+cbpiwHshMplTqXjK0uPxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KpXGv9Rnj4//rbHWLT2g573VVlrALMiMOai/kToo5+TIIjN1Rt1pNG++kPNt96YNo
	 nmvLFJQX8cdPWNuhIx8nNAmWvuq1khEzoLB88CKYY3iF7rGlnoe18kxXyWgsr6j19d
	 tNW8vIX1K2cb8X3zAL7lk+McrIid4vtOOq7pdy0g=
Date: Wed, 20 Mar 2024 02:33:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 10/38] media: Documentation: Document S_ROUTING
 behaviour
Message-ID: <20240320003316.GO8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-11-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-11-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:24:48AM +0200, Sakari Ailus wrote:
> Document S_ROUTING behaviour for different devices.
> 
> Generally in devices that produce streams the streams are static and some
> can be enabled and disabled, whereas in devices that just transport them
> or write them to memory, more configurability is allowed. Document this.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/dev-subdev.rst    | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index 1808f40f63e3..08495cc6f4a6 100644
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
> +declaring the routes (or declaring them without
> +``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will
> +disable the routes while the sub-device driver retains the streams and their

No idea what you mean by "retains the streams and their configuration".

> +configuration. The ``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes
> +back to the user in the routes array, with the ``V4L2_SUBDEV_STREAM_FL_ACTIVE``
> +flag unset.

I find this quite confusing. There's no explanation as to why the API
behaves this way. I think you should rewrite this documentation, trying
to evaluate it from the point of view of someone who doesn't know about
the routing API.

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

