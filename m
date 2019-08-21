Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9B5497FFA
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 18:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729262AbfHUQYc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 21 Aug 2019 12:24:32 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:57844 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726857AbfHUQYb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 12:24:31 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 18216887-1500050 
        for multiple; Wed, 21 Aug 2019 17:24:27 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From:   Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To:     =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-4-christian.koenig@amd.com>
In-Reply-To: <20190821123147.110736-4-christian.koenig@amd.com>
Message-ID: <156640466565.20466.15873039258008813430@skylake-alporthouse-com>
Subject: Re: [PATCH 03/10] dma-buf: add dma_fence_array_recycle
Date:   Wed, 21 Aug 2019 17:24:25 +0100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Christian König (2019-08-21 13:31:40)
> Try to recycle an dma_fence_array object by dropping the last
> reference to it without freeing it.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence-array.c | 27 +++++++++++++++++++++++++++
>  include/linux/dma-fence-array.h   |  1 +
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index e82f30551aa1..314cf0e881d9 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -188,6 +188,33 @@ void dma_fence_array_init(struct dma_fence_array *array, u64 context,
>  }
>  EXPORT_SYMBOL(dma_fence_array_init);
>  
> +/**
> + * dma_fence_array_reuse - dummy for dma_fence_array_recycle
> + */
> +static void dma_fence_array_reuse(struct kref *kref)
> +{
> +       struct dma_fence_array *array = container_of(kref, typeof(*array),
> +                                                    base.refcount);
> +
> +       WARN_ON_ONCE(!list_empty(&array->base.cb_list));

[   77.584694] WARNING: CPU: 3 PID: 627 at drivers/dma-buf/dma-fence-array.c:199 dma_fence_array_recycle+0x1d/0x20
[   77.584702] Modules linked in: nls_ascii nls_cp437 vfat fat crct10dif_pclmul i915 crc32_pclmul crc32c_intel aesni_intel aes_x86_64 glue_helper crypto_simd cryptd intel_cstate intel_gtt drm_kms_helper intel_uncore intel_rapl_perf ahci i2c_i801 libahci efivars video button efivarfs
[   77.584716] CPU: 3 PID: 627 Comm: gem_busy Tainted: G     U            5.3.0-rc5+ #72
[   77.584719] Hardware name: Intel Corporation NUC7i5BNK/NUC7i5BNB, BIOS BNKBL357.86A.0052.2017.0918.1346 09/18/2017
[   77.584723] RIP: 0010:dma_fence_array_recycle+0x1d/0x20
[   77.584726] Code: 5d c3 5b 5d e9 54 f5 ff ff 0f 1f 40 00 f0 ff 4f 38 0f 88 d3 85 14 00 0f 94 c0 74 01 c3 48 8b 57 10 48 83 c7 10 48 39 d7 74 f2 <0f> 0b c3 48 c7 c0 62 88 be 81 c3 0f 1f 84 00 00 00 00 00 48 c7 c0
[   77.584730] RSP: 0018:ffffc900001c3c78 EFLAGS: 00010292
[   77.584733] RAX: 0000000000000001 RBX: ffff88885ac14b40 RCX: cccccccccccccccd
[   77.584735] RDX: 00000012105b0a77 RSI: 0000000000000000 RDI: ffff88885ac14b50
[   77.584737] RBP: 0000000000000000 R08: 0000000000000004 R09: 000000000001de00
[   77.584740] R10: 00000030f5224012 R11: 00000000000002df R12: ffff88885b58aff0
[   77.584742] R13: 0000000000000000 R14: 0000000000000000 R15: ffff88885748e100
[   77.584745] FS:  00007f1cd47b19c0(0000) GS:ffff88885eb80000(0000) knlGS:0000000000000000
[   77.584748] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   77.584750] CR2: 00007f1cd6719000 CR3: 000000085ac5b002 CR4: 00000000001606e0
[   77.584753] Call Trace:
[   77.584758]  dma_resv_fences_assign.isra.7+0x8d/0x220
[   77.584761]  dma_resv_prune_fences+0xba/0xc0
[   77.584796]  i915_gem_object_wait_reservation+0x226/0x240 [i915]
[   77.584827]  i915_gem_object_wait+0x23/0x40 [i915]
[   77.584854]  i915_gem_set_domain_ioctl+0xbf/0x240 [i915]

If we signal the fence-array, the cb_list is replaced by the timestamp
and is no longer considered empty.
-Chris
