Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 111692B103E
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 22:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727245AbgKLV0i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 16:26:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgKLV0i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 16:26:38 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3DACC0613D1;
        Thu, 12 Nov 2020 13:26:37 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id r17so7567059wrw.1;
        Thu, 12 Nov 2020 13:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HziF5y2Ho33ipPGe8JAMvCvqv1ktqhXSvBiNR5cyKKo=;
        b=oP8LyXkztYBwHuxXBbqefGv8Wv5Fkb4Baq8EfEKsKe2PUk0Ltwt3L4hW18aV0JDyUL
         7G67vt3f5kB4hiR3wG/Wo+dsNIc2rlySaKnYnNM8RAfrG33fcGqgZNQSYiQdS8Mq+Kxo
         W4Sa11T2vGBy1D8MuHB+mBgFqRennqN9Ej6m3JIVKzGmfMv51XJ65nOXlALFIynTXN8L
         x2PtmDcc2RQ9TQX916x77GXA9v8fBaVPdJ6MIB/ZtHYlvRcY+HtmkhI52Pm8N4PYTb94
         FTuGobt/Y9fjLTtKwWosYliZTbteFvO25y4oyZBqGF3+83qXsilDEFjf353n+6WP+3UL
         Yuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HziF5y2Ho33ipPGe8JAMvCvqv1ktqhXSvBiNR5cyKKo=;
        b=f9JDRl6GlxygQhh2tvq81r5f9tXedb/JIlyL0EPeDj2QL9cdTTDKmAqaDWZQoKQtK7
         gI8ourOBO1Za2NNkzyqGcGZs5MgjkLj89tQne9z2AK4tHFPgFsE2LIEfaWWVyD5r/vud
         KXVs2hynEwDuIhwsplFfxWk8PO1DXj4BS4/woEaMHAHxME3suG2L7cTXpKB40sPwhqUd
         WA265vMM3MAyjkGlCYNsi32DE6LSRyS0lrZ1aNn6oM8jeoxhbwQC3MLNutty405IQawi
         QywneCtri0V0eeT83d0HRl2ZEUeNWDwVIp+AO9ZcQsYrWa9tUf/5ZOjwAZko1hOnY97X
         /gqg==
X-Gm-Message-State: AOAM532uyrYsUgNqgw4ojSrdXKJIJKq8bHu8DOLn3DlxkEcJGrxtQJ3d
        Z1rHnEGzkA0fQInGzHemtHuW6R7vbBVsTITeijo=
X-Google-Smtp-Source: ABdhPJxIB/Q0rdjTpnfspr2y90QDinSOTab3wfLFpbQI9qmynfR60kBK/QgPN53OHeJMMwYAI40XkoKskcEEG5Z2l60=
X-Received: by 2002:adf:804e:: with SMTP id 72mr1869161wrk.114.1605216396614;
 Thu, 12 Nov 2020 13:26:36 -0800 (PST)
MIME-Version: 1.0
References: <20201112190039.2785914-1-lee.jones@linaro.org> <20201112190039.2785914-16-lee.jones@linaro.org>
In-Reply-To: <20201112190039.2785914-16-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 12 Nov 2020 16:26:25 -0500
Message-ID: <CADnq5_OfR3KdoOrcBAiLtyqOi6kBkwkErZtRiBjo=zdAgb8hFQ@mail.gmail.com>
Subject: Re: [PATCH 15/30] drm/amd/amdgpu/amdgpu_display: Remove pointless header
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
        report to <xorg-driver-ati@lists.x.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 12, 2020 at 2:01 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> It seems only to repeat the function name.
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:450: warning: Function param=
eter or member 'amdgpu_connector' not described in 'amdgpu_display_ddc_prob=
e'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:450: warning: Function param=
eter or member 'use_aux' not described in 'amdgpu_display_ddc_probe'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: report to <xorg-driver-ati@lists.x.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_display.c
> index 0b134598b3a65..f4de4b41adcfd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -441,10 +441,6 @@ void amdgpu_display_print_display_setup(struct drm_d=
evice *dev)
>         drm_connector_list_iter_end(&iter);
>  }
>
> -/**
> - * amdgpu_display_ddc_probe
> - *
> - */
>  bool amdgpu_display_ddc_probe(struct amdgpu_connector *amdgpu_connector,
>                               bool use_aux)
>  {
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
