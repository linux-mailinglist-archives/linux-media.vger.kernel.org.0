Return-Path: <linux-media+bounces-31505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A8BAA5FDA
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 16:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6A743BD8E6
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 14:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6DC1F1500;
	Thu,  1 May 2025 14:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dZLoZWox"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2351F0E25
	for <linux-media@vger.kernel.org>; Thu,  1 May 2025 14:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109356; cv=none; b=N0woj0Ij9YbNBIWN4pkTQXhviErm90Fofyc247FHzis1opTb9eaFiHpvPpShK0xehgqm7xQGilfn1Y4ri8x+wn0NRW5h94FBx4yUl3msT06zdlZfMjE890cD3ki+EbR2RKq296rYcoiVreP44ZNfbW1r1xK3x+b1DymsB3IYnvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109356; c=relaxed/simple;
	bh=hNjaiSBspZ+UBmsreusgIc2BvSovtY7pkegoMP8xBFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f43rOJA3jbnNSGCJbdpzApUSt+fY43bilbJlhzGG1c4waIyehPZNGVwe1D5T4lKnYtfUpSdtQ2XbFDt+s8tnuIhLcxitHskwManIJDD6ERgqL+KuPuhwTQsK01N5Baerv727nKA30bca2eJ2lwSaaAP9t/R0pVh3kYLmRuPk6C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dZLoZWox; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746109353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hkAUnIn6FFgVAGrawRWWcF2hLPPn39ZWsAD7ItD6a9s=;
	b=dZLoZWoxBQKA8J9EM52TUZASmdxV6NI6bbsVoqQY4dCxSx8bVws6Fb2cTATGU4T2z50B0S
	bQ1TI48r+/phlv9Kuni9NkDEdq+CNHn8i+yoggDohHzGx9ItfqsM0cjgRdohE3kXgsYFgQ
	32NSScX5NJY4Q+nfaaCXFsDOR5OeICI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-PVgPUUNLMFuONEOEJ76p7A-1; Thu, 01 May 2025 10:22:32 -0400
X-MC-Unique: PVgPUUNLMFuONEOEJ76p7A-1
X-Mimecast-MFC-AGG-ID: PVgPUUNLMFuONEOEJ76p7A_1746109351
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac6caf952d7so104038266b.3
        for <linux-media@vger.kernel.org>; Thu, 01 May 2025 07:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746109351; x=1746714151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkAUnIn6FFgVAGrawRWWcF2hLPPn39ZWsAD7ItD6a9s=;
        b=uDaIZ/IzTcA87amFu7/mi8u0yc91dwVy0/nYAeS4nvfDBnqaCxfXC7DCC8BQySIGvH
         o9z8cMEgcQ0msQZiLxjpA2CHOGb17RsOTyg4XfyHCqDKd7SDyOFhq4jgjcdscl0vRPzq
         chb8SY4dJTTENjltffmOYNc642YnlJZO3hub7mM5dto0jqCSxJOM+9ibIsZwAfxD0eME
         jPs5Uh48+jGCyc5t79WTFoCvMNaw+9Uan5G6Qwfn8DaBFoogfEgQ9QH0yvcFZhUq1Oxa
         6Z4lXhPeIG38F7iXOfvlcVBZAwzXUQei3R85c0d2C1wPXwH8ifb5ljQYgONtAzFzG95T
         yoWA==
X-Gm-Message-State: AOJu0Yx71hjclqBQoj2no4UfpFXWs4KHXBna+UXJjBe5J2c9AjIWdHAn
	MmPsOOEVJPmegU/TkJSBElXpWXynDXBqvG/tbJVKQFk5BfAsbZ8226xtM/oInp65T6nZPViyAJc
	4ZLJbAeLwESVrO3rb4oUkLL9A3RPAV2Cr28E8r1M6CmbRXBFa+qi3mehJ2jw1
X-Gm-Gg: ASbGncvJiGbWp4iAdID/G/yq70Lr8f+qz2jQJWmUOo/PEkQa8rDGs6ghOAEvBydeS76
	RbHF3lX4FIlsd7Z3FYT3HBNhLsMWturHra0yyTjCX6vQlW8CuGP6dp/jozgcNaTWKKL27boImBC
	bIAAwZ8wp85/hV8a/PcZbgQtzN4jWs7X6dIGpGEsoFQgj5G52mvu94xKLipdkIdgu9nWTY69f2t
	rggeAxrfCzE0KQxdmrtMY4OnZl8zuLTDS7fZcsUoWxv9S5mVsfkx9mBN4AlT/vF3JVe54+PHxIQ
	NkMgLwblWkPnoJnIc1fYXoOH4FfZ0iKQof3f1DDssMbssbR+wAVx4vvgank8UbOe8VWdpWLXllT
	aqnLqt6HZT+3/qRfxqwjkPI0ejmillZX4hdAn4XXeu6njb2rUfSOyuCm2C47X7g==
X-Received: by 2002:a17:906:f583:b0:abf:6ec7:65e9 with SMTP id a640c23a62f3a-acef49a2659mr340185766b.43.1746109351191;
        Thu, 01 May 2025 07:22:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQmCIsPg7hTA49kuwUzziwpHJFu2yj1P2zhbby8GVrxeUIu/zBWlAvOLjXWp6RRhte8XIg8g==
X-Received: by 2002:a17:906:f583:b0:abf:6ec7:65e9 with SMTP id a640c23a62f3a-acef49a2659mr340183966b.43.1746109350904;
        Thu, 01 May 2025 07:22:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55b24esm46601966b.132.2025.05.01.07.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 07:22:30 -0700 (PDT)
Message-ID: <e0a01923-7d66-4076-a125-83875c60a48d@redhat.com>
Date: Thu, 1 May 2025 16:22:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: atomisp: fixed spaces to tabs
To: Thomas Andreatta <thomasandreatta2000@gmail.com>, andy@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Andreatta <thomas.andreatta2000@gmail.com>
References: <20250426193033.483124-1-thomas.andreatta2000@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250426193033.483124-1-thomas.andreatta2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 26-Apr-25 9:30 PM, Thomas Andreatta wrote:
> Removed spaces and substituted them with tabs.
> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans




> ---
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index e176483df301..0d5e35845ed7 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -518,7 +518,7 @@ static int gmin_subdev_add(struct gmin_subdev *gs)
>  
>  	/*WA:CHT requires XTAL clock as PLL is not stable.*/
>  	gs->clock_src = gmin_get_var_int(dev, false, "ClkSrc",
> -				         VLV2_CLK_PLL_19P2MHZ);
> +						VLV2_CLK_PLL_19P2MHZ);
>  
>  	/*
>  	 * Get ACPI _PR0 derived clock here already because it is used


