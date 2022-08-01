Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F177F587033
	for <lists+linux-media@lfdr.de>; Mon,  1 Aug 2022 20:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233797AbiHASJF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Aug 2022 14:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbiHASJE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Aug 2022 14:09:04 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C83AF631F
        for <linux-media@vger.kernel.org>; Mon,  1 Aug 2022 11:09:02 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a9so5751273lfm.12
        for <linux-media@vger.kernel.org>; Mon, 01 Aug 2022 11:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=wz9bs/b26A0/DfdS7GDckfKgvEhE/VAwAT6mdwwDr2I=;
        b=T9/0SgI/H34A+zjea4eNgW7m+L2LhB5D0BnaPi83oCRn5CBfpNfbKKah4qxnHwEX1O
         Pn2JZNhhzucAfjCNdKmGZAaqaMOsUQCeWWVTl8NM8UyLGQOiejmnqzHn4gcnxf3eMDUJ
         874AjPgIbmJwqnEdez2xGHmY7YMwdhfDnJjhvC6g+QMZAxzIPj3B51zgnM9nu8VmMvpV
         joZu7aFQgJARd1hiwMjKVr3q9fZBUlsvthEa+i9JWN7ytMcFe+/p6wxJ2plYpkqTOtxi
         MRwu5v7AIrj7LVulAoEK4DFGPjt8sORrGJtKVQyZByaq/O2PBGAetQK0jByycxOpbj4+
         QZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=wz9bs/b26A0/DfdS7GDckfKgvEhE/VAwAT6mdwwDr2I=;
        b=5QVTNlKtzJGYv7qajcND9MlgJX9IEM4MVm6Lyof6SfRYlPwIvc1rQNpjISnjvmTX2d
         OumigTfv5V6+pXciUiu9btG73ZidfR/vDNnGqr5ECzZK77i0/Mos8lhi0EmNeVnitBqv
         qLozHwW5iVbLQTpIB5N9eGVeWEiWAm4A4z2OlYBO0I2CqeaIwe772InadzQUFhkaLxXl
         XLLmQ15DM2nV6koK5xmqfaIi64NzQvCyb+bP1WP4EeFfah6eAyQJ5yE6i9fY8VpQRQr4
         I1zu/paUw/fdbcGjg+92tXM1RDfn7M7NRIhh9FN4MCroJ5GbMqu1t3lILLIlMxNQ1xRv
         pFgQ==
X-Gm-Message-State: AJIora++aK3hhsxd3rvi4vaPjALgH46SHsJMrhZ8EFfAzZcgOZwbjo9i
        uPh7QiHBtDuXJPSUv0IX2AH8Qg==
X-Google-Smtp-Source: AGRyM1toB8dVvV4IwJ3LBmpEg69SurxM6a1cPfZgtGX07+iNbacCWbNtoJooogukEnO3wpl5D+6CJg==
X-Received: by 2002:a05:6512:1288:b0:48a:aa31:2838 with SMTP id u8-20020a056512128800b0048aaa312838mr5987181lfs.683.1659377341028;
        Mon, 01 Aug 2022 11:09:01 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id f9-20020a056512360900b0048afe95d4d4sm356161lfs.17.2022.08.01.11.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 11:09:00 -0700 (PDT)
Message-ID: <8015285b-940b-503a-159e-66f10a34a999@linaro.org>
Date:   Mon, 1 Aug 2022 20:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 3/7] media: i2c: ov9282: Add ov9281 compatible
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Naushir Patuck <naush@raspberrypi.com>
References: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
 <20220728130237.3396663-4-alexander.stein@ew.tq-group.com>
 <4e89e55b-9312-5525-974b-0a1dbe0b3dd1@linaro.org>
 <YuOHOEUk+znzump5@valkosipuli.retiisi.eu>
 <YuOXyZ6XTW2DjLvd@pendragon.ideasonboard.com>
 <e3847096-ae60-9ab3-f1e7-c461508be952@linaro.org>
