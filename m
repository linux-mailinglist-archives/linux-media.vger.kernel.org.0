Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEEF1496AC
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 17:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgAYQmX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jan 2020 11:42:23 -0500
Received: from 4.mo4.mail-out.ovh.net ([178.32.98.131]:43110 "EHLO
        4.mo4.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgAYQmW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jan 2020 11:42:22 -0500
X-Greylist: delayed 16199 seconds by postgrey-1.27 at vger.kernel.org; Sat, 25 Jan 2020 11:42:21 EST
Received: from player734.ha.ovh.net (unknown [10.108.35.95])
        by mo4.mail-out.ovh.net (Postfix) with ESMTP id 0236121EB0C
        for <linux-media@vger.kernel.org>; Sat, 25 Jan 2020 12:52:39 +0100 (CET)
Received: from RCM-web9.webmail.mail.ovh.net (unknown [147.229.117.36])
        (Authenticated sender: steve@sk2.org)
        by player734.ha.ovh.net (Postfix) with ESMTPSA id 98DE3E7D3290;
        Sat, 25 Jan 2020 11:52:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Sat, 25 Jan 2020 12:52:23 +0100
From:   Stephen Kitt <steve@sk2.org>
To:     Felix Kuehling <Felix.Kuehling@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Zhou <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        steve@sk2.org
Subject: Re: [PATCH] amdgpu: use dma-resv API instead of manual kmalloc
In-Reply-To: <20200125114624.2093235-1-steve@sk2.org>
References: <20200125114624.2093235-1-steve@sk2.org>
User-Agent: Roundcube Webmail/1.4.2
Message-ID: <a413396eed8390fc95fedabae9ae5afb@sk2.org>
X-Sender: steve@sk2.org
X-Originating-IP: 147.229.117.36
X-Webmail-UserID: steve@sk2.org
X-Ovh-Tracer-Id: 3172504463427325436
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrvdejgdefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggtgfgfffhvffujghffgfkgihisehtkehjtddtreejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucfkpheptddrtddrtddrtddpudegjedrvddvledruddujedrfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

And of course I forgot this is an internal API, so this doesn't work 
without some of other stuff which isn't ready.

Please ignore...

Regards,

Stephen


Le 25/01/2020 12:46, Stephen Kitt a écrit :
> Instead of hand-coding the dma_resv_list allocation, use
> dma_resv_list_alloc, which masks the shared_max handling. While we're
> at it, since we only need shared_count fences, allocate shared_count
> fences rather than shared_max.
> 
> (This is the only place in the kernel, outside of dma-resv.c, which
> touches shared_max. This suggests we'd probably be better off without
> it!)
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 888209eb8cec..aec595752200 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -234,12 +234,11 @@ static int
> amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>  	if (!old)
>  		return 0;
> 
> -	new = kmalloc(offsetof(typeof(*new), shared[old->shared_max]),
> -		      GFP_KERNEL);
> +	new = dma_resv_list_alloc(old->shared_count);
>  	if (!new)
>  		return -ENOMEM;
> 
> -	/* Go through all the shared fences in the resevation object and sort
> +	/* Go through all the shared fences in the reservation object and 
> sort
>  	 * the interesting ones to the end of the list.
>  	 */
>  	for (i = 0, j = old->shared_count, k = 0; i < old->shared_count; ++i) 
> {
> @@ -253,7 +252,6 @@ static int
> amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>  		else
>  			RCU_INIT_POINTER(new->shared[k++], f);
>  	}
> -	new->shared_max = old->shared_max;
>  	new->shared_count = k;
> 
>  	/* Install the new fence list, seqcount provides the barriers */
