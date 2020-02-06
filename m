Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 886D6154F46
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2020 00:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbgBFXNN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 18:13:13 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:47958 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726810AbgBFXNN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Feb 2020 18:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581030792;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ovTXx+xWsVVvcWTueNLRiNI2x9GFeRpwr8D2opCIOzQ=;
        b=Ksicqbf7WobLXK5TZN+i+SdvG4ZhuFFKdc8BB2zfdo0n6Bmx7rhykkNh+q9RVKyqbqsraq
        hJ24NIzHDwjorj2Yrcboy6Ps7DjeMd+7ORFRTmqY/4r/lX6uwsDeGuPF6ObRNwCAP1rplv
        +eF8Us9xcR1WXnX92aImB3ZNJRpSDxs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-clrhLuhJOhiTnmOqPznM1g-1; Thu, 06 Feb 2020 18:13:10 -0500
X-MC-Unique: clrhLuhJOhiTnmOqPznM1g-1
Received: by mail-wm1-f69.google.com with SMTP id 7so30930wmf.9
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2020 15:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ovTXx+xWsVVvcWTueNLRiNI2x9GFeRpwr8D2opCIOzQ=;
        b=qr/gyEOGEh5RxoZNoSyKEdvtjmfl1UPdg7Pc+NEpt9IRdKw5+aZvqqcWdlQebo5h5n
         DHgYhhub/ckeGWqIelN/Opmma4/kjvMMHC2+h6QekamUMkRBMT5PwoxPS4/A2dw7mAuz
         BQmEyHDftx97jreG3X1kZeCHYdZ7tAiKhwJ1HaZw2CsJbVN62koYv/2eMM2nEVOS0bmq
         qKqCYUbZkXLyilcnWA2ilXKbOlLjgoKjTNvaD5+UEyufJJZuw4vBK3JFPyb8GqPRKcfm
         /YZVv/HlmIY7H7fLEOt7gA6sCWpetuvSQ7TKgcivKWb2MNVpDX0K859ByrOeVlPbiuiJ
         cWig==
X-Gm-Message-State: APjAAAV+zMKolQ4iPTCKHCBBdugRZJZcKvaIlLgYGdZiCFbVXcRQEuNW
        i36kBGs46Ago/1c/ZSkdtB658MjYXN77EZzEVJPT/LSouBwJgyfQb8+sDizTqdcSY7phGxwASgR
        nDr3nzweeUqqlFz43IdAyM5M=
X-Received: by 2002:adf:ea8a:: with SMTP id s10mr350220wrm.278.1581030789118;
        Thu, 06 Feb 2020 15:13:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqxpPgxP7VqpbULo5NzkBwe7sU5E7LLsmpWpKLbGQqFAk8+VcXEIIlWKAPJjpO6C+2oAcenf3A==
X-Received: by 2002:adf:ea8a:: with SMTP id s10mr350193wrm.278.1581030788839;
        Thu, 06 Feb 2020 15:13:08 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:a9f0:cbc3:a8a6:fc56? ([2001:b07:6468:f312:a9f0:cbc3:a8a6:fc56])
        by smtp.gmail.com with ESMTPSA id w19sm1077050wmc.22.2020.02.06.15.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 15:13:08 -0800 (PST)
Subject: Re: [PATCH v2 21/27] docs: kvm: Convert locking.txt to ReST format
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Cornelia Huck <cohuck@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <cover.1581000481.git.mchehab+huawei@kernel.org>
 <1464d69fe780940cec6ecec4ac2505b9701a1e01.1581000481.git.mchehab+huawei@kernel.org>
 <20200206171132.4f51f17a.cohuck@redhat.com>
 <a17d6a27-0d3f-2020-7fc2-87ec20a6225f@redhat.com>
 <20200206234736.196ef417@kernel.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f1d60271-22e7-4236-c742-c11111a3e77c@redhat.com>
Date:   Fri, 7 Feb 2020 00:13:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200206234736.196ef417@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/02/20 23:47, Mauro Carvalho Chehab wrote:
>>
>> But the two headers should be "CPU 0" and "CPU 1", and it's worth
>> changing that while we're at it.  Same for the table below.
> 
> Ok.
> 
> Maybe we could append the enclosed patch to this one. I suspect it would
> visually be better.

Looks good to me, thanks.

Paolo

> 
> Cheers,
> Mauro
> 
> ---
> 
> diff --git a/Documentation/virt/kvm/locking.rst b/Documentation/virt/kvm/locking.rst
> index 428cb3412ecc..82322a4c9fde 100644
> --- a/Documentation/virt/kvm/locking.rst
> +++ b/Documentation/virt/kvm/locking.rst
> @@ -57,18 +57,18 @@ But we need carefully check these cases:
>  
>  The mapping from gfn to pfn may be changed since we can only ensure the pfn
>  is not changed during cmpxchg. This is a ABA problem, for example, below case
> -will happen:
> +will happen::
>  
> -At the beginning::
> +  At the beginning:
>  
>  	gpte = gfn1
>  	gfn1 is mapped to pfn1 on host
>  	spte is the shadow page table entry corresponding with gpte and
>  	spte = pfn1
>  
> -	   VCPU 0                           VCPU0
> +  On fast page fault path:
>  
> -on fast page fault path::
> +	   CPU 0                           CPU 1
>  
>     old_spte = *spte;
>                                   pfn1 is swapped out:
> @@ -80,6 +80,7 @@ on fast page fault path::
>                                   gfn2 by the guest:
>                                      spte = pfn1;
>  
> +
>     if (cmpxchg(spte, old_spte, old_spte+W)
>  	mark_page_dirty(vcpu->kvm, gfn1)
>               OOPS!!!
> @@ -107,16 +108,16 @@ spte is read-only and the Accessed bit has already been set since the
>  Accessed bit and Dirty bit can not be lost.
>  
>  But it is not true after fast page fault since the spte can be marked
> -writable between reading spte and updating spte. Like below case:
> +writable between reading spte and updating spte. Like below case::
>  
> -At the beginning::
> +  At the beginning:
>  
>  	spte.W = 0
>  	spte.Accessed = 1
>  
> -	   VCPU 0                                       VCPU0
> +	   CPU 0                                       CPU 1
>  
> -In mmu_spte_clear_track_bits()::
> +  In mmu_spte_clear_track_bits():
>  
>     old_spte = *spte;
>  
> 

