Return-Path: <linux-media+bounces-13592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 001CB90DA6B
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 19:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75F871F22DC1
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 17:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF67A13D528;
	Tue, 18 Jun 2024 17:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cKU9I76c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507D422626;
	Tue, 18 Jun 2024 17:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718731072; cv=none; b=uhXtreB/3/ZjDrQOblGy094fp7cssYatSpD0W9MdcshGKnyr30mRApZtJnJFgyf3XauYKnilFt/1rOwbhAcuneB56nTbr9lmu3Jl/KJ7+Kj9LzPjYbw0HxDhQesg0QGhozVo9GRNuRCVrHmrriJkLZzCwuTWCG6CCv0Ykkay7TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718731072; c=relaxed/simple;
	bh=G+sGcZMAZHnEfnOShyqesBkpWu6EDzLEMPb/+J/MWqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKBddPa6Rz0Zo3/c6Thd0BgVyXEXMdpPf6VCenNzqLQBPxLCR2vhyKMlQ834qyaCq/1UzUviM3lOLpWeyvnndvUDjjLx8pffNSglLLz3jbCpkUKngzjh8ATXZrhLOuqGnMr3ejK6ZYQdpvnsTO6wRTi/eVZVh9ceHvPLZYOV+io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cKU9I76c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 009DE908;
	Tue, 18 Jun 2024 19:17:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718731048;
	bh=G+sGcZMAZHnEfnOShyqesBkpWu6EDzLEMPb/+J/MWqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cKU9I76cTQZXSAARTiwgeoRTu2+UvcZc5XG+90gXHQSeCHbawtVnN+DxQRxkml0MT
	 RpS1ENNCaq07x8sAvVJ0uDqBEuSDwELgbft95Ylhnlo0Edb1g5Jd2KpEhppmK3N1DE
	 AIld+erarMLfU09t4gHHOxzXxeQnqbFvtJ8UZ2Dw=
Date: Tue, 18 Jun 2024 20:17:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC PATCH v1 16/19] media: renesas: vsp1: Pass subdev state to
 entity operations
Message-ID: <20240618171721.GA11380@pendragon.ideasonboard.com>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231122043009.2741-17-laurent.pinchart+renesas@ideasonboard.com>
 <ilcclds6wkq62tefx7bcgaoe7dalkuiytse2bzfknzgnp63w2r@3jwrkymhhl4j>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ilcclds6wkq62tefx7bcgaoe7dalkuiytse2bzfknzgnp63w2r@3jwrkymhhl4j>

Hi Jacopo,

On Tue, Jun 18, 2024 at 06:52:26PM +0200, Jacopo Mondi wrote:
> On Wed, Nov 22, 2023 at 06:30:06AM GMT, Laurent Pinchart wrote:
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > To prepare for the removal of the vsp1_entity.state field, pass the
> > state to all entity operations that needs to access it, instead of
> > accessing the state from the entity inside the operation handlers. This
> > lowers the number of accesses to the field.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I recall you sent a series to s/sd_state/state in some i2c subdev ?

Patch 19/19 in this series renames everything to 'state'. I'll rename
state variables in this patch already and address the leftovers in
19/19, making it smaller.

