Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D02F573CF4F
	for <lists+linux-media@lfdr.de>; Sun, 25 Jun 2023 10:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbjFYI1O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jun 2023 04:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbjFYI1N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jun 2023 04:27:13 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D618AD3
        for <linux-media@vger.kernel.org>; Sun, 25 Jun 2023 01:27:11 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51d89664272so1355975a12.1
        for <linux-media@vger.kernel.org>; Sun, 25 Jun 2023 01:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687681630; x=1690273630;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3iw/v8umO+caWbs4H0rT0+eQa7evscUpRFDX+BprkPc=;
        b=obllu29YFPFgRGd6jTkAI61xOl8UfC1YZR8FWbjOumrHWcO635wtrPIz+tiHqkpLqM
         +qWDbqikupQ4sSAKW79Q6GoNygV18Me4IIJJeivsLmkA8PQaUSinwO/PxJWkjcVMqPLe
         0fU5ja86BkihhYN/wNcB9wqfWjKmLarHarSlPhcxklvQd6Z3GGBmFA0U4rudiHroVHlv
         mMmWQ8XLmK03Rn1K7sj1sd4CSblHvwRKAlie3aW3fI2E95qKVP6I30c+D/1nHDlSmYnq
         fLTUOogedjlI1+PXompRIBQBJam0qpEu6K8Jy8dk4AOCJwr3oSrPYHIDxpKbfxEl5DBF
         RveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687681630; x=1690273630;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3iw/v8umO+caWbs4H0rT0+eQa7evscUpRFDX+BprkPc=;
        b=ZU+kC8L/7h8mgJc0UL8cqanOTks+Z9q3yOcU0DkT3r9w/E3RRL9OEv0Rp9fIA+FE6A
         cZOfzAqJjfsjMtw/yDOOM8/44ypO/b+Bvq8xsp/wvpCHqf6GJUQb14a2RAqIsO7R9DX3
         ufrDE90rogVaYe6TkCmmOIwAwvdPtVBPMVb9CvKalawtyd6ixTSisnyHP187VhxPKn16
         1cAZsGP3cRtaIf8Btyv0tsVe3tppCDdr5K+D9XpDAh8lYwwXA4KnTrFSzn0OPtkShgIB
         9T7VuClC6cDwzLMdo0x4HZ+hTRvPbdzCXWes6Q3KVNVeIQ755H54co0jko9BVUcDVokH
         to+g==
X-Gm-Message-State: AC+VfDxDFobUUQ5hFGS9fXI6hJAgFG1x/VePC70E7HlpAXpLCDK/UAwS
        +s0pTzHVJCemHCoJGoFf0ZEoDdsfrIo86llq4TY=
X-Google-Smtp-Source: ACHHUZ7qDM8zax2Ul6fbWYLOrxbrpdkywZBXzL9L3rr1frSL7KkwkMS2Aq5PJWKW6AttjOb3M1DTDA==
X-Received: by 2002:a17:907:9303:b0:988:6bd2:b0bc with SMTP id bu3-20020a170907930300b009886bd2b0bcmr19432058ejc.2.1687681630313;
        Sun, 25 Jun 2023 01:27:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id i15-20020a17090685cf00b0098d66d03b80sm1806719ejy.212.2023.06.25.01.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 01:27:09 -0700 (PDT)
Message-ID: <82371522-c062-6fb4-7449-96edeae33a09@linaro.org>
Date:   Sun, 25 Jun 2023 10:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] media: dt-bindings: media: nxp,imx-isi: i.MX93
 support
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     guoniu.zhou@oss.nxp.com, linux-media@vger.kernel.org,
        linux-imx@nxp.com, devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
References: <20230625080916.3553621-1-guoniu.zhou@oss.nxp.com>
 <20230625080916.3553621-4-guoniu.zhou@oss.nxp.com>
 <63eb8605-fa23-fe13-e635-1cfdbcafb5c7@linaro.org>
In-Reply-To: <63eb8605-fa23-fe13-e635-1cfdbcafb5c7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/06/2023 10:22, Krzysztof Kozlowski wrote:
> On 25/06/2023 10:09, guoniu.zhou@oss.nxp.com wrote:
>> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
>>
>> Add i.MX93 support since it reuse ISI which used in i.MX8M family.
>>
>> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> 
> Subject: Drop duplicated "media:"
> 
>> ---
>>  Documentation/devicetree/bindings/media/nxp,imx-isi.yaml | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
>> index 1ce9440bde32..ddad1d8778f3 100644
>> --- a/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
>> +++ b/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
>> @@ -21,6 +21,7 @@ properties:
>>      enum:
>>        - fsl,imx8mn-isi
>>        - fsl,imx8mp-isi
>> +      - fsl,imx93-isi
> 
> Imx93 is a family of devices, not specific device, so I hope you
> understand that it is a bit against the recommendation of specific
> compatibles and you guarantee that all devices within family will be
> identical.


And looking more this won't be true. There are significant differences
between devices in the "imx93" family:
1. number of A55 cores and their frequency
2. Presence or not of NPU
3. MIPI-CSI or Parallel camera
4. MIPI-DSI, LVDS or Parallel display
5. 1 or 2 Gigabit Ethernet

Why NXP just cannot follow standard rules here?

https://elixir.bootlin.com/linux/v6.1-rc1/source/Documentation/devicetree/bindings/writing-bindings.rst#L42


Best regards,
Krzysztof

