Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A0B23E677
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 06:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgHGEBl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 00:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725263AbgHGEBk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 00:01:40 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6383EC061574;
        Thu,  6 Aug 2020 21:01:40 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w14so719100ljj.4;
        Thu, 06 Aug 2020 21:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6hXGoG7VpK7QiMqEgGEMUiXEradygc4+EQbKgcXgAnc=;
        b=dq+axmEtzt+fsNxEocn+nvEVMNUDImOzdAuhrdiADvPgAAXGOu7W6u4LpfQL+bCoDd
         Ny8fn2a/oHVWXxDps3MOo6wVVlf7XkqNB/3OzH3fCg+FOfSn6tSkFdRUKoOJtJBDkOVt
         XSXTVEth/1GVsTqrQYaWX/8srj9O4hLSifoAKoZ6SM45GeylDowJcHqo8oaC81jB/Yj2
         wovp6bg57xvxlc8qCDXQSkbUd9FG6jUZ2GkdjMmm7zWpeyne7MtB/r8sKXduCTAGVyIn
         rv8kDoeK+kDUNGFgGV0VqgG98NdSDgfPs5OIujI9KEUwWdMsiPH9vJfEgm74GggPe8Yc
         QJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6hXGoG7VpK7QiMqEgGEMUiXEradygc4+EQbKgcXgAnc=;
        b=HBYvdMygkmagkfeNPbo9iQoMiUutUF9qyN7OD+HkZ1pnJn3pNyBXfzCshxrOa9sm3C
         LT9TE0UgvUfXSEpqUjrJGvStjVhQDQY/wYNWSAz4x7UkTqI38Ifjsc5sIHd0lAuZmJZm
         SwcFbanF2mf/ghnqwVq13gD4QuUQBgoWdhcuhXhEhcp3eXqMAAFd5Id7x0hZotBN2t38
         s4iVt6OySC7RP9QDCOFXOAU/Nu2IKi5UcIjDwL7aEMUaA0WuGKXnpzJRfgPxi4mqu6D2
         berczbaZTqET2zqHc7gdmJOrc+xhLyrp/6eaYzBeRhnpKUfJ5YtBCNrLBHlrGP8SvTzi
         u1bA==
X-Gm-Message-State: AOAM530MMuEB+KdToVm+Qx/qSJFdBtwrP12dkIteWABxP5hpXFCsyUd2
        hep7ip/X+DUdnB/Gqj+OziUnjyNJ
X-Google-Smtp-Source: ABdhPJzo6Nf7QKwzHHB8TWQc7KI+xioxHV3ebroViVnk6mqUDJsg+5I756yebJODia8pYefdTKmhOA==
X-Received: by 2002:a2e:9886:: with SMTP id b6mr4935082ljj.258.1596772898499;
        Thu, 06 Aug 2020 21:01:38 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id j66sm3663946lfd.74.2020.08.06.21.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 21:01:37 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7c47b165-8663-87f0-bff5-37036d472fb9@gmail.com>
Date:   Fri, 7 Aug 2020 07:01:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <54e01160-4041-f8fa-065d-f635e8d69e2f@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

07.08.2020 06:18, Sowjanya Komatineni пишет:
> 
> On 8/6/20 8:14 PM, Sowjanya Komatineni wrote:
>>
>> On 8/6/20 8:10 PM, Sowjanya Komatineni wrote:
>>>
>>> On 8/6/20 7:31 PM, Dmitry Osipenko wrote:
>>>> 06.08.2020 22:01, Sowjanya Komatineni пишет:
>>>> ...
>>>>> +int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
>>>>>   {
>>>>>       const struct tegra_mipi_soc *soc = device->mipi->soc;
>>>>>       unsigned int i;
>>>>> @@ -381,12 +375,16 @@ int tegra_mipi_calibrate(struct
>>>>> tegra_mipi_device *device)
>>>>>       value |= MIPI_CAL_CTRL_START;
>>>>>       tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
>>>>>   -    mutex_unlock(&device->mipi->lock);
>>>>> -    clk_disable(device->mipi->clk);
>>>>> +    /*
>>>>> +     * Wait for min 72uS to let calibration logic finish calibration
>>>>> +     * sequence codes before waiting for pads idle state to apply the
>>>>> +     * results.
>>>>> +     */
>>>>> +    usleep_range(75, 80);
>>>> Could you please explain why the ACTIVE bit can't be polled instead of
>>>> using the fixed delay? Doesn't ACTIVE bit represents the state of the
>>>> busy FSM?
>>>
>>> Based on internal discussion, ACTIVE bit gets cleared when all
>>> enabled pads calibration is done (same time as when DONE set to 1).
>>>
>>> Will request HW designer to look into design and confirm exactly when
>>> ACTIVE bit gets cleared.
>>>
>>> Will get back on this.
>>>
>> Verified with HW designer. above is correct. ACTIVE bit update happens
>> same time as DONE bit.
>>
>> Active = !(DONE)
>>
>> In case of calibration logic waiting for LP-11 where done bit does not
>> get set, ACTIVE will still be 1 and on next start trigger new
>> calibration will start
>>
> Based on internal design check from designer, as long as its in waiting
> for LP-11 stage, next calibration request can be triggered again but
> ACTIVE bit we will see it at 1. So we should check for DONE bits to
> confirm if calibration is done or not.
> 
> To start next calibration, it can take effect as long as its in wait for
> LP-11 mode.

I meant the start_calibration() will poll the ACTIVE bit (calibration
busy), while the finish_calibration() will poll the DONE bit
(calibration applied).
