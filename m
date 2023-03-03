Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 674176A92F6
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 09:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbjCCIsD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 03:48:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjCCIsC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 03:48:02 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77179EC43
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 00:48:01 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id a25so7624654edb.0
        for <linux-media@vger.kernel.org>; Fri, 03 Mar 2023 00:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677833277;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1o8Z6knbD9JeBO0oaE7g0z7HQCbcSRqmQSyWUB8EgVs=;
        b=PXVdQZGWAli4fKq44IVxwmlxQcwpcO3r4t33vEicvy4ceXFxc0FjR8vTSzZt+6oNfM
         oP/mjd5H563yfZRNXJ+cXxZfVe4TegFWPegJ+puEouxeoeoUiiu4k0lJmRMciczqZev7
         uyOzA/fKZ5JSjmYY5mb6XpSrBnQaCIft2/fE/0ZlSnnPSA0TAD7jwG4at18gSarfzQYl
         13JDvE9nAuSjw9Szc1LgVfPTmulReZOnaBWJflmJPMbUZ8spFEo/MBAgKSGQZ7csufzY
         ncUPRxlcv9x16xn6dl2lFcBpB9WxsogEQ2WdXslKc2HaXVh6MuPIYN22X5MpgcSjWsHH
         CwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677833277;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1o8Z6knbD9JeBO0oaE7g0z7HQCbcSRqmQSyWUB8EgVs=;
        b=wurdMJmOsmTyxCktOKgwQttmcjaGrFzMX7057kiDphMGNK0lR+g8CiTfMtSR24ipga
         rbj4y5R8KZf91dztzfnTQQwsKKVBCNLpVWNSelP6yurmNhcjLoCK3SHLkl+XF2c67yc4
         t5kxVURZZDQ0bk6Kd669unL384QT3RkGefkcVQoRrqG6NoZ9zqIwiYh3EiiBU9o4Ln3A
         8OGtYg5w4zv5L8vFqzlPtu09Lps/MdsihXyuGbV6cydWJLXC6zpVXt3peGw8bf45oZzu
         EelolF9oyPeMOIUNG2lc/XjNHc1bwuXJuPH5//7r97VBb2aoHGVKy14EtXzqrLQIE8P2
         728g==
X-Gm-Message-State: AO0yUKWkoFtZW7/hvm65tdtMmbwnK1iy/FMXNg1GgiZYFSblFsuF8CkG
        tFbDUHFBdMQ4feE7EYTlc60NvA==
X-Google-Smtp-Source: AK7set+r4Cvg3dl/xH9EUbRtdz8piEI7wRJtm+cjqTrkuGuTCIVx8rB5BT/XjGCoUkgTr3cQlUa70g==
X-Received: by 2002:a17:907:7604:b0:8de:e66a:ece9 with SMTP id jx4-20020a170907760400b008dee66aece9mr838215ejc.24.1677833277235;
        Fri, 03 Mar 2023 00:47:57 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id gq11-20020a170906e24b00b008dd2db45c0bsm704839ejb.105.2023.03.03.00.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 00:47:56 -0800 (PST)
Message-ID: <11e7c986-e6cc-ee57-b36e-816af8cc11a7@linaro.org>
Date:   Fri, 3 Mar 2023 09:47:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 02/11] media: dt-bindings: starfive,jh7110-mipi-csi2:
 add binding docmuent
Content-Language: en-US
To:     "jack.zhu" <jack.zhu@starfivetech.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, changhuang.liang@starfivetech.com
References: <20230302091921.43309-1-jack.zhu@starfivetech.com>
 <20230302091921.43309-3-jack.zhu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302091921.43309-3-jack.zhu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2023 10:19, jack.zhu wrote:
> Add DT binding document for Starfive MIPI CSI2 receiver

Ehh... you have entire commit msg to explain what you do here. Yet there
is nothing mentioning that you actually have Cadence MIPI CSI here.

Since you decided to add new bindings, you receive review matching new
bindings. I don't think this is correct approach (duplicated bindings),
but could work for me. However how are you going to solve all the points
of my review?

Best regards,
Krzysztof

