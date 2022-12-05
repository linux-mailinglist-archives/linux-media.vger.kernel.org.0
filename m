Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1A7A642437
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 09:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbiLEIN0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 03:13:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbiLEINZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 03:13:25 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E388FB7D7
        for <linux-media@vger.kernel.org>; Mon,  5 Dec 2022 00:13:22 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id m14so17340120wrh.7
        for <linux-media@vger.kernel.org>; Mon, 05 Dec 2022 00:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9HQObmrwSMX8vA4JHKJaj2b6CjK14qWpD9rpN9nU90U=;
        b=hH8EH4emacWt/i3dinMgGS8nSqTXKGuNzRdVns89xp9lootuIhBo2OtYbrD8lkN1nC
         My+UVHjJw/oudKcISaxuAMfMeXv9FW/cX5R/Vkd4B1O5WU08dx8bw7PBC+kidyn/bINY
         qZi5EgJQD3FezXn6kyyA4EJlsO+b7YSOUK7A5lZrlCP9/CHrKE+R1EnIkfjwppZsZBQT
         4KFTZWay7o3jQZ1jVQsjLLUyGtdXHx1XVkRvxjI44hT/vnfsNMlzAMnEWZWTfr8cl61h
         SdxwhsbqUnqud1MpVoNIX6o7ozKyrgJU3rXXWjygMst1MvcCv7RojdyVlzk6dj08P93d
         bo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HQObmrwSMX8vA4JHKJaj2b6CjK14qWpD9rpN9nU90U=;
        b=bgQQxnKEhKStkpju12a17FekoKFyd69HdeeZABcarR0cMlngKBo9VN8gVVaFyG3wiF
         tb5r86vGopTiWjTXIgVmj43T3UAhoLQhJoYXxzaNPhdxsgHk1rCXuE4AgXK7kptTJq21
         VWN2KJwyD75X/oLnm0mDVEQHObv7GtRiDr73vSsSIzPihLw+62kBPiQj2fFeJmGODo8g
         QGKSZz8JP+8dfb0jSmKlQoFjvHDOvDH5FYwGVzuRO2/Qe5egRS+3ExOXZxcUyvUtir6K
         aYhvwxWsF+SpK3r9R+3d1I0xr7LGV5fIfXewtSUJ3s1YYNQ+vsJQMPp8H/KPeVcME4aD
         91aw==
X-Gm-Message-State: ANoB5pk4c8fjU/akFOrrrNj1Vlcrns1nysbTh7tbYx8bnWaS0eou3Rhv
        caobkRECnAzp6DASjRwgDzQAHg==
X-Google-Smtp-Source: AA0mqf7ai5wgiIRIYciqsXgXnPof4ogfREHeWVAWQiK2meZ1Z7k5m4sdbH7en5NgAmqIhis69vieQA==
X-Received: by 2002:a05:6000:1c15:b0:242:28c9:d112 with SMTP id ba21-20020a0560001c1500b0024228c9d112mr15235142wrb.294.1670228001367;
        Mon, 05 Dec 2022 00:13:21 -0800 (PST)
Received: from [192.168.7.93] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4402000000b00226dba960b4sm13376083wrq.3.2022.12.05.00.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 00:13:20 -0800 (PST)
Message-ID: <b258ce94-627f-c029-6aa5-3723a87c0002@linaro.org>
Date:   Mon, 5 Dec 2022 09:13:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/9] media: dt-bindings: amlogic,meson-gx-ao-cec: move to
 cec subfolder
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Joe Tessler <jrt@google.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/12/2022 19:29, Krzysztof Kozlowski wrote:
> Move amlogic,meson-gx-ao-cec.yaml bindings to cec subfolder and drop
> unneeded quotes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml     | 4 ++--
>   MAINTAINERS                                                   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>   rename Documentation/devicetree/bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml (93%)

<snip>


Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
