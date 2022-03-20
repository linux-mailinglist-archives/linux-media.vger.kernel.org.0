Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38A944E1B5F
	for <lists+linux-media@lfdr.de>; Sun, 20 Mar 2022 12:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244781AbiCTL7h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Mar 2022 07:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242916AbiCTL7g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Mar 2022 07:59:36 -0400
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F58E8A;
        Sun, 20 Mar 2022 04:58:12 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id r13so24981293ejd.5;
        Sun, 20 Mar 2022 04:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qaB7PdJZA+Kd5ylFkA8D+A31Z7oFFbAfp6lFQMQbK8Y=;
        b=eTHz/SalWeLCZLEj82UFnVhzVhxNLl43GwIn/+bECfk4tKauHl98f1v8F/iRu6zeiR
         EAT/cmQDjknaIZqKqYelr0DHPKEvzOO7gOUR6wcR31Esiv6hHGJUB6ALANlLSSbk1G7M
         COArOCQfuVgIcWqrMdRC3+7t6SdsvWWKwsToz8AeRQ5Qcxn8OTXWEjcxSsy3srgDiMAk
         rnTZv2XTHsVH5A79Lar397BBmwmc76FoV1/bKIQsbYoQ3lT8tlxqnJrQgOnHhMFg4oxn
         GomVz7ZnBjWd2y/hg2xeBUK74ekwBGzSGS5kgB1UrYmXfYpymytIjYukQ3nHXyiDcTSz
         mjgQ==
X-Gm-Message-State: AOAM531u6Z+2/1D8ZsU7ForBC/ZegQkSRs+IxcP5dXRUsWZuZiGJtIA1
        wv5zxmrD422rBX9VAOGOZ/0=
X-Google-Smtp-Source: ABdhPJyXSVPs+Aj+U/WUsLF5eONglHM9HTPpz/B52Id8wlWul+WI+34gOyofPDVcAdU3lRipUnBdbw==
X-Received: by 2002:a17:906:3cea:b0:6da:ea45:ea9e with SMTP id d10-20020a1709063cea00b006daea45ea9emr16140172ejh.574.1647777491286;
        Sun, 20 Mar 2022 04:58:11 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id kb28-20020a1709070f9c00b006d5d8bf1b72sm5764460ejc.78.2022.03.20.04.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Mar 2022 04:58:10 -0700 (PDT)
Message-ID: <7e937551-fba4-760d-f3ce-16f811e10bd8@kernel.org>
Date:   Sun, 20 Mar 2022 12:58:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] dw9807-vcm: Add "dongwoon,dw9807" compatible string
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh@kernel.org
References: <20220318165119.12191-1-sakari.ailus@linux.intel.com>
 <20220318165119.12191-3-sakari.ailus@linux.intel.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220318165119.12191-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/03/2022 17:51, Sakari Ailus wrote:
> There is firmware out there that uses "dongwoon,dw9807" compatible string
> that never made it to upstream as-is. Add it to the driver to make it load
> on such systems.
> 
> The chip also has an EEPROM part which is AT24 compatible (for reading
> purposes) on a separate I²C address. Adding possible support for this in
> the future is not affected by this change.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/dw9807-vcm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/dw9807-vcm.c b/drivers/media/i2c/dw9807-vcm.c
> index 95e06f13bc9ed..ada8e467a0450 100644
> --- a/drivers/media/i2c/dw9807-vcm.c
> +++ b/drivers/media/i2c/dw9807-vcm.c
> @@ -295,6 +295,8 @@ static int  __maybe_unused dw9807_vcm_resume(struct device *dev)
>  
>  static const struct of_device_id dw9807_of_table[] = {
>  	{ .compatible = "dongwoon,dw9807-vcm" },
> +	/* Compatibility for older firmware */
> +	{ .compatible = "dongwoon,dw9807" },

You need to add it to the bindings as well.

Best regards,
Krzysztof
