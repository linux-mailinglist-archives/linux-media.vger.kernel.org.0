Return-Path: <linux-media+bounces-41422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBA2B3E13C
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 13:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEA2B3A7638
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 11:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91ABE2D6E5B;
	Mon,  1 Sep 2025 11:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="unTPb5Nx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F59A3F9C5
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 11:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756725257; cv=none; b=H26OyQyroR0AFFsxvqkFuM4657QGV3I9uQtn9qo8gGKIt1WXWdrjveaiZ883bA6862G+GyTyzHD72aiSdWSRunbjgHu5ZrAoTeV/KWjv+8ADGNaXLJW2hc1/3tSg08KPtYa6m/JpprSnpDzakRjvMUmUWwNNEoSHmG3wYaWQCp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756725257; c=relaxed/simple;
	bh=q/zMD8ld+Dbtl2MW16ujCAnY+/sChT4/1rt6nX5WBvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7gsat+r1C8otda1jak8NwaPULJznHRAu5BNih2rD7ZQiVjEzyufghzKZTnpL6apV6GS72prJ/k6fn+IhAIWXAdkIcRPjNeQLfp/p6M30Cyc3nxd/KEkn9ma2GlZqBD5/wR7F0+D6CsT+Fb+tbPPqEbfTtJm69GzTYJQhiRbwsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=unTPb5Nx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 944B9F52;
	Mon,  1 Sep 2025 13:13:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756725184;
	bh=q/zMD8ld+Dbtl2MW16ujCAnY+/sChT4/1rt6nX5WBvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=unTPb5Nxd8uyx45uz7BVaZ5CdsU3rA6iuAMXDVcqy5lHvZo/0byCPg1AT2sP7nU5K
	 CikC4s4p3ryLqCesT8LIEuhX3vkPyIt6LFQbqaB0EmUbli8CnUHV63KTYa4RZ9rEoI
	 NUyUY46l2s7f036DptVK+KFfzX7atttxwfSCaibE=
Date: Mon, 1 Sep 2025 13:14:07 +0200
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
Subject: Re: [PATCH v11 02/66] media: Documentation: Fix routing
 documentation flag references
Message-ID: <rrbxv6fiexnrblg4c4smaunb55rzopj52ser5ocvgn4poftjpe@e7rqq5ecjq5b>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-3-sakari.ailus@linux.intel.com>

Hi Sakari,

On Mon, Aug 25, 2025 at 12:50:03PM +0300, Sakari Ailus wrote:
> The routing flag indicating an active route is called
> V4L2_SUBDEV_ROUTE_FL_ACTIVE, not V4L2_SUBDEV_STREAM_FL_ACTIVE. Fix this.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>


> ---
>  Documentation/userspace-api/media/v4l/dev-subdev.rst | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index 24a69c419dfe..f30a98a9cf78 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -577,15 +577,14 @@ Device types and routing setup
>
>  Different kinds of sub-devices have differing behaviour for route activation,
>  depending on the hardware. In all cases, however, only routes that have the
> -``V4L2_SUBDEV_STREAM_FL_ACTIVE`` flag set are active.
> +``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag set are active.
>
>  Devices generating the streams may allow enabling and disabling some of the
>  routes or have a fixed routing configuration. If the routes can be disabled, not
> -declaring the routes (or declaring them without
> -``V4L2_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will
> -disable the routes. ``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes
> -back to the user in the routes array, with the ``V4L2_SUBDEV_STREAM_FL_ACTIVE``
> -flag unset.
> +declaring the routes (or declaring them without ``V4L2_SUBDEV_ROUTE_FL_ACTIVE``
> +flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will disable the routes.
> +``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes back to the user in
> +the routes array, with the ``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag unset.
>
>  Devices transporting the streams almost always have more configurability with
>  respect to routing. Typically any route between the sub-device's sink and source
> --
> 2.47.2
>
>

