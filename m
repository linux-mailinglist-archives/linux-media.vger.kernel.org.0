Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDBC574765E
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 18:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbjGDQXQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 12:23:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231285AbjGDQXP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 12:23:15 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D8AEE
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 09:23:14 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51d810010deso5602860a12.0
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 09:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688487792; x=1691079792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=87qn+jDFmVjTjNNSNN4hyKbPaUWhaGHKw5mutwlghV0=;
        b=thqIhKjk+3/lpsVetwxdSSKRYKPie8Yu9UjOxT00FG6lJDDk+cB3qEV8ST5s9r03JU
         zJIWyZwoj7zgqNV4bVsM0ZKU6pegDD8RoYyBaeV+OdqsSSJNWLtOKI1BzQyrNXYdlUzu
         0+tW8+zN/UVYPusbOoYjuF7FHBglodu34DadggW6qU5Z8lTaemgfwtHHvwM+nXm/62NQ
         ucCACu17Lx2174722iVdgZe3uTnikofS/iVLJ3dnQ2u0z5zvdUqVVbE9DBx90Gtr0vLR
         3B+ySh7CwpA6V/Ikw0og//MbN/8mYOifyyxu2UHjVprnWfLvCkPSaoHBUSSwEZRicFYB
         LUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688487792; x=1691079792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=87qn+jDFmVjTjNNSNN4hyKbPaUWhaGHKw5mutwlghV0=;
        b=Pw0yW/ibNRfJP5VuE78CUGRO30vQcr3hGzQdDvlIWsNYgbFxmS/iuo9V4SdSp1aMlu
         eV+MQZUMZRE4QiL+4/0YpdKW7W87ZD/IYaLnoE3H/vkoUUWeUjQA+vFbo+uwZTIqGbQ2
         sMPRXJYP7iDTrkFrqm681Qd/kP8LUZICYHgqn6DgnAUq4Ou0XLd8/2D/uStf8JJlxL59
         B20j+H0N3qtCcNUiTrinh4bix+2Z3rQ3Huj9tYJn7dW5mYZE7JyrbSRmAthZh/lbl2gI
         +pyVGSRMhGQsXgme9D9yJvZZQE7Ojft1XdBcbZ+n8QI8039b0ZXEtuvyyC30OEYYhix4
         MuKQ==
X-Gm-Message-State: ABy/qLZC/a/u6z3TypcDN6ZxhCuUPi8NsTYRDm7x6QiK+EnnULJwGAiP
        i/3Xz2bMq7YERlTa+gcjptUTiA==
X-Google-Smtp-Source: ACHHUZ7/NIpswkXshblERoeHprWOJkw+WrHbAmIg2j08RnIJ3GKG/arya5htPe+byj4V25F0fpNT4A==
X-Received: by 2002:a17:907:9867:b0:97e:56d5:b885 with SMTP id ko7-20020a170907986700b0097e56d5b885mr8788602ejc.60.1688487792504;
        Tue, 04 Jul 2023 09:23:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ha22-20020a170906a89600b0098e0c0cfb66sm12873649ejb.38.2023.07.04.09.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 09:23:12 -0700 (PDT)
Message-ID: <e9fe352a-92fc-023b-8ce2-9a82cbeaada9@linaro.org>
Date:   Tue, 4 Jul 2023 18:23:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH 3/3] ARM: dts: Add Chameleon v3 video node
Content-Language: en-US
To:     =?UTF-8?Q?Pawe=c5=82_Anikiel?= <pan@semihalf.com>
Cc:     Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dinguyen@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mchehab@kernel.org, upstream@semihalf.com, amstan@chromium.org,
        ribalda@chromium.org
References: <20230630144006.1513270-1-pan@semihalf.com>
 <20230630144006.1513270-4-pan@semihalf.com>
 <20230630-scrimmage-antelope-7d1f82d491fc@spud>
 <CAF9_jYT1Fz4hBQrNtgkM6mU-JVH=ZxsJnkaLDsa5uoEV_hTLVA@mail.gmail.com>
 <df7440e2-58b0-9f12-8f37-4f0d9050f934@linaro.org>
 <CAF9_jYSwDdyE6mj8+1bA23MWmFHdm16jTSYaRQiF1kzpUtkMNQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAF9_jYSwDdyE6mj8+1bA23MWmFHdm16jTSYaRQiF1kzpUtkMNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/07/2023 18:16, Paweł Anikiel wrote:
>>>>> +     soc {
>>>>> +             video@c0060500 {
>>>>> +                     compatible = "google,chv3-video";
>>>>
>>>> This compatible does not seem to be documented & I did not see a comment
>>>> about the lack of a binding in the cover letter. What am I missing?
>>>
>>> Yes, the compatible is not documented for now (I'll do that in a later
>>> patchset), sorry for not mentioning that in the cover letter.
>>
>> You cannot add undocumented compatible. This cannot be fixed in "a later
>> patchset".
> 
> I meant later revision, I'm certainly not expecting this one to land
> (I sent is as an RFC).

That's not clear. RFC is interpreted differently by different people.
Some just ignore it entirely, some still review.

> Is it really necessary to document the
> compatible to get any form of feedback on the overall structure of the
> driver?

Depends on the person. Anyway no problem for me - I will just ignore the
patchset.

Best regards,
Krzysztof

