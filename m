Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81E294D96C6
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 09:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241033AbiCOIyJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 04:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238315AbiCOIyH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 04:54:07 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7038C2618
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 01:52:55 -0700 (PDT)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 319773F366
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 08:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647334374;
        bh=PBV/tGNbXfakyCxmgZnjzGicsCNENlYn2Cz9FZeKTbY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=wU9M//i1FLx0oU7iZmbES3ssCFjR46cIv8eNkAkL3seW6P7T+iDDD5hzTJ2y8x3mo
         BZT+tkQm87Z+JCbiameF5IbSkPDEZa/gSMRgwuZOXkLu9oHVxQAZbPldOvBXEaH3kt
         r9ysiKj0ibRGYWG8CakHzLk/XJhuyu1SkCeNvTGAnCfQE52IKbS1ketvSFRrq+rp+0
         GkiIJJuwwLC21m7Z7ck+DAc/jW2RyV5yb+AkA6MWJhPoZmRPDuI1g4tnDfZT1Nc2v3
         wH2w+qCHjT++jIqFiSv6HdJ5erIsfrmIfPTwBxsImQOivORdOBFEDik44hM+wsaTo0
         JMOzFThaQAKFw==
Received: by mail-ej1-f71.google.com with SMTP id i14-20020a17090639ce00b006dabe6a112fso9204101eje.13
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 01:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PBV/tGNbXfakyCxmgZnjzGicsCNENlYn2Cz9FZeKTbY=;
        b=JzWWeWixCrM2c0lBoAnDNcZW66V8i2NuTraO3Ac8E7zm3PEHhhmKR+eAkI0MhQzIwB
         fHjQshc8vxlw1PLYjjE/JQ/0EGRHnfxKfFUj73JfJyQ0/rrUz+5nBe6CvnJrJF4esNbf
         hJrpoAI7GIXn2cZ+PuBMfZU3rU6iH/HbtlK0csIUMBMk2L5R4ZomtrDv/0isQ0aZGaik
         iFL5gXOAI40OVBmAHFlkfd/MTxDe3JNUCLu0KE11ZEIYwpfj3iEleonI2/atNJdkIlw0
         74UqBaSSZ4SC80miJKoyixAX0VNmJoaF2vlJXDjPZ3mRHU0CMOgeuTexjyiddP3wB///
         otuw==
X-Gm-Message-State: AOAM5302Gl8pRqPQRyg5S7gHMeDpw9GG1U1+AgA4Mo8u1Ag206DDdeo7
        0FQ8XPBU3mZHpuy3Q3olWuKJuAwH1uxbXkFSZhaZiMe+3PF1XgG8TxyBvxoH0JxGgq27Suk3h5q
        WSgKwmAuzRpvEZdr77O71Aeq1PXjwZ+1h7kxudO8v
X-Received: by 2002:a05:6402:31f0:b0:416:4bda:ebd4 with SMTP id dy16-20020a05640231f000b004164bdaebd4mr23802947edb.63.1647334373759;
        Tue, 15 Mar 2022 01:52:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpq0Ux0R7bTFA0EGqzoICqaTAB4Pmjr8hj9hWxS9oEAWJShkUtYI4+7tRGFegv4zJyaxs0xQ==
X-Received: by 2002:a05:6402:31f0:b0:416:4bda:ebd4 with SMTP id dy16-20020a05640231f000b004164bdaebd4mr23802944edb.63.1647334373550;
        Tue, 15 Mar 2022 01:52:53 -0700 (PDT)
