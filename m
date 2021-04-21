Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895B53662BE
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 02:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234555AbhDUABO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 20:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234508AbhDUABN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 20:01:13 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85DF7C06174A;
        Tue, 20 Apr 2021 17:00:40 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id e89-20020a9d01e20000b0290294134181aeso11647627ote.5;
        Tue, 20 Apr 2021 17:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e9+TAg/KoUWsa99Vc8OUos6cMxUG+phWDsMLGP3+C+w=;
        b=H9I6YTdW5X1jB4Ak+0cUKMmHDwNhdEcX7fpaedlJtz6o7jWjDXjvWZyFSRPp+0VEGx
         oV30KOct5TLMbE9r0AFi65mzT6zN4Bzucjoq2VMoGRKFj8G+SZwP8y/ApnTefuEGRJTb
         6Pn/X0WcDjTwHblpnCnlrjX/KwQSU13CRlMJsSUF8sFC2LBpbUQi7lr2A4laUert7ldP
         FQlOzSKn7egjwiwWMn1allUdiJysakqI2FyxQYAvNDk5sFuBqsqNMafU9uqA2yKspoav
         O1Yi8bmuylSp0YUt5VuHjEjH/NfLkPIndJTUmChrghxRsNHsFTghgvK1ot8pq2hl7diF
         EPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e9+TAg/KoUWsa99Vc8OUos6cMxUG+phWDsMLGP3+C+w=;
        b=ISc5/+Pdu485Wq41Md/8buDyDDnvt38gWC+24artm672hfvxrJ3WNIchVqaxR3caVf
         S9IM+xFSK+UsdYfFPW2FqySZb7J5rrwXAeP87NtB9bF50Zw23sGC/En8T/n5YTpp1+qQ
         TM3zcvZUh0mxgGFad8qE5yGyHdc9pEgLZzGjK7KB5+O1vPmbd2vNWEgittSa4sKxbIcY
         PlfWM+qQ+bMFEpd/2IHjeg0/nOt9ksVFzflGAw5IAd7GtKFWbKTF1jjyCaJ2SaD7QWkz
         AuH6GnI5Sl2/3Yb7mLZ+ZN3fHJ8/jWTb7lzdshZ4lQcIFGDN822DbDAi+jjs484praeU
         cNJg==
X-Gm-Message-State: AOAM5336kueUTbayzyJaGgJ9z66/zmh/eERoVQ8SHmkmw8RRsZWqgkhc
        vXzbf/djWcKMTIvJq1DpwmA5oYEq+KMjB9CwLE4=
X-Google-Smtp-Source: ABdhPJymGN8we/4AVICoWFYllwCiQQt06X+J/UkA1Epkav0/XCuFSaiNnmHrehyuBajDCyPXswh2i+Wd9a8SJ9lTrgw=
X-Received: by 2002:a05:6830:1f12:: with SMTP id u18mr14249635otg.132.1618963240005;
 Tue, 20 Apr 2021 17:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-33-lee.jones@linaro.org> <eecd70a6-eb05-ea13-e9ca-c0d989f2210b@amd.com>
In-Reply-To: <eecd70a6-eb05-ea13-e9ca-c0d989f2210b@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 20 Apr 2021 20:00:29 -0400
Message-ID: <CADnq5_MqY6qcv97vncaLX_a0r_JBDTxrfkw=cAcHFXH10QEL0A@mail.gmail.com>
Subject: Re: [PATCH 32/40] drm/amd/amdgpu/amdgpu_ttm: Fix incorrectly
 documented function 'amdgpu_ttm_copy_mem_to_mem()'
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Lee Jones <lee.jones@linaro.org>, David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Jerome Glisse <glisse@freedesktop.org>,
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

On Fri, Apr 16, 2021 at 11:53 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 16.04.21 um 16:37 schrieb Lee Jones:
> > Fixes the following W=3D1 kernel build warning(s):
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:311: warning: expecting proto=
type for amdgpu_copy_ttm_mem_to_mem(). Prototype was for amdgpu_ttm_copy_me=
m_to_mem() instead
> >
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Jerome Glisse <glisse@freedesktop.org>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> > index 3bef0432cac2f..859314c0d6a39 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -288,7 +288,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_=
object *bo,
> >   }
> >
> >   /**
> > - * amdgpu_copy_ttm_mem_to_mem - Helper function for copy
> > + * amdgpu_ttm_copy_mem_to_mem - Helper function for copy
> >    * @adev: amdgpu device
> >    * @src: buffer/address where to read from
> >    * @dst: buffer/address where to write to
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
