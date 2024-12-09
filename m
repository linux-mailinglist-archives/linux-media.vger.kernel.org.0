Return-Path: <linux-media+bounces-22874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C29B9E919E
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 12:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BA20282591
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 11:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BC4217707;
	Mon,  9 Dec 2024 11:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gL2y2z/E"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D15216E2B
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 11:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742237; cv=none; b=sCWpKD3INWAXFa3oV7MFjLXM6XFyUu/fgnLv4TT1FtR3IVCSbsxAGRclTxM/fAbKV/Itqzkpo+GYg0loZTDEE9ZWDH9xrZEoxkck06D8skbsEr/pqOvjFa0StFZymjLr+UBcQAqxyujbOAfGrNZSCTfbIMM1PY/LBWAc0j0IKFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742237; c=relaxed/simple;
	bh=xrEgomVVXwnBdjRTCLu5uuQJKTeAi1hJTlC/TEzDw80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOkj2ih0tMUah8G0FUucqeN7PfiCdu9/DZlnS0oau6oGZWi0ab75uqABrm6YvUgFqS8bX/4i29+3YNmjA+/SV2ZeuNxA1LQWCR1eQgUnZO1NWHna7qCT3Di8E5841MZ6PANyD38BikNuyRNTWbVi2gyRSQPM8rGpLTMiZCqdPh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gL2y2z/E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733742234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=49y0zMV2jUdlIFZXvm7qDmUjzQ2LlPnBFxgIlWfWKm4=;
	b=gL2y2z/EFWT5AMw94ByigrEkrnYYtv0iJVLRGdFPDNU0pGZgmrB9jQQVrrE2mtmEKlDFwo
	AJwaMU6btR4Gebl88Slu070IgS8U+f7L2zLEtX9emNsNUH/MG2bCnQTQGQSRrpS79hS9Rh
	x23JNnwvt7cFAP2C3g7Lme4wMZtpe7o=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-huuNhM3cPL2lcKvMbE-qUA-1; Mon, 09 Dec 2024 06:03:53 -0500
X-MC-Unique: huuNhM3cPL2lcKvMbE-qUA-1
X-Mimecast-MFC-AGG-ID: huuNhM3cPL2lcKvMbE-qUA
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa68203d288so78477766b.1
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 03:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733742232; x=1734347032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=49y0zMV2jUdlIFZXvm7qDmUjzQ2LlPnBFxgIlWfWKm4=;
        b=lXYXu/ypNG95NAbxl5vD34BCbPvhD2DMCIO3ahAi/wGKzjeUyZRJlTkXsz/G++NzbC
         sF9BcYal3HvvQ3duAYnDh5XgGew8dsIlTzRM/moDYrLOrzUfckxEu1CrBE6cm9ykTpnL
         NZuQAQUCQ5yeRNFD+mTPLRXOCgoGdD4K5Et6+nASxh+tm6LBLXQuh0RxSD9bLPAGlZzd
         9tRYpmEuxRVfEVlo952HiwyadRP9eQh0sqSAO7r1I6Rko3o4Y8LW2443GvYBw+zlcZLH
         q9D06iMFhr1r6ZkA3+XhN+3pR4J9NUU8NqDgvy3u4Dm8PnJRhX2nbYG5DYM9GYTKTSC6
         jlBA==
X-Forwarded-Encrypted: i=1; AJvYcCWtGIWitpMwemzWP9wj9GD90B3txi2QY6qmQo0bMvjxE7Qfa/at+/QxYe9/c5U8uoSW2EVmQtnl221dvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyySfu/hy8rqREjy/JDKFIYVNFD6tFpt+rBduksNVPUNKqtXvqG
	6R/LfF6/hxWwiWOrk9nsmYdY9UTPO56H8DLO3MT0HXC3rdLNw8Pq+pw09ssyHZbxmlgx5MvuXJv
	+pvojT0mQFLTilZXIBeMHs0KCNla7aLLe79AZfP14qsrL/NKPNrVzO3sf/R9EKkJpp+Qe
X-Gm-Gg: ASbGncujVj0SCg5zXup/qtacGxnd5mWwj121MXSWUOoUwZkxwQmz0VkwseQd4QPuQdS
	NeYoQvF0jxvU1Se6HG0KAdVf0taB7ni84Ebe87pgABAx3m5DEVaxj3SL0sNeEcVzf+tCCqrYmdo
	QPxjjk17NR204z+eKkIZocCgRQBTzVAjilOqCBRzprthdPuP3vMN7reBuw3rYk1POTtlgrWVbek
	m2OzJ8cb1e+uZG8A7q18jcS1rRwDMg6APsrSAabeoE2XQz5EBSiLg==
X-Received: by 2002:a05:6402:274d:b0:5d3:d4cf:fea0 with SMTP id 4fb4d7f45d1cf-5d418612f4dmr127110a12.21.1733742232022;
        Mon, 09 Dec 2024 03:03:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkNYdowjrz3mSpV9KDvjJ3H/wZiO0JmX+dDywJhyG14O6i1opu/Mwa++qOGEIMTia0xwIkgA==
X-Received: by 2002:a05:6402:274d:b0:5d3:d4cf:fea0 with SMTP id 4fb4d7f45d1cf-5d418612f4dmr127084a12.21.1733742231651;
        Mon, 09 Dec 2024 03:03:51 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3ea09245bsm2705074a12.78.2024.12.09.03.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 03:03:51 -0800 (PST)
Message-ID: <02a89566-a6f7-4feb-84c3-079795c98a46@redhat.com>
Date: Mon, 9 Dec 2024 12:03:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] media: uvcvideo: Flush the control cache when we
 get an event
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241203-uvc-fix-async-v6-0-26c867231118@chromium.org>
 <20241203-uvc-fix-async-v6-5-26c867231118@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241203-uvc-fix-async-v6-5-26c867231118@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 3-Dec-24 10:20 PM, Ricardo Ribalda wrote:
> Asynchronous controls trigger an event when they have completed their
> operation.
> 
> This can make that the control cached value does not match the value in
> the device.
> 
> Let's flush the cache to be on the safe side.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thank you for your patch.

It seems that you have missed Laurent's reply asking to improve the commit message:

"Conceptually this change looks fine, but the commit message needs to
explain why this is safe to do without protecting ctrl->loaded with a
lock."

https://lore.kernel.org/linux-media/20241203203748.GD5196@pendragon.ideasonboard.com/

Or maybe the posting of this v6 and that reply have crossed each other.

Either way please post a new version addressing this comment.

Thanks & Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 3dc9b7a49f64..db29e0e8bfd4 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1622,6 +1622,9 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>  
>  	mutex_lock(&chain->ctrl_mutex);
>  
> +	/* Flush the control cache, the data might have changed. */
> +	ctrl->loaded = 0;
> +
>  	handle = ctrl->handle;
>  	if (handle)
>  		uvc_ctrl_set_handle(handle, ctrl, NULL);
> 


