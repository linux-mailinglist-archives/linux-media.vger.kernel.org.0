Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34BC16D292F
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 22:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbjCaUNA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 16:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbjCaUM6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 16:12:58 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7282A21A88
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 13:12:53 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id br6so30358939lfb.11
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 13:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680293572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W+uWv75XiB4mBucvJIcwW49wtD9v2TTnt4a+oMwIFE4=;
        b=Xg6yMKc5hYIjfEnwT/NV4qgHjBrbe/PSCJZRlW113qJKyh5fbKCIdSEc2pcG+e1sQO
         Qe9tby2Uj6khA5xTAHjHx9XWYilAELP4BY0j9xcTdDuMuwZQKaziNi/1gxiwHhuYuHpW
         n6X6C3uxbUPbqYAMUmPq9HG3mQlAIArP9ahcG9rRXOcQlZSfanNsAMH82cbHI0ARtgEG
         2zf5kC36KQvR1tUOv18z1KHhpkpL4HJfPcqH4iRtZ7qSTVSkeGASV64NPIqP7xQ37Aaj
         1apEwcQkc264p2obUif7w84RA1IBUq8b4JNPMC29k7el0zO5fCs4MljSY4Ot//MhRQxH
         OoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680293572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W+uWv75XiB4mBucvJIcwW49wtD9v2TTnt4a+oMwIFE4=;
        b=4YaNrujOmKZTersWp3B/c/0NtemwVYS27yTNr6Qo4KQqDF1hcYoz4y+qpuA/Rupvch
         +qW6FUHbx2YRGBdHBhn7RGu9Qng6rGLHRcoA4ea03c/Rvjn1a0EoKXBXCjuAVn+JRDyq
         MwbIsVB3cAmI9knJ9spjfSqSc9eFm8RMkjpUvc4YEKxS5qxbH8K1EU3AHYqs51V+eyyW
         wCG/M/cFdRkyl5DwqSrdN7D5Koa0VDabIHKMijNpsJyPA4o9Ku6+9T9achgh9Civo2SI
         g9o9ijwpKD33huLIU/NkRHowyXA9xZwuI1p+mcv8Qg9wynZZpz/BZV7bG+4FFoAX8znU
         9SSQ==
X-Gm-Message-State: AAQBX9dkSivmjn5FWr6xU6z28TIgg1QVzVA3lhc90K62rrqyMGezcGoE
        /U1f/mpM6pQyQVKFp02QEK6U0w==
X-Google-Smtp-Source: AKy350ZjNRpO7ZsLarEjsUNUZhd8Cqj/NoPi89xnmmcG48ZEddfd7nsiQrgrD52K85CqfrG0aQq4tA==
X-Received: by 2002:a05:6512:38a9:b0:4b5:7a91:70f5 with SMTP id o9-20020a05651238a900b004b57a9170f5mr8321498lft.63.1680293571740;
        Fri, 31 Mar 2023 13:12:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d20-20020ac244d4000000b004e844eeb555sm495715lfm.214.2023.03.31.13.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 13:12:51 -0700 (PDT)
Message-ID: <fb72b6fe-bcff-5c1f-50bc-3af0d5731398@linaro.org>
Date:   Fri, 31 Mar 2023 22:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 4/9] media: dt-bindings: cadence-csi2rx: Add resets
 property
Content-Language: en-US
To:     Jack Zhu <jack.zhu@starfivetech.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eugen Hristev <eugen.hristev@collabora.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, changhuang.liang@starfivetech.com
References: <20230331121826.96973-1-jack.zhu@starfivetech.com>
 <20230331121826.96973-5-jack.zhu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331121826.96973-5-jack.zhu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31/03/2023 14:18, Jack Zhu wrote:
> Add resets property for Cadence MIPI-CSI2 RX controller
> 
> Signed-off-by: Jack Zhu <jack.zhu@starfivetech.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

