Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0045538B6FA
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237341AbhETTQJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237676AbhETTQF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:16:05 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB543C06138E;
        Thu, 20 May 2021 12:14:38 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id v19-20020a0568301413b0290304f00e3d88so15835231otp.4;
        Thu, 20 May 2021 12:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CFznQ5UzwVzYSrYk++bKt7INj01icNDyVEHe4lOS4xc=;
        b=oE4NN5AjJr7IrcZo1Es/vlSqvlT754NfJM7Mfc3xB6CSK7ll+/YvAtbQ2mR8AmC2BT
         sqS5dDVeSrEVWayFMSVJDASe9FKfS/Wr+qazoBbhp1Mr5/3hGxEj3m4HbdwTGxSA57TV
         tsUkAfXtKbZiSLaKd7b6iQvIx1PLbFfsvdI70eiZVuoimjccc7Oj24jOCjMZq8sDyO2X
         Gv0+5ths4rebFvxoKAo+njIxd/9sGHIKha8J/mMF2dIP6p44evYd0zbysZmm2eSWaG0V
         O5f+2Aw+n+upOXSmQcSvJZizKUNdhUyUqPutN+1XKRyxG3dHqSjSG6i6PLNAiQvAa5GA
         WMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CFznQ5UzwVzYSrYk++bKt7INj01icNDyVEHe4lOS4xc=;
        b=LGKyZoLRfYbFhIBrPGHw8Uo5R5S/zIWqfXfoYMAjBPUnSslbKhVTiA5cQTUryclztX
         QX/CKgAMl6tPnW8NFfLnAteD9TN5wPX7DAJ3j0lnG008NgRq+Q1DSkDjYJfHGHP/yi0T
         9PE2rzGAp4VgXmqX5pFCh1BMq1Vc3KXtQYJ/1KkhPgkF+qvpQsEBDI94A4HN7jPH/KZQ
         0M93+VF2EcRUzAPIsu7AkNL9/7QvKzB2Xnh81Mi/JxRlabIUh5HSjLeJaR+DLBFM1cKE
         DmGl5bQjT1VNahbYuHePFcB+h6QIPXI80UcVr2IQqe5vgam/jBgd5fGLKwYRNkUxtV77
         st9w==
X-Gm-Message-State: AOAM530jE5SbXtkqfkDdhikkQPwWKedZejOyMbfoGce/qJwnQvAMflxI
        U+pgAW0G5XBCEg6EDMW3gKGfFB8kRF6zbHOunMw=
X-Google-Smtp-Source: ABdhPJx25eh9IbEMpsnOwMHXas2EpZVFTY5iQRIyfyjEiHJt8Xqx1LcdVt3ezxRqHGRJRlAfp7MTX+b2xOf6Ptl94Fg=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr5103104oti.23.1621538078199;
 Thu, 20 May 2021 12:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org> <20210520120248.3464013-17-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-17-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 20 May 2021 15:14:27 -0400
Message-ID: <CADnq5_MXLwMR7XsEiu1pAJ9d8cm6uHA7S4jtuqf-9z=kHbuMww@mail.gmail.com>
Subject: Re: [PATCH 16/38] drm/amd/amdgpu/si_dma: Fix some function name disparity
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

Alex

On Thu, May 20, 2021 at 8:04 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:320: warning: expecting prototype fo=
r cik_dma_vm_copy_pte(). Prototype was for si_dma_vm_copy_pte() instead
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:412: warning: expecting prototype fo=
r si_dma_pad_ib(). Prototype was for si_dma_ring_pad_ib() instead
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:425: warning: expecting prototype fo=
r cik_sdma_ring_emit_pipeline_sync(). Prototype was for si_dma_ring_emit_pi=
peline_sync() instead
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
>  drivers/gpu/drm/amd/amdgpu/si_dma.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/am=
dgpu/si_dma.c
> index cb703e307238d..195b45bcb8ad9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> @@ -305,7 +305,7 @@ static int si_dma_ring_test_ib(struct amdgpu_ring *ri=
ng, long timeout)
>  }
>
>  /**
> - * cik_dma_vm_copy_pte - update PTEs by copying them from the GART
> + * si_dma_vm_copy_pte - update PTEs by copying them from the GART
>   *
>   * @ib: indirect buffer to fill with commands
>   * @pe: addr of the page entry
> @@ -402,7 +402,7 @@ static void si_dma_vm_set_pte_pde(struct amdgpu_ib *i=
b,
>  }
>
>  /**
> - * si_dma_pad_ib - pad the IB to the required number of dw
> + * si_dma_ring_pad_ib - pad the IB to the required number of dw
>   *
>   * @ring: amdgpu_ring pointer
>   * @ib: indirect buffer to fill with padding
> @@ -415,7 +415,7 @@ static void si_dma_ring_pad_ib(struct amdgpu_ring *ri=
ng, struct amdgpu_ib *ib)
>  }
>
>  /**
> - * cik_sdma_ring_emit_pipeline_sync - sync the pipeline
> + * si_dma_ring_emit_pipeline_sync - sync the pipeline
>   *
>   * @ring: amdgpu_ring pointer
>   *
> --
> 2.31.1
>
