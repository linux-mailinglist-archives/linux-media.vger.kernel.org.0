Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 113992C91F7
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 00:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729811AbgK3XEr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 18:04:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728733AbgK3XEr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 18:04:47 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 389BDC0613CF;
        Mon, 30 Nov 2020 15:04:07 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id y24so13038346otk.3;
        Mon, 30 Nov 2020 15:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/XTX3Z66O+BazeLjFxr+puLvZ6PetLfBClwP+q5Bj0g=;
        b=dg5LflkcwriHvH2MBB/bPLeZFTWXs2sjvPKbydqgr1egeiLh1E9dYIVQGb7dBukd11
         dfiz8U8PYmp2vPhsORB42k9TFvMpkFl6lLHbRbCAoWB4jet1fbQN7XiKkGfig+CYqan1
         TtnIKPjym1jlrZDh8ngNrL1SLdVkGK/DNDtd+pgChVLGY6/eBwE2Zbi1h2+Llh/UH+v+
         upUeixBTw87v+0qfjfA+pSaCpF3W8K4Rx+BY35fLDV17huqWtlSg7itqtEXWjc1xKyU2
         Vx4pfqNG4rbpu10LtWQM/isrYJhmtzB+MXe+v687Kr5VkaBfVuvZMmp4ENlwP/9xNrop
         Ov1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/XTX3Z66O+BazeLjFxr+puLvZ6PetLfBClwP+q5Bj0g=;
        b=RTmhl6bkIbujyhDyrs+fsWbD0KQ9LFHCUlecaXcnTlucKMDw3owm0xx8NT5kv/1t45
         2NOq6FXHiNUKoz3+qyhN15L7k1ToXFRf964jLeiKnD9sXFlCbUYNIay3EZEguRvsRHxo
         FPbmaBQZj6wmJ0l5ESoUug0pjPzsz/YzoV9F4Imfq4e95NwwkXkU0ccdICd7cn3aFEzM
         8LUAH765ej6Z29joejHpmE+jtmDknQbfluLe3VwjAeZ25URV3YWxm9KPNdR5Eg37ia32
         Yu7qHwbWawPzuJlKEYX9jKPK3y8VitOalPLRvdpx5o6lZi5tGRp6GYcr5vO43HZ1QCzZ
         3s3A==
X-Gm-Message-State: AOAM530WjGDZYvW8YsWJVzE4DpHMS1WmeGmqcOy9yfjgvypOz7bVx6eF
        XiBF4Y6qVVbozKNocdruILoeYkqxEDMxp/DyBzQuqf84
X-Google-Smtp-Source: ABdhPJzFEcs1LGYfXam7Brnq4I4Rmdbke/J7wWbeEuPhw0Yq74o/WHrC0htfeQw4Reicm+MX5kc+4IXl7vhIg4OzjLA=
X-Received: by 2002:a05:6830:22e4:: with SMTP id t4mr19122959otc.23.1606777445195;
 Mon, 30 Nov 2020 15:04:05 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org> <20201124193824.1118741-41-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-41-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 30 Nov 2020 18:03:53 -0500
Message-ID: <CADnq5_PwGBLKU5cZtrLH4BUep9AgzwRW9xwj+rakxC_FY9RuGw@mail.gmail.com>
Subject: Re: [PATCH 40/40] drm/amd/amdgpu/amdgpu_uvd: Add description for
 amdgpu_uvd_cs_msg_decode()'s 'buf_sizes' param
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:555: warning: Function parameter=
 or member 'buf_sizes' not described in 'amdgpu_uvd_cs_msg_decode'
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_uvd.c
> index f8f0384a8d9ad..7c5b60e534822 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -547,6 +547,7 @@ static int amdgpu_uvd_cs_pass1(struct amdgpu_uvd_cs_c=
tx *ctx)
>   *
>   * @adev: amdgpu_device pointer
>   * @msg: pointer to message structure
> + * @buf_sizes: placeholder to put the different buffer lengths
>   *
>   * Peek into the decode message and calculate the necessary buffer sizes=
.
>   */
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
