Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12DF955F934
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 09:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbiF2HhR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 03:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232077AbiF2HhQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 03:37:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 574CE3614F
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 00:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656488233;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1h0smKgkaQYyMckjg1gEO+92UXCJgyf7f6YfzsCAFg4=;
        b=A9r6z16eLePDP7bGnj4DQvo7y3G6bSPDfVUon8h8UU1fWVxsHhqlS7X5ho2Kg8bsJ94eAB
        ZpiagtHmU1cR+Mbl+pQ9uTE8c3wDDfX5ZBou6CQVNZ5jJ68lAXx9uYydmYJ32oQ+BT7P8w
        R0bVtv950eOUgOiUhg0nh9TLSJUseeI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-_EN8l8gfME-s4-VqNIAgFg-1; Wed, 29 Jun 2022 03:37:12 -0400
X-MC-Unique: _EN8l8gfME-s4-VqNIAgFg-1
Received: by mail-wm1-f70.google.com with SMTP id 6-20020a1c0206000000b003a02cd754d1so6233468wmc.9
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 00:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1h0smKgkaQYyMckjg1gEO+92UXCJgyf7f6YfzsCAFg4=;
        b=qMcw9n3smca+soQzqeZaQuVXIV+4hhaeKo4/KeUiuukRnuZZXDMACaqZcG8aM6mhpo
         HpxYO7qkV3CnxMqYnFmVC3TnslUkA2U7Z3Cwl40eG/3YeiC5TXM/MaFFrhYLupCtLE6K
         qgaPyDJMUzauHuqvFH4mJXQSYeC1BQexM/8wsUW/O2tTmqwBwtEZ2k6x0qv6VoTzxXu5
         lgJyZUcSPr/TEDHkxR5iTh5tIVMb4gZTXgZD0IzBg2osJN1hYN7/7KnVFssqGtw3fqVg
         4Vsc+5SFdethyhAWO1E0/39pLjdWYUU3v173po6wleIh0o3IJScF3Vj0T9CnordFGV46
         O5oQ==
X-Gm-Message-State: AJIora9BSw0nUjK4ZrpIcPuMynzQ9eUHCfghijjk6YbHWOfZTPlkDukx
        xexHokhclaeaUlSwjhKx0f4R+l6swnxeY1gk7D2hCSLbJbMjt0xZZiMVg1HXkHuNS7i+p8HqVoo
        V71AyYiUg2pkZFk1x3kpx674=
X-Received: by 2002:a05:6000:1448:b0:21b:b7db:c40b with SMTP id v8-20020a056000144800b0021bb7dbc40bmr1650307wrx.279.1656488231149;
        Wed, 29 Jun 2022 00:37:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vfq7mqFRSJqFJPQOP6rs25Ch1nA7fBeueZwuaRaLaWENw0ay54yTOP4QHXmGLo1NEA4L9c5g==
X-Received: by 2002:a05:6000:1448:b0:21b:b7db:c40b with SMTP id v8-20020a056000144800b0021bb7dbc40bmr1650238wrx.279.1656488230741;
        Wed, 29 Jun 2022 00:37:10 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id j10-20020a5d448a000000b0021b8c99860asm15832366wrq.115.2022.06.29.00.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 00:37:10 -0700 (PDT)
Message-ID: <7654a74e-a410-a8a5-c228-d006dbbc200f@redhat.com>
Date:   Wed, 29 Jun 2022 09:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     linux-fbdev@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
        linux-staging@lists.linux.dev, kasan-dev@googlegroups.com,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
        acpi4asus-user@lists.sourceforge.net, linux-gpio@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        openipmi-developer@lists.sourceforge.net,
        linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Support Opensource <support.opensource@diasemi.com>,
        netdev@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-crypto@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        patches@opensource.cirrus.com, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <60cc6796236f23c028a9ae76dbe00d1917df82a5.camel@codeconstruct.com.au>
 <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/29/22 09:23, Uwe Kleine-König wrote:
> Hello,
> 
> [I dropped nearly all individuals from the Cc: list because various
> bounces reported to be unhappy about the long (logical) line.]
>

Yes, it also bounced for me when I tried to reply earlier today.

> diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> index 1e0fcec7be47..ddfa0bb5d9c9 100644
> --- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
> +++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> @@ -39,13 +39,11 @@ static int ssd130x_i2c_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int ssd130x_i2c_remove(struct i2c_client *client)
> +static void ssd130x_i2c_remove(struct i2c_client *client)
>  {
>  	struct ssd130x_device *ssd130x = i2c_get_clientdata(client);
>  
>  	ssd130x_remove(ssd130x);
> -
> -	return 0;
>  }
>  
>  static void ssd130x_i2c_shutdown(struct i2c_client *client)

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com> 
-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

