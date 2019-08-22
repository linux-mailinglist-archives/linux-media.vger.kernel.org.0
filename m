Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 524B69936C
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 14:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731393AbfHVM2n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 08:28:43 -0400
Received: from mga07.intel.com ([134.134.136.100]:17884 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbfHVM2n (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 08:28:43 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Aug 2019 05:28:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; 
   d="scan'208";a="190566346"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by orsmga002.jf.intel.com with SMTP; 22 Aug 2019 05:28:39 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 22 Aug 2019 15:28:38 +0300
Date:   Thu, 22 Aug 2019 15:28:38 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 10/10] dma-buf/resv: add other operations
Message-ID: <20190822122838.GN5942@intel.com>
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-11-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190821123147.110736-11-christian.koenig@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 21, 2019 at 02:31:47PM +0200, Christian König wrote:
> Additional to readers and writers add another class of operations
> which never participate in implicit synchronization.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 27 ++++++++++++++++++++++++---
>  include/linux/dma-resv.h   |  2 ++
>  2 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 8ef7dbc7fd8e..c6dd6c36dba2 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -280,6 +280,7 @@ void dma_resv_init(struct dma_resv *obj)
>  
>  	dma_resv_fences_init(&obj->writers);
>  	dma_resv_fences_init(&obj->readers);
> +	dma_resv_fences_init(&obj->others);
>  }
>  EXPORT_SYMBOL(dma_resv_init);
>  
> @@ -295,6 +296,7 @@ void dma_resv_fini(struct dma_resv *obj)
>  	 */
>  	dma_resv_fences_fini(&obj->writers);
>  	dma_resv_fences_fini(&obj->readers);
> +	dma_resv_fences_fini(&obj->others);
>  	ww_mutex_destroy(&obj->lock);
>  }
>  EXPORT_SYMBOL(dma_resv_fini);
> @@ -334,6 +336,10 @@ void dma_resv_prune_fences(struct dma_resv *obj)
>  	fence = dma_resv_fences_deref(obj, &obj->readers);
>  	if (dma_fence_is_signaled(fence))
>  		dma_resv_fences_set(obj, &obj->readers, NULL);
> +
> +	fence = dma_resv_fences_deref(obj, &obj->others);
> +	if (dma_fence_is_signaled(fence))
> +		dma_resv_fences_set(obj, &obj->others, NULL);
>  }
>  EXPORT_SYMBOL(dma_resv_prune_fences);
>  
> @@ -346,17 +352,19 @@ EXPORT_SYMBOL(dma_resv_prune_fences);
>  */
>  int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>  {
> -	struct dma_fence *writers, *readers;
> +	struct dma_fence *writers, *readers, *others;
>  
>  	dma_resv_assert_held(dst);
>  
>  	rcu_read_lock();
>  	writers = dma_resv_fences_get_rcu(&src->writers);
>  	readers = dma_resv_fences_get_rcu(&src->readers);
> +	others = dma_resv_fences_get_rcu(&src->others);
>  	rcu_read_unlock();
>  
>  	dma_resv_fences_set(dst, &dst->writers, writers);
>  	dma_resv_fences_set(dst, &dst->readers, readers);
> +	dma_resv_fences_set(dst, &dst->readers, others);
                                       ^^^^^^^

others?


-- 
Ville Syrjälä
Intel