Received: from [192.168.0.153] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.googlemail.com with ESMTPSA id u19-20020a170906125300b006ceb043c8e1sm7962082eja.91.2022.03.15.01.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Mar 2022 01:52:52 -0700 (PDT)
Message-ID: <83c93f5b-d0bf-a4e0-66dd-dde996425ad3@canonical.com>
Date:   Tue, 15 Mar 2022 09:52:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/8] media: i2c: ov5670: Probe clocks with OF
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        paul.kocialkowski@bootlin.com, sakari.ailus@iki.fi,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
References: <20220314162714.153970-1-jacopo@jmondi.org>
 <20220314162714.153970-4-jacopo@jmondi.org>
 <YjBKQrdiOo1/EWck@pendragon.ideasonboard.com>
 <20220315084618.ol6ekvgvn5ldgif7@uno.localdomain>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220315084618.ol6ekvgvn5ldgif7@uno.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/03/2022 09:46, Jacopo Mondi wrote:
> Hi Laurent,
> 
> On Tue, Mar 15, 2022 at 10:11:46AM +0200, Laurent Pinchart wrote:
>> Hi Jacopo,
>>
>> Thank you for the patch.
>>
>> On Mon, Mar 14, 2022 at 05:27:09PM +0100, Jacopo Mondi wrote:
>>> Add support for probing the main system clock using the common clock
>>> framework and its OF bindings.
>>>
>>> Maintain ACPI compatibility by falling back to parse 'clock-frequency'
>>> if the no clock device reference is available.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>> ---
>>>  drivers/media/i2c/ov5670.c | 21 +++++++++++++++++----
>>>  1 file changed, 17 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
>>> index 721441024598..25d792794fc7 100644
>>> --- a/drivers/media/i2c/ov5670.c
>>> +++ b/drivers/media/i2c/ov5670.c
>>> @@ -2,6 +2,7 @@
>>>  // Copyright (c) 2017 Intel Corporation.
>>>
>>>  #include <linux/acpi.h>
>>> +#include <linux/clk.h>
>>>  #include <linux/i2c.h>
>>>  #include <linux/mod_devicetable.h>
>>>  #include <linux/module.h>
>>> @@ -1819,6 +1820,8 @@ struct ov5670 {
>>>  	struct v4l2_subdev sd;
>>>  	struct media_pad pad;
>>>
>>> +	struct clk *clk;
>>> +
>>>  	struct v4l2_ctrl_handler ctrl_handler;
>>>  	/* V4L2 Controls */
>>>  	struct v4l2_ctrl *link_freq;
>>> @@ -2478,10 +2481,6 @@ static int ov5670_probe(struct i2c_client *client)
>>>  	bool full_power;
>>>  	int ret;
>>>
>>> -	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);
>>> -	if (input_clk != 19200000)
>>> -		return -EINVAL;
>>> -
>>>  	ov5670 = devm_kzalloc(&client->dev, sizeof(*ov5670), GFP_KERNEL);
>>>  	if (!ov5670) {
>>>  		ret = -ENOMEM;
>>> @@ -2489,6 +2488,20 @@ static int ov5670_probe(struct i2c_client *client)
>>>  		goto error_print;
>>>  	}
>>>
>>> +	/* OF uses the common clock framework, ACPI uses "clock-frequency". */
>>> +	ov5670->clk = devm_clk_get_optional(&client->dev, NULL);
>>> +	if (IS_ERR(ov5670->clk))
>>> +		return dev_err_probe(&client->dev, PTR_ERR(ov5670->clk),
>>> +				     "error getting clock\n");
>>> +
>>> +	if (ov5670->clk)
>>> +		input_clk = clk_get_rate(ov5670->clk);
>>> +	else
>>> +		device_property_read_u32(&client->dev, "clock-frequency",
>>> +					 &input_clk);
>>
>> This will try to use the clock-frequency property on OF-based systems if
>> no clock is specified. Could we instead have
>>
> 
> 'clocks' is listed as a required property in the OF bindings and my
> understanding is that driver assume DTS are correct.
> 
>> 	if (probed through OF) {
> 
> Otherwise yes, I can check for dev->of_node
> But again, I don't think drivers should have to work-around broken DTS
> 

Driver should expect broken DTS and handle it. You're introducing new
feature (OF support) so you can be strict about DTS and reject the ones
which do not provide clock.

Best regards,
Krzysztof
