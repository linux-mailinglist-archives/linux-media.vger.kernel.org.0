Return-Path: <linux-media+bounces-36740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 940B2AF83E3
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 00:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 182A87BC692
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D552C15AA;
	Thu,  3 Jul 2025 22:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QiH1Mv5h"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369632BEC50;
	Thu,  3 Jul 2025 22:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582864; cv=none; b=DbDgCNVeP81nojEZt0DW5rPqC280gGOsEy9g1mW3zczlpaEejU4QQysnUFJRrzX16gDJjxbtyPdsFKyJVJEEncyVbO20CXsw82DISlvwW7GukxoBhN0wCIvSNInf87sXUOHuyoTPZ7Idq1ngf1vK/ydRXQBBWGVj9iUO9sC8Jx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582864; c=relaxed/simple;
	bh=TaIS4i1iLwulRxGQUjkZAjOaIqQ7YsGfZBnbtruhMSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpouamKzRpW8o/LT8/yeQ5wGroQOwUlcLbNx6LrytjdlgIbKcYZQ8eljUNKpv6j859s3GidfUEpSBCx/3MYRTw7PxxPmUJQ2QPnWF2GtF0a7ez+bzRjeWxqrR23GzJVSoh1IPL7FfjDmPLW9owBmLTpCyfNtshIMZIKE9Kh04nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QiH1Mv5h; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 73CE2669;
	Fri,  4 Jul 2025 00:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751582837;
	bh=TaIS4i1iLwulRxGQUjkZAjOaIqQ7YsGfZBnbtruhMSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QiH1Mv5hf9T6aVEU7SK1caZyBMHL6vAPwB981Q3WOTyR4kFmDREgQW/SJ7lbCU8rG
	 Xx9VyaPfBMNN16w+6XebGq7M5l39xEGoMH1tdoJ2uLVZpEsoDmjlUpHGq4qq5Z3fEG
	 E6lJQyOKYClXo9RfY0edCwCtrSrxlzwm9R2dlQ+M=
Date: Fri, 4 Jul 2025 01:47:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 05/11] media: adv7180: Setup controls every time the
 device is reset
Message-ID: <20250703224714.GG3798@pendragon.ideasonboard.com>
References: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
 <20250703205223.2810806-6-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703205223.2810806-6-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Thu, Jul 03, 2025 at 10:52:17PM +0200, Niklas Söderlund wrote:
> The device initialization code resets the whole device, thus the initial
> controls set at probe are lost as adv7180_init_controls() are called
> before init_device(). Additionally the controls where never restored

s/where/were/

> after the device where reset coming back from suspend.
> 
> Solve this by separate the setup of the controls from the creation of
> them, and always set them up when the device is reset.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/adv7180.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index c2a79eba4dcd..3c7c896a21a4 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -700,7 +700,6 @@ static int adv7180_init_controls(struct adv7180_state *state)
>  		v4l2_ctrl_handler_free(&state->ctrl_hdl);
>  		return err;
>  	}
> -	v4l2_ctrl_handler_setup(&state->ctrl_hdl);
>  
>  	return 0;
>  }
> @@ -911,6 +910,8 @@ static int init_device(struct adv7180_state *state)
>  
>  	adv7180_set_field_mode(state);
>  
> +	__v4l2_ctrl_handler_setup(&state->ctrl_hdl);
> +
>  	/* register for interrupts */
>  	if (state->irq > 0) {
>  		/* config the Interrupt pin to be active low */

-- 
Regards,

Laurent Pinchart

