Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F782AE397
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 23:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732374AbgKJWpa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 17:45:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730254AbgKJWp3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 17:45:29 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37477C0613D1;
        Tue, 10 Nov 2020 14:45:29 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id h62so4813402wme.3;
        Tue, 10 Nov 2020 14:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gIHRk4WzqhkavwE/53+xiX6vw4oD1nHmuhdAmxZjOMI=;
        b=FUh6dQ1m/msnRtj5Hmd4z78dOenOvzNyZCMgZ87kFDWUSaqVwnSMneS0y79HDL51kz
         0Y5ci7JUQo5VSLO51iKKiSbZAkg8OzhczCHm2G4HLv3l6zoX4o9osvtBS2dxPdtqiUim
         zzPsVCSkQlY4fmJlY37/Fhuvo4TRPgzZwqbmlNtbwvG23NbhiVxdDGjs0jV8B4aROXne
         cPLygauqmTh4RugAOdZQ8Q4Nx6AjrNoLc4Cpm48Wy+P+Cr6QGI3duY/6Ym6PvdmtGeyx
         J1b/Z81yno7IWe5J6+Kd5erT39/XfyNktvkENc+T7LPvkxBvPmDaIbeSknvTS0qgOefg
         4wBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gIHRk4WzqhkavwE/53+xiX6vw4oD1nHmuhdAmxZjOMI=;
        b=IZ7vzYWN39+TiLS86GTWLrnk/ATCf0r4QNhGVhc2OHNAgxB9aA4iU5Y2kMEviMNfpN
         FeQGRm5IiNIJe+kGSsQ3sibJdO5E+v4SlUjvTB77pcXIXe58wZKrmaBtwBJTLOgIvc9o
         tiVZKbXa+c75rwtvQJTEW+Flk2lGJG27mkz8G5jLTwdyKnTqUlWHrPyWfOmmVBSj/90l
         vaT+3QtTJO8OGKzTj7Xp2kMJBwOqd1y8ZTThAO8y5Mw4s6jdjMz8HKwbixvGb2ERu9y3
         9VAYmx1gYWVtMKJ9Wu8sBv0XjzD4IuLONeg6S0RA3+XsWikqXEzzLmKB76dHcSMbPJ+3
         UCOA==
X-Gm-Message-State: AOAM533LtcyOFcTX+k6A4u60gJg6mxuirnRGnQ6PE5fjxyTg0AS7owjs
        xUb0H3VaImd8P0wbcaOp4BH4emkXcp9Pj6rZsHM=
X-Google-Smtp-Source: ABdhPJxUXQ0LQsJ3DS6nEHKwM8BdhNoRjD1JrShK9j9JF1Ufc4A68mOk7Y0eDhjSIaz329/nrmZXg4qr7Em4AoxHBIM=
X-Received: by 2002:a1c:6302:: with SMTP id x2mr405139wmb.56.1605048327960;
 Tue, 10 Nov 2020 14:45:27 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org> <20201109211855.3340030-20-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-20-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 10 Nov 2020 17:45:16 -0500
Message-ID: <CADnq5_OU0RmQit_WOEQEAUX1=m1EHz9CLufSD8zyTMbzJoDtug@mail.gmail.com>
Subject: Re: [PATCH 19/20] drm/radeon/r600: Fix a misnamed parameter
 description and a formatting issue
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

On Mon, Nov 9, 2020 at 4:19 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/r600.c:2965: warning: Function parameter or membe=
r 'resv' not described in 'r600_copy_cpdma'
>  drivers/gpu/drm/radeon/r600.c:2965: warning: Excess function parameter '=
fence' description in 'r600_copy_cpdma'
>  drivers/gpu/drm/radeon/r600.c:4382: warning: Function parameter or membe=
r 'rdev' not described in 'r600_mmio_hdp_flush'
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
>  drivers/gpu/drm/radeon/r600.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.=
c
> index 9587792503525..0a085b85f559d 100644
> --- a/drivers/gpu/drm/radeon/r600.c
> +++ b/drivers/gpu/drm/radeon/r600.c
> @@ -2952,7 +2952,7 @@ bool r600_semaphore_ring_emit(struct radeon_device =
*rdev,
>   * @src_offset: src GPU address
>   * @dst_offset: dst GPU address
>   * @num_gpu_pages: number of GPU pages to xfer
> - * @fence: radeon fence object
> + * @resv: DMA reservation object to manage fences
>   *
>   * Copy GPU paging using the CP DMA engine (r6xx+).
>   * Used by the radeon ttm implementation to move pages if
> @@ -4371,7 +4371,7 @@ int r600_debugfs_mc_info_init(struct radeon_device =
*rdev)
>
>  /**
>   * r600_mmio_hdp_flush - flush Host Data Path cache via MMIO
> - * rdev: radeon device structure
> + * @rdev: radeon device structure
>   *
>   * Some R6XX/R7XX don't seem to take into account HDP flushes performed
>   * through the ring buffer. This leads to corruption in rendering, see
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
