Return-Path: <linux-media+bounces-37513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2B1B01DFC
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 15:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD1ED17CDC8
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 13:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5325A2D837E;
	Fri, 11 Jul 2025 13:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QOnXb9TD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D412D3751;
	Fri, 11 Jul 2025 13:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752241176; cv=none; b=LNDIxi5dpyTeZOJvT+Lh3ft72VvNYEoTkqflFs4mNF/GZzigxwvZMG8kpe702/IFh2lTvxG+5e+BGeGjLMsu/AyXoPcC5na+9erj0hp963ecf4zOjNV0me4xQti0RLBo0Ryf+MHTgFodZR6eiRtVfHuybF7/BrQ9CibYdZFO4B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752241176; c=relaxed/simple;
	bh=q1JqdTok8X8oNIvfUjWUzoWNeqgjwViXYptXn+8AQMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V780MhOhMXqw5zIhGVsCcdtx3PMbYhU9IYwMFkJeFnmggT0fjCKFYUzGvUaCWCW/v7Oduu69imUnu7/HAeKgAOOQN5VjMCSPoLiRXZuOu6U9yoM2l+014eRfifUOjzPJCgRAcVsqnPv9JSIT9Dnu4esUJu0VaBezX8s0fuVmGWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QOnXb9TD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-137-205.net.vodafone.it [5.90.137.205])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB627D77;
	Fri, 11 Jul 2025 15:39:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752241143;
	bh=q1JqdTok8X8oNIvfUjWUzoWNeqgjwViXYptXn+8AQMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QOnXb9TDu4MvgTAa/zxWi7HXV/BvhamGnQEYDC8BK3MXc6/mkBw1m58oi4RhQxZt/
	 WDqDxnFejfpcucB45M0aKj7q25SRX9Xumm3lPcNkjgIlAUK+nPGn1OPg4lyxkkWrDk
	 o0TAulTYQHbRmY0CpCVcNSvuq1zidzK4oATohyBA=
Date: Fri, 11 Jul 2025 15:39:26 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 2/5] media: v4l2-dev: Add helpers to run
 media_pipeline_[started|stopped]()
Message-ID: <hb73r4nu2n3ganodzpbpg2tn7c45ye2otzzc4une2x3tskuba7@dgfc2wf4vprh>
References: <20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com>
 <20250704-ivc-v3-2-5c45d936ef2e@ideasonboard.com>
 <v3gonywym2km6u4qpsm2bkpn5n7vmvm4rdt3nfiws6mri3b7y4@gh4q5f4cmavc>
 <436bbb33-0740-4ef8-8297-a06aa8243cfd@ideasonboard.com>
 <54c94bcf-9b68-4fe7-a84d-fed665b362a3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54c94bcf-9b68-4fe7-a84d-fed665b362a3@ideasonboard.com>

Hi Dan

