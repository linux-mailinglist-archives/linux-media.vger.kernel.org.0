Return-Path: <linux-media+bounces-17831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D37E96FE10
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 00:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99ACA1C21CA6
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 22:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226DB15B0E3;
	Fri,  6 Sep 2024 22:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vzD4W7/i"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04851581EA;
	Fri,  6 Sep 2024 22:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725662317; cv=none; b=HTsYReh7+9gEr9flp/yHYeYSLagLTh/fkcPtL6K+ajyeYe+vBQjF38OyIs3lsxvRHwHzWPXl1A/ZQ36E6o5DmoaCYiYGFZmCkTR+KQpAPHJCJab99UNgde97soPSooba0fcu3VxQcwqmBT1cqUtax5mRm9Q2BCdb7yoOKcjKYjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725662317; c=relaxed/simple;
	bh=X/567zU5k9K5hStaCvKzrLyx0nYNiuyl9q1uQZPX8L8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1pjpXh0YOItmvWh48wo6teWMJRiGNiqrggUXhGVyQDfYmS+g458oER/j1SYyCJapaKzDfMm2fc54/7D9aQ6zjkjTofx+CD/vbwv9A0ueoprD1Kvuue+E8OQCYbxtrmF8crnMg5OlzP3/Scx04F4jUR0oWWJ0VtNFxZtcecdZZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vzD4W7/i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B02D593;
	Sat,  7 Sep 2024 00:37:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725662239;
	bh=X/567zU5k9K5hStaCvKzrLyx0nYNiuyl9q1uQZPX8L8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vzD4W7/iYfESqZfmK/mbSEn5BHWHvxf2mB/jDB6qZkE4SlU6MP+u6VC3yN1UBXoA0
	 dMDj6v6Jiz5MrFxruBYZ3W+DB7eIC6dHdkUMvlIT3McftmORcL5D43H886pgUMYCVi
	 vSbeFfomlt/UIQqLM5HOCDtv44xnTtR8lLQC4GgI=
Date: Sat, 7 Sep 2024 01:38:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/3] media: platform: rzg2l-cru: rzg2l-csi2: Implement
 .get_frame_desc()
Message-ID: <20240906223831.GB12915@pendragon.ideasonboard.com>
References: <20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240906173947.282402-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240906173947.282402-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Fri, Sep 06, 2024 at 06:39:45PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The RZ/G2L CRU requires information about which VCx to process data from,
> among the four available VCs. To obtain this information, the
> .get_frame_desc() routine is implemented. This routine, in turn, calls
> .get_frame_desc() on the remote sensor connected to the CSI2 bridge.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index c7fdee347ac8..a7e4a0c109da 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -582,6 +582,17 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				     struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
> +
> +	if (!csi2->remote_source)
> +		return -EINVAL;

Maybe -ENODEV ?

> +
> +	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc, pad, fd);
> +}
> +

I wonder if we should implement a wrapper around .get_frame_desc() that
would automatically forward the call to the source if .get_frame_desc()
isn't implemented by a subdev. That's not a requirement for this series,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  static const struct v4l2_subdev_video_ops rzg2l_csi2_video_ops = {
>  	.s_stream = rzg2l_csi2_s_stream,
>  	.pre_streamon = rzg2l_csi2_pre_streamon,
> @@ -593,6 +604,7 @@ static const struct v4l2_subdev_pad_ops rzg2l_csi2_pad_ops = {
>  	.enum_frame_size = rzg2l_csi2_enum_frame_size,
>  	.set_fmt = rzg2l_csi2_set_format,
>  	.get_fmt = v4l2_subdev_get_fmt,
> +	.get_frame_desc = rzg2l_csi2_get_frame_desc,
>  };
>  
>  static const struct v4l2_subdev_ops rzg2l_csi2_subdev_ops = {

-- 
Regards,

Laurent Pinchart

