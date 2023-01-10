Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C488663EE4
	for <lists+linux-media@lfdr.de>; Tue, 10 Jan 2023 12:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbjAJLEF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Jan 2023 06:04:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232892AbjAJLD0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Jan 2023 06:03:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6166212D30
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 03:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673348560;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lTWV3iMaD81pwfEJZyicf42Tlx7DhOJiIaHvcmnaLWs=;
        b=YKvAp6dAtp+wGprWsgX3XDeW9NXOu++ZIYXsF7qSz04CfjmUQ08i13Ram7OAIsIyRHA7DD
        ZW0EVqd81cbdf0bIYhUzUyA1A2ClZeU6ho6Rwc4a3vk0ZiBvEmi2nPiyB986HeVJ9xmbFB
        dBePuteX8dqSN5cT6ErkWYQ9hzJDhqc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-167-bSPo1Bz_MSOQ6ZoZVB2mRg-1; Tue, 10 Jan 2023 06:02:39 -0500
X-MC-Unique: bSPo1Bz_MSOQ6ZoZVB2mRg-1
Received: by mail-ej1-f71.google.com with SMTP id oz11-20020a1709077d8b00b007c0dd8018b6so7517884ejc.17
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 03:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lTWV3iMaD81pwfEJZyicf42Tlx7DhOJiIaHvcmnaLWs=;
        b=bFNv7vl718IS63ioWxXf3lnpt6LiqKqPQZUGP3H3U+sMOXe43jhoNKltnRN89q9Gb0
         0oZrPlA08qYdb9lbPRYz0tcrWJ0tkrfhCPxpV8xc88xD8Pks7BMWuHNx1z0iwnIlscfV
         +tc4cf5qqxMPzodh+21uD667TL3LODpIN1tUQJADRqg8esayBz199YqhrdEiJamdAksb
         xjBuvXid6+rJ4ZT3kpvKnPsFU/dZJAe+lSYw9gArdo85wxA9RgGZPZqUAN6kFxKXxYd7
         RGVY2YDXFy8MwEFK9F1AMTlt5RbbDstoS2iVOgJpr2zOtrKgko9aSwMaKmhdDFOHpWXv
         eeSQ==
X-Gm-Message-State: AFqh2kqc2ETRL1kV3EXorDjp8ZIdBrKXfK7tUkyKKnTObXCR2nlaHh+F
        DN35nNRK2JqbUg7cLS1gYfOVWVf25X5HcQZdaMJVAubFN2SWMwjqVa+bqLWqyBbe1Vs0xWDxqOH
        wC/nkyPZFiQdiq+DoI9JkYT4=
X-Received: by 2002:a17:906:1410:b0:7bb:7d69:da90 with SMTP id p16-20020a170906141000b007bb7d69da90mr54055975ejc.31.1673348558235;
        Tue, 10 Jan 2023 03:02:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvzRd5VbzqlkNxSrrkP817SlZx0vErAVSGXRAmaSrLX9FRNypwoAhZuApyAsPCWEz5B2tK2Cw==
X-Received: by 2002:a17:906:1410:b0:7bb:7d69:da90 with SMTP id p16-20020a170906141000b007bb7d69da90mr54055959ejc.31.1673348558066;
        Tue, 10 Jan 2023 03:02:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e15-20020a056402104f00b004918b6b5e30sm4712397edu.15.2023.01.10.03.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 03:02:37 -0800 (PST)
Message-ID: <39c80c05-3fac-6513-c941-7ae91959c88e@redhat.com>
Date:   Tue, 10 Jan 2023 12:02:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] media: atomisp: fix videobuf2 Kconfig depenendency
Content-Language: en-US, nl
To:     Arnd Bergmann <arnd@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230104082212.3770415-1-arnd@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230104082212.3770415-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 1/4/23 09:21, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The recent conversion missed the Kconfig bit, so it can now
> end up in a link error on randconfig builds:
> 
> ld.lld: error: undefined symbol: vb2_vmalloc_memops
>>>> referenced by atomisp_fops.c
>>>>               drivers/staging/media/atomisp/pci/atomisp_fops.o:(atomisp_open) in archive vmlinux.a
> 
> Fixes: cb48ae89be3b ("media: atomisp: Convert to videobuf2")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Mauro, can you pick this up and send it to Linus as a 6.1 fix?

Regards,

Hans





> ---
>  drivers/staging/media/atomisp/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
> index 2c8d7fdcc5f7..c9bff98e5309 100644
> --- a/drivers/staging/media/atomisp/Kconfig
> +++ b/drivers/staging/media/atomisp/Kconfig
> @@ -14,7 +14,7 @@ config VIDEO_ATOMISP
>  	depends on VIDEO_DEV && INTEL_ATOMISP
>  	depends on PMIC_OPREGION
>  	select IOSF_MBI
> -	select VIDEOBUF_VMALLOC
> +	select VIDEOBUF2_VMALLOC
>  	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  Say Y here if your platform supports Intel Atom SoC

