Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2052262C55C
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 17:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239126AbiKPQuw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 11:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234201AbiKPQu2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 11:50:28 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A30013F1B
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:48:34 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id k8so30894531wrh.1
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GulAK/7snvXAouNEsNNAeVYcgo1TUdGO4bRcEckrR1Y=;
        b=G4uNhGDCBXqpMYU2HWqa3qtC3w6svG5OWuZ5ZI6rrlz7wrEMDP2Sk0If96cMgzfKr0
         gRzbx4WRS7tBo+SpIhqHmPsjrSVwoB+RwuIe+UYYX47hUSjEnmQd3mS+gIdB6Q47nJGS
         oRf19vBLlMORY3nD/bASj0OO2zOcL8fPTrwTDPDCibGbvnxxvZPZbTH+3OGC5+xzLdli
         4YHqQAxqUP60GeW0n/em3ZlCBYbsbkL4ClThhflxEpXVe7NkbqWdeANaOF1DzQWyIl16
         5qCDKJvlZJfU9DUWxYMGeKSj5EdxBAOLtD6ZErHapQ4vcw8yiNm6P4BeM1l8SnTE8+pC
         i57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GulAK/7snvXAouNEsNNAeVYcgo1TUdGO4bRcEckrR1Y=;
        b=XyR6byTmZOYeQ9njjq3kGI1hWrxGFqQ48cKv9162AG6idX9ec0w6rfYGeW8Bc8st5E
         Wo8lOJIL47Hwf+9Zh5FlukXa0ztZKl/QdmVZIRYMzyC/aRdPQQ0XJUXNjxKZ0FZtEevn
         YbpSNodBMchGXv+basQFERA6TiFRNUkjsxpk40aeoDyHAApkvVJF5+S162eC66/vEkIX
         g3qaFPHOLVij/7YoaIBVol7MYgLS+ZLsCP/ecu9lMkISySHxG9mLOjFmre46q/4ZYwUI
         aRbOZ/yulrBZdha9cosnGFmdB46vdILRz0gJAhIYA0/lAtX28qfN+TQtBCnv7MZOsx3X
         ykuw==
X-Gm-Message-State: ANoB5pmCSO9fiKRaDZKBllB5p3/Td5SKgCI/yHfwJgW8XNeDJl5SK82b
        qNJbCVwv1gpPLFsh4Rx7H5Opuw==
X-Google-Smtp-Source: AA0mqf4cxcwpNqUsboKILfa7LH7qYFI5vAu88bCaLd6u5zEJF44qGD1XYGrScNItBu8oodAsvi9FfQ==
X-Received: by 2002:a5d:5684:0:b0:22e:53c0:ead8 with SMTP id f4-20020a5d5684000000b0022e53c0ead8mr14458249wrv.210.1668617312864;
        Wed, 16 Nov 2022 08:48:32 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g17-20020a05600c311100b003a2f2bb72d5sm3365257wmo.45.2022.11.16.08.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 08:48:32 -0800 (PST)
Message-ID: <3f5af01e-8d7d-bab1-b6bf-e1d6fc8e4f33@linaro.org>
Date:   Wed, 16 Nov 2022 16:48:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 5/7] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: Add navigation mezzanine dts
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, robert.foss@linaro.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, robh+dt@kernel.org,
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
 <5298da29-4f97-5bab-7252-380a15c06b71@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <5298da29-4f97-5bab-7252-380a15c06b71@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/11/2022 16:45, Konrad Dybcio wrote:
> Ok, but is there anything special preventing you from adding
> 
> csiphy3_ep: endpoing {
> };
> 
> under port@3 in 845 and have it working? Does it need more driver changes?
> 
> Konrad

I've tried switching it on and it doesn't "just work".

Removing it seems like overkill to me and to be honest feels like a 
retrograde step.

---
bod
