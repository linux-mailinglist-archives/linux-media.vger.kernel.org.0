Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34954421FC3
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 09:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbhJEHzx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 03:55:53 -0400
Received: from mga06.intel.com ([134.134.136.31]:6533 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231816AbhJEHzs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Oct 2021 03:55:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="286559466"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; 
   d="scan'208";a="286559466"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2021 00:53:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; 
   d="scan'208";a="487924881"
Received: from tbarret1-mobl.ger.corp.intel.com (HELO [10.213.238.194]) ([10.213.238.194])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2021 00:53:56 -0700
Subject: Re: [PATCH 24/28] drm: use new iterator in
 drm_gem_plane_helper_prepare_fb
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
References: <20211001100610.2899-1-christian.koenig@amd.com>
 <20211001100610.2899-25-christian.koenig@amd.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <80bb132f-0e40-68a1-d034-2d4b17d321ad@linux.intel.com>
Date:   Tue, 5 Oct 2021 08:53:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211001100610.2899-25-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 01/10/2021 11:06, Christian König wrote:
> Makes the handling a bit more complex, but avoids the use of
> dma_resv_get_excl_unlocked().
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/drm_gem_atomic_helper.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
> index e570398abd78..21ed930042b8 100644
> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> @@ -143,6 +143,7 @@
>    */
>   int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>   {
> +	struct dma_resv_iter cursor;
>   	struct drm_gem_object *obj;
>   	struct dma_fence *fence;
>   
> @@ -150,9 +151,17 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
>   		return 0;
>   
>   	obj = drm_gem_fb_get_obj(state->fb, 0);
> -	fence = dma_resv_get_excl_unlocked(obj->resv);
> -	drm_atomic_set_fence_for_plane(state, fence);
> +	dma_resv_iter_begin(&cursor, obj->resv, false);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		dma_fence_get(fence);
> +		dma_resv_iter_end(&cursor);
> +		/* TODO: We only use the first write fence here */

What is the TODO? NB instead?

> +		drm_atomic_set_fence_for_plane(state, fence);
> +		return 0;
> +	}
> +	dma_resv_iter_end(&cursor);
>   
> +	drm_atomic_set_fence_for_plane(state, NULL);

	dma_resv_iter_begin(&cursor, obj->resv, false);
	dma_resv_for_each_fence_unlocked(&cursor, fence) {
		dma_fence_get(fence);
		break;
	}
	dma_resv_iter_end(&cursor);

	drm_atomic_set_fence_for_plane(state, fence);

Does this work?

But overall I am not sure this is nicer. Is the goal to remove 
dma_resv_get_excl_unlocked as API it just does not happen in this series?

Regards,

Tvrtko

>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
> 
