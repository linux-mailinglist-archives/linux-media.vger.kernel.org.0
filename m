Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D64220B269
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 15:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgFZNXS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 09:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgFZNXS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 09:23:18 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7741C03E979;
        Fri, 26 Jun 2020 06:23:17 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y18so5136289lfh.11;
        Fri, 26 Jun 2020 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PM74e3+EpsWuBmUt4WwdQ1M5mcj6bdNzDdF2OfJXJbU=;
        b=hlD2jkt5VhihxQSWPiApn8iLWjgnzyZ82HMMilY8YqWLg0Rp0tA46wLUhKk5N7EXy9
         rgo1PcPqVGOymD791BKvsG7IpgOYA6aS8W1g5FJXLON4jdbgHBOuBhmWE3dbr8a7FPwa
         kToKleRM7s9Oy27qpmQhC3hg/77lHgA0sQ9EPHbReYMPDaq3Jgqky0f+lkJjKwczKdXC
         YWFIwIP+rkhiKo3s5jn41OhPPilMcLMSJes4MafT+7LW7sIRWxj2NAxPKbT5r4/TSYE4
         rg+KImjbc8tldNfmaiowmnUocZgeTvqMvk3vculDr/1ix9vsUc30Etc0zLEpxfywAeS3
         XafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PM74e3+EpsWuBmUt4WwdQ1M5mcj6bdNzDdF2OfJXJbU=;
        b=osOHnJQtaToSP3vj3HvDjuBsmmT75JnDy0AISToHBxP+FQ+yau+vnfVAOmEqeqCRNJ
         F6DAJLCw/QYNuOvPe5t987KAP90tKPtNAnrxoS7rgWEUr28mSzWC448a/gzpUKa3h0lw
         kFlfo6ywFUWCzkT0kPIXzmvou7xQuXhtquWb04SPLiaRMuI66cNaqxKjLRoAe2XPO8Gz
         shoxojinO6COJqUoi2rFKq23TvKr6CQk/SLN/bQMazIJ7GQ1QtaY6WfrJ9at/VoDoPsx
         Ojod61PyIDV7LzbQdkqtne1yVtnagzr6GWnbPHAE62ND1zXhk+08s+RVYDt7IaMe/EQg
         xDlw==
X-Gm-Message-State: AOAM530DoLlPpVj/+urw2Y3mjHBQDC5UKpYe4J7pfX8FS9PuDrcWxpQc
        DFr0FQTj/Maz4xqDl3VHxwAOkXqKjJY=
X-Google-Smtp-Source: ABdhPJzHpPU2SCmHwo7ktOuCeE7fdiW20wkbAMADVrBVU1XwpDL0ypMwHVUjWBGz/2d+xgsFj6dLEQ==
X-Received: by 2002:ac2:4158:: with SMTP id c24mr1868233lfi.109.1593177796021;
        Fri, 26 Jun 2020 06:23:16 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id h189sm6776569lfd.47.2020.06.26.06.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 06:23:15 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] Tegra Video Decoder driver power management
 corrections
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
References: <20200624150847.22672-1-digetx@gmail.com>
 <90323aa6-38b5-0a45-69a7-ccf380690a78@xs4all.nl>
 <23cbaa18-9461-8f72-3d43-aa14cd0c1095@gmail.com>
 <0e14df05-8299-52d6-df8f-0dd476f4109d@gmail.com>
 <e41ff660-6c6c-d603-c767-34e7f4b4a23d@xs4all.nl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3adf74ea-3aba-ad93-977a-8b42ab653ee9@gmail.com>
Date:   Fri, 26 Jun 2020 16:23:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e41ff660-6c6c-d603-c767-34e7f4b4a23d@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

26.06.2020 09:58, Hans Verkuil пишет:
> On 26/06/2020 02:17, Dmitry Osipenko wrote:
>> 24.06.2020 18:23, Dmitry Osipenko пишет:
>>> 24.06.2020 18:16, Hans Verkuil пишет:
>>>> On 24/06/2020 17:08, Dmitry Osipenko wrote:
>>>>> Hello,
>>>>>
>>>>> This small series addresses a Runtime PM issue that was discovered during
>>>>> of Tegra VI driver reviewing by balancing RPM usage count on RPM resume
>>>>> failure. Secondly it fixes reboot on some Tegra devices due to bootloader
>>>>> expecting VDE power partition to be ON at the boot time, which wasn't
>>>>> happening in case of a warm re-booting (i.e. by PMC resetting).
>>>>
>>>> Can you rebase this on top of the media_tree master branch? I think a variant
>>>> of patch 1 has already been applied. I found a mail today where you mentioned
>>>> that you preferred your version (it looks like I missed that) so you'll need to
>>>> rework patch 1.
>>>
>>> Hello Hans,
>>>
>>> I'll take a look at what patches has been applied, my bad for sending
>>> the v2 too late. Thank you for the heads up!
>>>
>>
>> I tested the already-applied variant of the patch 1 and it has the same
>> behaviour as my variant, so it's okay.
>>
>> Would you want me to send a v3 without the conflicting patch 1 or you
>> could apply the patches 2-4 from this series?
>>
> 
> I'll mark 1/4 as superseded and will apply patches 2-4. No need for you
> to do anything.

Thank you!
