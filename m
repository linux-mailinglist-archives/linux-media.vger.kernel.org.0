Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60B7A767E54
	for <lists+linux-media@lfdr.de>; Sat, 29 Jul 2023 12:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjG2KwN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jul 2023 06:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbjG2KwM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jul 2023 06:52:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57B6D1
        for <linux-media@vger.kernel.org>; Sat, 29 Jul 2023 03:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690627890;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Mugfyrqj8+j27jFc5GqJiBeqKz/F7gv5bWjybjuUy+A=;
        b=WbgLTtzTVwRTNrJCJk5cLFEzPS6xJr7AzVDP0zgtwbOz1Sm8+T1TxqK74qvI3l3PSPm++Y
        Yzsjb+lj42bJiWmEUP0pGtVLEUSv6kud0oMf7mBz0ckN+9wfH4kWsdeK75VCANhSittrNy
        tk2EYGTTDKyBuhKUCRAnV2XIy38KOE0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-O15ljrAPPYmhgjxePpBCWw-1; Sat, 29 Jul 2023 06:51:28 -0400
X-MC-Unique: O15ljrAPPYmhgjxePpBCWw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-993d631393fso216557766b.0
        for <linux-media@vger.kernel.org>; Sat, 29 Jul 2023 03:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690627886; x=1691232686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mugfyrqj8+j27jFc5GqJiBeqKz/F7gv5bWjybjuUy+A=;
        b=ScY3A074NmsbqOrgJdu9Qr75y3V9wS4wi0LUTrpo8vwP5BzCpsOo8za6fQi+8oSc2X
         IK9Jr064ohu7Pr3WJbTOEx6sLCus6WKSC1KVVWhiO5dFl3nbGoofbaCUVxjJ8Xu/w84Y
         U50nioJwmGARDZpqETaklwEe22DYOo5DI/aHqBN8s6vWgxOK9iiSGzZ3phXewByCvrrv
         PQ6mYNj1wIJTIN+26Aq6OOCcENnCGUSeYiNoALK7uSrMQ0yIuC4T52xZEuugxxXhTyot
         +JZnVr9cef+EAIm+nJMpPprAQDL4veMoTiZlhcXbaUbsV2IGH64Y8iRbN6WALE6ytjjN
         tIPA==
X-Gm-Message-State: ABy/qLaMILRy52RqLdAQk3akn7mBQO8AH179pE+H1etq+y6w3AQPCkiu
        97UIXoi1i39tkanOrWidcrtkaNsJVY6KZhe3ZkWUz40PfgKstXSdkZq7B27gW7moa4i62f9U10/
        spqZvstsvxEhG7z79NZJMgVT0cbYvpfA=
X-Received: by 2002:a17:906:3008:b0:993:d53b:9805 with SMTP id 8-20020a170906300800b00993d53b9805mr1759767ejz.11.1690627886756;
        Sat, 29 Jul 2023 03:51:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGeHuQpRPaqx7n+Aco/ZG2r6WM40oEbOT3FwrAXzz8ZPB3337x7lZlb0gXSUnrCAEhpe9hlwg==
X-Received: by 2002:a17:906:3008:b0:993:d53b:9805 with SMTP id 8-20020a170906300800b00993d53b9805mr1759756ejz.11.1690627886401;
        Sat, 29 Jul 2023 03:51:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k13-20020a170906970d00b0098d2261d189sm3221979ejx.19.2023.07.29.03.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jul 2023 03:51:25 -0700 (PDT)
Message-ID: <c78392fc-4e97-0f42-0533-40ea4f00d01c@redhat.com>
Date:   Sat, 29 Jul 2023 12:51:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] media: Kconfig: imx290: Correct CCI dependency
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20230729104050.1187715-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230729104050.1187715-1-sakari.ailus@linux.intel.com>
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

On 7/29/23 12:40, Sakari Ailus wrote:
> The Kconfig parts of the original patch converting the IMX290 to use V4L2
> CCI was mis-merged. Correct this.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307271517.dPa1bTSi-lkp@intel.com/
> Fixes: be02a09c84ad ("media: imx290: Convert to new CCI register access helpers")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, the series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans

> ---
>  drivers/media/i2c/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 24cbf35c6fe1..f3453a5da970 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -125,6 +125,7 @@ config VIDEO_IMX274
>  config VIDEO_IMX290
>  	tristate "Sony IMX290 sensor support"
>  	select REGMAP_I2C
> +	select V4L2_CCI_I2C
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX290 camera sensor.
> @@ -934,7 +935,6 @@ config VIDEO_ADV748X
>  	select VIDEO_V4L2_SUBDEV_API
>  	select REGMAP_I2C
>  	select V4L2_FWNODE
> -	select V4L2_CCI_I2C
>  	help
>  	  V4L2 subdevice driver for the Analog Devices
>  	  ADV7481 and ADV7482 HDMI/Analog video decoders.

