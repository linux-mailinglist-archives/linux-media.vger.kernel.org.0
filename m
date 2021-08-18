Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED253F0822
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 17:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239584AbhHRPhz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 11:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237598AbhHRPhy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 11:37:54 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5449FC061764;
        Wed, 18 Aug 2021 08:37:19 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id om1-20020a17090b3a8100b0017941c44ce4so9118581pjb.3;
        Wed, 18 Aug 2021 08:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=hf+PYnU598KTcaGn+kaY/aSf215EGIiFQvdsiOz+iNE=;
        b=CRReCz8U1P4Vv/4YGcZ1yXzH+D47/TB1oHO0dVMmc5eJZFDAPmpymyNAEiBN5WDZyc
         NLB4xpGh5K2xs7hcYiNjXy3kjkwe/wYIu7m7c06ELfE/fUF4dPSfnhpowkVFnHyQlWLe
         jn1hD7cIAUnNAa+AkHUsJzHIX72hvs0va83jAGwW3SZgKxi1D7Xzfl2g00lA7Xl0Q7kV
         NYVYOxslSek9f4SQTMl4vz0gLls1vYwbRtdDkLY2IkRxn574O3FUUO1DaoL+MnK8iWvX
         JcfR0P72LfOlmhcDM5BzprPbafaZjAMdVEZYmXUjP2ieYuwkmxm+vmnOvdonssKqlW+q
         ujqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hf+PYnU598KTcaGn+kaY/aSf215EGIiFQvdsiOz+iNE=;
        b=RKgEeelXNJhaH9rJLDTZXzfUhqZ1W1EZXEigzb9pv+XDBgPV46nNwygJqPFgATETTX
         ma9aTvMD93Pj4sPsUHAxQwToQwMYZC1oe08eFhbt4O/NohN2AuyzPjhmtufFhL22sLBi
         fpn5Yppd1a/mKasFmIAJeRG4Ji776nRAES1ewpdRa7IomYUSWFDB1GoNJ9Zv/iH7ukDf
         eVo2lkgxTb3M/kDZBZG3XyBUOWF3hNIE6vFIiPndoji3jtqRR3Bwk+B7tjvzAnE5dwI4
         +JY+o2VU+EGQQHs14OEbMVxjn01Ksr+QnraS02NlyH+wfH6dSIPvH2Qcy3tmhrfy5hhh
         maFg==
X-Gm-Message-State: AOAM5323SkBtQ7FpipJ4JXvXAph/iIFtzjZnR2uapwF7CX57i2GZKBH3
        w0C9hIpjCjt0hZoXHZCZS5c=
X-Google-Smtp-Source: ABdhPJxnOCxmhvFCsrLoYA3U+x8QTr55RHKLH9kbAlQwE+cwDJdAHyVY/t70CXCisMkBQjAYex3AVQ==
X-Received: by 2002:a17:90a:2b89:: with SMTP id u9mr9961429pjd.116.1629301038807;
        Wed, 18 Aug 2021 08:37:18 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id c15sm223676pjr.22.2021.08.18.08.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 08:37:18 -0700 (PDT)
Subject: Re: [PATCH v3 4/9] drm: fix potential null ptr dereferences in
 drm_{auth,ioctl}
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
 <20210818073824.1560124-5-desmondcheongzx@gmail.com>
 <YRzcuiQrLFsWowas@phenom.ffwll.local>
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <53a63ac8-f2de-91f7-4e0f-20b0f3f61d52@gmail.com>
Date:   Wed, 18 Aug 2021 23:37:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRzcuiQrLFsWowas@phenom.ffwll.local>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/8/21 6:11 pm, Daniel Vetter wrote:
> On Wed, Aug 18, 2021 at 03:38:19PM +0800, Desmond Cheong Zhi Xi wrote:
>> There are three areas where we dereference struct drm_master without
>> checking if the pointer is non-NULL.
>>
>> 1. drm_getmagic is called from the ioctl_handler. Since
>> DRM_IOCTL_GET_MAGIC has no ioctl flags, drm_getmagic is run without
>> any check that drm_file.master has been set.
>>
>> 2. Similarly, drm_getunique is called from the ioctl_handler, but
>> DRM_IOCTL_GET_UNIQUE has no ioctl flags. So there is no guarantee that
>> drm_file.master has been set.
> 
> I think the above two are impossible, due to the refcounting rules for
> struct file.
> 

