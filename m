Return-Path: <linux-media+bounces-18723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC6988CE5
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 01:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 848291F2178A
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 23:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D839B1B81C2;
	Fri, 27 Sep 2024 23:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N5Ff2mTE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E111E1B3B3B;
	Fri, 27 Sep 2024 23:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727478688; cv=none; b=F/WaI6+WzoUl6FcOY3VeR5a0Uta5VuKNXk72r8lgpSd4t7jJKoWZwO/nqzRW2UhGw4C6Sh2mSxx+3lKOVYE2TDfbAD9F/lWsfqJo9jh7hjS3TEqqgGJqnMF/QgxQl3jOe48UZ9m+gY+Yz1Gh+IfMOgUsL9BEW1+qWo9MuirWGFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727478688; c=relaxed/simple;
	bh=MC8H0s2fxHR8yV8281FE3UraL+9PWZ8bmGUCBKpyjNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EV0rvae+gS8VGb7O+nMla54nLIi7IDwEoFoEqIgQEGGiTR5aMiLg3mIWDY1lVZnUpfQ7n/sH9/3uxj2+qQ1k+78pBUJ2TxpFp5jVCgohzZO+CEP2dQK7+oS0y1ApxDhK3XNeC9RcTE35FvVU7g8KKWLUDe43BAqBKQdwqe+1PYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N5Ff2mTE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 160EC6DE;
	Sat, 28 Sep 2024 01:09:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727478596;
	bh=MC8H0s2fxHR8yV8281FE3UraL+9PWZ8bmGUCBKpyjNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N5Ff2mTE7H102ERmyUwWrrzmYHI7EEjV9cIQDGyEzEjNHM0of7sy/0IjdPsNi4TMl
	 Dd5WA3/AFeZAyXtV8dQwctiLtzujt5pmmsJsevgMFMN9uFYcqO01DTPfR8MldbZumY
	 lnBjep4qi18bLlfvt8HudwvzbJISwBFG1/d6nrg4=
Date: Sat, 28 Sep 2024 02:11:22 +0300
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
Subject: Re: [PATCH v2 14/16] media: platform: rzg2l-cru: rzg2l-csi2: Make
 use of rzg2l_csi2_formats array in rzg2l_csi2_enum_frame_size()
Message-ID: <20240927231122.GN12322@pendragon.ideasonboard.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910175357.229075-15-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

I've just noticed that the subject line of most of your patches is much
longer than the 72 characters limit. Please try to shorten them. You can
replace the prefixes with "media: rzg2l-cru:", and reword the subject
lines that mention long function names.

On Tue, Sep 10, 2024 at 06:53:55PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Make use `rzg2l_csi2_formats` array in rzg2l_csi2_enum_frame_size().
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 79d99d865c1f..e630283dd1f1 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -570,7 +570,10 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
>  				      struct v4l2_subdev_state *sd_state,
>  				      struct v4l2_subdev_frame_size_enum *fse)
>  {
> -	if (fse->index != 0)
> +	if (fse->index >= ARRAY_SIZE(rzg2l_csi2_formats))
> +		return -EINVAL;

Same comment as in 11/16. With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +
> +	if (!rzg2l_csi2_code_to_fmt(fse->code))
>  		return -EINVAL;
>  
>  	fse->min_width = RZG2L_CSI2_MIN_WIDTH;

-- 
Regards,

Laurent Pinchart

