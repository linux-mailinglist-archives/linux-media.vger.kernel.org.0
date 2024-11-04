Return-Path: <linux-media+bounces-20795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D459BB425
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 13:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 216B81F23EFE
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 12:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB321B652B;
	Mon,  4 Nov 2024 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SmQkt9HR"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686BB1B0F02
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 12:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730721881; cv=none; b=Wm/JZUfvZ2zNDOlo+gU0eBFzIk+fXi8eFpsuQyQhXmwePPBKGJ3hBmCHdIxjfg1e/7oWNGSO1mNVDTqjoxZfVccQ94wr7amYE3hm03mXiJUlZEJ0xJvqA4PzZRscL8Hf2YYLB7z39AELoX+aE9rgGU7pHo2ESIh36dLSkrbgg+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730721881; c=relaxed/simple;
	bh=bKsxPbLJOjhXS5dwvRb7gDQwbg3TLOfgDt0fz6KwnIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Smu9DjfAjlj+0wuzC+j9aFpaHGIyJfDXEqIQL09K+QAJTujztBMZuO69KV9v5ZrvljRx1WLmFkN+fK3p74b/QkpODaC4d+bqHKPaoYMluytd/v2V+yM9E3Rr1w62YZ+rqZe12pcPawhzwNRgJdYf5aNKAeSQ6ilXBQk2XqSstEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SmQkt9HR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730721878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uRhG8emybav1jveE3I6lnpbMlJJQ1NkRHJ/vqZ/lKwM=;
	b=SmQkt9HRWRmAberA/0yCSY2iTfJvjyAeJhjcC3VAuBgsb0IcKEj8gHpdwTJJDXIfSWlyLj
	L8N9297LKrDIqw8Txt507TKqc1k3QifeMWDGznNOEWKH3Ib+g7Xv+jAUz2jVsCVAEkHmGP
	GZ0ApdhrBWY6WyYT6r5wk9Vvnl4977U=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-5eDT2-RrPgW5I_3YPlEblg-1; Mon, 04 Nov 2024 07:04:37 -0500
X-MC-Unique: 5eDT2-RrPgW5I_3YPlEblg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a9a0ac0e554so499302966b.1
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 04:04:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730721876; x=1731326676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRhG8emybav1jveE3I6lnpbMlJJQ1NkRHJ/vqZ/lKwM=;
        b=jhMSBIf3lbOAjOnW8a24DIEZV3aBSxQiyw3v0WLIJ3Yz0TWQKQblNY2t/BKIKkQMRm
         Ufk411Yh+YSSfFvWMnNUdhw+JENNVMawRYUfUBu3Hne2j+JVNFoL3BeJ4EvInyvjEPiZ
         1ChlxPk51T2li+vs47uPfsFh6XqUkE0Z03DvZS3xEB0DY9HAaM1OdGenw9vHRZAMo1si
         8ubzMekPVEeu05CN1ChjZyAusOiOVFY62W66ma35onvH11IX3t+KKOoWz2fTXqxEeGTu
         79xNbqN/jkE/n5ahznGrjTNHqonVaapjC3l4l/6CIMToIkXUEi0b++/1tTtVcKmjyQWV
         khvA==
X-Forwarded-Encrypted: i=1; AJvYcCU8THhmeVtmq0pHtPzLkICgW8ysiBUMYiC9o0dowyjr6RPTr7GQX8GMo59RgKfIz+hRsg6eZqy5Azqa5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrwVZPqVgpo8Ru2/Iuro4mfHTy6J1H3klHr/4Mhbjsdu1UARd4
	TwaSozJ612GX8QAEORfqbTRmB7L7lyexqV0nDiAXDEGu+KDY1a41wV2YMsXbhuaw5doS7cIl4H8
	5il2Q33if3YgFYR7tjwvse+VQaFneg1QofJ3PTGMrf4+2J+qi6+kmyBD3/B8lo77uC/x4
X-Received: by 2002:aa7:d490:0:b0:5c5:c2a7:d535 with SMTP id 4fb4d7f45d1cf-5ceabf49e20mr12028241a12.16.1730721875619;
        Mon, 04 Nov 2024 04:04:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm/rpK0+UAygyYv+wvXZBfqWjdissJMQdbMV9lkyNEypi5FgacHmiCaOjPUnh7ECYxzDnZTA==
X-Received: by 2002:aa7:d490:0:b0:5c5:c2a7:d535 with SMTP id 4fb4d7f45d1cf-5ceabf49e20mr12028221a12.16.1730721875230;
        Mon, 04 Nov 2024 04:04:35 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac77051csm4161402a12.32.2024.11.04.04.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 04:04:34 -0800 (PST)
Message-ID: <24dadaaf-54ec-4f3a-9c6a-9aea755d0150@redhat.com>
Date: Mon, 4 Nov 2024 13:04:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: atomisp: Add check for rgby_data memory
 allocation failure
To: Li Huafei <lihuafei1@huawei.com>, mchehab@kernel.org, alan@linux.intel.com
Cc: andy@kernel.org, sakari.ailus@linux.intel.com,
 gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241104145051.3088231-1-lihuafei1@huawei.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241104145051.3088231-1-lihuafei1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4-Nov-24 3:50 PM, Li Huafei wrote:
> In ia_css_3a_statistics_allocate(), there is no check on the allocation
> result of the rgby_data memory. If rgby_data is not successfully
> allocated, it may trigger the assert(host_stats->rgby_data) assertion in
> ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.
> 
> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Signed-off-by: Li Huafei <lihuafei1@huawei.com>

Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans




> ---
> Changes in v2:
>  - Corrects the "Fixes" tag.
> ---
>  drivers/staging/media/atomisp/pci/sh_css_params.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index 232744973ab8..b1feb6f6ebe8 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -4181,6 +4181,8 @@ ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
>  		goto err;
>  	/* No weighted histogram, no structure, treat the histogram data as a byte dump in a byte array */
>  	me->rgby_data = kvmalloc(sizeof_hmem(HMEM0_ID), GFP_KERNEL);
> +	if (!me->rgby_data)
> +		goto err;
>  
>  	IA_CSS_LEAVE("return=%p", me);
>  	return me;


