Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9543A76E8F1
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 14:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234447AbjHCM7Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 08:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234036AbjHCM7W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 08:59:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65ABD1712
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 05:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691067519;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9U/IhEsUUY4Msc4MNKaWswsQN1OF5D0GQQcBI/ZvLxU=;
        b=CBXIE3g0LOzRTUpC1GIqR4JiX1ID2USHaaaCbV9x2dW7wCdMq6oF7R/l18cWNEnN04tMK5
        1SV25tXJQSu1/rpQNhNUvb4KEbq2yTii9Nu9wLZO8DomgmRVA6DuU8aA0+8SeUssNLS0+G
        vi+A9mk2Z5i0F3fEkYqzG/BtajuClOw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-uQ7MrRvgP0Gu1rp7N09PAA-1; Thu, 03 Aug 2023 08:58:38 -0400
X-MC-Unique: uQ7MrRvgP0Gu1rp7N09PAA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94a355c9028so102628866b.3
        for <linux-media@vger.kernel.org>; Thu, 03 Aug 2023 05:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691067517; x=1691672317;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9U/IhEsUUY4Msc4MNKaWswsQN1OF5D0GQQcBI/ZvLxU=;
        b=Eno+/ecqfKXIDCSoNEGkZHq/SGSQWsCs/AsGXQtTp/QkpsKxu6nURLE9i8/F/1hKHW
         OZDF/T0cZ7UkaDjNOM7BADgLhfVSDEYkYm0MGhtUKpHozEP5+4sNZHo+eGc5c+SDIIAR
         hLWhljz8hM7veCkWDctJmzui9ESwig6WGNsIeYxI7VnT+gqugjEDbhOvSxrYe96/kjea
         bzczDABPWyPsPrUF6jYCNhrL3E7pPMCNopjUCHWMr5Zzb3kq+vC8y5yE/gVQ0UMJ8ZaR
         MtuPzdXUyYEIdxNKjTKIZHnKWlloHNKt7+n4y6jCBk0qHn+qmHnDeE3EhiLrtk9aMhc5
         7ZHA==
X-Gm-Message-State: ABy/qLY/F7zASgOYwCUffZ0OLzucGWEnZcxO6Hu7Lt4kFqzjSwzdsxl7
        HXhpf5Xe+G+MK6mV+r0OnlWuPNooGDHN9TG3a0t1ilZfIjKtA70wbIDhQGBaB3dr36ZC53prL6l
        aG5H/b2LbDkU2XwF9or2f41A=
X-Received: by 2002:a17:906:8466:b0:994:539d:f97f with SMTP id hx6-20020a170906846600b00994539df97fmr7207495ejc.37.1691067517351;
        Thu, 03 Aug 2023 05:58:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGiN4Vx/5rZKlMm7iqxOjINdhslINbKCTi58uBVxd++wzw+f34s3PpBZMIpSKFz8Tr8Mp0pNQ==
X-Received: by 2002:a17:906:8466:b0:994:539d:f97f with SMTP id hx6-20020a170906846600b00994539df97fmr7207480ejc.37.1691067517079;
        Thu, 03 Aug 2023 05:58:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j25-20020a170906255900b0099b4d86fbccsm10629456ejb.141.2023.08.03.05.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 05:58:36 -0700 (PDT)
Message-ID: <adeeeab5-04c5-e142-4495-c35d7ff53731@redhat.com>
Date:   Thu, 3 Aug 2023 14:58:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 02/32] media: ov2680: Fix ov2680_bayer_order()
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230803093348.15679-1-hdegoede@redhat.com>
 <20230803093348.15679-3-hdegoede@redhat.com>
 <ZMuiAde+4OSlEEVz@kekkonen.localdomain>
 <ZMujE3Od0lzvuCml@kekkonen.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZMujE3Od0lzvuCml@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 8/3/23 14:52, Sakari Ailus wrote:
> On Thu, Aug 03, 2023 at 12:48:01PM +0000, Sakari Ailus wrote:
>> Hi Hans,
>>
>> On Thu, Aug 03, 2023 at 11:33:17AM +0200, Hans de Goede wrote:
>>> The index into ov2680_hv_flip_bayer_order[] should be 0-3, but
>>> ov2680_bayer_order() was using 0 + BIT(2) + (BIT(2) << 1) as
>>> max index, while the intention was to use: 0 + 1 + 2 as max index.
>>>
>>> Fix the index calculation in ov2680_bayer_order(), while at it
>>> also just use the ctrl values rather then reading them back using
>>> a slow i2c-read transaction.
>>>
>>> This also allows making the function void, since there now are
>>> no more i2c-reads to error check.
>>>
>>> Note the check for the ctrls being NULL is there to allow
>>> adding an ov2680_fill_format() helper later, which will call
>>> ov2680_set_bayer_order() during probe() before the ctrls are created.
>>>
>>> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
>>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>>> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>
>> This doesn't seem to compile:
>>
>>> /home/jenkins/linux/drivers/media/i2c/ov2680.c: In function                   
>> 'ov2680_vflip_disable':                                                         
>>> /home/jenkins/linux/drivers/media/i2c/ov2680.c:351:9: error: implicit         
>> declaration of function 'ov2680_bayer_order'; did you mean                      
>> 'ov2680_set_bayer_order'? [-Werror=implicit-function-declaration]               
>>>   351 |  return ov2680_bayer_order(sensor);                                   
>>>       |         ^~~~~~~~~~~~~~~~~~                                            
>>>       |         ov2680_set_bayer_order                                        
>>> cc1: some warnings being treated as errors                                    
>>
>> I guess you missed converting some calls?
> 
> Actually the fix was trivial and the code is removed in the next patch
> nonetheless. The change I made here was:

Yes the below changes are correct and I'm pretty sure I had that in there
at one point in time (I did compile test every patch for v2 or v3 IIRC).

I guess this somehow got messed up during a rebase, thank you for
fixing this.

Regards,

Hans




> 
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 621144f16fdc..60c4e575aa86 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -348,7 +348,8 @@ static int ov2680_vflip_disable(struct ov2680_dev *sensor)
>  	if (ret < 0)
>  		return ret;
>  
> -	return ov2680_bayer_order(sensor);
> +	ov2680_set_bayer_order(sensor);
> +	return 0;
>  }
>  
>  static int ov2680_hflip_enable(struct ov2680_dev *sensor)
> @@ -359,7 +360,8 @@ static int ov2680_hflip_enable(struct ov2680_dev *sensor)
>  	if (ret < 0)
>  		return ret;
>  
> -	return ov2680_bayer_order(sensor);
> +	ov2680_set_bayer_order(sensor);
> +	return 0;
>  }
>  
>  static int ov2680_hflip_disable(struct ov2680_dev *sensor)
> 

