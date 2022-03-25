Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B77B4E7160
	for <lists+linux-media@lfdr.de>; Fri, 25 Mar 2022 11:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358917AbiCYKh2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Mar 2022 06:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244163AbiCYKh1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Mar 2022 06:37:27 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45371CC50B
        for <linux-media@vger.kernel.org>; Fri, 25 Mar 2022 03:35:53 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id u3so10284834wrg.3
        for <linux-media@vger.kernel.org>; Fri, 25 Mar 2022 03:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ThCn4geoMQpek8GKLLNmlyOOuxTDTdSXDAlHwQ0HQVE=;
        b=GBh57jXalMTHH94OB9bzOcNJ6Y/X36mSlqs877c2rbFIiOrAWEUIKu/t0pESO7o12K
         /AJRWqTCVRN7J98RqXLO+CakfvHcLMCzgLZG92GufthQiLkhwfJNMFSpG7celHBpgsQm
         xsBf4K9RR9Z3EFz6KvDNGkF4xxH2ClDXOd/lqGzy7qscGW0SRn4l7LRLIpWvmmHVT17T
         9GV4QH1fC5adSey1atHbkav6FCorrEUo46Tf9QQQDTwUnU8sHNy2arW5yIm8Ch4jF7Dt
         Z73rIcQnigyLjh61j+Sv03qSC8TtfUI/zNXfPNJ93AYtSgk4CFZTHzyDFswnSMqQpzmH
         4p/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ThCn4geoMQpek8GKLLNmlyOOuxTDTdSXDAlHwQ0HQVE=;
        b=z12hM/B87M9y/yga7+vgdav/8cYbfzQgIxS9nj9dDSxbtISDTvwNwn0CdmyFcgeLq6
         ucdt+ngfAjBehy7FZj4s9TkpCDwr8JxYmHpg0wB9OqmY5D2tEJWdyia6t/ruI4A4zK/B
         03Iga9GyL3stWNCeJ71HicAY9sOcLC3q/5YI65Ofh57gGGxFesZiQ0gkUQvWoi9vXTi1
         Edel/w+B7E3PX3vGKxhy9Y50xic6svJ95yatP25Pug95T7GYBYDkq2taOvts6sw3DQFE
         9EERAcbNJ0uSu5OctrJLGGdyFkS7OeLxBnrBlB1CpnmO0V/l8MlMnznrPbZ7oyjG1jnT
         m9fQ==
X-Gm-Message-State: AOAM530iWC1mpmX6BHCpNW8tuprkQdUuzdxXy3rhIPVY5Fg1GD0JkxIp
        WCLldh36fGwJ8aPij3sTIJ0=
X-Google-Smtp-Source: ABdhPJwAZGav1tycxkaAeI7AfFLYlKNTlXB8P2mqAkTa1/mPDnRCy7oZNj18kE2uCXyXXP+M306Xzw==
X-Received: by 2002:a05:6000:18a7:b0:204:1bc0:45a with SMTP id b7-20020a05600018a700b002041bc0045amr8402695wri.119.1648204551671;
        Fri, 25 Mar 2022 03:35:51 -0700 (PDT)
Received: from [192.168.178.21] (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c12c800b0038cc2b67c97sm3857980wmd.19.2022.03.25.03.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Mar 2022 03:35:51 -0700 (PDT)
Message-ID: <854a68de-2b35-df79-75bf-f13d7a67136f@gmail.com>
Date:   Fri, 25 Mar 2022 11:35:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] dma-buf/sync-file: fix warning about fence containers
Content-Language: en-US
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     sumit.semwal@linaro.org, gustavo@padovan.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220311110244.1245-1-christian.koenig@amd.com>
 <20220311110244.1245-2-christian.koenig@amd.com>
 <Yj2VvjGUJl8kCS8H@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Yj2VvjGUJl8kCS8H@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 25.03.22 um 11:13 schrieb Daniel Vetter:
> On Fri, Mar 11, 2022 at 12:02:44PM +0100, Christian König wrote:
>> The dma_fence_chain containers can show up in sync_files as well resulting in
>> warnings that those can't be added to dma_fence_array containers when merging
>> multiple sync_files together.
>>
>> Solve this by using the dma_fence_unwrap iterator to deep dive into the
>> contained fences and then add those flatten out into a dma_fence_array.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> I have no idea why we try to keep fences sorted, but oh well it looks like
> the merging is done correctly.

To be honest I don't fully know either.

Keeping the array sorted by context allows to merge it without adding 
duplicates, but adding duplicates is not an extra overhead to begin with 
because we always allocate memory for the worst case anyway.

Just keeping it around for now.

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks,
Christian.

