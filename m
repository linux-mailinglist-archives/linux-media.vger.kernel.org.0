Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0F72B2247
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 18:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgKMR2A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 12:28:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgKMR14 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 12:27:56 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD184C0613D1;
        Fri, 13 Nov 2020 09:27:55 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id 23so10747066wrc.8;
        Fri, 13 Nov 2020 09:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Aoo3XC1xgkYP3AILMBs2qRa84a7jg1GfVsNZfCCxg90=;
        b=r4jQUyvQq8wNfbGuxU+JtPca5mypNLnmvOXEMwng+VCakuiFj8gz9iosMJm7gJUXqy
         3abfKQCGunVWsmPZBfSVR123NsiqQKdGql142pa6Q4+bWhT1ibLbEnuUQewH0dso5PBX
         0iJmYnEXsuw9wWmqvRSwbtEXzIsQjdzwOLhy/mx0lyVBUqaV6mujatZH6A8+HDKJfIr/
         BRl/FMeW0LHfufZhrwCaYEC3SEOfNOIkUd/vTr75+b1fnMEQc7LjnnKPTn7FsXCnK+5R
         fOxlnuZVM1nQ95LtjzaMUq/RCkw7YtmrNp8VboKMK49R+OYs/bZMBTDTI0aq/rxvFOn3
         UECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Aoo3XC1xgkYP3AILMBs2qRa84a7jg1GfVsNZfCCxg90=;
        b=HVYCjrfDO2rjTGf2CyZrU5yY9EvEro10afgc8OK9mLMtyiOcHwuSIOJfGrTv2BJygc
         sgY6Njc7UXmPdDVK4RbKqII+5Gico4qF+oaT7/zeFCWdD9AfJ4gm/X3u2nIdZS0sqDP2
         /8msIfF7a2uF79PFH17vgYFqdEsRIBdVlrOuy5XBk0+mm0RQ7jNSca/IgoEZRICfSKZ1
         cRb9bJuL7jC6TCLg8u8yWeBbVNFIZa4iB8oRgpo3lxzabQoGdEzHrTE/1NKY0G6P0DtK
         qdMi5UV0tPdMDdIDthMi4GscoOGe/n4rwPhU2k2deZFeEfrcSnzqlYi6JzcbbMUD0n4r
         7fgg==
X-Gm-Message-State: AOAM532kUaxjwFt8uOdeWlmEY1WSYQteMYjGL1++QeEh1kDAAOKezxx0
        B3j0fI5eLhPX8CGCD4tLoZnENwGrXN7HVIhzaRM=
X-Google-Smtp-Source: ABdhPJyU763L3HQHIS0PPLGIYKDLP9HCwyeqI8Bd+rjzwFY33/WRlgaDonxguETxNniMFVJGuSnI8DtIIg1RJPZiRng=
X-Received: by 2002:adf:8028:: with SMTP id 37mr4685613wrk.111.1605288469699;
 Fri, 13 Nov 2020 09:27:49 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org> <20201113134938.4004947-26-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-26-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 13 Nov 2020 12:27:38 -0500
Message-ID: <CADnq5_NN81LB=FiwRnALOV3PWZKjicZh93BaBEcO=D_E1wHn0w@mail.gmail.com>
Subject: Re: [PATCH 25/40] drm/amd/amdgpu/amdgpu_debugfs: Demote obvious abuse
 of kernel-doc formatting
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

On Fri, Nov 13, 2020 at 8:50 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:308: warning: Function param=
eter or member 'f' not described in 'amdgpu_debugfs_regs_read'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:308: warning: Function param=
eter or member 'buf' not described in 'amdgpu_debugfs_regs_read'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:308: warning: Function param=
eter or member 'size' not described in 'amdgpu_debugfs_regs_read'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:308: warning: Function param=
eter or member 'pos' not described in 'amdgpu_debugfs_regs_read'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:317: warning: Function param=
eter or member 'f' not described in 'amdgpu_debugfs_regs_write'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:317: warning: Function param=
eter or member 'buf' not described in 'amdgpu_debugfs_regs_write'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:317: warning: Function param=
eter or member 'size' not described in 'amdgpu_debugfs_regs_write'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:317: warning: Function param=
eter or member 'pos' not described in 'amdgpu_debugfs_regs_write'
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_debugfs.c
> index 5c1f3725c7410..a6667a2ca0db3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -300,7 +300,7 @@ static int  amdgpu_debugfs_process_reg_op(bool read, =
struct file *f,
>         return result;
>  }
>
> -/**
> +/*
>   * amdgpu_debugfs_regs_read - Callback for reading MMIO registers
>   */
>  static ssize_t amdgpu_debugfs_regs_read(struct file *f, char __user *buf=
,
> @@ -309,7 +309,7 @@ static ssize_t amdgpu_debugfs_regs_read(struct file *=
f, char __user *buf,
>         return amdgpu_debugfs_process_reg_op(true, f, buf, size, pos);
>  }
>
> -/**
> +/*
>   * amdgpu_debugfs_regs_write - Callback for writing MMIO registers
>   */
>  static ssize_t amdgpu_debugfs_regs_write(struct file *f, const char __us=
er *buf,
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
