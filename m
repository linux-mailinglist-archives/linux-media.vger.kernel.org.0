Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5A811BF96D
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 15:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgD3NYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 09:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727085AbgD3NYY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 09:24:24 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64271C035494;
        Thu, 30 Apr 2020 06:24:23 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id h4so6432840ljg.12;
        Thu, 30 Apr 2020 06:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qde8t3vRUc/hQ/MC7JEYphNWgl9OWJai6PKBunRXPXA=;
        b=lMKcXJnvcttkwHN0EbPnQfc1IC1TeYfDz2/nKRisC3XiSrB6PRb6AMLIkRVM3+cbXv
         iSFdihYCojZZbCI4glgaa3Lz74NEbsN/kPs0wpfm/7+amrmd9LCoShpr0Id6Kx9ieenf
         mIuqI/Zqr06HVNstAfDNtLuoPQ0TkhhpbiSQwy7X8XiTYsU5XWgZeHOzRH7pU20SKimY
         0LtRVMhyDxnuDRD4qQ6H5emdnmTEuNwSTu8+HDURfpB4WZcz0ajyGLhdY9v6oS/GzE1y
         BHDTbisHQnjiUv9Yu5jUZf5t4lke+TxWj7+CKHzhXHeSxITy+6mhIzInLIFAvEdHIDoQ
         CIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qde8t3vRUc/hQ/MC7JEYphNWgl9OWJai6PKBunRXPXA=;
        b=YsILYFAR32LJqnoMTOfitLmbeOJMuz6xK0+LxnbQfh+yKiIDTtrP0Q++H82evq5TF5
         ocBZneha8HIrND0dQi07mWsLK3DKBOgxEJQ+g9IS63F9GW19eQd92+nWEJmGgHRA8c2u
         R9olJkzyu3sZ/WPJw5Wf+0uIw6qtVbBH9E9BNlIVH+hVdBieRh0L7qs/maiyYGQbS6Ci
         /eLQd9uocNCFf9XtDIx3wzezNaV2VogKwNcO+x8g2QD3RPFrieNRQ2kFVy1z6/azcZ/0
         PAPZ4KWtJyVS181KyWUSYY404P7ir/F3Xmknr7C3qlWPmZr617kOQCSj9DWDRJYB/ldE
         QmCA==
X-Gm-Message-State: AGi0PuZBa3fSQkKA6s+yF0a1xiZp+dEDGaYEJUKNzL8eyNinFfXw0Aw4
        qNmzSK/DZnj4O0z6tSv45YCvBReR
X-Google-Smtp-Source: APiQypKVnFF7PMVGH7zBRJZEH4i3Y3qqneV0Yoo3oMoTYqDvFv2MSojkc9RD0I7qj0CVmALYXElfpQ==
X-Received: by 2002:a2e:99c2:: with SMTP id l2mr2248343ljj.92.1588253061664;
        Thu, 30 Apr 2020 06:24:21 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id h6sm4566128ljj.29.2020.04.30.06.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 06:24:20 -0700 (PDT)
Subject: Re: [RFC PATCH v1 3/5] media: tegra-video: Move PM runtime handle to
 streaming
From:   Dmitry Osipenko <digetx@gmail.com>
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
 <f6e34203-3e4b-b804-30a5-bf78445ab366@gmail.com>
Message-ID: <6a676161-e948-9afc-296b-ccd1df202e36@gmail.com>
Date:   Thu, 30 Apr 2020 16:24:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f6e34203-3e4b-b804-30a5-bf78445ab366@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

28.04.2020 19:04, Dmitry Osipenko пишет:
...
>>>>>>>> +             ret = pm_runtime_get_sync(csi->dev);
>>>>>>>> +             if (ret < 0) {
>>>>>>>> +                     dev_err(csi->dev,
>>>>>>>> +                             "failed to get runtime PM: %d\n",
>>>>>>>> ret);
>>>>>>>> +                     pm_runtime_put_noidle(csi->dev);
>>> Why this pm_runtime_put_noidle() is needed? This should be wrong, please
>>> remove it.
>>
>> pm_runtime_get_sync() increments power.usage_count prior to rpm_resume
>>
>> if rpm_resume fails it does not decrement usage_count.
>>
>> So to balance count on failure, calling pm_runtime_put_noidle()
> 
> Hmm.. maybe you're right. I'll need to take a more detailed look.
> 

I checked the RPM's use-count after error condition and yours variant is
correct. Perhaps we should start correcting all other Tegra drivers that
do not handle the RPM error properly.
