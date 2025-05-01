Return-Path: <linux-media+bounces-31501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C15CEAA5F9C
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 16:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 878CE7AAF85
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 14:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7351B0424;
	Thu,  1 May 2025 14:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FsxCl4jg"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897E6189F3B
	for <linux-media@vger.kernel.org>; Thu,  1 May 2025 14:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746108357; cv=none; b=Rivq9wa5tecEXIAJsgmHNoFX/Zj/Rk6VKzDB91GbbfhRXYaYh3WS9M82pA7mJwPXgJb/dGSnamw34ahlvRVdXQLQgz9GYWwKePA7slAoLu5YQoHisufbxI0VBsLu3bWQdWv5SdT1REwT40s+ZXuEmp5EODeU3hLrQ8vC2K/v4oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746108357; c=relaxed/simple;
	bh=Ia9Pqba8pfyQffd2aIL4prw8ySFssSIiIKNrFVqjooA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pfr4yCWhVBLbhxuckejtAXl9HBTdbhiaXup10ZYo7M7g4UBb5aG+77Iczho2zKLU3ICASoTEQJEW/n3upS+QK3oq+v+f3kQft24QP+2ae7lgk5slj8pbNoxQ6Vgs5flfU5RA9lTCCw3czGadm8XZGKBS67Gg3RX2P5IoqZQIFSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FsxCl4jg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746108354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KyXtRYMLqju0dSiKmoVhPKAABeqQTlk//KNp32q2a54=;
	b=FsxCl4jgx3JcKI8qXY78OBG05vSYq00mYYHx0MenpRsMd84YjDh2f70aY15So3vfjeFH7p
	FAGfCl+LZZVjuMJ21sxKhDm+nxzu27y6Kk4aQWSHUJo5iiN7Rnjb5J9JAyjO8sucdEzTLp
	eB89M9nSB1yvUl+xevJxmqFuAFfVBZ0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-fzLVJkQnO4q9giAVwjrHSA-1; Thu, 01 May 2025 10:05:46 -0400
X-MC-Unique: fzLVJkQnO4q9giAVwjrHSA-1
X-Mimecast-MFC-AGG-ID: fzLVJkQnO4q9giAVwjrHSA_1746108345
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5f64bb8ec7dso897973a12.1
        for <linux-media@vger.kernel.org>; Thu, 01 May 2025 07:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746108345; x=1746713145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KyXtRYMLqju0dSiKmoVhPKAABeqQTlk//KNp32q2a54=;
        b=FQl4kkT8CG4C+4YLFIApKfu5PO9584T2KbNsAuh36AtIE0FhrYjSpENRaDjLCB73Kt
         sXY2E0FeRdFlxOZH6FpRHAIgaT0cPJqKll+7yqbo9mkAABvrnfaL6zL331NnOgPMlIHy
         8h28uL/DivnT2R/iHkcsI4Zjw7xPqem1qMOAJnlqDwAkH2sFrkXN0U6myspBUXZx0tGZ
         XiYaBN+XoSBZTJKYDynKlEYsQT+2YoE/efhNc2/wqxd8WeLQsz/I9ZuY6Xrx+iZ25UOm
         mgUo7njRFvXu4gex4XMlObCI5XNNo5LFlFm94QVwl99LFfefGaNgyEUWMSmIs4RBIKtK
         RSGQ==
X-Gm-Message-State: AOJu0YxlG5e+9O/ESmfdgGhFutX+TGnOX9zL2Gf82o1Gn5+yUMGyDjcb
	ghz3DIDc12BCGzJuxfuj3UDLSwkcbEBal3fUIzzARnMEKV0mF3XfSYTbG+MZjumEFEvHjANf873
	1oW8X7RqOuBH35H+FN/BGFJhk4RRbkp2RXBjIkZdoxWjqXBfjrOykEp+v7cF2
X-Gm-Gg: ASbGncuKltRYm6NhcAjNoYs5Y40Q0Z2BQ65koVoTiDZfAPmhCP9Vm2se+t2zGh9GLxi
	IiI6SeGK2eqwdNuapn1yRzTclWCbIioATi76sjeeiWNcm1nehn69RLGDV9a6hSCI3D2ZYcOFOoG
	3uUtQbOr5PValRXP5J/uouyzb9PE3Fj9ZutrgFl1Dg1zha9oZIX8+mk2ZvZW/7osNBY93Ere5+q
	RSDh5/RXUbyj0UlStMhIfKszw275gkIYGNk0u9HAiesVn8FfOU/sHpa+Q6a+PDXrV1KbGc3+ZgF
	EZGd/Gckl4nUiAlg5j6y3/m68GIq+pxEdqryxulwTniK4mdSakblwidyzzhBTyIcuvGh37sxgER
	dTO9UALCU2LuRpRl/wwKKzPZh/A9zc8bubVU8UNSNB+0wFm2WMrsNeJtOnD2s1A==
X-Received: by 2002:a05:6402:3715:b0:5ec:6feb:5742 with SMTP id 4fb4d7f45d1cf-5f919c261c3mr2131126a12.16.1746108344586;
        Thu, 01 May 2025 07:05:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDhoZaeI6biHqb5mVxFfbWVh96VLVq/0Z9oLZNF4XUFEgbrMuh+eKHVXO2KIKPxJmCiNKdKw==
X-Received: by 2002:a05:6402:3715:b0:5ec:6feb:5742 with SMTP id 4fb4d7f45d1cf-5f919c261c3mr2131085a12.16.1746108344165;
        Thu, 01 May 2025 07:05:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f93004de23sm476046a12.81.2025.05.01.07.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 07:05:43 -0700 (PDT)
Message-ID: <c3707ad7-3eb9-4cc4-8baf-5e9da1eafe39@redhat.com>
Date: Thu, 1 May 2025 16:05:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: atomisp: Use the actual value of the enum
 instead of the enum
To: Ricardo Ribalda <ribalda@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-2-2a50f5acfd0b@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241202-fix-llvm9-v1-2-2a50f5acfd0b@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 2-Dec-24 4:47 PM, Ricardo Ribalda wrote:
> hrt_isp_css_irq_sw_pin_0 has a different enum type than
> irq_sw_channel_id_t.
> 
> Replace it with the actual value of hrt_isp_css_irq_sw_pin_0 to avoid
> arithmetic operations between different enum types (and make the
> compiler happy).
> 
> It is required to build with llvm 9 without these warnings:
> drivers/staging/media/atomisp/pci/sh_css_hrt.c:68:19: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
> drivers/staging/media/atomisp/pci/sh_css.c:1233:40: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
> drivers/staging/media/atomisp/pci/sh_css.c:1237:40: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
> ro
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

with Andy's suggested commit message improvements applied.

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans





> ---
>  drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
> index 2c47e7820bd7..69e68ecd6bc3 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
> @@ -18,7 +18,7 @@
>  #endif
>  
>  /* The IRQ is not mapped uniformly on its related interfaces */
> -#define	IRQ_SW_CHANNEL_OFFSET	hrt_isp_css_irq_sw_pin_0
> +#define	IRQ_SW_CHANNEL_OFFSET	HIVE_GP_DEV_IRQ_SW_PIN_0_BIT_ID
>  
>  typedef enum {
>  	IRQ_SW_CHANNEL0_ID = hrt_isp_css_irq_sw_pin_0 - IRQ_SW_CHANNEL_OFFSET,
> 


