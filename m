Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A01C8689610
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 11:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233571AbjBCK31 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 05:29:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233103AbjBCK3D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 05:29:03 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF2F9A80A
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 02:28:17 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id ba1so143178wrb.5
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 02:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vfuhgXfiuM4itbEp0wsMDuwUE5taCY5Of7R2crb0yls=;
        b=QtIo7hDwypMjs1ayHveLxUXphvWeSI5xwcGI/n+VKQ9IqXhhG4kcwGtXUu/vRjf/od
         YUr3BKqkfPGf3+L0btpgnfP1w982LkuxjlH+XmMd1PZRbp7e1g3Q6O0T/fLPh4U7NriA
         iYwhC0QqVuw/7ZZ9sT8wF8049G5DzVRnMLecvaN+x6/YlCrReoEsShptM+q68h6qMx+E
         qVMNwqZw40XxL7KUEItpO6nrdPUrF5HSSkJxOHaQi/DZNEMtEpXuR61tw9HAl6GH7srK
         eaYOVNItctUCnUS6itvN5bpcHWCSIGoafNAZFkgni/UkH1euU/swa5pRH3+pl5AnFIBN
         teDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vfuhgXfiuM4itbEp0wsMDuwUE5taCY5Of7R2crb0yls=;
        b=gyHyg2jKcs0vyd5WnYrRvajZnujafrpoG4lQSBKgik4TL/gWfsJBov7zHIz6WwBRHF
         ecKnM/tNKwgRY7c3ZXZXihbmyb2OuGtd0u3spyLf0RGbVw4JzC/qvp155T00eNBF5akW
         KkP9yOQsd//NY5k+g/QhivZHWIJA35eXyUndMTlh2tz8/JMQ1S337Keiq02IB28Lip+l
         bbdlh8qaiVvKh8BhjbiDKOvSAy3Z9+AZXrZaQIjgnVKxSo/agAub9eTgJXIr0MgzgduS
         GKnkQpvaj5jP76N93D+y1iRG2P5gaSd02jy4yrbpnPrOEEYCOoOyVnh+aCA2hDEX7k6+
         s5GQ==
X-Gm-Message-State: AO0yUKXAZfMgcWucuPvhdEBiYNfjoAfBbgG03dnHaXDAQF3qbd0uvBl3
        GU6V83aJXUO57y21DuXaCQuArA==
X-Google-Smtp-Source: AK7set8OdEktKa6eSHIzDj43RE/IqiWzVM0PL4mNk9djNsAS4aAuappLZqr8yfR9XQnFX9wZNCZpVw==
X-Received: by 2002:a5d:4530:0:b0:293:1868:3a14 with SMTP id j16-20020a5d4530000000b0029318683a14mr7126925wra.0.1675420095568;
        Fri, 03 Feb 2023 02:28:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y3-20020adfd083000000b002bfbda53b98sm1640251wrh.35.2023.02.03.02.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 02:28:15 -0800 (PST)
Message-ID: <d43b44f7-fb7a-1443-af7c-07bf059dcde4@linaro.org>
Date:   Fri, 3 Feb 2023 11:28:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] media: dt-bindings: media: i2c: Add imx327 version to
 IMX327 bindings
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20230203102439.237527-1-alexander.stein@ew.tq-group.com>
 <20230203102439.237527-2-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230203102439.237527-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/02/2023 11:24, Alexander Stein wrote:
> The imx290 driver can be used for both imx290 and imx327 as they have a
> similar register set and configuration. imx327 lacks 8 lanes LVDS and
> 120 FPS support.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

