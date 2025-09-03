Return-Path: <linux-media+bounces-41680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B144B42054
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27FEE1BA66D4
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 13:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BD93019CD;
	Wed,  3 Sep 2025 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T7PbGXAB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5AC30AAAE
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 13:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904512; cv=none; b=ul/jeJNXKRMefskVfIyCU6tbIna7lMjAAj2Z5+J5BbdH5za2+NZv1854fylf08njtpMzhUuzKrWSbzVJvFPNEyReV0Gx6z6B03Pt52gjF+N+SF9IWIndtZUS0zTFZZ41U1zk4ZQ7jmgO7bDKDd21c5mMAUyT9bK87JWnM4aB1hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904512; c=relaxed/simple;
	bh=h6aIF1+CHEq+mBfZN3ZjBB90j0PrepZmYSmVkIPVYSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlA7Z0Z3ioqG9C8+PBGr/gJKEjAuw2oNHSztV97XYeZMEp8sC8PKFanJZksuYCjMX9wZAPLJ0/BwGl18WrU1AULSIPcyalmWr3aenIO7w0oge0MIORujpcR+GyDflOkOEWWvRJk4uHUlDjfvpLjh51TL3GEL/PgfUKUbclwmO1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T7PbGXAB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A39F4982;
	Wed,  3 Sep 2025 15:00:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756904440;
	bh=h6aIF1+CHEq+mBfZN3ZjBB90j0PrepZmYSmVkIPVYSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T7PbGXABFmQXqeD2J1WjcxluG/44OEQLJQa+ciG01ZAgKp8oHOnBCVrKMlMo/pBmU
	 pAZp79uDRlquU5RTW8tkZuNdGtihRkQaXsjXHqolqFMuksVtEM5JjC4rCjou4AdRn7
	 yn3qeeB8vhzn0r/0L1offJBSi3cA37O+TNwH7LkQ=
Date: Wed, 3 Sep 2025 15:01:29 +0200
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
Subject: Re: [PATCH v11 02/66] media: Documentation: Fix routing
 documentation flag references
Message-ID: <20250903130129.GD3648@pendragon.ideasonboard.com>
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart

