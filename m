Return-Path: <linux-media+bounces-20794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC8B9BB419
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 13:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E4A228115D
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 12:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C281B4F3F;
	Mon,  4 Nov 2024 12:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gHRdZNpl"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CD51B3944
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730721707; cv=none; b=NPKpFQGxgrXZHWUPqyVwhlyIqYDzTLcXB7Jpe029NE9gGJD4lntP/xc+eVEyvW1e0iDxG1xotdUWlBcguTwqlpqZHRWn0NThKDYFcTR6ZX+b1fkSxBhyJ04NDM5m6ac4N/DgdK8ZIIObDpGkXCDSrekz3S4lGGILEdTE9h2WFSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730721707; c=relaxed/simple;
	bh=qSdyZ2s9B5cARaoKsuwvCuT3hG3tvvz7d7IN6nt4dn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/AMYwpC/H0uloRajZNI77vzoZO7AmTbRTi6NX0jE2OchsS6atIsx3i72awCyA6pGp9YQztwuGUF4hjfwI93xT10O89L9z246jChyV90JyVmEe135li5Ahi7I/gjxl0jxXo8BPcNUhRqDQDiMK1rDJbSf/y7rfk7haIdKO617Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gHRdZNpl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730721704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZjGJ8hV/x/q11ugCunF6S0uI4EeGKZp0XSGAnU91A0=;
	b=gHRdZNplcxovpGvHqssH/wUlpo9BnUQaWcq3qTr1u1m2vUQZ72O8osETcEcIGnz2Jz0nf+
	DYeF0yWADmXXpLT3h1MtcmZSzCaK/BBzMGzK3CcCoPPjuoLY3lCHwOR1DGbWuNW0DlRrDX
	z78lNf+tPZzc+wJlEciHpkTxi7XagT8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-IrfRFZ6DNomfztg1hwRc9Q-1; Mon, 04 Nov 2024 07:01:43 -0500
X-MC-Unique: IrfRFZ6DNomfztg1hwRc9Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a9a0710ca24so299602466b.3
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 04:01:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730721702; x=1731326502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZjGJ8hV/x/q11ugCunF6S0uI4EeGKZp0XSGAnU91A0=;
        b=R9HXM0zb9vxk4TMGpAmoj/XH9TtAQ/IY4qu6gqlEaaXEEDAakb1pO+P/qfTjox5FHv
         7ra9u0qKMHB7VSDt0eR5RCfVKMfXMmN+4avPac2138l7e6bgiXZ8h1ZU+bRHjxFfszsz
         JfTEKaGmxYWNtdsBNVyUyU3EJJ8eRjiM5Oqa98ew45FrXGep4Pk0WgAp3ho977AmEPpv
         ct8SPAbKUGjBE5ceCekxKbElN/woqL53J3zIQoIDp+OXvDWsoyaCgOjwGUTHy+FunBYI
         KhCqfew9dddOkzxcVDbxGQDPldUmyrsgUHNaMSFE71TKK2CUYjUMYCXyYKh9TgFSVZ5u
         TyHA==
X-Forwarded-Encrypted: i=1; AJvYcCWcD744gkdfx0ZqnpPpop1Xg5MefUlknqTSaG/Eac4AKssoozVIV8pFpg0vfvkteDD8EItUQiWMITzK5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4g9fgmzs1fouUn0NGFve4qh9AjVtxWhUtP9+spG2JZ5au9ap0
	akv0dqAMgxhvwOrgimQUDb0w+2ikn2kJFArEvzp1Mix2+/SBUV6DxSd/dQgllYViQQlUairqBIv
	UpRCyWH7YY4RTJVETZmnMfH2ryl4YepvzX6kLtusBr53mMvmkC+SwJgFzWG3L
X-Received: by 2002:a17:906:c14b:b0:a9a:1b32:5aa8 with SMTP id a640c23a62f3a-a9e3a5739demr2118205666b.4.1730721702154;
        Mon, 04 Nov 2024 04:01:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI+dMfsJ1bB1NHBzblIbjvGUdy5Hh2SEjrlZoRzKI+72rOu6N3AO1yDnXa1sfJg51HrWX1JQ==
X-Received: by 2002:a17:906:c14b:b0:a9a:1b32:5aa8 with SMTP id a640c23a62f3a-a9e3a5739demr2118202966b.4.1730721701790;
        Mon, 04 Nov 2024 04:01:41 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e566442easm542115966b.166.2024.11.04.04.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 04:01:41 -0800 (PST)
Message-ID: <c220507f-5701-4602-9627-82728dccfb33@redhat.com>
Date: Mon, 4 Nov 2024 13:01:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: remove redundant re-checking of err
To: Colin Ian King <colin.i.king@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-staging@lists.linux.dev
References: <20241012141403.1558513-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241012141403.1558513-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12-Oct-24 4:14 PM, Colin Ian King wrote:
> The check to see if err is non-zero is always false because err has
> been previously checked on whenever err has been assigned in previous
> code paths. The check is redundant and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index ca97ea082cf4..7cee4dc35427 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -6308,9 +6308,6 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe)
>  		}
>  	}
>  
> -	if (err)
> -		goto ERR;
> -
>  ERR:
>  	if (need_scaler)
>  		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);


