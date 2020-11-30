Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCBE2C9150
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 23:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387933AbgK3WlG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 17:41:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387581AbgK3WlG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 17:41:06 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF2E4C0613CF;
        Mon, 30 Nov 2020 14:40:25 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id t18so4516495otk.2;
        Mon, 30 Nov 2020 14:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=50JdvhZ42NrkUvTPJM76VPGoZpSHnY0FKQ/KiUd0NKg=;
        b=aL7d5kpJbAboGQNZ4erj7W+womhuvoI98UQJ1ed4u6FmgdDJufOBQD3kN340AIk7JR
         rnvcGGp4doHd5lKfHWSmIQ2Y3vCbKEbwZOUFcqbybgnUmo+/t4RW2e8yDssGnKvh40PI
         ZH2ltkRcyA49Mizhc+PEJti8VqmGgppnvTX+HuEy89mshrnTyibGa/SQaDF4SwykrBZb
         DoyJE8qtaDCkID1oed9BXs3SUrBRveNG9t9cwBvwouI5WOmJ2uknHHc+HLwt8/cuhXSO
         omXhynPZxSoZ5C4+f9D1oBFC1EBTwicqvAsPlcMq4hIESED7foIBFNR4qQTBhHEOLqBq
         8PrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=50JdvhZ42NrkUvTPJM76VPGoZpSHnY0FKQ/KiUd0NKg=;
        b=rfJIjT8aF9R1XaNb4jHmNtf+zXnJmVvXj6ydOuKO/un+svNBnCYOJX//lRBCjCmEFy
         AT69t3w5tY+bO5bCJbAIxAnI5vxPTXiWoQX/B9asji2oufPtLNADTfrmSG/VTfT7ATp5
         b0QvhR2g9tp3oYZXU2GNiMWicP3c8OWqQbbiLZdDdCK/XkU3lGEdJDDOM5Wa2v9w7FZd
         PR4Z/w1otZnyoIEXBGa+390LvhC1juWAAhQrgVSVRxdAOkPH7IRBqTyxRGcGUp1Liocb
         p8OegjuOVD4yzApsDjBgx5kcdRU9FYQgWHn1PwDDZNoLPm07zbcCW7dP5A/cn8415BCo
         4pWg==
X-Gm-Message-State: AOAM531rtH+6Je44H2ie40tjD38vODzIfugJ0bhMcvCWkvVHlOwehs7x
        RVKiyXU30VQkNpOUOaHkeC0Dk8RB6L7YcHxW+xY=
X-Google-Smtp-Source: ABdhPJybFFuoCAgH8TDXZA9Ucz4zcLBH+CqhSKIXJXxKqxiielOTa50ygJxobWvmg3HDZpE2zPcFWuvtyL0Utu+x5Xg=
X-Received: by 2002:a9d:4713:: with SMTP id a19mr19235858otf.132.1606776025441;
 Mon, 30 Nov 2020 14:40:25 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org> <20201124193824.1118741-29-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-29-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 30 Nov 2020 17:40:14 -0500
Message-ID: <CADnq5_MD6fpoQCvWYiXbhvCCwGKfJobUXfXLkTRo+pZN3XJViA@mail.gmail.com>
Subject: Re: [PATCH 28/40] drm/amd/amdgpu/gfx_v10_0: Make local function
 'gfx_v10_0_rlc_stop()' static
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

On Tue, Nov 24, 2020 at 2:45 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:5008:6: warning: no previous prot=
otype for =E2=80=98gfx_v10_0_rlc_stop=E2=80=99 [-Wmissing-prototypes]
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
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/gfx_v10_0.c
> index d4760f4e269a1..9eb886ae5a35e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -5005,7 +5005,7 @@ static int gfx_v10_0_init_csb(struct amdgpu_device =
*adev)
>         return 0;
>  }
>
> -void gfx_v10_0_rlc_stop(struct amdgpu_device *adev)
> +static void gfx_v10_0_rlc_stop(struct amdgpu_device *adev)
>  {
>         u32 tmp =3D RREG32_SOC15(GC, 0, mmRLC_CNTL);
>
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
