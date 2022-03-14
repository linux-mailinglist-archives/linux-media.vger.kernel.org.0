Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9E244D7D28
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 09:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237438AbiCNIGL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 04:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238871AbiCNIEp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 04:04:45 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF491F605
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 01:02:35 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id b19so111259wrh.11
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 01:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=FCTa1MEHZ8RflaCaL+Kv3IB7oupUyUxIYhWpI7cZElk=;
        b=CPYvO7CXsDtRHFv+aDgUHU3k7MoLfFq17gtgRZR4JdQQpMZli8AiYNEUu+PbzficSb
         kDLK7fNDlYCoxWfM3BOU2HueKNJDZIK7I8FZ6wWB9ui2crHxS9Xs4NT9/goKSvhMxDaC
         Su/z3KOd5lN3ajtVx0cM1iXhpFPSDH2ClbJUQMQ4FZayf+7vJ1C2ZcNeR5klliK+Zh8G
         yC+yUtrQhzURXVIK4aC3wcr1GxrSzO65DF7KDecC6oL00uM9/eG1Nn13sUKmdnUE3x+J
         HCgbhL6ICpV2tGofvMIQEVBoxio1VM2bYHKzKXhsw+s4FNCnL8RBXUZ86ObcZVOCX5IQ
         z8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=FCTa1MEHZ8RflaCaL+Kv3IB7oupUyUxIYhWpI7cZElk=;
        b=3I/bOxwfSMy3Q+cup+xq0+2JUg2A2KksIPn2NRupldb2uJlxNL4VZprj+lPR8YT/ci
         0xHls/49ur0Ws/Z+NI2rIN/njQhQE1MMU/Qk/3xBidP2zxoKBOJSjL9voGldaJaWH2U3
         CXN0FMQ+WpXUJJB+2sJ9uAQHqQIBjv8R9vtMNjOSJoJ61M09y6eLJcfKM9Mnm2WIcjjd
         EXWJdREko9o/PWz4R2r2OM95NfIFg6bh/z1NkU/Hb3kZbs1sPWuywrlpJYp6BubKk54B
         ZM+JJ7RBWcUx3YgX1LSYz5jDCAUf5TzOWvDkraqM1p9f2y/Fi/t7KPogPdRSW0VAm3PT
         8Cxw==
X-Gm-Message-State: AOAM533GtAw8ql8ZbBGUHIyVJpzKC9PZeaDWtErjY6YEV5rBwEK8k0jJ
        MooPyiV7o8/h2YanY8agElWSpQ==
X-Google-Smtp-Source: ABdhPJygPodjlvvW7OainAGLKsdDvzFoilMLfj02cRFY2jabbkEhO2PBY0GqOsOjtLsFBdJBcYu+Ag==
X-Received: by 2002:a5d:51cb:0:b0:203:8dff:e9e4 with SMTP id n11-20020a5d51cb000000b002038dffe9e4mr13637700wrv.512.1647244935364;
        Mon, 14 Mar 2022 01:02:15 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:67f0:57f7:2185:6d18? ([2001:861:44c0:66c0:67f0:57f7:2185:6d18])
        by smtp.gmail.com with ESMTPSA id o6-20020a5d6846000000b001f044a8e214sm12331808wrw.107.2022.03.14.01.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 01:02:14 -0700 (PDT)
Message-ID: <846c8a4f-73ed-5003-1c7c-578d580a9833@baylibre.com>
Date:   Mon, 14 Mar 2022 09:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] media: meson-ir-tx: fix platform_get_irq.cocci warning
Content-Language: en-US
To:     Yihao Han <hanyihao@vivo.com>, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     kernel@vivo.com
References: <20220310074059.12269-1-hanyihao@vivo.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220310074059.12269-1-hanyihao@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/03/2022 08:40, Yihao Han wrote:
> Remove dev_err() messages after platform_get_irq*() failures.
> platform_get_irq() already prints an error.
> 
> Generated by: scripts/coccinelle/api/platform_get_irq.cocci
> 
> Signed-off-by: Yihao Han <hanyihao@vivo.com>
> ---
>   drivers/media/rc/meson-ir-tx.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
> index 63e1dbf0a4e9..abdb62b16e98 100644
> --- a/drivers/media/rc/meson-ir-tx.c
> +++ b/drivers/media/rc/meson-ir-tx.c
> @@ -323,10 +323,8 @@ static int __init meson_irtx_probe(struct platform_device *pdev)
>   		return PTR_ERR(ir->reg_base);
>   
>   	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(dev, "no irq resource found\n");
> +	if (irq < 0)
>   		return -ENODEV;
> -	}
>   
>   	ir->dev = dev;
>   	ir->carrier = MIRTX_DEFAULT_CARRIER;

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
