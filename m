Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44251508695
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 13:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377897AbiDTLJz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 07:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377895AbiDTLJz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 07:09:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A752A28E01
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 04:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650452828;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UwOF3HOL5RSWCpIsMDkzBg+WBg3G3TFS0qjQ6oEuYGo=;
        b=V5KjpUwrrFUtna1aR9oGlipgpUews6pVZtX73SsBXR5FyQl9ndVuUaItDDoQNC14Cto9SG
        Cj8KSZmFc9PHl6dTNitZ48LTNy1EU9PnRdHMcs+diYaVDXBq2/4DSXirS8Rk4Tv0/RUUHr
        VIvJhvow01eRHIepjZDziTTfCkNILfc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-1m17nwlQMnmdWNvo7kgvng-1; Wed, 20 Apr 2022 07:07:07 -0400
X-MC-Unique: 1m17nwlQMnmdWNvo7kgvng-1
Received: by mail-ed1-f72.google.com with SMTP id t9-20020aa7d4c9000000b0041ff2e578dcso963787edr.16
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 04:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UwOF3HOL5RSWCpIsMDkzBg+WBg3G3TFS0qjQ6oEuYGo=;
        b=EJVcMZo4KUSGmAtlRAnntISpbJ/tlwm7dmNBbHx01UdxRcp735rA3+tfWbXwRSWJ9I
         kBsygvmuMv0LVriYCw8bc/LEqoNrgXpdnrvAw2NXE3tQoG+nIRxGauNc4mlPMMLvi6OX
         7WMw+mR0i9ZWY1Qso7Hg9vZDLB3PPNREpnJN4UoPol8Ugpwh8IHb7BE4SQJmAU/w8z2Q
         zv5CzpGpKCKCS4dTSS29/I/z+9bDtkhNObF8QL/efJMuls3Pcuv1Lt29h/CinLtpRGo8
         KINX38Hd2aQB88wEBqSSEvsh6zGPdmlYS0kterHTwfeMsrpCZn4XjLDDdMv0wUX8Etgc
         uUqA==
X-Gm-Message-State: AOAM533irWja/l8lkJgxAhIHdbDJWMhAjqBv6vTjmIXrTs8v3zRFlaO1
        iWrKgp12MWfYKjiuXqAV4NOV/N17RcqMZbKrwCNy1DIUVMpk8Qfo9BD+eH4PLnWGzg8zZlPaJRj
        dwkeuivg9Szt85NtNOI5ZdxI=
X-Received: by 2002:a05:6402:608:b0:41e:ce5:f02d with SMTP id n8-20020a056402060800b0041e0ce5f02dmr22940026edv.104.1650452826546;
        Wed, 20 Apr 2022 04:07:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKbC85ZGMPknAiJCsVTUPZVUdQiALgx50L9YEQctGci04sT/7JOLUTRhYvUOLdSGyH3zdyLg==
X-Received: by 2002:a05:6402:608:b0:41e:ce5:f02d with SMTP id n8-20020a056402060800b0041e0ce5f02dmr22940009edv.104.1650452826359;
        Wed, 20 Apr 2022 04:07:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id cw23-20020a056402229700b00421c1574f01sm9117548edb.9.2022.04.20.04.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 04:07:05 -0700 (PDT)
Message-ID: <0b04ad1a-e442-1728-ef2c-bab386a4c64c@redhat.com>
Date:   Wed, 20 Apr 2022 13:07:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] staging: media: atomisp: Use kmap_local_page() in
 hmm_set()
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
References: <20220413212210.18494-1-fmdefrancesco@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220413212210.18494-1-fmdefrancesco@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 4/13/22 23:22, Fabio M. De Francesco wrote:
> The use of kmap() is being deprecated in favor of kmap_local_page()
> where it is feasible. In file pci/hmm/hmm.c, function hmm_set() calls
> kmap() / kunmap() where kmap_local_page() can instead do the mapping.
> 
> With kmap_local_page(), the mapping is per thread, CPU local and not
> globally visible. Therefore, hmm_set()() is a function where the use
> of kmap_local_page() in place of kmap() is correctly suited.
> 
> Convert the calls of kmap() / kunmap() to kmap_local_page() /
> kunmap_local().
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>


I've successfully tested this on both the front and back cams
of a chuwi hi8 tablet:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/pci/hmm/hmm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> index 6394385b6637..46ac082cd3f1 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> @@ -563,7 +563,7 @@ int hmm_set(ia_css_ptr virt, int c, unsigned int bytes)
>  		idx = (virt - bo->start) >> PAGE_SHIFT;
>  		offset = (virt - bo->start) - (idx << PAGE_SHIFT);
>  
> -		des = (char *)kmap(bo->page_obj[idx].page) + offset;
> +		des = (char *)kmap_local_page(bo->page_obj[idx].page) + offset;
>  
>  		if ((bytes + offset) >= PAGE_SIZE) {
>  			len = PAGE_SIZE - offset;
> @@ -579,7 +579,7 @@ int hmm_set(ia_css_ptr virt, int c, unsigned int bytes)
>  
>  		clflush_cache_range(des, len);
>  
> -		kunmap(bo->page_obj[idx].page);
> +		kunmap_local(des);
>  	}
>  
>  	return 0;

