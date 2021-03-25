Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 605F0348B5F
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 09:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbhCYIRQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 04:17:16 -0400
Received: from vulcan.natalenko.name ([104.207.131.136]:35816 "EHLO
        vulcan.natalenko.name" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbhCYIRE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 04:17:04 -0400
Received: from localhost (kaktus.kanapka.ml [151.237.229.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vulcan.natalenko.name (Postfix) with ESMTPSA id 983589F89B3;
        Thu, 25 Mar 2021 09:17:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
        s=dkim-20170712; t=1616660222;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bh7wP2L3MUfdWgUnQuBUElgHs80OttJY20MheoOX9z0=;
        b=kQTslmY70D+XU8hjEh8DFuJnXj25xjL2XNEaBKRcuvuP2/wrjZ8BMGKZKdUcDE9WV77jTD
        ub2HCCrifZzp4J45mkD5VPV2wM3IWielQptu5QYeAXofs7jz8r4RcLAmCBXZicV6VMlhoU
        oexebAnGATmsBpI5eo35dMt2nO1eBFQ=
Date:   Thu, 25 Mar 2021 09:17:02 +0100
From:   Oleksandr Natalenko <oleksandr@natalenko.name>
To:     linux-kernel@vger.kernel.org
Cc:     Ilkka Prusi <ilkka.prusi@pp.inet.fi>,
        Chris Rankin <rankincj@gmail.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: WARNING: AMDGPU DRM warning in 5.11.9
Message-ID: <20210325081702.5kdzp7moqhcox65b@spock.localdomain>
References: <CAK2bqVJ+=nHTK-hnUC=qL1mcOvHWTCwDMYPBKJp77QCbBvBGGw@mail.gmail.com>
 <a38a3c04-4ac8-01a6-da69-a2bdaa54f61d@pp.inet.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a38a3c04-4ac8-01a6-da69-a2bdaa54f61d@pp.inet.fi>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello.

On Thu, Mar 25, 2021 at 07:57:33AM +0200, Ilkka Prusi wrote:
> On 24.3.2021 16.16, Chris Rankin wrote:
> > Hi,
> > 
> > Theee warnings ares not present in my dmesg log from 5.11.8:
> > 
> > [   43.390159] ------------[ cut here ]------------
> > [   43.393574] WARNING: CPU: 2 PID: 1268 at
> > drivers/gpu/drm/ttm/ttm_bo.c:517 ttm_bo_release+0x172/0x282 [ttm]
> > [   43.401940] Modules linked in: nf_nat_ftp nf_conntrack_ftp cfg80211
> 
> Changing WARN_ON to WARN_ON_ONCE in drivers/gpu/drm/ttm/ttm_bo.c
> ttm_bo_release() reduces the flood of messages into single splat.
> 
> This warning appears to come from 57fcd550eb15bce ("drm/ttm: Warn on pinning
> without holding a reference)" and reverting it might be one choice.
> 
> 
> > 
> > There are others, but I am assuming there is a common cause here.
> > 
> > Cheers,
> > Chris
> > 
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index a76eb2c14e8c..50b53355b265 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -514,7 +514,7 @@ static void ttm_bo_release(struct kref *kref)
>                  * shrinkers, now that they are queued for
>                  * destruction.
>                  */
> -               if (WARN_ON(bo->pin_count)) {
> +               if (WARN_ON_ONCE(bo->pin_count)) {
>                         bo->pin_count = 0;
>                         ttm_bo_del_from_lru(bo);
>                         ttm_bo_add_mem_to_lru(bo, &bo->mem);
> 
> 
> 
> --
>  - Ilkka
> 

WARN_ON_ONCE() will just hide the underlying problem. Do we know why
this happens at all?

Same for me, BTW, with v5.11.9:

```
[~]> lspci | grep VGA
0a:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Lexa PRO [Radeon 540/540X/550/550X / RX 540X/550/550X] (rev c7)

[ 3676.033140] ------------[ cut here ]------------
[ 3676.033153] WARNING: CPU: 7 PID: 1318 at drivers/gpu/drm/ttm/ttm_bo.c:517 ttm_bo_release+0x375/0x500 [ttm]
…
[ 3676.033340] Hardware name: ASUS System Product Name/Pro WS X570-ACE, BIOS 3302 03/05/2021
…
[ 3676.033469] Call Trace:
[ 3676.033473]  ttm_bo_move_accel_cleanup+0x1ab/0x3a0 [ttm]
[ 3676.033478]  amdgpu_bo_move+0x334/0x860 [amdgpu]
[ 3676.033580]  ttm_bo_validate+0x1f1/0x2d0 [ttm]
[ 3676.033585]  amdgpu_cs_bo_validate+0x9b/0x1c0 [amdgpu]
[ 3676.033665]  amdgpu_cs_list_validate+0x115/0x150 [amdgpu]
[ 3676.033743]  amdgpu_cs_ioctl+0x873/0x20a0 [amdgpu]
[ 3676.033960]  drm_ioctl_kernel+0xb8/0x140 [drm]
[ 3676.033977]  drm_ioctl+0x222/0x3c0 [drm]
[ 3676.034071]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[ 3676.034145]  __x64_sys_ioctl+0x83/0xb0
[ 3676.034149]  do_syscall_64+0x33/0x40
…
[ 3676.034171] ---[ end trace 66e9865b027112f3 ]---
```

Thanks.

-- 
  Oleksandr Natalenko (post-factum)
