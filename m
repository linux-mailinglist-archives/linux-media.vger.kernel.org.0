Return-Path: <linux-media+bounces-13581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2F390D934
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 18:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24DB7282F93
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C829524C4;
	Tue, 18 Jun 2024 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a0nYb08Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6E34D8B8;
	Tue, 18 Jun 2024 16:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718728133; cv=none; b=f8xn3MoSd7+QmZHyLqsWlZQkEVXt/IRMqT9BoMEH5ShDeIk1yTsQFB09H/oajZAiHvtxu7kOAKHkXHGpwKQn8QEA9MTkhWvrdBvz/bpD2UN1h9XzKjax6d7lJVic0YDCL6CK6dByoGJ4/sYCh5DsWVx11/bN7peCH6L+eNT+DvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718728133; c=relaxed/simple;
	bh=zDkcOD2G+LFoXHxLBdzLvwgKzypw6uEKX1JRCdrqSrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePCqzGiZIO7aM0SKMD84x2DF4UOXEWkIt8/Q0N6RCrmetCOD6Q4lpsZvaMrxuusWEDCLb6Y/ZqA63EvDFrb3kz3KJfHTFrwTDy3FIsjXbp7mOG/VMfCmKg1rmKWvWpxhsha7/d7VOULGat1M8JDccO0IZeXr+F54y4JxpFxdebs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a0nYb08Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC4FF564;
	Tue, 18 Jun 2024 18:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718728111;
	bh=zDkcOD2G+LFoXHxLBdzLvwgKzypw6uEKX1JRCdrqSrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a0nYb08YT4VnREeurzMH+KPOVTVSWDXBuKzUlOYgn+7jNIdZJf04C/flPBMVl7yop
	 v+2kdxykOI3dTfvlFUsxsWFZGxLwtUlWmddRTetZZoWmfgNr3ui+VcRjPx2MGbi0fj
	 sg/5e3hzIIQ6FmBlfPgw0H1mtN8UzGxq5+bPlKCQ=
Date: Tue, 18 Jun 2024 18:28:46 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC PATCH v1 09/19] media: renesas: vsp1: Pass partition
 pointer to .configure_partition()
Message-ID: <vc2xqg4igtebfurdthjlpm55n74leeq4ahg3n6c6bimkwbwxki@yogdmso35ssg>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231122043009.2741-10-laurent.pinchart+renesas@ideasonboard.com>
 <apdbfvn5umgmep2kgujggy7ziasmziepbjofl2brkgqndxdc6v@vi5nxd5ikbd4>
 <20240618161330.GE32669@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240618161330.GE32669@pendragon.ideasonboard.com>

Hi Laurent

On Tue, Jun 18, 2024 at 07:13:30PM GMT, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Tue, Jun 18, 2024 at 12:45:42PM +0200, Jacopo Mondi wrote:
> > On Wed, Nov 22, 2023 at 06:29:59AM GMT, Laurent Pinchart wrote:
> > > The entity .configure_partition() function operates on a partition, and
> > > has to retrieve that partition from the pipeline's current partition
> > > field. Pass the partition pointer to the function to make it clearer
> > > what partition it operates on, and remove the vsp1_pipeline.partition
> > > field.
> > >
> > > This change clearly shows that the DRM pipeline doesn't use partitions,
> > > which makes entity implementation more complex and error-prone. This
> > > will be addressed in a further cleanup.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  drivers/media/platform/renesas/vsp1/vsp1_drm.c    | 2 +-
> > >  drivers/media/platform/renesas/vsp1/vsp1_entity.c | 4 +++-
> > >  drivers/media/platform/renesas/vsp1/vsp1_entity.h | 2 ++
> > >  drivers/media/platform/renesas/vsp1/vsp1_pipe.h   | 2 --
> > >  drivers/media/platform/renesas/vsp1/vsp1_rpf.c    | 5 +++--
> > >  drivers/media/platform/renesas/vsp1/vsp1_uds.c    | 2 +-
> > >  drivers/media/platform/renesas/vsp1/vsp1_video.c  | 5 ++---
> > >  drivers/media/platform/renesas/vsp1/vsp1_wpf.c    | 5 +++--
> > >  8 files changed, 15 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > > index 9b087bd8df7d..3954c138fa7b 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > > @@ -569,7 +569,7 @@ static void vsp1_du_pipeline_configure(struct vsp1_pipeline *pipe)
> > >  		vsp1_entity_route_setup(entity, pipe, dlb);
> > >  		vsp1_entity_configure_stream(entity, pipe, dl, dlb);
> > >  		vsp1_entity_configure_frame(entity, pipe, dl, dlb);
> > > -		vsp1_entity_configure_partition(entity, pipe, dl, dlb);
> > > +		vsp1_entity_configure_partition(entity, pipe, NULL, dl, dlb);
> >
> > Are was passing a NULL pointer to rpf_configure_partition() and
> > wpf_configure_partition() now ? Will this commit break bisection ?
>
> I don't think it will, becase pipe->partition is set in
> vsp1_video_pipeline_run_partition() only, which is not called for DRM
> pipelines. Entities already get a NULL pipe->partition in DRM pipelines,
> so this patch doesn't change the behaviour.
>

Good then, I was not aware of how the DRM pipe uses this

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> > Can't you temporary keep 'struct vsp1_pipeline.partition' around and
> > pass it down here ?
> >
> > >  	}
> > >
> > >  	vsp1_dl_list_commit(dl, dl_flags);
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > > index 8d39f1ee00ab..e9de75de8bde 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > > @@ -89,11 +89,13 @@ void vsp1_entity_configure_frame(struct vsp1_entity *entity,
> > >
> > >  void vsp1_entity_configure_partition(struct vsp1_entity *entity,
> > >  				     struct vsp1_pipeline *pipe,
> > > +				     const struct vsp1_partition *partition,
> > >  				     struct vsp1_dl_list *dl,
> > >  				     struct vsp1_dl_body *dlb)
> > >  {
> > >  	if (entity->ops->configure_partition)
> > > -		entity->ops->configure_partition(entity, pipe, dl, dlb);
> > > +		entity->ops->configure_partition(entity, pipe, partition,
> > > +						 dl, dlb);
> > >  }
> > >
> > >  /* -----------------------------------------------------------------------------
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> > > index 802c0c2acab0..7b86b2fef3e5 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> > > @@ -85,6 +85,7 @@ struct vsp1_entity_operations {
> > >  				struct vsp1_dl_list *, struct vsp1_dl_body *);
> > >  	void (*configure_partition)(struct vsp1_entity *,
> > >  				    struct vsp1_pipeline *,
> > > +				    const struct vsp1_partition *,
> > >  				    struct vsp1_dl_list *,
> > >  				    struct vsp1_dl_body *);
> > >  	unsigned int (*max_width)(struct vsp1_entity *, struct vsp1_pipeline *);
> > > @@ -155,6 +156,7 @@ void vsp1_entity_configure_frame(struct vsp1_entity *entity,
> > >
> > >  void vsp1_entity_configure_partition(struct vsp1_entity *entity,
> > >  				     struct vsp1_pipeline *pipe,
> > > +				     const struct vsp1_partition *partition,
> > >  				     struct vsp1_dl_list *dl,
> > >  				     struct vsp1_dl_body *dlb);
> > >
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> > > index 840fd3288efb..3d2e35ac8fa0 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> > > @@ -106,7 +106,6 @@ struct vsp1_partition {
> > >   * @configured: when false the @stream_config shall be written to the hardware
> > >   * @interlaced: True when the pipeline is configured in interlaced mode
> > >   * @partitions: The number of partitions used to process one frame
> > > - * @partition: The current partition for configuration to process
> > >   * @part_table: The pre-calculated partitions used by the pipeline
> > >   */
> > >  struct vsp1_pipeline {
> > > @@ -146,7 +145,6 @@ struct vsp1_pipeline {
> > >  	bool interlaced;
> > >
> > >  	unsigned int partitions;
> > > -	struct vsp1_partition *partition;
> > >  	struct vsp1_partition *part_table;
> > >
> > >  	u32 underrun_count;
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> > > index 42b0c5655404..3b8a62299226 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> > > @@ -280,6 +280,7 @@ static void rpf_configure_frame(struct vsp1_entity *entity,
> > >
> > >  static void rpf_configure_partition(struct vsp1_entity *entity,
> > >  				    struct vsp1_pipeline *pipe,
> > > +				    const struct vsp1_partition *partition,
> > >  				    struct vsp1_dl_list *dl,
> > >  				    struct vsp1_dl_body *dlb)
> > >  {
> > > @@ -311,8 +312,8 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
> > >  	 * 'width' need to be adjusted.
> > >  	 */
> > >  	if (pipe->partitions > 1) {
> > > -		crop.width = pipe->partition->rpf[rpf->entity.index].width;
> > > -		crop.left += pipe->partition->rpf[rpf->entity.index].left;
> > > +		crop.width = partition->rpf[rpf->entity.index].width;
> > > +		crop.left += partition->rpf[rpf->entity.index].left;
> > >  	}
> > >
> > >  	if (pipe->interlaced) {
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> > > index 887b1f70611a..737362ca2315 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> > > @@ -300,11 +300,11 @@ static void uds_configure_stream(struct vsp1_entity *entity,
> > >
> > >  static void uds_configure_partition(struct vsp1_entity *entity,
> > >  				    struct vsp1_pipeline *pipe,
> > > +				    const struct vsp1_partition *partition,
> > >  				    struct vsp1_dl_list *dl,
> > >  				    struct vsp1_dl_body *dlb)
> > >  {
> > >  	struct vsp1_uds *uds = to_uds(&entity->subdev);
> > > -	struct vsp1_partition *partition = pipe->partition;
> > >  	const struct v4l2_mbus_framefmt *output;
> > >
> > >  	output = v4l2_subdev_state_get_format(uds->entity.state,
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > > index ea5773af54d6..6a8db541543a 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > > @@ -240,13 +240,12 @@ static void vsp1_video_pipeline_run_partition(struct vsp1_pipeline *pipe,
> > >  					      struct vsp1_dl_list *dl,
> > >  					      unsigned int partition)
> > >  {
> > > +	struct vsp1_partition *part = &pipe->part_table[partition];
> > >  	struct vsp1_dl_body *dlb = vsp1_dl_list_get_body0(dl);
> > >  	struct vsp1_entity *entity;
> > >
> > > -	pipe->partition = &pipe->part_table[partition];
> > > -
> > >  	list_for_each_entry(entity, &pipe->entities, list_pipe)
> > > -		vsp1_entity_configure_partition(entity, pipe, dl, dlb);
> > > +		vsp1_entity_configure_partition(entity, pipe, part, dl, dlb);
> > >  }
> > >
> > >  static void vsp1_video_pipeline_run(struct vsp1_pipeline *pipe)
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > > index 5129181b8217..80fe7571f4ff 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > > @@ -363,6 +363,7 @@ static void wpf_configure_frame(struct vsp1_entity *entity,
> > >
> > >  static void wpf_configure_partition(struct vsp1_entity *entity,
> > >  				    struct vsp1_pipeline *pipe,
> > > +				    const struct vsp1_partition *partition,
> > >  				    struct vsp1_dl_list *dl,
> > >  				    struct vsp1_dl_body *dlb)
> > >  {
> > > @@ -390,8 +391,8 @@ static void wpf_configure_partition(struct vsp1_entity *entity,
> > >  	 * multiple slices.
> > >  	 */
> > >  	if (pipe->partitions > 1) {
> > > -		width = pipe->partition->wpf.width;
> > > -		left = pipe->partition->wpf.left;
> > > +		width = partition->wpf.width;
> > > +		left = partition->wpf.left;
> > >  	}
> > >
> > >  	vsp1_wpf_write(wpf, dlb, VI6_WPF_HSZCLIP, VI6_WPF_SZCLIP_EN |
>
> --
> Regards,
>
> Laurent Pinchart
>

