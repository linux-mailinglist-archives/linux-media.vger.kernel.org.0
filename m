Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D854E5955CD
	for <lists+linux-media@lfdr.de>; Tue, 16 Aug 2022 11:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbiHPJE1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Aug 2022 05:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232408AbiHPJDl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Aug 2022 05:03:41 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7931452802
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 00:16:48 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id x9so9761543ljj.13
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 00:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=GZywDz79MWkIAWtmsTInAC2U/pDePEap2BTLTRkFC3I=;
        b=FToQXhXKoD1CRcdeSJx+5as41Y21im/rj/qG83fCoJU6Zke+RApdjsNZjdQts0AjtQ
         NdyuEWbPEiJUlzKfKFLOgyHmdvWHyVdUT7wUg2VCflIk1BJA6dbwvABrm/JM72iiBQIJ
         3/Q40UX7jvnRIRIj8WKecpkxSC1ihepYoJh61AJT8I8W58yY/KmNq3gfzweohVJkeF9b
         Lh0kex59rp1iG7IRBzf2gV4+8+c8L+aimkFmtwBqUNA0cNsPGUs1uHZGYjJOhsebtzpK
         LjAkIt3RgyA9AIkrtUf+0frkD4hGVoWlmkXhq9+CjLb7zGEayNs2QYJy6r9GY925o1v3
         NPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=GZywDz79MWkIAWtmsTInAC2U/pDePEap2BTLTRkFC3I=;
        b=YNFN/Lhl9gcZIjSK4G/Bio+rUKufS3GjGGJawWUCX1KQCgeJBWwfcR/Zu5PR1SGSLD
         maJ6Db+vaEylJcaHdPAZvWWgMvHBsV7nQsTvFU69m5gtcmvnWDF0NRCN8JYJqDRFQM76
         qxzLlCpSueE0zpBFyLxitK1D8YBSYgsNajzAios4q0je4kG92A+ZAw9T4uxUiY32N+yR
         08PorNo8GJA8sDSOXQTB1YXUSlHe42sALf+hRblnH97vaUK+4sACgz6TuwutdPYoSY6u
         cpfVzID3qbHIAqLTMnojIsFkKHLMHY11XQBGYkhzDdwaNzoNwa6dSm9dWcUgX+PBlbQO
         RbZA==
X-Gm-Message-State: ACgBeo0oj6Yqw7LLoJea2sMySD+rPh28eJdb24NylocDWzn3tKjTVa8H
        xT5FxtYSk9YtBQHOhB6tRxdGUbc6qmsoh12K
X-Google-Smtp-Source: AA6agR7wXWAEzbwY+ofhbBzjDCV06HAZqVuGUUB6O6ShEzsoiT7RcR2oAAzAOo3yrNf2AGw+/6b15w==
X-Received: by 2002:a2e:8854:0:b0:25e:6acb:fe8d with SMTP id z20-20020a2e8854000000b0025e6acbfe8dmr6320894ljj.486.1660634206817;
        Tue, 16 Aug 2022 00:16:46 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id x9-20020a056512078900b0048b279fa9a7sm1293349lfr.231.2022.08.16.00.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 00:16:46 -0700 (PDT)
Message-ID: <ceb2a42d-0650-6e6f-3408-6347bcd8c5e2@linaro.org>
Date:   Tue, 16 Aug 2022 10:16:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 3/7] media: i2c: ov9282: Add ov9281 compatible
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Naushir Patuck <naush@raspberrypi.com>
References: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
 <Yuje6wip8KEZG6Af@valkosipuli.retiisi.eu>
 <0a1e8af3-6c55-8a4a-ec85-9ba6bff22520@linaro.org>
 <2403639.ElGaqSPkdT@steina-w>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2403639.ElGaqSPkdT@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/08/2022 14:19, Alexander Stein wrote:
