Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50F50652458
	for <lists+linux-media@lfdr.de>; Tue, 20 Dec 2022 17:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbiLTQLi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Dec 2022 11:11:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233028AbiLTQLg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Dec 2022 11:11:36 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17EB72DF9
        for <linux-media@vger.kernel.org>; Tue, 20 Dec 2022 08:11:35 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id y25so19293804lfa.9
        for <linux-media@vger.kernel.org>; Tue, 20 Dec 2022 08:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4OPu185Q0+akxyPV8Q2zM2VcNp2VyoX7hjbTkMDLjNA=;
        b=MLr0HIKRQZqoRZ78fC/VihpPBV8UTSHsUHNZoeJiDyKbp8xpDzVFUz5wAMjhGwTD5J
         QpUW3E/lJJ/YzE/FVbv0CGDl4uFyt+nymKPo2zhgLinE2Lc8L3FiAP0bILUUe2GKb4uo
         JueXkX6I8F7NyUo73gGMyUa2I45HSthxUjbZo2zTyXeKeZAzu5DXHUNBS6Gctd1+T8Q4
         qwMyWzd3fa8uNahKQFQS8LECl16xw6kaLt/y+QafLf6WUnaC6GnHm8eJpPq5MGdyQlzn
         F6XiVOp6BcG74A8cq3u8s5MrsO0RqCXRO8ynhkcPlMr5ZkREeLX7GcS4h2tydCTZ+Q1K
         9iMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4OPu185Q0+akxyPV8Q2zM2VcNp2VyoX7hjbTkMDLjNA=;
        b=L01W7WrC7z9dnfx9aqWNju8T35IaOHzsROQcnfIEuDzrAImQ0wZ/FsSWQx/NQMqGTA
         AhSllReHaD5O758NwtyxGzFL6Is2iytD525r6jSE7b5ZP2GMr5+ejFKGW3hUCN0NwdMZ
         K+JVRMoDYnGTtwVVD65v1Wt1cBeQTQezn9B4wUIBPUmmjMthmcKbHZRLcNWxKJK3tPPb
         fHjAn3Y7HdoydTCoFNzYjYX8xqyFYDSazmKmoUNrRvyQLT5Y7ULizGC+7SsBuC+wb9Yi
         xB2X8rWNgfYJR2XAozashdup8UruAkVMC/FDabSK0KVDd5254v6uUjEUrXGOe3hDofda
         4oSw==
X-Gm-Message-State: AFqh2kp+p4f1c/7xR0+4YjbgNOTLk02SsISU+3vZmqAsVUgzx1ezT7UW
        6axbsckbxbXUvggGO85lMRsh6qU0L7z4ruMJ
X-Google-Smtp-Source: AMrXdXslAPY7XyfhFtimUpegXKFxo4fzvFsxFhl4uTujqL2DLM10DmkgXmu8w7QZbjikyIW034Cqcg==
X-Received: by 2002:ac2:4e90:0:b0:4c3:7634:234c with SMTP id o16-20020ac24e90000000b004c37634234cmr3780393lfr.57.1671552693487;
        Tue, 20 Dec 2022 08:11:33 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a5-20020a056512390500b004b5ab5e904esm1519306lfu.306.2022.12.20.08.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 08:11:32 -0800 (PST)
Message-ID: <44a62c49-1894-aee2-63fd-05b2e70a8aef@linaro.org>
Date:   Tue, 20 Dec 2022 17:11:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v9 2/7] media: dt-binding: nuvoton: Add NPCM VCD and ECE
 engine
Content-Language: en-US
To:     Marvin Lin <milkfafa@gmail.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, andrzej.p@collabora.com
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        kwliu@nuvoton.com, kflin@nuvoton.com
References: <20221220094055.3011916-1-milkfafa@gmail.com>
 <20221220094055.3011916-3-milkfafa@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220094055.3011916-3-milkfafa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/12/2022 10:40, Marvin Lin wrote:
> Add dt-binding document for Video Capture/Differentiation Engine (VCD)
> and Encoding Compression Engine (ECE) present on Nuvoton NPCM SoCs.
> 
> Signed-off-by: Marvin Lin <milkfafa@gmail.com>
> ---
>  .../bindings/media/nuvoton,npcm-ece.yaml      | 43 +++++++++++
>  .../bindings/media/nuvoton,npcm-vcd.yaml      | 72 +++++++++++++++++++
>  2 files changed, 115 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

