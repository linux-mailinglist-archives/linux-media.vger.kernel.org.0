Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8211BC474
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 18:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728179AbgD1QEr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 12:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727985AbgD1QEr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 12:04:47 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E003FC03C1AB;
        Tue, 28 Apr 2020 09:04:45 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w20so22095925ljj.0;
        Tue, 28 Apr 2020 09:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7mUYj4GA/1dIgbyNxbqxWEcPwwbVckITyPakRYctQPs=;
        b=aJpp4Gbsa77D3CwVDtT/kYQST/DBrxv9rK0Cmb3AfK9jOlmBirwL/8H9udjnDy1uwC
         OvVx+TPsWhWHJfN1JckNgwNrss927ul1AFg3fExe2Fy4TdkANKvM796IN2LlBBrIHp8x
         5iLj7jc1kXxAzB5NhwGaq+g+dM/Z7WM6D+dzg7VedmfRtYkQqc9Pv9ynCj43PsNocGzo
         25FPXPl6+tmpmPnBu0HmtVmrHtuyRJ8LY7pGFF56q3jtZgBgSX9+oFtOIhDi1Inc4+Zu
         6rhSvD5jHBNcfYsEOOCYr5kQxYQ3YwkhzbXHZnj6ZvK5R6UGkMNrY5K3oxymw4rV66nN
         GoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7mUYj4GA/1dIgbyNxbqxWEcPwwbVckITyPakRYctQPs=;
        b=iErlHJzu5kTsLBEOmKHPwZEEYO5a9Z6WPFOQwZUTszcgHflHUdE+GdSHhprUhqcqRz
         PzSXLjtXIUFjfyyvWUmjr413W3BPt7VQxymMbq59qRwpSl0yCZxPlA7eKmbQi3poiwSK
         U1w039t/IeK0zNJDWMh7DZ5ucRzwwzsHofLJDuAviM0HUDCdKG3igo93xh794Gk6tGj4
         mms4oTLgXSTMEue2QFOg8zsXB+C+BlA7po/O/hofWUq76kWxhJAP17dy/7ii9kl6pqcA
         fmHQJNaQcXNMFM4FlEz6m1uylV3UcHyYN/aUSVT3jYSi4B/mAkx8mZPK/kEN2mUaczBw
         uxMw==
X-Gm-Message-State: AGi0PuZbw4WerVq3ne2ZxrMjQucN9SFBRMDdSBdyjy7tCmJxmN47HMOq
        RqKept0oqtPjcq0Tr3o5bdjmuvlY
X-Google-Smtp-Source: APiQypIXNtHvVX8LwOfgEDM/DfnbP2+tEIeXxPj7WLF58KTKZ9BuBggQ1ApM3WiwWyk/G+ctJakpBg==
X-Received: by 2002:a05:651c:1131:: with SMTP id e17mr19194200ljo.79.1588089883949;
        Tue, 28 Apr 2020 09:04:43 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id c19sm11233645lfj.18.2020.04.28.09.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 09:04:43 -0700 (PDT)
Subject: Re: [RFC PATCH v1 3/5] media: tegra-video: Move PM runtime handle to
 streaming
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
 <1588047650-29402-4-git-send-email-skomatineni@nvidia.com>
 <631390cb-9aff-0e3f-6c39-81d6c565987e@gmail.com>
 <3ef69413-a606-b475-f530-d5534760b73b@nvidia.com>
 <2b334095-fadb-bf0a-f7a8-62fc798c2bd2@gmail.com>
 <18a7b095-7f0f-7819-c786-7e011cfd14ed@nvidia.com>
 <ce31e273-f424-f13e-5cd6-0db2589a2a10@gmail.com>
 <5741d5d3-e474-e23c-4841-809df5760067@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f6e34203-3e4b-b804-30a5-bf78445ab366@gmail.com>
Date:   Tue, 28 Apr 2020 19:04:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5741d5d3-e474-e23c-4841-809df5760067@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

28.04.2020 18:22, Sowjanya Komatineni пишет:
> 
> On 4/28/20 8:15 AM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 28.04.2020 18:08, Sowjanya Komatineni пишет:
>>> On 4/28/20 7:59 AM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 28.04.2020 17:51, Sowjanya Komatineni пишет:
>>>>> On 4/28/20 6:59 AM, Dmitry Osipenko wrote:
>>>>>> External email: Use caution opening links or attachments

Is it possible to disable this corporate-email message?

>>>>>>
>>>>>>
>>>>>> 28.04.2020 07:20, Sowjanya Komatineni пишет:
>>>>>>> diff --git a/drivers/staging/media/tegra-video/csi.c
>>>>>>> b/drivers/staging/media/tegra-video/csi.c
>>>>>>> index b3dd0c3..29ccdae 100644
>>>>>>> --- a/drivers/staging/media/tegra-video/csi.c
>>>>>>> +++ b/drivers/staging/media/tegra-video/csi.c
>>>>>>> @@ -272,8 +272,25 @@ static int tegra_csi_s_stream(struct
>>>>>>> v4l2_subdev
>>>>>>> *subdev, int enable)
>>>>>>>          struct tegra_vi_channel *chan =
>>>>>>> v4l2_get_subdev_hostdata(subdev);
>>>>>>>          struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>>>>>>>          struct tegra_csi *csi = csi_chan->csi;
>>>>>>> +     int ret;
>>>>>>> +
>>>>>>> +     if (enable && atomic_add_return(1, &csi->clk_refcnt) == 1) {
>>>>>>> +             ret = pm_runtime_get_sync(csi->dev);
>>>>>>> +             if (ret < 0) {
>>>>>>> +                     dev_err(csi->dev,
>>>>>>> +                             "failed to get runtime PM: %d\n",
>>>>>>> ret);
>>>>>>> +                     pm_runtime_put_noidle(csi->dev);
>> Why this pm_runtime_put_noidle() is needed? This should be wrong, please
>> remove it.
> 
> pm_runtime_get_sync() increments power.usage_count prior to rpm_resume
> 
> if rpm_resume fails it does not decrement usage_count.
> 
> So to balance count on failure, calling pm_runtime_put_noidle()

Hmm.. maybe you're right. I'll need to take a more detailed look.
