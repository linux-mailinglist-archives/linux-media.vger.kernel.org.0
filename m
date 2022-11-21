Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4680631AEB
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 09:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbiKUIEe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 03:04:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiKUIEd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 03:04:33 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED7023BE4
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 00:04:32 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id l12so17614451lfp.6
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 00:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQXNwXriyENMBxcRvt5HwJj1BFFBn/vx8r8A40oB0Tc=;
        b=DQqLRI7fYzNORFBvv3pu5HOUzWXdPDA+z+U4wFKW7mEn7VdJgPVSFdvA5APdkvf4mg
         NJMOqaVt5aDPidpqNOcibQCfzw8GMcitQtUQN4bInHcEEoaKCkG2HXe8d4Sie1MSQ454
         ibIbQ1JLCApYS1yvVIGhiY8hziX/Gv54o7RsymuCfL8je8yiiB+gjPhH1pK228inL3/Z
         /GAaZOzBgLNcfqZX4UZ6uoJXuTAaStZAa7+fMaZiwMDh4C6Jp10AoCF3UPUFHThxnpoa
         GeRskEkYHojOa6Y2jjTAG6J+aXj5BRbRUv6n2lQNpNKsOMKSRR+QLsvP4Y6EndzVeNdd
         wtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQXNwXriyENMBxcRvt5HwJj1BFFBn/vx8r8A40oB0Tc=;
        b=RMVkdrWPBH8lFkwazUI/GwosJ16o2MKn0Lg+AigwNXojVi8xbhhFZTYXwAJEHSXzt+
         cZCoZmDD+jwf+pVmMF5x9dPQ/TInGENmrnNtYam2/d61SVkyHCwi6/jLLu5d76vb4OvQ
         u89UgcznOEC9efmNeDH/u6i7SR8OugRfM40Wv5XllbQyi5pnn8kdsbq7wLySAwDMbCws
         1g+ihagtolisQQrRV2YSuEgalmNktUK3dYjMB+g6jRESg0SGhF283g4L0n/iufweUG3d
         +uTNUdG2mViA2zMcPm2fSytrpw8xx2/JxcvYrLzry1V+S8yh7mtko2F9ULtIHOES7Xlg
         jArQ==
X-Gm-Message-State: ANoB5pl81eo9bbXgx1VeJg9kC2sNCOY37b/Nmf0aLFiAP7ffl/X+zXD1
        R9hJgFL3yPjkqnvfgisSMXKSFQ==
X-Google-Smtp-Source: AA0mqf4+Zek9Tov+SKx3s7/VKFuRhbRwGPPf2pj6BxCr9D6CuqD2m1NUJkKSuVjJ1ijnEZQWQbp+qA==
X-Received: by 2002:a19:f010:0:b0:4a2:2e81:9be5 with SMTP id p16-20020a19f010000000b004a22e819be5mr5860494lfc.486.1669017870905;
        Mon, 21 Nov 2022 00:04:30 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a25-20020a056512201900b00492dbf809e8sm1908442lfb.118.2022.11.21.00.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:04:30 -0800 (PST)
Message-ID: <50024f2e-4820-ef78-d54d-5bfe53ccac7e@linaro.org>
Date:   Mon, 21 Nov 2022 09:04:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 02/14] dt-bindings: media: rkisp1: Add i.MX8MP ISP
 example
Content-Language: en-US
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221118093931.1284465-1-paul.elder@ideasonboard.com>
 <20221118093931.1284465-3-paul.elder@ideasonboard.com>
 <ca8a6070-3888-8d42-5974-d7c2adc62417@linaro.org>
 <Y3h93cLdEvMzInXe@pyrite.rasen.tech>
 <238f7bf8-578c-5bb4-9f00-50f36334c5cf@linaro.org>
 <Y3sIAHqd8Kd/XBB/@pyrite.rasen.tech>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3sIAHqd8Kd/XBB/@pyrite.rasen.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/11/2022 06:09, Paul Elder wrote:
> On Sun, Nov 20, 2022 at 11:36:31AM +0100, Krzysztof Kozlowski wrote:
>> On 19/11/2022 07:55, Paul Elder wrote:
>>> On Fri, Nov 18, 2022 at 02:06:14PM +0100, Krzysztof Kozlowski wrote:
>>>> On 18/11/2022 10:39, Paul Elder wrote:
>>>>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>>
>>>>> Add an example to the rockchip-isp1 DT binding that showcases usage of
>>>>> the parallel input of the ISP, connected to the CSI-2 receiver internal
>>>>> to the i.MX8MP.
>>>>>
>>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>
>>>> Missing SoB.
>>>
>>> I don't quite understand. I see an SoB right there.
>>
>> Laurent did not sent it. Did you run checkpatch before sending?
> 
> That's why he's on the "From:" in the beginning. checkpatch says it's
> fine.

Ah, indeed, checkpatch misses that feature (it's part of Greg's
verify_signedoff.sh). Anyway, your SoB is missing, as Laurent did not
send the patch.

Best regards,
Krzysztof

