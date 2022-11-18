Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1851D62F584
	for <lists+linux-media@lfdr.de>; Fri, 18 Nov 2022 14:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241782AbiKRNGV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Nov 2022 08:06:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241697AbiKRNGU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Nov 2022 08:06:20 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A0D78189
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 05:06:18 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id be13so8129664lfb.4
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 05:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SM/Hr9HQlKz57Vtwanp4K4Ls2OlF5cSrPv62Ff71hFg=;
        b=BOBUo5yrSXCso4IIRkcg0o2teW8R3OqiUdLBb/m9b3VJ7Sh5+1gdMnp9pOxXnvd+Yn
         jeS6rOMnYc39Qv7akYw16hE8G+rbBHmShmzV8w4wkEK7LDeUWinfdYLU+LaeLoWQoUZQ
         pI+ZvbcLP5PTS8crCbDRSpjzftHj2eT9RRVk19z6/eVK7fbGk9Okpvh2RH9ftj6H2oCh
         ho/ium4pBWQlacbK/QGRn1rhqlUiuw3WqXiGsfJyZ3sB2XYYBmgH6qjw0My9EbG308PF
         of1sU8XAEEUtv/fOBo22tjrmNKJBQfGuLFLLLYC0E/Xc6JPrvWI+SVEf0Iv+0lrwdkVv
         72cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SM/Hr9HQlKz57Vtwanp4K4Ls2OlF5cSrPv62Ff71hFg=;
        b=N5ian4Dkzl43+Um5QpAH5YxEtOPP5qauCEI8Mv5PWLWR5uqng+7+KgwAHOwC/47Tw5
         CsGNd451eIf+ssxQrHak04ug3fQu1nMcjHVS/XRdaTHhLbinWPCuunCP0XK0uSeyMQLN
         QazGJLlmP86WoROt8p2cTMD05uP7TXG7zzAf+lrZ4/Dsv921H+BO9te+2Bl9qQbIh+so
         Lgfyik2Jclw+EVS3tXtcDuZQEN84QFyf2ff7qN403cAJH/fc4UNL+0vSUF56CC6i+aFu
         Bk+oXggsKnhdhpgd7oaWN98UvIHdDvvEHiUzpoHgL/WcEp5FbtvKwaGgfdxRUdZVSd1A
         TQXQ==
X-Gm-Message-State: ANoB5pm6lLxory9l0eyxPDMPJ4M2U2ToBMudBLvxovTwiG4TjVuoy4Zv
        YMuh98KVS6B6KXlE9fuH+77mUg==
X-Google-Smtp-Source: AA0mqf6Eg4ax1bzTHnu/VGLZTHQlm5c/vZt/4qmejF5rjXEdKZfMIwO0spdeu5nCwA4sLgFgaXuX8g==
X-Received: by 2002:a05:6512:3daa:b0:4a2:ba30:a9a2 with SMTP id k42-20020a0565123daa00b004a2ba30a9a2mr2231992lfv.689.1668776776803;
        Fri, 18 Nov 2022 05:06:16 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bt26-20020a056512261a00b004ab2cb8deb5sm655889lfb.18.2022.11.18.05.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 05:06:16 -0800 (PST)
Message-ID: <ca8a6070-3888-8d42-5974-d7c2adc62417@linaro.org>
Date:   Fri, 18 Nov 2022 14:06:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 02/14] dt-bindings: media: rkisp1: Add i.MX8MP ISP
 example
Content-Language: en-US
To:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221118093931.1284465-1-paul.elder@ideasonboard.com>
 <20221118093931.1284465-3-paul.elder@ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118093931.1284465-3-paul.elder@ideasonboard.com>
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

On 18/11/2022 10:39, Paul Elder wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Add an example to the rockchip-isp1 DT binding that showcases usage of
> the parallel input of the ISP, connected to the CSI-2 receiver internal
> to the i.MX8MP.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Missing SoB.

> ---
>  .../bindings/media/rockchip-isp1.yaml         | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 

I don't know what do you demonstrate there... usage of endpoints? That's
the only difference. Such usage is the same everywhere, nothing specific
to this example. You already have two examples, so I don't think this
brings anything more.

Best regards,
Krzysztof

