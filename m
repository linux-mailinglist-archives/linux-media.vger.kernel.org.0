Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBC42FA770
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 18:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393604AbhARRYR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 12:24:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407068AbhARRWc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 12:22:32 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76E24C0613ED
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 09:21:19 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id r12so13392136ejb.9
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 09:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qnB4DzrPNMnXyDRbW/fKIhjUt28zZRbhzh0syUvRk8Q=;
        b=YIQ8rQ7m+skTr2gsWSut5kKgsn+UN/xcZJprMyG77RdQPxlWcYPiJLNYm4mEpDPT0G
         +vU+4sR02Ed+1D3Vvs4h+BO8xakl4k+2le+CFLKmy7VqiloX7g87Db6GXMwUGQYOGrff
         1FeGgKAIHMltpMhff2H9IE6DaIo0FjKQda0goLLiasS3cNFLsz2eaCglkRkbhaCd8b2Y
         qJQ8pAUZudVIiFwwm65t7esoUtAVP91WkyfaNQS5GKKVb/vrCEAfqt/hEL+uvA7P3rCJ
         wU2m6lHNRDtLSnDwL3WiDqT7ohcd2PW6AOq8Ygx7yrcGG79ze62ZGWT5QmCmArzKyCE9
         dx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qnB4DzrPNMnXyDRbW/fKIhjUt28zZRbhzh0syUvRk8Q=;
        b=RBZb7cLxLpB/O3hZtkOccdvoD3fG8ewlP7z+6g/Vpdq61AODZPsXwRbfieHsXI7c/h
         REzixK9mBJ6cQSaD7gagPWWADkmTUN1+vO1s0zbHGcPp01z1JZUbPYeky39r1fgZ9GdU
         Gn+s3yg2oAzcLAjE2uJ4wWSfqbrTVCrgcdxFFnI4T3JnI+yE7Ib8W7ZwhikKlVw/cTc1
         +kNiIFioy8C5NQ4hBGcU69IawIIKp0cnrrSX/r5fgdSn5BezqhDXd3gVEMyv79XFT6R9
         gxlPUTci5CwgzgKPJD5lky8srXFifTz/7a8O/cYDVXaES4nPF9cTCT0DFKzGXW9KyVzI
         NnJg==
X-Gm-Message-State: AOAM533DfpH1gIli1frxEdrUdI3n0yYo+vfZ+yUPJfenYUI3qEDj69C/
        95/rbg/6fnSivxGdTFT0Id75IA==
X-Google-Smtp-Source: ABdhPJyH5KG45YKLMKvbjHjl4OUqQ13N/a16EaRojSEzxLiHZCTfWc+mJFgK069gFA6roAqQuupqWg==
X-Received: by 2002:a17:906:1958:: with SMTP id b24mr450993eje.263.1610990478214;
        Mon, 18 Jan 2021 09:21:18 -0800 (PST)
Received: from [192.168.0.3] ([84.238.208.220])
        by smtp.googlemail.com with ESMTPSA id h16sm9107900eds.21.2021.01.18.09.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 09:21:17 -0800 (PST)
Subject: Re: [PATCH 2/2] media: dt-bindings: media: venus: Add sdm660 DT
 schema
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Rob Herring <robh@kernel.org>
Cc:     mchehab@kernel.org, phone-devel@vger.kernel.org,
        linux-media@vger.kernel.org, robh+dt@kernel.org,
        stanimir.varbanov@linaro.org, linux-kernel@vger.kernel.org,
        marijn.suijten@somainline.org, konrad.dybcio@somainline.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org
References: <20210115185252.333562-1-angelogioacchino.delregno@somainline.org>
 <20210115185252.333562-3-angelogioacchino.delregno@somainline.org>
 <1610898357.209470.1730313.nullmailer@robh.at.kernel.org>
 <890cbed0-0f4c-f8e4-5d91-c0cd40edde1d@somainline.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <3f28fa3f-b86b-0c63-a8b7-1c5e18ab9a49@linaro.org>
Date:   Mon, 18 Jan 2021 19:21:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <890cbed0-0f4c-f8e4-5d91-c0cd40edde1d@somainline.org>
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/17/21 9:23 PM, AngeloGioacchino Del Regno wrote:
> Il 17/01/21 16:45, Rob Herring ha scritto:
>> On Fri, 15 Jan 2021 19:52:52 +0100, AngeloGioacchino Del Regno wrote:
>>> Add new qcom,sdm660-venus DT binding schema.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@somainline.org>
>>> ---
>>>   .../bindings/media/qcom,sdm660-venus.yaml     | 164 ++++++++++++++++++
>>>   1 file changed, 164 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
>>>
>>> base-commit: 012bd807cf654b992cdc4db7eab85c1e95f9d571
>>> prerequisite-patch-id: 734bdefdb043a8f91a48916246cc9a36fb5966e5
>>> prerequisite-patch-id: 999517c02973237996492a41ed5bfc2990083932
>>> prerequisite-patch-id: a48910425fac61948a7a26bec4d40d63e3368569
>>> prerequisite-patch-id: b1a1a4216eed0d04dd16e6e8e1053dee185d06d8
>>> prerequisite-patch-id: dff12be2631cc21ef1c3c930fba49d979f5055fe
>>>
>>
>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Documentation/devicetree/bindings/media/qcom,sdm660-venus.example.dts:20:18:
>> fatal error: dt-bindings/clock/qcom,mmcc-sdm660.h: No such file or
>> directory
>>     20 |         #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
>>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> compilation terminated.
>> make[1]: *** [scripts/Makefile.lib:344:
>> Documentation/devicetree/bindings/media/qcom,sdm660-venus.example.dt.yaml]
>> Error 1
>> make[1]: *** Waiting for unfinished jobs....
>> make: *** [Makefile:1370: dt_binding_check] Error 2
>>
>> See https://patchwork.ozlabs.org/patch/1427279
>>
>> This check can fail if there are any dependencies. The base for a patch
>> series is generally the most recent rc1.
>>
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit.
>>
> 
> Yes, because this depends on the commits that are mentioned in the tags.
> Is there any better way to add a dependency on another patch series?
> 

What is the status of mmcc-sdm660 clk driver? I guess we have to
postpone this until clock driver is ready for merge?

> - Angelo

-- 
regards,
Stan
