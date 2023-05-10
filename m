Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 845A76FD7FE
	for <lists+linux-media@lfdr.de>; Wed, 10 May 2023 09:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236392AbjEJHPE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 May 2023 03:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236497AbjEJHOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 May 2023 03:14:48 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD4C65A4
        for <linux-media@vger.kernel.org>; Wed, 10 May 2023 00:14:44 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-96622bca286so838885366b.1
        for <linux-media@vger.kernel.org>; Wed, 10 May 2023 00:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683702883; x=1686294883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ch+ywrM7ENG4chU3j4WYCfpisz4v6veyHuIFW15D4Bk=;
        b=Q+0HX6D2p3cd77hWK4tsrhAZnEw5DtiiG1d2K1EECJrROATSgcAJOTlTFNaenWAcMr
         DbsKTP39x0pf4f8OTMS6SFBCip1jp+S9J0pw9qb8BnjzJXoCxk7/jBUc6uBUwhiMrXLL
         /QWnSfb1qryScrZP2JK4+aTP4u4+XGjIK/jB2+ROGRndc3TVCYLCBbNxBIw5Oh0p58uf
         Fwl6GQKQZ9usm25CxaukvJ7BzOKbUbJIESVHBFIlfChLdaH4fFHclEKEAPT9QzKyQUT3
         td7M7XWE09ivMs1q3d8rcGj8JP39+Bqqhcnu1zBt+XsgJ/JCkq8BASLy9S1wAF3e5jXZ
         5+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683702883; x=1686294883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ch+ywrM7ENG4chU3j4WYCfpisz4v6veyHuIFW15D4Bk=;
        b=lWHttKcNCLjzrO+mFAQTAfwmfKX5TooltTVT55qZVzsh+hUipG+Mhwg+MCMB0/KUeO
         byQvKbkrDNxwOL+9eKd0le7qJNGrrHRO8jFHIOAF8bnR4rN1XsqHuJ6o5PiYveyJRed3
         QLspdsHxwJO1/k6NWJDTpkzS68C55ansP11DyDpAxLjW4brtwZqrzXRoJI2Ixvp49n3a
         8ZRtDgxLTtFBnZBC+MeEMYjihTdAk4E1YekIFkREKITdcLs1D6YoecDp0TBciLabwxat
         KY+dQqxKDSB23Gj/wVdrWI3jvjQIxQRe+gVLztDN+IYeWsaUe0e4mKtrM9NcgEmDhzld
         14yg==
X-Gm-Message-State: AC+VfDw/D56BfrBULApbDuwdqqjAjcHhWgaD8aYmfHBqYkAlIyn/mQsd
        LgnL6O6xCjhBRK+BJTkeG8Jdrw==
X-Google-Smtp-Source: ACHHUZ6J/NwbbMqtg17JZa2k2RueLNIRXiN2OtjrLsuha9UMGaiOdm+t42RKH3jUWAZouIETbUZF6Q==
X-Received: by 2002:a17:906:dc93:b0:965:4b44:6f5a with SMTP id cs19-20020a170906dc9300b009654b446f5amr15135946ejc.10.1683702883165;
        Wed, 10 May 2023 00:14:43 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id hz15-20020a1709072cef00b00966238a202esm2301797ejc.7.2023.05.10.00.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:14:42 -0700 (PDT)
Message-ID: <d64dff42-0370-fb2d-cb31-860356212788@linaro.org>
Date:   Wed, 10 May 2023 09:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] dt-bindings: i2c: maxim,max96712: Require setting
 bus-type property
Content-Language: en-US
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20230509190031.769298-1-niklas.soderlund+renesas@ragnatech.se>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230509190031.769298-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/05/2023 21:00, Niklas Söderlund wrote:
> The MAX96712 can support both a CSI-2 C-PHY and D-PHY bus. The initial
> staging driver however only supported D-PHY and the bus-type property
> was left optional.
> 
> In preparation for adding C-PHY support to the staging driver make the
> bus-type property mandatory as it is needed to select the correct PHY
> mode. Without the bus-type property present, the driver falls-back to
> D-PHY mode, so the change is functionally backward compatible with old
> DTS files lacking the property.
> 
> The only in-tree DTS file (renesas/r8a779a0-falcon-csi-dsi.dtsi) that
> lacked the property uses D-PHY and have been updated.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Use symbolic names in comments for the bus-type properties.
> - Improve the commit message.
> - Rebased to v6.4-rc1.
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml      | 7 +++++++
>  1 file changed, 7 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

