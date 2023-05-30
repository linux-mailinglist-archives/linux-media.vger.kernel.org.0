Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B70D715853
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 10:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjE3IXv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 04:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjE3IXu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 04:23:50 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782D7B0
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 01:23:48 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5147f4bbfdaso5240719a12.0
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 01:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685435027; x=1688027027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TEsCzUKSiWVPPeknX8+hByIEVhGsGzHD1pGEFygRlm0=;
        b=yHkjqm6ZHURHd1iLB6RZaj1hr/1jGTO4fLwdJmhCGxP4nAi0F+82GDhjBlxu/x4awz
         EC6P93u/SwhmNHuqMhQ20RxC/hbCTgh83UUE0AFMNtj09Z4WpL0yBGsQNlvn1f/xcLRS
         ctLNZTr8h16/XgeEKXi+uR4AC2id7jw2sBkyvwS686gjIYasDH3F5y6iztqiCb6LM/mg
         2o7EA/ubDoW0/+rboSm0KnLsWaOaEI6+5+pDWLM/KH6Ye3+Hou33RWfDQYdWs7gHhiCu
         0Kq24zjtRqpRf2NR1I4Xy9IBYHX+QUhmYTj26SXbO2J2D1kOPJfibzxpCT5DbX0aZkmM
         cT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685435027; x=1688027027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TEsCzUKSiWVPPeknX8+hByIEVhGsGzHD1pGEFygRlm0=;
        b=abo5vAaSBZKTh+gfeVI/E2wNTN/+O1dTUavt+DS621wMBnG6N3wUorHFqqaWVbyQYd
         GZhMqk5L5JAxhK4Ukd9wpFuilskV576dlGx6GtrxTdghYQOKDRRHgFmPUVFwl4W4+Vcz
         ilU7spF5Nbyz4p6b73NEvr6mW0DhbLTxQXjN+T5XfKps3FqvGq4Gi8duC3UEdYFEkcXc
         1E+BUA4tqYf4YUYlcceC49Af07wAF8T64BQ//jgFm6pwsYm5fWmrr8ZGsb8afmJJeXpU
         +mDAAYVVaoPY4UiPiktIcEBRDiQhtCInh353YHN+8SgVpMGUEm5a5F9u38A6aJ3H/kaB
         XrSw==
X-Gm-Message-State: AC+VfDxNg3wEMTHHAgVWejWQMD/mNl7Qzqyi2C0d73DA4Dm9pYOCQbqp
        bhgMHYUPTxWmUSSTbpLtZEfc8Q==
X-Google-Smtp-Source: ACHHUZ4zcOrrGMPmlUr6NKJLi2DZ5iSiufjm7KVQzwH4izaGU1dSOp48sGNxfFgbWF9FA9U83053Zg==
X-Received: by 2002:a17:907:724b:b0:96a:316f:8abf with SMTP id ds11-20020a170907724b00b0096a316f8abfmr1563256ejc.20.1685435026889;
        Tue, 30 May 2023 01:23:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id le8-20020a170907170800b0096f803afbe3sm7026896ejc.66.2023.05.30.01.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 01:23:46 -0700 (PDT)
Message-ID: <df3a0493-5602-a015-4fb0-d27e938f6003@linaro.org>
Date:   Tue, 30 May 2023 10:23:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] media: Revert "media: exynos4-is: Remove dependency on
 obsolete SoC support"
Content-Language: en-US
To:     Artur Weber <aweber.kernel@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230519182853.3836-1-aweber.kernel@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230519182853.3836-1-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/05/2023 20:28, Artur Weber wrote:
> Support for the Exynos4212 SoC was originally dropped as there were
> no boards using it. We will be adding a device that uses it, so add
> it back.
> 
> This reverts commit 2d41a0c9ae51ac363d107f2510022106e7234b33.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