> Not a big deal
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> > ---
> >  .../media/platform/renesas/vsp1/vsp1_brx.c    |  4 ++--
> >  .../media/platform/renesas/vsp1/vsp1_clu.c    |  3 ++-
> >  .../media/platform/renesas/vsp1/vsp1_drm.c    |  3 ++-
> >  .../media/platform/renesas/vsp1/vsp1_entity.c |  3 ++-
> >  .../media/platform/renesas/vsp1/vsp1_entity.h |  4 ++++
> >  .../media/platform/renesas/vsp1/vsp1_hgo.c    |  5 +++--
> >  .../media/platform/renesas/vsp1/vsp1_hgt.c    |  5 +++--
> >  .../media/platform/renesas/vsp1/vsp1_hsit.c   |  1 +
> >  .../media/platform/renesas/vsp1/vsp1_lif.c    |  4 ++--
> >  .../media/platform/renesas/vsp1/vsp1_lut.c    |  1 +
> >  .../media/platform/renesas/vsp1/vsp1_pipe.c   |  4 ++--
> >  .../media/platform/renesas/vsp1/vsp1_rpf.c    | 10 ++++-----
> >  .../media/platform/renesas/vsp1/vsp1_sru.c    | 22 ++++++++-----------
> >  .../media/platform/renesas/vsp1/vsp1_uds.c    | 20 ++++++++---------
> >  .../media/platform/renesas/vsp1/vsp1_uif.c    |  3 ++-
> >  .../media/platform/renesas/vsp1/vsp1_video.c  |  6 +++--
> >  .../media/platform/renesas/vsp1/vsp1_wpf.c    |  9 ++++----
> >  17 files changed, 58 insertions(+), 49 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > index 05940d0427bf..7639ea53dd47 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > @@ -272,6 +272,7 @@ static const struct v4l2_subdev_ops brx_ops = {
> >   */
> >
> >  static void brx_configure_stream(struct vsp1_entity *entity,
> > +				 struct v4l2_subdev_state *sd_state,
> >  				 struct vsp1_pipeline *pipe,
> >  				 struct vsp1_dl_list *dl,
> >  				 struct vsp1_dl_body *dlb)
> > @@ -281,8 +282,7 @@ static void brx_configure_stream(struct vsp1_entity *entity,
> >  	unsigned int flags;
> >  	unsigned int i;
> >
> > -	format = v4l2_subdev_state_get_format(brx->entity.state,
> > -					      brx->entity.source_pad);
> > +	format = v4l2_subdev_state_get_format(sd_state, brx->entity.source_pad);
> >
> >  	/*
> >  	 * The hardware is extremely flexible but we have no userspace API to
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_clu.c b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
> > index 1e57676a420c..56c77809d2ec 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_clu.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
> > @@ -170,6 +170,7 @@ static const struct v4l2_subdev_ops clu_ops = {
> >   */
> >
> >  static void clu_configure_stream(struct vsp1_entity *entity,
> > +				 struct v4l2_subdev_state *sd_state,
> >  				 struct vsp1_pipeline *pipe,
> >  				 struct vsp1_dl_list *dl,
> >  				 struct vsp1_dl_body *dlb)
> > @@ -181,7 +182,7 @@ static void clu_configure_stream(struct vsp1_entity *entity,
> >  	 * The yuv_mode can't be changed during streaming. Cache it internally
> >  	 * for future runtime configuration calls.
> >  	 */
> > -	format = v4l2_subdev_state_get_format(clu->entity.state, CLU_PAD_SINK);
> > +	format = v4l2_subdev_state_get_format(sd_state, CLU_PAD_SINK);
> >  	clu->yuv_mode = format->code == MEDIA_BUS_FMT_AYUV8_1X32;
> >  }
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > index 11313e26a298..b5d1f238f7be 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > @@ -574,7 +574,8 @@ static void vsp1_du_pipeline_configure(struct vsp1_pipeline *pipe)
> >  		}
> >
> >  		vsp1_entity_route_setup(entity, pipe, dlb);
> > -		vsp1_entity_configure_stream(entity, pipe, dl, dlb);
> > +		vsp1_entity_configure_stream(entity, entity->state, pipe,
> > +					     dl, dlb);
> >  		vsp1_entity_configure_frame(entity, pipe, dl, dlb);
> >  		vsp1_entity_configure_partition(entity, pipe,
> >  						&pipe->part_table[0], dl, dlb);
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > index e9de75de8bde..d3533a75361a 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > @@ -70,12 +70,13 @@ void vsp1_entity_route_setup(struct vsp1_entity *entity,
> >  }
> >
> >  void vsp1_entity_configure_stream(struct vsp1_entity *entity,
> > +				  struct v4l2_subdev_state *sd_state,
> >  				  struct vsp1_pipeline *pipe,
> >  				  struct vsp1_dl_list *dl,
> >  				  struct vsp1_dl_body *dlb)
> >  {
> >  	if (entity->ops->configure_stream)
> > -		entity->ops->configure_stream(entity, pipe, dl, dlb);
> > +		entity->ops->configure_stream(entity, sd_state, pipe, dl, dlb);
> >  }
> >
> >  void vsp1_entity_configure_frame(struct vsp1_entity *entity,
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> > index 42000d6e2530..1d9d050e79da 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> > @@ -79,6 +79,7 @@ struct vsp1_route {
> >  struct vsp1_entity_operations {
> >  	void (*destroy)(struct vsp1_entity *entity);
> >  	void (*configure_stream)(struct vsp1_entity *entity,
> > +				 struct v4l2_subdev_state *state,
> >  				 struct vsp1_pipeline *pipe,
> >  				 struct vsp1_dl_list *dl,
> >  				 struct vsp1_dl_body *dlb);
> > @@ -92,8 +93,10 @@ struct vsp1_entity_operations {
> >  				    struct vsp1_dl_list *dl,
> >  				    struct vsp1_dl_body *dlb);
> >  	unsigned int (*max_width)(struct vsp1_entity *entity,
> > +				  struct v4l2_subdev_state *state,
> >  				  struct vsp1_pipeline *pipe);
> >  	void (*partition)(struct vsp1_entity *entity,
> > +			  struct v4l2_subdev_state *state,
> >  			  struct vsp1_pipeline *pipe,
> >  			  struct vsp1_partition *partition,
> >  			  unsigned int index,
> > @@ -151,6 +154,7 @@ void vsp1_entity_route_setup(struct vsp1_entity *entity,
> >  			     struct vsp1_dl_body *dlb);
> >
> >  void vsp1_entity_configure_stream(struct vsp1_entity *entity,
> > +				  struct v4l2_subdev_state *sd_state,
> >  				  struct vsp1_pipeline *pipe,
> >  				  struct vsp1_dl_list *dl,
> >  				  struct vsp1_dl_body *dlb);
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
> > index 4ee5f0e5e9c3..237dc4c7c5ed 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
> > @@ -130,6 +130,7 @@ static const struct v4l2_ctrl_config hgo_num_bins_control = {
> >   */
> >
> >  static void hgo_configure_stream(struct vsp1_entity *entity,
> > +				 struct v4l2_subdev_state *sd_state,
> >  				 struct vsp1_pipeline *pipe,
> >  				 struct vsp1_dl_list *dl,
> >  				 struct vsp1_dl_body *dlb)
> > @@ -140,8 +141,8 @@ static void hgo_configure_stream(struct vsp1_entity *entity,
> >  	unsigned int hratio;
> >  	unsigned int vratio;
> >
> > -	crop = v4l2_subdev_state_get_crop(entity->state, HISTO_PAD_SINK);
> > -	compose = v4l2_subdev_state_get_compose(entity->state, HISTO_PAD_SINK);
> > +	crop = v4l2_subdev_state_get_crop(sd_state, HISTO_PAD_SINK);
> > +	compose = v4l2_subdev_state_get_compose(sd_state, HISTO_PAD_SINK);
> >
> >  	vsp1_hgo_write(hgo, dlb, VI6_HGO_REGRST, VI6_HGO_REGRST_RCLEA);
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
> > index b739d8045576..b73eac676ef0 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
> > @@ -126,6 +126,7 @@ static const struct v4l2_ctrl_config hgt_hue_areas = {
> >   */
> >
> >  static void hgt_configure_stream(struct vsp1_entity *entity,
> > +				 struct v4l2_subdev_state *sd_state,
> >  				 struct vsp1_pipeline *pipe,
> >  				 struct vsp1_dl_list *dl,
> >  				 struct vsp1_dl_body *dlb)
> > @@ -139,8 +140,8 @@ static void hgt_configure_stream(struct vsp1_entity *entity,
> >  	u8 upper;
> >  	unsigned int i;
> >
> > -	crop = v4l2_subdev_state_get_crop(entity->state, HISTO_PAD_SINK);
> > -	compose = v4l2_subdev_state_get_compose(entity->state, HISTO_PAD_SINK);
> > +	crop = v4l2_subdev_state_get_crop(sd_state, HISTO_PAD_SINK);
> > +	compose = v4l2_subdev_state_get_compose(sd_state, HISTO_PAD_SINK);
> >
> >  	vsp1_hgt_write(hgt, dlb, VI6_HGT_REGRST, VI6_HGT_REGRST_RCLEA);
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
> > index 4a8cce808c93..932ac1c795bc 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
> > @@ -127,6 +127,7 @@ static const struct v4l2_subdev_ops hsit_ops = {
> >   */
> >
> >  static void hsit_configure_stream(struct vsp1_entity *entity,
> > +				  struct v4l2_subdev_state *sd_state,
> >  				  struct vsp1_pipeline *pipe,
> >  				  struct vsp1_dl_list *dl,
> >  				  struct vsp1_dl_body *dlb)
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lif.c b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> > index 29d4c1521e6a..308917338022 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> > @@ -83,6 +83,7 @@ static const struct v4l2_subdev_ops lif_ops = {
> >   */
> >
> >  static void lif_configure_stream(struct vsp1_entity *entity,
> > +				 struct v4l2_subdev_state *sd_state,
> >  				 struct vsp1_pipeline *pipe,
> >  				 struct vsp1_dl_list *dl,
> >  				 struct vsp1_dl_body *dlb)
> > @@ -93,8 +94,7 @@ static void lif_configure_stream(struct vsp1_entity *entity,
> >  	unsigned int obth;
> >  	unsigned int lbth;
> >
> > -	format = v4l2_subdev_state_get_format(lif->entity.state,
> > -					      LIF_PAD_SOURCE);
> > +	format = v4l2_subdev_state_get_format(sd_state, LIF_PAD_SOURCE);
> >
> >  	switch (entity->vsp1->version & VI6_IP_VERSION_MODEL_MASK) {
> >  	case VI6_IP_VERSION_MODEL_VSPD_GEN2:
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lut.c b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
> > index 451d24ab0b56..0382ddaa6911 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_lut.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
> > @@ -146,6 +146,7 @@ static const struct v4l2_subdev_ops lut_ops = {
> >   */
> >
> >  static void lut_configure_stream(struct vsp1_entity *entity,
> > +				 struct v4l2_subdev_state *sd_state,
> >  				 struct vsp1_pipeline *pipe,
> >  				 struct vsp1_dl_list *dl,
> >  				 struct vsp1_dl_body *dlb)
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > index edc5e9f3ba65..37f89fa5a6e2 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > @@ -487,8 +487,8 @@ static void vsp1_pipeline_propagate_partition(struct vsp1_pipeline *pipe,
> >
> >  	list_for_each_entry_reverse(entity, &pipe->entities, list_pipe) {
> >  		if (entity->ops->partition)
> > -			entity->ops->partition(entity, pipe, partition, index,
> > -					       window);
> > +			entity->ops->partition(entity, entity->state, pipe,
> > +					       partition, index, window);
> >  	}
> >  }
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> > index b4558670b46f..309f02b49088 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> > @@ -48,6 +48,7 @@ static inline void vsp1_rpf_write(struct vsp1_rwpf *rpf,
> >   */
> >
> >  static void rpf_configure_stream(struct vsp1_entity *entity,
> > +				 struct v4l2_subdev_state *sd_state,
> >  				 struct vsp1_pipeline *pipe,
> >  				 struct vsp1_dl_list *dl,
> >  				 struct vsp1_dl_body *dlb)
> > @@ -80,10 +81,8 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
> >  	vsp1_rpf_write(rpf, dlb, VI6_RPF_SRCM_PSTRIDE, pstride);
> >
> >  	/* Format */
> > -	sink_format = v4l2_subdev_state_get_format(rpf->entity.state,
> > -						   RWPF_PAD_SINK);
> > -	source_format = v4l2_subdev_state_get_format(rpf->entity.state,
> > -						     RWPF_PAD_SOURCE);
> > +	sink_format = v4l2_subdev_state_get_format(sd_state, RWPF_PAD_SINK);
> > +	source_format = v4l2_subdev_state_get_format(sd_state, RWPF_PAD_SOURCE);
> >
> >  	infmt = VI6_RPF_INFMT_CIPM
> >  	      | (fmtinfo->hwfmt << VI6_RPF_INFMT_RDFMT_SHIFT);
> > @@ -347,6 +346,7 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
> >  }
> >
> >  static void rpf_partition(struct vsp1_entity *entity,
> > +			  struct v4l2_subdev_state *sd_state,
> >  			  struct vsp1_pipeline *pipe,
> >  			  struct vsp1_partition *partition,
> >  			  unsigned int partition_idx,
> > @@ -364,7 +364,7 @@ static void rpf_partition(struct vsp1_entity *entity,
> >  	 * our crop to provide a 'sub-crop' matching the expected partition
> >  	 * window.
> >  	 */
> > -	*rpf_rect = *v4l2_subdev_state_get_crop(entity->state, RWPF_PAD_SINK);
> > +	*rpf_rect = *v4l2_subdev_state_get_crop(sd_state, RWPF_PAD_SINK);
> >
> >  	if (pipe->partitions > 1) {
> >  		rpf_rect->width = window->width;
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> > index f35187daa643..4f32024b9ed4 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> > @@ -265,6 +265,7 @@ static const struct v4l2_subdev_ops sru_ops = {
> >   */
> >
> >  static void sru_configure_stream(struct vsp1_entity *entity,
> > +				 struct v4l2_subdev_state *sd_state,
> >  				 struct vsp1_pipeline *pipe,
> >  				 struct vsp1_dl_list *dl,
> >  				 struct vsp1_dl_body *dlb)
> > @@ -275,9 +276,8 @@ static void sru_configure_stream(struct vsp1_entity *entity,
> >  	struct v4l2_mbus_framefmt *output;
> >  	u32 ctrl0;
> >
> > -	input = v4l2_subdev_state_get_format(sru->entity.state, SRU_PAD_SINK);
> > -	output = v4l2_subdev_state_get_format(sru->entity.state,
> > -					      SRU_PAD_SOURCE);
> > +	input = v4l2_subdev_state_get_format(sd_state, SRU_PAD_SINK);
> > +	output = v4l2_subdev_state_get_format(sd_state, SRU_PAD_SOURCE);
> >
> >  	if (input->code == MEDIA_BUS_FMT_ARGB8888_1X32)
> >  		ctrl0 = VI6_SRU_CTRL0_PARAM2 | VI6_SRU_CTRL0_PARAM3
> > @@ -298,16 +298,14 @@ static void sru_configure_stream(struct vsp1_entity *entity,
> >  }
> >
> >  static unsigned int sru_max_width(struct vsp1_entity *entity,
> > +				  struct v4l2_subdev_state *sd_state,
> >  				  struct vsp1_pipeline *pipe)
> >  {
> > -	struct vsp1_sru *sru = to_sru(&entity->subdev);
> >  	struct v4l2_mbus_framefmt *input;
> >  	struct v4l2_mbus_framefmt *output;
> >
> > -	input = v4l2_subdev_state_get_format(sru->entity.state,
> > -					     SRU_PAD_SINK);
> > -	output = v4l2_subdev_state_get_format(sru->entity.state,
> > -					      SRU_PAD_SOURCE);
> > +	input = v4l2_subdev_state_get_format(sd_state, SRU_PAD_SINK);
> > +	output = v4l2_subdev_state_get_format(sd_state, SRU_PAD_SOURCE);
> >
> >  	/*
> >  	 * The maximum input width of the SRU is 288 input pixels, but 32
> > @@ -321,19 +319,17 @@ static unsigned int sru_max_width(struct vsp1_entity *entity,
> >  }
> >
> >  static void sru_partition(struct vsp1_entity *entity,
> > +			  struct v4l2_subdev_state *sd_state,
> >  			  struct vsp1_pipeline *pipe,
> >  			  struct vsp1_partition *partition,
> >  			  unsigned int partition_idx,
> >  			  struct v4l2_rect *window)
> >  {
> > -	struct vsp1_sru *sru = to_sru(&entity->subdev);
> >  	struct v4l2_mbus_framefmt *input;
> >  	struct v4l2_mbus_framefmt *output;
> >
> > -	input = v4l2_subdev_state_get_format(sru->entity.state,
> > -					     SRU_PAD_SINK);
> > -	output = v4l2_subdev_state_get_format(sru->entity.state,
> > -					      SRU_PAD_SOURCE);
> > +	input = v4l2_subdev_state_get_format(sd_state, SRU_PAD_SINK);
> > +	output = v4l2_subdev_state_get_format(sd_state, SRU_PAD_SOURCE);
> >
> >  	/* Adapt if SRUx2 is enabled. */
> >  	if (input->width != output->width) {
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> > index e5953d86c17c..d39a89a0f27d 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> > @@ -252,6 +252,7 @@ static const struct v4l2_subdev_ops uds_ops = {
> >   */
> >
> >  static void uds_configure_stream(struct vsp1_entity *entity,
> > +				 struct v4l2_subdev_state *sd_state,
> >  				 struct vsp1_pipeline *pipe,
> >  				 struct vsp1_dl_list *dl,
> >  				 struct vsp1_dl_body *dlb)
> > @@ -263,9 +264,8 @@ static void uds_configure_stream(struct vsp1_entity *entity,
> >  	unsigned int vscale;
> >  	bool multitap;
> >
> > -	input = v4l2_subdev_state_get_format(uds->entity.state, UDS_PAD_SINK);
> > -	output = v4l2_subdev_state_get_format(uds->entity.state,
> > -					      UDS_PAD_SOURCE);
> > +	input = v4l2_subdev_state_get_format(sd_state, UDS_PAD_SINK);
> > +	output = v4l2_subdev_state_get_format(sd_state, UDS_PAD_SOURCE);
> >
> >  	hscale = uds_compute_ratio(input->width, output->width);
> >  	vscale = uds_compute_ratio(input->height, output->height);
> > @@ -321,16 +321,15 @@ static void uds_configure_partition(struct vsp1_entity *entity,
> >  }
> >
> >  static unsigned int uds_max_width(struct vsp1_entity *entity,
> > +				  struct v4l2_subdev_state *sd_state,
> >  				  struct vsp1_pipeline *pipe)
> >  {
> > -	struct vsp1_uds *uds = to_uds(&entity->subdev);
> >  	const struct v4l2_mbus_framefmt *output;
> >  	const struct v4l2_mbus_framefmt *input;
> >  	unsigned int hscale;
> >
> > -	input = v4l2_subdev_state_get_format(uds->entity.state, UDS_PAD_SINK);
> > -	output = v4l2_subdev_state_get_format(uds->entity.state,
> > -					      UDS_PAD_SOURCE);
> > +	input = v4l2_subdev_state_get_format(sd_state, UDS_PAD_SINK);
> > +	output = v4l2_subdev_state_get_format(sd_state, UDS_PAD_SOURCE);
> >  	hscale = output->width / input->width;
> >
> >  	/*
> > @@ -356,18 +355,17 @@ static unsigned int uds_max_width(struct vsp1_entity *entity,
> >   */
> >
> >  static void uds_partition(struct vsp1_entity *entity,
> > +			  struct v4l2_subdev_state *sd_state,
> >  			  struct vsp1_pipeline *pipe,
> >  			  struct vsp1_partition *partition,
> >  			  unsigned int partition_idx,
> >  			  struct v4l2_rect *window)
> >  {
> > -	struct vsp1_uds *uds = to_uds(&entity->subdev);
> >  	const struct v4l2_mbus_framefmt *output;
> >  	const struct v4l2_mbus_framefmt *input;
> >
> > -	input = v4l2_subdev_state_get_format(uds->entity.state, UDS_PAD_SINK);
> > -	output = v4l2_subdev_state_get_format(uds->entity.state,
> > -					      UDS_PAD_SOURCE);
> > +	input = v4l2_subdev_state_get_format(sd_state, UDS_PAD_SINK);
> > +	output = v4l2_subdev_state_get_format(sd_state, UDS_PAD_SOURCE);
> >
> >  	partition->uds_sink.width = window->width * input->width
> >  				  / output->width;
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uif.c b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
> > index cecd2f7024f4..e69acb5f0fbb 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_uif.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
> > @@ -188,6 +188,7 @@ static const struct v4l2_subdev_ops uif_ops = {
> >   */
> >
> >  static void uif_configure_stream(struct vsp1_entity *entity,
> > +				 struct v4l2_subdev_state *sd_state,
> >  				 struct vsp1_pipeline *pipe,
> >  				 struct vsp1_dl_list *dl,
> >  				 struct vsp1_dl_body *dlb)
> > @@ -200,7 +201,7 @@ static void uif_configure_stream(struct vsp1_entity *entity,
> >  	vsp1_uif_write(uif, dlb, VI6_UIF_DISCOM_DOCMPMR,
> >  		       VI6_UIF_DISCOM_DOCMPMR_SEL(9));
> >
> > -	crop = v4l2_subdev_state_get_crop(entity->state, UIF_PAD_SINK);
> > +	crop = v4l2_subdev_state_get_crop(sd_state, UIF_PAD_SINK);
> >
> >  	left = crop->left;
> >  	width = crop->width;
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > index 84394994ccee..6645cf1d533b 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > @@ -693,7 +693,9 @@ static int vsp1_video_pipeline_setup_partitions(struct vsp1_pipeline *pipe)
> >  			if (!entity->ops->max_width)
> >  				continue;
> >
> > -			entity_max = entity->ops->max_width(entity, pipe);
> > +			entity_max = entity->ops->max_width(entity,
> > +							    entity->state,
> > +							    pipe);
> >  			if (entity_max)
> >  				div_size = min(div_size, entity_max);
> >  		}
> > @@ -754,7 +756,7 @@ static int vsp1_video_setup_pipeline(struct vsp1_pipeline *pipe)
> >
> >  	list_for_each_entry(entity, &pipe->entities, list_pipe) {
> >  		vsp1_entity_route_setup(entity, pipe, pipe->stream_config);
> > -		vsp1_entity_configure_stream(entity, pipe, NULL,
> > +		vsp1_entity_configure_stream(entity, entity->state, pipe, NULL,
> >  					     pipe->stream_config);
> >  	}
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > index 5c363ff1d36c..e3d961c8d3e3 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > @@ -229,6 +229,7 @@ static int wpf_configure_writeback_chain(struct vsp1_rwpf *wpf,
> >  }
> >
> >  static void wpf_configure_stream(struct vsp1_entity *entity,
> > +				 struct v4l2_subdev_state *sd_state,
> >  				 struct vsp1_pipeline *pipe,
> >  				 struct vsp1_dl_list *dl,
> >  				 struct vsp1_dl_body *dlb)
> > @@ -243,10 +244,8 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
> >  	u32 srcrpf = 0;
> >  	int ret;
> >
> > -	sink_format = v4l2_subdev_state_get_format(wpf->entity.state,
> > -						   RWPF_PAD_SINK);
> > -	source_format = v4l2_subdev_state_get_format(wpf->entity.state,
> > -						     RWPF_PAD_SOURCE);
> > +	sink_format = v4l2_subdev_state_get_format(sd_state, RWPF_PAD_SINK);
> > +	source_format = v4l2_subdev_state_get_format(sd_state, RWPF_PAD_SOURCE);
> >
> >  	/* Format */
> >  	if (!pipe->lif || wpf->writeback) {
> > @@ -496,6 +495,7 @@ static void wpf_configure_partition(struct vsp1_entity *entity,
> >  }
> >
> >  static unsigned int wpf_max_width(struct vsp1_entity *entity,
> > +				  struct v4l2_subdev_state *sd_state,
> >  				  struct vsp1_pipeline *pipe)
> >  {
> >  	struct vsp1_rwpf *wpf = to_rwpf(&entity->subdev);
> > @@ -504,6 +504,7 @@ static unsigned int wpf_max_width(struct vsp1_entity *entity,
> >  }
> >
> >  static void wpf_partition(struct vsp1_entity *entity,
> > +			  struct v4l2_subdev_state *sd_state,
> >  			  struct vsp1_pipeline *pipe,
> >  			  struct vsp1_partition *partition,
> >  			  unsigned int partition_idx,

-- 
Regards,

Laurent Pinchart

