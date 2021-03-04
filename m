Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBCB532DCD9
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 23:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbhCDWR6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 17:17:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhCDWRy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 17:17:54 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5FC0C061574
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 14:17:53 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id j12so20018234pfj.12
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 14:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=GotqnMKBTHF+4cx5TE7hA6KyR3bCHxjh+ndV2EpmD50=;
        b=PZ733tbeXGTBA1st3RfuLRGaQClcd4Vr6PQX94ff/AwvxsyV7H7V8OlUMsAT9J0AK/
         zhzp4DtM2Fa+IOpusD0wOqUgJsUaO9Uqq1SmzcvJHIWIov01BX7BuKLoGwcLwFNHHg6K
         J28FvQ1TGaq4UBcdnkjxMaYjhnmAFGbRaQ45E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=GotqnMKBTHF+4cx5TE7hA6KyR3bCHxjh+ndV2EpmD50=;
        b=l0+KSBci5LObvtTYu9yxCYdBepk+KeQVINp4wGXDkzwJ+LbLd4b1OZwypkhB3hPE/o
         fUAdIgJZVDxxo0VJ+g9BTaXgCLnLrpQ9EJ2RCjXt6p1qmWVokPcC/EnzlCK/pNLCkQW2
         E2t5T1rKr8OLZZOa6yFK0vLCA3BaJQT13CLMSb21px9XyP9F29nUObKdQulQ92YAuhSy
         2YoABj9X6o5LNeAKUV2HJACTQs+uiAjml0K1gzDQBVDerFTtrsbKCxQble9CWHpr7r8+
         DvEWGCTLZOGY7Pua6ufE9tv8slTvDtq6WG18jA6p5O1WBMWWIbEhO40IIG0n/4x3tzhb
         QRXg==
X-Gm-Message-State: AOAM530CWFPP3ZawvfkTymFrileQohI1d/SeANq0Dd8aKn/bZyMlZlpq
        VsCYfl94zusBfm3IbKrxjL80iZM3U2EiQg==
X-Google-Smtp-Source: ABdhPJzSiHldUQBUMIH18GXx3WOtiuoix2hwfcwMF5d/B5hACoAN9NbuGr9X4KyIcAMufrb3iIwK+w==
X-Received: by 2002:a63:e5e:: with SMTP id 30mr5658214pgo.181.1614896272865;
        Thu, 04 Mar 2021 14:17:52 -0800 (PST)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net. [71.202.115.154])
        by smtp.gmail.com with ESMTPSA id bg16sm213448pjb.43.2021.03.04.14.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 14:17:52 -0800 (PST)
Subject: Re: v4l2loopback and v4l2-mem2mem framework
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media <linux-media@vger.kernel.org>
References: <45cda97c-a0e4-eef2-ba8f-ddc7e33b40d5@penguintechs.org>
 <4cdd691f-dc55-fc6e-1830-ac0c24b8e96b@penguintechs.org>
 <CAAEAJfCSfwxv5NyaH05Dfiw4wm6vGxL_ajoFup6r-GKx_VymJA@mail.gmail.com>
 <86f1dd6b-7593-adba-b5a6-abf4f8e35d8b@penguintechs.org>
 <b0c87b78-de21-07b5-6ae0-39401cf005b9@penguintechs.org>
 <2a70dbaaee14acd5652c80df2176ac9b183c6e1b.camel@ndufresne.ca>
 <4b7ddda5-47bf-8514-feb2-f66df9219850@penguintechs.org>
 <7011308c-9127-fcce-4635-c3095a540ecc@xs4all.nl>
From:   Wren Turkal <wt@penguintechs.org>
Message-ID: <3e32e037-0e9b-d643-aaf7-5c0f80b4663d@penguintechs.org>
Date:   Thu, 4 Mar 2021 14:17:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <7011308c-9127-fcce-4635-c3095a540ecc@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/4/21 1:58 AM, Hans Verkuil wrote:
>> I am not sure which you're suggesting to use: vivid or vimc. Also, are you
>> suggesting to extend them or use them as a template for a new module?
> I don't think either vimc nor vivid are particularly suitable for this, although
> vivid comes close. You can certainly lift ideas from vivid.

Thanks for the advice. I'll definitely look at it more closely.

>> I am assuming you are saying to port v4l2loopback to vb2. I am working on that
>> right now, but I am not sure how to proceed since the vb2 needs a queue for
>> capture and a queue for output (since they cannot be the same). I have created
>> the queues, but I am not sure how to further integrate. Please check out the
>> WIP here:
>> https://github.com/wt/v4l2loopback/commit/e71b0a50427729a5e6e74443066751f7321dc404
>>
>> If the m2m is the wrong approach, do you have any suggestions for how to
>> proceed?
> You need two video devices, one capture, one output. I see that the current
> loopback driver has just one video device and advertises it as a M2M device,
> but that's not what it should do. Creating two video devices (similar to what
> vivid does) is the best and most compatible approach.
FWIW, there is ongoing work to split the devices in v4l2loopback right now.
>> Also, I am currently making a change for the linux kernel moving this code
>> info drivers/media/v4l2-core/v4l2-loopback.c so that I can start iterating
>> with your feedback. Is that a correct place to put this code?
> No, v4l2-core is for core V4L2 frameworks, not for drivers.
>
> For now stick it in drivers/media/test-drivers. It will likely be moved again at
> some point (if we keep the 'misc' device that the current driver creates, then
> it might end up in drivers/media/misc).
>
> By far the most important thing you need to do is convert it to vb2. Since the
> intention is to upstream the driver I would start by doing a cleanup of the code,
> ditching all compat code with older kernels, making sure it adheres to the
> linux coding style (use 'scripts/checkpatch.pl --strict' for that), then split
> it in two video devices and use vb2.
>
> I actually wonder if it shouldn't be renamed to viloopback since it will be
> different from v4l2loopback. Anyway, that's something that can be done later.

Thanks for the advice. I'm happy to rename it to viloopback now if that makes sense.
That is very little work.

I am moving the code to test-drivers for now. Thanks for that feedback.

wt


