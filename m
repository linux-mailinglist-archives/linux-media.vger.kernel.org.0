Return-Path: <linux-media+bounces-3101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84299820ACF
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37E161F22090
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 09:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDF4258F;
	Sun, 31 Dec 2023 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hwQsNOW+"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750046120
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704015583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vk3txT26e7SWpEKiy3zRs/EoTj7N1RJcMrINqJppEj8=;
	b=hwQsNOW+nj7Cy1UMxc+Chbjlm16Zc3TvlJgGrRGa5JJ7EJkPQBR4KQ061497sihpRwbEDq
	ul/BLZAIqcMlrqbpt5s+94eJUtP8mV3MbUyPeto+Mapav5ZTtosTANHVTqEfWfc919aOho
	1HtP5Q0186l/msau0TUHBQs3SPBU9gI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-dGO7y0O4PHi64QcqGfIULQ-1; Sun, 31 Dec 2023 04:39:41 -0500
X-MC-Unique: dGO7y0O4PHi64QcqGfIULQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-555e088203cso585416a12.0
        for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 01:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704015580; x=1704620380;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vk3txT26e7SWpEKiy3zRs/EoTj7N1RJcMrINqJppEj8=;
        b=XpRLmUhWfOwC7mT4bnoB3sH0Mws0dcCzVIOO6mQw8wDzxtPlwY3uGv75qDqx6uzRqM
         pC+kirrzsAP5v6C8bI6v7AcUNQH67zjqHKT58QVuqqogecBjSGIFK+J+bz2y97D6YXq/
         p6nTZfqX5WZ36+6mg8fBYnr/mXdBgzMfJ9fWd9hsiviUUaYz9WfFGRBz7h71d7mm3eGS
         UckJ4UtwDbvLQSFJ7hCAD7XJGKreJYz8ZY6VA/t4GDmEt3ifvL5T3cVs4+zTRhJwQBVv
         vAGUGFiB8xxSbWB/6zSeKZkM0kxz8JiibWGsVScWs1EwPIFrdj1/RF58wHQWblGo5O51
         Khiw==
X-Gm-Message-State: AOJu0YzzpK8ppc3mTx4vWmQYvxHxXiglTIZyjVnEHlS1V0OXRgaVArBQ
	VeNdh8VYbQd0Ay+6y2hzN9WAmaC4Dk+73FO9dslggwPtPI2Qkll3WxyOYtXmkWOw/NzEU6ZuF0J
	aS4iV5BySbpQnGPljP8iWdRxfYufgliA=
X-Received: by 2002:a50:d5d0:0:b0:553:5648:ea36 with SMTP id g16-20020a50d5d0000000b005535648ea36mr388053edj.10.1704015580823;
        Sun, 31 Dec 2023 01:39:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFHMahADUOvJvY1qJ4N+RJzMCNlqeNzlKKxhFy8fKhTN4masLA/nfxtfblTgL3LviDxmopuQ==
X-Received: by 2002:a50:d5d0:0:b0:553:5648:ea36 with SMTP id g16-20020a50d5d0000000b005535648ea36mr388047edj.10.1704015580629;
        Sun, 31 Dec 2023 01:39:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ew10-20020a056402538a00b005546ba152f4sm10900308edb.71.2023.12.31.01.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:39:40 -0800 (PST)
Message-ID: <6ed5ec1a-b645-4c4f-94e6-459bfe96e917@redhat.com>
Date: Sun, 31 Dec 2023 10:39:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: atomisp: pci:
 isp2400_input_system_public.h
Content-Language: en-US, nl
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231222194036.1984-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231222194036.1984-1-kdipendra88@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/22/23 20:40, Dipendra Khadka wrote:
> The script checkpatch.pl reported repeadted
> word 'of' in isp2400_input_system_public.h
> as below:
> 
> '''
> WARNING: Possible repeated word: 'of'
> /*! Read from a control register PORT[port_ID] of of RECEIVER[ID]
> '''
> 
> This patch removes one 'of'.
> 
> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/pci/isp2400_input_system_public.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
> index 447c7c5c55a1..523c948923f3 100644
> --- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
> +++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
> @@ -163,7 +163,7 @@ STORAGE_CLASS_INPUT_SYSTEM_H void receiver_port_reg_store(
>      const hrt_address			reg,
>      const hrt_data				value);
>  
> -/*! Read from a control register PORT[port_ID] of of RECEIVER[ID]
> +/*! Read from a control register PORT[port_ID] of RECEIVER[ID]
>  
>   \param	ID[in]				RECEIVER identifier
>   \param	port_ID[in]			mipi PORT identifier


