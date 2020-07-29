Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F70F231A6A
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 09:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgG2Hi6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 03:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2Hi5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 03:38:57 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC49C061794
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 00:38:57 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id w17so11419735ply.11
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 00:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Hf50u6h9wnLFy96WAeaaud4OkMwukdvpfoIh17caQSk=;
        b=qvu8pBA35juXB5IAuj3EOdEUiIafCwux4Zh/tDRiwecjZ4h5ljtUkch7bU9dNi7BEn
         zDV1HWeXxyCHZ+z2tecTWyTytdwhCEd+DESLLScaS3yfoPMOqFliEXQd8TV0hQYlTJtq
         KbivU5pLK8l1ZRq1qGCXjh0QZyOLgi3XhExE07HdtbzYUitJ5N17urMNFvkQLT+boa/3
         k5+plqHvx2y0rTUOJgJEmfCPNHFoKVZvQWvR3/xJ9pYJ0/Me2W8JrPQtu6RHmwTL08Tz
         Ykq8YBWIbvNFayGGaRBCwOFl+137kCp0rtNEZYG3EIZvf5Dg0Ef7VahEMkXnpQf7V2e9
         0Nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Hf50u6h9wnLFy96WAeaaud4OkMwukdvpfoIh17caQSk=;
        b=Qr1fF+pu4t5GW+7UfuRgkx/S0VudttettAosIX2+HiwfcDOC/JheHnVlYCXE9YnVtr
         CDyb6Y4XbU3Jo6saBeTY5ft3VtNboSnFKkWNRLLTLgl0gHtm/EOC7NbPG8mNEuG4Wjtf
         kjFBpPkhP+EfBMVpIOTXQWVoaAjo8usMN9cqmZnyMnwS1WpILokYbz3GtU7CM61xx5fz
         RgHDFBWOKMUYQR1RH7Kx002h6dxUnSQc1DqIZB+GIfEtu0QIoysrKbgyABrdhIO8fe4b
         0F+z7+RIJ4L00uEJToVUwLGx+JX3BELc0v+0vxfZnKT3u8ERkJyhUZq9EhMiv3C3DZhZ
         I6RA==
X-Gm-Message-State: AOAM531XCnfxnNROnlkVX13wq6GFRKgJMbEoTXMCNHHC5SH8FmI8nYtX
        RaYoaR4wX1BWhMFuC5hoYILiGG+R/1+1gHSZohZRNQ==
X-Google-Smtp-Source: ABdhPJz3p/RdzMtYa5b161gOYMyR9V5zWuKnydulgpgc6pQ29hu00H5qrHoahniLRmzse010xwGrjzFF810Pxzvlfuk=
X-Received: by 2002:a17:90a:fa8c:: with SMTP id cu12mr8694751pjb.229.1596008336834;
 Wed, 29 Jul 2020 00:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200721101647.42653-1-hexin.op@bytedance.com>
In-Reply-To: <20200721101647.42653-1-hexin.op@bytedance.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 29 Jul 2020 15:38:21 +0800
Message-ID: <CAMZfGtW512Hi_T=PhXdSfs1n54q6HndVx=stCC6By4OnB39Z=g@mail.gmail.com>
Subject: Re: [PATCH v3] drm/virtio: fix missing dma_fence_put() in virtio_gpu_execbuffer_ioctl()
To:     Xin He <hexin.op@bytedance.com>, daniel@ffwll.ch, airlied@linux.ie,
        kraxel@redhat.com, sumit.semwal@linaro.org,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org
Cc:     linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Qi Liu <liuqi.16@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 21, 2020 at 6:17 PM Xin He <hexin.op@bytedance.com> wrote:
>
> From: Qi Liu <liuqi.16@bytedance.com>
>
> We should put the reference count of the fence after calling
> virtio_gpu_cmd_submit(). So add the missing dma_fence_put().
>
> Fixes: 2cd7b6f08bc4 ("drm/virtio: add in/out fence support for explicit s=
ynchronization")
> Co-developed-by: Xin He <hexin.op@bytedance.com>
> Signed-off-by: Xin He <hexin.op@bytedance.com>
> Signed-off-by: Qi Liu <liuqi.16@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>
> changelog in v3:
> 1) Change the subject from "drm/virtio: fixed memory leak in virtio_gpu_e=
xecbuffer_ioctl()" to
>    "drm/virtio: fix missing dma_fence_put() in virtio_gpu_execbuffer_ioct=
l()"
> 2) Rework the commit log
>
> changelog in v2:
> 1) Add a change description
>
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/vir=
tio/virtgpu_ioctl.c
> index 5df722072ba0..19c5bc01eb79 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -179,6 +179,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_dev=
ice *dev, void *data,
>
>         virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
>                               vfpriv->ctx_id, buflist, out_fence);
> +       dma_fence_put(&out_fence->f);
>         virtio_gpu_notify(vgdev);
>         return 0;
>
> --
> 2.21.1 (Apple Git-122.3)
>

Ping guys. Any comments or suggestions=EF=BC=9F

--=20
Yours,
Muchun
