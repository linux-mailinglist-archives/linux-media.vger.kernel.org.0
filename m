Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B662783C1
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 11:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbgIYJQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 05:16:35 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:53314 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726990AbgIYJQd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 05:16:33 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 4D6F5F6C3A9ABBF6838A;
        Fri, 25 Sep 2020 17:16:30 +0800 (CST)
Received: from [127.0.0.1] (10.57.60.129) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Fri, 25 Sep 2020
 17:16:19 +0800
Subject: Re: [PATCH] drm/vc4: Deleted the drm_device declaration
To:     Tian Tao <tiantao6@hisilicon.com>, <eric@anholt.net>,
        <airlied@linux.ie>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linaro-mm-sig@lists.linaro.org>
References: <1601023898-29886-1-git-send-email-tiantao6@hisilicon.com>
 <20200925091023.GE438822@phenom.ffwll.local>
From:   "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <ca931d2e-c445-a14a-cb40-a7d3f5c190e2@huawei.com>
Date:   Fri, 25 Sep 2020 17:16:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200925091023.GE438822@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.57.60.129]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi :
I alwaygs used scripts/get_maintainers.pl to get the recipient list.I 
don't know why miss maintainers for a given piece of code.

tiantao@ubuntu:~$ git send-email -to eric@anholt.net -to 
airlied@linux.ie -to daniel@ffwll.ch -to sumit.semwal@linaro.org -to 
christian.koenig@amd.com -to dri-devel@lists.freedesktop.org -to 
linux-kernel@vger.kernel.org -to linux-media@vger.kernel.org -to 
linaro-mm-sig@lists.linaro.org 
mailline/drm/drm/0001-drm-vc4-Deleted-the-drm_device-declaration.patch 
--suppress-cc=all
mailline/drm/drm/0001-drm-vc4-Deleted-the-drm_device-declaration.patch

tiantao@ubuntu:~/mailline/drm/drm$ vim drivers/gpu/drm/vc4/vc4_drv.h^C
tiantao@ubuntu:~/mailline/drm/drm$ ./scripts/get_maintainer.pl 
drivers/gpu/drm/vc4/vc4_drv.h
Eric Anholt <eric@anholt.net> (supporter:DRM DRIVERS FOR VC4)
David Airlie <airlied@linux.ie> (maintainer:DRM DRIVERS)
Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
Sumit Semwal <sumit.semwal@linaro.org> (maintainer:DMA BUFFER SHARING 
FRAMEWORK)
"Christian König" <christian.koenig@amd.com> (maintainer:DMA BUFFER 
SHARING FRAMEWORK)
dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
linux-kernel@vger.kernel.org (open list)
linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK)
linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK)


在 2020/9/25 17:10, Daniel Vetter 写道:
> On Fri, Sep 25, 2020 at 04:51:38PM +0800, Tian Tao wrote:
>> drm_modeset_lock.h already declares struct drm_device, so there's no
>> need to declare it in vc4_drv.h
>>
>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> 
> Just an aside, when submitting patches please use
> scripts/get_maintainers.pl to generate the recipient list. Looking through
> past few patches from you it seems fairly arbitrary and often misses the
> actual maintainers for a given piece of code, which increases the odds the
> patch will get lost a lot.
> 
> E.g. for this one I'm only like the 5th or so fallback person, and the
> main maintainer isn't on the recipient list.
> 
> Cheeers, Daniel
> 
>> ---
>>   drivers/gpu/drm/vc4/vc4_drv.h | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
>> index 8c8d96b..8717a1c 100644
>> --- a/drivers/gpu/drm/vc4/vc4_drv.h
>> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
>> @@ -19,7 +19,6 @@
>>   
>>   #include "uapi/drm/vc4_drm.h"
>>   
>> -struct drm_device;
>>   struct drm_gem_object;
>>   
>>   /* Don't forget to update vc4_bo.c: bo_type_names[] when adding to
>> -- 
>> 2.7.4
>>
> 