On Fri, Jul 11, 2025 at 01:43:16PM +0100, Dan Scally wrote:
>
> On 11/07/2025 12:51, Dan Scally wrote:
> > Hi Jacopo - thanks for the comments
> >
> > On 08/07/2025 14:10, Jacopo Mondi wrote:
> > > Hi Dan
> > >
> > > On Fri, Jul 04, 2025 at 12:20:19PM +0100, Daniel Scally wrote:
> > > > Add helpers to run the new media_pipeline_started() and
> > > > media_pipeline_stopped() functions. The helpers iterate over the
> > > > entities in the pipeline and count the number of video devices and
> > > > compare that to the pipeline's start_count() before acting. This
> > > > allows us to only run the media pipeline callbacks in the event that
> > > > the pipeline has had video_pipeline_start() called for each video
> > > > device.
> > > >
> > > > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > > >
> > > > ---
> > > >
> > > > We could take this further perhaps and include the equivalent routine
> > > > in video_device_pipeline[_alloc]_start()...if none of the entities
> > > > involved have .pipeline_started() or .pipeline_stopped() operations it
> > > > should be harmless, but I'm a bit reluctant to force the choice to run
> > > > those operations on users.
> > > I know I've kind of suggested that, but after all I don't think it's a
> > > very good idea, having this in two steps is probably better. And I
> > > like the fact the v4l2-dev layer operates on the video device counting
> > > and only relies on the mc layer for the callbacks notification.
> >
> >
> > Yeah me too. Let's stick to this
> >
> > >
> > > > Changes in v2:
> > > >
> > > >     - Adapted now media_pipeline_for_each_entity() takes an iter
> > > >       variable
> > > >     - Fixed the Return: section of the kerneldoc comments
> > > > ---
> > > >   drivers/media/v4l2-core/v4l2-dev.c | 57 ++++++++++++++++++++++++++++++++++++++
> > > >   include/media/v4l2-dev.h           | 36 ++++++++++++++++++++++++
> > > >   2 files changed, 93 insertions(+)
> > > >
> > > > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > > > index c369235113d98ae26c30a1aa386e7d60d541a66e..f3309f8349664f7296a95216a40dd9d9baae8d9e 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > > > @@ -1200,6 +1200,63 @@ struct media_pipeline *video_device_pipeline(struct video_device *vdev)
> > > >   }
> > > >   EXPORT_SYMBOL_GPL(video_device_pipeline);
> > > >
> > > > +static int __video_device_pipeline_started(struct media_pipeline *pipe)
> > > __function_name() is usually reserved for the non-locking version of
> > > function_name().
> > >
> > > This seems to be an helper only used internally by
> > > video_device_pipeline_started() so I would use a different name
> > > something like video_device_has_pipeline_started() ?
> >
> >
> > What it does is count the number of _unstarted_ video
> > devices..."video_device_pipeline_unstarted_vdevs()"?
> >
> > >
> > >
> > > > +{
> > > > +    struct media_pipeline_entity_iter iter;
> > > > +    unsigned int n_video_devices = 0;
> > > > +    struct media_entity *entity;
> > > > +    int ret;
> > > > +
> > > > +    ret = media_pipeline_entity_iter_init(pipe, &iter);
> > > > +    if (ret)
> > > > +        return ret;
> > > > +
> > > > +    media_pipeline_for_each_entity(pipe, &iter, entity) {
> > > > +        if (entity->obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
> > > > +            n_video_devices++;
> > > > +    }
> > > > +
> > > > +    media_pipeline_entity_iter_cleanup(&iter);
> > > > +
> > > > +    return n_video_devices - pipe->start_count;
> > > > +}
> > > > +
> > > > +int video_device_pipeline_started(struct video_device *vdev)
> > > > +{
> > > > +    struct media_pipeline *pipe;
> > > > +    int ret;
> > > > +
> > > > +    pipe = video_device_pipeline(vdev);
> > > > +    if (!pipe)
> > > > +        return -ENODEV;
> > > > +
> > > > +    ret = __video_device_pipeline_started(pipe);
> > > > +    if (ret)
> > > > +        return ret;
> > > I would not return ret, as it might take random values betwen
> > > n_video_devices and 1. See below on the return value documentation
> >
> > But we need to be able to signal to the driver three states:
> >
> >
> > 1. No errors, but there are still unstarted video devices
> >
> > 2. No errors and there are no unstarted video devices
> >
> > 3. An error
> >
> >
> > So I expect a driver to do a two stage check:
> >
> >
> > ret = video_device_pipeline_started(vdev);
> >
> > if (ret < 0)
> >
> >         goto err_out;
> >
> > if (ret == 0)
> >
> >         // something appropriate here like run the media jobs scheduler
> >
> Sorry: I had a reading comprehension failure. You were suggesting to use
> -ENODEV to signal that there are unstarted video devices remaining. I
> understand now, but I'm still not sure about it, because then instead of the
> "if (ret == 0) check here we'd have "if (ret == -ENODEV)", which I don't
> especially like...or am I missing some way to avoid having that check here?

Yes, that would require drivers to check for -ENODEV to identify a
non-failure case when not all devices have started..

You're right it might not be optimal. With you implementation we
should then have

 0: success
 < 0: error
 > 0: not all devices started

?

I might be actually ok with this, but could you please document it as
I've below suggested for clarity ?

Thanks
  j

>
>
> Thanks
>
> Dan
>
> >
> > >
> > > > +
> > > > +    return media_pipeline_started(pipe);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(video_device_pipeline_started);
> > > > +
> > > > +int video_device_pipeline_stopped(struct video_device *vdev)
> > > > +{
> > > > +    struct media_pipeline *pipe;
> > > > +    int ret;
> > > > +
> > > > +    pipe = video_device_pipeline(vdev);
> > > > +    if (!pipe)
> > > > +        return -ENODEV;
> > > > +
> > > > +    ret = __video_device_pipeline_started(pipe);
> > > > +    if (ret)
> > > > +        return ret;
> > > ditto
> > >
> > > > +
> > > > +    media_pipeline_stopped(pipe);
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(video_device_pipeline_stopped);
> > > > +
> > > >   #endif /* CONFIG_MEDIA_CONTROLLER */
> > > >
> > > >   /*
> > > > diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> > > > index 1b6222fab24eda96cbe459b435431c01f7259366..26b4a491024701ef47320aec6a1a680149ba4fc3 100644
> > > > --- a/include/media/v4l2-dev.h
> > > > +++ b/include/media/v4l2-dev.h
> > > > @@ -654,6 +654,42 @@ __must_check int video_device_pipeline_alloc_start(struct video_device *vdev);
> > > >    */
> > > >   struct media_pipeline *video_device_pipeline(struct video_device *vdev);
> > > >
> > > > +/**
> > > > + * video_device_pipeline_started - Run the pipeline_started() entity operation
> > > > + *                   for a fully-started media pipeline
> > > > + * @vdev: A video device that's part of the pipeline
> > > > + *
> > > > + * This function checks whether all MEDIA_ENTITY_TYPE_VIDEO_DEVICE entities
> > > > + * connected to a given video device through enabled links have been marked as
> > > I would use the same text as the one from video_device_pipeline_start()
> > >
> > > " connected to a given video device through enabled links, either
> > > directly or indirectly,"
> >
> >
> > Ack
> >
> > >
> > > > + * streaming through the use of video_device_pipeline_start() or one of its
> > > > + * equivalent functions. If so, media_pipeline_started() is called to inform
> > > > + * entities in the pipeline of that fact. The intention is to provide drivers
> > > > + * with a shortcut for checking whether their pipeline is fully ready to start
> > > > + * processing data.
> > > Not really a shortcut, I would use "mechanism" instead.
> > >
> > > I would also specify that:
> > >
> > >   * entities in the pipeline of that fact. The intention is to provide drivers
> > >   * with a mechanism for checking whether their pipeline is fully ready to start
> > >   * processing data and call the .pipeline_started() media entity operation
> > >   * on all the entities in the pipeline.
> > Ack!
> > >
> > > > + *
> > > > + * Return: The number of video devices in the pipeline remaining to be started,
> > > > + * or a negative error number on failure.
> > > 0 for success as well
> > >
> > > I would anyway return 0 for success and a specific error code for the
> > > three failure cases:
> > > -ENOMEM if allocating the iterator fails
> > > -ENODEV if not all video devices have started
> > > -EINVAL if media_pipeline_started() fails
> > >
> > > You can document them as (copying from iommu.h)
> > >
> > > * Return:
> > > * * 0            - success
> > > * * EINVAL       - call to pipeline_started() failed
> > > * * ENOMEM       - failed to allocate pipe iterator
> > > * * ENODEV       - pipeline not yet fully started
> > >
> > > > + */
> > > > +int video_device_pipeline_started(struct video_device *vdev);
> > > > +
> > > > +/**
> > > > + * video_device_pipeline_stopped - Run the pipeline_stopped() entity operation
> > > > + *                   for a fully-started media pipeline
> > > > + * @vdev: A video device that's part of the pipeline
> > > > + *
> > > > + * This function checks whether all MEDIA_ENTITY_TYPE_VIDEO_DEVICE entities
> > > > + * connected to a given video device through enabled links have been marked as
> > > > + * streaming through the use of video_device_pipeline_start() or one of its
> > > What is the intended semantic here ? The first video device to receive
> > > a streamoff() will trigger media_pipeline_stopped() or should the last
> > > one do that ?
> > The first one should do it, so the first device caling stop should
> > trigger actual stop in all involved hardware.
> > >
> > > > + * equivalent functions. If so, media_pipeline_stopped() is called for each
> > > > + * entity in the pipeline. The intention is to provide drivers with a shortcut
> > > > + * for checking whether this video device is the first device in the pipeline
> > > > + * to be stopped.
> > > > + *
> > > > + * Return: The number of video devices in the pipeline remaining to be started, or a
> > > > + * negative error number on failure.
> > > > + */
> > > > +int video_device_pipeline_stopped(struct video_device *vdev);
> > > > +
> > > >   #endif /* CONFIG_MEDIA_CONTROLLER */
> > > >
> > > >   #endif /* _V4L2_DEV_H */
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > > >

