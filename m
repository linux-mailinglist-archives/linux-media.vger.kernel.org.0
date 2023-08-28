Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8C0578B896
	for <lists+linux-media@lfdr.de>; Mon, 28 Aug 2023 21:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbjH1Tlv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Aug 2023 15:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233131AbjH1Tlg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Aug 2023 15:41:36 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF84124
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 12:41:33 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-401c9525276so13534305e9.1
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 12:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693251692; x=1693856492;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VVVU3xEelEp+/RsI5JfEyIwW02b+82orcIdT+6JDihk=;
        b=PhIZ5bfCavvRSNfXrDZHhkG2X9Aoao/IijcU4P3RlcRAK8puuwllH0En7keHO2nAma
         LgR5mIgJ/Dz771ARHbjHnVWEhpC7RrIX4BgFLBXygT4ilqUMLfe1BZ0A48yEyP8zXUx+
         3qsXQTDClUVVPz78w3FqK0sa5njERp0CDdfph4ET+7a9/tF1zk00IFvVpi1O/2NC1Bm2
         qFgNAmQJJtpf/rU684NyVTVYyrKPXIz/aJVpfBwZclYa/dOzDXHVAY2+jKh1RlM9rcyd
         WgQkvhz9PCb68bNWAYtwn8Zr3RYkY7RpWlNP2AnpDvGiYHBFy2mMnki6V2e9T2pDcpNm
         BC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693251692; x=1693856492;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VVVU3xEelEp+/RsI5JfEyIwW02b+82orcIdT+6JDihk=;
        b=II0rOqyYfgwReYAD5GsGwFWPYBRo1zyzQYRn7EC5m0V3XoQIWoDGYmuGvSdtuE25Ti
         NwO3MIezLuhsvLNbq+io/o6dcTwzeKAb2HrEskf1rOVGaYCV1zazx1+Ay3SNEvwiVJvZ
         sKHp+c3PPiMWR/RCSTlZ+cQ7kvlbOnRu9MW5ELQNe8eo4tHO59beN2lWkwzNXulKOSVZ
         hL0k37aeefEwTloodUaooyLSNqWlln6tUYe/tva+oKVNVa8NatlP2NxfhEFdG3Zm2hx5
         o5g+XuLkemzfMfc2DSMgw7+ozkUOaYY1FoJ6sJDvD9lUTwHU0tsExzJ94dLLisoKehx+
         Z1Tg==
X-Gm-Message-State: AOJu0YyLpRMsoowp5T7gQMTPsufritOCqd+ZXIzmLu1yzqTrF6p98/H2
        ZsoQmFscyErT0KwWDXEXyFFHjw==
X-Google-Smtp-Source: AGHT+IElK01TSrLEb2DvEcfcFpvHpE6ke2T6VhR4gTKJwH7eSku8DjCZsRumovR5fTbe5Gk9RRmvww==
X-Received: by 2002:adf:e802:0:b0:317:e68d:f862 with SMTP id o2-20020adfe802000000b00317e68df862mr20872947wrm.37.1693251692242;
        Mon, 28 Aug 2023 12:41:32 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n8-20020a5d6608000000b0031c5b380291sm11364474wru.110.2023.08.28.12.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 12:41:31 -0700 (PDT)
Message-ID: <ddc36a54-1ac9-b7e9-bad4-04a93ee493fd@linaro.org>
Date:   Mon, 28 Aug 2023 20:41:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 07/15] media: qcom: camss: Capture VFE CSID dependency
 in a helper function
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     rfoss@kernel.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230823104444.1954663-1-bryan.odonoghue@linaro.org>
 <20230823104444.1954663-8-bryan.odonoghue@linaro.org>
 <20230828184716.GM14596@pendragon.ideasonboard.com>
 <9fb41649-b4fb-d652-3207-7c8ff8b32f24@linaro.org>
 <20230828194010.GF17083@pendragon.ideasonboard.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230828194010.GF17083@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/08/2023 20:40, Laurent Pinchart wrote:
> On Mon, Aug 28, 2023 at 08:37:44PM +0100, Bryan O'Donoghue wrote:
>> On 28/08/2023 19:47, Laurent Pinchart wrote:
>>> Hi Bryan,
>>>
>>> Thank you for the patch.
>>>
>>> On Wed, Aug 23, 2023 at 11:44:36AM +0100, Bryan O'Donoghue wrote:
>>>>   From sdm845 onwards we need to ensure the VFE is powered on prior to
>>>> switching on the CSID.
>>>
>>> Based on the discussions with Konrad in the mail thread, I would record
>>> here the reason for this requirement.
>>>
>>> What happens if you unconditionally power up the VFE prior to switching
>>> the CSID on ? Will this break something on platforms older than SDM845 ?
>>
>> vfe->power_count will bump and you will be fine.
> 
> Then maybe that would be a simpler solution than having a
> device-specific power sequence ?
> 

A fair point.

Worth a try.

---
bod
