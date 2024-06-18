Return-Path: <linux-media+bounces-13580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEAE90D928
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 18:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9BE9284337
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F824E1A2;
	Tue, 18 Jun 2024 16:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fxByRuaT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE1546521;
	Tue, 18 Jun 2024 16:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718727930; cv=none; b=hSBqV0DH1me4pfxp7pepxbVSHxRa2O+GlNwtp+zguCsV1jK5WSzvsaImt8wGIjg9EPHNgueDhtejOO8fj7hOJyj39lFDaoCghUr6o9yjmTLGs97ZmizhZ8V8S9poqEF4fYqSIoEj8oE6vJ/28IdcGiMDYTCFx7qfVt8qyCpxDTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718727930; c=relaxed/simple;
	bh=nGLSpLfFRiMTJrNLqEMXprstO1WXoX/T42UQu5poZi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bmo3N178C2JUKcYi2FLzXumST/RagOwwYC8+VcSjEHcGo6s0YSLSFwJ1TQngQut1yYPkqi0l0CUcFFM/fsMfzUH7J9Gc/kUSum8JDuiaiQvc7v3GPFFY3AdDbozS8avN7oP4CEXXsuEK3MihxtfPaskR/aRMFlVbp4EzJNKGmUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fxByRuaT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01DF7564;
	Tue, 18 Jun 2024 18:25:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718727908;
	bh=nGLSpLfFRiMTJrNLqEMXprstO1WXoX/T42UQu5poZi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fxByRuaT4ksKGVwfUHUgG9OMnZ0OLhmCyLCq6HFkNxWRzXYdseOzafprU49PAh0F7
	 +XDkeo8kzUoqmkaGFV3XkJfSJwBRjRbaJET5h7W+QbgH3sebVbQBGQ64oY89Bmb1Fb
	 XG2guu05J8sXjZCpFwahgLQh0+5AHO4HGimn18vo=
Date: Tue, 18 Jun 2024 19:25:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC PATCH v1 11/19] media: renesas: vsp1: Add and use function
 to dump a pipeline to the log
Message-ID: <20240618162502.GG32669@pendragon.ideasonboard.com>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231122043009.2741-12-laurent.pinchart+renesas@ideasonboard.com>
 <zhtlotecrnczxjpchurr3rkmewnbvlalvyivec5yzrbf3js5r4@sirkpss6cbpt>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <zhtlotecrnczxjpchurr3rkmewnbvlalvyivec5yzrbf3js5r4@sirkpss6cbpt>

