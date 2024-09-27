Return-Path: <linux-media+bounces-18722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 292A9988CDF
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 01:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4A081F213F2
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 23:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEFE1B7902;
	Fri, 27 Sep 2024 23:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CGHCK8mF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5AC18787E;
	Fri, 27 Sep 2024 23:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727478555; cv=none; b=MBys87clbBND5XywxQJdQRnmAPstaUPkwjT2AZJbubFutG7so9+sASKQpEwvFRIcTCxlFhWotnX7OPL7IxdIb1gsFlx2hGWZV8PLM7PEANI5NdLaX9F5Y9h+0iVWZjpZkb/WQkUA6yDIqj3r5MxVlRq80hYPIzRjKLOIKwEygCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727478555; c=relaxed/simple;
	bh=7n/9SB5yU5w3PWfxOaZQCsQESWdTiO1+tgo73ZiGJH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R33RaVyqM4L1nJvxxeyP9vNDLpXsRTsr3a/a2J6VB7iBlzK8EJ3VEqaG8X4EGzl/rHGzOJgOoMC/aUu/M2AYNES5ydI9HWk9/NX/NBlISSeJYjU/05BmIz0aWU9jp5ixQDzlCzuiALZ2XFKb5PMNPphZhA9cVL+YsOnG6zxebqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CGHCK8mF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D236D6DE;
	Sat, 28 Sep 2024 01:07:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727478463;
	bh=7n/9SB5yU5w3PWfxOaZQCsQESWdTiO1+tgo73ZiGJH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGHCK8mFs/Q16RwEmSasEzkPFriPz1c8p7MmEhyBLG8h3hr1dTFf4WDd7oMi4JCXG
	 8uWgNG0v1mIqA0A7CKxdvhmRd6MehRZ1AxIEW607yWOFuDscSWehmPfTSbs/C1mLPx
	 LNmQ+8Wf2RRnsfV+gF97Yhzyy4TfaiUWYCDv9HBA=
Date: Sat, 28 Sep 2024 02:09:09 +0300
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
Subject: Re: [PATCH v2 13/16] media: platform: rzg2l-cru: rzg2l-video: Use
 rzg2l_cru_ip_code_to_fmt() to validate format
Message-ID: <20240927230909.GM12322@pendragon.ideasonboard.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910175357.229075-14-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:53:54PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Utilize `rzg2l_cru_ip_code_to_fmt()` in `rzg2l_cru_mc_validate_format()`
> to validate whether the format is supported. This change removes the need
> to manually add new entries when a new format is added to the CRU driver,
> simplifying the validation process.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 014c0ff2721b..c32608c557a3 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -201,12 +201,8 @@ static int rzg2l_cru_mc_validate_format(struct rzg2l_cru_dev *cru,
>  	if (v4l2_subdev_call_state_active(sd, pad, get_fmt, &fmt))
>  		return -EPIPE;
>  
> -	switch (fmt.format.code) {
> -	case MEDIA_BUS_FMT_UYVY8_1X16:
> -		break;
> -	default:
> +	if (!rzg2l_cru_ip_code_to_fmt(fmt.format.code))
>  		return -EPIPE;
> -	}

This looks fine, but I think you should take it one step further and
perform format validation in .link_validate(). See
https://lore.kernel.org/all/20240826124106.3823-8-laurent.pinchart+renesas@ideasonboard.com/

>  
>  	switch (fmt.format.field) {
>  	case V4L2_FIELD_TOP:

-- 
Regards,

Laurent Pinchart

