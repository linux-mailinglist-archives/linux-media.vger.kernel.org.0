Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A86C038B774
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235978AbhETTZ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234133AbhETTZ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:25:28 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC39EC061574;
        Thu, 20 May 2021 12:24:05 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so15838432oth.8;
        Thu, 20 May 2021 12:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uDEsiQtbchmRIITN3UCJ9tWbvJK1S8JafoWC9Tf39fo=;
        b=cT527s+sufXiRjfevP2Z86/uo3kcGD/J3zfs21rZAvE9FxI/yXy4JxlWbMvo3xV8nw
         31J9i5dKdSOAY8W5i7n7sVEz/f45QGFodvdQ2PgvkF1O64CrRQ3LuSf7N8zMu4nU5bmd
         dPksVTTUuwMI9AaXqhPaWyFaaf/U5KkmA2c/sKtwJB3uQDoYEKf39Oq4ks//qmm7Bg3M
         mzcyotkXXBQBsJDlz72MxszK2dLyM+zdIfVTREUOyfRIEoYKUV991fUHX6XB2gD8qVpp
         s3EIUQpeY3jMSwMKdj5lwwbAgFDIq3vwDq8hYHKLM14ibVCSYstqzQKIFjZYvWLxL0Qk
         Wi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uDEsiQtbchmRIITN3UCJ9tWbvJK1S8JafoWC9Tf39fo=;
        b=MUh5GLbvKmGfwyWcISompBmPlz6Qj2LkbzfhWKYGzNzY03qipXBncz6CBfignP4wnV
         0Dgt9IRFXTU5HLNEURy8BQSj/nseXhUasOIUScnJCxsTcui2birK8CPFocsP3gBZj0Hn
         KZRU/X4sq+kMVqDiiPzCWYTtq7VOm403yf4jN9dDvXMhyAKSTrDpvrs19LrRtdwa22Mx
         LWEPa/vgrXa7TvsUZ5jVofXFgTEAPXMtget0jLA2VTxyMyRiLTznlxz+QZMdpgr5BA9G
         DpDY2NPKnAyL8C9W7A08qDGUbeXkntUwdAPWxBsoFYjqAY+TG2rriY1q+9x9Sxf2xZ+m
         SrbQ==
X-Gm-Message-State: AOAM531+9HlATl1arZHUeC/9HHju7JGAv7Uxca+43S3bM7Z5CSpnzOsg
        4u4A4GS26THNvmXJkwnv3RyKpEG5+j7zhFf1ATs=
X-Google-Smtp-Source: ABdhPJyzye1K6JHvOg90QPOZBsYe6gdLyPfrjFwT1au75ov5XHlqzFhSAKtHadiPVsL4JEI9JtvR32tUOIE95DLglKc=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr5126794oti.23.1621538645387;
 Thu, 20 May 2021 12:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org> <20210520120248.3464013-34-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-34-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 20 May 2021 15:23:54 -0400
Message-ID: <CADnq5_N-V0uGfGtwTQGhQrT+ex7jG0t3ipu4+EBxzAEq6m_Jug@mail.gmail.com>
Subject: Re: [PATCH 33/38] drm/amd/amdgpu/sdma_v5_0: Fix typo in function name
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

On Thu, May 20, 2021 at 8:04 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:563: warning: expecting prototype=
 for sdma_v_0_ctx_switch_enable(). Prototype was for sdma_v5_0_ctx_switch_e=
nable() instead
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
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v5_0.c
> index 75d7310f84392..2a2b9d50afb70 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> @@ -571,7 +571,7 @@ static void sdma_v5_0_rlc_stop(struct amdgpu_device *=
adev)
>  }
>
>  /**
> - * sdma_v_0_ctx_switch_enable - stop the async dma engines context switc=
h
> + * sdma_v5_0_ctx_switch_enable - stop the async dma engines context swit=
ch
>   *
>   * @adev: amdgpu_device pointer
>   * @enable: enable/disable the DMA MEs context switch.
> --
> 2.31.1
>
