Return-Path: <linux-media+bounces-41424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3156B3E156
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 13:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D4E41A817BC
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 11:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFDE31194A;
	Mon,  1 Sep 2025 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VcHXuYgB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C16302CAE
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756725549; cv=none; b=VoAx7BzdnZDCBHZofIg/XjwtOCuoQrLkoDNOBUmW3dvzeRqCJxoMERh9Yy8zwTJrVUjoqYrZwRn7bCzWqM4wdO5niC5NA9HMapF1xVdzXeZq3brZfIR12eNWROZtvQJJIZZxJJNXLixts9oFPuscZuuQTlTvHaaWybWRXQN5k0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756725549; c=relaxed/simple;
	bh=j4IX20KAQTERZCn64n/o+TJ0yvCib1/rh3CYXF39KjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/QQjGuWbqlh23YFO5bGGckXoJoXZTUO5PvLLNtHT3TX5ZxDE7gsUV5Dg/cnyTjwys0sCFIzTpe3hV24r9H79Luo/W1orGdfk+dXfxONlxMB0ij7ZVspI9RxwT5jQVXNKapc5ymbsRbZlqhuf/o2q0huYCQFQZuy9ONosAjWkCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VcHXuYgB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA9B4C72;
	Mon,  1 Sep 2025 13:17:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756725476;
	bh=j4IX20KAQTERZCn64n/o+TJ0yvCib1/rh3CYXF39KjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VcHXuYgB0bOO428RehmQLrX7ti3wvZAzuVjx4B0GlmebGS0NqeMOqxzWYgww0DWF+
	 mVEgRM9fc2/qn+OH5b+mQ1kDosk1A3bJjyKUeYUX5i3e5D9BERapaxUW8qXHiR7FXn
	 ddmJEM2OcGsZ0gxHzuXIL6FrqOe5+vlTnZqeyha0=
Date: Mon, 1 Sep 2025 13:18:58 +0200
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
Subject: Re: [PATCH v11 03/66] media: Documentation: There are either
 immutable or mutable routes
Message-ID: <natrdubf73v3vfyfhsiympdnykr546ighnvcqsoddqz7s7eif3@bhgd25gvdqea>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-4-sakari.ailus@linux.intel.com>

Hi Sakari

On Mon, Aug 25, 2025 at 12:50:04PM +0300, Sakari Ailus wrote:
> Document that each sub-device may have either immutable or mutable routes,
> not both of them.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/userspace-api/media/v4l/dev-subdev.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index f30a98a9cf78..4da67ee0b290 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -594,6 +594,11 @@ and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
>  called on the sub-device. Such newly created routes have the device's default
>  configuration for format and selection rectangles.
>
> +A sub-device may only have either immutable routes (routes that have
> +``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE``) flag set or routes that are all user-created

The closing ) should go after 'flag set'

> +or user-removable (routes that do not have ``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE``
> +flag). This is subject to change in the future.

I take this as:
1) Either all routes are created by the driver and have the
  V4L2_SUBDEV_ROUTE_FL_IMMUTABLE flag set
2) Or all routes are user created (and do not have the
   V4L2_SUBDEV_ROUTE_FL_IMMUTABLE flag set)

Is this intended ? Can't we have routes that are driver created and
are immutable and routes created by the user on the same sub-device ?

> +
>  Configuring streams
>  -------------------
>
> --
> 2.47.2
>
>

