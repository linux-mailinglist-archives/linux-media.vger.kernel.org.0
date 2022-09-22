Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5A555E6295
	for <lists+linux-media@lfdr.de>; Thu, 22 Sep 2022 14:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbiIVMjC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Sep 2022 08:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbiIVMjA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Sep 2022 08:39:00 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13057E7C01
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 05:39:00 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f14so14480448lfg.5
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 05:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=LMns0GHUaBxD8PcS7JMoTxwrXbVD9T+FT4BhUrbLJrg=;
        b=a1Sfs5APiIpW2IWtqROTVUZgjHOdeGFYsEIgE8S6RagNZeV+xSHjqwVz7yQAFiYxKo
         S1xhJW/zYfjeGqAOVujVnmfVK84+E28g+YrLV40V6gnF33zbN9efWJ+lWI1+GVCh0yvq
         I6/fATyYOHKk81HlD6H4doF394pDScN7RJZ/rR326Z6T0Vd41TwjwPnjckrjBRFBU8ZY
         gtFu2QiqtnJraItTPLzlB9I3Wv38ESG0E9Nks6YqoJI3lKNY9J1ifuRADYlyWoL79620
         M456FKcvb0IjeUBjlFV5WfJQzCQyo6hXIW1aqxCO5+JN2LTYWXlOYUTAQoJUKW1YwBD3
         tD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=LMns0GHUaBxD8PcS7JMoTxwrXbVD9T+FT4BhUrbLJrg=;
        b=yNtlMPUA+CnpUAiqo/4llBOJrc2wowrXymp7WWyq78JO37smv5zp8uLzdI3YpCmLhk
         Wf719vQPegbwtLUJsMCraNSDsFB4PteCTFqLO/Tx+7fR9UV1bkF85pXBEY4RzHGx5LZB
         O0rP7XZk+QtENPTin0dz+/ymbial9NOMFAv6tmxFTkHxgWmjuTNrTgp+muA0+eHB8D28
         ciL29IUdYKh/FmB/C8oj752nKm0BCtKbz2NLoHI4/q4U2/TPplxijS3YL7hRrHAUdpGW
         8cy5D5048pVc3DqjaGMa5m8GGCiHcHnQhDnpGUeYd4t/Kps+ERvre6IP97Ysn9xsON95
         +NQQ==
X-Gm-Message-State: ACrzQf3GDGxKyW4pom60iyQIkQ94vlxuEAOUxOkp6eqJTNeVh9KGycFi
        fMsQwllbyE9lz57oqT4C4WlbFg==
X-Google-Smtp-Source: AMsMyM49h2yPAVzQNELo8xk+943jpXxe2za6dojLEMtSawbwC8Na4fThtjp9EJD6JFf5GUh6qZQYeg==
X-Received: by 2002:a05:6512:12d5:b0:49b:f391:9614 with SMTP id p21-20020a05651212d500b0049bf3919614mr1103014lfg.464.1663850338299;
        Thu, 22 Sep 2022 05:38:58 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z7-20020a056512376700b00498fbec3f8asm924922lft.129.2022.09.22.05.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 05:38:57 -0700 (PDT)
Message-ID: <bd22f224-0e27-1125-1338-9d9a942502a3@linaro.org>
Date:   Thu, 22 Sep 2022 14:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 RESEND 1/3] media: dt-bindings: imx412: Extend
 compatible strings
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, sakari.ailus@iki.fi,
        dave.stevenson@raspberrypi.com, jacopo@jmondi.org,
        paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
References: <20220922104225.1375331-1-bryan.odonoghue@linaro.org>
 <20220922104225.1375331-2-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220922104225.1375331-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/09/2022 12:42, Bryan O'Donoghue wrote:
> Add compatible bindings for imx477 and imx577 both of which use the
> same silicon enabling reference code from Sony in the available examples
> provided.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx412.yaml          | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> index 26d1807d0bb6..ebb649c5e4c5 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> @@ -19,7 +19,11 @@ description:
>  
>  properties:
>    compatible:
> -    const: sony,imx412
> +    items:

No need for items. Just "enum".

Best regards,
Krzysztof

