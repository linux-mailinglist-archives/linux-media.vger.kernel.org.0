Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93C1E70FB56
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 18:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238160AbjEXQGS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 12:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234924AbjEXQGF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 12:06:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D9FE59
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 09:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684944267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xhe2zg9S72fEHvC2EH6+eT9OOyHrHKVGJvX2QpCPrEU=;
        b=NuANqBoVdBJPd0crymFJCKsCvu0uvoy294gQFW8mIhNuMFYe/903GU+Lazgmq0UCXid6oW
        9nz/jNp57MEGaPNmmCg2LQir0lC3Qe1PmS9BCfV9RFi9KAoyTcFiX2QdfD25wSA+xk2y+/
        OabrrFKHbxAT6UQoAwMyHC/a8CzEk1g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-PD9t_QF5PzeRB22GonYIEg-1; Wed, 24 May 2023 12:04:24 -0400
X-MC-Unique: PD9t_QF5PzeRB22GonYIEg-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5142da822cbso562477a12.2
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 09:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684944263; x=1687536263;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhe2zg9S72fEHvC2EH6+eT9OOyHrHKVGJvX2QpCPrEU=;
        b=MvLsIjONdJI1i/ThrkuG5S5s1IPwg4bN8ih1ZPzxCNFWInVSE+MgorkivXAWtL7w7c
         zx9xUJTsdI0l8nm4XnxHiWT27ZObwI6tZ5Lyauy5Y7B2COQFG1bjvquKjsKXIYu3IZUC
         4XrlhGVH9i2nbBNevrkSk6yGqsDgYAtsayp1UfflokFGnAIvc210q1rPaQ82Du1lYmAl
         qY5nxnikV7O+EQJfxCDzWqDJfHhUgLGf64PQZyF1Y59pzhTnivm7gACxmwCYqcHAoAzf
         BXXstEpuO19piNrPj+FbuvcC6QOgoYneovGErBdTZF6AyCNTRGXe6VPT7hghhOdVOdn5
         uVNg==
X-Gm-Message-State: AC+VfDyowYkLcUKIDkJbtOnj9W/+2fXHOB/ZvKZvBCRa3JMmot3xfsgb
        6IEHKvCTOnNPwKL0b955B7QM0h7y/kxkNOt6ym/mnP9bHDYtPe2WW9q7B2RKVF04IVyO1JYh3kg
        dJWyOC/WZjIxCIgxDtqf+zpI=
X-Received: by 2002:a05:6402:394:b0:510:e790:4911 with SMTP id o20-20020a056402039400b00510e7904911mr2330220edv.4.1684944263089;
        Wed, 24 May 2023 09:04:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7JkTObyYlsy6R4dPeXYn50AbNpfWp+MTwYzmgXGw/uS/gH3BjPi30J4VDOfOjmtmB0iR/5dw==
X-Received: by 2002:a05:6402:394:b0:510:e790:4911 with SMTP id o20-20020a056402039400b00510e7904911mr2330206edv.4.1684944262720;
        Wed, 24 May 2023 09:04:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f1-20020a50ee81000000b0050bc6c04a66sm71771edr.40.2023.05.24.09.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 09:04:21 -0700 (PDT)
Message-ID: <301a968c-77ef-22f3-8fc0-6be9a5839c69@redhat.com>
Date:   Wed, 24 May 2023 18:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/8] staging: media: atomisp: initialize settings to 0
Content-Language: en-US, nl
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
References: <20230524121150.435736-1-hverkuil-cisco@xs4all.nl>
 <20230524121150.435736-2-hverkuil-cisco@xs4all.nl>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230524121150.435736-2-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 5/24/23 14:11, Hans Verkuil wrote:
> Fix a compiler warning:
> 
> drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c:1525:13: warning: 'settings' may be used uninitialized [-Wmaybe-uninitialized]
> 
> The 'settings' variable is actually always initialized, but the
> compiler isn't quite able to figure that out. Just initialize it
> to 0 to avoid this warning.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Hans de Goede <hdegoede@redhat.com>

Thank you for these patches. I have merged this one and 8/8
into:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

I'm currently doing a lot of work on the atomisp code,
so merging them through my atomisp branch is best to
avoid conflicts (I already had to resolve a conflict).

So please refrain from merging 1/8 + 8/8 to some
other linux-media tree/branch.

Regards,

Hans





> ---
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index c718a74ea70a..48ba0d0bcfe5 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -1522,7 +1522,7 @@ static int v4l2_acpi_handle_gpio_res(struct acpi_resource *ares, void *_data)
>  	const char *name;
>  	bool active_low;
>  	unsigned int i;
> -	u32 settings;
> +	u32 settings = 0;
>  	u8 pin;
>  
>  	if (!acpi_gpio_get_io_resource(ares, &agpio))

