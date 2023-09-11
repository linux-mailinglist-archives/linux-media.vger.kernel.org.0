Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC3279BCD7
	for <lists+linux-media@lfdr.de>; Tue, 12 Sep 2023 02:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233162AbjIKUrp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Sep 2023 16:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236424AbjIKKf5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Sep 2023 06:35:57 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56351E69
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 03:35:52 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-403004a96eeso21295785e9.3
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 03:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694428551; x=1695033351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JICgtmzSx3A3sw4lszmURcgW45ozMuUqwQZUr0okJA8=;
        b=dkb3dzrEdgG/vrK19cJoqkXzo5FgFpuPfTBmuXEQWMGAWu4pBOd5d3scFfd4+4BmNW
         4peh8CyMcnYozEByRtCUnhO7HxQ2UgW2sIiMuG6lzthSdxUu7L54WhpXzLtxKnOczvTy
         nhzk5wABAiKP8J+lk+Je/uMF1woGtpkBZzYeq3XFb//Sl2H8wrb/dy8tIKoI2nQKX4e2
         yYarjfHcl02KLN9R4ISNRGaWUckiPzMw6SLc2W1bJvn9GJLhOXeWcZNOB0zoB1+rM0x9
         xrDrEbcwwRsDv4IWAASXGxMZyEh4tjEQ/RRRup3MBUMtr+slKNN+rEG7fmS5ggwEI+fP
         n6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694428551; x=1695033351;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JICgtmzSx3A3sw4lszmURcgW45ozMuUqwQZUr0okJA8=;
        b=bXZwq62qMMfIKOyc2+gDD92QudNqBOudpXZqluBYGC6zmDcZzU4q9mPASiPFlnZEbf
         M7irxKRcrnUtr/dTsYzh7O7xI6Z7kXwIf0uxfzGyHRjZ1UFDlcjwtLElj2RrNC91EmM8
         MPD5rchBrzGQehpyD730dN+8pOINshAet4EkSzMD3HiWR18BY9LlKkqPC/bIDfdSnYuN
         3SBWCTpGcClC97j7JqsPQSV60eNi07s1N+dl5yv1eaGn5w6wOyiCvM7Kevjj9dhWRHZD
         1hJWqoISdP9AtIymUFNTRVIVrjvcw/aYcn5zXKdQKMCxSmX6+GR4RTopBe2Ft0KLayrO
         staQ==
X-Gm-Message-State: AOJu0YxkJACkq56HF6WUaM+I67Lw43hKaQDlaqn87SdHK8DkCl8+xT0m
        a/KCHAC30SZYSvyJRtaR1EBKBA==
X-Google-Smtp-Source: AGHT+IGff+YWwMOAgjM4jE/gO9Kp635uN5sQ2rd7db+HH+so6nO/c2Endv8ktQ7dGp2lnz+UJs5kWQ==
X-Received: by 2002:a5d:64a1:0:b0:31f:a7dc:40fe with SMTP id m1-20020a5d64a1000000b0031fa7dc40femr2288749wrp.20.1694428550754;
        Mon, 11 Sep 2023 03:35:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:daaa:8bc3:eeb7:ce8? ([2a01:e0a:982:cbb0:daaa:8bc3:eeb7:ce8])
        by smtp.gmail.com with ESMTPSA id t3-20020a05600001c300b0031f07d1edbcsm9742911wrx.77.2023.09.11.03.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 03:35:50 -0700 (PDT)
Message-ID: <13456f9f-3e3c-4cad-baab-1f7d094a5712@linaro.org>
Date:   Mon, 11 Sep 2023 12:35:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: (subset) [PATCH 0/3] This patchset adds IR controller driver
 support for
Content-Language: en-US, fr
To:     Sean Young <sean@mess.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        zelong dong <zelong.dong@amlogic.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <169442559302.3235506.15361466537260729684.b4-ty@linaro.org>
 <ZP7sKdvAWQQSrTmX@gofer.mess.org>
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
In-Reply-To: <ZP7sKdvAWQQSrTmX@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/09/2023 12:30, Sean Young wrote:
> On Mon, Sep 11, 2023 at 11:46:33AM +0200, Neil Armstrong wrote:
>> On Fri, 25 Aug 2023 19:53:07 +0800, zelong dong wrote:
>>> From: Zelong Dong <zelong.dong@amlogic.com>
>>>
>>> Meson IR Controller supports hardware decoder in Meson-S4 and later
>>> SoC. So far, protocol NEC could be decoded by hardware decoder.
>>>
>>> Zelong Dong (3):
>>>    media: rc: meson-ir: support rc driver type RC_DRIVER_SCANCODE
>>>    dt-bindings: media: Add compatible for Meson-S4 IR Controller
>>>    arm64: dts: meson: add IR controller for Meson-S4 SoC
>>>
>>> [...]
>>
>> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)
>>
>> [3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
>>        https://git.kernel.org/amlogic/c/dc8bc779feb5e855421215384f23de90a4fcd622
> 
> Would make more sense to have all three patches go in together through a single
> tree? I was about to apply all three of these patches to the media_stage
> tree.

There's a lot of changes in the S4 dtsi, it would create some merge conflicts
if it went into the media tree, if you can take the 2 first patches it would be perfect.

It won't break anything to have the DT merged separately anyway

Neil

> 
> 
> Sean

