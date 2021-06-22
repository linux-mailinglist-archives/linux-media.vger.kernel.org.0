Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB943B0CBC
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 20:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhFVSWZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 14:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhFVSWY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 14:22:24 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABEA5C061574
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 11:20:08 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id u11so393859oiv.1
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 11:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=29hikt8SUCNhjVnea4G3Tt6U2VKimPI9xOdyygn6y2o=;
        b=CZ9m2GCYl3/yRI7h1IWxxp6TOejM4xOmGC4KpzjeYdz81AHrXtUWyI89o0oJoZEqEO
         4M0lSdJJLM09L8Iu+QVRYMyvzCwO277e5L2CFRffawfY7hti2B+l01moMiqeK6VYIfMy
         xipBv2IcBYtsXCTXc4P0t6+b9PbMayyeC9h/Rtow4aXXkqlqUHIsJZ5rbH2IHoG0qNTV
         3i1Lg5Ep7aavjIc1coARhze9+h/4cP9P7IJTVr7PgXluFZ0cvGNPeb60iQu98O5T86PA
         wOUsSWE71SOtJEbFESRfEOs+Vh5hNmKwQjMMRE0HdP2wXKTosk4iXMis11i+oxQslA66
         dv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=29hikt8SUCNhjVnea4G3Tt6U2VKimPI9xOdyygn6y2o=;
        b=RZSfK/4ZwAmCrKUYwgSlbvFvQCAewtanEoeYZ/NO3PQQGEwyl/VL6lfWyip1fQO7kE
         1nIZA0SYqnRlwdmr4rUTWLIrD+CuDbdLfcBEnMh+oHjTYyVsoexoNnKJgs/4neFG5pkY
         rXRpzceT4Ai0UUbd8pu2ShRYYKCeX52TYeg/luOENgf0kSgw7VRxl126vdQulcZcx9i3
         lB3tu1+ALTbNEQ0xwJD+Hky/KQOvdtIV6c8ovAOdJ92UnN6Zu+CVjaGlh0feI0PL9FOp
         YN/Og/YMcyTLoAD7lP3e5CWIbRyqIZyS/n24h/lQ2gnF3jbcRIzF5fyYRiIZLQ8SwSq0
         EjJw==
X-Gm-Message-State: AOAM530RuxtKgzTlIbQVG12/iLJIayn+Woq+ytKxUmJ4H14fH9pY0ifb
        RbJ0IC+5/xnjglRFPd7b+FKoXhXFn/yVyDN6Vwk=
X-Google-Smtp-Source: ABdhPJyUgVQFlY0rBQR5TacbcyoHIMybYd5BiSysGFReHN0iSspTqQlRZ1YcySHqv8KLv5Rmbaa0C9Yyyx8ixm9qE9w=
X-Received: by 2002:a05:6808:c3:: with SMTP id t3mr71122oic.5.1624386008138;
 Tue, 22 Jun 2021 11:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch> <20210622165511.3169559-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20210622165511.3169559-2-daniel.vetter@ffwll.ch>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 22 Jun 2021 14:19:56 -0400
Message-ID: <CADnq5_N00p5VSqj3gEkFSEALOU2qbD=WkHMpsW0saz9iG_RZnA@mail.gmail.com>
Subject: Re: [PATCH 01/15] dma-resv: Fix kerneldoc
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 22, 2021 at 12:55 PM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:
>
> Oversight from
>
> commit 6edbd6abb783d54f6ac4c3ed5cd9e50cff6c15e9
> Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> Date:   Mon May 10 16:14:09 2021 +0200
>
>     dma-buf: rename and cleanup dma_resv_get_excl v3
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  include/linux/dma-resv.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 562b885cf9c3..e1ca2080a1ff 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -212,7 +212,7 @@ static inline void dma_resv_unlock(struct dma_resv *o=
bj)
>  }
>
>  /**
> - * dma_resv_exclusive - return the object's exclusive fence
> + * dma_resv_excl_fence - return the object's exclusive fence
>   * @obj: the reservation object
>   *
>   * Returns the exclusive fence (if any). Caller must either hold the obj=
ects
> --
> 2.32.0.rc2
>
