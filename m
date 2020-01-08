Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69609133D22
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 09:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbgAHIbO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 03:31:14 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44673 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727221AbgAHIbK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 03:31:10 -0500
Received: by mail-ed1-f68.google.com with SMTP id bx28so1831315edb.11
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2020 00:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nDs1T93B8v5O40q4fibGGoHo0SYxTJ1NHmqT2ydaTtQ=;
        b=b9NjNWMouhdpSZtVq012+7zvznVTp6QoZw51rmP4BNezumhjhJquZYaI6v/glUqFFc
         D9A4WNgMg18sR1bYHIAYMamQSAr+wbCD7vS4JxSqtjLGsQahp9fjoLWJgSAbiN4WTo4O
         Tmf9quFCyhzeh4Qs15QxtY1pnKC96mV0T6W5ESv/IlqMHhYm7SZkYLjz87po6wHuXMip
         35vnLTT4gwexuJRzIbJearbTuSjvYO3tzzCv7zRRV77JK/VHOPdORCSRvCpxA+kxWuNi
         /15egs5vLzmfJA8llCr/BnDfHwPZ/DDKAYAGSn4R+JDWCXW+7Hl7WcQMBE3n5z+yghjb
         O9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nDs1T93B8v5O40q4fibGGoHo0SYxTJ1NHmqT2ydaTtQ=;
        b=aQ1Vomp4QmeyfYefMbxH4WSc0cw2zj5Ao7usiMZ536jcWszBykT/3VPRFzTHLKEQTa
         uLAAcEZOPyIViXm0ZbkitaBLM8ZRNtsS3COnE8oiYiv+oe2tKQOY+p0PpEVR+Ngv4Uog
         Jt9DROYM5pXoWrSY6YF/znyp5eKQ4b63AaAwUMHpwRYeac+4QT3zinHoSI0+JhTNLeyW
         jaNf1TfzsN36NSwvjAb4EGwxWz5A4QLoozhE6uWq75mOW49L2MV3QYzBF/jd8TqQWZOQ
         C7YjUhAdt0xnapx+wftnI10StmPECN+OBFKdmJrrwW8TQIjHCsHkGuMJO2x11r7+ha3R
         bgvg==
X-Gm-Message-State: APjAAAWRk7VB08QWB8hTipe1lT1LtBt8OMOXs0J8xucWdddktfhNT+Nr
        a+hPOaDdTurO5ztaVxTH+K1Rzw==
X-Google-Smtp-Source: APXvYqwPCVmrHuNQsu+V3IVoJ6JlOom1LqJ0JNrlLBv+rc79vCsB3yVJlQZi8FK9es6qo7D5qIk82Q==
X-Received: by 2002:a17:906:c44a:: with SMTP id ck10mr3605843ejb.149.1578472268962;
        Wed, 08 Jan 2020 00:31:08 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id u21sm58393edv.43.2020.01.08.00.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2020 00:31:07 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: qcom: add Venus firmware node on Cheza
To:     Rob Clark <robdclark@gmail.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        linux-media@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>
References: <20200107143402.122455-1-acourbot@chromium.org>
 <3aef91ea-30c1-530f-0c18-ea52b92347f9@linaro.org>
 <CAF6AEGvgYB8w_GD-6_XywKk4XkS6bFFCiJHeY-CSz71Foz7JTg@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <1d31b609-9bae-8bbd-0329-f27f59b4533e@linaro.org>
Date:   Wed, 8 Jan 2020 10:31:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAF6AEGvgYB8w_GD-6_XywKk4XkS6bFFCiJHeY-CSz71Foz7JTg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/7/20 7:42 PM, Rob Clark wrote:
> On Tue, Jan 7, 2020 at 6:51 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Hi Alex,
>>
>> On 1/7/20 4:34 PM, Alexandre Courbot wrote:
>>> Cheza boards require this node to probe, so add it.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 6 ++++++
>>>  arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 +-
>>>  2 files changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
>>> index 9a4ff57fc877..35ba65cd9822 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
>>> @@ -1279,3 +1279,9 @@ config {
>>>               };
>>>       };
>>>  };
>>> +
>>> +&venus_codec {
>>
>> We have similar patch for sc7180 and call it just "venus". Do you think
>> we should shorten it here too?
>>
>>> +     video-firmware {
>>> +             iommus = <&apps_smmu 0x10b2 0x0>;
>>> +     };
> 
> 
> btw Stan, not sure if you noticed, but Bjorn started adding
> firmware-name properties so we can have different device specific
> subdirectories for signed fw (ie. so one /lib/firmware can work on
> multiple different devices).  I'm just looking at doing the same thing
> for gpu zap fw.  Afaiu the venus fw is also signed, so I guess it
> could benefit from the same treatment?  Not sure if that is something
> you've already talked with Bjorn about?

I have to check does Venus fw is signed with device specific keys or
with something else (like HMAC).

Cc: Vikash for opinion

> 
> BR,
> -R
> 
>>> +};
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> index ddb1f23c936f..7b913688cc6d 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> @@ -2567,7 +2567,7 @@ usb_2_dwc3: dwc3@a800000 {
>>>                       };
>>>               };
>>>
>>> -             video-codec@aa00000 {
>>> +             venus_codec: video-codec@aa00000 {
>>>                       compatible = "qcom,sdm845-venus";
>>>                       reg = <0 0x0aa00000 0 0xff000>;
>>>                       interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>>
>>
>> --
>> regards,
>> Stan

-- 
regards,
Stan
