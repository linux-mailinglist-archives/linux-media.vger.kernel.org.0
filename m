Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D57817DF4D4
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 15:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235261AbjKBOWJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 10:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbjKBOWI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 10:22:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9550BB7
        for <linux-media@vger.kernel.org>; Thu,  2 Nov 2023 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698934881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j+KMDmWsfkbK/uZawBiUpXpXzFBe4d7Moq6tBfbTgpA=;
        b=CQYoxWyzEwi8e1OJnrEH9a6ykEOM5bEdTc0KO1Z4TlXoOWV0l/W15BER3A7LZlnMEOCtF1
        bfDuYp6wQGO8hHf6oI0nYmI2ZaX6UrdYMn86KAUm67XBPqQW9y+i9M78Z5K628hi/VkQvD
        iimyzHjWiHBpzEiR8b4pJHlnunQd7Cs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-f6wMzFcYO1Or0bDwGPvSKQ-1; Thu, 02 Nov 2023 10:21:15 -0400
X-MC-Unique: f6wMzFcYO1Or0bDwGPvSKQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9d25d0788b8so68498966b.1
        for <linux-media@vger.kernel.org>; Thu, 02 Nov 2023 07:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698934870; x=1699539670;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+KMDmWsfkbK/uZawBiUpXpXzFBe4d7Moq6tBfbTgpA=;
        b=FWdvnHWBxTJ0QkL5xEoU571B/mK/bm0f8gaGri5UGCqOcURPutFoB5qAXoKlaaBiau
         yyzkXs/7urRI7Pn/FV/6JNKJSWAgiHPbv4slasOipFj6C/RcILvQwFPu8oGYThRmVeXh
         2nEJxf08fPU4IPqI4ddYNI7g6SYQYYQ1flVtdQHMYLYEGz87wpp64noEGPVrheOOeHQB
         6T47ckEiDUrdEdFO8IYcTpnvFnHbs9Ik0p19PjyInovMkVMzzT6qo7lyyXd8H+kkFHtR
         Y+otC/ZwHt2fzpjnnbHGRlJp6Sb7XgOM2kXuEuvbgUGYH7vw8R4qma4NSHy73rPHha46
         Xr/g==
X-Gm-Message-State: AOJu0YzI6mTzTQmKn0tUSajlZdBRgu6JGmrxGkeMW9YEKQL5QMhSed2J
        JQYVkf0HnWaoWVJqpS9k6eXwd8wjNOGrUhxXLMEeGPrP8wUOqrCn0h86znGf4wOEgDgNZp+Y2U7
        4tnUmUDHsRNrjrk/4sZVElbM=
X-Received: by 2002:a17:907:1c9e:b0:9b2:b768:3cfc with SMTP id nb30-20020a1709071c9e00b009b2b7683cfcmr4557255ejc.1.1698934870246;
        Thu, 02 Nov 2023 07:21:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuL5GcHeae3w9tW2SVQM2AAgpf86TfGQJ9jKryff95GMK7q5xVXO8r/JwYXojIp4O+vTWY1g==
X-Received: by 2002:a17:907:1c9e:b0:9b2:b768:3cfc with SMTP id nb30-20020a1709071c9e00b009b2b7683cfcmr4557227ejc.1.1698934869797;
        Thu, 02 Nov 2023 07:21:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bu6-20020a170906a14600b009829d2e892csm1225538ejb.15.2023.11.02.07.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 07:21:08 -0700 (PDT)
Message-ID: <b2aa6ccb-0a9a-449f-1341-fd71d5c545fd@redhat.com>
Date:   Thu, 2 Nov 2023 15:21:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/4] Remove redundant return value check
Content-Language: en-US, nl
To:     Alexandra Diupina <adiupina@astralinux.ru>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20231102141135.369-1-adiupina@astralinux.ru>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231102141135.369-1-adiupina@astralinux.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexandra,

On 11/2/23 15:11, Alexandra Diupina wrote:
> media_entity_pads_init() will not return 0 only if the
> 2nd parameter >= MEDIA_ENTITY_MAX_PADS (512), but 1 is
> passed, so checking the return value is redundant

Generally speaking functions which can fail should always be
error-checked even if their invocation today happen to be
such that they will not fail.

Either the invocation or the function itself my change
causing it to fail in the future. Which is why we want
to keep the error checks.

But maybe media_entity_pads_init() is special and
does not need to be error checked.

Sakari, Laurent do you have any opinion on this ?

> Found by Linux Verification Center (linuxtesting.org) with SVACE.

This feels like a false positive of the tool to me,
but lets wait and see what Sakari or Laurent have
to say.

Regards,

Hans



> 
> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c        | 4 +---
>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c       | 6 +-----
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c        | 2 --
>  drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c | 2 --
>  4 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index 9fa390fbc5f3..f10931a03285 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -840,9 +840,7 @@ static int gc2235_probe(struct i2c_client *client)
>  	dev->ctrl_handler.lock = &dev->input_lock;
>  	dev->sd.ctrl_handler = &dev->ctrl_handler;
>  
> -	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> -	if (ret)
> -		gc2235_remove(client);
> +	media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
>  
>  	return atomisp_register_i2c_module(&dev->sd, gcpdev, RAW_CAMERA);
>  
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> index 1c6643c442ef..b7a940fdbd0a 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> @@ -1581,11 +1581,7 @@ static int mt9m114_probe(struct i2c_client *client)
>  
>  	/* REVISIT: Do we need media controller? */
>  	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> -	if (ret) {
> -		mt9m114_remove(client);
> -		return ret;
> -	}
> -	return 0;
> +	return ret;
>  }
>  
>  static const struct acpi_device_id mt9m114_acpi_match[] = {
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> index 6a72691ed5b7..922774293bf4 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> @@ -993,8 +993,6 @@ static int ov2722_probe(struct i2c_client *client)
>  	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  
>  	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> -	if (ret)
> -		ov2722_remove(client);
>  
>  	return atomisp_register_i2c_module(&dev->sd, ovpdev, RAW_CAMERA);
>  
> diff --git a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
> index 460a4e34c55b..8d5b74fb5d9c 100644
> --- a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
> +++ b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
> @@ -1733,8 +1733,6 @@ static int ov5693_probe(struct i2c_client *client)
>  	dev->sd.ctrl_handler = &dev->ctrl_handler;
>  
>  	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> -	if (ret)
> -		ov5693_remove(client);
>  
>  	return ret;
>  out_free:

