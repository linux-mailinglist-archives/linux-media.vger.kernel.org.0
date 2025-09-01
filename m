Return-Path: <linux-media+bounces-41478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6356B3ED67
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 19:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77193486589
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7323F3064B4;
	Mon,  1 Sep 2025 17:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ela+XRss"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543581096F
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 17:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756747972; cv=none; b=uUsz8TYcN6fLFhTW6sy1a9uVTak6IiLk8m1nntEIYD981wn2ojYoXsnW4bY/10Bdqxu5uMWfntsvJUjkN9mOVgaI26JZkAX1ZgQp4h8TZEJOZV30CTmE6svBDM8ttz7lRg5pq3NBVkYg2eMIh81jlbSSg62NeDd+6pkbBEJcBWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756747972; c=relaxed/simple;
	bh=FRN8MZUnPBbKfGthTYIoUkFbqX07gcynPzuNPF89v6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0aF6b2pB6l8PXQ/PN+l56GUTnIfyIgFN7mnW5je0wAw9LBDCfxuMJwuh4dwwJ1iu+MVG+5Pyru7guh2ywDULfxY9e51FPENs9NNL1eGDNxNhWMJaoxuuuSktjbBJ9my1m32p/mqhBFzUGAVqVHKPQ7neN4mB5ZSzePgTjLA8+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ela+XRss; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AA84E8A;
	Mon,  1 Sep 2025 19:31:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756747901;
	bh=FRN8MZUnPBbKfGthTYIoUkFbqX07gcynPzuNPF89v6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ela+XRssVGubKjRCghtAXScr3BLQ5tSsIcqzRbN0gGkQf3DnSX3zgF0wSX6hnNPjA
	 GNQSVWrlOA2ujffUn34e5frInUpmiUvfV1JBR9rBbANcCz/mA6RNoiEeO0bao0Hm6b
	 oXntk7rN8cBvRPuzBi5vGUkRvF4ZxsYN2+DBNtjg=
Date: Mon, 1 Sep 2025 19:32:44 +0200
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
Subject: Re: [PATCH v11 52/66] media: v4l: Add V4L2_SUBDEV_ROUTE_FL_STATIC
 sub-device routing flag
Message-ID: <f2lh74hfrlfx5vnj6fuslq6ra47olo6xmh2owwhh42j2wwp77k@74ojhoqmxjsi>
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

Hi Sakari

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

Mentioning "immutable" here might be confusing, but it might just be
me

Can we fast-track this and the previous one ?

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> + * unset.
> + */
> +#define V4L2_SUBDEV_ROUTE_FL_STATIC		(1U << 2)
>
>  /**
>   * struct v4l2_subdev_route - A route inside a subdev
> --
> 2.47.2
>
>

