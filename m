Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7313C793608
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 09:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbjIFHRO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 03:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbjIFHRN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 03:17:13 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B42BFCFA
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 00:17:08 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31977ace1c8so2940326f8f.1
        for <linux-media@vger.kernel.org>; Wed, 06 Sep 2023 00:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693984627; x=1694589427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjFKF8kz0rFgiiIepCyA40GooVbihGUlWbJspHagbd4=;
        b=aM81ieFXH/7MSxXQfOFxgbhz1cjLASuxK1Nm4gM70wTnt1COm/+7XGq62oC0Rwb7vO
         ZDnYfiLkipJynAlg6f5xGtTA1/Pvo1ntap4tvxEIyMX2t+zCKhhG7BCP5VZfmCBFrp6m
         Pw48yZ6ZyyPVk4MBUkXEtX7Ef3hEe4IH6zo61E9jZoMTmHFo2H71vNk/BhyfloFATLhu
         oYeHW5u6y7nsMHcKBoMqF6t90n8za5rmkEKNH3i4sKkoizO25uZNQxCdjIms/MdfvNz4
         1GmX2J4Ee0J7+Pb76FoXjr10KrZRDa7oo+d9/rZQdbsgZYj/171/GGPCBk63hcjygjUi
         HYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693984627; x=1694589427;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zjFKF8kz0rFgiiIepCyA40GooVbihGUlWbJspHagbd4=;
        b=F8O6+j8jMBPBvMkdcAd2YrTWYkmG/++2dN+r9p1qJxQj3IGO5qSH3J7ByExB0htrql
         09ySs4qMFvCHPwWZT/HidzK5uKuOjiqoLcZQGX7MdI7jj8xXV4TxjeUNS7qVrmrQHOfo
         Dhy1B5T8lhqo5iIeL4g/kdmSLz6FVPwrkK8JJXclNTm2ivaTlxHX7VbFInAcEmusQGKU
         Oq0LpLLabi9NZWnrHymlmUFDt/G+QqoulCyuSiqkiBHeGQPfsoTFbSetoFEQr1t+kmen
         rZZyHlmWdHi3eJQgryAmUUq/Re6cX7QqWTLWU5uK4xkjKKci/u0rihKbZfqghg4ZgafQ
         ehuQ==
X-Gm-Message-State: AOJu0Yy0b3wKYbDnUGO9NuYSUDr89KxEq7QHTLwNlNoK1I1nhrzEISDk
        +SoSFPrU+QtalQe7bQOH/V+DJg==
X-Google-Smtp-Source: AGHT+IG1fAswEQZ+zQpRcdWpRk4PGX5V8rpi9OfzyvdRolXIlsS/nRu0hUXmH2/AJRvuTde7w6CjgQ==
X-Received: by 2002:adf:e5c7:0:b0:314:3e77:f210 with SMTP id a7-20020adfe5c7000000b003143e77f210mr1567493wrn.59.1693984627147;
        Wed, 06 Sep 2023 00:17:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cb13:4315:e6a2:bbdd? ([2a01:e0a:982:cbb0:cb13:4315:e6a2:bbdd])
        by smtp.gmail.com with ESMTPSA id p6-20020adfce06000000b0031ad2f9269dsm19696493wrn.40.2023.09.06.00.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 00:17:06 -0700 (PDT)
Message-ID: <c5c9000e-0f49-4e87-a5f7-6fbb9aa71bb6@linaro.org>
Date:   Wed, 6 Sep 2023 09:17:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/3] media: rc: meson-ir: support rc driver type
 RC_DRIVER_SCANCODE
Content-Language: en-US, fr
To:     Zelong Dong <Zelong.Dong@amlogic.com>, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <20230825115310.39993-2-zelong.dong@amlogic.com>
 <fcdb1fb2-784d-4235-aa47-9e489395c028@linaro.org>
 <646b1955-c89f-a6f5-acd1-a3c68953b0c6@amlogic.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <646b1955-c89f-a6f5-acd1-a3c68953b0c6@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URI_HEX autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/09/2023 09:11, Zelong Dong wrote:
> 
> 
> 在 2023/8/25 20:19, Neil Armstrong 写道:
>> On 25/08/2023 13:53, zelong dong wrote:
>>> From: Zelong Dong <zelong.dong@amlogic.com>
>>>
>>> Meson IR Controller supports hardware decoder in Meson-S4 and later
>>> SoC. So far, protocol NEC could be decoded by hardware decoder.
>>>
>>> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
>>> ---
>>>   drivers/media/rc/meson-ir.c | 522 +++++++++++++++++++++++++++++++-----
>>>   1 file changed, 451 insertions(+), 71 deletions(-)
>>>
>>
>> <snip>
>>
>> It looks pretty good now, so far I'm ok with it:
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> I think some test reports would be needed to be sure it doesn't regress existing HW.
>>
>> Thanks,
>> Neil
> 
> Sorry for my late reply, I spent a long time looking for development boards.
> I searched Meson-IR DT Node from all the Amlogic DT, only 4 DTSI as follow:
> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> arch/arm/boot/dts/amlogic/meson.dtsi
> 
> So I planned to sample the boards to test:
> arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
> arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
> 
> Unfortunately, meson-gxl-s905x-p212 & meson8b-odroidc1 are too old to be find.
> there are only 2 boards I got, meson-g12a-u200 & meson-axg-s400, and they worked.
> 
> [    0.943097] IR NEC protocol handler initialized
> [    0.943146] IR RC5(x/sz) protocol handler initialized
> [    0.947029] IR RC6 protocol handler initialized
> [    0.951508] IR RCMM protocol handler initialized
> [    0.956080] IR XMP protocol handler initialized
> [    0.961266] Registered IR keymap rc-empty
> [    0.964674] rc rc0: meson-ir as /devices/platform/soc/ff800000.bus/ff808000.ir/rc/rc0
> [    0.972437] input: meson-ir as /devices/platform/soc/ff800000.bus/ff808000.ir/rc/rc0/input0
> [    0.980983] rc rc0: sw decoder init
> [    0.984089] meson-ir ff808000.ir: receiver initialized
> 
> # cd /sys/devices/platform/soc/ff800000.bus/ff808000.ir/rc/rc0/
> # cat protocols
> rc-5 nec rc-6 rc-5-sz xmp rc-mm
> # echo nec > protocols
> # hexdump /dev/input/event0
> 0000000 0069 0000 3180 0005 0004 0004 011b 0000
> 0000010 0069 0000 3180 0005 0000 0000 0000 0000
> 0000020 0069 0000 fc80 0005 0004 0004 011b 0000
> 0000030 0069 0000 fc80 0005 0000 0000 0000 0000
> 0000040 0069 0000 92db 0007 0004 0004 011b 0000
> 0000050 0069 0000 92db 0007 0000 0000 0000 0000
> 0000060 0069 0000 388b 0009 0004 0004 011b 0000
> 0000070 0069 0000 388b 0009 0000 0000 0000 0000
> 0000080 0069 0000 de72 000a 0004 0004 011b 0000
> 0000090 0069 0000 de72 000a 0000 0000 0000 0000

It's fine !

Thanks for testing !!

Neil
