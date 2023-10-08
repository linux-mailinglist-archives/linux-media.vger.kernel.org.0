Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFAA7BD0E2
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 00:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344876AbjJHW0Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Oct 2023 18:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344437AbjJHW0W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Oct 2023 18:26:22 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D1FBA
        for <linux-media@vger.kernel.org>; Sun,  8 Oct 2023 15:26:21 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-405361bb94eso39356775e9.0
        for <linux-media@vger.kernel.org>; Sun, 08 Oct 2023 15:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696803979; x=1697408779; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E5F6Ic134Yi1iysyJ6K232qeqhgAgSXNQ9anlaFp7+o=;
        b=vp/BtA35HUCXhFv1symXXPDLhdZ6mZOEsEXQPQzAt0n8aoWbQTWQ+z0dsZ6Bx9a3lf
         Hy7PDKdvA4/U3JDpqrUBJ11wb1LGd66K/1lLXkJvYLf5Hgwg+mEf1UPKEb6rxpFFQane
         TwWi+ziNH/baQdFbYT061V4+kjplDeh8XWNJF9UNHbCiwSowvS/b3kvvtdr11qb5Sv6Q
         O25CLXjSyoWEdMIPN+sUT7ouKLINxgj1xrFyLxqBoSm0AJgaTYvb5FOf2Px2/NhIIj1M
         NF9bNY54zS8zyvYBaVQ82ov9XvPceTfubMhDBw16DDVXREaiqOjXp2Z5/Mn8oYhgxzwH
         DVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696803979; x=1697408779;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E5F6Ic134Yi1iysyJ6K232qeqhgAgSXNQ9anlaFp7+o=;
        b=P9x3gdEmZB8JZGJKuXWJnk1Kenuq3crHEEZgKsqddyOJZ3KPjkFbhhVUxrf/3dKeVM
         WIsB+LEBfPacJgXk1xS07SgcWQ4Qhht+4/xulXt57gXFVisd5tmieKWBa8jTuZx6zIg4
         hJW1CFjmGNmp/VUYlBPye7MnuZKUv3UfwRU0xBK1g1dciPpud15FJqpvldbO/Q9mF4np
         983ckw/MxqRwskLN2goRh0ANb4mrIthJU/uOhw4lkwndjaO3EdbEwfiy39S5bshtfyNu
         xe+En2FvY7dpmshBBkQddXjkuSLYBxcyMP9VL60Q9LJx7DUAt6VOyLwuhlZZBkDi1NB6
         B/OQ==
X-Gm-Message-State: AOJu0YzVmkBkcoCCxjLM3nPF5rBgrUeA9IGY+8iO91sSnXI4iNNwf49u
        S8ES1pA0ASCskl90PRu3HNgP0g==
X-Google-Smtp-Source: AGHT+IE5Bwgw8Sv4XEbdHISWjLI6mywdMuzfaBhCFQkF9GkEp3SmKfDb1yrC+EDJeeO0eM6jYnFsqw==
X-Received: by 2002:a05:600c:468d:b0:407:4944:76dc with SMTP id p13-20020a05600c468d00b00407494476dcmr1947380wmo.20.1696803979357;
        Sun, 08 Oct 2023 15:26:19 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c294500b003fc02e8ea68sm11615535wmd.13.2023.10.08.15.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Oct 2023 15:26:18 -0700 (PDT)
Message-ID: <18716c6a-93ea-43d5-ab55-43b3b86920ce@linaro.org>
Date:   Sun, 8 Oct 2023 23:26:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] i2c: qcom-cci: Add sc8280xp compatible
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     agross@kernel.org, andersson@kernel.org, loic.poulain@linaro.org,
        rfoss@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        todor.too@gmail.com, mchehab@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231006120159.3413789-1-bryan.odonoghue@linaro.org>
 <20231006120159.3413789-3-bryan.odonoghue@linaro.org>
 <b8f2d7f1-16e2-4e6a-9c84-37da393f74a3@linaro.org>
 <20231008212824.cs6e6hc7zur67v6k@zenone.zhora.eu>
 <4fdfd283-234b-4c14-8db1-3feaf1fa8618@linaro.org>
In-Reply-To: <4fdfd283-234b-4c14-8db1-3feaf1fa8618@linaro.org>
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

On 08/10/2023 23:13, Bryan O'Donoghue wrote:
> On 08/10/2023 22:28, Andi Shyti wrote:
>> Hi Konrad,
>>
>>>> Add sc8280xp compatible with cci_v2_data parameters.
>>>>
>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> ---
>>> Drop this patch, it adds nothing useful
>>
>> what about the rest of the series?
>>
>> Could you please be a bit more explicative?
>>
>> Thanks,
>> Andi
> 
> I think he means I can use the sm8250 or sm8450 compat string, which is 
> true.
> 
> ---
> bod

Tested, compat sm8250 works fine.

---
bod
