Return-Path: <linux-media+bounces-18341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A30697B1A3
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 16:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9099B22E8A
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 14:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B752176FA0;
	Tue, 17 Sep 2024 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oSh9vu6y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1DB535DC
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 14:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726584887; cv=none; b=IWGXdEPhIMXcgBOIEMlo1D7L+uaaTbo8G1ML7owvHx8EMxn7kQvLr/lTUU3596UulSe4mFKHClbwpG/3q3k+K6Y2aFc4SoMRFwzrrenvSiv+QjbDww8l9Dxqej6AJyoGvXvLMHVCBc4vtlQx+feAfiGIIe3IQcbiRIDtTnd9xlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726584887; c=relaxed/simple;
	bh=kBC1DQmmJLEUb7Lnac1xNRSNkCpdbQAaFQ+P5IgAntM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jlIPQZr9rWkqgfdkXrsYvr6tIvp1f1G7z0xs9DqrZaLQo5jEwYV+Iw9UDVqnAS4RBl9pgyKu9ckK0ACa8idhoyTnrKYntrOhE6IsQGGqIEehvhZM3D+Q7ktmBtida8RcHmOIwIkA4kGUDM0m++4m1QmPXg4S5UiqWjyQPhtfZns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oSh9vu6y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (62-46-121-59.adsl.highway.telekom.at [62.46.121.59])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4788514;
	Tue, 17 Sep 2024 16:53:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726584801;
	bh=kBC1DQmmJLEUb7Lnac1xNRSNkCpdbQAaFQ+P5IgAntM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oSh9vu6ybaYXDvYVYp1bvJVzQPkHPocSV1U7vVjOdIAEDVxi8yTMCEuOqzRIlF+ue
	 oC2CBiAhPDAQJBbOfpK8t7yXekHYtfV66tTdR2YeRtwqbpl6J99mFEp+hll29MXy9b
	 wc+r4ut+sZtu/gC7fNXdlQPnIu/Ud8d+u+A87tMA=
Date: Tue, 17 Sep 2024 17:54:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/2] media: Documentation: Deprecate s_stream video op,
 update docs
Message-ID: <20240917145409.GD17350@pendragon.ideasonboard.com>
References: <20240917124345.16681-1-sakari.ailus@linux.intel.com>
 <6a869a88-9fb0-43fd-99f9-9c465419e4cf@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6a869a88-9fb0-43fd-99f9-9c465419e4cf@ideasonboard.com>

On Tue, Sep 17, 2024 at 05:22:29PM +0300, Tomi Valkeinen wrote:
> On 17/09/2024 15:43, Sakari Ailus wrote:
> > The scope of the s_stream video operation is now fully supported by
> > {enable,disable}_straems. Explicitly document the s_stream() op as
> > deprecated and update the related documentation.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   Documentation/driver-api/media/camera-sensor.rst |  8 ++++----
> >   Documentation/driver-api/media/tx-rx.rst         | 11 ++++++-----
> >   include/media/v4l2-subdev.h                      |  5 +++--
> >   3 files changed, 13 insertions(+), 11 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > index b4920b34cebc..c290833165e6 100644
> > --- a/Documentation/driver-api/media/camera-sensor.rst
> > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > @@ -81,10 +81,10 @@ restart when the system is resumed. This requires coordination between the
> >   camera sensor and the rest of the camera pipeline. Bridge drivers are
> >   responsible for this coordination, and instruct camera sensors to stop and
> >   restart streaming by calling the appropriate subdev operations
> > -(``.s_stream()``, ``.enable_streams()`` or ``.disable_streams()``). Camera
> > -sensor drivers shall therefore **not** keep track of the streaming state to
> > -stop streaming in the PM suspend handler and restart it in the resume handler.
> > -Drivers should in general not implement the system PM handlers.
> > +(``.enable_streams()`` or ``.disable_streams()``). Camera sensor drivers shall
> 
> I didn't go through the docs, but I think we need to make it clear 
> somewhere that v4l2_subdev_enable_streams() and 
> v4l2_subdev_disable_streams() _must_ be used to enable/disable the 
> streaming in the source subdevice, and the related subdev callbacks must 
> not be called directly.

include/media/v4l2-subdev.h states

 * @enable_streams: Enable the streams defined in streams_mask on the given
 *      source pad. Subdevs that implement this operation must use the active
 *      state management provided by the subdev core (enabled through a call to
 *      v4l2_subdev_init_finalize() at initialization time). Do not call
 *      directly, use v4l2_subdev_enable_streams() instead.

This patch looks good to me.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Also, v4l2_subdev_enable_streams() and v4l2_subdev_disable_streams() 
> kernel doc doesn't seem to clarify that if the driver using those 
> functions does not support streams, it should use BIT_ULL(1) as the 
> streams_mask parameter.
> 
> > +therefore **not** keep track of the streaming state to stop streaming in the PM
> > +suspend handler and restart it in the resume handler. Drivers should in general
> > +not implement the system PM handlers.
> >   
> >   Camera sensor drivers shall **not** implement the subdev ``.s_power()``
> >   operation, as it is deprecated. While this operation is implemented in some
> > diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> > index 29d66a47b56e..a339df61fca8 100644
> > --- a/Documentation/driver-api/media/tx-rx.rst
> > +++ b/Documentation/driver-api/media/tx-rx.rst
> > @@ -49,11 +49,12 @@ Link frequency
> >   The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
> >   receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
> >   
> > -``.s_stream()`` callback
> > -^^^^^^^^^^^^^^^^^^^^^^^^
> > +``.enable_streams()`` and ``.disable_streams()`` callbacks
> > +^^^^^^^^^^^^^^^^^^^^^^^^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   
> > -The struct struct v4l2_subdev_video_ops->s_stream() callback is used by the
> > -receiver driver to control the transmitter driver's streaming state.
> > +The struct v4l2_subdev_pad_ops->enable_streams() and struct
> > +v4l2_subdev_pad_ops->disable_streams() callbacks are used by the receiver driver
> > +to control the transmitter driver's streaming state.
> >   
> >   
> >   CSI-2 transmitter drivers
> > @@ -127,7 +128,7 @@ Stopping the transmitter
> >   ^^^^^^^^^^^^^^^^^^^^^^^^
> >   
> >   A transmitter stops sending the stream of images as a result of
> > -calling the ``.s_stream()`` callback. Some transmitters may stop the
> > +calling the ``.disable_streams()`` callback. Some transmitters may stop the
> >   stream at a frame boundary whereas others stop immediately,
> >   effectively leaving the current frame unfinished. The receiver driver
> >   should not make assumptions either way, but function properly in both
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 8daa0929865c..3cc6b4a5935f 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -450,8 +450,9 @@ enum v4l2_subdev_pre_streamon_flags {
> >    *	already started or stopped subdev. Also see call_s_stream wrapper in
> >    *	v4l2-subdev.c.
> >    *
> > - *	New drivers should instead implement &v4l2_subdev_pad_ops.enable_streams
> > - *	and &v4l2_subdev_pad_ops.disable_streams operations, and use
> > + *	This callback is DEPRECATED. New drivers should instead implement
> > + *	&v4l2_subdev_pad_ops.enable_streams and
> > + *	&v4l2_subdev_pad_ops.disable_streams operations, and use
> >    *	v4l2_subdev_s_stream_helper for the &v4l2_subdev_video_ops.s_stream
> >    *	operation to support legacy users.
> >    *

-- 
Regards,

Laurent Pinchart

