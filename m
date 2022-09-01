Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 624705A920E
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 10:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234199AbiIAI0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 04:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232538AbiIAI0H (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 04:26:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9AADD9EB0
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 01:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662020764;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A09ae80YMwEtv8c2P0dV0w+SfIPFZiwExmKV//2uEBs=;
        b=WfxLG+6Z0TnPKlx4iwXkzDhBcxdAd6g8RWaHQgFdrnHOknCx9GhfZGbFGq3XADsbqU/NkH
        WKDE5HdflF42zwZQzn3cAMiIh0vXwZrwTj3v37yPXEX5Z4KEUxrjBtO5QCez5zkUwoMalb
        1fANChN8tOqyv5rG5wbRzYYRycM70YA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-158-sT85QHI4PIqjKqAANnQL_w-1; Thu, 01 Sep 2022 04:26:02 -0400
X-MC-Unique: sT85QHI4PIqjKqAANnQL_w-1
Received: by mail-ed1-f70.google.com with SMTP id s19-20020a056402521300b00448954f38c9so6702496edd.14
        for <linux-media@vger.kernel.org>; Thu, 01 Sep 2022 01:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=A09ae80YMwEtv8c2P0dV0w+SfIPFZiwExmKV//2uEBs=;
        b=NaVX2OKU/KktJL0tBrhQVo8jZG1vaAc9abciCFCOnHs1+jNDLSYGa6mJUrQPxY5jrE
         i0VonfcI1ScGmYjlowWqy3VEmC8bVgCr36CPgljwfUrkJmfuHriz6aFkrUuO4AIoJGhg
         BbkqeoFxheHDOzo2Vc8Cz6mDbZ7soXOHyLH3BWQSgfMZriOTniYH3dWQyRLG1LTZ0XyN
         lw/HP/imRLq6b3XNEvvf5MFrjs7Tp9xaHqeCVH2moMVLEY4srj4BQKngS+CrzTi9jnlv
         787m6Cqjmuw52EZyE6+yVpZLILND7oiDIi8saRP46z7dBVUV0ASf1C3FSk2h1zvH4lux
         f1wQ==
X-Gm-Message-State: ACgBeo1OKnOzqp25Xychrbe+dG5TUNFXm32AhK2WCYrvz/FfJLRDU2sC
        w27OYWFyIYEsTBMFnz6ouHhwb0zXFsVGZGzQsjaJ6Oqoi2eIEhZIh1BbbI1FMaXmlAr0VGQM/6f
        CbXNQEHHT38XahdSfhFWPuss=
X-Received: by 2002:a17:906:c14f:b0:741:8829:6a97 with SMTP id dp15-20020a170906c14f00b0074188296a97mr13300553ejc.232.1662020761711;
        Thu, 01 Sep 2022 01:26:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Fnz/LP8fNwC4/7RZT3pjlM3+Chrs0EMIh0lNE1sBrd+eKUL5Prpomwog2Dvkuhdn7LuCiNw==
X-Received: by 2002:a17:906:c14f:b0:741:8829:6a97 with SMTP id dp15-20020a170906c14f00b0074188296a97mr13300547ejc.232.1662020761553;
        Thu, 01 Sep 2022 01:26:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id g22-20020a056402091600b00447f74138d7sm947603edz.8.2022.09.01.01.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 01:26:01 -0700 (PDT)
Message-ID: <2c35e3ca-3fb4-d91e-38af-841050d58ccf@redhat.com>
Date:   Thu, 1 Sep 2022 10:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] media: atomisp: prevent integer overflow in
 sh_css_set_black_frame()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        kernel-janitors@vger.kernel.org
References: <YxBBCRnm3mmvaiuR@kili>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YxBBCRnm3mmvaiuR@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 9/1/22 07:20, Dan Carpenter wrote:
> The "height" and "width" values come from the user so the "height * width"
> multiplication can overflow.
> 
> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I'll also add this to my set of pending atomisp2 cleanup patches
so that the next time I test the atomisp2 with my local tree
this will also get tested.

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/pci/sh_css_params.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index 0e7c38b2bfe3..67915d76a87f 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -950,8 +950,8 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
>  		params->fpn_config.data = NULL;
>  	}
>  	if (!params->fpn_config.data) {
> -		params->fpn_config.data = kvmalloc(height * width *
> -						   sizeof(short), GFP_KERNEL);
> +		params->fpn_config.data = kvmalloc(array3_size(height, width, sizeof(short)),
> +						   GFP_KERNEL);
>  		if (!params->fpn_config.data) {
>  			IA_CSS_ERROR("out of memory");
>  			IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);

