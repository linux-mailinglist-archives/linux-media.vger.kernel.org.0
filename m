Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65EAF78969F
	for <lists+linux-media@lfdr.de>; Sat, 26 Aug 2023 14:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbjHZMPG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Aug 2023 08:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232448AbjHZMO7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Aug 2023 08:14:59 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 279232119
        for <linux-media@vger.kernel.org>; Sat, 26 Aug 2023 05:14:56 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fef56f7222so16391445e9.2
        for <linux-media@vger.kernel.org>; Sat, 26 Aug 2023 05:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693052094; x=1693656894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZZ225BB9olu8+KyEgTb/qjLtSUtUjbRNfWB6T6im/E=;
        b=RRUxLOOWGYeLm02iEVsK463q3C5F1PkJrkGMNQq85v824XyMJ6BDwRBiF/vgvGkZku
         yn2hpA6Mc1SIQivdIPjg+aFKBLOxmjLKnExMnQsmRGTyXybey4U67ykoBYJ+XLKVR+Gy
         TURbFwu7El1Yq4idEP4eamlbrxZEXNyX/Mjn0OzV34ADmfoRWJeIAfszkV2OA3AE6Tjr
         5YfHdEfD66ug2RA0Wocwd9ZqGDw5NXYUcHWaL2nnPvfeQGbtVcCcl6pQ7CcaME3gaz5t
         J3MjtgGLk1irnn8arnljQH2i6cU25iXu3Nc6/Beddu5fNydOliUKWOptix4oTiwzS0S7
         BSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693052094; x=1693656894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZZ225BB9olu8+KyEgTb/qjLtSUtUjbRNfWB6T6im/E=;
        b=GZKqyVvwjFoOT0FuVdB0wt0VV2SBh2W+7cdcUR9bQR28RWuMjqLRm0ZwvrQJTsQ+qN
         nD85kHqHhTMzhSpHy3LoVN9wTZHRZK9MpwOtyhF9j5DizuK6zK5f1PMuuuam76T+9iap
         yAwtWahfgD6HpIEVj+KETx7dtmZEH6QSn5oV7atEXZ9BLjQmo0FBC/c8qRTEPpga0+za
         j0zwtjdbwOGdksuhBHrS/nW9OmWVKuxfYOD3MTUq+fVglnFWjTQfVFPt0qyHqhzhpvR4
         h/95ADCRkEjJl5FBctRvM53xoqPKBflibY/TBMyD7GulA5Yrxyqx5qaLsr8fI/yBDnVD
         RxFQ==
X-Gm-Message-State: AOJu0YwwEFc7ayZp7Aojklb+B4QJ5z5ARViUhKAGabLgcNPo40o5d3kJ
        ALq1DXksd/5kY+97XUb9F5DxTg==
X-Google-Smtp-Source: AGHT+IHN/4pa0zDu93V4ij+CFTMtYtiRrBZLDR64UGaYAzlfMPkSJxCOOs95vqayXX3xNHETXK6EMQ==
X-Received: by 2002:a5d:6902:0:b0:317:e68f:e1b2 with SMTP id t2-20020a5d6902000000b00317e68fe1b2mr15203726wru.28.1693052094580;
        Sat, 26 Aug 2023 05:14:54 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600004ce00b00317f3fd21b7sm4767552wri.80.2023.08.26.05.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 05:14:54 -0700 (PDT)
Message-ID: <0510a774-07b9-e902-ccac-2fcd44a358dc@linaro.org>
Date:   Sat, 26 Aug 2023 13:14:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 11/15] media: qcom: camss: Functionally decompose
 CSIPHY clock lookups
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, rfoss@kernel.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230823104444.1954663-1-bryan.odonoghue@linaro.org>
 <20230823104444.1954663-12-bryan.odonoghue@linaro.org>
 <d8e54e0a-b176-49eb-9d8d-66324cdcd2e8@linaro.org>
 <1b15ca0d-0781-c3f8-4822-fce3a7fbb7e7@linaro.org>
 <0acf952f-edd4-4f62-8b07-0fe727526d96@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0acf952f-edd4-4f62-8b07-0fe727526d96@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/08/2023 13:11, Konrad Dybcio wrote:
>>> adding something like csiphy_timer_clks and cisphy_clks and stuff
>>> would make this string comparison mess unnecessary
>> I don't understand your comment.
>>
>> Having a litany of static comparisons is definitely inferior to a generic helper function.
> portray this
> 
> struct camss_whatever_it_was_called {
> 	struct clk_bulk_data *csiphy_clks;
> 	struct clk_bulk_data *csiphy_timer_clks;
> 	[...]
> }
> 
> and then
> 
> clk_bulk_prepare_enable(csiphy_clks)

Ah would be grateful if you had just said "hey could you try using 
clk_bulk_prepare_enable()"

But, OK.

Thanks !

---
bod
