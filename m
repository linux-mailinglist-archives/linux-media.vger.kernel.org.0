Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB014984DA
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 17:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243746AbiAXQcL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 11:32:11 -0500
Received: from mga12.intel.com ([192.55.52.136]:15494 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235823AbiAXQcK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 11:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643041930; x=1674577930;
  h=message-id:subject:from:to:date:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ljYzMx7eashDoVWnX7UEqED4AmZeqIf5MfmoxULUtms=;
  b=cdsYlRGnrV4fgKlpl8swgl0TR8fLUMi0bOPEXZLV+LSwOSddSCArGgmx
   PHTMI1wkykLrYfzYu2uPt87U14bC483VQwbCFudhXonJWhCeaMOHf5Vbi
   5MPnkoTP3HoCSaeG6Y29Be/zr/hfanDnfKASHY//g105jJQKvw7H5jbpf
   D+oNrTWcXjhkuqo1FhhsRYhTT3lFIk8XcdCvzi23OweogUCifbRtGZdKF
   ibGvK31O1XCiQtSTYUj9o3QRqvW2bDTkJb0I8+TDVIQrY/trV6qH2eKkC
   IQrpPYevZIp6xqK9L/bEuCYA9uwQSOwmKDE+CKIxtYak8ZR4GE8UDf9x/
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="226066739"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="226066739"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 08:32:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="673676797"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.70]) ([10.249.254.70])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 08:32:08 -0800
Message-ID: <5ad6f09f4b4ec5a3fe803c3d4811b10d13565d71.camel@linux.intel.com>
Subject: Re: [PATCH 04/11] dma-buf: warn about dma_fence_array container
 rules v2
From:   Thomas =?ISO-8859-1?Q?Hellstr=F6m?= 
        <thomas.hellstrom@linux.intel.com>
To:     Christian =?ISO-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
Date:   Mon, 24 Jan 2022 17:32:06 +0100
In-Reply-To: <20220124130328.2376-5-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
         <20220124130328.2376-5-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2022-01-24 at 14:03 +0100, Christian König wrote:
> It's not allowed to nest another dma_fence container into a
> dma_fence_array
> or otherwise we can run into recursion.
> 
> Warn about that when we create a dma_fence_array.
> 
> v2: fix comment style and typo in the warning pointed out by Thomas
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> ---
>  drivers/dma-buf/dma-fence-array.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-
> fence-array.c
> index 3e07f961e2f3..cb1bacb5a42b 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -176,6 +176,20 @@ struct dma_fence_array
> *dma_fence_array_create(int num_fences,
>  
>         array->base.error = PENDING_ERROR;
>  
> +       /*
> +        * dma_fence_array objects should never contain any other
> fence
> +        * containers or otherwise we run into recursion and
> potential kernel
> +        * stack overflow on operations on the dma_fence_array.
> +        *
> +        * The correct way of handling this is to flatten out the
> array by the
> +        * caller instead.
> +        *
> +        * Enforce this here by checking that we don't create a
> dma_fence_array
> +        * with any container inside.
> +        */
> +       while (num_fences--)
> +               WARN_ON(dma_fence_is_container(fences[num_fences]));
> +
>         return array;
>  }
>  EXPORT_SYMBOL(dma_fence_array_create);


