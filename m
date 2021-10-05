Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D99BE421F7B
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 09:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232478AbhJEHhp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 03:37:45 -0400
Received: from mga07.intel.com ([134.134.136.100]:43127 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230526AbhJEHhp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Oct 2021 03:37:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="289185668"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; 
   d="scan'208";a="289185668"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2021 00:35:55 -0700
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; 
   d="scan'208";a="487917277"
Received: from tbarret1-mobl.ger.corp.intel.com (HELO [10.213.238.194]) ([10.213.238.194])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2021 00:35:53 -0700
Subject: Re: [PATCH 08/28] dma-buf: use the new iterator in dma_buf_debug_show
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
References: <20211001100610.2899-1-christian.koenig@amd.com>
 <20211001100610.2899-9-christian.koenig@amd.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <23ae5edb-4582-1fec-f0a5-db224265df77@linux.intel.com>
Date:   Tue, 5 Oct 2021 08:35:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211001100610.2899-9-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 01/10/2021 11:05, Christian König wrote:
> Simplifying the code a bit.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-buf.c | 24 ++++++------------------
>   1 file changed, 6 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 61e20ae7b08b..8242b5d9baeb 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1356,10 +1356,9 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
>   {
>   	struct dma_buf *buf_obj;
>   	struct dma_buf_attachment *attach_obj;
> -	struct dma_resv *robj;
> -	struct dma_resv_list *fobj;
> +	struct dma_resv_iter cursor;
>   	struct dma_fence *fence;
> -	int count = 0, attach_count, shared_count, i;
> +	int count = 0, attach_count;
>   	size_t size = 0;
>   	int ret;
>   
> @@ -1386,21 +1385,10 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
>   				file_inode(buf_obj->file)->i_ino,
>   				buf_obj->name ?: "");
>   
> -		robj = buf_obj->resv;
> -		fence = dma_resv_excl_fence(robj);
> -		if (fence)
> -			seq_printf(s, "\tExclusive fence: %s %s %ssignalled\n",
> -				   fence->ops->get_driver_name(fence),
> -				   fence->ops->get_timeline_name(fence),
> -				   dma_fence_is_signaled(fence) ? "" : "un");
> -
> -		fobj = rcu_dereference_protected(robj->fence,
> -						 dma_resv_held(robj));
> -		shared_count = fobj ? fobj->shared_count : 0;
> -		for (i = 0; i < shared_count; i++) {
> -			fence = rcu_dereference_protected(fobj->shared[i],
> -							  dma_resv_held(robj));
> -			seq_printf(s, "\tShared fence: %s %s %ssignalled\n",
> +		dma_resv_for_each_fence(&cursor, buf_obj->resv, true, fence) {
> +			seq_printf(s, "\t%s fence: %s %s %ssignalled\n",
> +				   dma_resv_iter_is_exclusive(&cursor) ?
> +					"Exclusive" : "Shared",
>   				   fence->ops->get_driver_name(fence),
>   				   fence->ops->get_timeline_name(fence),
>   				   dma_fence_is_signaled(fence) ? "" : "un");
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
