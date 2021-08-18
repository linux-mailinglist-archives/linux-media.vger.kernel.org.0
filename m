Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65DA13F070F
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239235AbhHROuo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239019AbhHROun (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:50:43 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42904C061764;
        Wed, 18 Aug 2021 07:50:09 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id u1so1981169plr.1;
        Wed, 18 Aug 2021 07:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=6Uh8FBGFVJ1JdTCeddx1mUTf33ZOu2+YFROQAiC4wXw=;
        b=FvxDgvbsWlWgiHHfo1cKELhnM2uSeTuVKkYL2a8NcwGFJLwbeRWzgzRHZ8LWuG5NXb
         VBDbxFm+4D48ZsM+JzqFGDXsR8/MRg7RcLNCTLAb/qRBj0LrTjF+EoGTNZ/5UDl0VIDs
         yi4RDyhBIfbtt4V0QSVU8m8PekoGAmb/y6FaL5QMxUynMoAF/3DGPMkYnvRX6SgglbFZ
         mawgbJD1NySe74n5M2h+iekGuME65Y14JCyXEVYJd5jWsZfD64RfyzT5lmyWIQiHuHpx
         6qgGkSn19WksDxegdxPDTs/Iv798MUgIt59ehxFNZZl8bO57ZUqixbljydZbbWhvJK47
         ZaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6Uh8FBGFVJ1JdTCeddx1mUTf33ZOu2+YFROQAiC4wXw=;
        b=LmVKhYuw9xSJWpUQgC/8mumtYGtfOFQlkrShH9+iZG7u73DDawAe8U5lhFCeeLVter
         mHfB0v5pYsgM80+0tfOv0YTbGJu3xQ0U8Jm07mzrZH0NICCVxcIRnac8/12d/LCW0mTQ
         oetPHAMGM7YVIt9KwnX7xFl/gD2aWKjhSH58eAWA0JNWHYrmJvdX5UZ9EERxQMs7WsQR
         dpT6f27CZyIFKBM08x8rjDaDMyaRQo58llP0n2QWsr6BJYPWe5uvPU4W/mtXiB6KTJR/
         /azLhOxiFGelmkvcoI/Fru6/ZgzTpdpZmcqvCysLnfJvK9Mh7pu0HNE+gqDoRQjrjy8J
         FTSA==
X-Gm-Message-State: AOAM531PNLpwqCQ1+ewaFJntYf6e98FRmOjzdADvEzj/sOM9E271mME0
        PTT537Usl6antXQsh3mDWSU=
X-Google-Smtp-Source: ABdhPJwK6zZDS5MxiSPQQly8zibq21bpqwtpHyPoIGe12pbxG6FIcKasukxZTM8/HiLQS9uS1RYPEQ==
X-Received: by 2002:a17:90b:3784:: with SMTP id mz4mr9897189pjb.127.1629298208817;
        Wed, 18 Aug 2021 07:50:08 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id 64sm6780126pfy.114.2021.08.18.07.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 07:50:08 -0700 (PDT)
Subject: Re: [PATCH v3 2/9] drm: hold master_lookup_lock when releasing a
 drm_file's master
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
        christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
        tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-3-desmondcheongzx@gmail.com>
 <YRzbTUM8ggXlIEyr@phenom.ffwll.local>
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <a69a6870-18fe-5bbc-074e-871753a8f593@gmail.com>
Date:   Wed, 18 Aug 2021 22:50:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRzbTUM8ggXlIEyr@phenom.ffwll.local>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/8/21 6:05 pm, Daniel Vetter wrote:
> On Wed, Aug 18, 2021 at 03:38:17PM +0800, Desmond Cheong Zhi Xi wrote:
>> When drm_file.master changes value, the corresponding
>> drm_device.master_lookup_lock should be held.
>>
>> In drm_master_release, a call to drm_master_put sets the
>> file_priv->master to NULL, so we protect this section with
>> drm_device.master_lookup_lock.
>>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> 
> At this points all refcounts to drm_file have disappeared, so yeah this is
> a lockless access, but also no one can observe it anymore. See also next
> patch.
> 
> Hence I think the current code is fine.
> -Daniel
> 

Ah ok got it, I didn't realize that. I'll drop patch 2 and 3 from the 
series then.

>> ---
>>   drivers/gpu/drm/drm_auth.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>> index 8efb58aa7d95..8c0e0dba1611 100644
>> --- a/drivers/gpu/drm/drm_auth.c
>> +++ b/drivers/gpu/drm/drm_auth.c
>> @@ -373,8 +373,11 @@ void drm_master_release(struct drm_file *file_priv)
>>   	}
>>   
>>   	/* drop the master reference held by the file priv */
>> -	if (file_priv->master)
>> +	if (file_priv->master) {
>> +		spin_lock(&dev->master_lookup_lock);
>>   		drm_master_put(&file_priv->master);
>> +		spin_unlock(&dev->master_lookup_lock);
>> +	}
>>   	mutex_unlock(&dev->master_mutex);
>>   }
>>   
>> -- 
>> 2.25.1
>>
> 

