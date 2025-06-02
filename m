Return-Path: <linux-media+bounces-33927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5BAACAFDB
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B0413B0740
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE3122156B;
	Mon,  2 Jun 2025 13:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NN4GR4hx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41A72576;
	Mon,  2 Jun 2025 13:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872670; cv=none; b=fXgGVGyYC+M0j3OuZMAoUzXdxa9RU+nDh4VVhusADgkDphmsMfKlr2ugrydNxJ/tSSTSNdH2kx80ZC+mD0UYZeZ7JJDTLUqiF/QKg2UKBIFL/an9brd3Z3kr+g157WV58wvg6pD/QhX+veUIC2SzWp2toO12+9x860ca3cNp2hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872670; c=relaxed/simple;
	bh=8PwdyMlO42U6o10QF7rzabYrBPW9CnENmGdw2/V0FlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGPV4MgZdKLBsnprwJXj+EEJd8dXxro+WgNzkzNIoV6yP3t7TPsRFpDTQ+IBhYwqOhTFrJ29e2yGT3QBOvssX159I30lE4J5QHuvd+WAnmAbfs8ES4U+4Jm4sbv2R59k2n4j3H4yFXD0nxPSr9qgmonRtvcVvj2h7rhiv/NtGFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NN4GR4hx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E31CC9;
	Mon,  2 Jun 2025 15:57:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748872665;
	bh=8PwdyMlO42U6o10QF7rzabYrBPW9CnENmGdw2/V0FlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NN4GR4hxhOnjAsGyrA8EAID9V/1KB3/FMWRvsJYf5kaOyfseLoULb2SDRR4Tm4ZK2
	 nJaGLXm8pike3fBc++Z3S8SEaUO7/XZYstFieo2zdorUt/+Wo7dvSSa4m8XmpDx6DE
	 e0GpwFJO9FvSOcSrFzQHyKRQUKe3pF4rSG5Jee30=
Date: Mon, 2 Jun 2025 16:57:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 15/15] media: rcar-isp: Add full streams support
Message-ID: <20250602135738.GD23515@pendragon.ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-15-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-rcar-streams-v3-15-026655df7138@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, May 30, 2025 at 04:50:44PM +0300, Tomi Valkeinen wrote:
> Add the missing pieces to enable full streams support:
> 
> - Add set_routing
> - Drop the explicit uses of a single stream, and instead use the streams
>   mask.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 41 +++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index 887d8eb21a3a..101d69a2eba4 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -342,6 +342,7 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
>  {
>  	struct rcar_isp *isp = sd_to_isp(sd);
>  	int ret = 0;
> +	u64 sink_streams;

I'd move this before ret.

>  
>  	if (source_streams_mask != 1)
>  		return -EINVAL;
> @@ -355,8 +356,13 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
>  			return ret;
>  	}
>  
> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> +						       source_pad,
> +						       RCAR_ISP_SINK,
> +						       &source_streams_mask);
> +
>  	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
> -					 BIT_ULL(0));
> +					 sink_streams);
>  	if (ret) {
>  		risp_stop(isp);
>  		return ret;
> @@ -372,6 +378,7 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
>  				u64 source_streams_mask)
>  {
>  	struct rcar_isp *isp = sd_to_isp(sd);
> +	u64 sink_streams;
>  
>  	if (source_streams_mask != 1)
>  		return -EINVAL;
> @@ -379,7 +386,12 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
>  	if (!isp->remote)
>  		return -ENODEV;
>  
> -	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> +						       source_pad,
> +						       RCAR_ISP_SINK,
> +						       &source_streams_mask);
> +
> +	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, sink_streams);
>  
>  	if (isp->stream_count == 1)
>  		risp_stop(isp);
> @@ -419,12 +431,37 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int risp_set_routing(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state,
> +			    enum v4l2_subdev_format_whence which,
> +			    struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> +		return -EINVAL;
> +
> +	ret = v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
> +					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);

Given V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING, shouldn't the
num_routes check be replaced by an intrinsic hardware limit (I would
guess 8, as that's the number of source pads) ?

> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> +					       &risp_default_fmt);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_subdev_pad_ops risp_pad_ops = {
>  	.enable_streams = risp_enable_streams,
>  	.disable_streams = risp_disable_streams,
>  	.set_fmt = risp_set_pad_format,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.link_validate = v4l2_subdev_link_validate_default,
> +	.set_routing = risp_set_routing,
>  };
>  
>  static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {

-- 
Regards,

Laurent Pinchart

