Return-Path: <linux-media+bounces-35481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A023AE19A7
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 13:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F0435A0C7F
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 11:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBB028A400;
	Fri, 20 Jun 2025 11:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sGgyGNCx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A442528A1C2
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 11:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750417853; cv=none; b=DH/6ixjuVKA71XWuOkvTVsx6D8nkGINhrKzmfSndox3PbY7D2sZZJIUhE74zAheWud97oWGkKylZ10fdZ26PGz7uyO9m/Kd4MjHLSwTFBCUskoIX8vOJIAjenuGJ8sNEV4ZkAi3msLm97KyS667+XY3KwPa9kfg5bBUimeyzF9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750417853; c=relaxed/simple;
	bh=da8/b2wRsZNf1YXCOMF4orEpAJLH4dLJ6xz42KNT5sE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kF3AwPF+6c7Gh7fmQGIIj0O3pRyVEdz6iRTBT0rZJSMbdRT6T83HOUqYfLq3rgDxjJPg/UyyW++tCdJxsx47ti0/RfYMnoQIHoa/Pjzb8YUrUX2R7cqkf5vqfVE9rs84LiRwPCU/V21VtbTl+VO4Py+r9SF2Gwq5slRYVRMnuxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sGgyGNCx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FCB7C0B;
	Fri, 20 Jun 2025 13:10:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750417835;
	bh=da8/b2wRsZNf1YXCOMF4orEpAJLH4dLJ6xz42KNT5sE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sGgyGNCxWjyMPULzYji73ky5wwO6VPed2gitja0BOYtDa1kHPKCHGlA6exBWJEt4b
	 1j7G27qrKt2TXiOlz9sb+Q6+TFiWwU9ecb/IKU2C1sXjANH2r2fK0mv40e3C6gCppw
	 lAu1lQ5r87FFZjGUcEMUmcZ/jZnp7yRwYP2yhzZQ=
Date: Fri, 20 Jun 2025 13:10:47 +0200
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
Subject: Re: [PATCH v10 12/64] media: uapi: v4l: subdev: Enable streams API
Message-ID: <5q2j6zf4o4xyt3k3xpi4n4mbyckxkexmfho2hfmpvtpfwb35tx@hwjlkjm7krm5>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-13-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-13-sakari.ailus@linux.intel.com>

Happy to see this one!
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

On Thu, Jun 19, 2025 at 02:57:44PM +0300, Sakari Ailus wrote:
> Remove v4l2_subdev_enable_streams_api variable that was used to easily
> enable streams API for development, and conditions that use the variable.
>
> This patch enables the streams API for V4L2 sub-device interface which
> allows transporting multiple streams on a single MC link.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 30 ---------------------------
>  1 file changed, 30 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 13d6e96daf3a..30549aca9dd0 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -26,15 +26,6 @@
>  #include <media/v4l2-fh.h>
>  #include <media/v4l2-ioctl.h>
>
> -#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> -/*
> - * The Streams API is an experimental feature. To use the Streams API, set
> - * 'v4l2_subdev_enable_streams_api' to 1 below.
> - */
> -
> -static bool v4l2_subdev_enable_streams_api;
> -#endif
> -
>  /*
>   * Maximum stream ID is 63 for now, as we use u64 bitmask to represent a set
>   * of streams.
> @@ -620,13 +611,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
>  	int rval;
>
> -	/*
> -	 * If the streams API is not enabled, remove V4L2_SUBDEV_CAP_STREAMS.
> -	 * Remove this when the API is no longer experimental.
> -	 */
> -	if (!v4l2_subdev_enable_streams_api)
> -		streams_subdev = false;
> -
>  	switch (cmd) {
>  	case VIDIOC_SUBDEV_QUERYCAP: {
>  		struct v4l2_subdev_capability *cap = arg;
> @@ -980,9 +964,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		struct v4l2_subdev_routing *routing = arg;
>  		struct v4l2_subdev_krouting *krouting;
>
> -		if (!v4l2_subdev_enable_streams_api)
> -			return -ENOIOCTLCMD;
> -
>  		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>  			return -ENOIOCTLCMD;
>
> @@ -1006,9 +987,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		struct v4l2_subdev_krouting krouting = {};
>  		unsigned int i;
>
> -		if (!v4l2_subdev_enable_streams_api)
> -			return -ENOIOCTLCMD;
> -
>  		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>  			return -ENOIOCTLCMD;
>
> @@ -1086,14 +1064,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  	case VIDIOC_SUBDEV_S_CLIENT_CAP: {
>  		struct v4l2_subdev_client_capability *client_cap = arg;
>
> -		/*
> -		 * Clear V4L2_SUBDEV_CLIENT_CAP_STREAMS if streams API is not
> -		 * enabled. Remove this when streams API is no longer
> -		 * experimental.
> -		 */
> -		if (!v4l2_subdev_enable_streams_api)
> -			client_cap->capabilities &= ~V4L2_SUBDEV_CLIENT_CAP_STREAMS;
> -
>  		/* Filter out unsupported capabilities */
>  		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
>  					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
> --
> 2.39.5
>
>

