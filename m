Return-Path: <linux-media+bounces-13583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB32B90D942
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 18:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 994741C21E0E
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10471386D1;
	Tue, 18 Jun 2024 16:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UTaegMOu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2A017547;
	Tue, 18 Jun 2024 16:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718728229; cv=none; b=GmFdI2eNflpW8VSzJQ9BTJ1Fmwrzo9Zm7TuKpfymU/A5SbneXS543WTsTsd3vtQhhAeY7HYueFLOL4YXPO9DA25RyWb4t2HlEB6KxQzXkrsZ7QSR/MTYfeCNspnsXPV/XxlWG5XO6epZXfbqxypqeZFxY7WeWQIU89PbqePi7/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718728229; c=relaxed/simple;
	bh=XPJ+8+zYmSyUfvQ/044HDcpEoBuv6jVKSN5NMjx9EwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkZkCgNeanmQlV4x7cvVYpoRjxCHzddjFHD8NyruzAQ3RECtW9ZtAqEnuDGt7nvLwwlQM3yYOCCGj9PFIR1V0nD46fF6IkFvWgAmiwPMIHC17S/ztLtyVgjT7aqmLkK7rblhvB0lCu++nSuMOMblG/FO7KXTMHtsd2Q2fNxQgsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UTaegMOu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8F67564;
	Tue, 18 Jun 2024 18:30:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718728209;
	bh=XPJ+8+zYmSyUfvQ/044HDcpEoBuv6jVKSN5NMjx9EwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UTaegMOucteTi9RemO/1lXV53F6T1L2gjKLAi0axrAXY8AkDS6nzno9W5dF0OsIbI
	 yeT02ni5I4DJcw2GXNchaJ2ywjawgqfHWueATKxl2K9ZjbqO54+Cgnn1rgepYdToVd
	 nrzXLlS8EupWBLHBA+hQUro0bFjWr71PpyDObYEk=
Date: Tue, 18 Jun 2024 18:30:24 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC PATCH v1 11/19] media: renesas: vsp1: Add and use function
 to dump a pipeline to the log
Message-ID: <oeruhwumsjngorepcpmtkkh6gcep55v7we244vxynr6y43xrdy@hfe2chs4x5ae>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231122043009.2741-12-laurent.pinchart+renesas@ideasonboard.com>
 <zhtlotecrnczxjpchurr3rkmewnbvlalvyivec5yzrbf3js5r4@sirkpss6cbpt>
 <20240618162502.GG32669@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240618162502.GG32669@pendragon.ideasonboard.com>

Hi Laurent

