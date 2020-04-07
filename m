Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D51721A187C
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 01:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgDGXMc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 19:12:32 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46583 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgDGXMc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 19:12:32 -0400
Received: by mail-lf1-f68.google.com with SMTP id m19so1677410lfq.13;
        Tue, 07 Apr 2020 16:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RwBDvU/d/RuyuOicf+LMSeUuB7FpaSGPCFNY8uUMcT8=;
        b=ITb0PCiLvFvAVN7bpWpJlckTjQ8s/wjqbxLsbWXCFsj+XrR6vru92/JlT6lzOgpb0u
         GvSyCbY86jIPTEp7Rr6UG3CpHXhrlyN6C7QMfn9hGHT5V94hmDalVuuw6l9Uj+jhnEpL
         0w+zGOx2K4nyKvpPS1itml53GKUo/T2CDvs+jNKP83LXgAiqyUEMkQukAExr3FGhUMK0
         /q2xBHo/iw98t6r1GJ1gaaC8/QbQZmkYgHikswey901fj0KneeQkZ/8Oq6B4+5lXpTPy
         QCx3IlR4i1XwPUTGs2RiyEngHTxoZVbLXWuUTpGiGD93wuoUcU/BPwTEWWiry2rngf2P
         dYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RwBDvU/d/RuyuOicf+LMSeUuB7FpaSGPCFNY8uUMcT8=;
        b=A8cj4Mm/6m7HBUghxwF8KyDY8QfJD5MoDA5jW8IJuOMEmFWCA6o3ihf2QRPynMe/9r
         Hy9a1L7ur3XRdLN21rzampW7+uxxC+jypwsQe49wK4ZYGXEkMsfN5g50G9qBk/D+O27r
         fT8j/ExA6jz8VSiE14WfNBACgYMY6471MnSbv+sRlU9aS1oP3wc6q7P4SgQNDCH39zEP
         tDwkVeK9THQ0iv9o3nY8euBNmGokrOGuGm1v994Ckn613Gc7vzyrq5wgwNzcllPGynZM
         qHhycVQ8jStsP3pay3g35A7mWT7LEJXZgSg1c2712EgsqlV3m7DTG/4hu3JhY7idIrCe
         vDYw==
X-Gm-Message-State: AGi0PuatZMcSzG14cIesifDWQDDJG8I2gc48bLlbKibvskhFrwa7tQZI
        IyGILgnDNkiIXiD2dJRrKh4zTns6
X-Google-Smtp-Source: APiQypLgfZ7BpY4nMrnJrXTT3z+5gBIe2iOt5bl8wLbbK0kgy8mwEcvrUJhccF8GU5G5Zh9WGlI4uw==
X-Received: by 2002:ac2:5607:: with SMTP id v7mr2758744lfd.212.1586301148120;
        Tue, 07 Apr 2020 16:12:28 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id c2sm14650894lfb.43.2020.04.07.16.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 16:12:27 -0700 (PDT)
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <200bb96e-2d07-764f-9e14-55538dc742fd@gmail.com>
 <23bfab09-b464-6e51-9843-06d13000e9b9@nvidia.com>
 <be77b0ef-d605-8357-4180-f40b2886d07a@gmail.com>
 <08cd31d5-e8b9-4d3a-fb0e-0e4462947d96@nvidia.com>
 <12a834ac-52b1-6dc0-7d3a-3e6a1fa85a2a@gmail.com>
 <e3712e7b-b335-b35b-a94f-24eb85122dca@nvidia.com>
 <b1726d33-0d35-9323-a747-407148d0104e@gmail.com>
 <eb80178f-30f4-8f46-51cd-ea3f4914b81d@nvidia.com>
 <dd16c560-ba8f-e7df-5dc4-5227e0043196@nvidia.com>
 <fea4f0a1-4a20-34d4-9eda-e4a599eeeffc@nvidia.com>
 <760d071e-0cbc-b3eb-9231-fb9f9ecb44a6@nvidia.com>
 <9e317f65-8a02-3b15-cfec-8e0d8374130e@gmail.com>
 <97b35910-4c93-123a-43a0-eb14476ed0f3@nvidia.com>
 <84ad4e2d-6ac1-e1f4-1c55-5edaae850631@nvidia.com>
 <15a879b3-8fb9-6821-3cdc-104ba583ac12@gmail.com>
 <0c425505-347f-7418-af7e-d121fe0d06dc@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <db7c7051-5674-cdb9-0aa4-ee94125b3024@gmail.com>
Date:   Wed, 8 Apr 2020 02:12:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0c425505-347f-7418-af7e-d121fe0d06dc@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

08.04.2020 01:22, Sowjanya Komatineni пишет:
> 
> On 4/7/20 3:08 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 08.04.2020 00:08, Sowjanya Komatineni пишет:
>> ...
>>>>> I think you need a semaphore with resource count = 2.
>>>> we hold on to issuing capture if more than 2 buffers are queued and it
>>>> continues only after fifo has min 1 slot empty
>>>
>>> Just want to close on this part of feedback. Hope above explanation is
>>> clear regarding triggering/issuing at max 2 frame capture to VI HW and
>>> also regarding capture threads where they use wait_event_interruptible
>>> to prevent blocking waiting for buffers to be available for captures.
>>>
>>> So no changes related to this part are needed in v7.
>>  From what I see in the code, you "hold on" by making kthread to spin in
>> a busy-loop while caps_inflight >= SYNCPT_FIFO_DEPTH. So some change
>> should be needed to prevent this.
>>
>> The wait_event_interruptible seems should be okay.
> 
> We don't want to prevent that as we already have buffers available for
> capture so as soon as VI HW issuing single shot is done and when min 1
> slot is empty we should continue with issuing for another capture.
> 
> As long as buffers are available, we should continue to capture and
> should not hold
> 

I suppose that taking a shot takes at least few milliseconds, which
should be unacceptable to waste.
