Return-Path: <linux-media+bounces-12866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3379024D4
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 17:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 529701C22BF1
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 15:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14A7136671;
	Mon, 10 Jun 2024 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ciNT3QCW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453BF1E520;
	Mon, 10 Jun 2024 15:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718031621; cv=none; b=C8VLFH9Zi16DblDESLVZKlppFdin8Hyn09V0Fq1zYNEz15plZFg/2ffd5pE2RAPCK1jXsXH6BES7FkdEyCCJpMSFyT1eqXikPhAbhdmV4pFQUZu3jgbcEMb97OS+x2x4NPdh0KRU7HL2fZNKo0eLeixrfcgwJr5oxiHDQ/Nn4kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718031621; c=relaxed/simple;
	bh=qdfx3LSp394xk33ligR2kN11eu4UsmLVaDlZWF82WPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7klwjIXC0v79fN8VcGeh2j1ygzmvU7AN8O2B2TYUfJxgVscBtVREu7aMFdNN9Afb8RtaEXu6gSLp7RLsQj7jcrr8SDvxZkWzLwybHPM0qeSTETP9k8GHXuBRSZpEOokoDkecHZCwgZbBRhVOKGu8G5dQcNx9ahzYgFmiS1ieXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ciNT3QCW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7084974C;
	Mon, 10 Jun 2024 17:00:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718031603;
	bh=qdfx3LSp394xk33ligR2kN11eu4UsmLVaDlZWF82WPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ciNT3QCWYXh+hucAO6BbfTdgjbUmPru4ll4eRpFm1Dnp151JGnez7SEg1f/iqO3Sw
	 QBGxvMNlsSdc+UYfE6x0oGtYH1iUETXjRptr7BZg59MA9SqWouHjGFXgzw7kK7Jndw
	 2BLJgEUKcjnriXpU7SEYzNv2BI+pttiVbf8j4wSQ=
Date: Mon, 10 Jun 2024 17:59:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] media: uvcvideo: Cleanup version-specific mapping
Message-ID: <20240610145955.GT18479@pendragon.ideasonboard.com>
References: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>
 <20240318-billion-v1-4-2f7bc0ee2030@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240318-billion-v1-4-2f7bc0ee2030@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Mar 18, 2024 at 11:55:26PM +0000, Ricardo Ribalda wrote:
> We do not have more version specific mappings. Let's remove this code
> for now. It can be easily reverted later if needed.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 21 ---------------------
>  1 file changed, 21 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 9a0b81aca30d1..41578ded1174e 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -851,14 +851,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	},
>  };
>  
> -static const struct uvc_control_mapping *uvc_ctrl_mappings_uvc11[] = {
> -	NULL, /* Sentinel */
> -};
> -
> -static const struct uvc_control_mapping *uvc_ctrl_mappings_uvc15[] = {
> -	NULL, /* Sentinel */
> -};
> -
>  /* ------------------------------------------------------------------------
>   * Utility functions
>   */
> @@ -2660,7 +2652,6 @@ static void uvc_ctrl_prune_entity(struct uvc_device *dev,
>  static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  			       struct uvc_control *ctrl)
>  {
> -	const struct uvc_control_mapping **mappings;
>  	unsigned int i;
>  
>  	/*
> @@ -2726,18 +2717,6 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  		    ctrl->info.selector == mapping->selector)
>  			__uvc_ctrl_add_custom_mapping(chain, ctrl, mapping);
>  	}
> -
> -	/* Finally process version-specific mappings. */
> -	mappings = chain->dev->uvc_version < 0x0150
> -		 ? uvc_ctrl_mappings_uvc11 : uvc_ctrl_mappings_uvc15;
> -
> -	for (i = 0; mappings[i]; ++i) {
> -		const struct uvc_control_mapping *mapping = mappings[i];
> -
> -		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> -		    ctrl->info.selector == mapping->selector)
> -			__uvc_ctrl_add_custom_mapping(chain, ctrl, mapping);
> -	}
>  }
>  
>  /*

-- 
Regards,

Laurent Pinchart

