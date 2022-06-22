Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF65C554943
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 14:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243047AbiFVKDj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 06:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241436AbiFVKDP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 06:03:15 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF9C13F9E
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 03:03:14 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id q15so8918793wmj.2
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 03:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=zL+2CjvSrdsL4OQ+/F/1vKu4W/7f37t6bDH+weGK1Ek=;
        b=RK3R5MNLkIXfDq2koc29JTbbfyFfY/7u6OcbZzKFfcDEuwdm+Hm3daeyThx6Gt5xuw
         +H1e+/G102pxH7ZmnUKa3U6tgTokPjtuG+3UozRBc4mp1++pu0AxUU33Z4g7AMlpuqBB
         Xdh/aO2rSk9o+L1wSkANXIs1ItBXuIN3svNtfg7QZI2tdwZDDYjvkumDICi+ukehecxF
         8llg/Ce0AqBQdKTbB5Oh2FsR2nthwLqE7c9voEKyRzeTDURGCWPxgmNLm9wPu0W9VzIM
         rt1kbDF7aknOm6KXcX8/xkuvnigEVVQUotG+1EuWWpLZwik2nCQFuOfE8bKXkma5qrA1
         B3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zL+2CjvSrdsL4OQ+/F/1vKu4W/7f37t6bDH+weGK1Ek=;
        b=3WLhF22vFGO8nk477I4xshEGiRyVTZRIeigl4rH2pp+54AV8Or9prE/p2cnvEBb0GY
         dUO/S5Otlfqdg0nBUDmwqqZS3cRzTZ7+hJ3ebKGxC3S0dPRqmmdi51Iq0jIrrSuoE5ko
         tJ7WEz+1WffdEgdcPDNShPrn0NudUzxIRccDjXqf675sKYxoiOGinlvg7G3+rJUuAS1b
         iRgRxN9qcP3+iEMKZN3RaFF8sGuXCqqBRXjONI+Yu45vA8MTlU2eeXdv7+FYUyktERfg
         9oiIv3NLEfmAUb/DT7Wkehc/FoWfC9tE3E9Xcx0WrOP6DWxHLtm4oyp1eW+JYVvD+r9T
         UQMg==
X-Gm-Message-State: AJIora99DzpR0r/Zb/pZl5ATzaywcVAVM/0h7XdQ0WEQQzKgbmTwim/W
        n8yvH9x2jE6E1JCWRdp+qFfK7A==
X-Google-Smtp-Source: AGRyM1t9ODJpeuEdEbqjQ738bcvn0AFBEmzkLoAAWR3yJyXm93p8zwoUbj6ZqWOK4rgc047LqSQVVA==
X-Received: by 2002:a7b:c752:0:b0:39c:4853:24f8 with SMTP id w18-20020a7bc752000000b0039c485324f8mr2981837wmk.184.1655892193339;
        Wed, 22 Jun 2022 03:03:13 -0700 (PDT)
Received: from [192.168.0.224] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u12-20020a05600c19cc00b0039c4e2ff7cfsm25787419wmq.43.2022.06.22.03.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 03:03:12 -0700 (PDT)
Message-ID: <1e2ce3ed-0f16-c727-a4a3-befa347e16d0@linaro.org>
Date:   Wed, 22 Jun 2022 12:03:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sdm630: order clocks according to
 bindings
Content-Language: en-US
To:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220509144714.144154-1-krzysztof.kozlowski@linaro.org>
 <20220509144714.144154-2-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220509144714.144154-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/05/2022 16:47, Krzysztof Kozlowski wrote:
> The CAMSS DTSI device node, which came after the bindings were merged,
> got the clocks ordered differently then specified in the bindings:
> 
>   sdm636-sony-xperia-ganges-mermaid.dtb: camss@ca00000: reg-names:4: 'csid3' was expected
> 
> Reordering them to match bindings should not cause ABI issues, because
> the driver relies on names, not ordering.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 168 +++++++++++++--------------
>  1 file changed, 84 insertions(+), 84 deletions(-)
> 

The media/bindings patch was accepted. What about DTS? Any comments?


Best regards,
Krzysztof
