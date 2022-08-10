Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD20558E618
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 06:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbiHJEQZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 00:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbiHJEQX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 00:16:23 -0400
Received: from mail-m11885.qiye.163.com (mail-m11885.qiye.163.com [115.236.118.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E770796A0;
        Tue,  9 Aug 2022 21:16:22 -0700 (PDT)
Received: from [192.168.111.100] (unknown [58.22.7.114])
        by mail-m11885.qiye.163.com (Hmail) with ESMTPA id C437A4C0160;
        Wed, 10 Aug 2022 12:16:18 +0800 (CST)
Message-ID: <05488346-ebbd-b1d9-4094-a83daf65f6db@rock-chips.com>
Date:   Wed, 10 Aug 2022 12:16:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.1
Subject: Re: [Linaro-mm-sig] Re: [PATCH v2] drm/gem: Fix GEM handle release
 errors
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Andy Yan <andy.yan@rock-chips.com>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-media@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>
References: <20220803083237.3701-1-jeffy.chen@rock-chips.com>
 <c7cb225b-7f21-8d9a-773b-efc655e6332c@amd.com>
 <7cd16264-fa84-7b50-f3ed-64f7f22dcef2@rock-chips.com>
 <64bf4e4b-4e22-0ff0-5f92-76f603c04ec0@amd.com>
 <cd806954-e94e-aec8-2b0c-4047da9a92ec@rock-chips.com>
 <0e284f57-e03c-f128-f6e7-52a58edbcd54@amd.com>
 <71e47fe6-440b-e9ea-cd66-8362c41428ca@amd.com>
 <6b3e82f9-6902-fd5c-c67d-e2c42c995133@rock-chips.com>
 <cb478ae3-a6c6-ea90-a47c-13d52b606942@amd.com>
From:   Chen Jeffy <jeffy.chen@rock-chips.com>
In-Reply-To: <cb478ae3-a6c6-ea90-a47c-13d52b606942@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTUIeVh9KT0oaGh0ZHhpLTVUTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NQw6HCo6ET0rMywTAQ0sGhY#
        NB0KCS5VSlVKTU1LSktPQkxCTktIVTMWGhIXVREeHR0CVRgTHhU7CRQYEFYYExILCFUYFBZFWVdZ
        EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFNSUtINwY+
X-HM-Tid: 0a8285f7b2cd2eb9kusnc437a4c0160
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christian,

On 8/9 星期二 18:18, Christian König wrote:
> Hi Jeffy,
> 
> Am 09.08.22 um 12:02 schrieb Chen Jeffy:
>> Hi Christian,
>>
>> On 8/9 星期二 17:08, Christian König wrote:
>>> Hi Jeffy,
>>>
>>> Am 09.08.22 um 09:55 schrieb Christian König:
>>>> [SNIP]
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> So we are allowing GEM object to have multiple handles, and GEM 
>>>>>>> object could have at most one dma-buf, doesn't that means that 
>>>>>>> dma-buf could map to multiple handles?
>>>>>>
>>>>>> No, at least not for the same GEM file private. That's the reason 
>>>>>> why the rb is indexed by the dma_buf object and not the handle.
>>>>>>
>>>>>> In other words the rb is so that you have exactly one handle for 
>>>>>> each dma_buf in each file private.
>>>>>
>>>>> I don't think so, because if user get multiple handles for the same 
>>>>> GEM obj and use drm_gem_prime_handle_to_fd() for those handles
>>>>
>>>> Mhm, that works? This is illegal and should have been prevented 
>>>> somehow.
>>>
>>> At least I see the problem now. I'm just not sure how to fix it.
>>>
>>> Your v2 patch indeed prevents leakage of the drm_prime_member for the 
>>> additional handles, but those shouldn't have been added in the first 
>>> place.
>>>
>>> The issue is that with this we make it unpredictable which handle is 
>>> returned. E.g. if we have handle 2,5,7 it can be that because of 
>>> re-balancing the tree sometimes 2 and sometimes 5 is returned.
>>
>> Maybe cache the latest returned handle in the obj(after 
>> drm_gem_prime_fd_to_handle), and clear it when that handle been 
>> deleted in drm_gem_handle_delete()?
> 
> That won't work. The handle is per fpriv, but the same object is used by 
> multiple fpriv instances. >
> What we could maybe do is to prevent adding multiple lockup structures 
> when there is already one, but that's not something I can easily judge.

So maybe we need to protect that unique lookup structure been deleted 
before deleting the last handle, and make the handle unique for GEM obj, 
in case of that unique lookup's handle been deleted earlier that others?

How about adding a GEM obj rbtree too, and make drm_prime_member kref-ed?

So the 
drm_prime_add_buf_handle/drm_gem_handle_create_tail/drm_gem_handle_delete 
would be looking up drm_prime_member by GEM obj, then update dmabuf rb 
and inc/dec drm_prime_member's kref, 
drm_gem_prime_fd_to_handle/drm_gem_prime_handle_to_fd remain unchanged.

> 
> Daniel seems to be either very busy or on vacation otherwise he would 
> have chimed in by now.
> 
> Anyway, your patch seems to at least fix the of hand memory leak, so 
> feel free to add my rb to the v2 and push it to drm-misc-fixes for now.
> 
> Thanks,
> Christian.
> 
>>
>>
>> Something like:
>> drm_gem_prime_fd_to_handle
>>   handle = drm_prime_lookup_buf_handle(buf)
>>   obj = obj_from_handle(handle)
>>   if !obj->primary_handle
>>     obj->primary_handle = handle
>>   return obj->primary_handle
>>
>> Or maybe limit GEM obj with a single lifetime handle?
>>
>>>
>>> That's not really a good idea and breaks a couple of assumptions as 
>>> far as I know.
>>>
>>> Ideas?
>>>
>>> Thanks,
>>> Christian.
>>>
>>
> 
> 

