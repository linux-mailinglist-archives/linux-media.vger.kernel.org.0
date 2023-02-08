Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65DB268E98B
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 09:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbjBHIIZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 03:08:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbjBHIIX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 03:08:23 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5312B3EFCE
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 00:08:20 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so812468wmb.5
        for <linux-media@vger.kernel.org>; Wed, 08 Feb 2023 00:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f0Yeqw+n9auIMr3bZDWbX/X3qmlRuGI6vJxpumVLIG0=;
        b=ifQIbB7eWE/eET3ThPwbuLSN9zuI/7UV7B6xci7/WHSWDDSx48jhqcOdfHxYwOz2ku
         itnFfWIJ3U+BVh9TyAMYK5Bu69q7ZAXDL59cZnEgc8yk+G97U1XL5NiVKlLzYWysFCg6
         U9deWu9AKefCpOzP5geqkxvv8gUpB39fZOjpttxzd/K3oTYyplqN3oUKcA6XKs5jCvK2
         l/krEa1RxzBKhHTqH/AfmjI1Aq+Fq4xXV0zmmxi00X8VH4SnzRd7sazuPgFjmIxPFCT1
         NKgb2An0CP9uR+l9la6feJRCmebEw8II6ujHKsFCOV3kxZxU2yA5rhi5tUWfzoLLua+v
         33Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f0Yeqw+n9auIMr3bZDWbX/X3qmlRuGI6vJxpumVLIG0=;
        b=7IpCKgTt4wSDy8WdPEv0KdQ75DrCEQziGeKkLGoCuCCcKJ8OB6My/GeSgxE3QbO/Dl
         nIVnL4mRD6Lc/MZp8YV/xnxCdnrLwKG5fJDtkhWj2zDnri+WMrJ8ixagKt4FNImJZtWJ
         puNwpIQPXmsfaHgsxlok34ZqsERUGr/4lRT/l/uJ+4t42I7ZWsGoa48PKWwYGE+h4ev6
         b/c8rjS0LamdzodTV1dcO88MGsJtZXe6we6O4oADFpmrCFKMxY9PYlN+lzqtO5aSKnK3
         cdfTsQ1zqXWjI3r1MpX2A3fVh19ooJadohailTy9sjolRAXoOujwL23csljW/1U9RBgO
         JS4A==
X-Gm-Message-State: AO0yUKXCsGDK1JtSPRlE2zHY3TEeXSJckzgX/XHCdypGDKAxMcflaRDo
        q5FB/3MB5YEIVuteyq+NJpOU6g==
X-Google-Smtp-Source: AK7set/mDAP4cMkma8YGcwY/ReGVaN6v04q3dXB7uoeNcRNFBwi4qnCaq91TpMMKIFauTosYb5JmFw==
X-Received: by 2002:a05:600c:1606:b0:3e0:39:ec9d with SMTP id m6-20020a05600c160600b003e00039ec9dmr5857039wmn.23.1675843698667;
        Wed, 08 Feb 2023 00:08:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i12-20020a1c540c000000b003dc5b59ed7asm1118546wmb.11.2023.02.08.00.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 00:08:18 -0800 (PST)
Message-ID: <0473dd66-aa96-917e-44e2-836ae6706b6a@linaro.org>
Date:   Wed, 8 Feb 2023 09:08:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v11 4/5] dt-bindings: media: i2c: imx334 add new link_freq
Content-Language: en-US
To:     shravan kumar <shravan.chippa@microchip.com>,
        paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sakari Ailus <sakari.ailus@iki.fi>
References: <20230208050915.1958183-1-shravan.chippa@microchip.com>
 <20230208050915.1958183-5-shravan.chippa@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208050915.1958183-5-shravan.chippa@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/02/2023 06:09, shravan kumar wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
> 
> Add new supported link frequency in dt example.
> 
> Suggested-by: Sakari Ailus <sakari.ailus@iki.fi>
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

