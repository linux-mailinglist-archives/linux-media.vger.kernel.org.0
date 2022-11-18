Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1A3962F8CB
	for <lists+linux-media@lfdr.de>; Fri, 18 Nov 2022 16:04:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242400AbiKRPEJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Nov 2022 10:04:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241571AbiKRPD0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Nov 2022 10:03:26 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FCCC97AA9
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 07:01:38 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id be13so8626869lfb.4
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 07:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R7TWkSJ/hx81gtV+a6PhaVBLJKsxYQYqI5eUl3Szinc=;
        b=j/3MVELwdtussoOTiXKys6US9Dr5tQo0SoTGQn8bGvxWrz0tFuxmQ543ppCgG+kN30
         Z3Pfh8duuB/4uykPkPVgjAz/8k7m+E+ITaL5Hga0Cws7BtdrNpA/Mm9OhPmFfEC8sGly
         Vw1mX1v98hZbJKQkbLg84eIRNLZn1H+hmAVNRC76+4zld5gY85vbYG77+dYQ7O7FTzN/
         kttgS1GafDIjwY76OzhNYd3qZaZD3OO7Yrx8sv2Qg+sBFgxcIbzXPotWBeNvqz3KH6x3
         uFNf2f0zICpU/NZuYUPznYGuSxSVrTAtOBZfra7pLxrn+5arIGhlKNKYCvs2X+v+rnRH
         arIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R7TWkSJ/hx81gtV+a6PhaVBLJKsxYQYqI5eUl3Szinc=;
        b=nirlMZO08NjPn1rXfERkoa3vjv872Q8Lw8rY/5esGNtWvA4+yMt+vwHId19NfF45jA
         mNu2A3KwFbIyO7c6DIXTh8ZQE4A+NLhhGy225fOcYoL5RRMQdDKWN7rHV9qo7CpW94re
         /03kWzAF7pwoZIT9e4yEE2HbnC4xvIYQ1z7OAKaWCphUvGlzGCfz+Wf//u0MWxvWb/c9
         xe3VCjE7aRhyjUyVwtiHnWjw976Mi+6bjaXe9/WLrksTWox4pGsmnTQ6qeEwXpxNVva+
         QexsHywGBZ7+WQR2gRmYqyJOeupsa61Cb2beEplqoSGhkknAziDwv1iDKTI4WERVEINl
         thSQ==
X-Gm-Message-State: ANoB5plXEhFTDCZ++8xklvL4l3S2CgFatt6Z6H5WFWPfjVvNfbyhqJC6
        y/+8frLYwPOUhoAfbDc1ScvKJA==
X-Google-Smtp-Source: AA0mqf48B7BNJlyBwsNIX6Pen1gn7zinZSors3wc73qrZIvgC8vJw/vtgG5rZ5N/qRtYBkDzU50VhA==
X-Received: by 2002:a05:6512:15a6:b0:4a2:3d2c:34ac with SMTP id bp38-20020a05651215a600b004a23d2c34acmr2427522lfb.41.1668783694993;
        Fri, 18 Nov 2022 07:01:34 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n25-20020a2e9059000000b002770d8625ffsm683071ljg.88.2022.11.18.07.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 07:01:34 -0800 (PST)
Message-ID: <c2d8521c-25ff-d411-1a7b-eefc2ad5957e@linaro.org>
Date:   Fri, 18 Nov 2022 16:01:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 12/12] dt-bindings: net: convert mdio-mux-meson-g12a.txt
 to dt-schema
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Eric Dumazet <edumazet@google.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
References: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v1-12-3f025599b968@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-12-3f025599b968@linaro.org>
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

On 18/11/2022 15:33, Neil Armstrong wrote:
> Convert MDIO bus multiplexer/glue of Amlogic G12a SoC family bindings
> to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

