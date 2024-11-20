Return-Path: <linux-media+bounces-21635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 027899D3C98
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 14:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 718D7B244D6
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 13:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BDA19D060;
	Wed, 20 Nov 2024 13:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gBiTHzYl"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B361586DB
	for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 13:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732109841; cv=none; b=IKxXCziBoXkXrieOkV1wq4lSN6lPPYVwcNTntYSSKZcEMCULUBfrRJt+2Kel+9+cZAgbPDB/SulqhTSCrn6lzlG3sNUiaOJWF0g7KIPDfXGe1cWqzoHY+rsUFc0zbtW9PaNtLFj91E0JpAz9Q3XAdB/Jqcw7qc+Q2e78lW3jclg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732109841; c=relaxed/simple;
	bh=6FprXMjqswhGDl5RcWUXC/xccCPsNOfntJbRecOImHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQ6TXr/tx6H4Hedm2lqeUaW7HrSM6WL416JwYhxnpt59GyESb60WvaHnbIXWgNsj9mngM5PN9alRdYr6OJ/NKWv21qJZpyKzDIECG28L7UsL40ffnAvFJI4UBKdhLapLildE48oqFlkCZH+pVNz5U7fJliw5w1yOjeAcC8Lo6e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gBiTHzYl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732109838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aNhJXApteOStSWPJuT1kvuvcDkUdEqnM87tUpsplevc=;
	b=gBiTHzYlUmAfI92x9kXvuAh9+yrwAUnWBQlviHICQegCt6uVHZCLSMHtNA6XEgpbPTWTVK
	pgZjTzYIuyRuGKanQcuNElkLKSUqTL63FX4lIm3c09T2Rzm/ea2Vjx2n8xWRVl3QeBGtLI
	8/0Z8Fao1WxMlPyeCSyzr8JwuGKZn64=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-f0y9HMX7NCudb3fi-kZIDA-1; Wed, 20 Nov 2024 08:37:17 -0500
X-MC-Unique: f0y9HMX7NCudb3fi-kZIDA-1
X-Mimecast-MFC-AGG-ID: f0y9HMX7NCudb3fi-kZIDA
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5cfad454c02so3020887a12.1
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 05:37:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732109836; x=1732714636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aNhJXApteOStSWPJuT1kvuvcDkUdEqnM87tUpsplevc=;
        b=eqn7Y9ldoLEl2zx7lrSZfTtCagkYEbeZyH9+PLJr3+d9NKAA8BQNjJ7BXwnq9dwVkG
         G4rHyLObzzIhuFqJ6tuyiVsowVyh5tCfAbgxU7gyvTwc2Sj6cItWKwMnSqZy+87VZjZW
         kXg5n9ROnDrpTHgyC5afxT5voZqY13ZwEF1HfqlFYbAXsjWcZ8mclG2uYoJ6jIL0f7iE
         fDIEAFGECH3QYhLTvYmfpjXQxnXwHQdJJtthM5dj+aWPKLoi0laZ7vEFpmWFv2HbNfZg
         u3tpxwRd5agO09wc9RJriaAEz/NaZWImoWmznt+sxMQ+FdW5wWYLzr/Grj/54FCAIC/T
         GUSw==
X-Gm-Message-State: AOJu0YzpvCcxQFUgg1Ppa/BnXYLcZYz6ipe0TXoJ93HJo5gAiezuYbRd
	Wwdpog2/M5D0Vh+11N54OXY4jKCyvruOJYq/W5HBe8Y7JBDQZEtZrbnimC08zUTPVcBLZPssa+K
	Zlq1a/f5OQsmbP62kI/fxGwX6Aw7KXtHBGKnFROZ3PIDpKZ1txc4mGKD9JBT7+fmaKAx6
X-Received: by 2002:a05:6402:2750:b0:5cf:eaf4:bc98 with SMTP id 4fb4d7f45d1cf-5cff4c4c6e9mr2244372a12.18.1732109835830;
        Wed, 20 Nov 2024 05:37:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDpT+7v1yvHlWIRPEUnC/zmFGXn6Hcf0ANGVYppQlHmpco+GHKLx7MCluM6uUyzlFWQKkJCw==
X-Received: by 2002:a05:6402:2750:b0:5cf:eaf4:bc98 with SMTP id 4fb4d7f45d1cf-5cff4c4c6e9mr2244355a12.18.1732109835508;
        Wed, 20 Nov 2024 05:37:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cff4502155sm854390a12.53.2024.11.20.05.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 05:37:15 -0800 (PST)
Message-ID: <08ffd5b3-8199-46bd-9db6-c52db5c3ca02@redhat.com>
Date: Wed, 20 Nov 2024 14:37:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: uvcvideo: Add more logging to
 uvc_query_ctrl()
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20241118-uvc-readless-v3-0-d97c1a3084d0@chromium.org>
 <20241118-uvc-readless-v3-2-d97c1a3084d0@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241118-uvc-readless-v3-2-d97c1a3084d0@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18-Nov-24 6:16 PM, Ricardo Ribalda wrote:
> If we fail to query the ctrl error code there is no information on dmesg
> or in uvc_dbg. This makes difficult to debug the issue.
> 
> Print a proper error message when we cannot retrieve the error code from
> the device.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_video.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e165850397a0..0195394e10b5 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -110,8 +110,12 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	error = *(u8 *)data;
>  	*(u8 *)data = tmp;
>  
> -	if (ret != 1)
> +	if (ret != 1) {
> +		dev_err_ratelimited(&dev->udev->dev,
> +				    "Failed to query (%s) UVC error code control %u on unit %u: %d (exp. 1).\n",
> +				    uvc_query_name(query), cs, unit, ret);
>  		return ret < 0 ? ret : -EPIPE;
> +	}
>  
>  	uvc_dbg(dev, CONTROL, "Control error %u\n", error);
>  
> 


