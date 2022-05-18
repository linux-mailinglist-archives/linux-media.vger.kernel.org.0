Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43ACD52BCEB
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 16:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237580AbiERNQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 09:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237699AbiERNQO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 09:16:14 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E1BBEB
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 06:16:11 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id t6so2680861wra.4
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 06:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Rh6wQCBkR7oMyW1zN2pausvljqsjVZL3XJzU9SfDUpo=;
        b=cUn1kKMmi7cdY3ctWFDdkzs1a7hfg7f3KwiCEmqRvtfO+5B1msE1lkNXIV604u5B46
         GRD3RJzZprWhcTD3LYEtRq4ROL49cBVK8eMHHUMRc+rj4Rsb/0vcLB5gkeLD94sLcrjy
         lqFK8AXXhhMtEXN+Viq9clTePd5qUUTR/obCXuf+cR/ArKoTZGHcnCRhER44T58M6nHn
         ARXYuGw9sjFh/NDXxr4kX9UcRjPlalTpJz6tFea8JlvFIbiFdixCV/v0aZkC/oEKUL+d
         o+jNQ2CddvVwozyni9e+aIAIq1yaoCglL+V7JNc3r2RPr/lu9gnPc6ni1sBmAQDtr7VP
         +Igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Rh6wQCBkR7oMyW1zN2pausvljqsjVZL3XJzU9SfDUpo=;
        b=aBPE61IqZRoMPkBtYtQ93LU4KPy5p8JyxZ/6GjT3s4Hz45FCY9ugvHdQcpBE/NEz9G
         eo8tQftDLoZnKw1usW3GQnGjW7mMvw7Ffr+QSnFWXeHQUtAgFXnwA9mye7Og+f1Hph4Z
         JlTHAqyHbq3AJxBJ5BVYbxEPqE5ztO3Pbd3THnxpKxvHFXOxfOvGGcd9YH7DPa/V2oJr
         ynzoVjZg+XGbeQh6K4H7EvraDEWxpBNboqruibO3lNLYW9JFomER/SIKl5M/PgoCW0Ol
         kHBwVfEmcrKh9+r7jVPPm5S6emn6QBTK3GvfSzCVJUIFQy8T1OoK1eHazfCOuIKwzxSO
         HBCQ==
X-Gm-Message-State: AOAM532kEdXaytDxd66XRoJc1YeFeyKskA7YlsPfwFmDoa9Xq8+xbtmM
        rGUhAnR7VxRDyzmnrOsqspnMhA==
X-Google-Smtp-Source: ABdhPJxka7e9stxcPVXKzz/VlWk0cco0iF3hAocbvpboVeT9UZlyhCVjUgDZzbAcVNaBrQAM09bNpQ==
X-Received: by 2002:a05:6000:1143:b0:20e:59b5:f0c with SMTP id d3-20020a056000114300b0020e59b50f0cmr6473605wrx.398.1652879770461;
        Wed, 18 May 2022 06:16:10 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v9-20020adf8b49000000b0020c5253d8d2sm2109638wra.30.2022.05.18.06.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 06:16:09 -0700 (PDT)
Message-ID: <f691000f-00f9-33e7-26f8-564f52f44a19@nexus-software.ie>
Date:   Wed, 18 May 2022 14:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/2] media: dt-bindings: media: sm8250-camss: Add
 power-domain-names property
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220518121104.951621-1-vladimir.zapolskiy@linaro.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20220518121104.951621-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/05/2022 13:11, Vladimir Zapolskiy wrote:
> QCOM SM8250 camera subsystem depends on three power domains, at the moment
> all of them are not differentiated one from another, however the power
> domains compose a hierarchical structure with vfe0 and vfe1 as subdomains
> of titan_top, also managing vfe0 and vfe1 separately allows to get more
> fine-grained power control in runtime.
> 
> The change relates to my review comment for v2 of CAMSS on SM8250 submission:
> 
>     https://lore.kernel.org/all/13ad033e-cd5d-3a8c-b036-50a3ac4245c0@linaro.org/
> 
> Apparently it becomes important to manage CAMSS power domains much better for
> newer platforms, this referes to platforms with Titan GDSC, for instance CAMSS
> on SM8450 has 6 power domains, and dealing with them in bulk is not an option.
> 
> There was a note in commit 2f6f8af67203 ("media: camss: Refactor VFE power
> domain toggling") about problems with power VFE domains on/off, but perhaps
> it's related to the fact that Titan GDSC is a special power domain and VFE
> are subdomains, the latter shall not be enabled earlier than the Titan, but
> the driver did not construct a proper hierarchy and leaves a room for races.
> 
> The change should have no implications on any SM8250 CAMSS users, since
> none of the supported in upstream boards enables the camss device tree node.
> The correspondent changes in the driver will follow this dt specific series.
> 
> Most likely a similar change is required for SDM845 platform, but it would
> need additional investigation and testing.
> 
> Vladimir Zapolskiy (2):
>    media: dt-bindings: media: sm8250-camss: Add power-domain-names property
>    arm64: dts: qcom: sm8250: camss: Add power-domain-names property
> 
>   .../devicetree/bindings/media/qcom,sm8250-camss.yaml       | 7 +++++++
>   arch/arm64/boot/dts/qcom/sm8250.dtsi                       | 1 +
>   2 files changed, 8 insertions(+)
> 

This doesn't break anything for me on sm8250

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

for both