> Hello,
> 
> Am Dienstag, 2. August 2022, 10:30:40 CEST schrieb Krzysztof Kozlowski:
>> On 02/08/2022 10:23, Sakari Ailus wrote:
>>> On Mon, Aug 01, 2022 at 08:08:58PM +0200, Krzysztof Kozlowski wrote:
>>>> On 01/08/2022 20:07, Krzysztof Kozlowski wrote:
>>>>> On 29/07/2022 10:18, Laurent Pinchart wrote:
>>>>>> Hi Sakari,
>>>>>>
>>>>>> (Adding Dave and Naush to the CC list)
>>>>>>
>>>>>> On Fri, Jul 29, 2022 at 10:07:36AM +0300, Sakari Ailus wrote:
>>>>>>> On Thu, Jul 28, 2022 at 03:13:11PM +0200, Krzysztof Kozlowski wrote:
>>>>>>>> On 28/07/2022 15:02, Alexander Stein wrote:
>>>>>>>>> According to product brief they are identical from software point of
>>>>>>>>> view.
>>>>>>>>> Differences are a different chief ray angle (CRA) and the package.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>>>>>>> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
>>>>>>>>> ---
>>>>>>>>>
>>>>>>>>>  drivers/media/i2c/ov9282.c | 1 +
>>>>>>>>>  1 file changed, 1 insertion(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
>>>>>>>>> index 8a252bf3b59f..c8d83a29f9bb 100644
>>>>>>>>> --- a/drivers/media/i2c/ov9282.c
>>>>>>>>> +++ b/drivers/media/i2c/ov9282.c
>>>>>>>>> @@ -1113,6 +1113,7 @@ static const struct dev_pm_ops ov9282_pm_ops =
>>>>>>>>> {
>>>>>>>>>
>>>>>>>>>  };
>>>>>>>>>  
>>>>>>>>>  static const struct of_device_id ov9282_of_match[] = {
>>>>>>>>>
>>>>>>>>> +	{ .compatible = "ovti,ov9281" },
>>>>>>>>
>>>>>>>> The devices seem entirely compatible, so why you add a new compatible
>>>>>>>> and not re-use existing?
>>>>>>>>
>>>>>>>> The difference in lens does not explain this.
>>>>>>>
>>>>>>> It is typically necessary to know what kind of related hardware can be
>>>>>>> found in the system, beyond just the device's register interface.
>>>>>>> Apart
>>>>>>> from USB cameras, less integrated cameras require low-level software
>>>>>>> control in which specific device properties are important. In this
>>>>>>> case it
>>>>>>> could be the lens shading table, among other things.
>>>>>>>
>>>>>>> 	https://www.ovt.com/sensor/ov9282/
>>>>>>>
>>>>>>> Therefore I think adding a specific compatible string for this one is
>>>>>>> justified.
>>>>>
>>>>> Specific compatible in binding is a requirement. No one discussed this.
>>>>> However not in the driver. None of the arguments above justify adding
>>>>> such binding, unless user-space depends on matching compatible, but not
>>>>> real compatible?
>>>>
>>>> Eh, now I used vague words. This should be instead:
>>>>
>>>> "However not in the driver. None of the arguments above justify adding
>>>> such compatible to driver, unless user-space depends on matching
>>>> compatible, but not real compatible?"
>>>
>>> If I understand you right, you'd put the more specific model name as well
>>> as the more generic one to the compatible property and let the driver
>>> match
>>> against the more generic one?
>>
>> Yes.
>>
>>> But in this case neither of these models is more generic than the other.
>>
>> It's not a problem. Also the spec explains it similar way:
>> "They
>>  allow a device to express its compatibility with a family of similar
>> devices, potentially allowing a single
>>  device driver to match against several devices."
>>
>> Of course the numbers would suggest that ov9281 should be the family (as
>> lower number usually means designed earlier), but it is a matter of
>> convention which here can be skipped. The point is that ov9281 and
>> ov9282 are compatible between each other, therefore they belong to
>> single family.
>>
>> Best regards,
>> Krzysztof
> 
> So what is the conclusion of this?
> If using the "family" name there is no way for userspace to see the actual 
> device name rather than the driver name. This might be confusing, especially 
> of both ov9281 and ov9282 are attached to the same platform. The only 
> difference would be the i2c-bus-address.
> You can also go for ov928x but this is not a real improvement.

I still don't understand. Why user-space cannot see this? I really
cannot find any trouble... Your 3/7 patch does nothing special here for
user-space...

Best regards,
Krzysztof
