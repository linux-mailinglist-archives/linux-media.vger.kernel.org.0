Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC5364EF18
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 17:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbiLPQaN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 11:30:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbiLPQaF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 11:30:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607242AFF
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 08:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671208157;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+upODwCg9US2WboUst6jxBy7JMyZUXll6f2pBaNMS+o=;
        b=dutJLDbIj2f61lOhNtoaXL8AW6vSzAXSVQ0rAiRVgId3vzv4f05AyQ/QYIHKY1GHKXZmqt
        pmG/rl8MhzMRl5LYiBPyaHMbtyrVwQzvyUraZDtvJrAuUy0Y4dHS774RJE+bQcZxfPMoFT
        bWff6IUi1xg2k8soCj9ZODv2r6jpa0E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-tfWOo2KVM3-5owwobOBkDg-1; Fri, 16 Dec 2022 11:29:16 -0500
X-MC-Unique: tfWOo2KVM3-5owwobOBkDg-1
Received: by mail-ed1-f69.google.com with SMTP id z3-20020a056402274300b0046b14f99390so2230595edd.9
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 08:29:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+upODwCg9US2WboUst6jxBy7JMyZUXll6f2pBaNMS+o=;
        b=mlUm+9OURK9RF2u2iFkx8y0NO/UFMFGIPwum783GOA6WC19ntH0XJCsooSiB3SB4ws
         milUrbb2oD7TAju3lQvawWiF2ql0+nxCfHYnsktGL2IH6Mf+9hNChUHEhq5pFdwYZcfW
         sXPbbcuN40fsh+BAYKn7z8xMDR8UP3B6WYwInPpVnd3fep4CPclnzGpNvE9HcrcjUZ4x
         3bEGFVpzS/2KVhOk8eBz361CfMfsXka0mJYwL62wD+r7slpJwg06+pWFUYq0JBB1tZlZ
         yIBOtLMB5Jsq18d6H1rnC0DgzacYnh/CwL243WKPHL/kCcpZUc0yWvMyuPd2UyUoNC9o
         2f5Q==
X-Gm-Message-State: ANoB5plgjp3fvXSjL0JYrmAzghX2j9Y6tJmV5ZbG5Wh4mfZuz62cgCaN
        zGY5jILV8y3uC387G7CA2F4s9CY5yTEAKnlenjWyR/P8D01YbADrvfHtNPd/i7AsvIkb5FiFI4l
        W6v7H1Q24eTJekTnxJoELRvU=
X-Received: by 2002:a05:6402:3215:b0:470:362f:6ba9 with SMTP id g21-20020a056402321500b00470362f6ba9mr15467369eda.41.1671208155204;
        Fri, 16 Dec 2022 08:29:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5WR/ICG+hCQ7tsp1AjkRTWv6crUFBhwdQ8eI9rOPW40h5MgzNku5U+bYTUizn2MdPALr/Oww==
X-Received: by 2002:a05:6402:3215:b0:470:362f:6ba9 with SMTP id g21-20020a056402321500b00470362f6ba9mr15467354eda.41.1671208155043;
        Fri, 16 Dec 2022 08:29:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id da15-20020a056402176f00b004615f7495e0sm1044190edb.8.2022.12.16.08.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 08:29:14 -0800 (PST)
Message-ID: <d3d28b30-a364-66eb-7870-06c43d683bb7@redhat.com>
Date:   Fri, 16 Dec 2022 17:29:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 08/11] platform/x86: int3472/discrete: Create a LED
 class device for the privacy LED
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
 <20221216113013.126881-9-hdegoede@redhat.com>
 <Y5x9uHm8NnVHc0Lv@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5x9uHm8NnVHc0Lv@smile.fi.intel.com>
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

On 12/16/22 15:16, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 12:30:10PM +0100, Hans de Goede wrote:
>> On some systems, e.g. the Lenovo ThinkPad X1 Yoga gen 7 and the ThinkPad
>> X1 Nano gen 2 there is no clock-enable pin, triggering the:
>> "No clk GPIO. The privacy LED won't work" warning and causing the privacy
>> LED to not work.
>>
>> Fix this by modeling the privacy LED as a LED class device rather then
>> integrating it with the registered clock.
>>
>> Note this relies on media subsys changes to actually turn the LED on/off
>> when the sensor's v4l2_subdev's s_stream() operand gets called.
> 
> ...
> 
>> +	struct int3472_pled {
>> +		char name[INT3472_LED_MAX_NAME_LEN];
>> +		struct led_lookup_data lookup;
> 
>> +		struct led_classdev classdev;
> 
> Why not putting this as a first member in the struct, so any container_of()
> against it become no-op at compile time?

Ack will fix for v4.

> 
>> +		struct gpio_desc *gpio;
>> +	} pled;
> 
> ...
> 
>> +	if (IS_ERR(int3472->pled.gpio)) {
>> +		ret = PTR_ERR(int3472->pled.gpio);
>> +		return dev_err_probe(int3472->dev, ret, "getting privacy LED GPIO\n");
> 
> 	return dev_err_probe(...);

That goes over 100 chars.


> 
>> +	}
> 
> ...
> 
>> +	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
>> +	snprintf(int3472->pled.name, sizeof(int3472->pled.name),
>> +		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
> 
>> +	for (i = 0; int3472->pled.name[i]; i++) {
>> +		if (int3472->pled.name[i] == ':') {
>> +			int3472->pled.name[i] = '_';
>> +			break;
>> +		}
>> +	}
> 
> NIH strreplace().

Please look more careful, quoting from the strreplace() docs:

 * strreplace - Replace all occurrences of character in string.

Notice the *all* and we only want to replace the first ':' here,
because the ':' char has a special meaning in LED class-device-names.


> 
> ...
> 
>> +void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472)
>> +{
>> +	if (IS_ERR_OR_NULL(int3472->pled.classdev.dev))
>> +		return;
> 
> This dups the check inside the _unregister() below, right?

Right.

> 
>> +	led_remove_lookup(&int3472->pled.lookup);
> 
> With list_del_init() I believe the above check can be droped.

No it cannot, list_del_init() inside led_remove_lookup() would
protect against double led_remove_lookup() calls.

But here we may have a completely uninitialized list_head on
devices without an INT3472 privacy-led, which will trigger
either __list_del_entry_valid() errors or lead to NULL
pointer derefs.


> 
>> +	led_classdev_unregister(&int3472->pled.classdev);
>> +	gpiod_put(int3472->pled.gpio);
>> +}
> 

Regards.

Hans

