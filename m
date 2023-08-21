Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A147E78312E
	for <lists+linux-media@lfdr.de>; Mon, 21 Aug 2023 21:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjHUTVr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 15:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbjHUTVq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 15:21:46 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7A6123
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 12:21:44 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fea0640d7aso37371895e9.0
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 12:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692645703; x=1693250503;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QCgpyh71dVt3W3LBFrSznrNheB+BKG7vXO+g/h59Vfc=;
        b=q2Cr+sIDmW2TTnw7X/GxBw0ZusZ19EFQny+eoBahzn2hR6bo37fVbmUp8X/SQ9JcXu
         CM7QTDMtC1H1uqp8BNy7Vz9li32ppteoshl0MB/x8u7M5vk3Ssf9Y5GHRUZrECHmI7Sq
         rS4pVvEyyeAVhAQID6gINSvr4K+jLs0h6Nhwvw7O3dsk6yyKzpBnmghw1sB02B7xfF7o
         w6SbIDVWzQypOC7bjnhJKLHkfMbpHLIA4uJ7MuYRLnDQSE5WzkbMtESioaumV8p/R3Tg
         m3nIrjdhazQinntet08cNYrY5/MJwjiwr0aNu1+duNs88U/jn7YI8rEwDP35Yy8Vsiy3
         ar4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692645703; x=1693250503;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QCgpyh71dVt3W3LBFrSznrNheB+BKG7vXO+g/h59Vfc=;
        b=bu/mSycMLhInWWwZYL8e8oNeXEkyijY2G5rSPP3DdeyStS5xV++1iawa9yzl+3cXyd
         IKrolrfH0hxrfPs0ZGo1ubgSesF36kB0s7SgnYkiwkKGX037PLxjqWsCSHRyF8PIgb1j
         dyLWpfklSS8PDmWLm2ndP8tPXtIKK0jn1RwVfDR1nefjdYnuuMucvqiVCkdn94QgfNo5
         eTKgKZFv06QhoBa17+F+ZmKDzP1Hy7/FemZnjybmgpOVEt2asgiPurqTzWm2NnmZFZot
         ZaTV9m0vZBuImp6TcVNQBMc/hJKphIW2Be2r6FZMVUFNv/J5hGQJ/D4rob3lJ7j43bVX
         KCgA==
X-Gm-Message-State: AOJu0YxHOv2YBeFek3hpyN0SqhAwIa2DccZBRuKjSuAIfn3Yum8Bf+g7
        w9I98uN7Z9dht76sfta7BgnpAg==
X-Google-Smtp-Source: AGHT+IEeHrhLcTtWt5ccBkDBQjNiNxgflDdO+OEzPBkSgZYtHn11r69zWafIqMU7rFG7sivnyoxF1A==
X-Received: by 2002:a5d:4389:0:b0:306:46c4:d313 with SMTP id i9-20020a5d4389000000b0030646c4d313mr4773914wrq.28.1692645703084;
        Mon, 21 Aug 2023 12:21:43 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e1-20020adfe7c1000000b0031b2c01f342sm7499797wrn.87.2023.08.21.12.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 12:21:42 -0700 (PDT)
Message-ID: <9447f63a-50a2-d699-606b-b32d16aaa56a@linaro.org>
Date:   Mon, 21 Aug 2023 20:21:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v0 8/9] media: qcom: camss: Fix set CSI2_RX_CFG1_VC_MODE
 when VC is greater than 3
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>, rfoss@kernel.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20230814141007.3721197-1-bryan.odonoghue@linaro.org>
 <20230814141007.3721197-9-bryan.odonoghue@linaro.org>
 <edd4bf9b-0e1b-883c-1a4d-50f4102c3924@xs4all.nl>
 <62859b0e-cfee-f094-2ae9-bf0e243e2929@linaro.org>
In-Reply-To: <62859b0e-cfee-f094-2ae9-bf0e243e2929@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/08/2023 19:51, Bryan O'Donoghue wrote:
> On 21/08/2023 10:53, Hans Verkuil wrote:
>> +        u8 dt_id = vc * 4;
> 
> You're right.
> 
> dt_id = vc is wrong but so is dt_id = vc * 4.
> 
> I'll post a fix for the dt_id as a separate patch.
> 
> ---
> bod

No wait.. dt_id = vc is _fine_

I'll add a patch to document what this does since the provenance of the 
changes for this value are undocumented and confusing even to me, with 
access to the documentation for it.

---
bod
