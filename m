Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731A62AE47F
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 00:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732322AbgKJX4c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 18:56:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732120AbgKJX4c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 18:56:32 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D64EDC0613D1;
        Tue, 10 Nov 2020 15:56:31 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id j7so424274wrp.3;
        Tue, 10 Nov 2020 15:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WfB5Zmw3Ux9CKhPt9P+tELn8R3tbn83JjmD6s3cqA8Y=;
        b=c9GbbbX262i+//lwyN4ABDp41NxBzHGtWZq7nQyCdbooeI+usENJXE6Nz+cVyC05Cs
         qUC5+HAW2VUn6TxyQfhXa0ZdFtY4b8eyUTH2yDFGy/kqrNAZe2MXG6pg0c6viy7mmQDh
         x+ma6hb3dQyFRN6LiNBRorma69lXljTii322GH8cdgf9dKJF2ZKdV6j5Hfd5gkDSgiBs
         Y1vcKeqBk4NCoqK7jgjv/kF4MPoNsL3z7st3PabSApeMZKCAiM8Sr1TW3N7BQroGP3wn
         zUay39jqPsc2IglPSulSPBVHRrRpig9t0kNsshJh/WrxnxI4soTjwoKewH1GCjZRst3Z
         5jqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WfB5Zmw3Ux9CKhPt9P+tELn8R3tbn83JjmD6s3cqA8Y=;
        b=mvpH4cglvRvqt3A1eK3Yxx9Af2tY8nRk5bVKoahln5NIxTCqF9Nj7jD4CSv18cD5EL
         cTn6c3NZhqvXWLMsn8C9vwKJCt4IoU8xBLSc7eHpHC1IXQGGBJ5ivL0pquEVjCBj21qn
         w9QKxyF3NZ01eC2FbxaF8U07QF1JXQ0SSoKmQM8rCWTA/8GQmh40gqG+IE+7IffsZhNx
         stpgO/mm7lyVmplGLVZRkBFWf7AuC1SgKgD2OQ3ejtJd1XSZxjhdlqaq9thMI0OnH1NU
         B9767FTd7RjOI0FpU38Wd9dxEqbbYBiUJT0u8V9QJF5ruH7e2gA7DOPgymAv6tsnhbSZ
         QVYw==
X-Gm-Message-State: AOAM532g7rbNWPSTNXtkBDcl8sDLnuUqGHy507od41LVItgDLxsWeN6r
        2n9fdn0jNfNtx4wI80l1+TVZWzPwBvbFTMKKNHg=
X-Google-Smtp-Source: ABdhPJwsnW0y/kx7DL1j2p8r9N9uPNtVRi5fDJKmOzzqoro5WBcd2tHjiHixkDcYOyQM+BTSPEn2FX4iUDM/izxfwkM=
X-Received: by 2002:adf:f246:: with SMTP id b6mr26221425wrp.111.1605052590670;
 Tue, 10 Nov 2020 15:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org> <20201110193112.988999-16-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-16-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 10 Nov 2020 18:56:19 -0500
Message-ID: <CADnq5_Pq7ODBSwnjRQy8Hu1mTP+t9d8ofcO9KD0_89d9GpWpUQ@mail.gmail.com>
Subject: Re: [PATCH 15/30] drm/radeon/cik_sdma: Demote vague attempt at kernel-doc
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

On Tue, Nov 10, 2020 at 2:31 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/cik_sdma.c:949: warning: Function parameter or me=
mber 'ring' not described in 'cik_dma_vm_flush'
>  drivers/gpu/drm/radeon/cik_sdma.c:949: warning: Function parameter or me=
mber 'vm_id' not described in 'cik_dma_vm_flush'
>  drivers/gpu/drm/radeon/cik_sdma.c:949: warning: Function parameter or me=
mber 'pd_addr' not described in 'cik_dma_vm_flush'
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
>  drivers/gpu/drm/radeon/cik_sdma.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik_sdma.c b/drivers/gpu/drm/radeon/c=
ik_sdma.c
> index 68403e77756d3..3c709ebe8d1ab 100644
> --- a/drivers/gpu/drm/radeon/cik_sdma.c
> +++ b/drivers/gpu/drm/radeon/cik_sdma.c
> @@ -936,11 +936,9 @@ void cik_sdma_vm_pad_ib(struct radeon_ib *ib)
>                 ib->ptr[ib->length_dw++] =3D SDMA_PACKET(SDMA_OPCODE_NOP,=
 0, 0);
>  }
>
> -/**
> +/*
>   * cik_dma_vm_flush - cik vm flush using sDMA
>   *
> - * @rdev: radeon_device pointer
> - *
>   * Update the page table base and flush the VM TLB
>   * using sDMA (CIK).
>   */
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
