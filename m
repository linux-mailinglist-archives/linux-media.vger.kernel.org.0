Return-Path: <linux-media+bounces-11234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B308C14C2
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 20:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 852841C21F24
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 18:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0212C7711F;
	Thu,  9 May 2024 18:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="FdchrSAS"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9E5770E1;
	Thu,  9 May 2024 18:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715279389; cv=pass; b=IvRJx/FpwXoMbF8OmRfRw8sJNENbZb4AQQO44hk1UkCwN6cXCqw8YEndMJ35SmrhvMYcLF8H9pBmxmWDB7Ls6oquXlA/upvMB/fs17nVR0C6klWEhIFcMijpnwi6MsqW9MRYOgXLXbWXLqUBJRH4S2+hxw/sbV+tO8xZvXYaiwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715279389; c=relaxed/simple;
	bh=xKq66k9kPjJ+VzOyPj7asf7Nx4wqGSb0f1mA1w7C8nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hbarwh++Jq+TOJA4fPjd7/leyJTjxcPjcHok7xR/PHYk2sdVkP2XrAifuYK9+x9VGhmf2PrDj3v/NSwhjdq7sqFR2vQEFzUhGOW0sWiABM3iwJle1cOpo6UMaOcr9AL0JzkWVaacKqmsOLRrg6hkoyfarWSotwrCiQDOcSq/8Gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=FdchrSAS; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Vb0sy3YRKz49Pwn;
	Thu,  9 May 2024 21:29:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1715279384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7A4xPDEgAQQdMdt52bCRjKFOBSibDEcEKYLBHN2iw5E=;
	b=FdchrSAS/rkEX7K4SCLBSmv4gsvA9kEgIr6ZlVRFo7Ty7yWLoTnyDeRd505V9OfhOo7ig6
	dYcbJBEucAERnmbsNRJNNDcBx8ezW69VKUos6mPiJCfkEvlXxFxjy/cbbcDxsg7oWwBiQK
	+0IMojFOzu2cNwx2zCA1sNCKYzAClI6zpMnFz8ntM7uOu2PYqw/5Hs8TaHH9hYobkgnraG
	CLpYBBGzxZOTpmSLOuzk//FnIXOuvzn6/hBqPoex3UXfYDTcN6OCMiWOtttAfFGImlVlfF
	ynQU/RIu3WIGO1780pllahfLdzf414NJXhvN86caexRN+ZMdh8hwhfEcF5d/yA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1715279384; a=rsa-sha256;
	cv=none;
	b=d2Y/U8geglk/aao9oANk7ZuwFu2+3cBPXZYAnm6kUVXYYcbaYatFCB8qmNCZ2sk93eY7LQ
	myj04ct8F/Uw04gtP4PWkL7lFhwXQid3OeF4L5tPiGK57AtyUAGeHoBjOxIClVX5xWoFxp
	RV3FkTAN0niqiikA/NYCgqEbiTXAWkCk59V5oSmPYwJ37mCohPKI67y4Q9xw+D60bDWcEX
	Wc/ATDSPfmaQU2oxWJJyEeVzD8fSHtUiUJDZ2pnoss6nODLBX8m8N7aqz9I2Twsq+IcA41
	418yqi2KFRnlTRVvEzXk7NMsKysiKvfKh10Up9P9zA0Jl/ukgiItHn7vQrM1SQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1715279384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7A4xPDEgAQQdMdt52bCRjKFOBSibDEcEKYLBHN2iw5E=;
	b=e2tcMHI7+kyoQS3stRFo3OSo0rbnruwnqXWwdOlmjJ7spynxNiWwu7V0mXc/K1yDCeoWgd
	rXavGj70o3XPy0p6Z8a5+tJBbttkIBuCFKNu65aiV6RCYkvGG7Cd9QVMMJu34iKbAAiuUm
	PzkgHF9eNi/RHJFoolPnPHdahzAAXRrtNoPHzbWu1YYcWVgHyXZv//A+ewu6UrRP6yuDHw
	UTr3O2evOmGlF8ih7nkFZP1x/OmYH3hB23oECUlUCYRmPbSQ0mmAUY3uxu4c9doq0LfEDk
	0Rq7bTj1l+cEr3oyXG5mMWB9vU4/Jp99JNC5rfdtQ0BH5cWToY3R4+jnZH7b2g==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1897D634C93;
	Thu,  9 May 2024 21:29:42 +0300 (EEST)
Date: Thu, 9 May 2024 18:29:41 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 1/3] media: v4l2-subdev: Fix
 v4l2_subdev_state_get_format() documentation
Message-ID: <Zj0WFQo0cHReRCcU@valkosipuli.retiisi.eu>
References: <20240508214045.24716-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240508214045.24716-2-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508214045.24716-2-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

Thanks for posting this.

On Thu, May 09, 2024 at 12:40:43AM +0300, Laurent Pinchart wrote:
> The documentation of the v4l2_subdev_state_get_format() macro
> incorrectly references __v4l2_subdev_state_get_format() instead of
> __v4l2_subdev_state_gen_call(). Fix it, and also update the list of
> similar macros to add the missing v4l2_subdev_state_get_interval().
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  include/media/v4l2-subdev.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index e30c463d90e5..b25b6e97ecbd 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1340,12 +1340,12 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
>   */
>  /*
>   * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
> - * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
> + * two or three arguments. The purpose of the __v4l2_subdev_state_gen_call()
>   * macro below is to come up with the name of the function or macro to call,

You could drop "below" here, too: the macro definition is above the text.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

>   * using the last two arguments (_stream and _pad). The selected function or
>   * macro is then called using the arguments specified by the caller. A similar
> - * arrangement is used for v4l2_subdev_state_crop() and
> - * v4l2_subdev_state_compose() below.
> + * arrangement is used for v4l2_subdev_state_crop(), v4l2_subdev_state_compose()
> + * and v4l2_subdev_state_get_interval() below.
>   */
>  #define v4l2_subdev_state_get_format(state, pad, ...)			\
>  	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\

-- 
Sakari Ailus

