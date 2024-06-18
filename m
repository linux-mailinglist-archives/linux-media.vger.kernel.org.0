Return-Path: <linux-media+bounces-13529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A669190CA4F
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 13:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBD6B1C208E3
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 11:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A1C12AAC9;
	Tue, 18 Jun 2024 11:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TtNZD90Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C82684FDA;
	Tue, 18 Jun 2024 11:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718709866; cv=none; b=SrcfEGX2qiIbXlvTVlTT1Q+N2qxZtvdK9nt3CtVJEYuUreqxD7kJvOrQfHvQkUn47DZVlu5Yx8OauoQDUWveSgCe6eF9svmq6ZNHdNOX1MlOyDpvxheIlISi3FDOHGxwl8EfwbIdYTJDW4k7wIhpQentQpEOyQyZNV3R0BFDLu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718709866; c=relaxed/simple;
	bh=UzDzzwmCptANTEjLdzd319szTX9+0Md14gZ5ku8nmss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZmbdiD1a7eAHG4HE0vu8xaFll72kzr6pF6ZnPC0agBJ/Im9Xc5GyQ7HmqMdfjy7CYCte+XGq5UUDmNh3kujbMQc0Tt/ZkO9R0dOZfKmPEIu6lcZ3vT9mzuTiy6mrInEElXcZDXMuHVQzHTCFOv7ST1xl6sL+WNAStyAbWkC52I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TtNZD90Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE1847E1;
	Tue, 18 Jun 2024 13:24:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718709845;
	bh=UzDzzwmCptANTEjLdzd319szTX9+0Md14gZ5ku8nmss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TtNZD90YcTRTbYSwC3glTjkernxwURQiAkmTqGyuONNZwerTPIdgUYigFMtJ82Fei
	 znHyO03ea3dO2uKcG8aMGzX9uBeKJBcyfPrXSJ4uBdTRd7Uvqsjqb/ezi3rjpoEMm6
	 OYHx3TwoPedqCqRVOhVuZ1IxrC9Y+4D9ZnSuc/C8=
Date: Tue, 18 Jun 2024 13:24:20 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC PATCH v1 15/19] media: renesas: vsp1: Name parameters to
 entity operations
Message-ID: <aga4pnlyjzut3vh2kjdw64ticisue66asz6ey4qaaqnsra5r7v@nnm37te2ghhl>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231122043009.2741-16-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122043009.2741-16-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Wed, Nov 22, 2023 at 06:30:05AM GMT, Laurent Pinchart wrote:
> checkpatch.pl complains when function arguments are not named:
>
> WARNING: function definition argument 'struct vsp1_entity *' should also have an identifier name
> +       void (*configure_stream)(struct vsp1_entity *,
>
> In preparation for reworking some of the vsp1_entity_operations
> functions, fix the warnings for the existing ones.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  .../media/platform/renesas/vsp1/vsp1_entity.h | 35 +++++++++++--------
>  1 file changed, 21 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> index f67f60677644..42000d6e2530 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> @@ -77,20 +77,27 @@ struct vsp1_route {
>   *		configuration.
>   */
>  struct vsp1_entity_operations {
> -	void (*destroy)(struct vsp1_entity *);
> -	void (*configure_stream)(struct vsp1_entity *, struct vsp1_pipeline *,
> -				 struct vsp1_dl_list *, struct vsp1_dl_body *);
> -	void (*configure_frame)(struct vsp1_entity *, struct vsp1_pipeline *,
> -				struct vsp1_dl_list *, struct vsp1_dl_body *);
> -	void (*configure_partition)(struct vsp1_entity *,
> -				    struct vsp1_pipeline *,
> -				    const struct vsp1_partition *,
> -				    struct vsp1_dl_list *,
> -				    struct vsp1_dl_body *);
> -	unsigned int (*max_width)(struct vsp1_entity *, struct vsp1_pipeline *);
> -	void (*partition)(struct vsp1_entity *, struct vsp1_pipeline *,
> -			  struct vsp1_partition *, unsigned int,
> -			  struct v4l2_rect *);
> +	void (*destroy)(struct vsp1_entity *entity);
> +	void (*configure_stream)(struct vsp1_entity *entity,
> +				 struct vsp1_pipeline *pipe,
> +				 struct vsp1_dl_list *dl,
> +				 struct vsp1_dl_body *dlb);
> +	void (*configure_frame)(struct vsp1_entity *entity,
> +				struct vsp1_pipeline *pipe,
> +				struct vsp1_dl_list *dl,
> +				struct vsp1_dl_body *dlb);
> +	void (*configure_partition)(struct vsp1_entity *entity,
> +				    struct vsp1_pipeline *pipe,
> +				    const struct vsp1_partition *partition,
> +				    struct vsp1_dl_list *dl,
> +				    struct vsp1_dl_body *dlb);
> +	unsigned int (*max_width)(struct vsp1_entity *entity,
> +				  struct vsp1_pipeline *pipe);
> +	void (*partition)(struct vsp1_entity *entity,
> +			  struct vsp1_pipeline *pipe,
> +			  struct vsp1_partition *partition,
> +			  unsigned int index,
> +			  struct v4l2_rect *window);
>  };
>
>  struct vsp1_entity {
> --
> Regards,
>
> Laurent Pinchart
>
>

