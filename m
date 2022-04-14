Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4ED5011B1
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 17:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344434AbiDNOZJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 10:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348092AbiDNOMa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 10:12:30 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 179ECC12CF
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 07:04:13 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id m33-20020a05600c3b2100b0038ec0218103so3256227wms.3
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 07:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sGaJ99RtJ+dYNj0rZGnHuhh5oNaX0IriWU/lV+rJbzI=;
        b=UZ9NGDgJnUPaHnWlhjnMgl0KKbYa6sjX3j1ma6UvRTcZOKuUjs2dQZ0PCn8zt0/vPm
         6axL2/f7uOg3bwM54sz1mSpaK7ck8Zyh+xK0UKxmrGT+P3r5NLgHtTObp7LHPHMDhkJq
         NhLutWNr5BjsPY8I8jh1uTMMw48zR2rSpJZxfBxXqghLWzGOPus6i/u/vl0mvTa2c9cf
         yUmDoZMrSGDZI7OD6hmZwgGtdiffvu5ckVdbG+aBan4wNjnDEH5L/D0IbcmByuz0YW8g
         FNU9NY1j7z+z0qC5eB2IKUwyGP9+VjexJHVQP+GOQc6vG+8/r3M7NludXIN4HSjZgGX+
         4J1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sGaJ99RtJ+dYNj0rZGnHuhh5oNaX0IriWU/lV+rJbzI=;
        b=61e5K2HZN/902nZNoVw7DJpQg8IdcZ/Ugs9YImrcWdhs8VT1fTMuPFms6jBwKZ/faY
         8yXOGUUALMku1p4Ik01oipNtcLYiqH0WRepZy42WtNyg0BVb4HEUmoe7LjAGICymBk0O
         LcIJfmXMbZYJYq9kj7Qdp+llcFUr8HnaB2uoTdhI/5XxgjfNqEl2DrdYRu9Rl0Iny0GN
         /TDvoTm6aZ3VMvMcBIuKfUwl0gmpXe3JFLLfgr8xM7Q4RNJG8DJnXJaDOxUw90KAnKns
         OD5vbd0xvuVSpCGwgPituzSXn1uXwzLWjx7jQfSkZfqmdDAr//l7Rbz54e5o22G4b1p9
         dIdQ==
X-Gm-Message-State: AOAM532MLtFWu+u7NXBolHnUHERHK8Le16MTXPwT36Rc+Vm/v+UYEynV
        LYxkPpU/vDiapPQ+clmQorG1mw==
X-Google-Smtp-Source: ABdhPJxAQNUpOt/pOTTkq9icbx/O5JDFs7gYWRn60EyCC7m3uAIlzNlFPgi7g5hEIta6BxLvgi7RJg==
X-Received: by 2002:a05:600c:4f91:b0:38f:fba2:3ccb with SMTP id n17-20020a05600c4f9100b0038ffba23ccbmr1332307wmq.125.1649945051428;
        Thu, 14 Apr 2022 07:04:11 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n8-20020a05600c4f8800b0038eb596ab10sm6114089wmq.2.2022.04.14.07.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 07:04:10 -0700 (PDT)
Message-ID: <831e3857-9ee7-c760-ef2e-3b235b57b907@linaro.org>
Date:   Thu, 14 Apr 2022 15:04:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 2/2] media: i2c: imx412: Add bulk regulator support
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robert.foss@linaro.org, hfink@snap.com,
        jgrahsl@snap.com, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
References: <20220414124505.1329295-1-bryan.odonoghue@linaro.org>
 <20220414124505.1329295-3-bryan.odonoghue@linaro.org>
 <Ylga7FVsbK6znD/+@valkosipuli.retiisi.eu>
 <39cae749-67ef-13d7-2648-01c6e9603887@linaro.org>
 <Ylgn8u5Au0EqUkLj@valkosipuli.retiisi.eu>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Ylgn8u5Au0EqUkLj@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/04/2022 14:56, Sakari Ailus wrote:
> On Thu, Apr 14, 2022 at 02:44:00PM +0100, Bryan O'Donoghue wrote:
>> On 14/04/2022 14:00, Sakari Ailus wrote:
>>>>    	ret = clk_prepare_enable(imx412->inclk);
>>>>    	if (ret) {
>>>> +		regulator_bulk_disable(imx412->num_supplies,
>>>> +				       imx412->supplies);
>>> As the function already has an error handling section using labels, this
>>> should go there as well.
>>>
>> Are you asking to move regulator_bulk_disable() to error_reset ?
> 
> No. You'll need another label.
> 

Hmm.

I think another label is not required, have a look at V4.
