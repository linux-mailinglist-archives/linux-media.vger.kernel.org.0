Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD93E6B6551
	for <lists+linux-media@lfdr.de>; Sun, 12 Mar 2023 12:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbjCLLRL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Mar 2023 07:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjCLLRJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Mar 2023 07:17:09 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B2F552F52
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 04:17:03 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id r15so10721581edq.11
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 04:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678619821;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7PQjpVSue/gNfeNfD9HHuuByfCFQTB2uuqttkHsv0jw=;
        b=d2IkCTqJyjeTdIu/RCS52Uniz5j64CG2xoJfR8R6I7puWT6Ojs8vyoQ9ws7eIFkC04
         5DLXB+vr0IC72zm00cESOSs3FgOBHmqJoaDRT6eZuHFLjWb26NkePHOzPFBD9tmsPodi
         BCCk6vwpOnHRsRE4wzvX/hU77AIwthmppkVNI0qDU7V3/QPFSaaKtXz9ulLCjwCMK3Wu
         Gbs5WUoj1iM0LbsrTO/Eit6+ZXFy9nAtn/QxFcBDUqm1N89xKLq98htzpEPAcuMAuMl5
         tvFKyV5BhtxEnvbgadA6dZPlGUJzc5M9EFhYC4uI9gQwmpncCW5Y1ZAq256sweDzc3gn
         8Uaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678619821;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7PQjpVSue/gNfeNfD9HHuuByfCFQTB2uuqttkHsv0jw=;
        b=1qwKdQ5nWHCkKi+XWx0DLTnFb18KnXndiXsMwj0WJI7OgFwSvqHmJ27IZuij8Cb45u
         EHpGyEvsJc0D25npx9il/HgeUENBTEdFghdgCe5BRix2f54qi4PTIHEj0kYsITuSuVKP
         KZBONSmumRVahNVjlr5RK3Z2TejXH+Uy7Za2HdeIl1L3tg1RUuV3dClTw6HdHzEhpuko
         iN7/Y7vB4M7Eh6ZGZGJWyo6oRJRV7zAQxAQL1liPv8f+DOwP7mmALZBEgpoUHNq/QDH+
         AU/IcRn2JYaQg8fSDnRDtxrB0U4Oa0SjrLnNOfF9xz+xEU/x4gN39XUH708Bf+sRFjod
         lhdg==
X-Gm-Message-State: AO0yUKWjTcl2gw7vFr23SpyErqk1IwvwUCBI1AUh51ZLGqv+zZALc0yc
        d0MzLyRwLFOIXWExd50Nq28Y2w==
X-Google-Smtp-Source: AK7set/21COv897lR8+4XiRVPEdQ3m0IFgrbTdOH5QOmvBhEpahARKwTBWYNOElhBeDkRuJNWLJx4g==
X-Received: by 2002:a17:907:c706:b0:8b1:7ae9:647 with SMTP id ty6-20020a170907c70600b008b17ae90647mr28338443ejc.76.1678619821842;
        Sun, 12 Mar 2023 04:17:01 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id y30-20020a170906519e00b009236ae669ecsm1205235ejk.191.2023.03.12.04.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 04:17:01 -0700 (PDT)
Message-ID: <e0bcfe7a-6b24-3543-318a-86c1d7a60f12@linaro.org>
Date:   Sun, 12 Mar 2023 12:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/6] media: dt-bindings: cadence-csi2rx: Convert to DT
 schema
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
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eugen Hristev <eugen.hristev@collabora.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, changhuang.liang@starfivetech.com
References: <20230310120553.60586-1-jack.zhu@starfivetech.com>
 <20230310120553.60586-3-jack.zhu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230310120553.60586-3-jack.zhu@starfivetech.com>
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

On 10/03/2023 13:05, Jack Zhu wrote:
> Convert DT bindings document for Cadence MIPI-CSI2 RX controller
> to DT schema format and add new properties.

As pointed, first conversion, then new properties.

You also need to test each binding before sending.
Best regards,
Krzysztof

