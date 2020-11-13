Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4962B2285
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 18:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgKMRcV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 12:32:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgKMRcU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 12:32:20 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9980EC0613D1;
        Fri, 13 Nov 2020 09:32:19 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id h62so9303773wme.3;
        Fri, 13 Nov 2020 09:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nB0sqPZdl7dQLoXl7ubMEUx/Fs5H1HyujTYlOBisxFw=;
        b=tEf5E9PgHkBX+tNoCia7JZ3Kr29grA0sA17rvN6So/U5BnGMt3IxD4Mfn9PafoJ5cJ
         XNC3dNDdjXIgi0J9u52/8bnkM1yrvS9uZZcnSgbK4eAgpHhkY8uHAojQGt/jL/ajDbKi
         aQVLWJmW4E/39lnjOx3GPfCknqYCeD+TofYUzgoK+yBVi8FzZc2s76US58fsqaO2AwSR
         RaXnzpmXtFUWoPpI0U98S+B6dYDZ5tWCWor5Z//1rmRcW3PS+sgwvdZzArvh8bN1e37E
         lFSI2b1q8OXzDDAeUZ0pZjmRGzfX6K39tW1wm1NJq1B2ZrlT9uVyoUMaV/l1s5MFTMMJ
         iR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nB0sqPZdl7dQLoXl7ubMEUx/Fs5H1HyujTYlOBisxFw=;
        b=SV2WY32IKng6uxWxp1zp8H0QO8JsNZM5iHhCAc7BjVSDK7BMWgjzXilV+1wCrCKBKY
         xdoNRVvbquYwXYcesJsrIuUjdaD5UDYDyqn7zUhE0Ey6IQy0O+QhKkkvcMPZM8W6KZvo
         EdgL4XdKvpLjWiNlO81EFJtx8qFbpusJrpTuBjP5xhPpVbpIu2DmXUvRjG/O9hHwA5NL
         H6LFZw23n0hPp4+Aq3Q2A7VMgDaLjmCc8Ruyhnapi+5nVOuPCh0tU3heP7dZHJ/HvWpy
         vWst+etFp3K8iHbFetqQplhawgqej6aFpOBp+l5aQ7xl6OhDVbPWFo1w45Q4HMpcnwwg
         NcuQ==
X-Gm-Message-State: AOAM531UbxlGxNXYsnnrXmUUHmWXu73e4wtgvIKES5zCcUQW1UEq41Fd
        DvVnbA5g8oFchb6YCYPfuFTyAeAb276l/mqLIWY=
X-Google-Smtp-Source: ABdhPJwLUWp9h2RgHmnYgvG6nAKpZckkeYcM9u4+qoAUdVIw1MKwoRmYok6qE1X+JE0iF7PSBR6qtULvVKQcTNTZYNg=
X-Received: by 2002:a1c:80cb:: with SMTP id b194mr3585107wmd.73.1605288733517;
 Fri, 13 Nov 2020 09:32:13 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org> <20201113134938.4004947-32-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-32-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 13 Nov 2020 12:32:02 -0500
Message-ID: <CADnq5_NrurURuTvTHF-94EOy2kwmd1mgmY6tF2BN-ywVqH73ag@mail.gmail.com>
Subject: Re: [PATCH 31/40] drm/amd/amdgpu/amdgpu_vm_sdma: Fix
 'amdgpu_vm_sdma_prepare()'s doc-rot
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c:63: warning: Function parame=
ter or member 'resv' not described in 'amdgpu_vm_sdma_prepare'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c:63: warning: Function parame=
ter or member 'sync_mode' not described in 'amdgpu_vm_sdma_prepare'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c:63: warning: Excess function=
 parameter 'owner' description in 'amdgpu_vm_sdma_prepare'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c:63: warning: Excess function=
 parameter 'exclusive' description in 'amdgpu_vm_sdma_prepare'
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_vm_sdma.c
> index db790574dc2e8..a83a646759c58 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> @@ -51,8 +51,8 @@ static int amdgpu_vm_sdma_map_table(struct amdgpu_bo *t=
able)
>   * amdgpu_vm_sdma_prepare - prepare SDMA command submission
>   *
>   * @p: see amdgpu_vm_update_params definition
> - * @owner: owner we need to sync to
> - * @exclusive: exclusive move fence we need to sync to
> + * @resv: reservation object with embedded fence
> + * @sync_mode: synchronization mode
>   *
>   * Returns:
>   * Negativ errno, 0 for success.
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
