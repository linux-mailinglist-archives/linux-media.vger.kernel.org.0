Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD23362986F
	for <lists+linux-media@lfdr.de>; Tue, 15 Nov 2022 13:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbiKOMQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Nov 2022 07:16:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238066AbiKOMQ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Nov 2022 07:16:28 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED0961FF8E
        for <linux-media@vger.kernel.org>; Tue, 15 Nov 2022 04:16:26 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id d6so24093858lfs.10
        for <linux-media@vger.kernel.org>; Tue, 15 Nov 2022 04:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rw1sjbR71GpDX4+lhHk1yLaScEbbe6ryeafI3CiJP10=;
        b=tR3w+a+JPTo0vZAk4sSj/mNTKv+ZhOTcOtCx2+3qEkMteQ3XTVzYbbKnLZLDmXNQZm
         EpWwiKYR7wHiNnFffVMVMw6i/SIXUy6yohd81DoWzdGvds6PL3NO/qTsBfqLMYhwbcPv
         +sLgujjc/1qTpymQnm2VbB4NjDWm6oZP7PTKtPAGtlgIFU1P3IotJ+Yg720TvfvWK5LY
         So997eksu3gD1Yrl5CpB2+flKWypWap7lE2wGRgW5DGu26fYiFHytTfTK5NYRcUtI4Rt
         OndCqUCzEim7UJBrC8EzWWZ93vwXJ8uYvAvn6KlHwiXbfEJU14Zda6YMkqNoUA5y05u3
         YGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rw1sjbR71GpDX4+lhHk1yLaScEbbe6ryeafI3CiJP10=;
        b=L6oV7vS8tztC2jRrgm9+eEMAL8gq4fdpVjeLvMWHs7nVp3Jnr8qoUg/byh4MR68zj6
         H75bNNnPp9lW8XhkMK8ET7Qu9BEaQIx+6+hW6IsUa+Xolp7QAA7a+CP1DrPCdhywK5zO
         Asy8M5HIACZo5c/TTg3FwYFdp0XaTb/Z2ZOWtWXZpEt6DWp9058d/W2qsRxVK7C4B84R
         OnBJUEL/+ndjLi6x6muwSyipc3LV63NkqEnx2TB6Z9GnEpBRJnFpMmAttrvj55F4UUbh
         5y8nZhUsVsGPsmfMnmGcWdxYAcD0d+XXTT46WlRLEvN1Gcqinc1+V8GZhyK43y1yd6VE
         oIfQ==
X-Gm-Message-State: ANoB5pn+DGmRD0BOMU1l0aLLkh09gXYL1ljcc2v6kuUbpvYNd8qjt+8e
        xU4JtFtDXEcKRynLPUi73oQ6Ow==
X-Google-Smtp-Source: AA0mqf7VWxyl1RZKscxhjDznC/kqYEwrVwdbg5fIWlrY+D8kHURt5sGT6UffK1OwKrikT7PXoa0dPA==
X-Received: by 2002:ac2:47ea:0:b0:4b4:1324:6ed3 with SMTP id b10-20020ac247ea000000b004b413246ed3mr5262252lfp.19.1668514585345;
        Tue, 15 Nov 2022 04:16:25 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u11-20020a2eb80b000000b0026dc7b59d8esm2482225ljo.22.2022.11.15.04.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 04:16:24 -0800 (PST)
Message-ID: <35bb9f38-d89b-77c6-a546-f575da5a79f5@linaro.org>
Date:   Tue, 15 Nov 2022 13:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 03/23] ARM: dts: tegra20: add label to nvidia,tegra20-vi
 node
Content-Language: en-US
To:     luca.ceresoli@bootlin.com, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Richard Leitner <richard.leitner@skidata.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
 <20221109141852.729246-4-luca.ceresoli@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109141852.729246-4-luca.ceresoli@bootlin.com>
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

On 09/11/2022 15:18, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Useful to enable it from a board DTS.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Adding unused labels is not useful at all.

Best regards,
Krzysztof

