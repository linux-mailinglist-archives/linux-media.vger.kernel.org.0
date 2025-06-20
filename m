Return-Path: <linux-media+bounces-35478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AEDAE183A
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 11:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2788D1BC3EF8
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 09:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D1523371B;
	Fri, 20 Jun 2025 09:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q25ZY5K0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A585C27FB2E
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 09:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412979; cv=none; b=XVBNTY3ZNZ0VoO1WtR7vkme8aWutVCColwePJrx1d5jQKQu5d0yXJw4YH4s2wnmbiQFkgVlpTOV3Q3vr5t0GOKztjmvkCqE+z2oXdpDvGTApZfBJAUoNcTvxNK63aZ39BOztZ0UXBzsxkMyuyxaMR1+6Xml+UHrFeNsiSBVXTpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412979; c=relaxed/simple;
	bh=e/cuJAUe6pLcjHJUzuJoeFSFJE9ErnE9WytnBjRBRug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyS4OC6MCBg5VmwG6/JvGaik0X+YKSx3KAsl4GksCXVjeVNhlUTHGUGRiixQZYCWjaSmEzigozmqGBKWQrLeag+AWtTpFTxlUsUM/XHEXKegMUFBPS9yDcCP7NUc8J633DBt1VzwA+ch1C5sqdnyMsg8V/gGg61kwxTDQR4H6e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q25ZY5K0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B91FC0B;
	Fri, 20 Jun 2025 11:49:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750412959;
	bh=e/cuJAUe6pLcjHJUzuJoeFSFJE9ErnE9WytnBjRBRug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q25ZY5K066q4wVxYpizHjuU+ML0K0rjD5ObIcq1IRdG52uHvShel/55E36lwSFTrr
	 IOuXqjr74Nv7LXg5JexsiI6C4K0RqfMmSXkxEylpta73PvK/QzD6ZsCWLVN2OPnUjq
	 DG0ZodUHSqDzopvWOIwKzUn4XsfQMAuIL/5GsYL8=
Date: Fri, 20 Jun 2025 11:49:30 +0200
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
Subject: Re: [PATCH v10 02/64] media: Documentation: Move streams
 documentation one level up
Message-ID: <q4tprwwshwrwceyjh35chjkalkd5e6jjutjpeoxj6qt7xtto4y@g24h6zibzmlo>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-3-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:57:34PM +0300, Sakari Ailus wrote:
> While streams can be found within pads, they do deserve their own
> documentation section on the same level than pads. Move them one level up.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Agreed
4.13.3. Pad-level Formats
4.13.4. Streams, multiplexed media pads and internal routing

looks nicer

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  Documentation/userspace-api/media/v4l/dev-subdev.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index 161b43f1ce66..225a45fef994 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -509,7 +509,7 @@ source pads.
>  .. _subdev-routing:
>
>  Streams, multiplexed media pads and internal routing
> -----------------------------------------------------
> +====================================================
>
>  Simple V4L2 sub-devices do not support multiple, unrelated video streams,
>  and only a single stream can pass through a media link and a media pad.
> @@ -534,7 +534,7 @@ does not support streams, then only stream 0 of source end may be captured.
>  There may be additional limitations specific to the sink device.
>
>  Understanding streams
> -^^^^^^^^^^^^^^^^^^^^^
> +---------------------
>
>  A stream is a stream of content (e.g. pixel data or metadata) flowing through
>  the media pipeline from a source (e.g. a sensor) towards the final sink (e.g. a
> @@ -554,7 +554,7 @@ sub-device and a (pad, stream) pair. For sub-devices that do not support
>  multiplexed streams the 'stream' field is always 0.
>
>  Interaction between routes, streams, formats and selections
> -^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +-----------------------------------------------------------
>
>  The addition of streams to the V4L2 sub-device interface moves the sub-device
>  formats and selections from pads to (pad, stream) pairs. Besides the
> @@ -573,7 +573,7 @@ are independent of similar configurations on other streams. This is
>  subject to change in the future.
>
>  Device types and routing setup
> -^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +------------------------------
>
>  Different kinds of sub-devices have differing behaviour for route activation,
>  depending on the hardware. In all cases, however, only routes that have the
> @@ -596,7 +596,7 @@ called on the sub-device. Such newly created routes have the device's default
>  configuration for format and selection rectangles.
>
>  Configuring streams
> -^^^^^^^^^^^^^^^^^^^
> +-------------------
>
>  The configuration of the streams is done individually for each sub-device and
>  the validity of the streams between sub-devices is validated when the pipeline
> @@ -619,7 +619,7 @@ There are three steps in configuring the streams:
>     :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
>
>  Multiplexed streams setup example
> -^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +---------------------------------
>
>  A simple example of a multiplexed stream setup might be as follows:
>
> --
> 2.39.5
>
>

