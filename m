Return-Path: <linux-media+bounces-34591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCA1AD6B5F
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 10:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF48A1892F91
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 08:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37EAF18DB2A;
	Thu, 12 Jun 2025 08:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g9KphciW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE480522F
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 08:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749718238; cv=none; b=PaF3A6y7l6MeaPn+ujef1sZ+IrHXpweqFGTGXwOy1qOEC6Z2GLBd/zjBbtSRwtDzAIDbofy1VwJHIND/a7Oh3KgO8DTFnDvEKEIxENtGSwHF8saleSl12Hyv/U9RMSi2ELBlC87/woWUkGIyIlHGzZcQD5j+FPWUn5tuk3NZlTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749718238; c=relaxed/simple;
	bh=qA8caL73ygACMGlFxn+CeN+TvJk7CsNXs9DdE4SW3Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+RxalLEmyagdpYDUejsWQ8ut1FcWmbUY5VAwVVAwWExXTtOA1BJbfWHoG4jNvMk1XyNRlYbGfDZie6vWskqXtamhRpU+TMICsMz9IzJ7P7JyF+m/dcsxljCyutrm2SLkecf+uDX6NmUYuP59/vJf7yfKu0wIL1QC3SgGoVwcHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g9KphciW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14F1CD6;
	Thu, 12 Jun 2025 10:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749718226;
	bh=qA8caL73ygACMGlFxn+CeN+TvJk7CsNXs9DdE4SW3Ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g9KphciWVPdHDZ/pk98CAF7+6tT1CNsuZ3dQSSulHNODpc4umLocJAlfsbYfpbVGh
	 wynv5x9FuR0iKdfeF8eGaqFBeQsPL0U/w5Nfj6A6C9OgCRc4fyoIFtsvCqCn4f3P/k
	 mW9Oc4EbFPZgWkresLO2R7GLZwIKcyi/KOAZZo24=
Date: Thu, 12 Jun 2025 10:50:32 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	mchehab@kernel.org
Subject: Re: [PATCH 1/3] media: mc: entity: Add pipeline_started/stopped ops
Message-ID: <7rjyd75yswxyrlh7xkwjsaobwdkkwiliyiba2varx44ctylt52@j55a3xgjlasz>
References: <20250519140403.443915-1-dan.scally@ideasonboard.com>
 <20250519140403.443915-2-dan.scally@ideasonboard.com>
 <wqkgrdijdwbnqltyzbxcy7krktec4xh2p23lov2vayqgls4wmt@gmn2twyhaods>
 <1ed7c9e3-6d83-45dd-bed6-595b8ecbb5d9@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ed7c9e3-6d83-45dd-bed6-595b8ecbb5d9@ideasonboard.com>

Hi Dan
  sorry missed the last reply

