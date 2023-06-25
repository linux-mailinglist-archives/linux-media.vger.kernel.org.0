Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8F5C73CFA5
	for <lists+linux-media@lfdr.de>; Sun, 25 Jun 2023 11:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbjFYJP4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jun 2023 05:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbjFYJPy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jun 2023 05:15:54 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC8FFB
        for <linux-media@vger.kernel.org>; Sun, 25 Jun 2023 02:15:52 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-98df3dea907so131117566b.3
        for <linux-media@vger.kernel.org>; Sun, 25 Jun 2023 02:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687684551; x=1690276551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QJkVj491rVLJcP5vWz+HtXYLn0UiP8diFTx3m981Luw=;
        b=qxbZovERQ2PeFIMsD2uWO9qPw+C/DG4Qppl95Kf4uAVfSvZTzWRXb4ON45UyJgiThm
         SUq8S5pf9+5QNyK5+CZzHy4d/OyNGedxqAHTso3+8nO3Ks88UPeMlGQPEma5niN34duq
         8fbIvhtYaUXzi0l/auu3OKXviRh0JX4wTPhEsXxAuNR2AVhzYT+H6japUxDPzblKdTex
         krkKW+zN3NnFBgY6WxrVYogKFOnYRYmEGMqlCdtI9CyLUlz9pQaDW4ymxsFYvxtbTedW
         NKSLlXIrnhMOPCCk+fssWxFnVnN/kYonjPPvLFcu/w8avj6l4sX6BCnD1wrTf15bDPi1
         /22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687684551; x=1690276551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJkVj491rVLJcP5vWz+HtXYLn0UiP8diFTx3m981Luw=;
        b=idr2fhW4gpUfwA+dbgUZvBorFgrnkAfDSBNEpN2AKnOHYhLkUIlGT5M7yhS740JIKD
         Cy8hHQ1+IjLepGCEXuIHVOK7Ai2rvgvhAJzF4OzNo3v1jzxwKeIywLMuGB3WLYRjP+jr
         NiAYRqbjIqzhFws+u87OByzwOFEfUP0OnQZ5cW2iMfdTRVTpMi3R2fMk3JZC77UhDF6z
         7nPwlvQvme1hpJFspZnptxeSZS/wOm6TBwDoEOnbA9hDOhS5YioKjwmtktSzcwrW02ns
         ct0aZJh7wbDQDxR7YKQC7zhnLkUkueAshL727umPcgCoAwNmRvWHG3KOLkCnCt1juuOV
         d53w==
X-Gm-Message-State: AC+VfDyq+fc2oDT1bHH3k+qD70u+4aHlJ97cK95whSVu8syYmJoh0fmZ
        rp97yC0lJdCM2dpvTz8wrF/l0y/p3uVf08tRtes=
X-Google-Smtp-Source: ACHHUZ7BYA1msj7dycial/jlGghZqzmaYKPyeXBFF5zEQx7t5UndvwkD4Pinwn0+YsRtpD826IDT3w==
X-Received: by 2002:a17:907:9309:b0:966:17b2:5b0b with SMTP id bu9-20020a170907930900b0096617b25b0bmr21000689ejc.49.1687684551394;
        Sun, 25 Jun 2023 02:15:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id t13-20020a170906178d00b0098951bb4dc3sm1841484eje.184.2023.06.25.02.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 02:15:50 -0700 (PDT)
Message-ID: <abd16b7d-981e-68e1-b5de-62b2857a114f@linaro.org>
Date:   Sun, 25 Jun 2023 11:15:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] media: dt-bindings: media: nxp,imx-isi: i.MX93
 support
To:     "G.N. Zhou" <guoniu.zhou@nxp.com>,
        "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc:     "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
References: <20230625080916.3553621-1-guoniu.zhou@oss.nxp.com>
 <20230625080916.3553621-4-guoniu.zhou@oss.nxp.com>
 <63eb8605-fa23-fe13-e635-1cfdbcafb5c7@linaro.org>
 <AS8PR04MB90809D01798D2B11D7CB9681FA21A@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <AS8PR04MB90805AAA11EBA29F4EA20632FA21A@AS8PR04MB9080.eurprd04.prod.outlook.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AS8PR04MB90805AAA11EBA29F4EA20632FA21A@AS8PR04MB9080.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/06/2023 10:47, G.N. Zhou wrote:
> Hi Krzysztof Kozlowski,
> 
>> -----Original Message-----
>> From: G.N. Zhou (OSS)
>> Sent: 2023年6月25日 16:28
>> To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>; G.N. Zhou (OSS)
>> <guoniu.zhou@oss.nxp.com>; linux-media@vger.kernel.org; dl-linux-imx
>> <linux-imx@nxp.com>; devicetree@vger.kernel.org
>> Cc: laurent.pinchart@ideasonboard.com; mchehab@kernel.org;
>> robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org;
>> Xavier Roumegue (OSS) <xavier.roumegue@oss.nxp.com>;
>> kernel@pengutronix.de; jacopo.mondi@ideasonboard.com;
>> sakari.ailus@linux.intel.com
>> Subject: RE: [PATCH 3/4] media: dt-bindings: media: nxp,imx-isi: i.MX93 support
>>
>> Hi Krzysztof Kozlowski,
>>
>> Got it, will update. Thanks for your quick reviewing.
>>
>>> -----Original Message-----
>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Sent: 2023年6月25日 16:22
>>> To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>;
>>> linux-media@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>;
>>> devicetree@vger.kernel.org
>>> Cc: laurent.pinchart@ideasonboard.com; mchehab@kernel.org;
>>> robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
>>> robh+conor+dt@kernel.org;
>>> Xavier Roumegue (OSS) <xavier.roumegue@oss.nxp.com>;
>>> kernel@pengutronix.de; jacopo.mondi@ideasonboard.com;
>>> sakari.ailus@linux.intel.com
>>> Subject: Re: [PATCH 3/4] media: dt-bindings: media: nxp,imx-isi:
>>> i.MX93 support
>>>
>>> Caution: This is an external email. Please take care when clicking
>>> links or opening attachments. When in doubt, report the message using the
>> 'Report this email'
>>> button
>>>
>>>
>>> On 25/06/2023 10:09, guoniu.zhou@oss.nxp.com wrote:
>>>> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
>>>>
>>>> Add i.MX93 support since it reuse ISI which used in i.MX8M family.
>>>>
>>>> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
>>>
>>> Subject: Drop duplicated "media:"
>>>
>>>> ---
>>>>  Documentation/devicetree/bindings/media/nxp,imx-isi.yaml | 5 ++++-
>>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
>>>> b/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
>>>> index 1ce9440bde32..ddad1d8778f3 100644
>>>> --- a/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
>>>> @@ -21,6 +21,7 @@ properties:
>>>>      enum:
>>>>        - fsl,imx8mn-isi
>>>>        - fsl,imx8mp-isi
>>>> +      - fsl,imx93-isi
>>>
>>> Imx93 is a family of devices, not specific device, so I hope you
>>> understand that it is a bit against the recommendation of specific
>>> compatibles and you guarantee that all devices within family will be identical.
> 
> I'm litter confused about this since iMX93 is a specific device and belong to iMX9 family. Could you help to provide more details?

What's confusing exactly? Open the website of NXP - it clearly says
"i.MX 93 Applications Processor Family", so what do you mean by
"specific device"? It's not. Open the datasheet. I already listed
several differences between different imx93 SoCs. Basically - there is
no such thing as imx93 SoC. There is imx9355 (or imx935x), imx933x etc.

Why I need to provide more details about NXP SoCs? Aren't you from NXP?

Best regards,
Krzysztof

