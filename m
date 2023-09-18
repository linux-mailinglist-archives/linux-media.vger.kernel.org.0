Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D04B7A4924
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 14:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241647AbjIRMEU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 08:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241833AbjIRMDu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 08:03:50 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B1211B
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 05:02:05 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9ad8a33fd0dso560307666b.3
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 05:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695038523; x=1695643323; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8T6FNJ4DGR+EO/eOaGg3eeWJKhttb/eQEueA78daWfM=;
        b=K1/pM9QMGWrqrBanRB5f6XxiqjLFgTEehWXkwvzE7wYCNDrprg8rqXRxQNr7m2gYVY
         3NtcFuwh5x5BxfktfxmUAG7Ribdffqg4yqn+xBlFUyC+3rXRRvO4OgN5qQzGARbYqsjZ
         VlpTQiReMQCERva5TFXM7sZJ1OYrzpJfLfqGOlAevsEWf7BCLGe3mecOMCtq45FBmiGm
         HgZSWeKRunLYAmO0FO6x14dPJarqD4LpFEcDupOt2V4JXRwDyiRMRcRg2YdqQbCB9Ft5
         8iP8HgbjDm4he/l/Vezpn09UR8hhBv+QznpK7XGwSZ+aE6RZB2PAZLoEfzr+bOpWgyPp
         xeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695038523; x=1695643323;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8T6FNJ4DGR+EO/eOaGg3eeWJKhttb/eQEueA78daWfM=;
        b=ne9KrZJtCwUfAsNz+eYWzIO++eat+ptop+ptpZ9pA7d10I9RfIaOS1cV4mH1eW6kq/
         oX8CRQS6nFKroKohu9J5omhkOLmFsXVnqQKmxy2Y3kcRnoeGzYDz7+BEygVarnw31Kgr
         icUkd2dETwO8b6b4RoaJJLWPnnHgOt9bTkdItu07L6YUOOgepv9KDAxgDMRKM+LpJNnX
         LdSK5e36osYtKoKsdtFlH1Iu/Yx8qJQVN3Eng3FpQTuoPMQt/V0t9NlpNtA3Hjg9f2un
         aDXZEder4hxIGauNWF2zZbIl7eBl/4lj8VlR6XkqJnxXH0pt4nSm+tNUnrZTfYccS1Lk
         gE9Q==
X-Gm-Message-State: AOJu0YyKOCFPZgX8E4FjXUAsb1SyHvzR1FQJeAKek/UE4938ernd/9Ab
        RWM1ylgia+xtyGgKRMxg+CDQrw==
X-Google-Smtp-Source: AGHT+IF2j7vwi1KLyY+HPonMPC3u+1IG0HjRNp5JP8MCpwOwGpIXy55B6BL7aY0Mbg+YgcW2Ksw8Mw==
X-Received: by 2002:a17:906:74db:b0:9ad:e3f0:f335 with SMTP id z27-20020a17090674db00b009ade3f0f335mr5490892ejl.70.1695038522988;
        Mon, 18 Sep 2023 05:02:02 -0700 (PDT)
Received: from [172.25.80.114] ([217.67.225.27])
        by smtp.gmail.com with ESMTPSA id cf20-20020a170906b2d400b0099bd7b26639sm6416526ejb.6.2023.09.18.05.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 05:02:02 -0700 (PDT)
Message-ID: <6d87034e-6727-09fd-60fc-10f8ca47f85b@linaro.org>
Date:   Mon, 18 Sep 2023 14:02:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v12 6/7] dt-bindings: media: wave5: add yaml devicetree
 bindings
Content-Language: en-US
To:     Sebastian Fricke <sebastian.fricke@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nas Chung <nas.chung@chipsnmedia.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jackson Lee <jackson.lee@chipsnmedia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Conor Dooley <conor+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Robert Beckett <bob.beckett@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20230915-wave5_v12_on_media_master-v12-0-92fc66cd685d@collabora.com>
 <20230915-wave5_v12_on_media_master-v12-6-92fc66cd685d@collabora.com>
 <30384744-94d7-2675-63ad-d8531e3156d1@linaro.org>
 <20230918064954.iuomunsckduawiay@basti-XPS-13-9310>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918064954.iuomunsckduawiay@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/09/2023 08:49, Sebastian Fricke wrote:
> Hey Krzysztof,
> 
> thanks for your review.
> 
> On 17.09.2023 09:56, Krzysztof Kozlowski wrote:
>> On 15/09/2023 23:11, Sebastian Fricke wrote:
>>> From: Robert Beckett <bob.beckett@collabora.com>
>>>
>>> Add bindings for the wave5 chips&media codec driver
>>>
>>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
>>
>> So this is v12 and still no tested?
> 
> I have tested it, multiple times actually since V11. (For some reason
> that indentation issue slipped by me though ...)
> If you mean the tested by tag, the patch was completely unnoticed until
> v10 by the community, which was partially because me and the previous
> commiters didn't use the right recipients for this patch. So from that
> point of view this is more like v2.
> 
>>
>> A nit, subject: drop second/last, redundant "yaml devicetree indings".
>> The "dt-bindings" prefix is already stating that these are bindings.
>> Basically three words bringing zero information.
> 
> Okay so:
> `dt-bindings: media: wave5: add devicetree`

Still not, because devicetree is duplicating "dt". It's redundant.

Instead should be (with correct order of prefixes):

media: dt-bindings: wave5: add AzureWaveFooBar XYL ABC10 (whatever
company and full product name it is)


Best regards,
Krzysztof

