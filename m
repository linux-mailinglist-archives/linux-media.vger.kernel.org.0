Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1270538B75B
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238797AbhETTW0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238137AbhETTWX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:22:23 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F593C061761;
        Thu, 20 May 2021 12:21:01 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id v13-20020a4ac00d0000b029020b43b918eeso4034879oop.9;
        Thu, 20 May 2021 12:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jFT2vUjneyK4vqRQTSud440oIlDIOlBm9ntEGOINv5Y=;
        b=D/khYlkLs8eViqkgfzspKIJORMK1dqfOo1QORFPm78nkMtTSIa1UQj6LQt0fIE6ssK
         O9lGaXHlOXL0EV3fv5Y7a3jr8Zi4S3yLbWxTmBOLNyY0PZvYryPpLCycq/h5tkzT2HuY
         3jV0KhJ1nlMefUkBn7EhcQ3JcPl/mvqQg2LfwO2IHXEmlwsyszD2SCOp6Oxpo90sUv48
         07FSiNdFZFri7Qmk2zpc9QYfYxH+jElnevL3fMYQsO5uiR4P7O5gYqgVfynSMG3iWNAI
         ffhBH8v2gU5bqy03nFTAr4jH8Vf9/R3ruvrIfz59jVqo0gHklxN+Pv9gT1P4hByy4TNd
         rnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jFT2vUjneyK4vqRQTSud440oIlDIOlBm9ntEGOINv5Y=;
        b=qOmp2k0F/HdQUbiuJMeZ5ZRGHlA9A55GTGEIKbmI6wYUfQbSqakNdOjvxnK8TWKkQP
         MJMskvgBDkeotK/CaOmVzuT1L6+lg59G6SUcfmfmh4FV1C+B9jd8eFiylP0jGLAtXUoQ
         nn2h9C4D4EwiBzvuVyrve2mGe9y2lY3x2lfzUeww+xnCKYWukafq0w6YKP5N5O/6rdyu
         PgSFevtM8lUKr7/kpwu63L8fz/ZCqV4ZFmYj5XkPRQK4OF1Himv+EMUza7JJk3a1MBJW
         N9DvcjDlX9vpA8btYTcA6GCeVN5ZRH+1PWJ+ZA7m4KIUPlY5URzTJPSb33xmfU3lJF81
         E6iQ==
X-Gm-Message-State: AOAM531u0c3XNfrE6zPkb2+SUnqDiMouVLp2ZDjRUcnpFNOQ+M6irwXy
        PughOFPYyDBT9MYq/AZ8ZQvmJDG5hfXGnoBVM8U=
X-Google-Smtp-Source: ABdhPJwJQXId/bdVgc0jHCEOn9JarUKc13A1Cej/AgWqhMN32NoS8pW18t/ZaSTqNE9XaYPco1cgGarYCI/JzluP2as=
X-Received: by 2002:a4a:d543:: with SMTP id q3mr4945275oos.72.1621538460855;
 Thu, 20 May 2021 12:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org> <20210520120248.3464013-30-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-30-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 20 May 2021 15:20:49 -0400
Message-ID: <CADnq5_PjnKC8qRMY7+TGfi2mpOXpiF-0bkm6VfB9+aqgi3bWmA@mail.gmail.com>
Subject: Re: [PATCH 29/38] drm/radeon/r100: Realign doc header with function 'r100_cs_packet_parse_vline()'
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
>  drivers/gpu/drm/radeon/r100.c:1423: warning: expecting prototype for r10=
0_cs_packet_next_vline(). Prototype was for r100_cs_packet_parse_vline() in=
stead
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
>  drivers/gpu/drm/radeon/r100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.=
c
> index fcfcaec25a9ef..3c4e7c15fd159 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -1406,7 +1406,7 @@ int r100_cs_parse_packet0(struct radeon_cs_parser *=
p,
>  }
>
>  /**
> - * r100_cs_packet_next_vline() - parse userspace VLINE packet
> + * r100_cs_packet_parse_vline() - parse userspace VLINE packet
>   * @p:         parser structure holding parsing context.
>   *
>   * Userspace sends a special sequence for VLINE waits.
> --
> 2.31.1
>
