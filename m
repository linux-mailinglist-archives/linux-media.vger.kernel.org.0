Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3191A763D97
	for <lists+linux-media@lfdr.de>; Wed, 26 Jul 2023 19:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232343AbjGZRVY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jul 2023 13:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232386AbjGZRVV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jul 2023 13:21:21 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E132720
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 10:21:18 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5223fbd54c6so4735a12.3
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 10:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690392077; x=1690996877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=too89VOKg4aVRVsOKXI6D9LDbHqxYzZFNKPkb45L/xw=;
        b=K8dE9tk+ewfahp9/J7/sYh67jaGw270PVYU6mD45mc3tAPQ4nXe3tJwVEpotz0Kdey
         WkIQO70OQ6AoJkqSRt70bhfnnVzm8av/LwoRxx+2h/oz7KCJmiA27v3N17IWYzA91HNG
         vIIL6vghTK5w8k9cy4zsDYrClv9h8f6pNfLde+fMds1zvbb5aZ7ORnwpTaKuDuFaCwQv
         RXxZHm6ChCUpHhl7O7GMUas/xHrAu9boAJzgpqQpeaSBjPz+Ba2RA3bj/+IDPbVfGKQZ
         13WP+Y2sYbrIFVXDudT+SrOiXq+/PxgUcUrQvS5xBhNRdc0dQrNx+JEjCVeCTMZyGj7Q
         gVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690392077; x=1690996877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=too89VOKg4aVRVsOKXI6D9LDbHqxYzZFNKPkb45L/xw=;
        b=X1bVcLSuew0dfkuqvN9zjY+L4Necckf0lM8/zOqtNTo0AXsIh++Z5gYM83AlxDNgfw
         MiB4rgCkAt1Ynvu7fKiRm3n/8+d9yFWk+GmVLaNS1eFb5sAX8A40HPr2UhzOnUCWB9I5
         AHss7/wqyXXu7h1tt8JAvuYwGQn7G49mutwJvvDJZlkIYJda+wGHk+LHiRu9GH8xro6D
         DQO3gDHp2FiLekh8bRoSHzkP32W4M68cdThvuxxby6QfODk7bOF//DnKrHexFyguCCT4
         ZJ8YIrH21HAFg/EudWN52AUaXYhDEYSK8JFWQf6AFYvV9Pm/sIGgl6I8LCctySjQntZ7
         Zxtg==
X-Gm-Message-State: ABy/qLal+P9TJlk5hUV+/BIGQ0DoSYyVMsWSsSObugRi+jVnfT8bs/if
        x3P2hmJ7sMfnj2NvATgb/NWz7w==
X-Google-Smtp-Source: APBJJlEyoGURsUYBAQaNMwsyfDXwqKgX55lxzPCYh6e9DV5uQcwnRiL+KCwu7sXNVeMpK8z6KNcc1A==
X-Received: by 2002:aa7:d71a:0:b0:522:36e8:bc88 with SMTP id t26-20020aa7d71a000000b0052236e8bc88mr1939347edq.12.1690392076903;
        Wed, 26 Jul 2023 10:21:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id k11-20020aa7d8cb000000b005222c6fb512sm4306131eds.1.2023.07.26.10.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 10:21:16 -0700 (PDT)
Message-ID: <0aa471ce-da83-172d-d870-1ec7a562baf7@linaro.org>
Date:   Wed, 26 Jul 2023 19:21:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 1/5] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface
Content-Language: en-US
To:     yuji2.ishikawa@toshiba.co.jp, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        nobuhiro1.iwamatsu@toshiba.co.jp, broonie@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230714015059.18775-1-yuji2.ishikawa@toshiba.co.jp>
 <20230714015059.18775-2-yuji2.ishikawa@toshiba.co.jp>
 <7aa255e8-1cf1-03c6-02c8-de7c737a5683@linaro.org>
 <TYAPR01MB62012F7EA98012DBE0B383A29203A@TYAPR01MB6201.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYAPR01MB62012F7EA98012DBE0B383A29203A@TYAPR01MB6201.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/07/2023 08:08, yuji2.ishikawa@toshiba.co.jp wrote:
>> unevaluatedProperties: false
> 
> In the previous discussion with Laurent, I believe additionalProperties was preferred in terms of handling properties not explicitly mentioned.
> 
> https://lore.kernel.org/all/Y82NtJCtr+CZgS9k@pendragon.ideasonboard.com/

OK.

> 
> Do you have concern about defaulting properties in video-interface.yaml to forbidden?
> If defaulting to optional (like most of other bindings) is better, I'll use unevaluatedProperties.
> 

...

> there's no need to specify clock-lane with device tree.
> 
> I'll drop "clock-lanes".
> 
>>> +
>>> +          bus-type: true
>>> +          clock-noncontinuous: true
>>> +          link-frequencies: true
>>> +          remote-endpoint: true
>>
>> Drop all of these "xxx: true", should not be needed after converting to
>> unevaluatedProperties: false
>>
> 
> I'll drop "xxx: true" if unevaluatedProperties is chosen instead of additionalProperties.

Since we keep unevaluated, this should stay.


Best regards,
Krzysztof

