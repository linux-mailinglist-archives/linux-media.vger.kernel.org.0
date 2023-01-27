Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B63A67EFE3
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 21:45:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjA0Uo7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 15:44:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231917AbjA0Uo5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 15:44:57 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 337337EFC0
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 12:44:35 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id l8so4260997wms.3
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 12:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSR2VjWWnAix4Brx2mQHhfEFj2hXAap+lyJ8hXBw3YM=;
        b=zBhlYaJMcLENbcuzKQ+/8nvJOrVC+l2q+acOcjTiQq/gix0+L2uEsoESoPtdxf0/UC
         PnTwOyYL8MdSYGSrTnuban7PAbkiicxv3aF/E4quhcsPM7+H41rMlCF/3BrWt7LwOLCW
         BFHPWNjjwRlO11qhNpTbKF+2RZNnsBvfzopYVMAUSIZO5P6XROwZX7L4Yd5ADKmga0rD
         7Orm+COH5PhK+AuONLULlBcBuLJV5U7dnf8lyCq+AB8+OJU5KC2Cy8ET8iAlQAszIJvk
         X3Kt8kwxdhyHm5nm76jL/Sj7k3BPBZ2EzWSKej8iKoGAAs+YEJKv20QMbARuULZxioOj
         Ixsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSR2VjWWnAix4Brx2mQHhfEFj2hXAap+lyJ8hXBw3YM=;
        b=TDza4qnzanwL+b5+ILrhvAu6jKjlpX3TO5SrK2izTjvYp86c9EhQIrXrHiRWl0vHYq
         9FAiM+T43BfF8jo3G0hPfjhexj6VNqvGuZQbBzxWdJbIBoieu6qh3CYD3+NTwGcvVf3M
         JSm0PLI8fs6UZtYOMyTTf4NgoeVLT+aINvPh1UJzEzseKrcnYFcjBGj3fJmLv34APwPY
         FCyJ1dzlTjQH+aHl6F7ipA183pc9R3rVtfRZXbs2OozORYQ4H+fJuk9S5YJ3eAGP3Owl
         jeNRKTGvXrx2C7tSchUTRhi1tCBYShRfZYsm8YLcJ4Nb7X+CoAE4IVWo1GHM1Ma+/3Rz
         xOPg==
X-Gm-Message-State: AFqh2kpJWzkQf0zmXwVtuONc5ihhzwfE8ng5cDiJzvy1mMBhsRZ+VPYy
        R0WgbZXk3E3PswNfruyMsZa3Ww==
X-Google-Smtp-Source: AMrXdXvlqm2Mz7dbbKfh/r2twHQmLpHjuqWIDF1hcIbW+2NCP9nhaEyv36EBZonHnf2roL8pq4Io8A==
X-Received: by 2002:a05:600c:34d1:b0:3db:1637:e415 with SMTP id d17-20020a05600c34d100b003db1637e415mr37175868wmq.22.1674852267080;
        Fri, 27 Jan 2023 12:44:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l41-20020a05600c08a900b003dc3d9fb09asm2035467wmp.47.2023.01.27.12.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 12:44:26 -0800 (PST)
Message-ID: <042332a6-3407-2c75-362c-db7b922bd99f@linaro.org>
Date:   Fri, 27 Jan 2023 21:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 1/9] media: dt-bindings: Add OV5670
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        laurent.pinchart@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20230126165909.121302-1-jacopo.mondi@ideasonboard.com>
 <20230126165909.121302-2-jacopo.mondi@ideasonboard.com>
 <482b464b-c5fb-8af2-b0f7-4388fccea3fd@linaro.org>
 <20230127181435.3d5rnrg5omxhn6l7@uno.localdomain>
 <00139f11-76b0-138a-2f7b-c67d149eb25e@linaro.org>
 <Y9Q2T3h50eudVbbb@valkosipuli.retiisi.eu>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y9Q2T3h50eudVbbb@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/01/2023 21:38, Sakari Ailus wrote:
> Hi Krzysztof,
> 
> On Fri, Jan 27, 2023 at 08:58:20PM +0100, Krzysztof Kozlowski wrote:
>> On 27/01/2023 19:14, Jacopo Mondi wrote:
>>> Hi Krzysztof
>>>
>>> On Fri, Jan 27, 2023 at 03:19:08PM +0100, Krzysztof Kozlowski wrote:
>>>> On 26/01/2023 17:59, Jacopo Mondi wrote:
>>>>> Add the bindings documentation for Omnivision OV5670 image sensor.
>>>>>
>>>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>>> ---
>>>>
>>>> (...)
>>>>
>>>>> +
>>>>> +  dovdd-supply:
>>>>> +    description: Digital I/O circuit power. Typically 2.8V or 1.8V.
>>>>> +
>>>>> +  port:
>>>>> +    $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +    additionalProperties: false
>>>>> +
>>>>> +    properties:
>>>>> +      endpoint:
>>>>> +        $ref: /schemas/media/video-interfaces.yaml#
>>>>> +        unevaluatedProperties: false
>>>>> +
>>>>> +        properties:
>>>>> +          data-lanes:
>>>>> +            minItems: 1
>>>>> +            maxItems: 2
>>>>> +            items:
>>>>> +              enum: [1, 2]
>>>>> +
>>>>> +          clock-noncontinuous: true
>>>>
>>>> You do not need this. Drop.
>>>>
>>>
>>> Is this due to "unevaluatedProperties: false" ?
>>>
>>> I read you recent explanation to a similar question on the Visconti
>>> bindings. Let me summarize my understanding:
>>>
>>> For a given schema a property could be
>>> - required
>>>         required:
>>>           - foo
>>>
>>> - optional
>>>         by default with "unevaluatedProperties: false"
>>>         "foo: true" with "additionalProperties: false"
>>>
>>> - forbidden
>>>         "foo: false" with "unevaluatedProperties: false"
>>>         by default wiht "additionalProperties: false"
>>>
>>> clock-noncontinuous is defined in video-interfaces.yaml. as I specify
>>> "unevaluatedProperties: false" does it mean
>>> all the properties defined in video-interfaces.yaml are optionally
>>> accepted ? If that's the case that's not what I want as
>>> clock-noncontinuous is -the only- property from that file we want to
>>> accept here (and data-lanes ofc).
>>>
>>> Should I change "unevaluatedProperties: false" to
>>> "additionalProperties: false" and keep "clock-noncontinuous: true"  ?
>>>
>>
>> Why would you disallow other properties? Just because driver does not
>> use them? That's not correct, driver change but bindings should stay the
>> same.
> 
> The clock-noncontinuous property is relevant for the hardware. There are
> some properties not listed here that might be relevant (for all camera
> sensors) but most properties in video-interfaces.yaml are not applicable to
> this device.
> 
> I also think is be useful to say what is relevant in DT bindings, as the
> other sources of information left are hardware datasheets (if you have
> access to them) or the driver (which is supposed not to be relevant for the
> bindings).
> 

Then it might be meaningful to list all allowed properties - even if not
currently supported by the driver - and use additionalProperties:false.
This has drawback - whenever video-interfaces gets something new, the
bindings here (and other such devices) will have to be explicitly enabled.

Best regards,
Krzysztof

