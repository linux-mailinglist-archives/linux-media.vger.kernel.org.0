Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE84E62F578
	for <lists+linux-media@lfdr.de>; Fri, 18 Nov 2022 14:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241788AbiKRNCg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Nov 2022 08:02:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240700AbiKRNCe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Nov 2022 08:02:34 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB9D6207F
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 05:02:31 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id r12so8132606lfp.1
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 05:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cwwjinAwnI9JP7ipWBIl6FuQzSRiSFJbqcKk9ONdIpQ=;
        b=obPz4JjmPLeKv2oww2oR7ZLdXYLjLv2XxsQO9UxHebHp3oh+VdB1163aABgipfa3Vh
         X05N/8dS0AsPadRJwlMwoHwlfnOHow88Me0ghANAoPFkFUDsPAHSM+IJG0G5LEpbM3b5
         erjJ+lPbNCVqKHnLcXbYODFo2IUJYq35ylTV1HoW56UVYLtxe68oJ+Gz1x27IvRfaohY
         XYOTQwgZ3rS/gH9z3OJhUUH5Png5T1zWdB2pVmo4GobT+L82BnUn3q/SJjcRpktx/QYO
         dz0fAUaOjeV9yHuNfe4sm0kqX455N+rGglD3+01u05D1XES/iUlJE3V4ps39SHFQGZL6
         HTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwwjinAwnI9JP7ipWBIl6FuQzSRiSFJbqcKk9ONdIpQ=;
        b=5e5jnxrIyp0kNbRevU7MiGeU1VATd/7Jok4OEPSLQ+DYIn0pwRwoAhkKCVRh0uLJYh
         EuIEaXJD0vOXlxozUAtFCynRjQ5+E3Q99pMuWnfs/j6Wqis6tYAVRX81DndUPwrrfv/4
         eiQaJBo9Q8/0rsuC8L9ZDPJdBh3N7/zPWOJN/TclciR7YFnV2uLheXZjKQp4UMLoiKLx
         owV69BHnKAK17dnSfH1jnTEskIF7Nh4UB7GpwP/0yTGXVLsRE6Wxbe4snt88OKwoO/ov
         D2lbEep+ZW5/iRdKyuiIp/IbhZ47Sy7XI6+jW/RFW9S5rNRJ6CsVh+SrzMy2dN8jp0+/
         g/Bg==
X-Gm-Message-State: ANoB5pkXTFpOgF5Jhr7j1IBUNgQ1rGtQ6Wrm/UjIYYqmPyb8ZVsqs9pM
        1GBtWDQVXTGaNYcnPcqyMKl4ZA==
X-Google-Smtp-Source: AA0mqf5iRqFuX0lxx+NC9PbVCESfhII3uH8SJo25riWa6ALefKjdFE/nEDLQvFCDKiQ3DjJbBr/hlw==
X-Received: by 2002:a05:6512:23a8:b0:4a2:4df9:4cad with SMTP id c40-20020a05651223a800b004a24df94cadmr2246808lfv.429.1668776549574;
        Fri, 18 Nov 2022 05:02:29 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d5-20020a196b05000000b00499b1873d6dsm648454lfa.269.2022.11.18.05.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 05:02:29 -0800 (PST)
Message-ID: <feb97479-3c1b-9fd8-ffd7-f8e95151d8fe@linaro.org>
Date:   Fri, 18 Nov 2022 14:02:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 01/14] dt-bindings: media: rkisp1: Add i.MX8MP ISP to
 compatible
Content-Language: en-US
To:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221118093931.1284465-1-paul.elder@ideasonboard.com>
 <20221118093931.1284465-2-paul.elder@ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118093931.1284465-2-paul.elder@ideasonboard.com>
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

On 18/11/2022 10:39, Paul Elder wrote:
> The i.MX8MP ISP is compatbile with the rkisp1 driver. Add it to the list
> of compatible strings. While at it, expand on the description of the
> clocks to make it clear which clock in the i.MX8MP ISP they map to,
> based on the names from the datasheet (which are confusing).
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof

