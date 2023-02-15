Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7B71697B2B
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 12:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233844AbjBOLxE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 06:53:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233836AbjBOLxA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 06:53:00 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72971279B6;
        Wed, 15 Feb 2023 03:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676461979; x=1707997979;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sGItYsJPjXwrOlUwOMrgDww5mOK/F4dIR2AABpWT1BE=;
  b=izq8gw+eSjj99quXc3UTRRKmS8vU0brESKwy9HWYCFw6gxVojSljbEbh
   ms6KeUSlKySTmyiO//5be8TZ3xzi/vWG/oI38TIeE10zpOkQFhsuel0za
   sMNyF9KpbUv6K8uTUkVxJatB7JMgIcFANjR8OeCtlJ1GmC6mER+6pLfvX
   JzrWoValfCt7+4OlwQjh0jzYUlCCblAui+0qFqG2v5D0MHaCVdE+NNjbZ
   MtMDXSpHv8MN5HvXMkqs2BOeES1490JgJgXYya3LkqMtzs8zjubAcmddE
   F/mXD8nrXOvgK03eQ7PrjLmCE9kmRQ1a+pg2M6fMdEhoagSQ4afrisYfB
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="417626846"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="417626846"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 03:52:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="998462673"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="998462673"
Received: from josefgel-mobl.ger.corp.intel.com (HELO [10.251.213.167]) ([10.251.213.167])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 03:52:57 -0800
Message-ID: <05fb3949-d0aa-b653-d9a3-236a4c95a5a3@linux.intel.com>
Date:   Wed, 15 Feb 2023 12:52:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: Question: partial transfers of DMABUFs
Content-Language: en-US
To:     Paul Cercueil <paul@crapouillou.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <53ea4d2db570d3ca514a69015488bd5b849a5193.camel@crapouillou.net>
 <836d600a-bb1c-fbb2-89f5-7c79c3150e8c@linux.intel.com>
 <d540965a25138772fa063d62e907ffd611f93205.camel@crapouillou.net>
From:   Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <d540965a25138772fa063d62e907ffd611f93205.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey,

On 2023-02-15 12:47, Paul Cercueil wrote:
> Hi Maarten,
>
> Le mercredi 15 février 2023 à 12:30 +0100, Maarten Lankhorst a écrit :
>> Hey,
>>
>> On 2023-02-15 11:48, Paul Cercueil wrote:
>>> Hi,
>>>
>>> I am working on adding support for DMABUFs in the IIO subsystem.
>>>
>>> One thing we want there, is the ability to specify the number of
>>> bytes
>>> to transfer (while still defaulting to the DMABUF size).
>>>
>>> Since dma_buf_map_attachment() returns a sg_table, I basically have
>>> two
>>> options, and I can't decide which one is the best (or the less
>>> ugly):
>>>
>>> - Either I add a new API function similar to
>>> dmaengine_prep_slave_sg(),
>>> which still takes a scatterlist as argument but also takes the
>>> number
>>> of bytes as argument;
>>>
>>> - Or I add a function to duplicate the scatterlist and then shrink
>>> it
>>> manually, which doesn't sound like a good idea either.
>>>
>>> What would be the recommended way?
>> Does this need an api change? If you create a DMA-BUF of size X, it
>> has
>> to be of size X. You can pad with a dummy page probably if you know
>> it
>> in advance. But after it has been imported, it cannot change size.
> Yes, the sizes are fixed.
>
>> You don´t have to write the entire dma-buf either, so if you want to
>> create a 1GB buf and only use the first 4K, that is allowed. The
>> contents of  the remainder of the DMA-BUF are undefined. It's up to
>> userspace to assign a meaning to it.
>>
>> I think I'm missing something here that makes the whole question
>> m,ake
>> more sense.
> I want my userspace to be able to specify how much of the DMABUF is to
> be read from or written to.
>
> So in my new "dmabuf enqueue" IOCTL that I want to add to IIO, I added
> a parameter to specify the number of bytes to transfer (where 0 means
> the whole buffer).
>
> The problem I have now, is that the current dmaengine core does not
> have a API function that takes a scatterlist (returned by
> dma_map_attachment()) and a transfer size in bytes, it will always
> transfer the whole scatterlist.
>
> So my two options would be to add a new API function to support
> specifying a bytes count, or add a mechanism to duplicate a
> scatterlist, so that I can tweak it to the right size.

This doesn't have to happen through DMA-BUF. Presumably you are both the 
importer and the exporter, so after you know how much is read, you can 
tell this to the importer that X number of bytes can be read from DMA-BUF Y.

In your case, when enqueing you will get a full SG list, but if you know 
only X bytes are read/written you only have to map the first X bytes to 
your IIO device. The rest of the SG list could be ignored safely.

~Maarten

