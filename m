Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E672877E953
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 21:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345688AbjHPTHF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 15:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345689AbjHPTGm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 15:06:42 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 171A52708
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 12:06:38 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe1d9a8ec6so1015235e9.1
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 12:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692212796; x=1692817596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qdPKjc9qD6wn8s29yTBal1f/rHZuFp7un6OBRgav73g=;
        b=b6TznBKsWD8m/2zQ8CHW9e7lojP6EkSGHVtqDcYVBLwY367o8Fz/W09glNY4p2PeAW
         Y3pchalozgaFXPbsfVrf2JnjqV7laOdhIvgQH44cjtfPkEzTxh8n1pbCBwJaaKoo4CBd
         pV3oc31gHDlzW17j55HWzIBEjkcTZTggdjFSrw2DVwd7PBuM5DIpyRhLnb2v6S4UYgC5
         TMZluZZMpwgHjsiKhFX4zVF6DDJc3ih44WGtPRjERpmt4RPqmgBJ6q8gjUDs9mVNRsrh
         4oWG6tjiylcNA2LFEs67p/rR+vklgSEfw2hWsb+d5vAPElTNVmFAlQBEru4KSbItWVck
         ljyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692212796; x=1692817596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdPKjc9qD6wn8s29yTBal1f/rHZuFp7un6OBRgav73g=;
        b=Y+n2CYZoFoyb6/sSlDAB0JzbtoScLpcvJ6M/Bd0jOXdyIQzCvR2Xw5cdPFWJYQGdmZ
         fDkfC4uq9wTM5xWH/SE5uG2jhf1A2Mj/9q+2XlBxpJhS0JPx4f0AIIQczVPsvIRtRpJT
         KEUbSIeLZQdqBPeWW8mX2IxH2KwD2q4ARKlKHxGckkrrOIZ8OajxNt8ZehtW6Xdr9Kpk
         zUXtZ2ogtHrTvhIO6iHE0EWcppUREWzU7a5cnBU0hvVdDwPMbiT3dLItqhou3dPynwBb
         fItQmd2U3Mi/aaSttYIqsxmLCGjFAod6SZslf2xbjIgCl0HSSBUkJ3iKN1ZlKl4i9NiU
         aILA==
X-Gm-Message-State: AOJu0YwplZIXZcSyxUpLzyGKABjVw0QAr/UqNxXDDTicrr6yT7Ulu8lv
        TRJGIkjNEGwQhdTIenJ5WEn72w==
X-Google-Smtp-Source: AGHT+IFHG7G8ircpklgV53BXiatzds1eW4VQmdySghyz2SVTTzRgjUshm/31hEq5E2TARrTZAyNtmQ==
X-Received: by 2002:a5d:6644:0:b0:313:f3c0:62d8 with SMTP id f4-20020a5d6644000000b00313f3c062d8mr369888wrw.21.1692212796422;
        Wed, 16 Aug 2023 12:06:36 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j4-20020adfff84000000b003142ea7a661sm22288741wrr.21.2023.08.16.12.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 12:06:35 -0700 (PDT)
Message-ID: <8b917300-6be8-931c-a461-18737d72e3a0@linaro.org>
Date:   Wed, 16 Aug 2023 20:06:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 03/14] media: qcom: camss: Drop useless NULL assignment
 for ispif resources
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, rfoss@kernel.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230814162907.3878421-1-bryan.odonoghue@linaro.org>
 <20230814162907.3878421-4-bryan.odonoghue@linaro.org>
 <511cb049-4b0a-4005-a1f7-59e0def6855f@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <511cb049-4b0a-4005-a1f7-59e0def6855f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/08/2023 18:10, Konrad Dybcio wrote:
> On 14.08.2023 18:28, Bryan O'Donoghue wrote:
>> The NULL pointer assignement is a redundant step our compiler will
>> initialize unpopulated fields as zero. We check for logical ! later on
>> in the code as opposed to NULL anyway.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
> Just squash it with patch 2?
> 
> Konrad

Yeah but this is zapping an unnecessary NULL, the other patch is about 
condensing down into one common structure. I kind of prefer to keep as 
much granularity as possible.

---
bod