Right, will drop those two parts from the patch.

>> 3. drm_master_release can also be called without having a
>> drm_file.master set. Here is one error path:
>>    drm_open():
>>      drm_open_helper():
>>        drm_master_open():
>>          drm_new_set_master(); <--- returns -ENOMEM,
>>                                     drm_file.master not set
>>        drm_file_free():
>>          drm_master_release(); <--- NULL ptr dereference
>>                                     (file_priv->master->magic_map)
>>
>> Fix these by checking if the master pointers are NULL before use.
>>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
>>   drivers/gpu/drm/drm_auth.c  | 16 ++++++++++++++--
>>   drivers/gpu/drm/drm_ioctl.c |  5 +++++
>>   2 files changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>> index f9267b21556e..b7230604496b 100644
>> --- a/drivers/gpu/drm/drm_auth.c
>> +++ b/drivers/gpu/drm/drm_auth.c
>> @@ -95,11 +95,18 @@ EXPORT_SYMBOL(drm_is_current_master);
>>   int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
>>   {
>>   	struct drm_auth *auth = data;
>> +	struct drm_master *master;
>>   	int ret = 0;
>>   
>>   	mutex_lock(&dev->master_mutex);
>> +	master = file_priv->master;
>> +	if (!master) {
>> +		mutex_unlock(&dev->master_mutex);
>> +		return -EINVAL;
>> +	}
>> +
>>   	if (!file_priv->magic) {
>> -		ret = idr_alloc(&file_priv->master->magic_map, file_priv,
>> +		ret = idr_alloc(&master->magic_map, file_priv,
>>   				1, 0, GFP_KERNEL);
>>   		if (ret >= 0)
>>   			file_priv->magic = ret;
>> @@ -355,8 +362,12 @@ void drm_master_release(struct drm_file *file_priv)
>>   
>>   	mutex_lock(&dev->master_mutex);
>>   	master = file_priv->master;
>> +
>> +	if (!master)
>> +		goto unlock;
> 
> This is a bit convoluted, since we're in the single-threaded release path
> we don't need any locking for file_priv related things. Therefore we can
> pull the master check out and just directly return.
> 
> But since it's a bit surprising maybe a comment that this can happen when
> drm_master_open in drm_open_helper fails?
> 

Sounds good. This can actually also happen in the failure path of 
mock_drm_getfile if anon_inode_getfile fails. I'll leave a short note 
about both of them.

> Another option, and maybe cleaner, would be to move the drm_master_release
> from drm_file_free into drm_close_helper. That would be fully symmetrical
> and should also fix the bug here?
> -Daniel
> 
Hmmm maybe the first option to move the check out of the lock might be 
better. If I'm not wrong, we would otherwise also need to move 
drm_master_release into drm_client_close.

> 
>> +
>>   	if (file_priv->magic)
>> -		idr_remove(&file_priv->master->magic_map, file_priv->magic);
>> +		idr_remove(&master->magic_map, file_priv->magic);
>>   
>>   	if (!drm_is_current_master_locked(file_priv))
>>   		goto out;
>> @@ -379,6 +390,7 @@ void drm_master_release(struct drm_file *file_priv)
>>   		drm_master_put(&file_priv->master);
>>   		spin_unlock(&dev->master_lookup_lock);
>>   	}
>> +unlock:
>>   	mutex_unlock(&dev->master_mutex);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>> index 26f3a9ede8fe..4d029d3061d9 100644
>> --- a/drivers/gpu/drm/drm_ioctl.c
>> +++ b/drivers/gpu/drm/drm_ioctl.c
>> @@ -121,6 +121,11 @@ int drm_getunique(struct drm_device *dev, void *data,
>>   
>>   	mutex_lock(&dev->master_mutex);
>>   	master = file_priv->master;
>> +	if (!master) {
>> +		mutex_unlock(&dev->master_mutex);
>> +		return -EINVAL;
>> +	}
>> +
>>   	if (u->unique_len >= master->unique_len) {
>>   		if (copy_to_user(u->unique, master->unique, master->unique_len)) {
>>   			mutex_unlock(&dev->master_mutex);
>> -- 
>> 2.25.1
>>
> 

