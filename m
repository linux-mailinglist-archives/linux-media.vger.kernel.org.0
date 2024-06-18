Return-Path: <linux-media+bounces-13522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD32390C970
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 13:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF10F1C2336C
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 11:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB3D13E3EE;
	Tue, 18 Jun 2024 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SFRDuNsM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29000131E41;
	Tue, 18 Jun 2024 10:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706556; cv=none; b=CJ1bUiMsQPUJ1XcKmnyz7cG2FMds/afuq2G3AXozxvNPRvkaUOLGDUW8Et3S73VV5I3ZZFQ9FY9Kd6hcoGkKxb3G/+cuxlpiUIS35fjN4xx4Xr/Ji4IudBM5kWei9FxOC7AXgZ8g7Rs01Il6eq/dd+GpBifl4poGwosDizBJnS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706556; c=relaxed/simple;
	bh=i/vbYMzV09lvmllMwQDrzk4i1bXW2AowZWY1Lqym2OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVz3qMwYumqHWruWq0btPaQ3NP9lXBl9sTf9aLw5Pu/6YEgaxLSZF8qXSQ46zNPlBXGAFuUIAVoRyjjqpBaqgWR8B4tiRvK5b2EuuDGNTflTlGfsObz5g50Fg0gVi+woX34EJqjMtgvek5cVLP0ugYhltKno4Ekk84cdiCcLSss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SFRDuNsM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 522EE564;
	Tue, 18 Jun 2024 12:28:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718706534;
	bh=i/vbYMzV09lvmllMwQDrzk4i1bXW2AowZWY1Lqym2OM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SFRDuNsMKzyWkLatI+AyeRgwbjpSBtMu80Mv/d41NIQQqhE6UmCcqtTppR9SVGiJ9
	 4JVhbp08USNl7vIreNpt1sBvVO01hoLrhjmxeyPTcP9YVCej8qxEcar2PIDXEbyJKh
	 dKBSdtERQlxAbqMgRSApS4i+8RZ4Oq9y9haGj/qE=
Date: Tue, 18 Jun 2024 12:29:08 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC PATCH v1 07/19] media: renesas: vsp1: Simplify partition
 calculation
Message-ID: <wu4rr6we2sx6rnkn4tnmztagqj2cgz4qbqmsfvtzpm5dqywzrb@k7c26twnb3bi>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231122043009.2741-8-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122043009.2741-8-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Wed, Nov 22, 2023 at 06:29:57AM GMT, Laurent Pinchart wrote:
> When calculation a partition in vsp1_pipeline_calculate_partition(),
> there is no need to handle the case where the whole image is covered by
> a single partition locally. In that case, the index and div_size
> parameters are 0 and format->width respectively, which makes the general
> code behave exactly as the special case. Drop the special case.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> index b90240b24b3a..ca6817f45dd2 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> @@ -495,16 +495,6 @@ void vsp1_pipeline_calculate_partition(struct vsp1_pipeline *pipe,
>  	format = v4l2_subdev_state_get_format(pipe->output->entity.state,
>  					      RWPF_PAD_SINK);
>
> -	/* A single partition simply processes the output size in full. */
> -	if (pipe->partitions <= 1) {
> -		window.left = 0;
> -		window.width = format->width;
> -
> -		vsp1_pipeline_propagate_partition(pipe, partition, index,
> -						  &window);
> -		return;
> -	}
> -
>  	/* Initialise the partition with sane starting conditions. */
>  	window.left = index * div_size;
>  	window.width = div_size;

Assuming index == 0 and div_size == format->width in case of a single
partition:
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> --
> Regards,
>
> Laurent Pinchart
>
>

