Return-Path: <linux-media+bounces-31055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2DAA9C759
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 13:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AAF47AAEBF
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 11:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4360925A2D5;
	Fri, 25 Apr 2025 11:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="b4W7lB3q"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2262571DF;
	Fri, 25 Apr 2025 11:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579932; cv=none; b=KRIUgycEfqpkKpocOIfb4ZuczRf3lCZq4zwttlEemvJKtwS4xqm0IlrSVSpRG8ms0AlGlEurznd6r80XWFUWC3a1JgseRid8K9P1bFOhP95t5HLGMmz7pXw1X7cXItr3gBGadufyFUoGw516ThgNjm6sDPQI7XDt8nLoMacNUhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579932; c=relaxed/simple;
	bh=skvexJzYlW4JuBMtInk0nYvYYmknX8QIlJFtBmm34aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ib+Npc+HLdJspEQkNIc+DUJtWRVMCsEVlM9Fh2WYbqh7t3WN2/BGwIPv99m/fVmMKd6UsZ9OwJ4CUxzT0N+a+3UOm4KeZOCbNUu0WNYluMg+lTRV49xsptZ5EAadjmwpJsgWYgU4R5RqY35FV3v/mbqqTCybyJR3Dy+fRlEsyNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=b4W7lB3q; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4ZkVhj1yVYz1Mvv;
	Fri, 25 Apr 2025 11:18:45 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4ZkVhh6BT1z2xMR;
	Fri, 25 Apr 2025 11:18:44 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=b4W7lB3q;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1745579925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BZuo5HAuIG4iMY22uUoOZzzfPbaHnwAOsOxEtFWKQs4=;
	b=b4W7lB3qo2Bzx23qcUfuqw5oVJPoIzt70Ey1oSB35ORcn/k1Ty4CKomxzaPlb75P8mwEj9
	Pho6JdLtgnSZVRIHnsST/s7HtLjE2Dw8oVVuevy5uvufTEsWFr7bZXAgUzIQzLoLBwA8e2
	jCPSu7yU5I6NS+0kqhX7zXlkHE6fyVdrUYwxEQGz6CpxQi9CKjWGQLokS3/TuD0BWWOu/j
	BDpVOi/mlI5t1TCSrE9gO30SROsoJO2jznkwmW0TK5QQ4gj7KCYH8aH+mr82hgQQtMSEh+
	BBmwKfWRQ9YQhF5ZStX3jIuDFZXYh3CaKw4IaUr0m6J5dyxu/Tcq+rFPS9xo2w==
X-CM-Envelope: MS4xfGdsihsR6tcCoeTf3TelIQMkvCpQl2Bg60QdT1w7vUryS7Oz1m8jWYCrtSKiQURaaGo8oEmGj9iGaJjpax4cyr1APUi5C8sIRqRVaWiuHfPd+IC1S0F4 V4Wohb4QNahvOvDIFEhli/rtTwfbiiAMoLqEJnQlAY2JY0D5SfBohbse2M8LWihoIUR1MNX6WsCUELoyUs4Zy72s7LfaBG2T26YOrfHSxNH9QVQQc9DMIa6I gEkAEuvbXO/RCcRKd1PQoYP0G2HBEYKKTbCRr5ms1SdiwvvAW1i56SEhysqfJil11h9L7Zjl39Iuc4LP3Eycli/e0c/QghXeDjMPDP5OShRZ2wmXRN0S4+PJ keU9RAYk
X-CM-Analysis: v=2.4 cv=UsCZN/wB c=1 sm=1 tr=0 ts=680b6f95 a=xVxOAnYOZqKVbrsbIgLjXQ==:117 a=xVxOAnYOZqKVbrsbIgLjXQ==:17 a=IkcTkHD0fZMA:10 a=cEcZ1jVqqoP-keUFMK0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
Message-ID: <36261b27-99b9-4e9e-ac1c-87c06c6dc0bd@jjverkuil.nl>
Date: Fri, 25 Apr 2025 13:18:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] media: v4l: get_device() when no errors are possible
 anymore
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <13860e023a920cd472cf5acecee88794c815b9c4.1743199603.git.mirq-linux@rere.qmqm.pl>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <13860e023a920cd472cf5acecee88794c815b9c4.1743199603.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spampanel-Class: ham

Hi Michał,

On 28/03/2025 23:07, Michał Mirosław wrote:
> Avoid leaking reference from get_device() in the error path.

It's not actually leaking anything. If dev == NULL, then get_device
does nothing.

I'll reject this patch.

Regards,

	Hans

> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/media/v4l2-core/v4l2-device.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
> index 5e537454f5cd..277ea2c241b8 100644
> --- a/drivers/media/v4l2-core/v4l2-device.c
> +++ b/drivers/media/v4l2-core/v4l2-device.c
> @@ -23,7 +23,6 @@ int v4l2_device_register(struct device *dev, struct v4l2_device *v4l2_dev)
>  	spin_lock_init(&v4l2_dev->lock);
>  	v4l2_prio_init(&v4l2_dev->prio);
>  	kref_init(&v4l2_dev->ref);
> -	get_device(dev);
>  	v4l2_dev->dev = dev;
>  	if (dev == NULL) {
>  		/* If dev == NULL, then name must be filled in by the caller */
> @@ -32,6 +31,8 @@ int v4l2_device_register(struct device *dev, struct v4l2_device *v4l2_dev)
>  		return 0;
>  	}
>  
> +	get_device(dev);
> +
>  	/* Set name to driver name + device name if it is empty. */
>  	if (!v4l2_dev->name[0])
>  		snprintf(v4l2_dev->name, sizeof(v4l2_dev->name), "%s %s",


