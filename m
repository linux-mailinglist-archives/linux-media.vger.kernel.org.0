Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4393867FE98
	for <lists+linux-media@lfdr.de>; Sun, 29 Jan 2023 12:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjA2Lgi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Jan 2023 06:36:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjA2Lgg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Jan 2023 06:36:36 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C87371448A
        for <linux-media@vger.kernel.org>; Sun, 29 Jan 2023 03:36:35 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so796924wms.1
        for <linux-media@vger.kernel.org>; Sun, 29 Jan 2023 03:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iV0CtKNsc1LUNsSCU8gg6eLRL99aTa/LuFSM/j2NmbU=;
        b=V1rIs1SQsJszkNU1hmiAOlCO1pbGoG87eRwvJKl4RzAQGdjqZAnwhY4+s+P8CvzhqL
         O+yFDiWNyLYYZiroZMyYIfp4TfzB7X04apZv98Z+J3AuHeS6Hhz0BvSjkt1Cx5G1fTOL
         SSo0DLZgJpNXWK5ttZbp2g93GOrBTs6QZrieTnl0AGayB3pXo5//MyQNWpTOaXXrDiWb
         XAaTEJNIM6NrF6NXyQybJiofFH/TW3RDkaybqGSVMGkOpWqMR9AnAI901Io76eNCKFG5
         0b56ZwSWNts7+oCgzIM7wo3hQSoz1fOm8jrPqCyMWxBDXTadFHeDvW/2asjKpaOOmq7h
         e1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iV0CtKNsc1LUNsSCU8gg6eLRL99aTa/LuFSM/j2NmbU=;
        b=6rHb3XkEgiZg4PCE/MW5/kgnMvTPus1Ewfi6jFwfOzf9Gb5Vd9VOjYGPjW5JHWOYLq
         InZzBPpiQ0MFSym4iPc78MRgU8mIr4Os5eaUlikvsv94bt3jJbrVd1HSG8pLkjSqQvPd
         g/I0ajoCzNYkfc3cRIEvOPzw7b2HKUxeDjEIr3PK4po+e0xlgVNIRc4Y+PlEddznzc3Y
         RqFaK4QgB/Q7nJX7r4oaolZF7zqkPIz3ZapvaXs5Fitz/DDviCKviUpkUUBr8IYptOI4
         PsTmPJRh0fP7plLvu43uk6enFgE4I1r1Q+mz9ghuP3difSn+BJOw5o4klQk6XeRbhk65
         yLmw==
X-Gm-Message-State: AFqh2kpPAgalj7wbE6QV80kVIwPeWIuN+nhMgYyP4bgz8SH4iyJ1NUjM
        60b8nMIt4iIhFk/TLAYQRNECxQ==
X-Google-Smtp-Source: AMrXdXtz1poD36W1EDSpm1yH1Dds1BxQSl4n1g/04ldKpBNrfRUwNTOHnnJ7rInk0ZnYQ8EqvBi++w==
X-Received: by 2002:a05:600c:4e03:b0:3db:262a:8ef with SMTP id b3-20020a05600c4e0300b003db262a08efmr36811883wmq.38.1674992194394;
        Sun, 29 Jan 2023 03:36:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i6-20020adff306000000b002425be3c9e2sm8949557wro.60.2023.01.29.03.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 03:36:33 -0800 (PST)
Message-ID: <86bd229e-9ac3-2a3b-b0a9-4dbc462a3888@linaro.org>
Date:   Sun, 29 Jan 2023 12:36:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 1/9] media: dt-bindings: Add OV5670
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        laurent.pinchart@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20230126165909.121302-1-jacopo.mondi@ideasonboard.com>
 <20230126165909.121302-2-jacopo.mondi@ideasonboard.com>
 <482b464b-c5fb-8af2-b0f7-4388fccea3fd@linaro.org>
 <20230127181435.3d5rnrg5omxhn6l7@uno.localdomain>
 <00139f11-76b0-138a-2f7b-c67d149eb25e@linaro.org>
 <Y9Q2T3h50eudVbbb@valkosipuli.retiisi.eu>
 <042332a6-3407-2c75-362c-db7b922bd99f@linaro.org>
 <20230128095831.k7ywrlbmiesaewgg@uno.localdomain>
 <Y9Tz8AWds51vGgsM@valkosipuli.retiisi.eu>
 <20230128110311.bpm6btxgtp5wsmfq@uno.localdomain>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230128110311.bpm6btxgtp5wsmfq@uno.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/01/2023 12:03, Jacopo Mondi wrote:
> Since I got the attention of both of you, let me point out another
> issue I'm facing.
> 
> We also have video-interface-devices.yaml which lists properties for
> the device node and not for the endpoints.
> 
> video-interface-devices lists properties that should be all optionally
> accepted, as they can potentially apply to all sensors (things like
> rotation, orientation, lens-focus, flash-leds are valid for all
> devices)
> 
> Being properties for the device node they should be specified in the
> schema top-level and I see a few schema that do that by
> 
>         allOf:
>           - $ref: /schemas/media/video-interface-devices.yaml#
> 
> However top level schemas usually specify
> 
>         additionalProperties: false
> 
> Which means each sensor schema has to list the properties it accepts from
> video-interface-devices.yaml. It's easy to verify this just by
> adding "orientation" to the example in a schema that refers to
> video-interface-devices.yaml and see that the bindings validation
> fails (see below)
> 
> TL;DR is there a way to tell in a schema with a top-level
> "additionalProperties: false" that all properties from a referenced
> schema are accepted ?

No, because this would make it exactly the same as
unevaluatedProperties, so we would have two keywords with same meaning.

https://lore.kernel.org/all/c2740d66-b51f-efc2-6583-a69bde950c68@linaro.org/

Best regards,
Krzysztof

