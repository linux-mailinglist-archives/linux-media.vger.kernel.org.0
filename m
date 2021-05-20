Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B553338B76A
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238404AbhETTYG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236520AbhETTYF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:24:05 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A84BDC061574;
        Thu, 20 May 2021 12:22:42 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id s24-20020a4aead80000b02901fec6deb28aso4033746ooh.11;
        Thu, 20 May 2021 12:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EjT7GiCfXinEXUQOvKuQzFUPIz+xSQbJvdKQn8o730Q=;
        b=J6JyotW8A4NEMe3rO8EdKpWc6K9L6dzZQkTX0VlmudWLmoDYuUe1tk0R8L7q1mX4TQ
         FBcSeqnfkGJfo8dGTyRhTqmwKd3RILGOJCAWKF/7IXWgtXAkDsJIq4r5/QCzxdnIXazc
         eDyMEcRlY7Yo+Uskm8PGaxYeX8xn69LQFccSZeUK15taQP5c68EwbFWncAUBDODaz7eR
         8VlbWsit1MeEyvAUdqCBsEX6hZ9zYNFaYuxZ4a02XOcsrTu5JULnfRVfn6WdEaOYFucY
         7TmeSo55tUz0A2Yr5aA932q8UN1XfomsuSFKtzX6EoMUVDzwgrPpgFud6yVdL+JBRIrw
         tvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EjT7GiCfXinEXUQOvKuQzFUPIz+xSQbJvdKQn8o730Q=;
        b=O+okwY2Fmlh3eP7Y5xLi8FZPIKeEQYYzVafqsUOER2PZnnpYpAn58ocr97lxwgRjyL
         sF1+Dzrk/DydD0+LslPLBUsNn4a+Wvm/+1ce1a9AjrQqOlIscWdxfLc2TsNj+8e/iO0v
         /P2BJx8j//TEgRs3CidXiJPdBy2qEqZkqpDOW9+EhVCxEF1wcvaDFjwOF9wBb83I9LJM
         xw/HUgRbhZ3zQpspWlNDk50ktAOjbgilMiwfuww9vyKjAROJIlJTgE/hi7wvMdc+ors/
         dg40soOoTLuPqcYcGa7nhRasuPq9dhkJtaZpxQBmSygonyGyORn5UODOmxlO1ZPvWVCR
         QoQA==
X-Gm-Message-State: AOAM530w7AGGxzjoq3HLZsOUnUSK1VV0ls+OAfYSBDKAMBYdBJpJX1kr
        HvI6lzyzMleRwQ4oRSaZdGjEss32l29ZF7FNrqM=
X-Google-Smtp-Source: ABdhPJy68VS+3Rrx6xIOPNbBqW0+PFwgP19t6GdE0mfrNGhJU9QeDmXfAw6Wqvfqhk5v26syXxUUfcLiuaYFjHe73Nw=
X-Received: by 2002:a4a:d543:: with SMTP id q3mr4949388oos.72.1621538562024;
 Thu, 20 May 2021 12:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org> <20210520120248.3464013-32-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-32-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 20 May 2021 15:22:30 -0400
Message-ID: <CADnq5_NMkxBTOe535wAjmpjT0VH2Xu4v6VRs0gn=Hp3g9y+sbA@mail.gmail.com>
Subject: Re: [PATCH 31/38] drm/amd/amdgpu/sdma_v2_4: Correct misnamed function 'sdma_v2_4_ring_emit_hdp_flush()'
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

Applied.  Thanks!

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:281: warning: expecting prototype=
 for sdma_v2_4_hdp_flush_ring_emit(). Prototype was for sdma_v2_4_ring_emit=
_hdp_flush() instead
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
> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v2_4.c
> index 9f0dda040ec88..4509bd4cce2d6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> @@ -271,7 +271,7 @@ static void sdma_v2_4_ring_emit_ib(struct amdgpu_ring=
 *ring,
>  }
>
>  /**
> - * sdma_v2_4_hdp_flush_ring_emit - emit an hdp flush on the DMA ring
> + * sdma_v2_4_ring_emit_hdp_flush - emit an hdp flush on the DMA ring
>   *
>   * @ring: amdgpu ring pointer
>   *
> --
> 2.31.1
>
