Return-Path: <linux-media+bounces-14376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E20491CBC3
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 10:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEF311C219BB
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 08:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3957381AD;
	Sat, 29 Jun 2024 08:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="oFJ1kSrC"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EA73BBCF
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719651377; cv=pass; b=pCDJV3UopcywxzCJKNLqGLHGnaWW96fWnqV7WimdnjBNlshB9LzXpNJ3/eZcjwM+4fY8vf/efJjWcIr0Ld7/VRyTyDI3KhhdOb6CiK1Rk+soeFx8dXPcJ3PBaNdAEFhm6yx3X/me1feDcZ/Uzgjg8D9/3hkjRee6R9YDmxPEI4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719651377; c=relaxed/simple;
	bh=SkaQQ0BKdOiUV8YMkDlNXizQgLnoRzTmydx0xHd2jUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8BSxN3xdfCfAojL152U96vO218kNMmf0GqEDgKrpBBnsY3pNb+VKYFBOi+RJ3cUbe+X5Q+l2/s0xub9ebVCIIZWzUM/RQHdAtcpjYc7J5ZkdxcX1QYogkInUBI0HV9T39V73EheYLqLZGKl5H5Y2IqChpFAoAKGj5As3hrmVqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=oFJ1kSrC; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4WB5kg65mZzyNC
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 11:56:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1719651371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QKLbuBPsZTmrRDgTB8mvMutPTM0f1PB8ccbJMAt622k=;
	b=oFJ1kSrCmbDLkp4ghy7CYOytvq1nHgnQtmjANnm7roopilDlbWQNXIFazcTmbNckEdm9Sy
	KUYU+XKwRLy+aMccuVwe34afmKJ+IoANbKWo+mHi+Pq1te0KNFhPF3qWUdvXJO+X1Cq5Kt
	z+CyplipYmemVwh1APVI6GVyfYL9MdA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1719651371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QKLbuBPsZTmrRDgTB8mvMutPTM0f1PB8ccbJMAt622k=;
	b=gjPmkv8j43AeUNVRzd67vO1fbQm2RrTRFwgv2DiKLXptTbojbh5Owl0oUzg3N5CxYOwHpP
	zw/q5NU1D/5SArvK6+MKMv22MtAbcDq3ppmOr3l7HvPvWiOFc4W32Eu+tp7lB6oORi+TN5
	cgSRUzQNApU188AL+lKTrZ3DDmNT7Gs=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1719651371; a=rsa-sha256; cv=none;
	b=O8rI+Tl3Y/RCq8U6Tddsuu1qkwf2+T0IPOl5JU4QHU+G9kaZ0rO3hKuqOy5gz02b781gl9
	ZFBB2WXp/YRJ0WklEup9Z+MWQeMlfIeX+8uQuroYY/A4d23/1JnAotK7Hdqv5ybzSHRzuh
	SsVLoLNDO0JXIs0ceerA3+Ecl8onEwA=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 20B33634C93;
	Sat, 29 Jun 2024 11:56:10 +0300 (EEST)
Date: Sat, 29 Jun 2024 08:56:09 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ccs: Fix link frequency control range update
Message-ID: <Zn_MKWM-5vIKXnyR@valkosipuli.retiisi.eu>
References: <20240628212603.5870-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628212603.5870-1-laurent.pinchart@ideasonboard.com>

Hi Laurent,

Thanks for the patch.

On Sat, Jun 29, 2024 at 12:26:03AM +0300, Laurent Pinchart wrote:
> When updating the link frequency control range in response to a format
> change, the minimum value passed to the __v4l2_ctrl_modify_range()
> function is hardcoded to 0, while there's no guarantee that the first
> link frequency in the menu is valid for the selected format. Fix it by
> getting using the index of the first bit set in the valid link
> frequencies mask.

Is this a problem? The bitmask does tell which ones are valid, doesn't it?

The minimum value will also be zero after control initialisation before
this function gets called. This should be also taken into account.

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> I noticed this issue in the CCS driver while working on a different
> sensor driver. I haven't tested this patch.
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index e1ae0f9fad43..5257dc4912ae 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -2143,6 +2143,7 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
>  		*old_csi_format = sensor->csi_format;
>  	unsigned long *valid_link_freqs;
>  	u32 code = fmt->format.code;
> +	unsigned int min, max;
>  	unsigned int i;
>  	int rval;
>  
> @@ -2179,10 +2180,13 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
>  		&sensor->valid_link_freqs[sensor->csi_format->compressed
>  					  - sensor->compressed_min_bpp];
>  
> -	__v4l2_ctrl_modify_range(
> -		sensor->link_freq, 0,
> -		__fls(*valid_link_freqs), ~*valid_link_freqs,
> -		__ffs(*valid_link_freqs));
> +	min = __ffs(*valid_link_freqs);
> +	man = __fls(*valid_link_freqs);
> +
> +	ret = __v4l2_ctrl_modify_range(sensor->link_freq, min, max,
> +				       ~*valid_link_freqs, min);

As this doesn't effect any actual change the applying of which could fail,
you'd have to have an issue with the argument values themselves. I wouldn't
add a check here. Although if you do, the sensor configuration should be
returned to the state before the call which would probably be worth a new
patch.

> +	if (ret)
> +		return ret;
>  
>  	return ccs_pll_update(sensor);
>  }
> 
> base-commit: afcd48134c58d6af45fb3fdb648f1260b20f2326

-- 
Kind regards,

Sakari Ailus

