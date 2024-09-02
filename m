Return-Path: <linux-media+bounces-17330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B01F96842B
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 12:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C5641C2278A
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 10:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390F313D601;
	Mon,  2 Sep 2024 10:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y5Im/RNr"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BBA13CA99
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271830; cv=none; b=JGu4C485ewQPTuerYoVY855HVgqtKv8KdmKikNbB4YIwT8hA7j7TW5lzuET3GcS+Ny86s317NZBr+JG9jmaxlRbYKLEnx+MJi1gwRSiUqXL9k2rPujNZqnkB5I8B50SBuQFVr3NrfDBUMZ59e1z+xwDlBGXZ17Gro3jPuoeojRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271830; c=relaxed/simple;
	bh=CJfBp+zz9O8U9TodfKkkb1LMYA7hqNM0ZKFm/w+kJw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGFVW3jK514RY9RyUG8wHwGcukW4l5rSyEa/YguvkzHaMWRayXa5sPB4s+x+SuhhKzJfVpBiovt3nsf824v9fMzsgZmgQUASrcnvjzR+eivUg6QiJfzcfWjFrX5Y/ESDGO3Tcuu9x0c/hf6KtBJhphsCmVq/jy8BpzLHi0BrqKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y5Im/RNr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725271828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zbcesK30dFCAjKEHF6Iech8QUJGNsrD1K+Bsbth5WGA=;
	b=Y5Im/RNrK68oeydVgWDn2OEWpEGfOjRr/5CrpZ6HbZeE0IhZt6ACjbRK/eDz0QgNwmHlkQ
	X/Rp8bdCkwljVlHK0zeXZmK8N2jKvrHnxUywCMZmr/FdU/SJtR4SDG7Nx8dSId5IZhfont
	3tieGwoNFf2rCkBVDq4DVD0spP+YA1Q=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-veYzkLPvMj6081zM2jLsSQ-1; Mon, 02 Sep 2024 06:10:24 -0400
X-MC-Unique: veYzkLPvMj6081zM2jLsSQ-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-53351fe4bb8so3948910e87.3
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2024 03:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271823; x=1725876623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zbcesK30dFCAjKEHF6Iech8QUJGNsrD1K+Bsbth5WGA=;
        b=hLEtFp8O9TVeJuxKFUEC34sznttXr2mUJ89stap+9g3Mg5zQP+Bp87pubJcW8z08Bs
         AaQ7mPSG63JyT/tHFEG3O4VHnTC3jDdTH2jRaOvQ9Z8ky+5UA4volsjwrMKrrpsl4g73
         SD+gVkN+/DZXmntuHB/CiACzkWzZRUPd0xf+MgJWinSPTt5+2+afmQDNwjTNMM44IZOB
         J1aMwkj+X3hbGYbMajwID+Qc0KWUbnIocwKb1EvuFfE4Cf/gdwIzU1p39Ku7XpP8haCa
         ayYLqqurz1c08niO4RwQx8AVopOD4sde+q31fd/igThiMpCsvWiLzu+UNasYgwFmXsWa
         dE1A==
X-Forwarded-Encrypted: i=1; AJvYcCVoZg7lB/dqOa+UHZjuSYiLWNEYphmtp/stu8bgTpinyNbt4feduwWrboxtlDvofirwSzjCik5/otXWCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuA7hycBhO4hLmFV8opKXT12BMFUPOP62tS6i+Jax43JPi0yIv
	HbspVMzZ9cTbFgAqVXAZuitbI72SSy9m8H3jttL1jqPPeAlFR7Azq8cYMysdZAAUsPUxhTDBLpD
	wmFQM13m6rEbE0LWMT0kZiVE6WF2fApV6oHUVjpevKNieNfIK8qMDYkmH80AA
X-Received: by 2002:a05:6512:1088:b0:533:482f:afbe with SMTP id 2adb3069b0e04-53546b23dfemr6932470e87.24.1725271823249;
        Mon, 02 Sep 2024 03:10:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKM4RT19+f2nGX8fLMo4BLPojDh8vT2rKLAiyfS6RWsdsrTL0I9CqEd31GLPnQavcUL93/SQ==
X-Received: by 2002:a05:6512:1088:b0:533:482f:afbe with SMTP id 2adb3069b0e04-53546b23dfemr6932433e87.24.1725271822625;
        Mon, 02 Sep 2024 03:10:22 -0700 (PDT)
Received: from [192.168.171.203] ([109.38.145.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196a86sm537216166b.127.2024.09.02.03.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:10:22 -0700 (PDT)
Message-ID: <d6724490-1f43-4bbd-a80f-575aa31af47f@redhat.com>
Date: Mon, 2 Sep 2024 12:10:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: Fix trailing statement in
 ia_css_de.host.c
To: Kathara Sasikumar <katharasasikumar007@gmail.com>
Cc: ~lkcamp/patches@lists.sr.ht, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, helen.koike@collabora.com
References: <20240730082725.2524-1-katharasasikumar007@gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240730082725.2524-1-katharasasikumar007@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/30/24 10:27 AM, Kathara Sasikumar wrote:
> Fix checkpatch diagostic of Error : Trailing statements should be on the
> next line
> 
> Signed-off-by: Kathara Sasikumar <katharasasikumar007@gmail.com>

Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
> Hi,  
> 
> This is my first patch for the kernel. 
> Big thanks to Helen Koike for the guidance 
> at her Debconf24 workshop.
> 
> Thank you,
> Kathara
>  .../media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c   | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c
> index 25e3f0822..e66faeda3 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c
> @@ -47,7 +47,8 @@ ia_css_de_dump(
>      const struct sh_css_isp_de_params *de,
>      unsigned int level)
>  {
> -	if (!de) return;
> +	if (!de)
> +		return;
>  	ia_css_debug_dtrace(level, "Demosaic:\n");
>  	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
>  			    "de_pixelnoise", de->pixelnoise);


