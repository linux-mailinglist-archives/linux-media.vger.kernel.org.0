Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0369364EF9D
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 17:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbiLPQpB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 11:45:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbiLPQoi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 11:44:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF9569A90
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 08:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671208933;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YUlmRK53YX5d0Gj6RTVrndM0s8lOkF3u21Cax+xfptw=;
        b=aAq/ymu36qbbXJFA9mPX2sXAJxGl8XPpQgtTQilUdQjlqA4tJfubxcvsTGaC35LSRRqaPd
        zy245gG91pc2MZPNH0Lkk07h9EXF7MnC7+HPYrxjqI2LzRU2HfIdZiw0uQ+0IH24dS144A
        aJS66QphOExdjM8ZdQagq6gGbhZw/kM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-Up5IDzVFMlCbPsID_omlaQ-1; Fri, 16 Dec 2022 11:42:11 -0500
X-MC-Unique: Up5IDzVFMlCbPsID_omlaQ-1
Received: by mail-ej1-f71.google.com with SMTP id qk40-20020a1709077fa800b007eeb94ecdb5so629282ejc.12
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 08:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUlmRK53YX5d0Gj6RTVrndM0s8lOkF3u21Cax+xfptw=;
        b=qRYQsSfKKSf+EvWf0dlNwfYhZamq0Fpphncqx81q9lsjRr8ZmSsom0wuxKj6SCJmED
         oajkbPV+kIUNVtiHgzkFjc19+nOleCnNM6LOKaiRM+4EvV2jvSdZ5fQxmJRA4Fy8/mj2
         4HKYTPSx6SKPJEdnczs0Np6h8szRAtuxtG9U5kBincQFDmJLLEuXnIQSPDdpF3ajf398
         jTvek6CPm0gwQpxzngpMYqrpIk/05uttw3jH1VMuTNuNct8s3Hwp5NGKpCyZfA3VPGnn
         gy48bQ2sDJdZ6drUr4+hnJyhuVLQTZaVzdpV2tEpVLyXX2S/AGwB66Px+opYYs7FN3HS
         mEIg==
X-Gm-Message-State: ANoB5plgVlXrynzjUb+v7R63V3G72MuT9iiIfVc45+TNaSET4yF7r8ei
        /6lKpWlFqQq4Jnq3fiCtnQGw/jekwakeXn6xTjxswlqWuYIXG+OekahigNvngdKh8uTLtNs1zV2
        yyTMRK3iWwawY/mpisJugjho=
X-Received: by 2002:a17:907:d092:b0:7c1:766e:e09 with SMTP id vc18-20020a170907d09200b007c1766e0e09mr17536433ejc.29.1671208930526;
        Fri, 16 Dec 2022 08:42:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4KfBexlDjFN0EJ6Q4CZsM1+iTUZnlNNf7WDRwo8pE3NhYsfIAF4klPJG518KP60s8Cx9jVBA==
X-Received: by 2002:a17:907:d092:b0:7c1:766e:e09 with SMTP id vc18-20020a170907d09200b007c1766e0e09mr17536412ejc.29.1671208930379;
        Fri, 16 Dec 2022 08:42:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id h13-20020a1709060f4d00b007c094d31f35sm1015086ejj.76.2022.12.16.08.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 08:42:09 -0800 (PST)
Message-ID: <ce764e02-0832-9b2b-c787-0e1c73748fe0@redhat.com>
Date:   Fri, 16 Dec 2022 17:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 11/11] platform/x86: int3472/discrete: Get the polarity
 from the _DSM entry
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
 <20221216113013.126881-12-hdegoede@redhat.com>
 <Y5yHPvXG/4pWivEG@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5yHPvXG/4pWivEG@smile.fi.intel.com>
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

On 12/16/22 15:57, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 12:30:13PM +0100, Hans de Goede wrote:
>> According to:
>> https://github.com/intel/ipu6-drivers/blob/master/patch/int3472-support-independent-clock-and-LED-gpios-5.17%2B.patch
>>
>> Bits 31-24 of the _DSM pin entry integer value codes the active-value,
> 
> Here and in the code you actually can refer to it as 3rd byte.

3th byte or 4th byte? There is no universal convention for numbering
bytes in a word, so just using Bits 31-24 is unambiguous.

> 
>> that is the actual physical signal (0 or 1) which needs to be output on
>> the pin to turn the sensor chip on (to make it active).
>>
>> So if bits 31-24 are 0 for a reset pin, then the actual value of the reset
>> pin needs to be 0 to take the chip out of reset. IOW in this case the reset
>> signal is active-high rather then the default active-low.
>>
>> And if bits 31-24 are 0 for a clk-en pin then the actual value of the clk
>> pin needs to be 0 to enable the clk. So in this case the clk-en signal
>> is active-low rather then the default active-high.
>>
>> IOW if bits 31-24 are 0 for a pin, then the default polarity of the pin
>> is inverted.
>>
>> Add a check for this and also propagate this new polarity to the clock
>> registration.
> 
> ...
> 
>> +	/* If bits 31-24 of the _DSM entry are all 0 then the signal is inverted */
> 
>> +	active_value = obj->integer.value >> 24;
>> +	if (!active_value)
> 
> Not sure why you need a temporary variable for this. Just use
> GENMASK()/GENMASK_ULL()?
> 
> 	if (obj->integer.value & GENMASK(31, 24));
> 
> In this case you even don't need to repeat bit numbers in the comment.

These bits contain the value to which the pin should be set when the
sensor is active (on), the active_value helper variable IMHO makes this
a lot more clear then directly checking the mask.

> 
>> +		polarity ^= GPIO_ACTIVE_LOW;
> 
>> +	dev_dbg(int3472->dev, "%s %s pin %d active-%s\n", func,
>> +		agpio->resource_source.string_ptr, agpio->pin_table[0],
>> +		(polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");
> 
> Yet another high/low :-)

Nope, this is the same patch as last time (when you were fine with
the other bits...).

Regards,

Hans


