Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2635BABB2
	for <lists+linux-media@lfdr.de>; Fri, 16 Sep 2022 12:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbiIPKxs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Sep 2022 06:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbiIPKxU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Sep 2022 06:53:20 -0400
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE9EAF4BB
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 03:33:33 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id az24-20020a05600c601800b003a842e4983cso15606697wmb.0
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 03:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=lEm28T4aiukFj/jkOyJ/N1z4ZyJd8w2mvne3ZnFiHNg=;
        b=IEN8i+yAPd/f+hsdfXcFUDKh+gFqVy3qWI5xvBGkd73lTfZdOGaOjQzcLHtFGQQHVY
         jpbgZgOW/d7e4SUl2JBvJtkrKYgrdfdFbhIT32ecCqkpM1B5v14m5UKK3LOXMmqDYHGB
         TtKvW0kBBcIKKTQz/9ruHl4Jb5ooMEOY5agR/5jHPPEwU17PfCaJjN8qZyBzlLMQf3aQ
         7sx39Jss0gVpzP/pYJ5MnJ5W/YczeGkBPu+V0iljyYa9u91zQOYR2iCwI7IjRyORxnQz
         Z9oBOEJW1DDlyEnju0EZxtxCb0oxbZSXyRzM2Hw+K42JBQ1oNA72wpCERFFhPH3u3YuY
         yilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lEm28T4aiukFj/jkOyJ/N1z4ZyJd8w2mvne3ZnFiHNg=;
        b=PxvHznvY0O1PEltwRuScF5sUyvAZdfQ2TYz6ZzCy/TxWYi5oWHChev8U9zIugHX5dL
         opfIbm2ISx20EzXXG9XSHL5t+7cJr/0BQdawUu97FT82PfTH4q+ckwWT47uCigquKQUu
         YY8AqdxfB+efcEk/WuQig7LkrL88XO4elFIUva51oDWxURdcrnFBTj2jkfYbuQCHVd7q
         SQfraduuEjJ7gkEqznxuZ1dfbGDU8U+0D9m0wd1xT7A5yPiVMQga1PVs83K5wgb0kMpo
         qu3Bg9Hd6U/KCXCnz4ggIyUw3c7P9OjG8sRitN1cnYrNFrA2ekt3HHn1Tb8gdNXXOihz
         UTfA==
X-Gm-Message-State: ACgBeo0HTBqDRgMVkYHimtuDfjC3x5EvGskLFeL+589/f64SBiTT/SKu
        GkY5hTFiAyIz2konMMrh7QY+jw==
X-Google-Smtp-Source: AA6agR4GhmwLDzJhDGKWyU6qvAUsmcDKMpVKTynu1xNvIu9OwasG3Ddi3IpZk2qTkIBvVxJT59oYqw==
X-Received: by 2002:a05:600c:3493:b0:3b4:9a0e:b691 with SMTP id a19-20020a05600c349300b003b49a0eb691mr9691352wmq.123.1663324111900;
        Fri, 16 Sep 2022 03:28:31 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.73])
        by smtp.gmail.com with ESMTPSA id z13-20020a5d4c8d000000b0021f131de6aesm4553655wrs.34.2022.09.16.03.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Sep 2022 03:28:31 -0700 (PDT)
Message-ID: <7a01b1cc-6d00-715c-1e21-b8836a64a9a0@linaro.org>
Date:   Fri, 16 Sep 2022 11:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] media: dt-bindings: ov5645: Convert OV5645 binding to a
 schema
Content-Language: en-US
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220913160224.14951-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220914214132.GA2173@tom-ThinkPad-T14s-Gen-2i>
 <CA+V-a8ufbsiz3p2n3LmYxES2aJYN9y8byF9bSyckNFz=fB-5LQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CA+V-a8ufbsiz3p2n3LmYxES2aJYN9y8byF9bSyckNFz=fB-5LQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/09/2022 11:24, Lad, Prabhakar wrote:
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - clock-names
>>> +  - clock-frequency
>>> +  - vdda-supply
>>> +  - vddd-supply
>>> +  - vdddo-supply
>>> +  - enable-gpios
>>> +  - reset-gpios
>>> +  - port
>>
>> I think we don't need all of these properties as required.
>> The only "really" required are:
>>
>>   - compatible
>>   - reg
>>   - clocks
>>   - port
>>
> Agreed, it's just the driver requirement hence the previous bindings
> had marked them as required.

Please mention the change from pure conversion (with reason) in the
commit msg.


Best regards,
Krzysztof
