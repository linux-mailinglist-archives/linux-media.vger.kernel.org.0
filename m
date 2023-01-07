Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A76D660EFE
	for <lists+linux-media@lfdr.de>; Sat,  7 Jan 2023 14:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbjAGNKD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Jan 2023 08:10:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjAGNKC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Jan 2023 08:10:02 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048B9574F4
        for <linux-media@vger.kernel.org>; Sat,  7 Jan 2023 05:09:59 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id z5so2553578wrt.6
        for <linux-media@vger.kernel.org>; Sat, 07 Jan 2023 05:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLlY74lBKRGRzarxnE97qD14pxUge6wP6SsI1ElnUUs=;
        b=jLpXA08K0gO/8AJAtcPQAKQSjWN8NrVGRvAPfvVx+pF5z0/AEXiTb1XvQXZbAzm3SA
         1kagRlJuzuBqoDnvnw51zisv6YuyanMlJYuwtNHDkcG5Gl127IYspVkMEBRfDRLlQbS+
         Q3w9GGTlPNFlsCzQ8w3fa7PDsWHcLS4VfescaxudTQP/8lnn3bFJE7Ije5KiqnsHyyYq
         RE+9ge2VjzKSEu7+8Ak6ZVuDLMFW4N7q2JurKZCVXEPh0dK4tI6admJ2W7PCuHu9Nt8Z
         8mjoMFHYz05qXOqoxzmITeVaRldha9MF1dxQDbdswPqlUXLthbOYtgM3H5ExE/nbTM65
         UaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLlY74lBKRGRzarxnE97qD14pxUge6wP6SsI1ElnUUs=;
        b=u7A22ebY3BaWrdmZKqWfvF8xT0+iDL7XzKBhuv5YdVP3m/35OlfIdpQU+m5Hq6y76t
         w/cN8h6fuDOXv7jKBz3au+3agWzl5qYM1U51w7Y3wwnwOPuam+QXo4ly8yLU6Iai+Khl
         Q60t9ebLxZzwAw9dp/zmuCZbq9EbDNSoL3JloyyYzbLzw6SMoCTyZ/588WbCIODP2f5/
         0C6WunnOynTwzA8fgkgaMKI5z3Adm51//707MwI8ISj4crXi7S5VC0ib7hJ+3a0kC8Pw
         oIB5atXrEIYFRnw3ji5/dMCatEDMtRoWfC6LgQ4br/AUH2CRMKc9qnV/z3r6Mjg7rAOH
         pfIw==
X-Gm-Message-State: AFqh2kqb+5u8LmZjjYPYybi/C83RozH1j3929M4hNXjWbJfKlTQ9BD12
        d6Cv2624tzk5bONF7xMFsVorvw==
X-Google-Smtp-Source: AMrXdXt92og9PyhiOxFHB6hAF5Bth+1E1nejyHX/tEYK9CUEX386gaoJHGcGTB7g1GUKKNOqEPpgBQ==
X-Received: by 2002:a5d:58e6:0:b0:26f:aaff:e98c with SMTP id f6-20020a5d58e6000000b0026faaffe98cmr31680723wrd.27.1673096997552;
        Sat, 07 Jan 2023 05:09:57 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z16-20020a5d4d10000000b00242209dd1ffsm3797535wrt.41.2023.01.07.05.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jan 2023 05:09:56 -0800 (PST)
Message-ID: <4f1e55bc-9f0b-6411-2957-e68a049f1d6b@linaro.org>
Date:   Sat, 7 Jan 2023 14:09:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] dt-bindings: media: Add OmniVision OV8858
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Nicholas Roth <nicholas@rothemail.net>,
        Robert Mader <robert.mader@collabora.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        devicetree@vger.kernel.org
References: <20230106203909.184073-1-jacopo@jmondi.org>
 <20230106203909.184073-2-jacopo@jmondi.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106203909.184073-2-jacopo@jmondi.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/01/2023 21:39, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Add binding schema for the OmniVision OV8858 8 Megapixels camera sensor.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/media/i2c/ovti,ov8858.yaml       | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
> new file mode 100644
> index 000000000000..002461a974f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov8858.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV8858 Image Sensor
> +
> +maintainers:
> +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +  - Nicholas Roth <nicholas@rothemail.net>
> +
> +description: |
> +  The OmniVision OV8858 is a color CMOS 8 Megapixels (3264x2448) image sensor
> +  controlled through an I2C-compatible SCCB bus. The sensor transmits images
> +  on a MIPI CSI-2 output interface with up to 4 data lanes.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov8858
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: XVCLK external clock
> +
> +  clock-names:
> +    const: xvclk
> +
> +  dvdd-supply:
> +    description: Digital Domain Power Supply
> +
> +  avdd-supply:
> +    description: Analog Domain Power Supply
> +
> +  dovdd-supply:
> +    description: I/O Domain Power Supply
> +
> +  powerdown-gpios:
> +    description: PWDNB powerdown GPIO (active low)
> +
> +  reset-gpios:
> +    description: XSHUTDN reset GPIO (active low)

Here you need maxItems. I did not propose to remove it here.


Best regards,
Krzysztof

