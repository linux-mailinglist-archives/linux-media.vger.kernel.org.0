Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E207E64EE1A
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 16:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbiLPPrI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 10:47:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbiLPPrG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 10:47:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C55156D75
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 07:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671205581;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9miN79vuneG4+xiAXBKAhjQmKbcytEgoN1Q0VxUiPr0=;
        b=VeOJ2TdaftxTqRXvPDC7/znNZ8PBG3PyAmzFaFgRaIj1yzI7NrHqNPpZAdzoi5AEp9REhr
        HdO1m4FqbWUYmvK1YaJq8gNsV7Nr+PsG14TUC8cvifU2QDrnTCExEsaikYZIrda9OMDXqu
        z0C4wadQEqaFfEb+kqg3XZ1NkIUHHTU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-245-PylM1A08OOqsNbP_q4Rolg-1; Fri, 16 Dec 2022 10:46:17 -0500
X-MC-Unique: PylM1A08OOqsNbP_q4Rolg-1
Received: by mail-ed1-f69.google.com with SMTP id m21-20020a056402431500b0046f818160a5so2148242edc.17
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 07:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9miN79vuneG4+xiAXBKAhjQmKbcytEgoN1Q0VxUiPr0=;
        b=BRkFDeaCkucRVQhF4CNif5BjZ8nsDOmCFm1CSHtOaJ8ezm3hIV2dg2hQTeeECXG9ns
         t9O6bpfwLKQR4v0IfWqe+knQqEDeSVZ7ygxhH9gDV/4hLt7EvDXJkls+JypcXW9GBU5P
         xnXfc2K1vMdjmEXotFGgGx7pcm7st3Y7V6ghV/AIvB+k1Q6pRWi1ATcGuZgfVX73b9jf
         ghVAucaACFJV47TWuqlVI1h//Gbgz7RgqC/s3Z6Mcp/xCfEmtkM/WU9kCvlhCkLHkVOf
         k2f/XO+8sM2Rem7kz9zoBC1/SsUMmZj6klOE193ZMiDsTKXo8b95CBo9npUczPCSI+uw
         63Ow==
X-Gm-Message-State: AFqh2kr8MAWQLZbWizeFRCZhtx0Kr+/u7QSYnxZVk1AmJ5rc4k6eqf9p
        lNEnfM37DYf0zvvhIk+W7m3dF60TOYSaIKWHd5ZGl/rzB8dFNColAH24u9U45prhuokpcc5WtGf
        Q+HYl3JRCRKE1WCezHGwxC7I=
X-Received: by 2002:a17:906:6b13:b0:7ae:29fa:ba8f with SMTP id q19-20020a1709066b1300b007ae29faba8fmr18501455ejr.2.1671205575485;
        Fri, 16 Dec 2022 07:46:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt1F+qGVMz5rlxsdm1cVTC00+hNjjzyZuB6NkuP4nyFnjpBc63rkQq2R/tNIbj6f9TJ3hqZGA==
X-Received: by 2002:a17:906:6b13:b0:7ae:29fa:ba8f with SMTP id q19-20020a1709066b1300b007ae29faba8fmr18501435ejr.2.1671205575286;
        Fri, 16 Dec 2022 07:46:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id 5-20020a170906308500b007be696512ecsm965332ejv.187.2022.12.16.07.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 07:46:14 -0800 (PST)
Message-ID: <143dc036-ed98-871f-57d9-e94bfa84ea5d@redhat.com>
Date:   Fri, 16 Dec 2022 16:46:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 02/11] leds: led-class: Add __led_get() helper function
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-3-hdegoede@redhat.com>
 <Y5x4mcv4rft2Wc+l@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5x4mcv4rft2Wc+l@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 12/16/22 14:54, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 12:30:04PM +0100, Hans de Goede wrote:
>> Split out part of of_led_get() into a generic __led_get() helper function.
>>
>> This is a preparation patch for adding a generic (non devicetree specific)
>> led_get() function.
> 
> ...
> 
>> +static struct led_classdev *__led_get(struct device *led_dev)
>> +{
>> +	struct led_classdev *led_cdev;
>> +
>> +	if (!led_dev)
>> +		return ERR_PTR(-EPROBE_DEFER);
>> +
>> +	led_cdev = dev_get_drvdata(led_dev);
>> +
>> +	if (!try_module_get(led_cdev->dev->parent->driver->owner)) {
>> +		put_device(led_cdev->dev);
>> +		return ERR_PTR(-ENODEV);
>> +	}
>> +
>> +	return led_cdev;
>> +}
> 
> If I'm not mistaken, the entire series leaves this function as is.
> At the end I found three _get functions:
>  __led_get
>  led_get
>  __devm_led_get
> 
> 
> As far as I can see the above can be named more precisely, i.e.
> led_module_get(). Or alike if this sounds not good either.

led_module_get() sounds good, I will rename this for v4.

Regards,

Hans

