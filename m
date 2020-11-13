Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8825D2B21A3
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 18:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgKMRM2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 12:12:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbgKMRM1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 12:12:27 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB41C0613D1;
        Fri, 13 Nov 2020 09:12:41 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id d12so10673238wrr.13;
        Fri, 13 Nov 2020 09:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RFeIJyuMJoX5jkxaoyIf1M57XnlhipuyBs/EiEAXNDg=;
        b=Edt20aWM/GTZS0j+p4iJJG+xhPOzKGOiq/M8V1o0dubAmMdID+a6BSbtfMNYY8+x2j
         PtSKRuy+4wihXMxE97tpQoYpcGlWDoiV1VY0yq0aThkpxtEnjZZKUtLsPylK2FP2coHU
         Ygjr4amtmztLBeBOuhETkhPXhjbclQWYHD/p0dlO3pg23CcFWqNs0cm2eBP5GQR3fdRf
         ACIDw/fujzboEeohVVEwUMNUx7Cuyb/tjxPPQ43fwbmLWqe4xrfSRBitLTYNwvTBaRgQ
         t5lLQeBPuBhJKgOIcF3776IwcKkYqeSH2CuM4WhmEWOacrNjcsEbuAfqOuQYx6jH0SZc
         olzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RFeIJyuMJoX5jkxaoyIf1M57XnlhipuyBs/EiEAXNDg=;
        b=Rf1iQn8LI7CaRMg056juNwQtvNmc3kZ67Bu+O3CIUAIulCPh2G5ReX93BDzv5Micsf
         IkTJ+j5e2BsZyRk2FC2Xzn0M4mpvjAmG3UvDqh5c8/nK8cyi3PPv/+r8yUgn0arzji3z
         P8nRRGtomk+AYR9AcRW2zj4AcXhFWJU1UsSUamEuAWZ5PeRPAr3YTDLxSd2JCgihWy/+
         tgh0iN9FOq2ugkzamEkcRA25OhZ9bhJfj/jLNQpRPpUEOBbFrSlUE/uuuJhL97v8xUVQ
         Rf8IN8nH4mXrRrykZokoeT95/mJImmoD58VTVyzhb4uIArpXxInO5NOdC62IXcvsy9eC
         kOeQ==
X-Gm-Message-State: AOAM533Hs6yB4gqWLjNILWm1TGRTPVLicZnEtm6jRcnpYJcajzumwDr2
        4/G711/lUYAX2msLlym7QsV6Rd/nLR0eAHQpF9Y=
X-Google-Smtp-Source: ABdhPJxmLhtueDSS0HzPw4NvpZjQwREZvykaIIaVnhzTfOWyWePuIu+wL7J6Na0KjWPp16C+fo97YAxlKYRbCuBjAMM=
X-Received: by 2002:a5d:6992:: with SMTP id g18mr4661453wru.362.1605287556673;
 Fri, 13 Nov 2020 09:12:36 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org> <20201113134938.4004947-6-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-6-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 13 Nov 2020 12:12:25 -0500
Message-ID: <CADnq5_MPKD-Pewn9qfnOMgHE=x34zntux=NdhoimORPtkb8zbQ@mail.gmail.com>
Subject: Re: [PATCH 05/40] drm/amd/amdgpu/amdgpu_ring: Fix misnaming of param 'max_dw'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 13, 2020 at 8:50 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:168: warning: Function paramete=
r or member 'max_dw' not described in 'amdgpu_ring_init'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:168: warning: Excess function p=
arameter 'max_ndw' description in 'amdgpu_ring_init'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_ring.c
> index a23b2079696a1..1a612f51ecd9e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> @@ -154,7 +154,7 @@ void amdgpu_ring_undo(struct amdgpu_ring *ring)
>   *
>   * @adev: amdgpu_device pointer
>   * @ring: amdgpu_ring structure holding ring information
> - * @max_ndw: maximum number of dw for ring alloc
> + * @max_dw: maximum number of dw for ring alloc
>   * @irq_src: interrupt source to use for this ring
>   * @irq_type: interrupt type to use for this ring
>   * @hw_prio: ring priority (NORMAL/HIGH)
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
