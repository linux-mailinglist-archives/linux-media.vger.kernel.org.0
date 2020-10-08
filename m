Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8420B287E4F
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 23:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgJHVtE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 17:49:04 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:5601 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgJHVtE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 17:49:04 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f7f89430001>; Thu, 08 Oct 2020 14:48:51 -0700
Received: from [10.2.48.215] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Oct
 2020 21:49:03 +0000
Subject: Re: [PATCH 1/4] mm: introduce vma_set_file function v2
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
        <linaro-mm-sig@lists.linaro.org>,
        <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
        <chris@chris-wilson.co.uk>, <airlied@redhat.com>,
        <akpm@linux-foundation.org>, <daniel@ffwll.ch>,
        <sumit.semwal@linaro.org>
References: <20201008112342.9394-1-christian.koenig@amd.com>
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <b6b77e60-f93d-efe4-e267-983a2bdbbe71@nvidia.com>
Date:   Thu, 8 Oct 2020 14:49:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201008112342.9394-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602193731; bh=7i3jZC1P+1sGlWP35B+/rJtJPgw2xaej/RUlAUDj20A=;
        h=Subject:To:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=lT3noPjN6nsazaxazrkTAZJXXDq9MU9e9CfYXSbXg8tSCVoorFGM7M/YNUCd42FT1
         dKH9AByZMwx2YXJQZ83lwCkaqFQWC0YvYb72NUHoCzveaWNranS7KsOFaeMzZWy/6E
         5FA2ekF8rcO0uhRvVWrbzMmRyHVliNxHzH1Fb166Kd05XkEfBR7t0cddAjnymHDbXa
         as1wSoVJUoD2zt85swdV8Nl4uYzpW/NZFRmJUKfoaSVqZndhrNIn8JS0NbNJMifnxt
         X8UwMogZrGtl7zMXYwFpjv6td0b4hP7ukBua0ValYvHsujD4xfCzvmvEgmO/MImwBb
         8l3Yz+o5Z5zjg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/8/20 4:23 AM, Christian K=C3=B6nig wrote:
> Add the new vma_set_file() function to allow changing
> vma->vm_file with the necessary refcount dance.
>=20
> v2: add more users of this.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-buf.c                  | 16 +++++-----------
>   drivers/gpu/drm/etnaviv/etnaviv_gem.c      |  4 +---
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |  3 +--
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c   |  4 ++--
>   drivers/gpu/drm/msm/msm_gem.c              |  4 +---
>   drivers/gpu/drm/omapdrm/omap_gem.c         |  3 +--
>   drivers/gpu/drm/vgem/vgem_drv.c            |  3 +--
>   drivers/staging/android/ashmem.c           |  5 ++---
>   include/linux/mm.h                         |  2 ++
>   mm/mmap.c                                  | 16 ++++++++++++++++
>   10 files changed, 32 insertions(+), 28 deletions(-)

Looks like a nice cleanup. Two comments below.

...

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i=
915/gem/i915_gem_mman.c
> index 3d69e51f3e4d..c9d5f1a38af3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -893,8 +893,8 @@ int i915_gem_mmap(struct file *filp, struct vm_area_s=
truct *vma)
>   	 * requires avoiding extraneous references to their filp, hence why
>   	 * we prefer to use an anonymous file for their mmaps.
>   	 */
> -	fput(vma->vm_file);
> -	vma->vm_file =3D anon;
> +	vma_set_file(vma, anon);
> +	fput(anon);

That's one fput() too many, isn't it?

...

> diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/a=
shmem.c
> index 10b4be1f3e78..a51dc089896e 100644
> --- a/drivers/staging/android/ashmem.c
> +++ b/drivers/staging/android/ashmem.c
> @@ -450,9 +450,8 @@ static int ashmem_mmap(struct file *file, struct vm_a=
rea_struct *vma)
>   		vma_set_anonymous(vma);
>   	}
>  =20
> -	if (vma->vm_file)
> -		fput(vma->vm_file);
> -	vma->vm_file =3D asma->file;
> +	vma_set_file(vma, asma->file);
> +	fput(asma->file);

Same here: that fput() seems wrong, as it was already done within vma_set_f=
ile().


thanks,
--=20
John Hubbard
NVIDIA
