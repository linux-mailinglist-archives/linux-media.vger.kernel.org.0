Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87F67259246
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 17:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728713AbgIAPGz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 11:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728603AbgIAPGa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Sep 2020 11:06:30 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028B8C061244;
        Tue,  1 Sep 2020 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=tss5M/CgWtNHrn8kN3neH2rNWYnxcMFrfLkwrH1qZaA=; b=yraft6TribLHwkrXJ7oKDtJRbK
        cOoSth/ZTysdAmjuNC9rchtYeF0z+4F1RM8ZSndjz2v5LMkusAM9mIEOSPtOBEwb0PrM+xXx7Ea7l
        /ikF7LoG7gYahgDVNW4fpo5YAAYo7+GSKX3Kj5LrIdLfBohdGxGfIZnJ7e4SMWbdBgoLHEIW8Tgf+
        njRXFLID+gofXGqnwhgAGdxbeaCAz+DaJh+I7tc9ACsUsCsauw+lX1T/rK1szN+XezzxnPVRwgJmj
        cElkLQkrY4Cp0YxyEUGpaWUKkF76V0isaghz3YuqDIfij7YJSYYX6sQuqof0yxOOvFOlXTjYKms7X
        VU1axofA==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kD7rf-0005MS-Oa; Tue, 01 Sep 2020 15:06:28 +0000
Subject: Re: [PATCH] dma-buf: fix kernel-doc warning in dma-fence.c
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org,
        Gustavo Padovan <gustavo@padovan.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20200831041713.12571-1-rdunlap@infradead.org>
 <81dc0a34-90f6-401a-f846-924fdff4aaff@amd.com>
 <20200901133200.GE2352366@phenom.ffwll.local>
 <d057988a-7ba4-7e3b-1c36-e40e9a5a8d9a@amd.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e15d8d9b-3988-191d-f9c0-6e5c3efe7485@infradead.org>
Date:   Tue, 1 Sep 2020 08:06:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <d057988a-7ba4-7e3b-1c36-e40e9a5a8d9a@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/1/20 6:37 AM, Christian König wrote:
> Am 01.09.20 um 15:32 schrieb Daniel Vetter:
>> On Mon, Aug 31, 2020 at 12:02:03PM +0200, Christian König wrote:
>>> Am 31.08.20 um 06:17 schrieb Randy Dunlap:
>>>> Add @cookie to dma_fence_end_signalling() to prevent kernel-doc
>>>> warning in drivers/dma-buf/dma-fence.c:
>>>>
>>>> ../drivers/dma-buf/dma-fence.c:291: warning: Function parameter or member 'cookie' not described in 'dma_fence_end_signalling'
>>>>
>>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>> Cc: Gustavo Padovan <gustavo@padovan.org>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: linux-media@vger.kernel.org
>>>> Cc: dri-devel@lists.freedesktop.org
>>> Acked-by: Christian König <christian.koenig@amd.com>
>> Will you merge these two to drm-misc-fixes or should someone else?
> 
> I was wondering the same thing and just waiting for Randy to reply with please pick them up or I'm going to push them because I have commit access.

I didn't realize that was needed, but anyway, Christian, please apply these 2
dma-buf kernel-doc patches.

thanks.

> Regards,
> Christian.
> 
>>
>> Always a bit confusing when maintainers reply with acks/r-b but not what
>> they'll do with the patch :-)

Agreed.

>> Cheers, Daniel
>>
>>>> ---
>>>>    drivers/dma-buf/dma-fence.c |    1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> --- lnx-59-rc3.orig/drivers/dma-buf/dma-fence.c
>>>> +++ lnx-59-rc3/drivers/dma-buf/dma-fence.c
>>>> @@ -283,6 +283,7 @@ EXPORT_SYMBOL(dma_fence_begin_signalling
>>>>    /**
>>>>     * dma_fence_end_signalling - end a critical DMA fence signalling section
>>>> + * @cookie: opaque cookie from dma_fence_begin_signalling()
>>>>     *
>>>>     * Closes a critical section annotation opened by dma_fence_begin_signalling().
>>>>     */
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org


-- 
~Randy