>
>> ---
>>   drivers/dma-buf/sync_file.c | 141 +++++++++++++++++++-----------------
>>   1 file changed, 73 insertions(+), 68 deletions(-)
>>
>> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
>> index 394e6e1e9686..b8dea4ec123b 100644
>> --- a/drivers/dma-buf/sync_file.c
>> +++ b/drivers/dma-buf/sync_file.c
>> @@ -5,6 +5,7 @@
>>    * Copyright (C) 2012 Google, Inc.
>>    */
>>   
>> +#include <linux/dma-fence-unwrap.h>
>>   #include <linux/export.h>
>>   #include <linux/file.h>
>>   #include <linux/fs.h>
>> @@ -172,20 +173,6 @@ static int sync_file_set_fence(struct sync_file *sync_file,
>>   	return 0;
>>   }
>>   
>> -static struct dma_fence **get_fences(struct sync_file *sync_file,
>> -				     int *num_fences)
>> -{
>> -	if (dma_fence_is_array(sync_file->fence)) {
>> -		struct dma_fence_array *array = to_dma_fence_array(sync_file->fence);
>> -
>> -		*num_fences = array->num_fences;
>> -		return array->fences;
>> -	}
>> -
>> -	*num_fences = 1;
>> -	return &sync_file->fence;
>> -}
>> -
>>   static void add_fence(struct dma_fence **fences,
>>   		      int *i, struct dma_fence *fence)
>>   {
>> @@ -210,86 +197,97 @@ static void add_fence(struct dma_fence **fences,
>>   static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>>   					 struct sync_file *b)
>>   {
>> +	struct dma_fence *a_fence, *b_fence, **fences;
>> +	struct dma_fence_unwrap a_iter, b_iter;
>> +	unsigned int index, num_fences;
>>   	struct sync_file *sync_file;
>> -	struct dma_fence **fences = NULL, **nfences, **a_fences, **b_fences;
>> -	int i = 0, i_a, i_b, num_fences, a_num_fences, b_num_fences;
>>   
>>   	sync_file = sync_file_alloc();
>>   	if (!sync_file)
>>   		return NULL;
>>   
>> -	a_fences = get_fences(a, &a_num_fences);
>> -	b_fences = get_fences(b, &b_num_fences);
>> -	if (a_num_fences > INT_MAX - b_num_fences)
>> -		goto err;
>> +	num_fences = 0;
>> +	dma_fence_unwrap_for_each(a_fence, &a_iter, a->fence)
>> +		++num_fences;
>> +	dma_fence_unwrap_for_each(b_fence, &b_iter, b->fence)
>> +		++num_fences;
>>   
>> -	num_fences = a_num_fences + b_num_fences;
>> +	if (num_fences > INT_MAX)
>> +		goto err_free_sync_file;
>>   
>>   	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
>>   	if (!fences)
>> -		goto err;
>> +		goto err_free_sync_file;
>>   
>>   	/*
>> -	 * Assume sync_file a and b are both ordered and have no
>> -	 * duplicates with the same context.
>> +	 * We can't guarantee that fences in both a and b are ordered, but it is
>> +	 * still quite likely.
>>   	 *
>> -	 * If a sync_file can only be created with sync_file_merge
>> -	 * and sync_file_create, this is a reasonable assumption.
>> +	 * So attempt to order the fences as we pass over them and merge fences
>> +	 * with the same context.
>>   	 */
>> -	for (i_a = i_b = 0; i_a < a_num_fences && i_b < b_num_fences; ) {
>> -		struct dma_fence *pt_a = a_fences[i_a];
>> -		struct dma_fence *pt_b = b_fences[i_b];
>>   
>> -		if (pt_a->context < pt_b->context) {
>> -			add_fence(fences, &i, pt_a);
>> +	index = 0;
>> +	for (a_fence = dma_fence_unwrap_first(a->fence, &a_iter),
>> +	     b_fence = dma_fence_unwrap_first(b->fence, &b_iter);
>> +	     a_fence || b_fence; ) {
>> +
>> +		if (!b_fence) {
>> +			add_fence(fences, &index, a_fence);
>> +			a_fence = dma_fence_unwrap_next(&a_iter);
>> +
>> +		} else if (!a_fence) {
>> +			add_fence(fences, &index, b_fence);
>> +			b_fence = dma_fence_unwrap_next(&b_iter);
>> +
>> +		} else if (a_fence->context < b_fence->context) {
>> +			add_fence(fences, &index, a_fence);
>> +			a_fence = dma_fence_unwrap_next(&a_iter);
>>   
>> -			i_a++;
>> -		} else if (pt_a->context > pt_b->context) {
>> -			add_fence(fences, &i, pt_b);
>> +		} else if (b_fence->context < a_fence->context) {
>> +			add_fence(fences, &index, b_fence);
>> +			b_fence = dma_fence_unwrap_next(&b_iter);
>> +
>> +		} else if (__dma_fence_is_later(a_fence->seqno, b_fence->seqno,
>> +						a_fence->ops)) {
>> +			add_fence(fences, &index, a_fence);
>> +			a_fence = dma_fence_unwrap_next(&a_iter);
>> +			b_fence = dma_fence_unwrap_next(&b_iter);
>>   
>> -			i_b++;
>>   		} else {
>> -			if (__dma_fence_is_later(pt_a->seqno, pt_b->seqno,
>> -						 pt_a->ops))
>> -				add_fence(fences, &i, pt_a);
>> -			else
>> -				add_fence(fences, &i, pt_b);
>> -
>> -			i_a++;
>> -			i_b++;
>> +			add_fence(fences, &index, b_fence);
>> +			a_fence = dma_fence_unwrap_next(&a_iter);
>> +			b_fence = dma_fence_unwrap_next(&b_iter);
>>   		}
>>   	}
>>   
>> -	for (; i_a < a_num_fences; i_a++)
>> -		add_fence(fences, &i, a_fences[i_a]);
>> -
>> -	for (; i_b < b_num_fences; i_b++)
>> -		add_fence(fences, &i, b_fences[i_b]);
>> -
>> -	if (i == 0)
>> -		fences[i++] = dma_fence_get(a_fences[0]);
>> +	if (index == 0)
>> +		add_fence(fences, &index, dma_fence_get_stub());
>>   
>> -	if (num_fences > i) {
>> -		nfences = krealloc_array(fences, i, sizeof(*fences), GFP_KERNEL);
>> -		if (!nfences)
>> -			goto err;
>> +	if (num_fences > index) {
>> +		struct dma_fence **tmp;
>>   
>> -		fences = nfences;
>> +		/* Keep going even when reducing the size failed */
>> +		tmp = krealloc_array(fences, index, sizeof(*fences),
>> +				     GFP_KERNEL);
>> +		if (tmp)
>> +			fences = tmp;
>>   	}
>>   
>> -	if (sync_file_set_fence(sync_file, fences, i) < 0)
>> -		goto err;
>> +	if (sync_file_set_fence(sync_file, fences, index) < 0)
>> +		goto err_put_fences;
>>   
>>   	strlcpy(sync_file->user_name, name, sizeof(sync_file->user_name));
>>   	return sync_file;
>>   
>> -err:
>> -	while (i)
>> -		dma_fence_put(fences[--i]);
>> +err_put_fences:
>> +	while (index)
>> +		dma_fence_put(fences[--index]);
>>   	kfree(fences);
>> +
>> +err_free_sync_file:
>>   	fput(sync_file->file);
>>   	return NULL;
>> -
>>   }
>>   
>>   static int sync_file_release(struct inode *inode, struct file *file)
>> @@ -398,11 +396,13 @@ static int sync_fill_fence_info(struct dma_fence *fence,
>>   static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
>>   				       unsigned long arg)
>>   {
>> -	struct sync_file_info info;
>>   	struct sync_fence_info *fence_info = NULL;
>> -	struct dma_fence **fences;
>> +	struct dma_fence_unwrap iter;
>> +	struct sync_file_info info;
>> +	unsigned int num_fences;
>> +	struct dma_fence *fence;
>> +	int ret;
>>   	__u32 size;
>> -	int num_fences, ret, i;
>>   
>>   	if (copy_from_user(&info, (void __user *)arg, sizeof(info)))
>>   		return -EFAULT;
>> @@ -410,7 +410,9 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
>>   	if (info.flags || info.pad)
>>   		return -EINVAL;
>>   
>> -	fences = get_fences(sync_file, &num_fences);
>> +	num_fences = 0;
>> +	dma_fence_unwrap_for_each(fence, &iter, sync_file->fence)
>> +		++num_fences;
>>   
>>   	/*
>>   	 * Passing num_fences = 0 means that userspace doesn't want to
>> @@ -433,8 +435,11 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
>>   	if (!fence_info)
>>   		return -ENOMEM;
>>   
>> -	for (i = 0; i < num_fences; i++) {
>> -		int status = sync_fill_fence_info(fences[i], &fence_info[i]);
>> +	num_fences = 0;
>> +	dma_fence_unwrap_for_each(fence, &iter, sync_file->fence) {
>> +		int status;
>> +
>> +		status = sync_fill_fence_info(fence, &fence_info[num_fences++]);
>>   		info.status = info.status <= 0 ? info.status : status;
>>   	}
>>   
>> -- 
>> 2.25.1
>>

