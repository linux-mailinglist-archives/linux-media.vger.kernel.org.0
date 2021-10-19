Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB3F43365E
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 14:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235683AbhJSM40 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 08:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhJSM40 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 08:56:26 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E76EC06161C
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 05:54:07 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id y3so47740991wrl.1
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 05:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1mvclZulp1jBGRqznG/b0fXQ3yElAWRCQ+ub5281RqY=;
        b=DyFXLhO2hfmcRk4ZOfWcW28zmBfrAPLobYErFlCLG06QAX5ZvNHr/DLxehkTJHu3Jn
         q6NJzPBjIU+CRVyMxKVSbh06aqUkoILHEHA3acN5Wt2YGTz239ZBwtiu6UQMhZE5w6mB
         W/MhXuMU9VOMyTno6gEmYX9r12vkA2fDq6cIlsbChKyf5g2SoWcjwRPkoZnYaCFjw2t9
         m+upfRu68oogpgtE7B0HpUbSds1XYQYJ0qOmXlOubz5sFz2GITTdbL+/g2DH7c6bGF7z
         GK5ctOSWxAH/t3jJiiHJOlG0SsCDj5B5K/BBS0spkO7TT5DwMxNI6zGDXcI58ILa55i8
         HdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1mvclZulp1jBGRqznG/b0fXQ3yElAWRCQ+ub5281RqY=;
        b=NMpEJZdBMU2x6YppRDUXB1CZv9TGbu7s22L2dGAyICLL6ry7Slr62ZFETBSeweouXo
         nXkfDT1X1T4bJb4XiDjzhcvo8zW1A09w+MJaGNGgksOeJDy4XywEswuvacf1OQ6I2oMV
         CAgpYLv8tJf/ClwMPcj7602kzEWDrGoq/V2IFKxxY0gp0p8Con5P6x/9IKyjvaqiIbJU
         299qVT3C9B3I1ze5+0uIrp0TyXHAwGLHYs3W/XdiELtjAQGwNNKxvPgFZiw3LzIqXAYc
         I81ARZ70+rtPlswOXK3uZYOpv2CyqGwaPQFp9ZR5T62xfhlUQ/cQMhehHCr5TZS/G/eK
         NFCg==
X-Gm-Message-State: AOAM533nJ9utEa7Pdu4gMEL+lE/xalEGiDVqQpRX4cyiUHzsgrRbMNnO
        NkvD7ZMc69mwq8T45Wfidqw=
X-Google-Smtp-Source: ABdhPJznqWw6536w7KHmaGxJprPY+w8hHoqj2Re1K7qIk8KLaWxB9z9oathPltY4TElg2E6VG/42Uw==
X-Received: by 2002:a5d:6245:: with SMTP id m5mr44059656wrv.148.1634648046127;
        Tue, 19 Oct 2021 05:54:06 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:f344:748e:38f7:c50? ([2a02:908:1252:fb60:f344:748e:38f7:c50])
        by smtp.gmail.com with ESMTPSA id k10sm15045970wrh.64.2021.10.19.05.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 05:54:05 -0700 (PDT)
Subject: Re: [PATCH 23/28] drm: use new iterator in
 drm_gem_fence_array_add_implicit v3
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        tvrtko.ursulin@linux.intel.com
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-24-christian.koenig@amd.com>
 <YWbrb7xQfTWU15U1@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <71bf3523-7c18-dac7-de53-f7b20e737cc3@gmail.com>
Date:   Tue, 19 Oct 2021 14:54:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWbrb7xQfTWU15U1@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 13.10.21 um 16:21 schrieb Daniel Vetter:
> On Tue, Oct 05, 2021 at 01:37:37PM +0200, Christian König wrote:
>> Simplifying the code a bit.
>>
>> v2: add missing rcu_read_lock()/unlock()
>> v3: switch to locked version
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Please make sure you also apply this to the new copy of this code in
> drm/sched. This one here is up for deletion, once I get all the driver
> conversions I have landed ...

Yeah, I do have that. Only added this patch here for completeness so 
that I could at least consider dropping the old access functions.

Put I will hold it back, just ping me when the code in question is removed.

Christian.

> -Daniel
>
>> ---
>>   drivers/gpu/drm/drm_gem.c | 26 +++++---------------------
>>   1 file changed, 5 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 09c820045859..4dcdec6487bb 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1340,31 +1340,15 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
>>   				     struct drm_gem_object *obj,
>>   				     bool write)
>>   {
>> -	int ret;
>> -	struct dma_fence **fences;
>> -	unsigned int i, fence_count;
>> -
>> -	if (!write) {
>> -		struct dma_fence *fence =
>> -			dma_resv_get_excl_unlocked(obj->resv);
>> -
>> -		return drm_gem_fence_array_add(fence_array, fence);
>> -	}
>> +	struct dma_resv_iter cursor;
>> +	struct dma_fence *fence;
>> +	int ret = 0;
>>   
>> -	ret = dma_resv_get_fences(obj->resv, NULL,
>> -						&fence_count, &fences);
>> -	if (ret || !fence_count)
>> -		return ret;
>> -
>> -	for (i = 0; i < fence_count; i++) {
>> -		ret = drm_gem_fence_array_add(fence_array, fences[i]);
>> +	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
>> +		ret = drm_gem_fence_array_add(fence_array, fence);
>>   		if (ret)
>>   			break;
>>   	}
>> -
>> -	for (; i < fence_count; i++)
>> -		dma_fence_put(fences[i]);
>> -	kfree(fences);
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
>> -- 
>> 2.25.1
>>

