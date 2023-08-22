Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2CA783CE3
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 11:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234315AbjHVJ2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 05:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234283AbjHVJ2N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 05:28:13 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8701CF0
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 02:28:03 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99c4923195dso551462866b.2
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692696482; x=1693301282;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t7gWmoouARoSITw9hfp9q430gt+EZVn2knd77xoPZlw=;
        b=nu2MzzQXGuR6j7s4cg2ZFAQjginXm3Nzy4uUs6Ub5prA9vWgq2aoJdxbWAjIyu/W6g
         5saSJsCOhJ4YXP0fBrKchafCuA5NAWPjoINrZ2WJtxzfjivT6G8grVWKfezXJsr2GdIT
         oY99aUS6lW7tMckCtAp+0IpR+v0v9CENDdnyewG/GARCAWiG51214Zu+SgENWrz3lVtc
         MUi2VcRfHWvSlTj4oyNyUKJxB1mAWmxqHpvT3yuJdg97llAJFlDkGdKqp3HGsP/vQoaT
         jBoV1cwjsguxuppWFYQ4dGMXkV907xgzV8oqZrYpxri5nxuPhLzGstFdt26ss61ItqiB
         BYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692696482; x=1693301282;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7gWmoouARoSITw9hfp9q430gt+EZVn2knd77xoPZlw=;
        b=Zs1aDqeqzm8CE2NOZa808X7n1A2CLlki5heawQfJBmBL5i1Tgx+IXbVidrMMZdKU4j
         LxfH1h+KR2i6lD63742WCnDhYOMEvCTB0U/Cu2YJ+lDservQHg0a3wu4uPf4dgfcRMfe
         7+nLR4PICyKiEMWC10734YoDXL2feZNJ2t/3WlebdulXMPtMPMPHI1XHN/0iRr/ZAKD2
         Nwzdn/2vvcTDLkeew56QY82trTXG4nW/D2lU80zSzya0vzkb32G0lWgjdYvTRiRsVzm5
         qQUcQ+eptiHRyPf0JcZ+YhxzA6gI9h0vLWu63K6nlOX9FBLrn6531vgfj5WpT4fbGNRv
         RFyQ==
X-Gm-Message-State: AOJu0Ywx5y29QujE3DwG6uDp0MlZqxKp/GcYbXVTrxYI3MdkkrDJw9Tg
        F/nOcV9CIQj8CWUFQQw2CMcsQg==
X-Google-Smtp-Source: AGHT+IEGDyAkaJYjxJRTPmkXxvlQjq4cKrqCsFBR3/J7q10wtIPEiefOc/wk25oGQ93pNfL8U9hRxQ==
X-Received: by 2002:a17:907:2c59:b0:993:d7fe:7f1d with SMTP id hf25-20020a1709072c5900b00993d7fe7f1dmr7118748ejc.28.1692696482080;
        Tue, 22 Aug 2023 02:28:02 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id e16-20020a170906045000b0098dfec235ccsm7840545eja.47.2023.08.22.02.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 02:28:01 -0700 (PDT)
Message-ID: <590a7e74-5af1-1aa3-366b-4fef039e5f66@linaro.org>
Date:   Tue, 22 Aug 2023 11:28:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/2] media: dt-bindings: media: remove nokia,n900-ir as
 pwm-ir-tx is compatible
Content-Language: en-US
To:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org
Cc:     Sicelo <absicsz@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Timo Kokkonen <timo.t.kokkonen@iki.fi>,
        Tony Lindgren <tony@atomide.com>
References: <20230822091245.209539-1-sean@mess.org>
 <20230822091245.209539-3-sean@mess.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230822091245.209539-3-sean@mess.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/08/2023 11:12, Sean Young wrote:
> The generic pwm-ir-tx driver works for the Nokia n900, so nokia,n900-ir
> can be removed.
> 
> Cc: Sicelo <absicsz@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Cc: Pali Rohár <pali.rohar@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Timo Kokkonen <timo.t.kokkonen@iki.fi>
> Cc: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Sean Young <sean@mess.org>

Unfortunately not much improved here, so:
1. Please use scripts/get_maintainers.pl to get a list of necessary
people and lists to CC. It might happen, that command when run on an
older kernel, gives you outdated entries. Therefore please be sure you
base your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested by
automated tooling. Performing review on untested code might be a waste
of time, thus I will skip this patch entirely till you follow the
process allowing the patch to be tested.

Please kindly resend and include all necessary To/Cc entries.

2. Test your bindings before sending. Especially if you decide to
opt-out from automatic testing :/

Best regards,
Krzysztof

