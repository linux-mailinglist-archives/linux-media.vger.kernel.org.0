Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A818D1B8A19
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 01:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgDYXpC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 19:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgDYXpB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 19:45:01 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A39C061A0C;
        Sat, 25 Apr 2020 16:45:01 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id w145so10802541lff.3;
        Sat, 25 Apr 2020 16:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZU42XIcgS2VviP7HFRu+osN0AFaUMg5C7wSElk9bM10=;
        b=c768HqFenoZAt4Bux0vC2EX2+l5MwuZuUUrA1X64xl6nIeHbq0XHsFzFxD47ZvMLGl
         l1H8o83F/vIxk2Sz2Z7rq3L+k/A/SmWHL6U00S3Z6wfZI17RWzfaf9mlrQAs3mVvHw6q
         SnSt1AgtGQW20QHqiQzdBtJIyMqIvxTz7ZdezX9KTApsNhcXYoVWr9ErIBJpaZ+J0t6P
         sS8+sae9xD5K/AjVrd+2Tk1+TJ+WyrDq3oJfY55EWPXIRMdXNNbXyFtHoSi/Yog4stdh
         2evxixLgmAOhNKBh/LEyzdCVfvqS4WcGuar3/zTqZKTv1wIIsZh2YNFIkp1Vaitcap3x
         HRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZU42XIcgS2VviP7HFRu+osN0AFaUMg5C7wSElk9bM10=;
        b=cEY0PJlTtVzGjJa37O12hci3S/U8mD7cqTyNH6yp0Nal1Sg58oISs+tJVIAE77lR23
         hgk91JqNKvaGT2nLddKmac63987Gki6zA5dj8CxE8XsqWqoS0xwVHsALK4iCOr9+N7Bo
         iri0Y3NMrHzXA1he3puwIEPnZBAnW7xJwj+p6/mGY2Wdg2QxOxUxRj0pSP3j669mewW1
         9GN3NHOBcmdosefLeQUTgB7p332yhcWENAEqqvK7JH/kKXMjdbkITbIMhN2viTnytb82
         pxwdcW766DvQQZ+FmorntQFEaiGy0/drYclaF/JtQg3UUI06BRrhGkkeed0d1OOd32LI
         fo0w==
X-Gm-Message-State: AGi0PubN8YU09U8f0rfma0nxnLvisMbxJBcNdyshy0H0frK+sHDQ6Vfr
        UO3biVuj4r2Ipz+3ZaDx3bPZKipx
X-Google-Smtp-Source: APiQypJxE9qBMQZdTT0IVdnD+nYCUUyrSR9Nk+ZB2rvspLDAReoa2+AY4bFsMMYWEtK7HvVvgLjbhg==
X-Received: by 2002:a05:6512:3055:: with SMTP id b21mr11157893lfb.127.1587858299648;
        Sat, 25 Apr 2020 16:44:59 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id r20sm6988725ljj.44.2020.04.25.16.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 16:44:59 -0700 (PDT)
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <fd5300fd-33af-babe-95d0-9669b66a8c06@gmail.com>
 <2983577f-fec9-f24c-0563-6d1f0e1dd5d8@gmail.com>
 <32e30b7f-865b-282e-5e19-e4c8cf217e63@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3f2916eb-dcd4-58c3-4d45-7f88620d4a83@gmail.com>
Date:   Sun, 26 Apr 2020 02:44:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <32e30b7f-865b-282e-5e19-e4c8cf217e63@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

26.04.2020 02:27, Sowjanya Komatineni пишет:
> 
> On 4/25/20 4:25 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 26.04.2020 02:13, Dmitry Osipenko пишет:
>>> 24.04.2020 06:55, Sowjanya Komatineni пишет:
>>>> +static int __maybe_unused vi_runtime_resume(struct device *dev)
>>>> +{
>>>> +    struct tegra_vi *vi = dev_get_drvdata(dev);
>>>> +    int ret;
>>>> +
>>>> +    ret = regulator_enable(vi->vdd);
>>>> +    if (ret) {
>>>> +            dev_err(dev, "failed to enable VDD supply: %d\n", ret);
>>>> +            return ret;
>>>> +    }
>>>> +
>>>> +    ret = clk_set_rate(vi->clk, vi->soc->vi_max_clk_hz);
>>>> +    if (ret) {
>>>> +            dev_err(dev, "failed to set vi clock rate: %d\n", ret);
>>>> +            goto disable_vdd;
>>>> +    }
>>> Isn't setting clock rate using assigned-clocks in a device-tree enough?
>>> Could you please clarify why this vi_max_clk_hz is needed?
>>>
>> In that case it should be wrong to set the clock rate in the RPM
>> callback because RPM works asynchronously and RPM may not be suspended
>> on TGP -> sensor source switch.
> 
> Driver will not do TPG and Sensor switch dynamically.
> 
> Based on kconfig, it will only do TPG or Sensor and sensor will be
> default all the time once sensor support is added in next series.
> 

Doesn't V4L have a native support for the capture source selection? Why
it needs to be a compile-time option?

I think other drivers use a generic V4L "Image Processing Controls" with
a configurable test_pattern option.
