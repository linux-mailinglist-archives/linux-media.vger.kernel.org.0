Return-Path: <linux-media+bounces-13576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FC690D8A3
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 18:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE4051C23884
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C331514DD;
	Tue, 18 Jun 2024 16:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YmSECyUK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20AD145B31;
	Tue, 18 Jun 2024 16:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718727007; cv=none; b=CjTdAkpkNCzFCRNeR6E588ldW0QSAGJDIZPsS52lrN6eW1nObVxVb4afKcbR2ILbg/UqCkrekLIFeiE5PrNodZ1D5TCKvFc5mLD1VFNbwEohKKojUVWVZjhaa8vTlIlG6hakISH93ZCgKwtpChD3rTypASPHmyeoAU1kFGnP2Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718727007; c=relaxed/simple;
	bh=Hd2gp8jde7LL8S8vLclOU8RqNPS2mQjKPhPBQWsrpAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSIhfV80ogddcjomJTv37vPWb5hEBop3VQqL7RmavUQ7WRNhQqNCeYdpC/yOyVEKsytsas5v6t6oPGVsv/QW93aybo/kKTHNxHRTPIxG4qwDFg+IZYOggAcdfNQsKndd1xw6gpUt/w2eBG7EJyntxvxuMUy2YXuC9wPbmXapF1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YmSECyUK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C85B564;
	Tue, 18 Jun 2024 18:09:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718726986;
	bh=Hd2gp8jde7LL8S8vLclOU8RqNPS2mQjKPhPBQWsrpAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YmSECyUK8rcjsRFzKJyEWpnSdXvLTCKtdNtT0dvW95tSvL5T9E/5iSyK0I5okx2VU
	 9bI5eoQkY8ihA8zenMZOkJ/Z6tNnp1FuMIWm6zLAVgg+DgUtKTSWvUSCXN6vIBdIVB
	 TG3CnsOjg3Ut7mgqGQNGwic7mgEKgDAmVLUvmcOM=
Date: Tue, 18 Jun 2024 19:09:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC PATCH v1 08/19] media: renesas: vsp1: Store RPF partition
 configuration per RPF instance
Message-ID: <20240618160942.GD32669@pendragon.ideasonboard.com>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231122043009.2741-9-laurent.pinchart+renesas@ideasonboard.com>
 <fzdn7eq4xhofryqqquo3eqpixplegswvkfomhp227fyskhvh7b@la56opfmfr4h>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fzdn7eq4xhofryqqquo3eqpixplegswvkfomhp227fyskhvh7b@la56opfmfr4h>

On Tue, Jun 18, 2024 at 12:32:47PM +0200, Jacopo Mondi wrote:
> Hi Laurent
> 
> On Wed, Nov 22, 2023 at 06:29:58AM GMT, Laurent Pinchart wrote:
> > The vsp1_partition structure stores the RPF partition configuration in a
> > single field for all RPF instances, while each RPF can have its own
> > configuration. Fix it by storing the configuration separately for each
> > RPF instance.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Is this worth a Fixes: tag ?

I'll add

Fixes: ab45e8585182 ("media: v4l: vsp1: Allow entities to participate in the partition algorithm")

This was introduced in v5.2, I'm not sure if the fix can be meaningfully
backported.

> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_pipe.h | 2 +-
> >  drivers/media/platform/renesas/vsp1/vsp1_rpf.c  | 8 +++++---
> >  2 files changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> > index 02e98d843730..840fd3288efb 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> > @@ -73,7 +73,7 @@ struct vsp1_partition_window {
> >   * @wpf: The WPF partition window configuration
> >   */
> >  struct vsp1_partition {
> > -	struct vsp1_partition_window rpf;
> > +	struct vsp1_partition_window rpf[VSP1_MAX_RPF];
> >  	struct vsp1_partition_window uds_sink;
> >  	struct vsp1_partition_window uds_source;
> >  	struct vsp1_partition_window sru;
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> > index 3e62638fdce6..42b0c5655404 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> > @@ -311,8 +311,8 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
> >  	 * 'width' need to be adjusted.
> >  	 */
> >  	if (pipe->partitions > 1) {
> > -		crop.width = pipe->partition->rpf.width;
> > -		crop.left += pipe->partition->rpf.left;
> > +		crop.width = pipe->partition->rpf[rpf->entity.index].width;
> > +		crop.left += pipe->partition->rpf[rpf->entity.index].left;
> >  	}
> >
> >  	if (pipe->interlaced) {
> > @@ -367,7 +367,9 @@ static void rpf_partition(struct vsp1_entity *entity,
> >  			  unsigned int partition_idx,
> >  			  struct vsp1_partition_window *window)
> >  {
> > -	partition->rpf = *window;
> > +	struct vsp1_rwpf *rpf = to_rwpf(&entity->subdev);
> > +
> > +	partition->rpf[rpf->entity.index] = *window;
> >  }
> >
> >  static const struct vsp1_entity_operations rpf_entity_ops = {

-- 
Regards,

Laurent Pinchart

