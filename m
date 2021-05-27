Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52B4639260F
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 06:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbhE0EWm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 00:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbhE0EWk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 00:22:40 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECFD7C061574;
        Wed, 26 May 2021 21:21:07 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id b25so3898145oic.0;
        Wed, 26 May 2021 21:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=g3ObGWoYw8A3770dDfoAtEJd60ASO6sSETw7hq7iaWw=;
        b=jOs3/1jJupOalzeebxv4XckU9+Uu9UMC/mX+6ifUQ46qaTC0M/5bL7tZkCX2UZYODu
         gjR2CFjIrySHfkeUdf+ZsLqMwxDhghv9UDS9xWD4ty/L+uvKlpL5QJj/3/4s5LSrQ9h7
         sFVXC2ofmcrknmIAPan0e+iYNqsedzQLW529FdHYzR4qTd8P4QgLA79XgLKjBzRTaeye
         aBKoFNWbmICiMVRKzbfHhPlzEEbcszXkGs06yOIDu3APuchNNjH+oNyK163+l3B054oD
         NcM7OTxUYYcXGsZJFF5U/Ei4n8382PwTqcEgQlnE3JQ96J57UyPGajV5tqIi0O8q2gLX
         Clsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=g3ObGWoYw8A3770dDfoAtEJd60ASO6sSETw7hq7iaWw=;
        b=UpuuZjhQ7ZBU+yuICAbH/JfryjxFPv+mMx8TXVIDq+5WSo/I4/131ETTcrG6Im2eae
         BtyXbLfWVwidR0HkDMZj0qifOpU1ypTVYshfwrJT1edELtC5L/MZonBl0zFSEtBe882k
         RcaJ6Fzo4c4FA6xqGINF+EeEiEHjdeoZLF/VrR9jI3hW/cyRl3yGO7FyQqvD9+ODY1w0
         hj0+c54CBdTgsDm2gPzxFbhX+5/HxOjrN1V6LWB+khJe9fTLZt3aNw2vLkkILsxqdRKA
         9cE/9t46rEYpKlkxfM5U4ci8SbhCSIS2Ucty2iFy+PLeHL5Vn2lp57fP/2Z3zGywGfuk
         W8iA==
X-Gm-Message-State: AOAM5306fNEi6bS4P88CTmsX4HvdgXxzsUiXXqXNAlngAlvpGvoMuQGN
        TPigbkrCg+rsv+hqSxCAc5i4BBHATa53uwJk9wM=
X-Google-Smtp-Source: ABdhPJyz5ycopmTnjB2ZTxePhB77r9FoMwpQJutSgFKAIAc3x1USuW/E9yoOdo9oKVskhKra+DE3aZI7rmCir48ptR0=
X-Received: by 2002:a05:6808:1592:: with SMTP id t18mr1068439oiw.123.1622089267401;
 Wed, 26 May 2021 21:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org> <20210526084726.552052-20-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-20-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 27 May 2021 00:20:56 -0400
Message-ID: <CADnq5_NzewQQNd_JvZVKWibzJKL9GEQp9VD0qUZ4KdhJAmgY-Q@mail.gmail.com>
Subject: Re: [PATCH 19/34] drm/amd/amdgpu/amdgpu_device: Make local function static
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

On Wed, May 26, 2021 at 4:48 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4624:6: warning: no previous =
prototype for =E2=80=98amdgpu_device_recheck_guilty_jobs=E2=80=99 [-Wmissin=
g-prototypes]
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 4a040f89ca5aa..f15e180762d2e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4692,7 +4692,7 @@ static int amdgpu_device_suspend_display_audio(stru=
ct amdgpu_device *adev)
>         return 0;
>  }
>
> -void amdgpu_device_recheck_guilty_jobs(
> +static void amdgpu_device_recheck_guilty_jobs(
>         struct amdgpu_device *adev, struct list_head *device_list_handle,
>         struct amdgpu_reset_context *reset_context)
>  {
> --
> 2.31.1
>
