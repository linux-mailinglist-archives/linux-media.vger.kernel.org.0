Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1F6F783CF9
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 11:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234381AbjHVJgJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 05:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234380AbjHVJgH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 05:36:07 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA10CCD
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 02:36:03 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-52889bc61b6so5405249a12.0
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 02:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692696962; x=1693301762;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J/a+KHz8Q2GH1ybhNDY2HPcK7sGl9mgepl0h/FvpyaA=;
        b=RzuEYf5fWah9yoaRm2KseVXBDnaT081paOFKLkvFjWwxYALd+l+MrdsgZUz20o99Wj
         fr3iI83QvD1jACguBEjBipuTTmecjhSoeQnxBD4G1U/zqcP148KEX2tgBUj4FJfPMYBv
         znen+dpG8bjvLSZ3dqM1JsqVfKubqXKfWwa2VwSfRe2cWosVA+lxNo3Y2LVpAo+1qngA
         Uftb1M5y7ofewojMmDhVNATyc+OC1qG1QSpX3/R6L52YAC6x/ve3ClqXncKb/3p9Yf3l
         so4RzZpzI1hUFsZDDayk5w2e7jOki+EeOosIYTpV6ueknyZ7lvzTyBHgJmPjVKxaDlXC
         opRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692696962; x=1693301762;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/a+KHz8Q2GH1ybhNDY2HPcK7sGl9mgepl0h/FvpyaA=;
        b=iAmOOTRMkUvPX4Wah9e5e8/y8nRllJKqTDN4y4KXYaC2H+9eKFhVcCoTSnMm4pbQSV
         bSHUD9CxoLzqoregmGQGhYfWs03/Jn5ypq1aJfwauhyWVIZwAfXXR9UpTyw0O5nUf7/M
         ezanfBEFIAhSIV4jhBK46W2fyjgRQbe/DV1mHCSGvFSpMZvAgSJiS9xnD47cuPXxHzh4
         f/3t4hZAdeR8yFbza5uECdFDedmKRWytZHW0t26W+POumTRMOl7P0+/QoxaLwN2W8yEr
         +0e5Y2hgPnwR1b51/NysyzosZ9OMQo1UmqX7wducrKgqSOS3VeQlVJ2ImyvXlNfcYLUR
         P0HQ==
X-Gm-Message-State: AOJu0YwFDebvhlx/TUfmZanXP/BPGs/HhccAm/1MKoZSaHv22ekUbRSt
        A83LHPZnktEeU3h25ku1Qx94JMrsmN42WWmQzAE=
X-Google-Smtp-Source: AGHT+IH3unqf8UNst/mdJ36DfNgECeFAQaH9RZ93ADVQ0jAsfJE4d5BwJzIuBOim+M/z5DiEDVUeCQ==
X-Received: by 2002:a17:906:310d:b0:99c:ae01:a6d0 with SMTP id 13-20020a170906310d00b0099cae01a6d0mr6791509ejx.68.1692696962212;
        Tue, 22 Aug 2023 02:36:02 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id bv24-20020a170906b1d800b0099b8234a9fesm7850451ejb.1.2023.08.22.02.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 02:36:01 -0700 (PDT)
Message-ID: <720259b1-1f7f-fa86-2480-3b3d8d3fca33@linaro.org>
Date:   Tue, 22 Aug 2023 11:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/2] media: dt-bindings: media: remove nokia,n900-ir as
 pwm-ir-tx is compatible
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 <590a7e74-5af1-1aa3-366b-4fef039e5f66@linaro.org>
In-Reply-To: <590a7e74-5af1-1aa3-366b-4fef039e5f66@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/08/2023 11:28, Krzysztof Kozlowski wrote:
> On 22/08/2023 11:12, Sean Young wrote:
>> The generic pwm-ir-tx driver works for the Nokia n900, so nokia,n900-ir
>> can be removed.
>>
>> Cc: Sicelo <absicsz@gmail.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
>> Cc: Pali Rohár <pali.rohar@gmail.com>
>> Cc: Pavel Machek <pavel@ucw.cz>
>> Cc: Timo Kokkonen <timo.t.kokkonen@iki.fi>
>> Cc: Tony Lindgren <tony@atomide.com>
>> Signed-off-by: Sean Young <sean@mess.org>
> 
> Unfortunately not much improved here, so:
> 1. Please use scripts/get_maintainers.pl to get a list of necessary
> people and lists to CC. It might happen, that command when run on an
> older kernel, gives you outdated entries. Therefore please be sure you
> base your patches on recent Linux kernel.
> 
> You missed at least DT list (maybe more), so this won't be tested by
> automated tooling. Performing review on untested code might be a waste
> of time, thus I will skip this patch entirely till you follow the
> process allowing the patch to be tested.
> 
> Please kindly resend and include all necessary To/Cc entries.

Ykes, my bad, the DT list is there. Therefore you can expect Rob's bot
with complains.

> 
> 2. Test your bindings before sending. Especially if you decide to
> opt-out from automatic testing :/

Testing before sending is still needed, though.


Best regards,
Krzysztof

