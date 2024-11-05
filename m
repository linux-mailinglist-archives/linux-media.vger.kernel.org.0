Return-Path: <linux-media+bounces-20911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9F99BCB48
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 12:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBCB91C230AB
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 11:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E940A1D359F;
	Tue,  5 Nov 2024 11:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="HKc6j9SA"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087C51C07D9;
	Tue,  5 Nov 2024 11:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730804865; cv=pass; b=p1JkkEVPH3Egcum5HdLeEsad222acC143B8FZvmBDoNmFvMuc32CVxM0zfghkYdlNs96z1L+sJQu91/uVVk3iyiUvguAXlYDVwP8rcHkcvyl1gyy7+9kC0v53xHlEfvRXPJ46fInFme5S8yWLOcFyK31QHpuxBvYwNuXMlsbLt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730804865; c=relaxed/simple;
	bh=1qqfjOe/Q7yyiVPoHOcbVal3M2aJbVUBNxAFXq2TK7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZIqvFrvG23lk/52/Umfwh+3XeKDfc3COpgrHKvSm5iszfzkjICmfwu5NuDM7hrSVvxsB6g+C2ZhnZVRFYrpmfeRswGW9qgO6+XEKBp6hI74rI0YwJLUM+iYMur1NhwUc1rCgMdFYM440dVU6jVPT9HOtNl8FHg6k+Hw6V2Eh38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=HKc6j9SA; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4XjQXk1lwcz49Q9k;
	Tue,  5 Nov 2024 13:07:34 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1730804854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cov2m1lzagdJfq+lbRjAhrqhXzR3yrng0MsGNAByO8I=;
	b=HKc6j9SABxTj0nj4aOwR5iekTijLjP38PJOLlqPjG7FGXVJP2xguD/VjaBw1lDnFAE4eFi
	6WH6WhpsSdztyCAY8IN756RMSIhikWBDxGh4RE4lVTqYn4hfb5TOCpIzk2wGVbaw7Rd0vF
	ZNq5Jl+OvIMPXXfnoFs7eK4xGFi3fC5n/y5hemog43tKqeamIQef3R8DECBhLHYpvJzLWN
	NWVQLOkQhRQcMdtVM/2pqy54qFOiK7tdKDym72mtU0BWx+rw1kcWtsJaaXmr3fGObpeSSt
	xb0RcVMBLqVc9Kz4/b6Q/m0FCTUqbGFtOlRtKWJD/A2abfQORkGagfZQkaNhkQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1730804854; a=rsa-sha256;
	cv=none;
	b=lR9judaZJE4Ps+yGrV+Mc32/GIqS9zUciUCIheFfnvKiPwgXND8HhiRzd3L2AJ25ekU0k/
	kARth49Wa6DPObXi+rZq2kNJIs7PS0le2o2B7WTB2xE6pWwnx70HSQX+ruAQCs+ipTHg5C
	h1H7EgQaJN5qv1duxj4JWiSvYb4r3jEqe9aeQJV+rAUqurJ0em6BWqCL+Hepd/uoAdUFcy
	G4yqwdIbgPb+l6JnFvnMaNdVIY4l+HoH+djAVXDQJHJiZAbbbx8sBKeTIoJ+rkE4QCX1eX
	1NxI0AHWzbJPEFRtITxNy/671XEz3O9f5+LF7r+NDKh03dWnsiG9PA6ZWfauSg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1730804854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cov2m1lzagdJfq+lbRjAhrqhXzR3yrng0MsGNAByO8I=;
	b=mGOR9/rBqff7GDGVXMJ6C090k4ac4rJGIqChpDI37BopKXDfgduKMlXWBwtgpWtrlH2BPb
	MbubFMn9uHvsoSKp1yJl+2/Oc0XjlHjnVWipeR2z8FWEI/iVJyaUvPQ8NCaBav5pb990m9
	+NOG7LJ9Im1+OQAoVu8Y30k8HjBS15n3D4PYX65q8pai0Yoo2My4IS0lEUAwgZR3WBXU3s
	nDA8G0gDobywH2xyBdKKJCEk+h3iq9Y8EM+32E++Tc6xVA3n2jQkQPDtkDhE33QnRsPCrx
	mH7/d9WTVLmmUOih+/Cz7QkkhtCR7TDAogOAo30DUIoI5z9JLyEU1D+4/Bk8Nw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 808E9634C93;
	Tue,  5 Nov 2024 13:07:32 +0200 (EET)
Date: Tue, 5 Nov 2024 11:07:32 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v2] media: uvcvideo: Fix crash during unbind if gpio unit
 is in use
Message-ID: <Zyn8dL7mrZ0eSM0w@valkosipuli.retiisi.eu>
References: <20241105-uvc-crashrmmod-v2-1-547ce6a6962e@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105-uvc-crashrmmod-v2-1-547ce6a6962e@chromium.org>

On Tue, Nov 05, 2024 at 10:53:59AM +0000, Ricardo Ribalda wrote:
> @@ -1329,15 +1329,28 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>  static int uvc_gpio_init_irq(struct uvc_device *dev)
>  {
>  	struct uvc_entity *unit = dev->gpio_unit;
> +	int ret;
>  
>  	if (!unit || unit->gpio.irq < 0)
>  		return 0;
>  
> -	return devm_request_threaded_irq(&dev->udev->dev, unit->gpio.irq, NULL,
> -					 uvc_gpio_irq,
> -					 IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> -					 IRQF_TRIGGER_RISING,
> -					 "uvc_privacy_gpio", dev);
> +	ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
> +				   IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> +				   IRQF_TRIGGER_RISING,
> +				   "uvc_privacy_gpio", dev);
> +
> +	if (!ret)
> +		dev->gpio_unit->gpio.inited = true;

I missed:

		unit->gpio...;

Or remove unit variable altogether, it's not really needed.

-- 
Sakari Ailus

