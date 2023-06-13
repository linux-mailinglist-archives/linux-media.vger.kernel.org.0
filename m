Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D799672E905
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 19:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236260AbjFMRIz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 13:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236055AbjFMRIx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 13:08:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 532F519BC
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 10:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686676090;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o1Iyc9cdYVvIb6NyTjslxIJeKIo+XPmWA23o9WNhmTo=;
        b=V/6b0dEGkbEbUU34QcgDPyxS+IT67XPMENeowtNftAbIJWveukeVU2iCO0BYa8jngmlvai
        6IwNmRP1MHx5uoMIQe+mcULO5XwVlOltr7ct1hV9An2jvKFo+fdHX32j6nJRXTOXnXUj/B
        /c/oB4zlNe6dGLmDbBLqw7QcYbqVNV4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-4CCeCBX4MkyfVwxUERTAyQ-1; Tue, 13 Jun 2023 13:08:05 -0400
X-MC-Unique: 4CCeCBX4MkyfVwxUERTAyQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9749b806f81so514327266b.1
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 10:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686676084; x=1689268084;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1Iyc9cdYVvIb6NyTjslxIJeKIo+XPmWA23o9WNhmTo=;
        b=bJaW2py11EiznlM3eYrKpqFvrqVWgvY7bXkiAjgEZZyG5++ggxgYoOVk1AaeqvzcD3
         Y/M3aGj79UNxobf17c7ZFjVc+jwe8760BbH3Tq+z+1zvswX+tFd8jzgpo4BjgIyJM8By
         7OWPnMXvdbqtCGALt5u5s8RePGf688KyWN1KqpFtny4znKLVMwTg6UECPEHu6UfXF+tx
         Rpsdoh2tY1pBKPtG/+jVWR2a8+yqUrAEkBVE1wvjJ4pge3bH6bt7SUoafmzMcpFeOUYo
         vu4UHmvnohk0eApP+ihkjElfAOe70XTQKS6U9c7eP60ZbZ91UhgqLeTfNTg1IJhasgDg
         PVxw==
X-Gm-Message-State: AC+VfDzPWGhnlMZDnIQCpZ6t5si7TAqz/XW7l2Bz/3/hs//j3OGjXI4c
        dmHhwswExSsT2ZVdPsn+rIm1cC2wRdOIqI7ru50GS51LIREV0bKZ0C6u+fiRRdWKd7+iTyHNOsN
        nxqnQ9B8mjtBXGQHW/TzE9dQ=
X-Received: by 2002:a17:906:7949:b0:978:9b09:ccac with SMTP id l9-20020a170906794900b009789b09ccacmr12705589ejo.20.1686676084360;
        Tue, 13 Jun 2023 10:08:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ORpL2+WIj/no7MgBpQ8sItHo3oHQbruiiHdP2x2KjoWzVR/B8o2tOHXyYh+xeciUld3O6Zw==
X-Received: by 2002:a17:906:7949:b0:978:9b09:ccac with SMTP id l9-20020a170906794900b009789b09ccacmr12705570ejo.20.1686676084063;
        Tue, 13 Jun 2023 10:08:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q2-20020a170906360200b0096a27dbb5b2sm6787203ejb.209.2023.06.13.10.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 10:08:03 -0700 (PDT)
Message-ID: <a0fd7115-6fba-940d-b6fd-aad6353a9e55@redhat.com>
Date:   Tue, 13 Jun 2023 19:08:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/1] media: staging: atomisp: select V4L2_FWNODE
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20230613165109.111837-1-sakari.ailus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230613165109.111837-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/13/23 18:51, Sakari Ailus wrote:
> Select V4L2_FWNODE as the driver depends on it.
> 
> Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Fixes: aa31f6514047 ("media: atomisp: allow building the driver again")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Mauro this is a build fix for the recent atomisp pull-req
for 6.5, can you merge this please.

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
> index c9bff98e5309a..e9b168ba97bf1 100644
> --- a/drivers/staging/media/atomisp/Kconfig
> +++ b/drivers/staging/media/atomisp/Kconfig
> @@ -13,6 +13,7 @@ config VIDEO_ATOMISP
>  	tristate "Intel Atom Image Signal Processor Driver"
>  	depends on VIDEO_DEV && INTEL_ATOMISP
>  	depends on PMIC_OPREGION
> +	select V4L2_FWNODE
>  	select IOSF_MBI
>  	select VIDEOBUF2_VMALLOC
>  	select VIDEO_V4L2_SUBDEV_API

