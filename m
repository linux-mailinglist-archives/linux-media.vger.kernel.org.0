Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E91284984E8
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 17:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243353AbiAXQdj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 11:33:39 -0500
Received: from mga02.intel.com ([134.134.136.20]:28565 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240935AbiAXQdb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 11:33:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643042011; x=1674578011;
  h=message-id:subject:from:to:date:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ILPcAbLBDRtC79SJgsi8iQ2xqJMuxcjkWNiEEEkqLC8=;
  b=in9j6DI/oQBPi3om6ALHs8OfQ58J39tJa+w8DUIXErUpVKw+J/Wq9qv4
   UJ1jNqNgXgjNppTPzech65OiurAF8W+b1QeVBwQl5UUD8MHYHS6bEDOqT
   iuqaa/JC4KYSSuISazi25VOLDNaxjIQ6vfnKNBmmCm89Tzov8OsMKCkQd
   Wkm9jdRpW+9cOxOkqeHR6lJjmJ5lFhOvMWG6qebQuWgua9a3MtzGzsi52
   nd5qxBs4dJCGKE4ZOJn0NDP3n4nIKC/NMk0uPEqNSkA8mIyxnTjqNeViS
   cISZOR6ufs3a6V8xIqJbOV1jXrkpMgkHdvrVC4Y82vE6Lp1PakfCY1XNW
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="233447773"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="233447773"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 08:33:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="520009594"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.70]) ([10.249.254.70])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 08:33:27 -0800
Message-ID: <e0138a97e91678c0bd8d06071b6398c09d9c4142.camel@linux.intel.com>
Subject: Re: [PATCH 01/11] drm/radeon: use ttm_resource_manager_debug
From:   Thomas =?ISO-8859-1?Q?Hellstr=F6m?= 
        <thomas.hellstrom@linux.intel.com>
To:     Christian =?ISO-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
Date:   Mon, 24 Jan 2022 17:33:25 +0100
In-Reply-To: <20220124130328.2376-2-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
         <20220124130328.2376-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2022-01-24 at 14:03 +0100, Christian König wrote:
> Instead of calling the debug operation directly.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Huang Rui <ray.huang@amd.com>

The first two patches seem unrelated to the series. Also is there a
chance of a series cover-letter?

Thanks,
Thomas



> ---
>  drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c
> b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 11b21d605584..0d1283cdc8fb 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -802,7 +802,7 @@ static int radeon_mm_vram_dump_table_show(struct
> seq_file *m, void *unused)
>                                                            
> TTM_PL_VRAM);
>         struct drm_printer p = drm_seq_file_printer(m);
>  
> -       man->func->debug(man, &p);
> +       ttm_resource_manager_debug(man, &p);
>         return 0;
>  }
>  
> @@ -820,7 +820,7 @@ static int radeon_mm_gtt_dump_table_show(struct
> seq_file *m, void *unused)
>                                                            
> TTM_PL_TT);
>         struct drm_printer p = drm_seq_file_printer(m);
>  
> -       man->func->debug(man, &p);
> +       ttm_resource_manager_debug(man, &p);
>         return 0;
>  }
>  


