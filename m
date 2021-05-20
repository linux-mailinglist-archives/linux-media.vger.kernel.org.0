Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC1C38B6C5
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234228AbhETTLk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbhETTLi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:11:38 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3D8C061574;
        Thu, 20 May 2021 12:10:15 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id t10-20020a05683022eab0290304ed8bc759so15807679otc.12;
        Thu, 20 May 2021 12:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qZmqhErjNw9NpB4sTEi7TBGKOlHWpPlsaMkchqCd25U=;
        b=VUk9UBH/QcIR0qeCSyhDdMQ/L42ux4gncCKIrTFJFcDzd6FRRipqIKh8piNmD1KJnl
         kmHeFjswq2lFGSXDBDXUCEt1dLMwk6XSOgtK6Ax11cwQyipfUaJRO0Z6bHFj7Sf19SoB
         LJASG5MubLxCC7Dv0UYkWWlAwT1hTF6AFdkCqD5f/pSvAHyVWMELpLmJaV8XQZIv7eMZ
         n7Fw0Xpf1bwMUgAOMFuUhGe6cIyjjTMicraKgLuYtwvFkS0D8jNaRI0I40CCB527W60y
         ptF9CSJPC7NFp2kmV0GTbc2GoN1Qc2vNoo3XHRFV7uD2bnguZGzpNtbozHgPPM7XHbnx
         MmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qZmqhErjNw9NpB4sTEi7TBGKOlHWpPlsaMkchqCd25U=;
        b=arB/cNQY32gvhU+zPAEInLr7ZMB4wDQq4iUax6o57qb4Hd4YZ+C8nzeRnTZNlyO6ma
         /Nwce/Sh03RPZ1y4RqUtcNicDXoe/BWYtlCdB4xpYZGQXqeOlasqOz5JqbIzRrPsHeBV
         N3XlwtuZzs9/5wop62Zy0WFwyukq9pSWAG/sagcc8fb20y7w0nwZMhX8uQvBgolRGRfE
         w3WfPih4SqPvoynBKvYzXL0HPj2i8uQLq5ZvUmhd/rM46xLiWGE0twz7YPqdzHBrmMUm
         e3xmODHGKFregK2/kMKKhAoug6kF44KIpLN1+bSbJVdJQ54DPRDgdzAfOeh+tcm6Fp+R
         u2iw==
X-Gm-Message-State: AOAM533yATA0moqrxFA2DV3xyWjSwJZKHJsKSjtFHgllslkZY055+qRy
        NDWdmQi3NFUpNhYNY+U6oNpTxFDp+7tDs175bwXykPfC
X-Google-Smtp-Source: ABdhPJwMqj/CKQBdLb7dxshnqMhIbg//f1Ttg3En9FmwFe/Hdagzvy9jXwWeDIpGu4wupnXvU9vTUoBsQYzf0ZLnT+8=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr5119212otl.132.1621537814661;
 Thu, 20 May 2021 12:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org> <20210520120248.3464013-12-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-12-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 20 May 2021 15:10:03 -0400
Message-ID: <CADnq5_P1zF2Pw5BW54n+XEXyfNOLRnEvsk_zzZcz0TuanobubA@mail.gmail.com>
Subject: Re: [PATCH 11/38] drm/amd/amdgpu/amdgpu_debugfs: Fix a couple of
 misnamed functions
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

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1004: warning: expecting pro=
totype for amdgpu_debugfs_regs_gfxoff_write(). Prototype was for amdgpu_deb=
ugfs_gfxoff_write() instead
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1053: warning: expecting pro=
totype for amdgpu_debugfs_regs_gfxoff_status(). Prototype was for amdgpu_de=
bugfs_gfxoff_read() instead
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_debugfs.c
> index bcaf271b39bf5..a9bbb0034e1ec 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -990,7 +990,7 @@ static ssize_t amdgpu_debugfs_gpr_read(struct file *f=
, char __user *buf,
>  }
>
>  /**
> - * amdgpu_debugfs_regs_gfxoff_write - Enable/disable GFXOFF
> + * amdgpu_debugfs_gfxoff_write - Enable/disable GFXOFF
>   *
>   * @f: open file handle
>   * @buf: User buffer to write data from
> @@ -1041,7 +1041,7 @@ static ssize_t amdgpu_debugfs_gfxoff_write(struct f=
ile *f, const char __user *bu
>
>
>  /**
> - * amdgpu_debugfs_regs_gfxoff_status - read gfxoff status
> + * amdgpu_debugfs_gfxoff_read - read gfxoff status
>   *
>   * @f: open file handle
>   * @buf: User buffer to store read data in
> --
> 2.31.1
>
