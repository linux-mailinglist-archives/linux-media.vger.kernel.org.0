Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD60C2AE484
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 00:58:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732052AbgKJX6J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 18:58:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbgKJX6J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 18:58:09 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB4D7C0613D1;
        Tue, 10 Nov 2020 15:58:07 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id 19so208275wmf.1;
        Tue, 10 Nov 2020 15:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sVHw44prgkhLl+wZoJDl9y1Sv84cjPWTxQBG3axW3YI=;
        b=Fgj/gQYKkyen7e5H6J7aIP6pfShNXewwImkCyWp5IXS9p6js8HtD5W/sdec1EctQ00
         5WN5HYbtFQqBafMliHQcbEaJ5G66ajncFFRYTrverGRb9lI763sgcJatSONy2h0alv/o
         DYAZ6dqOdCUYl7iyaxpVFHrV2EVAm6hc4QAplBckBzTV5ZFHYO7maZeikWJCNlB9Y/EY
         6BgucQPZOdHYc7N29acSZMaYUbOR6qMNBNTv7ZJskbiB8AmOmQUDcvORYf4PKv2b4Kmm
         PTDx56GqMRaiwmZnPs5P7/bNw7fKYjDdNq+D1QAXUTIAJkKU+Dhyn5BxtsamN+cgl1jH
         QeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sVHw44prgkhLl+wZoJDl9y1Sv84cjPWTxQBG3axW3YI=;
        b=kbVqWHdODY+X7DxW1yDZrAR63Vm8mLnkKbFP2IYD5BXo02soSU1z0YCYMX7JhA6s59
         g9QNXs8KX+BOW6kOFqUoqaGWLpQl2UECpjD0EdAqiQq4/4icDHsAWWq0es7zG2/dcGG6
         jbSbqgVF6T3uX0Mm1iYVSvqjnF6fco8HNfrFEJ/pMxEJR6HPbSXrS7ur/8Fpcz9bBqWB
         fOGU60DIDAuT6fCflRV57Wn4WD4QWJKxDP7INTrAEKurbYj1zy13z8AGJLu0iols4DC1
         ZCHHNBfoBhQrxYcGG0GdpD1IIL+InQmWr0nxWkYBG2DKy+qHWcpqfHpdsMf3f81cSUkf
         6Mlw==
X-Gm-Message-State: AOAM531IC3S89Wj6PDu3s8Gfa37uk48Qsq+kn/6wR8IeDWzgK9xJ8ELt
        JscFBb+OkDJMk2yOwNxoBZb6k56h5qMUC3K2Cpk=
X-Google-Smtp-Source: ABdhPJwGVm8zxKOpbuvLzIOHTQhYo2DrNr+mXrvd1xPnYkBEHOZz9oYFfEfo+lAFTQEnLFs0aW5uGXu88lIbYUyf+QQ=
X-Received: by 2002:a7b:c157:: with SMTP id z23mr639254wmi.70.1605052686774;
 Tue, 10 Nov 2020 15:58:06 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org> <20201110193112.988999-15-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-15-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 10 Nov 2020 18:57:55 -0500
Message-ID: <CADnq5_M28RPCQR27JXOiugvPPfHh2CnCedVFmBfkMb3kZ8RzzA@mail.gmail.com>
Subject: Re: [PATCH 14/30] drm/radeon/evergreen_dma: Fix doc-rot of function
 parameter 'resv'
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

On Tue, Nov 10, 2020 at 2:31 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/evergreen_dma.c:112: warning: Function parameter =
or member 'resv' not described in 'evergreen_copy_dma'
>  drivers/gpu/drm/radeon/evergreen_dma.c:112: warning: Excess function par=
ameter 'fence' description in 'evergreen_copy_dma'
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
>  drivers/gpu/drm/radeon/evergreen_dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/evergreen_dma.c b/drivers/gpu/drm/rad=
eon/evergreen_dma.c
> index a46ee6c2099dd..767857d4a8c5c 100644
> --- a/drivers/gpu/drm/radeon/evergreen_dma.c
> +++ b/drivers/gpu/drm/radeon/evergreen_dma.c
> @@ -98,7 +98,7 @@ void evergreen_dma_ring_ib_execute(struct radeon_device=
 *rdev,
>   * @src_offset: src GPU address
>   * @dst_offset: dst GPU address
>   * @num_gpu_pages: number of GPU pages to xfer
> - * @fence: radeon fence object
> + * @resv: reservation object with embedded fence
>   *
>   * Copy GPU paging using the DMA engine (evergreen-cayman).
>   * Used by the radeon ttm implementation to move pages if
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