In-Reply-To: <e3847096-ae60-9ab3-f1e7-c461508be952@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/08/2022 20:07, Krzysztof Kozlowski wrote:
> On 29/07/2022 10:18, Laurent Pinchart wrote:
>> Hi Sakari,
>>
>> (Adding Dave and Naush to the CC list)
>>
>> On Fri, Jul 29, 2022 at 10:07:36AM +0300, Sakari Ailus wrote:
>>> On Thu, Jul 28, 2022 at 03:13:11PM +0200, Krzysztof Kozlowski wrote:
>>>> On 28/07/2022 15:02, Alexander Stein wrote:
>>>>> According to product brief they are identical from software point of view.
>>>>> Differences are a different chief ray angle (CRA) and the package.
>>>>>
>>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>>> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
>>>>> ---
>>>>>  drivers/media/i2c/ov9282.c | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
>>>>> index 8a252bf3b59f..c8d83a29f9bb 100644
>>>>> --- a/drivers/media/i2c/ov9282.c
>>>>> +++ b/drivers/media/i2c/ov9282.c
>>>>> @@ -1113,6 +1113,7 @@ static const struct dev_pm_ops ov9282_pm_ops = {
>>>>>  };
>>>>>  
>>>>>  static const struct of_device_id ov9282_of_match[] = {
>>>>> +	{ .compatible = "ovti,ov9281" },
>>>>
>>>> The devices seem entirely compatible, so why you add a new compatible
>>>> and not re-use existing?
>>>>
>>>> The difference in lens does not explain this.
>>>
>>> It is typically necessary to know what kind of related hardware can be
>>> found in the system, beyond just the device's register interface. Apart
>>> from USB cameras, less integrated cameras require low-level software
>>> control in which specific device properties are important. In this case it
>>> could be the lens shading table, among other things.
>>>
>>> 	https://www.ovt.com/sensor/ov9282/
>>>
>>> Therefore I think adding a specific compatible string for this one is
>>> justified.
> 
> Specific compatible in binding is a requirement. No one discussed this.
> However not in the driver. None of the arguments above justify adding
> such binding, unless user-space depends on matching compatible, but not
> real compatible?

Eh, now I used vague words. This should be instead:

"However not in the driver. None of the arguments above justify adding
such compatible to driver, unless user-space depends on matching
compatible, but not real compatible?"

> 
>>>
>>> Also cc Laurent.
>>
>> Interesting coincidence, we've talked about this topic (as part of a
>> broader discussion) no later than yesterday.
>>
>> I agree with Sakari in that userspace needs to know the exact model of
>> the camera sensor. I don't see a good alternative to providing that
>> information through the platform firmware, so the device tree in this
>> case. The question is how it should be provided (the question of how it
>> should then be exposed to userspace is also important, but out of scope
>> in this discussion).
>>
>> The compatible string is meant to indicate a device's compatibility with
>> "something", and that something is often considered from the point of
>> view of software support, and in particular to pick an appropriate
>> kernel driver and tune its behaviour for the device. Here, one could
>> argue that the exact model is also needed to ensure proper software
>> support, but in userspace this time, not in the kernel. I think using a
>> dedicated compatible string would be reasonable. An alternative would be
>> to use another DT property, which should then be standardized. I'm not
>> sure it's worth it.
>>
>> Broadening the discussion, we also need to know detailed information
>> about the camera lens (I'm talking about the lens itself here, not the
>> lens controller IC that controls the motor that moves the focus lens).
>> The lens isn't described in the device tree with a dedicated device tree
>> node today, and I don't think it should (I'd have a hard time coming up
>> with a naming scheme for lenses that we could use in compatible strings,
>> and the lens-related data that a system requires can possibly vary based
>> not only on the lens itself but on the ISP that the camera sensor is
>> used with). Typical useful data are the lens movement range, the
>> hyperfocal distance, but also the lens shading tables. (Part of) that
>> information is sometimes stored in non-volatile memory in the camera
>> module (OTP in the camera sensor itself, or a separate EEPROM), but
>> that's not always the case. We have considered the possibility of
>> storing the information in the device tree, but I doubt that would be
>> accepted. We can store the information in userspace in configuration
>> files, but we will still need to device tree to provide lens
>> identification information to select the correct configuration file. I
>> don't know how that should be done.
> 
> It seems both you and Sakari suggested not to have specific compatible.
> Such idea (not to have specific compatible) was not proposed by me.
> Quite contrary - specific compatible is a requirement. However device
> driver does no need it. Just use fallback for the driver.


Best regards,
Krzysztof
