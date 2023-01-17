Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB1BC66E44A
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 18:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233936AbjAQRBr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 12:01:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233764AbjAQRBd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 12:01:33 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BACAC39CFD
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 09:01:31 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id b7so5292127wrt.3
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 09:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iaIoioiiiOEumFM+lAmLzxpgsDICsGiz+IvsgBagPfE=;
        b=m7Aw4OnFYBmkQyAKBqodVwzbRj81+GA4XBfM9/X1sPkgZ1YcurwQRlUWZ85dtEH9I7
         9ROrmzUWksXod52FrFR1U/R07NyVEkfrEM+uuLoxY+LJ/MNmNuqmBCljltcZVq0VlPx/
         rqRgi9rx7wf2huNwhZzb5TQr/QvNK34xTvw/LhU+vkQNFbzLgx2GX/7X9/1zNBHN8QQ7
         wBx/u4wzI0N/fwNjgwohzyy1VNZ3kJGbk3q3VSZny0DdkTxUzg0q/S5/04b0qYBHSBb3
         2uJKQE/YA2VbY2T0e4CzvaEwGULUsx3JbyxUN9dXIDuy9JOhw9Q9hIe6tVvI/ta/V5LM
         p3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iaIoioiiiOEumFM+lAmLzxpgsDICsGiz+IvsgBagPfE=;
        b=VmBCas7/nuFTjPgy08hDnu0NGV7Uw1jPBXX0PYFpIMIkF4RRH55r9DKwtaZgEAA7St
         dbutz5f2NBs0HAUnaa5TogSkmvm3F09/WKKdiarJSINwM86q4+S5SZyw8PkeTzEj3xq/
         b7qXUFUdC1Q2XqEbC5XgNO1XtLxTEcT2h98MF38xMVP/YHeQ80+/5Xg1hzSBJ9T/yBI5
         JlfW26V1O/rkGeq65rybTleJZuQBQi7FTMeDTAS9rpZGk6F6QwKFc0lERUfvvRJCvgsj
         tCHE7wToq6Mxa75muUuaXCoPGmVmsIxornHfszja+6Y5K/qHuxibH6ZDkaO9VxQOZm3V
         8boQ==
X-Gm-Message-State: AFqh2kpIzrWiW9yfU2roq8eRFBsFK9tW+XktOptKXRQG5TvkzDMvklzv
        /EmmR2KCcalBnT2QZVGfVRJi5A==
X-Google-Smtp-Source: AMrXdXtuYPP3e2NwiZHC+tcAro+jscRTu2L8lNw4uysmPrIUUWgLlKv1BYa+0nkvJxapOpf4g5vk7Q==
X-Received: by 2002:a5d:522d:0:b0:2bd:ff91:7e1e with SMTP id i13-20020a5d522d000000b002bdff917e1emr3155288wra.57.1673974890353;
        Tue, 17 Jan 2023 09:01:30 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l14-20020a5d526e000000b0028e55b44a99sm11576376wrc.17.2023.01.17.09.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 09:01:29 -0800 (PST)
Message-ID: <c2740d66-b51f-efc2-6583-a69bde950c68@linaro.org>
Date:   Tue, 17 Jan 2023 18:01:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 1/6] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface bindings
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Mark Brown <broonie@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111022433.25950-1-yuji2.ishikawa@toshiba.co.jp>
 <20230111022433.25950-2-yuji2.ishikawa@toshiba.co.jp>
 <Y8a+Hk2jFOjbkIvZ@pendragon.ideasonboard.com>
 <d1bb1148-e273-f5bb-bccc-ceca82bb6836@linaro.org>
 <Y8bFjhHkbNAKQK3t@pendragon.ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y8bFjhHkbNAKQK3t@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/01/2023 16:58, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> On Tue, Jan 17, 2023 at 04:42:51PM +0100, Krzysztof Kozlowski wrote:
>> On 17/01/2023 16:26, Laurent Pinchart wrote:
>>>
>>>> +
>>>> +          clock-lanes:
>>>> +            description: VIIF supports 1 clock line
>>>
>>> s/line/lane/
>>>
>>>> +            const: 0
>>>
>>> I would also add
>>>
>>>           clock-noncontinuous: true
>>>           link-frequencies: true
>>>
>>> to indicate that the above two properties are used by this device.
>>
>> No, these are coming from other schema and there is never need to
>> mention some property to indicate it is more used than other case. None
>> of the bindings are created such way, so this should not be exception.
> 
> There are some bindings that do so, but that may not be a good enough
> reason, as there's a chance I wrote those myself :-)
> 
> I would have sworn that at some point in the past the schema wouldn't
> have validated the example with this omitted. I'm not sure if something
> changed or if I got this wrong.

You probably think about case when using additionalProperties:false,
where one has to explicitly list all valid properties. But not for
unevaluatedProperties:false.

> 
> video-interfaces.yaml defines lots of properties applicable to
> endpoints. For a given device, those properties should be required

required:
 - foo

> (easy, that's defined in the bindings), optional,

by default (with unevaluatedProperties:false)
or explicitly mention "foo: true (with additionalProperties:false)

>  or forbidden. How do

foo: false (with unevaluatedProperties:false)
or by default (with additionalProperties:false)

> we differentiate between the latter two cases ?



Best regards,
Krzysztof

