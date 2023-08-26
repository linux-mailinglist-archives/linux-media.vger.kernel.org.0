Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E83778966F
	for <lists+linux-media@lfdr.de>; Sat, 26 Aug 2023 14:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232721AbjHZMCQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Aug 2023 08:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbjHZMBz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Aug 2023 08:01:55 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD4362105
        for <linux-media@vger.kernel.org>; Sat, 26 Aug 2023 05:01:52 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fee8af9cb9so15721315e9.1
        for <linux-media@vger.kernel.org>; Sat, 26 Aug 2023 05:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693051311; x=1693656111;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RO8Yyz2oHTR16ECZ9Rr/IoSLhSOOtJfBRk2Q+FHvz2I=;
        b=UNgdJXuoBfk2mYXCWlsSN5/r0eXptoM2PMRb1lUyw92Ix1ueZgrbEQHPWckg0BW6ZT
         zCbNu30hdb70ynY2kz95DF9fX7Ly3O7fZLcEtUkj18rnQcqa41u5YXBYezH9SNjWviAF
         DFA65k2ni2+XrwK/GUAOKk/YJcu93EugffqezHYqsPC41e8FkJRaZ1KUn1lmrcudkxKi
         lO78+v3s+XsjMehk3mHl9yCRVrg8TRT27xSilthVNlQ7hOYiH8dMq3EI2lhtFlSn3+fv
         /N27dFaMmSoL52GTo77dcoTeoT9b8KtJL7eelpsOlkh/Z7+AzeI3XHUGhI6ckNsgAadV
         QLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693051311; x=1693656111;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RO8Yyz2oHTR16ECZ9Rr/IoSLhSOOtJfBRk2Q+FHvz2I=;
        b=BD1TaOD7LqRw8Tn1VYHdsG6KLJrDv3nxqsAT/WQJCKcEg11yGRAMQ4jzAVcZNBq12W
         X2jR4OMSU9/qQhqXRXHYHehcp2y8U8pG0JoLaTLTA9/3EZqgybIRPPNrLf74m8b9jiqX
         BWROCq5trGrMalYhZXo/4qqGoxR9WgeI79oM4cI18mBuJ1aE/eudWikZIThsUYqbxEnp
         qMwkybln4SOoQ7907NMTCWtmon/vglOvuJM4v9ANBaxwsscRsVTwKd9cHPenNw7ueDnD
         ylXz2O+cGzW8n2bXY/BR2pSb7+Idm+5K5xgJxN3zgPiXZmQLy3v0DaU2z9lTRXRpy7EM
         DWaQ==
X-Gm-Message-State: AOJu0YzQPDMNIxNgy+UBi9qfSNZjHLeYUOV1IyoH3VyPJSEGbrmzor9K
        WAGVoXUObfqqPW7dVh5O7WybeA==
X-Google-Smtp-Source: AGHT+IGfg0YU6vo3D5Gw6EI77NS2wTCFEgGf6amHUaQ6pN1e8MMnuBSRUFaaQTjlcDA6wKnEA9S4nw==
X-Received: by 2002:a05:600c:ad2:b0:401:aa8f:7562 with SMTP id c18-20020a05600c0ad200b00401aa8f7562mr5271832wmr.11.1693051311340;
        Sat, 26 Aug 2023 05:01:51 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x7-20020a1c7c07000000b003ffca80edb8sm4854067wmc.15.2023.08.26.05.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 05:01:50 -0700 (PDT)
Message-ID: <50b9d9f5-0433-2d7d-71af-10f4b3b8e448@linaro.org>
Date:   Sat, 26 Aug 2023 13:01:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 09/15] media: qcom: camss: Improve error printout on
 icc_get fail
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, rfoss@kernel.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230823104444.1954663-1-bryan.odonoghue@linaro.org>
 <20230823104444.1954663-10-bryan.odonoghue@linaro.org>
 <92e864cd-b98f-45d1-a46e-e5bfc52b4b08@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <92e864cd-b98f-45d1-a46e-e5bfc52b4b08@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/08/2023 11:05, Konrad Dybcio wrote:
> On 23.08.2023 12:44, Bryan O'Donoghue wrote:
>> If icc_get() fails print the name of the failing path.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
> Aren't the return messages propagated from
> 
> * of_icc_get()
> 	|_ of_icc_get_by_index()
> 
> enough here?
> 
> Perhaps we should use dev_err_probe in camss too
> 
> Konrad

IDK, I will check
