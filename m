Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 435C877E93E
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 21:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345588AbjHPTDQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 15:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345584AbjHPTDA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 15:03:00 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA512700
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 12:02:58 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fe2ba3e260so67396075e9.2
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 12:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692212577; x=1692817377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JyfZGIe8QIpo/zFgxfH9BIcgCAtghxQQLdOWakBNcLQ=;
        b=qzJNTkKp0Z7LDpd4dRWi4Ljdzjh3lIJOWx6ZZMHR5JFGUP8vuRiDd14bUsn1hnbC+A
         yLgjXwo2k0Wx8iHEFWosVUn/XAC+aIOY3kYqWewL5iW+vs/llm8dex0bl5AN1EWEWalb
         HZWRW/IKOTyBVkwRSbCM/2pLfHIaIYXrZ8pm23Zj0eUvPD+gZ3ysTjOgc45n3MaT8Aw+
         A0WJ8OljF4N2IHgSk5RvxiYQcKe1bZAlHaVp9P1kpIKjC1zbxDrPSwV/9JDk+g7Gw8UV
         aobDkruTMFuwYOIrxT/z8IuJ+6sHq1hJjxM/H2JRCpedagOpFV3aiA6OrAl4ccCvkASn
         VYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692212577; x=1692817377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JyfZGIe8QIpo/zFgxfH9BIcgCAtghxQQLdOWakBNcLQ=;
        b=UOLwSCVurzVSnAr5EO1jXwbB6q/0YfJ1W37ilOPYcrYcwuZRbgfA499MqLPwVrhWbl
         4NfXpdaNPDZYwhM2dYU2+3K+L9TyETpjKmeFdqQDlMA1FG8TNKUxEa7+xi+Fk/Sy9hpB
         5g209dhthFxLtuElTg2o5072QI6z52dhLEV102hAlBAeyNGET6CPiECbH2Y4FL4QHG+2
         I/qM2lFmMTUAAh+7YAWuhd5kCPpPFaLc7o3sSAH9OicDklH1hGy2usefWMZKQZ8fKtG0
         b4dcW6eVofnGfqcPMZTpXpQ7F+K4RxkVSH4G9jPvvAx1H2Q5+TiMLpndkPssX7mxfMtk
         aIIg==
X-Gm-Message-State: AOJu0YzvayO6xOHsEZLPmdf9nkE/5so4Gwq0ouSoJVtYljAjYhAGh5PN
        N3m9dbXvxGCtkO1rjzZ95sPlbw/ApOddURET99c=
X-Google-Smtp-Source: AGHT+IFc2XJDc5VMqSl4gXGVgBhk+WtsXNHc22KMT3tTtcmKPoPvenFckMrirB1W2x7hfD0FXNFjiA==
X-Received: by 2002:a1c:ed0e:0:b0:3fa:95c7:e891 with SMTP id l14-20020a1ced0e000000b003fa95c7e891mr2307962wmh.35.1692212574096;
        Wed, 16 Aug 2023 12:02:54 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c230c00b003fbc9d178a8sm287379wmo.4.2023.08.16.12.02.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 12:02:53 -0700 (PDT)
Message-ID: <0d8ccc53-1a4a-8a0a-6886-f7bf9c5ebd75@linaro.org>
Date:   Wed, 16 Aug 2023 20:02:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 02/14] media: qcom: camss: Start to move to module
 compat matched resources
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, rfoss@kernel.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230814162907.3878421-1-bryan.odonoghue@linaro.org>
 <20230814162907.3878421-3-bryan.odonoghue@linaro.org>
 <0d4d7d4b-9cbc-40df-98f5-3c9696bf6b13@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0d4d7d4b-9cbc-40df-98f5-3c9696bf6b13@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/08/2023 18:10, Konrad Dybcio wrote:
> On 14.08.2023 18:28, Bryan O'Donoghue wrote:
>> There is a lot of unnecessary if/elsing in this code that arguably
>> should never have made it upstream when adding a second let alone
>> subsequent SoC.
>>
>> I'm guilty of not fixing the mess myself when adding in the sm8250.
>> Before adding in any new SoCs or resources lets take the time to cleanup
>> the resource passing.
>>
>> First step is to pass the generic struct camss_resources as a parameter
>> per the compatible list.
>>
>> Subsequent patches will address the other somewhat dispirate strutures
>> which we are also doing if/else on and assigning statically.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
> [...]
> 
> 
>> -
>>   	for (i = 0; i < camss->csiphy_num; i++) {
>>   		ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
>> -					     &csiphy_res[i], i);
>> +					     &camss->res->csiphy_res[i], i);
> &camss->res is used quite extensively, so I think it may be a good
> idea to keep the variable there, just make it point to the correct
> new thing.
> 
> Konrad

Sure that makes sense

---
bod
