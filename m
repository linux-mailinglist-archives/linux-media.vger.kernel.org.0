Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12972CB7B0
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 09:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387939AbgLBIru (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 03:47:50 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:39337 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729216AbgLBIru (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 03:47:50 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id kNmykxdtjkGBYkNn1kZSlW; Wed, 02 Dec 2020 09:47:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606898827; bh=elqksiKShYm5pfpk7EDKJ3P5YUyt5ZDreS9w7/1NNhM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wGgfutOlnPx5c/HnT2q+PzMHv2jg2HXEo43Y7v2ywXBNJbLEOMfu9Jt+fp+m8pNRt
         /TSc/+702xaFFvLqhiLpeFwYWS6yzD5GGCPdHkI6JdYQg+GvUgyRsFws/FcVTry7z2
         Beogu35zdxMKZd1Ceet3/K9ymAWRopunh3wHVhRSZ0XnSZ3AVcPg4Yqph4XAOnlUi0
         AFhmpNlQLxJJARmbD9AyWQKomgDihtxXI+RLiqFAUBDhPT2S4qME960voLbhFKcWRB
         ul18yUohzxfmQR1/Do4SNk6vDGNce7/P9gzKgtp8FodnPdsswh7ZqMVV705JbMi4G3
         S0l1v4BbOOKDQ==
Subject: Re: [PATCH] media: platform: s5p-mfc: properly assign device to both
 vb2 queues
To:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <CGME20201124084151eucas1p1040de475ecccbe9bff2d6bcac17e000d@eucas1p1.samsung.com>
 <20201124084143.12545-1-m.szyprowski@samsung.com>
 <6e2409df-52f2-54b5-89b3-c9d6587160a4@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <48d0b1e6-293c-79b4-a07c-8730892b3824@xs4all.nl>
Date:   Wed, 2 Dec 2020 09:47:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6e2409df-52f2-54b5-89b3-c9d6587160a4@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFtMELUcEcqeit9zcxZ9qS6+jDRoc85i4fRW55GN30vDI28VRzSAsNAfoGQ8HRd/KrmcXWSkdHb8FGcliKj2v+Daq4WWEAoLKgHCnNKDiuCSY+11kHAA
 Xy5Buou1f70yTcIT3M0hHYx87WiEvRUZZjNhcdmO4VbFoTatbFXnE7WVCB2EbdMgji7+YdaHHyD2wyh+m4Hdoh9WSXXA0PjQagFl0A7h8IUYpITLjT8l9rCz
 rluPh/ptdvmmp5uiZzyqI/tSv4F8uNzp90tMeu7oFTS3ioDpLWLqUof4fDaoTdeWP+JbpWGVo+fwNrSaj0eqYG++uBrHrAXuvAVsZ5c0wg9mrLi/WlucF2a0
 wplgUueOVu8kxeagA5jsIzfZIo9ZPD6Z8XgY2V+N2epiUJemYJk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/11/2020 12:32, Sylwester Nawrocki wrote:
> On 11/24/20 09:41, Marek Szyprowski wrote:
>> Properly set device pointers in videobuf2 queues, so the videobuf2
>> debugging messages will be prefixed with the respective device name.
>>
>> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
>> ---
>> This patch was previously sent as part of "[PATCH v2 0/4] Exynos4 media
>> drivers: adapt for the planned ARM IOMMU-DMA changes" patchset:
>> https://lore.kernel.org/linux-samsung-soc/20200918144833.14618-1-m.szyprowski@samsung.com/
>> The IOMMU related changes are still under review, but this change is
>> unrelated and it makes sense to aplly it separately.
>> ---
>>   drivers/media/platform/s5p-mfc/s5p_mfc.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
>> index eba2b9f040df..4e50c342b322 100644
>> --- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
>> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
>> @@ -844,6 +844,7 @@ static int s5p_mfc_open(struct file *file)
>>   	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>>   	q->drv_priv = &ctx->fh;
>>   	q->lock = &dev->mfc_mutex;
>> +	q->dev = &dev->plat_dev->dev;
> 
> I can't see where q->dev is used for debug logs, shouldn't we use
> v4l2_queue_init_name() instead?

And also you don't need to set q->dev: this driver sets alloc_devs[],
and q->dev is only used if alloc_devs is not set. q->dev should probably
be renamed to alloc_dev since that's what it is used for: the device for
the allocation context.

To help debugging using v4l2_queue_init_name would probably be a better
approach.

Regards,

	Hans
