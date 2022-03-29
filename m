Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5C64EA84A
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 09:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233287AbiC2HIt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 03:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233249AbiC2HIr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 03:08:47 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FFD23D743
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 00:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648537625; x=1680073625;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hJCPwH7SOlcNlxTVq5wQ0kZ37jUz1wZR7OY+KI6Gqrg=;
  b=f5QPE3DfvqAIgWqpXMOGehqd12r/y4lJ/C1PmBq7jL6H2yqSqNYIjRSd
   APVvP5gkUugkJLYbq1Hc5h6/+iWpM20wPo3o/HgMsSbnUn9A5bh4tvhSG
   bNziP5kHA9RnM1ZAj5mKck3mdgc7y7wudStaKDPsYK+7loPaNvYI0IE6a
   ePIn+2aS3wZlSl+WeJ6FDRGa5iZwRpQxFBg5tKAJs5VekCXlTnypMHSEI
   0XwTVP2QJ71uVrF7ILRVg55EFDDnH4XB4BJT3yzDVK3Sil1FmS1r9pmG7
   0WnotfPeQzdXKfsPPwILB4iCAeLYcG4ikJhVvvpLHlCv0HQXOr5BLVrML
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="241333269"
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; 
   d="scan'208";a="241333269"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 00:07:05 -0700
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; 
   d="scan'208";a="652722563"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO [10.249.254.86]) ([10.249.254.86])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 00:07:03 -0700
Message-ID: <3d46abe4-5113-e1b8-56be-19ac678d62f2@linux.intel.com>
Date:   Tue, 29 Mar 2022 09:07:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf/sync-file: fix logic error in
 new fence merge code
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        ville.syrjala@linux.intel.com, daniel@ffwll.ch
Cc:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220329070001.134180-1-christian.koenig@amd.com>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= 
        <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220329070001.134180-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For the series,

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


On 3/29/22 09:00, Christian König wrote:
> When the array is empty because everything is signaled we can't use
> add_fence() to add something because that would filter the signaled
> fence again.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Fixes: 519f490db07e ("dma-buf/sync-file: fix warning about fence containers")
> ---
>   drivers/dma-buf/sync_file.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index b8dea4ec123b..514d213261df 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -262,7 +262,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>   	}
>   
>   	if (index == 0)
> -		add_fence(fences, &index, dma_fence_get_stub());
> +		fences[index++] = dma_fence_get_stub();
>   
>   	if (num_fences > index) {
>   		struct dma_fence **tmp;
