Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0447C47E0BA
	for <lists+linux-media@lfdr.de>; Thu, 23 Dec 2021 10:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242905AbhLWJLZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Dec 2021 04:11:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239245AbhLWJLZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Dec 2021 04:11:25 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E1F4C061401
        for <linux-media@vger.kernel.org>; Thu, 23 Dec 2021 01:11:24 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id f134-20020a1c1f8c000000b00345c05bc12dso2875729wmf.3
        for <linux-media@vger.kernel.org>; Thu, 23 Dec 2021 01:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=E8oqCDxQAAUPB0dz/BCO4AOd3xZwCZLLVDd5QYYb2Ac=;
        b=IJrbSDmmwV9i4FGK8bAvQzi/bUWaAq1ASy2S7tx2Y4uYryn+dpBxqtzA6SSwkCRRP8
         5ktTkCtisSYvT/BZka6GG5eIUm71FfT90T90YRjMrWFgU3LJdm8Ga+KYEts+wQTbgpiO
         5RvIIB4yopIAO1U9auSTRhb1DsdKb08hz0DHKSEV9xBqC+g+JU1n5rzAkGCQVFNlTTTg
         8scnFPCWkrlXLY3SfFL/40lyUeETvLtlKAGUuML9bFUd6E1uppKaL3p15EFdF3Hj4i2a
         drBmmIkw0xBXVYO/8WMLmI3w4vEi2d7HcclVDcoBIuAhi/B/MQJt0t7NPi+mU698k2f7
         RvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=E8oqCDxQAAUPB0dz/BCO4AOd3xZwCZLLVDd5QYYb2Ac=;
        b=3WRzII/fAp9rUkbH0GTOTqQ4Ryj6QYMhyUmBMwLodM8q+Hl0MgOha12Bpdiq/XgdGI
         +fE6UvjZjVJZiZEGKW5M6N4NRm1kZ95AFdACyNbVIdJgRdA+OW2Jww4jdj0HJrUfcZRw
         oSDe0WqVXUi5DXh27dlKaajJcgENLmJhlPxnZ7yLXN+fEnhBAlxiGc9WT3ohLwCiCVvL
         XyCivcKrgjVadu75y72TAFe03mDGudSvNochSFnVd2Tilg5HDjrMaQBLu3vXT5aEt9/a
         7i4q3lXpeC5z7w8cSlcNTPir8z5TP+ZfavdSfm/GotBUdfcGiFdlsXfRwZReVI+ZTgst
         GitQ==
X-Gm-Message-State: AOAM530e/hHJ1W5fS8tBWzLNl4/QBo5e1WLLUtN9qWBVN4Jg8Dq9tKCL
        w0f1bN+HaXpMjLHszWne97I=
X-Google-Smtp-Source: ABdhPJzGl/qU+hk5aBABASio9ZLh9n+ZQxW0Tjdu/bqiIhAdRejLvEY9REe3X/CnyCl9Z/6ZNjrVbA==
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr1118161wmj.76.1640250683229;
        Thu, 23 Dec 2021 01:11:23 -0800 (PST)
Received: from [192.168.178.21] (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id k13sm4280339wri.6.2021.12.23.01.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Dec 2021 01:11:22 -0800 (PST)
Subject: Re: completely rework the dma_resv semantic
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <e8c7284f-e18e-0dcc-f0a2-3a1ad6222fd4@gmail.com>
 <YcOkB0Jlc5KsHnEN@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c63e62cc-e48e-2e81-571c-498e4d16fd21@gmail.com>
Date:   Thu, 23 Dec 2021 10:11:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcOkB0Jlc5KsHnEN@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 22.12.21 um 23:17 schrieb Daniel Vetter:
> On Fri, Dec 17, 2021 at 03:39:52PM +0100, Christian König wrote:
>> Hi Daniel,
>>
>> looks like this is going nowhere and you don't seem to have time to review.
>>
>> What can we do?
> cc more people, you didn't cc any of the driver folks :-)

Well I've CCed more people and lists and the first round of the patches. 
Just wanted to get some more comments from you first before widening the 
audience.

> Also I did find some review before I disappeared, back on 10th Jan.

Good, then I have at least something todo for the first week on January.

Happy holidays,
Christian.

>
> Cheers, Daniel
>
>> Thanks,
>> Christian.
>>
>> Am 07.12.21 um 13:33 schrieb Christian König:
>>> Hi Daniel,
>>>
>>> just a gentle ping that you wanted to take a look at this.
>>>
>>> Not much changed compared to the last version, only a minor bugfix in
>>> the dma_resv_get_singleton error handling.
>>>
>>> Regards,
>>> Christian.
>>>
>>>

