Return-Path: <linux-media+bounces-13520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AE290C8F8
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 13:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B07B91F21A29
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 11:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C902139CA;
	Tue, 18 Jun 2024 10:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GN8po9/x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE8A2139C2;
	Tue, 18 Jun 2024 10:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718705139; cv=none; b=K84wZqi2dzPM7eMumSQSanrkU8Sk1iX1YYZ9gjYvsx42hkfqzrIHwnwQ3kPi3ZcelAia0OKRft0I38UilJVD4Mmw7ea4pGGYbmez/KAMBZrA0lfTFWsN9v23MCImVEcN3NSPIGJ65i+WereHkCO8K88jgtMKq7ix3TYnWI/2SZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718705139; c=relaxed/simple;
	bh=kywCmXi1dPyhtG6XSTTz+OldLwEjv77fjLoqrA1YbvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9iyFttRBrbo67MjaCV5wFIKfaVY3rDCh0AjcWuvmE93L+ffVIuOgrd7EJoVnK3Qqc2UYQFbFCHV1W+aROuHJrhD+5oVbbsmpeZ9BUfSptfBP5ygHtG3Xp5WLzwr+gypjLnNJU39UKMc4JHmSNzIjcVfqI2KcizhiwRiFq1MZUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GN8po9/x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4DE6564;
	Tue, 18 Jun 2024 12:05:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718705118;
	bh=kywCmXi1dPyhtG6XSTTz+OldLwEjv77fjLoqrA1YbvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GN8po9/xPzOiRT6O1fjX3NVqKW7hjjhoVOm6wCUlITEXknxOO28ZXC/zw6vYpwhrf
	 ch5lAe23nhrJ+b0pCfFr8UClFSuXuHiEyu+v8CnH07IDkhGvmlkmRUNXySBLiVgZoA
	 YmOc83FBey0a6j8U4270lM7NfyY5oNVSerasv76U=
Date: Tue, 18 Jun 2024 12:05:32 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH v1 05/19] media: renesas: vsp1: Drop custom
 .get_fmt() handler for histogram
Message-ID: <fuzqtinkh2q7ifkrrrop5gsivxsqsbcnb6vyojw746yphcg4uo@zumsbndqckij>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231122043009.2741-6-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122043009.2741-6-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Wed, Nov 22, 2023 at 06:29:55AM GMT, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> The histogram module is the only one that has a custom .get_fmt()
> handler, to handle the special case of the output format being fixed.
> This can equally well be handled in the .set_fmt() handler instead.
> Beside avoiding special cases and using the same .get_fmt() handler in
> all modules, it ensures that the correct format is stored in the active
> state for the source pad, including when .set_fmt() is called from
> vsp1_entity_init_state(). Both are needed to later switch to the V4L2
> subdev active state API.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../media/platform/renesas/vsp1/vsp1_histo.c  | 29 +++++++------------
>  1 file changed, 10 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> index 576270cb3e63..a4076d82651e 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> @@ -356,30 +356,21 @@ static int histo_set_selection(struct v4l2_subdev *subdev,
>  	return ret;
>  }
>
> -static int histo_get_format(struct v4l2_subdev *subdev,
> -			    struct v4l2_subdev_state *sd_state,
> -			    struct v4l2_subdev_format *fmt)
> -{
> -	if (fmt->pad == HISTO_PAD_SOURCE) {
> -		fmt->format.code = MEDIA_BUS_FMT_FIXED;
> -		fmt->format.width = 0;
> -		fmt->format.height = 0;

Suprising!

Anyway:
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> -		fmt->format.field = V4L2_FIELD_NONE;
> -		fmt->format.colorspace = V4L2_COLORSPACE_RAW;
> -		return 0;
> -	}
> -
> -	return vsp1_subdev_get_pad_format(subdev, sd_state, fmt);
> -}
> -
>  static int histo_set_format(struct v4l2_subdev *subdev,
>  			    struct v4l2_subdev_state *sd_state,
>  			    struct v4l2_subdev_format *fmt)
>  {
>  	struct vsp1_histogram *histo = subdev_to_histo(subdev);
>
> -	if (fmt->pad != HISTO_PAD_SINK)
> -		return histo_get_format(subdev, sd_state, fmt);
> +	if (fmt->pad == HISTO_PAD_SOURCE) {
> +		fmt->format.code = MEDIA_BUS_FMT_FIXED;
> +		fmt->format.width = 0;
> +		fmt->format.height = 0;
> +		fmt->format.field = V4L2_FIELD_NONE;
> +		fmt->format.colorspace = V4L2_COLORSPACE_RAW;
> +
> +		return 0;
> +	}
>
>  	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt,
>  					  histo->formats, histo->num_formats,
> @@ -390,7 +381,7 @@ static int histo_set_format(struct v4l2_subdev *subdev,
>  static const struct v4l2_subdev_pad_ops histo_pad_ops = {
>  	.enum_mbus_code = histo_enum_mbus_code,
>  	.enum_frame_size = histo_enum_frame_size,
> -	.get_fmt = histo_get_format,
> +	.get_fmt = vsp1_subdev_get_pad_format,
>  	.set_fmt = histo_set_format,
>  	.get_selection = histo_get_selection,
>  	.set_selection = histo_set_selection,
> --
> Regards,
>
> Laurent Pinchart
>
>

