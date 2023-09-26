Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D57A7AE996
	for <lists+linux-media@lfdr.de>; Tue, 26 Sep 2023 11:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232180AbjIZJxF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Sep 2023 05:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbjIZJxD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Sep 2023 05:53:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C57C1B3
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 02:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695721929;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bBNHljbR1IZ+suP4yC/QEl8o8WGLPK7dKb4HbNmayf0=;
        b=c2OzHSNFhA2Ac36V2oSSx4JQI9YOfhBYlzh5pRh7smKJL1vWPQUiuCpz3UUZMCt75sdCDG
        zyrAyROeZbRCWn1HdGnO7J3qK5TlREVjG6TG9aEhjwbmA0bWZA30uc/o5YYE36P3/IUwOL
        Rpws5S0QstvfSj8Y+qJUSGy9gfr4frQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-iCyGhzTdOvCbmp9liHX8gA-1; Tue, 26 Sep 2023 05:52:08 -0400
X-MC-Unique: iCyGhzTdOvCbmp9liHX8gA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-531373ea109so6467614a12.3
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 02:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695721927; x=1696326727;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBNHljbR1IZ+suP4yC/QEl8o8WGLPK7dKb4HbNmayf0=;
        b=qCTCgjOIB1F5zjgKYy8rNvZmMa4MfPqF7+ub1jvnw++BNLppm1/Nt2gZdWPlmglKyk
         2PuLZlrJawGJa9EbkF1GtTjLXejDt+Iu0mbi2kj/bvEFjkTNlD0Qk0bvOgdWA0y1Tql3
         VhNXUHrWvoHGj0ouBoc5M4cTyjYkXAxUo0WFhKa9X6y+cLhjdYisat2Gwo1q4AjGD5qk
         +2azwUAbtHjY/9oMmNAQ9eAsCDwfO3F1uFyx7gAHwdkoSMLyYOePbQbDvX0EgVpHRUMB
         1tVJF4AfkwlG5CNSpbaF6PeJNkZUyi6RE4vj5KQVw6e5T3WAHS7IF77vmV1BVAnKQb6i
         LvWw==
X-Gm-Message-State: AOJu0Yx7YfLcihjVkh+D0LIuBqTRvPxaZqU9aMI3yj0WpW005yegq74R
        XdEQ5jgVE0MwEB3I9CL04IBjMYILumpL8ywejlhWerrawF1y/FFPH6iSOsoYt+YW5IDvBTMM00O
        QzofkD2Wbak7BFTmHcVGY2Iw=
X-Received: by 2002:a17:906:51d4:b0:9ae:3c09:8ce1 with SMTP id v20-20020a17090651d400b009ae3c098ce1mr8891590ejk.39.1695721927398;
        Tue, 26 Sep 2023 02:52:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHyXK+01/Y8FSqEVold6xdJXSlFAatnuw4ozHIv9bugTRtVVGl2IWxzcqUx9navLMCMy3/ng==
X-Received: by 2002:a17:906:51d4:b0:9ae:3c09:8ce1 with SMTP id v20-20020a17090651d400b009ae3c098ce1mr8891573ejk.39.1695721927037;
        Tue, 26 Sep 2023 02:52:07 -0700 (PDT)
Received: from [192.168.1.217] ([109.37.154.108])
        by smtp.gmail.com with ESMTPSA id bl19-20020a170906c25300b0099bc8db97bcsm7523074ejb.131.2023.09.26.02.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 02:52:06 -0700 (PDT)
Message-ID: <42b7bbb1-ac6c-c556-f127-b4dded224788@redhat.com>
Date:   Tue, 26 Sep 2023 11:52:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: atomisp: fix 'read beyond size of field'
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kate Hsuan <hpa@redhat.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <d102a389-af14-45fd-a304-d2458c06cca3@xs4all.nl>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d102a389-af14-45fd-a304-d2458c06cca3@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 9/26/23 11:27, Hans Verkuil wrote:
> If CONFIG_FORTIFY_SOURCE=y, then this warning is produced:
> 
> In file included from ./include/linux/string.h:254,
>                  from ./include/linux/bitmap.h:11,
>                  from ./include/linux/cpumask.h:12,
>                  from ./arch/x86/include/asm/cpumask.h:5,
>                  from ./arch/x86/include/asm/msr.h:11,
>                  from ./arch/x86/include/asm/processor.h:23,
>                  from ./arch/x86/include/asm/cpufeature.h:5,
>                  from ./arch/x86/include/asm/thread_info.h:53,
>                  from ./include/linux/thread_info.h:60,
>                  from ./arch/x86/include/asm/preempt.h:9,
>                  from ./include/linux/preempt.h:79,
>                  from ./include/linux/spinlock.h:56,
>                  from ./include/linux/mmzone.h:8,
>                  from ./include/linux/gfp.h:7,
>                  from ./include/linux/slab.h:16,
>                  from ./drivers/staging/media/atomisp//include/hmm/hmm.h:26,
>                  from drivers/staging/media/atomisp/pci/sh_css_params.c:26:
> In function ‘fortify_memcpy_chk’,
>     inlined from ‘sh_css_store_sp_group_to_ddr’ at drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
> ./include/linux/fortify-string.h:592:25: warning: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()?
> [-Wattribute-warning]
>   592 |                         __read_overflow2_field(q_size_field, size);
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The reason is that the memcpy copies two fields (each a u8), when the source
> pointer points to the first field. It's a bit unexpected, so just make this
> explicit.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> Hans, can you verify that it is indeed the intention of the original code
> to write both bytes?

Yes I believe so. I'm currently travelling so I cannot test this, but I think it should
be fine, see feel free to merge this and if it breaks things I'll get back to you once
I can actually run some tests.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> 
> Note that I think that the initial memcpy is equally dubious. I think that
> should be replaced by '*buf_ptr++ = ...' lines as well, rather than just
> copying the first three fields with a memcpy. If you want I can make a v2
> that does that.
> ---
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index 5667e855da76..232744973ab8 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -3733,8 +3733,8 @@ ia_css_ptr sh_css_store_sp_group_to_ddr(void)
>  	if (IS_ISP2401) {
>  		memcpy(buf_ptr, &sh_css_sp_group.config, 3);
>  		buf_ptr += 3;
> -		memcpy(buf_ptr, &sh_css_sp_group.config.enable_isys_event_queue, 2);
> -		buf_ptr += 2;
> +		*buf_ptr++ = sh_css_sp_group.config.enable_isys_event_queue;
> +		*buf_ptr++ = sh_css_sp_group.config.disable_cont_vf;
>  		memset(buf_ptr, 0, 3);
>  		buf_ptr += 3; /* Padding 3 bytes for struct sh_css_sp_config*/
>  	} else {
> 

