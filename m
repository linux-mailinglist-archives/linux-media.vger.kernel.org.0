Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684B923E68A
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 06:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgHGEIM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 00:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgHGEIM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 00:08:12 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF899C061574;
        Thu,  6 Aug 2020 21:08:11 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id v9so723707ljk.6;
        Thu, 06 Aug 2020 21:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pOBxXb+p10j7guaA71tlwTSW7/nATn27QPidfld71F8=;
        b=DbI6IWjKBxrReV/YdXsvPZyLyQc5PSMHRAOe0g0epN8xuw3trSPL2qmo61HsFKH8Aw
         lJdIFV1AV8Te7lQm32gan3YhE33pPDmazkFyFyKZ/7E0v1kT8Aa7tL5OruoNXqFqdKRQ
         7BlGIR3+4RexqqpNjkFWi/8QjJ26RJ7nFOz3m6WkyTonahuIv8U6jYeNiGkG5Rxa8DMt
         JGD5XcK80XnNQ6WsI7fHLPOZffr7eTo1ODAA99VFgF7hA/GsaxXggOwKTyJP4KBB+imK
         mpJvGgO5URTkR7VivNNn7mNQ7XgI8spiVIRmsKP48ZNK2bCTmzzehGp+ogUakLFbqKzM
         Ldzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pOBxXb+p10j7guaA71tlwTSW7/nATn27QPidfld71F8=;
        b=jDTgyhJCE9PgODm+WMybCszTmrCzmwvIl+AFYVH6erjHkXTEVlViyuHh6AwZubLTKf
         ck9CojHFBEiLgmVHfVP2jk66jL/Olk204dJQhk5CUQ7bdSSNbXMIH2k2hd8YNap4TZwk
         QMwnrkmldFE6UvAbtyVTIPZs7Wdy/toge72E18YIiQIeM671Y73iR3AmCdJKPvDo7m1U
         EcGLVkfuBMSzKwzIdN2f8sW+scHrlbQuUBVzw9otwOUaaa/ZUbps+EujvB3WatD3avD3
         vF245/751EYCx1pSr6b1lVuDAbBA3OlzyNs5Ovc2XJYMspi8xNWy0SnKcq02Qf8MnYgI
         q88w==
X-Gm-Message-State: AOAM533AyoIixK8hi74G3DCGKuWSXnhaBcjcrU2zL7kRBEtqeAi6PY2k
        IXGF2FXanqzKt9xqlDWdL8LBi+sZ
X-Google-Smtp-Source: ABdhPJz/hjEepI+3KjtXENHYt3Viib2gkFos7DTk0RXf1fEHdJVATRxtYqHO5jVdf70hbLoVrc5URg==
X-Received: by 2002:a2e:b4e1:: with SMTP id s1mr4963706ljm.433.1596773289995;
        Thu, 06 Aug 2020 21:08:09 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id z18sm3273323lja.55.2020.08.06.21.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 21:08:09 -0700 (PDT)
Subject: Re: [PATCH v9 08/10] gpu: host1x: mipi: Keep MIPI clock enabled and
 mutex locked till calibration done
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1596740494-19306-1-git-send-email-skomatineni@nvidia.com>
 <1596740494-19306-9-git-send-email-skomatineni@nvidia.com>
 <f2522713-6995-d6a1-e691-a5443823056b@gmail.com>
 <7ef2a6dd-d220-ff47-e6ef-7443a1779fae@nvidia.com>
 <a0a187d3-04e9-88d9-5146-1448d4bd79e9@nvidia.com>
 <54e01160-4041-f8fa-065d-f635e8d69e2f@nvidia.com>
 <7c47b165-8663-87f0-bff5-37036d472fb9@gmail.com>
 <ecf679f8-e08b-3297-2d33-1e5737c92982@nvidia.com>
 <357556da-ea4b-e7b9-b8f7-c4b3d42f60de@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <450049cf-6adf-9765-73bf-0b2718ce2b91@gmail.com>
