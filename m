Return-Path: <linux-media+bounces-8986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BB889EFA2
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 12:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2FF61C218DD
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 10:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB19015887C;
	Wed, 10 Apr 2024 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G7BSH9JW"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DA9125CD
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712743960; cv=none; b=NiN/BALlx1Jqh5AOeqk2KRadFO7EzkaB1HBbTTogJf2y3DHfyUgS/1tYXwy2m7XH61JnQ6h6H7XBzg/Zqq0w107/SMNjfbeGZCdVmhIl2xEsEAkLLKus339INPN3YB3P/pM2q9upG1pkzR0ksav8M9JoAfy5CnCALdS89OTh120=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712743960; c=relaxed/simple;
	bh=c3fHj3f6Tb37tJcF51EaeueTBNGIfxGFVzHMFdrd18w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNSqlhq8UM3hu4VAZSEagT+MsYgOB3V5/x54MuD/yHwu3JozFgYcffbEcZEkC1XRI9Yuq+6XRF5nGajTh4GYygxWkTq3fK0fH+gYOeF56nj3luy56ACbhJFz1eJmimBZCdFZYqe2ZEi02z0A7Es0KgSjyalDbJn74/bdF1BUZD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G7BSH9JW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712743957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zj4eK0HbC8GnhqxWjGdxCCoDiTEZXC9IURckNzSmv1E=;
	b=G7BSH9JW9Z1o1JPTWUuvR/rf70TCj1Mn1KilBfVUaf8QZarVhjVIY7OFJDAf337h4TVBt9
	6zEJ3foLb2N9WnkLWVwarM5uIw8Xf8tMiKFwL3T25SVXg5vWYAnpt2VuAJRv33Xmy6j088
	6LirauWKlHYJDDJOtT+NEPTe21sb4uc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-YMPlyEJONa6L60skttrEzQ-1; Wed, 10 Apr 2024 06:12:36 -0400
X-MC-Unique: YMPlyEJONa6L60skttrEzQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a51aec8eb93so289037366b.0
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 03:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712743955; x=1713348755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zj4eK0HbC8GnhqxWjGdxCCoDiTEZXC9IURckNzSmv1E=;
        b=Gokkx/n4PLvPZp/ENb2lX6hZJ+JG+bL7NXsdvIiGXWZqOwKS4bzS6Edzv1Kbvv+Ltp
         6dYt8KM6ugG8vHcUSNGeE7dQJ2Ni1RVOGW2d0KlmoG14L1w5T690aNUiCvZK0LCA/8cO
         M/pkwCtlT3Lbv+Y//lTcsXs2Edm4qup7uasueLI0dt3azxSuAAn6LkN9+buCZQhFGcL5
         UA5nIheGomIHdjhRdJxW7c/rnLASOfb5sPDDxJEq+jU04Uy8DK3SVD1IT5LDeCpZod75
         rmlzhw0eVNJr5TOXLUb3Myr6OZRdzIkWwgeNH7c6kIiecvEINb4IFWk1Qndy8LzFS1PW
         I2yg==
X-Forwarded-Encrypted: i=1; AJvYcCUKaWYIrJLVWqJSwtamdB8iL/hXOTOe6m2DAThi5+ugIPw/DzrOWDKLdX2RTgwnVHHkLALJvDXB35t31qgI3acP1Qu/nwM430VitH0=
X-Gm-Message-State: AOJu0Yz6GfECPV4SjimaGU4Z9IrxdaYInFb4cF8xQIoLB5f40b+CNu22
	AJP5wQtgL+FqMfB5B5NJSL19xebkoTkNGgqxCZw7qJwr1UPIGn8crgshf57OuRQp5+hD4BTjis2
	dkupUrbX2fg9XS2Bv81sPYUCuHe7Fphd7sdOQSCPC3qaShbquOArdubvwQ31G
X-Received: by 2002:a17:906:1694:b0:a51:a2ee:fab8 with SMTP id s20-20020a170906169400b00a51a2eefab8mr1216046ejd.36.1712743954949;
        Wed, 10 Apr 2024 03:12:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEovKVJPzj2mdSNWaxlDLbFEsKX4U7+JyPTWszCFDHcFNGSkUo15VNIiIyVRSEbIBcIEkrIvw==
X-Received: by 2002:a17:906:1694:b0:a51:a2ee:fab8 with SMTP id s20-20020a170906169400b00a51a2eefab8mr1216038ejd.36.1712743954641;
        Wed, 10 Apr 2024 03:12:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lx26-20020a170906af1a00b00a4e440989f5sm6763257ejb.159.2024.04.10.03.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 03:12:34 -0700 (PDT)
Message-ID: <50457efb-f145-4eac-a625-28e3bfc8a7af@redhat.com>
Date: Wed, 10 Apr 2024 12:12:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: v4l: Don't turn on privacy LED if streamon
 fails
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: tomi.valkeinen@ideasonboard.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>, linux-kernel@vger.kernel.org
References: <20240410100301.658824-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240410100301.658824-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

Thank you for fixing this.

On 4/10/24 12:03 PM, Sakari Ailus wrote:
> Turn on the privacy LED only if streamon succeeds. This can be done after
> enabling streaming on the sensor.
> 
> Fixes: b6e10ff6c23d ("media: v4l2-core: Make the v4l2-core code enable/disable the privacy LED if present")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 4c6198c48dd6..acb7c3003ab6 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -412,15 +412,6 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (WARN_ON(!!sd->enabled_streams == !!enable))
>  		return 0;
>  
> -#if IS_REACHABLE(CONFIG_LEDS_CLASS)
> -	if (!IS_ERR_OR_NULL(sd->privacy_led)) {
> -		if (enable)
> -			led_set_brightness(sd->privacy_led,
> -					   sd->privacy_led->max_brightness);
> -		else
> -			led_set_brightness(sd->privacy_led, 0);
> -	}
> -#endif
>  	ret = sd->ops->video->s_stream(sd, enable);
>  
>  	if (!enable && ret < 0) {
> @@ -431,6 +422,16 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (!ret)
>  		sd->enabled_streams = enable ? BIT(0) : 0;
>  
> +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
> +	if (!IS_ERR_OR_NULL(sd->privacy_led) && !(enable && ret < 0)) {

There already is a:

	if (!enable && ret < 0)
		ret = 0;

block above to ignore stream-off errors, so you can just test for:

	if (!ret && !IS_ERR_OR_NULL(sd->privacy_led)) {
		...
	}

And then you can move the whole block to inside the existing:

	if (!ret)
		sd->enabled_streams = enable ? BIT(0) : 0;

block, so you get something like this:

	if (!ret) {
		sd->enabled_streams = enable ? BIT(0) : 0;
#if IS_REACHABLE(CONFIG_LEDS_CLASS)
		if (!IS_ERR_OR_NULL(sd->privacy_led)) {
			if (enable)
				led_set_brightness(sd->privacy_led,
						   sd->privacy_led->max_brightness);
			else
				led_set_brightness(sd->privacy_led, 0);
		}
#endif
	}

Which then cleans up nicely by Tomi's patch
introducing the privacy LED helper functions,
to something like this:

	if (!ret {
		if (enable) {
			sd->enabled_streams = BIT(0);
			v4l2_subdev_enable_privacy_led(sd);
		} else {
			sd->enabled_streams = 0;
			v4l2_subdev_disable_privacy_led(sd);
		}
	}

Regards,

Hans



