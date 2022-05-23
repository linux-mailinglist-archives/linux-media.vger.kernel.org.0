Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA348531470
	for <lists+linux-media@lfdr.de>; Mon, 23 May 2022 18:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236591AbiEWNvR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 May 2022 09:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236800AbiEWNvG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 May 2022 09:51:06 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E294117A9E
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 06:51:03 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id j10so2232575lfe.12
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 06:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uAXzKyDQ+t6h+S4+NIkziTPLlQ9i5Tq10BEMMZUmQss=;
        b=Fip6NNMAiaRB7Z8StmtMAN0lXZeUQ5g3+36xC9ypiVaUKn8pJePWW0eOKQlXRX/7at
         bWmv7jeDuIup3jBskWCKZqhUEvleUqrJjxFYICHivIqco7Yy/akcvNj0uhXc+c5UzzDv
         ktDwONE5t5pNg26oRwdeyKX4+nMb5FPJhOn2XkSQnU+Sy/dteeBCaII1Yt3pjkelBRQl
         6qzaqxAEo0+mJmenf9Ho1OiONPrY7ymQQ+AqQsQFUw8CypOwMBP0Jbm1CrYN27Hec1h1
         lMpVzQ+a6Oi9AP1wh2SfNBAHeLHlbU9FGHdTLwbMUJOEhdpKiW2Xe+Do4OIlVptcAW0F
         CdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uAXzKyDQ+t6h+S4+NIkziTPLlQ9i5Tq10BEMMZUmQss=;
        b=WM0UhaLfC6vdjUcUvKenqOJKd/0D1+L3XlPr2qyzLEPExCr8xvhW5zCm/5NcdvJkvf
         ct1lnw11KrQL03cVUCbjD2IxmWZxiqPjzF9qzsYSL8ylCjo1S33ZiQ7fce/+B++P9smm
         5zvDjo+vyD8O5M4KoN5XNXjvRwD3qVBJl3r9j0XgWvfFYTMslToyLsXgaoaRTtES/RdK
         nxVLh3ACcwbZMzQrEw6pA+TYuZMen40ayhGEZhmjXWOcYO/WQB8nBkmL3dPtlMqoiJ5w
         JG9rf/3vaw7r09tfDFf92R6cQaslazjXixkbMLEM3VZ8gV6Lqiq4QCqoN4auRE0djnvy
         jr1w==
X-Gm-Message-State: AOAM530BNMx/Wca94z9dhmQKSh6j0dz9XaRURr47xQJm0UM1CnDJn1Yd
        Wgauk9JDDIIRzpfa7Ex4BOCdkA==
X-Google-Smtp-Source: ABdhPJwGrRxXpollzvYIVkw2Fl6kHuKw0ricDXC/aaLdVEsj32LXv5DkA/n4FjS1R9nA4BPv/XhV6Q==
X-Received: by 2002:a05:6512:39cb:b0:478:5a36:5fca with SMTP id k11-20020a05651239cb00b004785a365fcamr10490514lfu.409.1653313862247;
        Mon, 23 May 2022 06:51:02 -0700 (PDT)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id a10-20020ac2520a000000b0047255d211a6sm1983038lfl.213.2022.05.23.06.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 06:51:01 -0700 (PDT)
Message-ID: <e7bbe076-a1d1-a005-8110-5d35bc0d80de@linaro.org>
Date:   Mon, 23 May 2022 16:50:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/1] arm64: dts: qcom: qrb5165-rb5: Enable the IMX577 on
 cam1
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mmitkov@quicinc.com, jgrahsl@snap.com,
        hfink@snap.com
References: <20220518133004.342775-1-bryan.odonoghue@linaro.org>
 <20220518133004.342775-2-bryan.odonoghue@linaro.org>
 <33abcc93-13f1-d6f5-36a3-6ab796f124f9@linaro.org>
 <19c92f9d-fa1c-fbe8-50ef-324da3e00695@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <19c92f9d-fa1c-fbe8-50ef-324da3e00695@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

On 5/22/22 20:10, Bryan O'Donoghue wrote:
> On 18/05/2022 20:09, Vladimir Zapolskiy wrote:
>>
>> I run on you branch on top of linux-next, but switch build options from
>> modules to built-in
>>
>>      CONFIG_I2C_QCOM_CCI=y
>>      CONFIG_VIDEO_QCOM_CAMSS=y
>>
>> I didn't get the sensor initialized and hence there is no /dev/media0 node:
>>
>> [    0.620205] i2c-qcom-cci ac50000.cci: Found 19200000 cci clk rate
>> while 37500000 was expected
>> [    0.620551] i2c 20-001a: Fixing up cyclic dependency with ac6a000.camss
>> [    0.620754] imx412 20-001a: Looking up dovdd-supply from device tree
>> [    0.620797] imx412 20-001a: Looking up avdd-supply from device tree
>> [    0.620860] imx412 20-001a: Looking up dvdd-supply from device tree
>> [    0.620876] duplicated lane 1 in clock-lanes, using defaults
>> [    0.622789] imx412 20-001a: failed to find sensor: -5
>> [    0.622880] imx412: probe of 20-001a failed with error -5
>>
>> I believe the problem could be related to CCI, please remind me, are
>> there I2C bus pull-ups?
> 
> Hmm.
> 
> Just trying to replicate this on linux-next
> 
> https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-22-05-22%2bimx577-rb5
> 
> root@linaro-gnome:~# zcat /proc/config.gz | grep -e CONFIG_I2C_QCOM_CCI
> -e CONFIG_VIDEO_QCOM_CAMSS
> CONFIG_I2C_QCOM_CCI=y
> CONFIG_VIDEO_QCOM_CAMSS=y
> 
> root@linaro-gnome:~# uname -a
> Linux linaro-gnome 5.18.0-rc7-next-20220518-00006-g3beef4d1d353-dirty
> #40 SMP PREEMPT Sun May 22 17:53:29 IST 2022 aarch64 GNU/Linux
> 
> root@linaro-gnome:~# cam -l
> Available cameras:
> 1: 'imx412' (/base/soc@0/cci@ac50000/i2c-bus@0/camera@1a)
> 
> are you compiling everything in ?

it's some kind of a race related to probes of CAMSS, CCI and IMX412 drivers.

Since I'm able to reproduce it, I'll take the analysis on myself, and it does not
interfere with your patch series.

--
Best wishes,
Vladimir
