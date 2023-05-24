Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4916870F19C
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 10:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240472AbjEXI7I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 04:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240176AbjEXI7H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 04:59:07 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601D697
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 01:59:05 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-309550263e0so497600f8f.2
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684918744; x=1687510744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a+NNgDfjXqNbCR6ZTH9NtQnIsCEDyqhPkRlx6UouGpI=;
        b=gsp3KAeCTbi/++G3054Rh9bBsXtnri3PIC+w9z1RLzGdfE1ZGgVh/XdpfcGaexS85T
         YT+YbJnEnb+uZSPMdpJhQyl7ABCNBwApVqgkdkz9QhonTbWpx+rZ4lwZxBTAG+2nLuzT
         RG7LwtF1BjJNyRQMfejHochkP0xIsEdd3PS0bZ6we5bweWGI/kEiR1RRVfvz3pn0fPd/
         9EE+cDEMDkXXlPoGgXVWIZVNSresKsJnYrJr5Nmh8Mtw8V+qarDAHK68BLu/JtOtjTR9
         g3Y2Jqk/xiCz/oF7PeTr797rBMTiaJUQjjUhXz4FBQK45XjkfqJPArgnA7BrD4gIoNbQ
         GhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684918744; x=1687510744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+NNgDfjXqNbCR6ZTH9NtQnIsCEDyqhPkRlx6UouGpI=;
        b=GDQcu5YMJZt1lajd7fsVQJw9QVj9MVWyzsKTxxfTGrTfptOK8VHcMqq+N1WC1eMLta
         QDt4/YA1Dr3Yae6MSFArTownymrcF+7iF5qrZrfKWLTE0yxraMKbT4PxB8wa3YUWb7qk
         EjBXPYlSQr6dVSIhb2SprvGALAL/JjVRNSni4Zg1ORz+tyl/qonBWWaX+/JFaNKYrKwA
         xQ7HwSJhggzHDLY3E3iDn7hBnGzhitErz76wMI2CBwmOImnCpkpqdEVttC66Lb50z1zY
         2MLkPzMTc5uMx3hCl6rmS8dMxs6HW1CrxCSJ6zASWGs09lmsKBleEb/IxG0BC68Pd8zy
         3a7w==
X-Gm-Message-State: AC+VfDzG8I3o9aiHphaMbufdTPcmRHS+nMY4lmKIEAbsw8U0x+OB/Ppp
        VMzhTeKVpj4FIB7n3HFc5dcWMg==
X-Google-Smtp-Source: ACHHUZ5UvzXRjhvxMTPp8npClzFqPd2UV9YpdOx0Uvx3cAODPV6uS8yavwTZmTD25fBWjmNEeD48MQ==
X-Received: by 2002:a5d:4646:0:b0:306:4273:9efc with SMTP id j6-20020a5d4646000000b0030642739efcmr12400699wrs.40.1684918743807;
        Wed, 24 May 2023 01:59:03 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b10-20020adfde0a000000b003021288a56dsm13925650wrm.115.2023.05.24.01.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 01:59:03 -0700 (PDT)
Message-ID: <c48ff175-4c89-833a-c1cf-496ab26f7e6b@linaro.org>
Date:   Wed, 24 May 2023 09:59:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] qcom/camss: use 1X16 formats instead of 2X8
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        =?UTF-8?Q?Martin_D=c3=b8rum?= <dorum@noisolation.com>,
        rfoss@kernel.org, todor.too@gmail.com
Cc:     linux-media@vger.kernel.org
References: <B15AD941-B2E4-4C65-9D84-C58D3E34EBCE@noisolation.com>
 <a4b188b8-afb1-df2b-5237-026650279f10@xs4all.nl>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <a4b188b8-afb1-df2b-5237-026650279f10@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/05/2023 09:48, Hans Verkuil wrote:
> On 13/04/2023 12:54, Martin Dørum wrote:
>> Platforms with qcom-camss use CSI-2, which means 1X16 is more correct
>> than 2X8. The fact that qcom-camss supported only 2X8 meant it was
>> incompatible with camera sensors it should have been compatible with.
>>
>> For example, the ov5645 driver (correctly) reports that its format is
>> UYVY8_1X16 (after ba449bb56203aedc4530a82b0f3f83358808b7f2).
>> Since qcom-camss only supports 2X8, the qcom-camss system is
>> incompatible with the ov5645 driver, even though they should be
>> compatible.
>>
>> This patch replaces all uses of UYVY8_2X8/VYUY8_2X8/YUYV8_2X8/YVYU8_2X8
>> with the equivalent 1X16 formats.
>>
>> Signed-off-by: Martin Dørum <dorum@noisolation.com  <mailto:dorum@noisolation.com>>
> Can one of the driver maintainers review this?
> 
> It sounds reasonable, but I wonder if this can break existing setups where
> the sensor only supports 2X8 and not 1X16.
> 
> Regards,
> 
> 	Hans
> 

This hasn't hit my inbox but, I'll give it a test sometime this week.

---
bod