On Mon, Jun 09, 2025 at 03:57:55PM +0100, Dan Scally wrote:
> Hi Jacopo
>
> On 21/05/2025 16:18, Jacopo Mondi wrote:
> > Hi Dan
> >
> > On Mon, May 19, 2025 at 03:04:01PM +0100, Daniel Scally wrote:
> > > Add two new members to struct media_entity_operations, along with new
> > > functions in media-entity.c to traverse a media pipeline and call the
> > > new operations. The new functions are intended to be used to signal
> > > to a media pipeline that it has fully started, with the entity ops
> > > allowing drivers to define some action to be taken when those
> > > conditions are met.
> > >
> > > The combination of the new functions and operations allows drivers
> > > which are part of a multi-driver pipeline to delay actually starting
> > > streaming until all of the conditions for streaming succcessfully are
> > > met across all drivers.
> > Maybe s/succcessfully are/are successfully/
> >
> > Or was this (the three 'c' apart) intentional ?
> >
> > > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > > ---
> > >   drivers/media/mc/mc-entity.c | 45 ++++++++++++++++++++++++++++++++++++
> > >   include/media/media-entity.h | 24 +++++++++++++++++++
> > >   2 files changed, 69 insertions(+)
> > >
> > > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > > index 045590905582..e36b1710669d 100644
> > > --- a/drivers/media/mc/mc-entity.c
> > > +++ b/drivers/media/mc/mc-entity.c
> > > @@ -1053,6 +1053,51 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
> > >   }
> > >   EXPORT_SYMBOL_GPL(__media_pipeline_entity_iter_next);
> > >
> > > +int media_pipeline_started(struct media_pipeline *pipe)
> > > +{
> > > +	struct media_pipeline_entity_iter iter;
> > > +	struct media_entity *entity;
> > > +	int ret;
> > > +
> > > +	ret = media_pipeline_entity_iter_init(pipe, &iter);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	media_pipeline_for_each_entity(pipe, &iter, entity) {
> > > +		ret = media_entity_call(entity, pipeline_started);
> > > +		if (ret && ret != -ENOIOCTLCMD)
> > > +			goto err_notify_stopped;
> > > +	}
> > > +
> > > +	media_pipeline_entity_iter_cleanup(&iter);
> > > +
> > > +	return ret == -ENOIOCTLCMD ? 0 : ret;
> > Shouldn't you just return 0 ? If a ret < 0 is encoutered in the loop
> > we just to the below label
>
>
> Actually thinking more I think this is right as-is. The intention is to
> avoid returning -ENOIOCTLCMD from this function if the last entity in the
> iterator doesn't have a .pipeline_started operation.

That was my point actually.

If you encounter a ret != -ENOIOCTLCMD in the above for loop you will
jump to the label below.

If you get here ret is either 0 or -ENOIOCTLCMD, and you can just
return 0. Or do I still have to actually wake up ?

>
> >
> > > +
> > > +err_notify_stopped:
> > > +	media_pipeline_stopped(pipe);
> > Do you need to media_pipeline_entity_iter_cleanup() ?
> >
> > > +	return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(media_pipeline_started);
> > > +
> > > +int media_pipeline_stopped(struct media_pipeline *pipe)
> > > +{
> > > +	struct media_pipeline_entity_iter iter;
> > > +	struct media_entity *entity;
> > > +	int ret;
> > > +
> > > +	ret = media_pipeline_entity_iter_init(pipe, &iter);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	media_pipeline_for_each_entity(pipe, &iter, entity)
> > > +		media_entity_call(entity, pipeline_stopped);
> > > +
> > > +	media_pipeline_entity_iter_cleanup(&iter);
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(media_pipeline_stopped);
> > > +
> > >   /* -----------------------------------------------------------------------------
> > >    * Links management
> > >    */
> > > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > > index 64cf590b1134..e858326b95cb 100644
> > > --- a/include/media/media-entity.h
> > > +++ b/include/media/media-entity.h
> > > @@ -269,6 +269,10 @@ struct media_pad {
> > >    *			media_entity_has_pad_interdep().
> > >    *			Optional: If the operation isn't implemented all pads
> > >    *			will be considered as interdependent.
> > > + * @pipeline_started:	Notify this entity that the pipeline it is a part of has
> > > + *			been started
> > > + * @pipeline_stopped:	Notify this entity that the pipeline it is a part of has
> > > + *			been stopped
> > >    *
> > >    * .. note::
> > >    *
> > > @@ -284,6 +288,8 @@ struct media_entity_operations {
> > >   	int (*link_validate)(struct media_link *link);
> > >   	bool (*has_pad_interdep)(struct media_entity *entity, unsigned int pad0,
> > >   				 unsigned int pad1);
> > > +	int (*pipeline_started)(struct media_entity *entity);
> > > +	void (*pipeline_stopped)(struct media_entity *entity);
> > >   };
> > >
> > >   /**
> > > @@ -1261,6 +1267,24 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
> > >   	     entity != NULL;							\
> > >   	     entity = __media_pipeline_entity_iter_next((pipe), iter, entity))
> > >
> > > +/**
> > > + * media_pipeline_started - Inform entities in a pipeline that it has started
> > > + * @pipe:	The pipeline
> > > + *
> > > + * Iterate on all entities in a media pipeline and call their pipeline_started
> > > + * member of media_entity_operations.
> > > + */
> > > +int media_pipeline_started(struct media_pipeline *pipe);
> > > +
> > > +/**
> > > + * media_pipeline_stopped - Inform entities in a pipeline that it has stopped
> > > + * @pipe:	The pipeline
> > > + *
> > > + * Iterate on all entities in a media pipeline and call their pipeline_stopped
> > > + * member of media_entity_operations.
> > > + */
> > > +int media_pipeline_stopped(struct media_pipeline *pipe);
> > > +
> > All good, but I don't see these operations being used at all in this
> > series ?
> >
> > >   /**
> > >    * media_pipeline_alloc_start - Mark a pipeline as streaming
> > >    * @pad: Starting pad
> > > --
> > > 2.34.1
> > >
> > >
>

