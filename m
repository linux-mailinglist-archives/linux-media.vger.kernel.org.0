Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 959BC65A633
	for <lists+linux-media@lfdr.de>; Sat, 31 Dec 2022 20:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbiLaTGD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Dec 2022 14:06:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbiLaTGC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Dec 2022 14:06:02 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0573E107
        for <linux-media@vger.kernel.org>; Sat, 31 Dec 2022 11:06:01 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id b3so36236537lfv.2
        for <linux-media@vger.kernel.org>; Sat, 31 Dec 2022 11:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jIySvWkaHMhvHNet3xt7JxoPX9peCF4NsB4XrthbUdQ=;
        b=DqhzdZ8GMGONjk1/mTp01nVTS73jara4hArPcV1nK4bXiYc9TbLAiKNZt4Q46wLOk3
         kUHVSzEfgAcdS6QoYjWNP2xExsCibkI4td+Z5kxheIMrxM9HNsJ04aQQyn+bFksXompC
         ZtkhNHUXgLBKEcUICB4qz6yqnrbPza3Ksaz5GJ+iDSp9b3gFIssULh1nr+83YqAgkRkJ
         EHPniaYDfdhwqccTrNmJ0ma/NUu/qFZcYHIsrePpconOOeQxnZn21Rc4uKx2ZaPAtECN
         Tg/UHmUXAMxMzNKxPghUA/NQ3uEsw67KOrlk1e8tOQg9ZBmlUnkGqRh0Yip6MAX2JIcf
         mLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jIySvWkaHMhvHNet3xt7JxoPX9peCF4NsB4XrthbUdQ=;
        b=LAHrQaF3lKm5l3vv9+On9kY7y0IpAQ4fej2Th4aQ/0uY82jMcGLtyu5Hcdn0sbx+o/
         QIQLIYpFm3JwkimmvFo8P5V7w0G26r4FvpDt9tv2WYLejaRkOfiBA2u8eleDOcP+LhKi
         nsSfx4jngIOrE4+eStxuUxzXBZx9wLUsz6nSDPjG236+y+Z7AibfJVuEXeYV55yq3XM1
         INrZScyU4qE99dbsnjTRZX71O8nt4t4l75sLLFAwLKeSPh5fdWB4qm336hCGKf42zEEE
         7vepGJdlZjlMJwonb+dK78igla6pP8Ma358i7MuD73DQxC/CKJlAY8kWtRfnkDul3Zh+
         +Qpw==
X-Gm-Message-State: AFqh2kpc0CX5QadXB8vqz0fbDqHn6a+I148Jh/mDng0D9O5H6534Sm4t
        a6zyiLACkk6qpZIubWwVwTczww==
X-Google-Smtp-Source: AMrXdXuTfgdQbhaGaIjJutw1ngrQ/aadPT4CRRlOEuJUlZU1qHVVzJzumSK1QyfcO5SFZUTpCaL1Gg==
X-Received: by 2002:a19:f001:0:b0:4b6:e4c8:8a48 with SMTP id p1-20020a19f001000000b004b6e4c88a48mr11142739lfc.63.1672513559388;
        Sat, 31 Dec 2022 11:05:59 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o11-20020a05651205cb00b004cb34b81150sm80316lfo.282.2022.12.31.11.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Dec 2022 11:05:58 -0800 (PST)
Message-ID: <ea18d873-29a2-2311-d10f-ed3f82d2a46c@linaro.org>
Date:   Sat, 31 Dec 2022 20:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/4] media: dt-bindings: cedrus: Allow power domain
 references
Content-Language: en-US
To:     Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maxime Ripard <mripard@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-sunxi@lists.linux.dev
References: <20221231164628.19688-1-samuel@sholland.org>
 <20221231164628.19688-2-samuel@sholland.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231164628.19688-2-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31/12/2022 17:46, Samuel Holland wrote:
> The Allwinner D1 SoC contains a separate power domain for its video
> engine, controlled via the "PPU" power controller. Allow the

"PPU" is not a nickname, so just PPU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

