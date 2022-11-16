Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3667162C550
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 17:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbiKPQtI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 11:49:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234016AbiKPQsx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 11:48:53 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D931359873
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:45:38 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id l8so22521857ljh.13
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpHyPkDpsRozn0AtOsKM9S7D+d9GvrcKAUSTyqZHDGg=;
        b=fmapstHOEOOXztW3n9wWjB69xQ8C+4OEi/RhLBWvn5thfb0TR8UOWwocX2j6cCizkg
         MFLZdVAfENfCbW5FClp1uZNCifu6470eP8rbm/prBV2Mlnh6iO3OAEEyyOSP9UHfiYNn
         mz9MT96rdE4vVtoFrjVKqDQZRc3hMj8fNDO1uPSZe2PPh6jRCQbY39MGKWlQAZm4OmMj
         PBnjs1+B2OaQ6W8BoKEU8dB2f1HjLGDyEiGgGhXwVBOvmDGMICA+65W2bCSBj7duMj04
         4BTfNaBqGq42nURcc7QAyiATV2tQahwI/ez3PKdvRznFgw0VgH01Han9ObhmXEbh7skl
         64Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lpHyPkDpsRozn0AtOsKM9S7D+d9GvrcKAUSTyqZHDGg=;
        b=R6tX7oBgFpkk1AzhZ13XpUzGy2SwEOktyC7HQFHvP/Ghdm99LdiIF7nBfZFmtkeBU2
         4sQ9Dzkj3oEN+dJqS/rh9rCLjX/tMMDIyojAX2brLKlhYrGU3FJ3mftHkxHEsahDp+5i
         FrDFtVkxwQtUf4lKiVU7pfM/bKXufLlDIg4AsPKT6DwW0ad4FUxeK+Gv5vtaJJUbrswp
         8qxqE/GfELR61b7uShNUBVci1034EHqJZZLZMA+MkC3p39KNyx8HGf6dmmfYyDSm/eVO
         Sz3li+B+hPgTqqpvl9C+HQp042BTFpro8PfvmzdW2aMWBrA3E0rPy7plAJLozaTKMPW1
         V66Q==
X-Gm-Message-State: ANoB5pmtX+0lcR6U082Gr8vqEVf9bQ1cQ62Bbi6r2Uqj4UtInHLt/1tK
        E6Y9U5YrJXFQWk0fzsvcfIn50A==
X-Google-Smtp-Source: AA0mqf6SsU5kpjeZhugqBx765fzZIdK7aLH98X2Kk2/h9+YJ0GzILaHOZKbvd3izXsXKVWPoOw3i+Q==
X-Received: by 2002:a2e:a4a4:0:b0:26e:61e:af25 with SMTP id g4-20020a2ea4a4000000b0026e061eaf25mr8779183ljm.275.1668617137298;
        Wed, 16 Nov 2022 08:45:37 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id q23-20020a056512211700b004a2588520f5sm2676238lfr.166.2022.11.16.08.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 08:45:36 -0800 (PST)
Message-ID: <5298da29-4f97-5bab-7252-380a15c06b71@linaro.org>
Date:   Wed, 16 Nov 2022 17:45:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v6 5/7] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: Add navigation mezzanine dts
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221116162801.546737-1-bryan.odonoghue@linaro.org>
 <20221116162801.546737-6-bryan.odonoghue@linaro.org>
 <730467dc-419f-bcb6-c4d8-24951b4dde62@linaro.org>
 <6fe6723b-842e-7a56-a15c-6b7e044c7d45@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <6fe6723b-842e-7a56-a15c-6b7e044c7d45@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 16/11/2022 17:43, Bryan O'Donoghue wrote:
> On 16/11/2022 16:39, Konrad Dybcio wrote:
>> I know you're just moving things around, but.. any reason this thing 
>> is still disabled?
>>
>> Konrad
>>> +
>>> +        port {
>>> +            ov7251_ep: endpoint {
>>> +                data-lanes = <0 1>;
>>> +/*                remote-endpoint = <&csiphy3_ep>; */ 
> 
> Because so is the remote-endpoint here.
Ok, but is there anything special preventing you from adding

csiphy3_ep: endpoing {
};

under port@3 in 845 and have it working? Does it need more driver changes?

Konrad
> 
> ---
> bod
