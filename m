Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E63376329B9
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 17:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbiKUQiV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 11:38:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbiKUQiK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 11:38:10 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0381263E
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 08:37:37 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id j16so19626541lfe.12
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 08:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yquKd/+C/UCb9Wx1X9kmh9bk1zhikVgctumO3cxTp+M=;
        b=GBTUCoy3KbjBxM8qLtFqbw2A5yzNQCZwqnQqqHaz0NJV35PuCm+40Ulbgu4t37yzah
         C0GTiBdW7YxGvKEQGmArF1qxU7J6TOM+BcNhcinihQYNTksIaBLsEUui+D6oRQK0Kb2U
         tQNQ6TxUSgW6RKmtGoxa5wqqqRlwDD3OuMNY8zdj9jzaILsyNL+M0ZfjBvukcgh9JkNm
         fp8tNi4b6Ojbe9lEBqGN0KIy2K6zTgzlZNZDl4StUzarAOzsvQUnIVK59/xKrFVn3HR4
         Hrx4xA8SOiHG7Um3LPSYQ8N+Zw1n0qo7U/wNnQkeiZdGCChFTd5WMD3BCOKaI7bzLX+4
         yk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yquKd/+C/UCb9Wx1X9kmh9bk1zhikVgctumO3cxTp+M=;
        b=o/qMtYay1gLIY0MJkvpznaaCnrJnHUFsY10L6GZjgPHffOmwBy63Nl3e/ZTO9xbWge
         X1IKWTg+2Uphmn2cQxT99ukYaRvTLgYejkaquBMmXSDVZrfmHN+B4o3VFRYdpXyGmV4Y
         fOaKCMCd/+lYKyJEXgC3lDtDOb7FZEuJaR6gVSj/KA8tKxkLLIjbKbC3BvnoYMN0qrIh
         dqqiGVQoJt9QpXpWVmo3AKc1g5ubQHLTvYMbbRViPBybdp7qSgtvmw0PneX0Xn7M1qa8
         aXz3fbGPD6LpFAtT0aTdbNVFCCIKa6nbVKNJ9vBXcZOe2qZH2Qh3m3iNtsXcrorDdjTz
         jNbA==
X-Gm-Message-State: ANoB5pk3wyG5Luw9CXLQf1w1CiNopY/88gf67UPAvnKHFOzSdOH6iNDX
        fkyOcXbHg6H67h08OqrIxzMg9w==
X-Google-Smtp-Source: AA0mqf61zb7LVWVFiXYgePuvTBilgt5ZI6ENoPIud/cfMOz3ytRCkcgZRLxdUVRqVMWrSKpCNmSkGQ==
X-Received: by 2002:a05:6512:3694:b0:4a8:d22c:4e60 with SMTP id d20-20020a056512369400b004a8d22c4e60mr45081lfs.552.1669048655404;
        Mon, 21 Nov 2022 08:37:35 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h2-20020a056512220200b0049771081b10sm2074417lfu.31.2022.11.21.08.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 08:37:34 -0800 (PST)
Message-ID: <bc9577d4-5aa2-625c-ec9c-e3db98130a46@linaro.org>
Date:   Mon, 21 Nov 2022 17:37:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 02/14] dt-bindings: media: rkisp1: Add i.MX8MP ISP
 example
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
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
 <50024f2e-4820-ef78-d54d-5bfe53ccac7e@linaro.org>
 <Y3tVKOEfxdZ+Klnh@pendragon.ideasonboard.com>
 <9389201b-22d4-1229-7e26-5f046d18e15f@linaro.org>
 <Y3uCN59bBwTw6dc9@pendragon.ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3uCN59bBwTw6dc9@pendragon.ideasonboard.com>
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

On 21/11/2022 14:50, Laurent Pinchart wrote:
> On Mon, Nov 21, 2022 at 12:16:41PM +0100, Krzysztof Kozlowski wrote:
>> On 21/11/2022 11:38, Laurent Pinchart wrote:
>>> On Mon, Nov 21, 2022 at 09:04:29AM +0100, Krzysztof Kozlowski wrote:
>>>> On 21/11/2022 06:09, Paul Elder wrote:
>>>>> On Sun, Nov 20, 2022 at 11:36:31AM +0100, Krzysztof Kozlowski wrote:
>>>>>> On 19/11/2022 07:55, Paul Elder wrote:
>>>>>>> On Fri, Nov 18, 2022 at 02:06:14PM +0100, Krzysztof Kozlowski wrote:
>>>>>>>> On 18/11/2022 10:39, Paul Elder wrote:
>>>>>>>>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>>>>>>
>>>>>>>>> Add an example to the rockchip-isp1 DT binding that showcases usage of
>>>>>>>>> the parallel input of the ISP, connected to the CSI-2 receiver internal
>>>>>>>>> to the i.MX8MP.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>>>>>
>>>>>>>> Missing SoB.
>>>>>>>
>>>>>>> I don't quite understand. I see an SoB right there.
>>>>>>
>>>>>> Laurent did not sent it. Did you run checkpatch before sending?
>>>>>
>>>>> That's why he's on the "From:" in the beginning. checkpatch says it's
>>>>> fine.
>>>>
>>>> Ah, indeed, checkpatch misses that feature (it's part of Greg's
>>>> verify_signedoff.sh). Anyway, your SoB is missing, as Laurent did not
>>>> send the patch.
>>>
>>> I thought adding an SoB was only required either when making changes or
>>> when pushing commits through git, not when forwarding patches on mailing
>>> lists ?
>>
>> Anyone touching the file should signed it off. You cannot send it
>> without touching (e.g. git format-patch).
>>
>> https://elixir.bootlin.com/linux/v5.19-rc5/source/Documentation/process/submitting-patches.rst#L397
>>
>> https://elixir.bootlin.com/linux/v5.19-rc5/source/Documentation/process/submitting-patches.rst#L420
> 
> The second link states
> 
>   SoB chains should reflect the **real** route a patch took as it was
>   propagated to the maintainers and ultimately to Linus, with the first
>   SoB entry signalling primary authorship of a single author.
> 
> This series will (eventually) be upstreamed by me through a pull request
> to Mauro. Paul's SoB will thus not be needed. Of course you have no way
> to know this when reviewing the series on the list.
> 
> Adding a SoB line when taking a patch in a git tree is standard
> practice, but when posting unmodified patches to a mailing list, there's
> more of a grey area. Look at
> https://lore.kernel.org/all/20221024113058.096628238@linuxfoundation.org/
> for instance, posted by Greg, but without his SoB.

I have no clue what Paul modified here what not. I am not going to
investigate and I have no way to actually perform such investigation. I
cannot verify the source.

The case with Greg, is indeed surprising, but I could perform the
verification, because the work is both public and in known place.

It's expected for submitter to certify (c) from the list which was BTW
expressed also many times during many reviews by many people.

Best regards,
Krzysztof

