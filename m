Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF7A1698B0
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2020 17:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgBWQyT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Feb 2020 11:54:19 -0500
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:32328 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgBWQyS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Feb 2020 11:54:18 -0500
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 6B5D03F5BB;
        Sun, 23 Feb 2020 17:54:15 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=HEPMb2xN;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Gz0yG0ClAaNg; Sun, 23 Feb 2020 17:54:14 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
        (Authenticated sender: mb878879)
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id C1D963F418;
        Sun, 23 Feb 2020 17:54:12 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
        by mail1.shipmail.org (Postfix) with ESMTPSA id F0AE936023F;
        Sun, 23 Feb 2020 17:54:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
        t=1582476852; bh=wxPWZMnaHxvhqVllDP/O5dl63RWxie9K/haXwvx4klo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=HEPMb2xNPfy8xIdt+KGPbILif0AUcd7sIIy131vPJYooIV8JIzi41VU5qURkXDjGk
         Mbl000O7Cr23vlIJru4FvX6rigervSL+7YlkKAy45knXoPkjaJJhuOlKE49yozDYDr
         zQj1wbrzDxcs9ma+Jkvgx7aYKewZwdqY6t8fpZ8w=
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
To:     christian.koenig@amd.com, Daniel Vetter <daniel@ffwll.ch>
Cc:     intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20200217154509.2265-6-christian.koenig@amd.com>
 <20200217175518.GL2363188@phenom.ffwll.local>
 <f8ac7cbc-7c90-7119-735c-9f55adb6fa7f@shipmail.org>
 <CAKMK7uHG3EkEPbAQ3UEHHLcfmR+0NPq0wZuBX+s2-WCFdso8ew@mail.gmail.com>
 <79a0d79f-91bd-2481-740c-20e6c819c7c9@shipmail.org>
 <ee929c93-c9d7-7243-810e-94c6f0fc64b0@shipmail.org>
 <20200220180459.GS2363188@phenom.ffwll.local>
 <d1c37ec4-b63e-437a-a2be-80ba5192e048@shipmail.org>
 <20200220200831.GA2363188@phenom.ffwll.local>
 <501bf409-e4fe-a318-17b4-d5d050b09529@shipmail.org>
 <20200221171217.GD2363188@phenom.ffwll.local>
 <d9343617-9da8-5fea-a0f1-99db34a0cf2c@gmail.com>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= 
        <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <8f29b152-9c7b-3427-efa2-4a39f0daced8@shipmail.org>
Date:   Sun, 23 Feb 2020 17:54:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <d9343617-9da8-5fea-a0f1-99db34a0cf2c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/23/20 4:45 PM, Christian König wrote:
> Am 21.02.20 um 18:12 schrieb Daniel Vetter:
>> [SNIP]
>> Yeah the Great Plan (tm) is to fully rely on ww_mutex slowly 
>> degenerating
>> into essentially a global lock. But only when there's actual contention
>> and thrashing.
>
> Yes exactly. A really big problem in TTM is currently that we drop the 
> lock after evicting BOs because they tend to move in again directly 
> after that.
>
> From practice I can also confirm that there is exactly zero benefit 
> from dropping locks early and reacquire them for example for the VM 
> page tables. That's just makes it more likely that somebody needs to 
> roll back and this is what we need to avoid in the first place.


If you have a benchmarking setup available it would be very interesting 
for future reference to see how changing from WD to WW mutexes affects 
the roll back frequency. WW is known to cause rollbacks much less 
frequently but there is more work associated with each rollback.

>
> Contention on BO locks during command submission is perfectly fine as 
> long as this is as lightweight as possible while we don't have 
> trashing. When we have trashing multi submission performance is best 
> archived to just favor a single process to finish its business and 
> block everybody else.

Hmm. Sounds like we need a per-manager ww_rwsem protecting manager 
allocation, taken in write-mode then there's thrashing. In read-mode 
otherwise. That would limit the amount of "unnecessary" locks we'd have 
to keep and reduce unwanted side-effects, (see below):

>
> Because of this I would actually vote for forbidding to release 
> individual ww_mutex() locks in a context.

Yes, I see the problem.

But my first reaction is that this might have undersirable side-effects. 
Let's say somebody wanted to swap the evicted BOs out? Or cpu-writes to 
them causing faults, that might also block the mm_sem, which in turn 
blocks hugepaged?

Still it's a fairly simple solution to a problem that seems otherwise 
hard to solve efficiently.

Thanks,
Thomas


>
> Regards,
> Christian.
>
>> -Daniel