On Tue, Jun 18, 2024 at 07:25:02PM GMT, Laurent Pinchart wrote:
> On Tue, Jun 18, 2024 at 01:34:41PM +0200, Jacopo Mondi wrote:
> > Hi Laurent
> >
> > On Wed, Nov 22, 2023 at 06:30:01AM GMT, Laurent Pinchart wrote:
> > > It is useful for debugging purpose to dump a vsp1_pipeline to the kernel
> > > log. Add a new function to do so, and use it when initializing the video
> > > and DRM pipelines.
> > >
> > > As __vsp1_pipeline_dump() needs to construct the log message
> > > iteratively, it uses pr_cont(...) (exact equivalent to the more verbose
> > > "printk(KERN_CONT ..."). The function thus can't use dev_dbg() to log
> > > the initial part of the message, for two reasons:
> > >
> > > - pr_cont() doesn't seem to work with dev_*(). Even if the format string
> > >   passed to dev_*() doesn't end with a '\n', pr_cont() starts a new line
> > >   in the log. This behaviour doesn't seem to be clearly documented, and
> > >   may or may not be on purpose.
> > >
> > > - Messages printed by dev_dbg() may be omitted if dynamic debugging is
> > >   enabled. In that case, the continuation messages will still be
> > >   printed, leading to confusing log messages.
> > >
> > > To still benefit from the dynamic debug infrastructure, we declare a
> > > vsp1_pipeline_dump() macro that uses _dynamic_func_call() when dynamic
> > > debugging is enabled. The whole vsp1_pipeline_dump() call can be
> > > selected at runtime. The __vsp1_pipeline_dump() function then uses a
> > > plain "printk(KERN_DEBUG ...)" to print the message header using the
> > > debug log level, and pr_cont() to print the rest of the message on the
> > > same line.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  .../media/platform/renesas/vsp1/vsp1_drm.c    |  5 +++++
> > >  .../media/platform/renesas/vsp1/vsp1_pipe.c   | 22 +++++++++++++++++++
> > >  .../media/platform/renesas/vsp1/vsp1_pipe.h   | 19 ++++++++++++++++
> > >  .../media/platform/renesas/vsp1/vsp1_video.c  | 10 ++++++++-
> > >  4 files changed, 55 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > > index 3954c138fa7b..1aa59a74672f 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > > @@ -733,6 +733,8 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
> > >  	if (ret < 0)
> > >  		goto unlock;
> > >
> > > +	vsp1_pipeline_dump(pipe, "LIF setup");
> > > +
> > >  	/* Enable the VSP1. */
> > >  	ret = vsp1_device_get(vsp1);
> > >  	if (ret < 0)
> > > @@ -906,6 +908,9 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
> > >  	}
> > >
> > >  	vsp1_du_pipeline_setup_inputs(vsp1, pipe);
> > > +
> > > +	vsp1_pipeline_dump(pipe, "atomic update");
> > > +
> > >  	vsp1_du_pipeline_configure(pipe);
> > >
> > >  done:
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > index 8eba3cda1e3d..edc5e9f3ba65 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > @@ -301,6 +301,28 @@ void vsp1_pipeline_init(struct vsp1_pipeline *pipe)
> > >  	pipe->state = VSP1_PIPELINE_STOPPED;
> > >  }
> > >
> > > +void __vsp1_pipeline_dump(struct _ddebug *, struct vsp1_pipeline *pipe,
> > > +			  const char *msg)
> > > +{
> > > +	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
> > > +	struct vsp1_entity *entity;
> > > +	bool first = true;
> > > +
> > > +	printk(KERN_DEBUG "%s: %s: pipe: ", dev_name(vsp1->dev), msg);
> > > +
> > > +	list_for_each_entry(entity, &pipe->entities, list_pipe) {
> > > +		const char *name;
> > > +
> > > +		name = strchrnul(entity->subdev.name, ' ');
> > > +		name = name ? name + 1 : entity->subdev.name;
> > > +
> > > +		pr_cont("%s%s", first ? "" : ", ", name);
> > > +		first = false;
> > > +	}
> > > +
> > > +	pr_cont("\n");
> > > +}
> > > +
> > >  /* Must be called with the pipe irqlock held. */
> > >  void vsp1_pipeline_run(struct vsp1_pipeline *pipe)
> > >  {
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> > > index c1f411227de7..46a82a9f766a 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> > > @@ -9,6 +9,7 @@
> > >  #ifndef __VSP1_PIPE_H__
> > >  #define __VSP1_PIPE_H__
> > >
> > > +#include <linux/dynamic_debug.h>
> > >  #include <linux/kref.h>
> > >  #include <linux/list.h>
> > >  #include <linux/spinlock.h>
> > > @@ -142,6 +143,24 @@ struct vsp1_pipeline {
> > >  void vsp1_pipeline_reset(struct vsp1_pipeline *pipe);
> > >  void vsp1_pipeline_init(struct vsp1_pipeline *pipe);
> > >
> > > +void __vsp1_pipeline_dump(struct _ddebug *, struct vsp1_pipeline *pipe,
> > > +			  const char *msg);
> > > +
> > > +#if defined(CONFIG_DYNAMIC_DEBUG) || \
> > > +	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
> > > +#define vsp1_pipeline_dump(pipe, msg)			\
> > > +	_dynamic_func_call("vsp1_pipeline_dump()", __vsp1_pipeline_dump, pipe, msg)
> > > +#elif defined(DEBUG)
> > > +#define vsp1_pipeline_dump(pipe, msg)			\
> > > +	__vsp1_pipeline_dump(NULL, pipe, msg)
> > > +#else
> > > +#define vsp1_pipeline_dump(pipe, msg)			\
> > > +({							\
> > > +	if (0)						\
> > > +		__vsp1_pipeline_dump(NULL, pipe, msg);	\
> > > +)}
> >
> > Why can't this simply be
> >
> > #else
> > #define vsp1_pipeline_dump(pipe, msg)
> > #endif
> >
> > ?
>
> To avoid unused local variable warnings.
>

Fine indeed!

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> > > +#endif
> > > +
> > >  void vsp1_pipeline_run(struct vsp1_pipeline *pipe);
> > >  bool vsp1_pipeline_stopped(struct vsp1_pipeline *pipe);
> > >  int vsp1_pipeline_stop(struct vsp1_pipeline *pipe);
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > > index 6a8db541543a..84394994ccee 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > > @@ -520,11 +520,19 @@ static int vsp1_video_pipeline_build(struct vsp1_pipeline *pipe,
> > >  static int vsp1_video_pipeline_init(struct vsp1_pipeline *pipe,
> > >  				    struct vsp1_video *video)
> > >  {
> > > +	int ret;
> > > +
> > >  	vsp1_pipeline_init(pipe);
> > >
> > >  	pipe->frame_end = vsp1_video_pipeline_frame_end;
> > >
> > > -	return vsp1_video_pipeline_build(pipe, video);
> > > +	ret = vsp1_video_pipeline_build(pipe, video);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	vsp1_pipeline_dump(pipe, "video");
> > > +
> > > +	return 0;
> > >  }
> > >
> > >  static struct vsp1_pipeline *vsp1_video_pipeline_get(struct vsp1_video *video)
>
> --
> Regards,
>
> Laurent Pinchart
>

