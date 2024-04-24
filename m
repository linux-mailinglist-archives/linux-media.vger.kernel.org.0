Return-Path: <linux-media+bounces-10043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F908B0E17
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 17:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 149A1281B6F
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 15:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E1715ECFA;
	Wed, 24 Apr 2024 15:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d1Xb6xx1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F011815F3E5
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972348; cv=none; b=maqIMflmJEoVnqbaPLDR35+i1sH3UCfdIp6G949yqH7J0atEDTUFOdhLtvTq/RyVwh19gQ5H8C22ZyXtblZkQUhNmuI97TSIAIUCJ2Z1ne0PA/84L6kOtFq+KyiRS0c7jKRulLN491CP/Uxkg2Irg3kNEnSonBYXme2t24z+Xvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972348; c=relaxed/simple;
	bh=04u0AHeFFom4NKvFfmW4pPpdU/kqL3VLt5K4aCoW5sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfTx+mpFTGUmDtHXm3l8fKlbGbJqQjkFq4POoIb+ROlDPnDUWtUXg40uW/MnQItGyNw0IQBfkgJwvq03RMDlcB5cOqfYhbVaX7ervzvtQ99dOLyhMMx+FFK/SzGSNdX+3qjnTbpOtNz4mk2sse6lJT4ij4/ByIFXziC1rOjKYcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d1Xb6xx1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3807674;
	Wed, 24 Apr 2024 17:24:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713972293;
	bh=04u0AHeFFom4NKvFfmW4pPpdU/kqL3VLt5K4aCoW5sA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1Xb6xx1SPbav+w3C15P32P2sKAfXWCkdCXCoC2rXaT7Rgy1WObRRSoOyNprumb05
	 iR55j5dy2YZu+mIG1sSE3/TiRsKAq7ulZDmGZHhfOHst4wysGn1kCvmn1dlxjbpCJe
	 FpZSUia6GCnbMXZB+x4YEEI03UrQuSSwaA1reDm0=
Date: Wed, 24 Apr 2024 18:25:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH 09/14] media: Documentation: Document S_ROUTING behaviour
Message-ID: <20240424152537.GA18246@pendragon.ideasonboard.com>
References: <20240424122237.875000-1-sakari.ailus@linux.intel.com>
 <20240424122237.875000-10-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240424122237.875000-10-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Apr 24, 2024 at 03:22:32PM +0300, Sakari Ailus wrote:
> Document S_ROUTING behaviour for different devices.
> 
> Generally in devices that produce streams the streams are static and some
> can be enabled and disabled, whereas in devices that just transport them
> or write them to memory, more configurability is allowed. Document this.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../userspace-api/media/v4l/dev-subdev.rst    | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index b76e02e54512..0f9eda3187f3 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -572,6 +572,29 @@ Any configurations of a stream within a pad, such as format or selections,
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
> +routes or have a fixed routing configuration. If the routes can be disabled, not
> +declaring the routes (or declaring them without
> +``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will
> +disable the routes. ``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes
> +back to the user in the routes array, with the ``V4L2_SUBDEV_STREAM_FL_ACTIVE``
> +flag unset.
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

