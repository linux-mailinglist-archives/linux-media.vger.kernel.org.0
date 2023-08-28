Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5F178B89C
	for <lists+linux-media@lfdr.de>; Mon, 28 Aug 2023 21:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbjH1TnZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Aug 2023 15:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233540AbjH1TnW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Aug 2023 15:43:22 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD07D122
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 12:43:19 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31ad779e6b3so2957688f8f.2
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 12:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693251798; x=1693856598;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xt41DQFO0E5wBX3ReoViKyO+8YvvVKX5ZH0MmV7uKEE=;
        b=nw8QQMqnU0I3O3PLLtsAB+TBiEZCgHLiszRLLXQu3wvNMAGrxy2PB5nIZsvw6JlduJ
         KUrb9geySRuQ7IPeYmm4aac2kRDOo+vL86J882/682Sk534zn/MzBHoDFIiMTJbQSwSu
         kC18H+wOZvYNqsmVfvoC8qtgCpZXpnyyJ61pUF+7N9mciomOj0sk5sQl2PNja1NmgkB9
         5hd2DZRRmw28bw5ayPElAeoK90V5Yg6kcwpJJPBvYIpH2lVd84JVBPAH6J+rf5lW14WM
         yGNMKcK05gVc2cN8oQuIZf+Sbar6uM9RqTRmOagLcVzMmiy5bNblA3+Qbk+sLhnQV0sT
         wJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693251798; x=1693856598;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xt41DQFO0E5wBX3ReoViKyO+8YvvVKX5ZH0MmV7uKEE=;
        b=jD/TUuLOu8cGyCqkjX5hXoF1/VaUgAN1rbrzMSdxeMDRv5m++oAD98UyeIa1iVTyDy
         VJxkgP2cLoNjrcmp0y1SY4oYxBXPzdbYfX8nCHB6t9xmkHvXbt9QiG0Hrun4lrh9X8ik
         WuGfcHQn40BZPfPs3ZhELN+Exlsr4gNeCDO7tLWQm9abhiCXQ81+1px1oCk+XnkF6tG0
         DNexNlw6EBLF/Tqv3ECDwcZwfJc/dushpsONnN8yTTFlnlGWkvosJ/Y2pjqEDHy3nexO
         Zj0KJnX9jMq3c48s0DzUzptOCtUrvDXVUQ7PO4+zDHxjXFzBv494RLY85X1+8xOLEOJT
         GIZA==
X-Gm-Message-State: AOJu0YyruMMl/18NM522dwhlJpMycmtBjLvg8iKC3yhz9d855d3sxrMV
        Ce2Af7/Su/WgSr5/cE3e0ml9ImPqcYbosyNhmLg=
X-Google-Smtp-Source: AGHT+IFKWGeVbvZgbRjNYEzVCsVwYnw4fy+HcidNACsqMMB0KQzrVRMPWx7VfQiKE4MbxfDzYncpAg==
X-Received: by 2002:a5d:5308:0:b0:316:f24b:597a with SMTP id e8-20020a5d5308000000b00316f24b597amr18442733wrv.46.1693251798278;
        Mon, 28 Aug 2023 12:43:18 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id w14-20020a5d544e000000b0031c6581d55esm11407201wrv.91.2023.08.28.12.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 12:43:17 -0700 (PDT)
Message-ID: <7a6222f2-a9e7-1c96-b92b-b21e6c76c205@linaro.org>
Date:   Mon, 28 Aug 2023 20:43:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 08/15] media: qcom: camss: Untangle if/else spaghetti
 in camss
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     rfoss@kernel.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230823104444.1954663-1-bryan.odonoghue@linaro.org>
 <20230823104444.1954663-9-bryan.odonoghue@linaro.org>
 <20230828185110.GN14596@pendragon.ideasonboard.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230828185110.GN14596@pendragon.ideasonboard.com>
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

On 28/08/2023 19:51, Laurent Pinchart wrote:
>> +		break;
>> +	default:
>>   		return -EINVAL;
> This should never happen, as adding support for a new SoC should come
> with an update for all the applicable switch/case statements. It's
> useful to let the compiler complain if someone forgets to do so, but
> with a default case, you will only see the issue at runtime. Could it be
> caught at compile time ?
> 

Off the top of my head, I don't think it could be easily caught.

An assert() would catch it early in runtime..

---
bod
