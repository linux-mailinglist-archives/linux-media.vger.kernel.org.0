Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACA9508699
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 13:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377922AbiDTLKK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 07:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377913AbiDTLKI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 07:10:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 96EE828E1D
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 04:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650452841;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TUFhF3hl2SKfIxx89PLl432LqDZkfSZvjeGeXMqsrlg=;
        b=P71n90LmCT/TRJTcOdicF3sFeuX9yzIzn6J7NPQTQMSuJdrYbPOke7GaSz63XBBZfYkyG5
        uAfE6K5D9Xr9lzQlpvdHtGU57JLAxKZQFucG/xduuRSHq6usBHhfngQxvQrxlFYdHCJK4/
        k0nNkRg0ZBo3Yo3wB6iFYK46HTGUoeE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-_36YpLppO8ikX0aprDGKyw-1; Wed, 20 Apr 2022 07:07:20 -0400
X-MC-Unique: _36YpLppO8ikX0aprDGKyw-1
Received: by mail-ej1-f70.google.com with SMTP id qa31-20020a170907869f00b006ef7a20fdc6so800464ejc.5
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 04:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TUFhF3hl2SKfIxx89PLl432LqDZkfSZvjeGeXMqsrlg=;
        b=r/eMuZHTwW1bIya3X3mKJv6u/aA6hGyzVzjF66m/dpJCq4tjt/m4g9Rd5IrgWye/qd
         nuwyBsNODGRofyVMyoVXnGsN+6lLaMVeCViz+QTu7/y9fuwGTXqjWXBR9kGHMGn7UyBI
         RZitDAktbPBbHefHIRVMlrFqdrFrB9e/TryNiC6NkfOqAh2JWNDbbPTi1OTqGfXUbBNp
         SMtyW5FEIEr6xm06guwvqCW7HM8IpppoDHvBnX8rGlKZl38I8Aq+m1NL9kztdf7IjMzo
         iBGqzIW0oHyf5H8mt1IiZBquf/4Sxq1P3gxR26cObro90+XSgwNWqOx/B7ddraqtkUh8
         4NnQ==
X-Gm-Message-State: AOAM532eKkR+tMbex9U19uA/QzM0gjtD/DJnEipKKFvl6jH7mZ/je18U
        kXANUwfeVaQ3zKkTmwQHheCAUsoWt72hIFjiTXz6OCnXsix1vW+XVTsCV67OGoJdItNSdZzWsOj
        GP6HfoN/2QHy4iBzPOEpUjck=
X-Received: by 2002:aa7:d292:0:b0:41d:7933:1f00 with SMTP id w18-20020aa7d292000000b0041d79331f00mr22321187edq.237.1650452838091;
        Wed, 20 Apr 2022 04:07:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4xkdSFzHKfg4PBYhoD0/mOJsBUEzZ2dXQcXai1pQkf6+YZSMmE+Tg6Ubf6jiqCkiDSYI/Sw==
X-Received: by 2002:aa7:d292:0:b0:41d:7933:1f00 with SMTP id w18-20020aa7d292000000b0041d79331f00mr22321172edq.237.1650452837920;
        Wed, 20 Apr 2022 04:07:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id u6-20020a170906408600b006e87d654270sm6560779ejj.44.2022.04.20.04.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 04:07:17 -0700 (PDT)
Message-ID: <2d096f20-dbaa-1d49-96e9-a7ae6c19f7fe@redhat.com>
Date:   Wed, 20 Apr 2022 13:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] staging: media: atomisp: Use kmap_local_page() in
 hmm_store()
Content-Language: en-US
To:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
        outreachy@lists.linux.dev
References: <20220413225531.9425-1-fmdefrancesco@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220413225531.9425-1-fmdefrancesco@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 4/14/22 00:55, Fabio M. De Francesco wrote:
> The use of kmap() is being deprecated in favor of kmap_local_page()
> where it is feasible. The same is true for kmap_atomic().
> 
> In file pci/hmm/hmm.c, function hmm_store() test if we are in atomic
> context and, if so, it calls kmap_atomic(), if not, it calls kmap().
> 
> First of all, in_atomic() shouldn't be used in drivers. This macro
> cannot always detect atomic context; in particular, it cannot know
> about held spinlocks in non-preemptible kernels.
> 
> Notwithstanding what it is said above, this code doesn't need to care
> whether or not it is executing in atomic context. It can simply use
> kmap_local_page() / kunmap_local() that can instead do the mapping /
> unmapping regardless of the context.
> 
> With kmap_local_page(), the mapping is per thread, CPU local and not
> globally visible. Therefore, hmm_store()() is a function where the use
> of kmap_local_page() in place of both kmap() and kmap_atomic() is
> correctly suited.
> 
> Convert the calls of kmap() / kunmap() and kmap_atomic() /
> kunmap_atomic() to kmap_local_page() / kunmap_local() and drop the
> unnecessary tests which test if the code is in atomic context.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>


I've successfully tested this on both the front and back cams
of a chuwi hi8 tablet:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/pci/hmm/hmm.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> index 46ac082cd3f1..54188197c3dc 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> @@ -482,10 +482,7 @@ int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
>  		idx = (virt - bo->start) >> PAGE_SHIFT;
>  		offset = (virt - bo->start) - (idx << PAGE_SHIFT);
>  
> -		if (in_atomic())
> -			des = (char *)kmap_atomic(bo->page_obj[idx].page);
> -		else
> -			des = (char *)kmap(bo->page_obj[idx].page);
> +		des = (char *)kmap_local_page(bo->page_obj[idx].page);
>  
>  		if (!des) {
>  			dev_err(atomisp_dev,
> @@ -512,14 +509,7 @@ int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
>  
>  		clflush_cache_range(des, len);
>  
> -		if (in_atomic())
> -			/*
> -			 * Note: kunmap_atomic requires return addr from
> -			 * kmap_atomic, not the page. See linux/highmem.h
> -			 */
> -			kunmap_atomic(des - offset);
> -		else
> -			kunmap(bo->page_obj[idx].page);
> +		kunmap_local(des);
>  	}
>  
>  	return 0;

