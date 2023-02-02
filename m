Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 718C5688914
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 22:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232563AbjBBVfg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 16:35:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjBBVfe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 16:35:34 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F19834B2
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 13:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675373684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eW5nnN/Ib32jdUWa/RWBvIQi/iNU6+BNj/uI00opUo8=;
        b=iNzAgqEC+CthukqPeys76v/w3b8ew9ljibVJnA+f40NYqmym/yqtpxRCXJFKL5u5u6cXyE
        73PowdQ2O8Z9cTWaawEKwNS8QIgxeChjGvM1V32N/uoaYm/am5wflyzm+fMEh/CEbFBgyX
        +ZQo5Pum1T3qc9OkuTYwthfY58Rs3Bs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-KC2x311FNMKweKX980V1xA-1; Thu, 02 Feb 2023 16:34:43 -0500
X-MC-Unique: KC2x311FNMKweKX980V1xA-1
Received: by mail-ej1-f71.google.com with SMTP id d14-20020a170906c20e00b00889f989d8deso2355837ejz.15
        for <linux-media@vger.kernel.org>; Thu, 02 Feb 2023 13:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eW5nnN/Ib32jdUWa/RWBvIQi/iNU6+BNj/uI00opUo8=;
        b=TgWRVgOgXZOZEgPL2Miz3O6BuBznKDL6GBIvVcE33TQuLbzQRBILL6yyIWTb/WSMEp
         oJ0FOnJybqy0TLcB77KqVnrwsti/zAQ/Z45mt9oME3aG5PQTEY2tFn7ZbPO0td+y2Mix
         ewR6Pl129xzZi+fniAOZhIvD5vidDldJknuL+lx7r7DyYHt8PRonjDdO0/qNgZ/je5iJ
         q885qkG2giMvwFhB7bPiGQXY0yb2OeqDFgm5uJOh1VSwrcXzer6ZVidYzLi8ylf3Gy5D
         tQGhVjEq5GU8dlYoWRfuR3oqfIZSkjc/JZuWs922T9yyseAbAnKHhG7uV3FJ/aSl1Rd+
         UV8w==
X-Gm-Message-State: AO0yUKU5mhV4m3nCx02CZy4qjLYFXw0nZayJv4xVIddQNwOalI1zC9iJ
        mO5AzxR15kY1tI17PyFlanFtkD8DuvNs7NoDA66QEwZcO6rd73vciwWdZb0OUJH1aUpw7VEfq1h
        WC16ddaiWv1eBB2ZyXE1zLnA=
X-Received: by 2002:a17:907:7211:b0:88d:ba89:184f with SMTP id dr17-20020a170907721100b0088dba89184fmr3931591ejc.32.1675373682498;
        Thu, 02 Feb 2023 13:34:42 -0800 (PST)
X-Google-Smtp-Source: AK7set/MueIrH2ulLtKu+jzCEAXRz6gYQ9ydSfs2I9fl85KH/t4CrjinYYkdksZb8pqi5m1jIbJsvw==
X-Received: by 2002:a17:907:7211:b0:88d:ba89:184f with SMTP id dr17-20020a170907721100b0088dba89184fmr3931584ejc.32.1675373682314;
        Thu, 02 Feb 2023 13:34:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z25-20020a1709064e1900b0088550a1ce6esm324922eju.222.2023.02.02.13.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 13:34:41 -0800 (PST)
Message-ID: <2b11d9f4-f32b-7214-3181-a49a8d190f0a@redhat.com>
Date:   Thu, 2 Feb 2023 22:34:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] media: atomisp: add I2C dependency
To:     Arnd Bergmann <arnd@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20230202210312.544277-1-arnd@kernel.org>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230202210312.544277-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

On 2/2/23 22:02, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Without CONFIG_I2C, atomisp fails to build because of a missing
> function declaration:
> 
> drivers/staging/media/atomisp/pci/atomisp_v4l2.c: In function 'atomisp_subdev_probe':
> drivers/staging/media/atomisp/pci/atomisp_v4l2.c:960:21: error: implicit declaration of function 'i2c_get_adapter'; did you mean 'i2c_get_adapdata'? [-Werror=implicit-function-declaration]
>   960 |                     i2c_get_adapter(subdevs->v4l2_subdev.i2c_adapter_id);
>       |                     ^~~~~~~~~~~~~~~
>       |                     i2c_get_adapdata
> 
> Ideally the driver should just move away from calling i2c_get_adapter
> as explained in a comment near the call. For now, just use a Kconfig
> dependency. Apparently configurations with I2C disabled are rare in
> practice as well as in randconfig builds because a lot of other
> drivers 'select' the subsystem.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Actually the i2c_get_adapter() call is gone in the atomisp pull-req
which I send to Mauro for 6.3, it is removed by this patch.

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/commit/?h=media-atomisp-6.3-1&id=4f205ce7a915ffa4ae0fb24f48714604d39baa29

So adding the I2C dependency is no longer necessary.

Regards,

Hans






> ---
>  drivers/staging/media/atomisp/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
> index c9bff98e5309..8b0de0b5b4a3 100644
> --- a/drivers/staging/media/atomisp/Kconfig
> +++ b/drivers/staging/media/atomisp/Kconfig
> @@ -13,6 +13,7 @@ config VIDEO_ATOMISP
>  	tristate "Intel Atom Image Signal Processor Driver"
>  	depends on VIDEO_DEV && INTEL_ATOMISP
>  	depends on PMIC_OPREGION
> +	depends on I2C
>  	select IOSF_MBI
>  	select VIDEOBUF2_VMALLOC
>  	select VIDEO_V4L2_SUBDEV_API

