Return-Path: <linux-media+bounces-41479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC50B3ED6B
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 19:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B987204F19
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01633320A05;
	Mon,  1 Sep 2025 17:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XOEnn10y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071582EC0A4
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 17:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756748140; cv=none; b=lIS0Vr3PhQts7VHSfX29CoOmcwP21cpohHHD11Wrrtpkxkix9pO52b4/7LXFCC2XIfOwtyW3YktUtzHxYzMoQepZxta9T1cUEs+FnUltjM25LdNdd/Eb76pHBagpNU/KI0ILldTN0Xx9t1ZtP/FiZBSTQV0WTmmawjuvrwzPPX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756748140; c=relaxed/simple;
	bh=JfS4RTv5mtgyvT058SR9/hOKHmZqCPdi47JJaqb6Whs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0pvpCZwwgvuICux1izgRm131gHk3wZJqx+qXpf2QcoJNJ9IFotcJMWjCVn0pXAbrn4eR/Su11lx9/Bx9w2sxMMtqMRVrQbkm6YHPGkHbFqf0kuFdib8cUrJuzo7tBE97JIHCPUo0Pi3J+TCgnFI33IDXnWn42Oocjll71x4aQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XOEnn10y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C93F9D80;
	Mon,  1 Sep 2025 19:34:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756748070;
	bh=JfS4RTv5mtgyvT058SR9/hOKHmZqCPdi47JJaqb6Whs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XOEnn10yEFG7bzpW4N9Tz+RY8CqFzp0JRu3l7Fi1FZCMDVIBuJgG+OEqM+zgBX/QQ
	 7O8+gviLuOXPbZ+K/SNwgJlJL665wMnhUZqPz+C0iR8FMQps9NCUx46aLa1ArDVldY
	 ZipHnJRGDyFFoW/YeCneDFU6r2rZCJHfn0OPgRiI=
Date: Mon, 1 Sep 2025 19:35:31 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 53/66] media: Documentation: Document IMMUTABLE and
 STATIC route flags
Message-ID: <vtphduwp7o2ehbovg5op2ow3bh3y2akyti7iujd3h6pmhx7cw7@vwrpq44nyc2f>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-54-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-54-sakari.ailus@linux.intel.com>

Hi Sakari

On Mon, Aug 25, 2025 at 12:50:54PM +0300, Sakari Ailus wrote:
> Include the V4L2_SUBDEV_ROUTE_FL_IMMUTABLE and V4L2_SUBDEV_ROUTE_FL_STATIC
> flags in V4L2 sub-device documentation that discusses routing.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/userspace-api/media/v4l/dev-subdev.rst | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index 684ef0844517..2e94e00978c0 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -603,11 +603,14 @@ depending on the hardware. In all cases, however, only routes that have the
>  ``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag set are active.
>
>  Devices generating the streams may allow enabling and disabling some of the
> -routes or have a fixed routing configuration. If the routes can be disabled, not
> +routes or have a fixed routing configuration. Such routes that are directly tied

s/Such routes/Routes

> +to hardware resources are marked with ``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE`` route
   to hardware resources and cannot be disabled by userspace are ...

> +flag. Routes that are always present but can be disabled are marked with
> +``V4L2_SUBDEV_ROUTE_FL_STATIC`` flag. Static routes can be disabled by not
>  declaring the routes (or declaring them without ``V4L2_SUBDEV_ROUTE_FL_ACTIVE``
> -flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will disable the routes.
> -``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes back to the user in
> -the routes array, with the ``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag unset.
> +flag set) in ``VIDIOC_SUBDEV_S_ROUTING``. ``VIDIOC_SUBDEV_S_ROUTING`` will still
> +return such routes back to the user in the routes array, with the
> +``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag unset.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

This can be fast-tracked along with the previous two patches I guess

>
>  Devices transporting the streams almost always have more configurability with
>  respect to routing. Typically any route between the sub-device's sink and source
> --
> 2.47.2
>
>