On Tue, Jun 18, 2024 at 01:34:41PM +0200, Jacopo Mondi wrote:
> Hi Laurent
> 
> On Wed, Nov 22, 2023 at 06:30:01AM GMT, Laurent Pinchart wrote:
> > It is useful for debugging purpose to dump a vsp1_pipeline to the kernel
> > log. Add a new function to do so, and use it when initializing the video
> > and DRM pipelines.
> >
> > As __vsp1_pipeline_dump() needs to construct the log message
> > iteratively, it uses pr_cont(...) (exact equivalent to the more verbose
> > "printk(KERN_CONT ..."). The function thus can't use dev_dbg() to log
> > the initial part of the message, for two reasons:
> >
> > - pr_cont() doesn't seem to work with dev_*(). Even if the format string
> >   passed to dev_*() doesn't end with a '\n', pr_cont() starts a new line
> >   in the log. This behaviour doesn't seem to be clearly documented, and
> >   may or may not be on purpose.
> >
> > - Messages printed by dev_dbg() may be omitted if dynamic debugging is
> >   enabled. In that case, the continuation messages will still be
> >   printed, leading to confusing log messages.
> >
> > To still benefit from the dynamic debug infrastructure, we declare a
> > vsp1_pipeline_dump() macro that uses _dynamic_func_call() when dynamic
> > debugging is enabled. The whole vsp1_pipeline_dump() call can be
> > selected at runtime. The __vsp1_pipeline_dump() function then uses a
> > plain "printk(KERN_DEBUG ...)" to print the message header using the
> > debug log level, and pr_cont() to print the rest of the message on the
> > same line.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  .../media/platform/renesas/vsp1/vsp1_drm.c    |  5 +++++
> >  .../media/platform/renesas/vsp1/vsp1_pipe.c   | 22 +++++++++++++++++++
> >  .../media/platform/renesas/vsp1/vsp1_pipe.h   | 19 ++++++++++++++++
> >  .../media/platform/renesas/vsp1/vsp1_video.c  | 10 ++++++++-
> >  4 files changed, 55 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > index 3954c138fa7b..1aa59a74672f 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > @@ -733,6 +733,8 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
> >  	if (ret < 0)
> >  		goto unlock;
> >
> > +	vsp1_pipeline_dump(pipe, "LIF setup");
> > +
> >  	/* Enable the VSP1. */
> >  	ret = vsp1_device_get(vsp1);
> >  	if (ret < 0)
> > @@ -906,6 +908,9 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
> >  	}
> >
> >  	vsp1_du_pipeline_setup_inputs(vsp1, pipe);
> > +
> > +	vsp1_pipeline_dump(pipe, "atomic update");
> > +
> >  	vsp1_du_pipeline_configure(pipe);
> >
> >  done:
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > index 8eba3cda1e3d..edc5e9f3ba65 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > @@ -301,6 +301,28 @@ void vsp1_pipeline_init(struct vsp1_pipeline *pipe)
> >  	pipe->state = VSP1_PIPELINE_STOPPED;
> >  }
> >
> > +void __vsp1_pipeline_dump(struct _ddebug *, struct vsp1_pipeline *pipe,
> > +			  const char *msg)
> > +{
> > +	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
> > +	struct vsp1_entity *entity;
> > +	bool first = true;
> > +
> > +	printk(KERN_DEBUG "%s: %s: pipe: ", dev_name(vsp1->dev), msg);
> > +
> > +	list_for_each_entry(entity, &pipe->entities, list_pipe) {
> > +		const char *name;
> > +
> > +		name = strchrnul(entity->subdev.name, ' ');
> > +		name = name ? name + 1 : entity->subdev.name;
> > +
> > +		pr_cont("%s%s", first ? "" : ", ", name);
> > +		first = false;
> > +	}
> > +
> > +	pr_cont("\n");
> > +}
> > +
> >  /* Must be called with the pipe irqlock held. */
> >  void vsp1_pipeline_run(struct vsp1_pipeline *pipe)
> >  {
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> > index c1f411227de7..46a82a9f766a 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> > @@ -9,6 +9,7 @@
> >  #ifndef __VSP1_PIPE_H__
> >  #define __VSP1_PIPE_H__
> >
> > +#include <linux/dynamic_debug.h>
> >  #include <linux/kref.h>
> >  #include <linux/list.h>
> >  #include <linux/spinlock.h>
> > @@ -142,6 +143,24 @@ struct vsp1_pipeline {
> >  void vsp1_pipeline_reset(struct vsp1_pipeline *pipe);
> >  void vsp1_pipeline_init(struct vsp1_pipeline *pipe);
> >
> > +void __vsp1_pipeline_dump(struct _ddebug *, struct vsp1_pipeline *pipe,
> > +			  const char *msg);
> > +
> > +#if defined(CONFIG_DYNAMIC_DEBUG) || \
> > +	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
> > +#define vsp1_pipeline_dump(pipe, msg)			\
> > +	_dynamic_func_call("vsp1_pipeline_dump()", __vsp1_pipeline_dump, pipe, msg)
> > +#elif defined(DEBUG)
> > +#define vsp1_pipeline_dump(pipe, msg)			\
> > +	__vsp1_pipeline_dump(NULL, pipe, msg)
> > +#else
> > +#define vsp1_pipeline_dump(pipe, msg)			\
> > +({							\
> > +	if (0)						\
> > +		__vsp1_pipeline_dump(NULL, pipe, msg);	\
> > +)}
> 
> Why can't this simply be
> 
> #else
> #define vsp1_pipeline_dump(pipe, msg)
> #endif
> 
> ?

To avoid unused local variable warnings.

> > +#endif
> > +
> >  void vsp1_pipeline_run(struct vsp1_pipeline *pipe);
> >  bool vsp1_pipeline_stopped(struct vsp1_pipeline *pipe);
> >  int vsp1_pipeline_stop(struct vsp1_pipeline *pipe);
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > index 6a8db541543a..84394994ccee 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > @@ -520,11 +520,19 @@ static int vsp1_video_pipeline_build(struct vsp1_pipeline *pipe,
> >  static int vsp1_video_pipeline_init(struct vsp1_pipeline *pipe,
> >  				    struct vsp1_video *video)
> >  {
> > +	int ret;
> > +
> >  	vsp1_pipeline_init(pipe);
> >
> >  	pipe->frame_end = vsp1_video_pipeline_frame_end;
> >
> > -	return vsp1_video_pipeline_build(pipe, video);
> > +	ret = vsp1_video_pipeline_build(pipe, video);
> > +	if (ret)
> > +		return ret;
> > +
> > +	vsp1_pipeline_dump(pipe, "video");
> > +
> > +	return 0;
> >  }
> >
> >  static struct vsp1_pipeline *vsp1_video_pipeline_get(struct vsp1_video *video)

-- 
Regards,

Laurent Pinchart

