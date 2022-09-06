Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 649D45AE535
	for <lists+linux-media@lfdr.de>; Tue,  6 Sep 2022 12:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239161AbiIFKVC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Sep 2022 06:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239162AbiIFKVB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Sep 2022 06:21:01 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACEDC5E555;
        Tue,  6 Sep 2022 03:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662459658; x=1693995658;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=CADQZNK7sh3ishR6VlRXnxfJnl5BQfip+USboN2REBU=;
  b=n8ZYU+fZBJbSjWMgLyo6gGgKPfFl3tLcsN2g55Tjr8ZG9FNN2yJNEkyu
   m8xqm/3OoVNsoY7aMhJLSPz666g+iMcLhMZv5hiKT5LIWmlE4nCK5KZMF
   Q8wBn/+zV1yHb3G1/8WjAOIPyRf5AATNHzR43P2U+KadOCv1PTDEzD5PI
   xxEQIhxPouOXyOfzRX1Rqhs3pjoYnqWmgkEzgi5Yi7ObOeeHBNbNIV36G
   stZcXfa49jpgrycrACuDGL5KszhbfzUecjrbH5tMQrbdx3P+wsmLr4tbk
   NMdI8w8dHWpi5GVAq04b82RdLKEbhAoP5skbyjwhNVW+K28KaZNu7pAdq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="360507050"
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; 
   d="scan'208";a="360507050"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 03:20:57 -0700
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; 
   d="scan'208";a="644115071"
Received: from holmesda-mobl.ger.corp.intel.com (HELO [10.213.204.21]) ([10.213.204.21])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 03:20:53 -0700
Message-ID: <ec41b299-4280-d8e4-7ab0-23b5ea6ad401@linux.intel.com>
Date:   Tue, 6 Sep 2022 11:20:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 4/4] dma-buf: Check status of enable-signaling bit on
 debug
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
        shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
        Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220905163502.4032-1-Arvind.Yadav@amd.com>
 <20220905163502.4032-5-Arvind.Yadav@amd.com>
 <f2e1367f-b056-b2af-365c-8ae4ef03f008@amd.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <f2e1367f-b056-b2af-365c-8ae4ef03f008@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 06/09/2022 09:39, Christian König wrote:
> Am 05.09.22 um 18:35 schrieb Arvind Yadav:
>> The core DMA-buf framework needs to enable signaling
>> before the fence is signaled. The core DMA-buf framework
>> can forget to enable signaling before the fence is signaled.
> 
> This sentence is a bit confusing. I'm not a native speaker of English 
> either, but I suggest something like:
> 
> "Fence signaling must be enable to make sure that the 
> dma_fence_is_signaled() function ever returns true."
> 
>> To avoid this scenario on the debug kernel, check the
>> DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT status bit before checking
>> the signaling bit status to confirm that enable_signaling
>> is enabled.
> 
> This describes the implementation, but we should rather describe the 
> background of the change. The implementation should be obvious. 
> Something like this maybe:
> 
> "
> Since drivers and implementations sometimes mess this up enforce correct 
> behavior when DEBUG_WW_MUTEX_SLOWPATH is used during debugging.
> 
> This should make any implementations bugs resulting in not signaled 
> fences much more obvious.
> "

I think I follow the idea but am not sure coupling (well "coupling".. not really, but cross-contaminating in a way) dma-fence.c with a foreign and effectively unrelated concept of a ww mutex is the best way.

Instead, how about a dma-buf specific debug kconfig option?

Condition would then be, according to my understanding of the rules and expectations, along the lines of:

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 775cdc0b4f24..147a9df2c9d0 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -428,6 +428,17 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
  static inline bool
  dma_fence_is_signaled(struct dma_fence *fence)
  {
+#ifdef CONFIG_DEBUG_DMAFENCE
+       /*
+        * Implementations not providing the enable_signaling callback are
+        * required to always have signaling enabled or fences are not
+        * guaranteed to ever signal.
+        */
+       if (!fence->ops->enable_signaling &&
+           !test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
+               return false;
+#endif
+
         if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
                 return true;

Thoughts?

Regards,

Tvrtko

> 
>>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> 
> With the improved commit message this patch is Reviewed-by: Christian 
> König <christian.koenig@amd.com>
> 
> Regards,
> Christian.
> 
>> ---
>>
>> Changes in v1 :
>> 1- Addressing Christian's comment to replace
>> CONFIG_DEBUG_WW_MUTEX_SLOWPATH instead of CONFIG_DEBUG_FS.
>> 2- As per Christian's comment moving this patch at last so
>> The version of this patch is also changed and previously
>> it was [PATCH 1/4]
>>
>>
>> ---
>>   include/linux/dma-fence.h | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 775cdc0b4f24..ba1ddc14c5d4 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -428,6 +428,11 @@ dma_fence_is_signaled_locked(struct dma_fence 
>> *fence)
>>   static inline bool
>>   dma_fence_is_signaled(struct dma_fence *fence)
>>   {
>> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
>> +    if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
>> +        return false;
>> +#endif
>> +
>>       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>           return true;
> 
