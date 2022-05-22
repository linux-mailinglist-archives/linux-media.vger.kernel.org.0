Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28A005304E3
	for <lists+linux-media@lfdr.de>; Sun, 22 May 2022 19:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349100AbiEVRKk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 May 2022 13:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbiEVRKg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 May 2022 13:10:36 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC0ED3AA41
        for <linux-media@vger.kernel.org>; Sun, 22 May 2022 10:10:34 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id j25so17936533wrc.9
        for <linux-media@vger.kernel.org>; Sun, 22 May 2022 10:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UC29fQRATexTT7tJzzddZ4rno6ylvbw/uHwKcWDyCEE=;
        b=p28KdpWyxvmBBqgGUVYoQNauk6dvzewKdhb69i+ywXo4dc1zSCobjzRGwYRYRvEE5F
         3xWJfjot8sqqWL+Vcpy5xztbdIwzPaFW4fZaf5xeJbAuwT9L+7T6gezExk/ZZoJ0AFbZ
         MOX9/QfszSYEmaHiHv8pmYLtmRpXkS4Gv5XAKW9epALT9W9+HRln4LQJj01iKrQjHi4Y
         5DMxzyQg6FWsn5eJEmlYLMBgKkK7Nxg6TXxfmAdzzRG78xHbCF3s2xQ0BNtcBwxcwkdY
         qsvW/SIL53EsXLXUQnCOkwQM8Tx0NQlRShLvYJVmF+3jixq5F59jRZpJoThLNrJVKhV0
         zBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UC29fQRATexTT7tJzzddZ4rno6ylvbw/uHwKcWDyCEE=;
        b=lXoOs78uHZm2jEajD/dHXHoSRim/la5y3Y8lAq7u4SHaYsgzkAyFLNgq+ZUXRBYHVN
         TdfMMUAONUbfkyExDsxKWeUJZ2LhUGVvcPRkRlKyEHwIzUCZPw4a4cu2RoTvMEL0uzrE
         pfsYvnB+DdvIna9t+rk6B9+tejN2Jp4IFCxki+g7nxQZIztYsvxt5T9ly8pvUK3kNz6s
         NLOmfY4twZ/AWoEgG79YDStY4XpcSSeR7ItqBIkVPS1XPHWhtK1fGDlI1+i2bdiqQqP+
         ardOkekuGZcdExjvHvQ14KroK76Pax2aJK9jJ2g7svpzZLU/VUNyhuEb4LmfaPT2C11w
         1rFg==
X-Gm-Message-State: AOAM533n8apxn2LRN5fOqSmyjCOcwpFixWyYf+X+/3a4lXLFNdyFHcvI
        qPOM4eaXn86/NWbLf9edU1Svhw==
X-Google-Smtp-Source: ABdhPJxp94yPqyr6oChze4h7ciJv1e+SH3bxLIjuxj6SYnkGaQCd+h8o9Bj9MHbehTvZ+6UT1rH9cw==
X-Received: by 2002:adf:dbce:0:b0:20c:f507:8ef9 with SMTP id e14-20020adfdbce000000b0020cf5078ef9mr15958406wrj.29.1653239433052;
        Sun, 22 May 2022 10:10:33 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k41-20020a05600c1ca900b0039747cf8354sm2144778wms.39.2022.05.22.10.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 May 2022 10:10:32 -0700 (PDT)
Message-ID: <19c92f9d-fa1c-fbe8-50ef-324da3e00695@linaro.org>
Date:   Sun, 22 May 2022 18:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/1] arm64: dts: qcom: qrb5165-rb5: Enable the IMX577 on
 cam1
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mmitkov@quicinc.com, jgrahsl@snap.com,
        hfink@snap.com
References: <20220518133004.342775-1-bryan.odonoghue@linaro.org>
 <20220518133004.342775-2-bryan.odonoghue@linaro.org>
 <33abcc93-13f1-d6f5-36a3-6ab796f124f9@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <33abcc93-13f1-d6f5-36a3-6ab796f124f9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/05/2022 20:09, Vladimir Zapolskiy wrote:
> 
> I run on you branch on top of linux-next, but switch build options from 
> modules to built-in
> 
>     CONFIG_I2C_QCOM_CCI=y
>     CONFIG_VIDEO_QCOM_CAMSS=y
> 
> I didn't get the sensor initialized and hence there is no /dev/media0 node:
> 
> [    0.620205] i2c-qcom-cci ac50000.cci: Found 19200000 cci clk rate 
> while 37500000 was expected
> [    0.620551] i2c 20-001a: Fixing up cyclic dependency with ac6a000.camss
> [    0.620754] imx412 20-001a: Looking up dovdd-supply from device tree
> [    0.620797] imx412 20-001a: Looking up avdd-supply from device tree
> [    0.620860] imx412 20-001a: Looking up dvdd-supply from device tree
> [    0.620876] duplicated lane 1 in clock-lanes, using defaults
> [    0.622789] imx412 20-001a: failed to find sensor: -5
> [    0.622880] imx412: probe of 20-001a failed with error -5
> 
> I believe the problem could be related to CCI, please remind me, are 
> there I2C bus pull-ups?

Hmm.

Just trying to replicate this on linux-next

https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-22-05-22%2bimx577-rb5

root@linaro-gnome:~# zcat /proc/config.gz | grep -e CONFIG_I2C_QCOM_CCI 
-e CONFIG_VIDEO_QCOM_CAMSS
CONFIG_I2C_QCOM_CCI=y
CONFIG_VIDEO_QCOM_CAMSS=y

root@linaro-gnome:~# uname -a
Linux linaro-gnome 5.18.0-rc7-next-20220518-00006-g3beef4d1d353-dirty 
#40 SMP PREEMPT Sun May 22 17:53:29 IST 2022 aarch64 GNU/Linux

root@linaro-gnome:~# cam -l
Available cameras:
1: 'imx412' (/base/soc@0/cci@ac50000/i2c-bus@0/camera@1a)

are you compiling everything in ?

---
bod