Date:   Fri, 7 Aug 2020 07:08:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <357556da-ea4b-e7b9-b8f7-c4b3d42f60de@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

07.08.2020 07:06, Sowjanya Komatineni пишет:
> 
> On 8/6/20 9:05 PM, Sowjanya Komatineni wrote:
>>
>> On 8/6/20 9:01 PM, Dmitry Osipenko wrote:
>>> 07.08.2020 06:18, Sowjanya Komatineni пишет:
>>>> On 8/6/20 8:14 PM, Sowjanya Komatineni wrote:
>>>>> On 8/6/20 8:10 PM, Sowjanya Komatineni wrote:
>>>>>> On 8/6/20 7:31 PM, Dmitry Osipenko wrote:
>>>>>>> 06.08.2020 22:01, Sowjanya Komatineni пишет:
>>>>>>> ...
>>>>>>>> +int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
>>>>>>>>    {
>>>>>>>>        const struct tegra_mipi_soc *soc = device->mipi->soc;
>>>>>>>>        unsigned int i;
>>>>>>>> @@ -381,12 +375,16 @@ int tegra_mipi_calibrate(struct
>>>>>>>> tegra_mipi_device *device)
>>>>>>>>        value |= MIPI_CAL_CTRL_START;
>>>>>>>>        tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
>>>>>>>>    -    mutex_unlock(&device->mipi->lock);
>>>>>>>> -    clk_disable(device->mipi->clk);
>>>>>>>> +    /*
>>>>>>>> +     * Wait for min 72uS to let calibration logic finish
>>>>>>>> calibration
>>>>>>>> +     * sequence codes before waiting for pads idle state to
>>>>>>>> apply the
>>>>>>>> +     * results.
>>>>>>>> +     */
>>>>>>>> +    usleep_range(75, 80);
>>>>>>> Could you please explain why the ACTIVE bit can't be polled
>>>>>>> instead of
>>>>>>> using the fixed delay? Doesn't ACTIVE bit represents the state of
>>>>>>> the
>>>>>>> busy FSM?
>>>>>> Based on internal discussion, ACTIVE bit gets cleared when all
>>>>>> enabled pads calibration is done (same time as when DONE set to 1).
>>>>>>
>>>>>> Will request HW designer to look into design and confirm exactly when
>>>>>> ACTIVE bit gets cleared.
>>>>>>
>>>>>> Will get back on this.
>>>>>>
>>>>> Verified with HW designer. above is correct. ACTIVE bit update happens
>>>>> same time as DONE bit.
>>>>>
>>>>> Active = !(DONE)
>>>>>
>>>>> In case of calibration logic waiting for LP-11 where done bit does not
>>>>> get set, ACTIVE will still be 1 and on next start trigger new
>>>>> calibration will start
>>>>>
>>>> Based on internal design check from designer, as long as its in waiting
>>>> for LP-11 stage, next calibration request can be triggered again but
>>>> ACTIVE bit we will see it at 1. So we should check for DONE bits to
>>>> confirm if calibration is done or not.
>>>>
>>>> To start next calibration, it can take effect as long as its in wait
>>>> for
>>>> LP-11 mode.
>>> I meant the start_calibration() will poll the ACTIVE bit (calibration
>>> busy), while the finish_calibration() will poll the DONE bit
>>> (calibration applied).
>>
>> ACTIVE bit can be 1 when previous calibration process does not see LP-11.
>>
>> So there is no need to use ACTIVE bit during start of calibration.
>>
>> At HW level, both ACTIVE and DONE bits get set at same time.
>>
>> So waiting for ACTIVE to be 0 during start calibration instead of
>> *75uS will not work as ACTIVE bit will not become 0 after calibration
>> sequence codes and it will get updated along with DONE bits only after
>> applying results to pads which happens after seeing LP-11 on pads.
>>
> *typo fixed

I see now, thank you.
