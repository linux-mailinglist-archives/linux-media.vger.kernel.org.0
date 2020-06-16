Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C83F51FAF0A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 13:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728160AbgFPLXu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 07:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgFPLXt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 07:23:49 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF1D0C08C5C2
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 04:23:48 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id w16so20542060ejj.5
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 04:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qpexp3RkjxitjYyax71XJ65xkJqK+VpFeUkVzeKS31U=;
        b=CzcrJ5qYmxaryGHdthk67cFgCecZH0CWdPJ5g60Tbk7urXTr3nTLDwfmB5s1698gNp
         2W8xKL96xH4IMnKONF0VYAjsOIKLyXp7eo5uqkRsmdTf+MPQTQTTLfbUsp7/iu6uP3VQ
         6cCMPgG5TQeczkuPQgzlJjgGcYYBTbJmi0nxT+pe5/KADtzhPDdLdIQcjcedQhXho4Bq
         Lb4Xx2PzbJ5XDcT8p0pdhf253Rr+exgxegmp4Of5dpkqmnftSt5JI4nSn1U5ooXhJZio
         5jm8Br0wcEJCMYBGptdMm09o9IQC/DMQYNcRRNDOGYpmY5HMe0Obx7OZieVR0aeIQ9qG
         A9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qpexp3RkjxitjYyax71XJ65xkJqK+VpFeUkVzeKS31U=;
        b=LgFNCN0ilBkvKTFQ5dO/6A89W4OIp/rWmlBrKh/CP2Qtme2Q2/Ox7QY7hxyqFa3dt0
         NuK8ly25UMBHNeXvkqIOLuqFyHZBiEDr3JiUC/dBE5SXyKTR9Rx4fsvJZKC9XGkYcP/S
         nn+tpd0GWvDhCz8Tc3mN3z8EM/tuQ1LoJCAdjgkdSgB+Rtv5Tt3TJ5KBXrT1x+ZQomZQ
         Z4DV51DrkAptZaxJfrnclLDykmY4bC6W6FC/Q47y1j2tuXopYYqPB2Tqm+nYcCDOzpMi
         lqMicWqUEz38+SS6WZoIjIX4jI1g/yJwQRtmXQ5bzbdk3xdaJHba7IG6BSes0sNL9PeC
         /Hdw==
X-Gm-Message-State: AOAM532tmUgTD11qYupqYmjsevEv296hJot5Qi5lrUyZluUxrU+jdMqh
        mFX2WG9QBxH7Jyl3f8tT42iXkQ==
X-Google-Smtp-Source: ABdhPJwKr4leC7r3LIVJk23t6Nm5edH3moLqFl/zFOX/DcPhAXaJAtmXjP54cSGsZ1INulzT27bARA==
X-Received: by 2002:a17:906:3951:: with SMTP id g17mr2368423eje.414.1592306626719;
        Tue, 16 Jun 2020 04:23:46 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.googlemail.com with ESMTPSA id y12sm7638412edj.37.2020.06.16.04.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 04:23:46 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] venus: Make debug infrastructure more flexible
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20200613223919.7038-1-stanimir.varbanov@linaro.org>
 <20200613223919.7038-3-stanimir.varbanov@linaro.org>
 <20200614063710.GB2611869@kroah.com>
 <c54a12a2-7f92-105c-a01c-8e85730f36bb@linaro.org>
 <20200615120337.GA511582@kroah.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <0f53eb20-6f52-e76e-3957-f7af38b88d35@linaro.org>
Date:   Tue, 16 Jun 2020 14:23:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200615120337.GA511582@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Greg,

On 6/15/20 3:03 PM, Greg KH wrote:
> On Mon, Jun 15, 2020 at 12:55:29PM +0300, Stanimir Varbanov wrote:
>> Hi Greg,
>>
>> On 6/14/20 9:37 AM, Greg KH wrote:
>>> On Sun, Jun 14, 2020 at 01:39:18AM +0300, Stanimir Varbanov wrote:
>>>>  	if (slot == -1) {
>>>> -		dev_dbg(inst->core->dev, "%s: no free slot\n", __func__);
>>>> +		VDBGH("no free slot for timestamp\n");
>>>
>>> Again, no, you just lost a lot of valuable information by changing to a
>>> different format (like driver, specific device, etc.).  Please don't do
>>> this, it just makes the information less than before.
>>
>> OK, one of the reasons to use pr_debug inside VDBGH macro is to avoid
>> having struct device *dev variable in every function with dev_dbg even
>> when the function doesn't use it.
> 
> But the function _is_ using it, as you are referring to the device that
> is being controlled by the driver.  That's the point, you are stripping
> off that very valuable information for no git grep dev_dbg | wc -lreason.
> 
> Which means to me that you never really actually _NEED_ these debugging
> messages, as you have not used them to see if it provides you with
> something that can tell you something about something.
> 
> So, let me push harder, why do you even want this message at all?  What
> can it provide you now that the driver is up and working properly?

I will delete that message.

> 
>> Are you fine with s/pr_debug/dev_dbg in VDBGX macros?
> 
> I would be a bit happier yes, but the fact that you didn't use it means
> you aren't even looking at these messages, which implies that it isn't
> even needed.
> 
> So, how about just stripping all of these debugging messages out

I'm not sure for which messages you are talking. The messages added by
this patch or the messages which currently exist?

> entirely?  What do they provide that you don't already know?  Who would
> use them?

Presently in 5.8-rc1 debug messages count for similar (encoder/decoder)
drivers compared with Venus one:

Venus
$git grep dev_dbg | wc -l
15

Coda
$git grep coda_dbg | wc -l
56

Mtk-vcodec
$git grep mtk_v4l2_debug | wc -l
95

Mfc
$git grep mfc_debug | wc -l
227

As you can see Venus driver is the one with smallest count of debug
messages. It is smallest because I also don't want to overload the code
with so many debugs and thus make it unreadable.

I personally don't need so much debug messages. I can add them to debug
some particular issue and drop them before sending the fix. But now when
the driver is going to be used more widely I've been asked to "improve"
debug infrastructure. That will help to unfamiliar with the driver
persons to enable debug messages and send bug reports to help them to
diagnose the problem.

What messages are needed and where is a subjective question. I'm relying
on my experience with the driver and issues I had previously.

> 
> thanks,
> 
> greg k-h
> 

-- 
regards,
Stan
