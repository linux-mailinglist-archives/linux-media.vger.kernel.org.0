Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBBF023E71A
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 07:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgHGFw1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 01:52:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:44344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725379AbgHGFw1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Aug 2020 01:52:27 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B438120866;
        Fri,  7 Aug 2020 05:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596779547;
        bh=VrTc5pr7hXkvJgVB3uN/B80HBQFTxP5+kpw5LS5EzAg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UFNPuzPGH9tHUnlaF2r5NMb+vdjJwWbNUP64KapCaARfWmoTWnCqkiXj/3IQoYjiQ
         ZyEL5J/FuZr/i59mk/feuDtu5nfUo9pZYTd1rWHykE8rgHlGclkNGK1PMqJZKxZH5F
         7exPTDGS7SGZieec/4LE40wqiwlrmr7MZauHh2ek=
Date:   Fri, 7 Aug 2020 07:52:41 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?utf-8?B?5L2V6ZGr?= <hexin.op@bytedance.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
        kraxel@redhat.com, Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, Qi Liu <liuqi.16@bytedance.com>,
        Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v3] drm/virtio: fix missing dma_fence_put() in
 virtio_gpu_execbuffer_ioctl()
Message-ID: <20200807055241.GA3025028@kroah.com>
References: <20200721101647.42653-1-hexin.op@bytedance.com>
 <CACKzwj=obkJPmMb1cGKDwBdgkxa92kpPTP9c2SzFWbbzcD6Luw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACKzwj=obkJPmMb1cGKDwBdgkxa92kpPTP9c2SzFWbbzcD6Luw@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 07, 2020 at 11:00:11AM +0800, 何鑫 wrote:
> Xin He <hexin.op@bytedance.com> 于2020年7月21日周二 下午6:17写道：
> >
> > From: Qi Liu <liuqi.16@bytedance.com>
> >
> > We should put the reference count of the fence after calling
> > virtio_gpu_cmd_submit(). So add the missing dma_fence_put().
> >
> > Fixes: 2cd7b6f08bc4 ("drm/virtio: add in/out fence support for explicit synchronization")
> > Co-developed-by: Xin He <hexin.op@bytedance.com>
> > Signed-off-by: Xin He <hexin.op@bytedance.com>
> > Signed-off-by: Qi Liu <liuqi.16@bytedance.com>
> > Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> >
> > changelog in v3:
> > 1) Change the subject from "drm/virtio: fixed memory leak in virtio_gpu_execbuffer_ioctl()" to
> >    "drm/virtio: fix missing dma_fence_put() in virtio_gpu_execbuffer_ioctl()"
> > 2) Rework the commit log
> >
> > changelog in v2:
> > 1) Add a change description
> >
> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > index 5df722072ba0..19c5bc01eb79 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > @@ -179,6 +179,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
> >
> >         virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
> >                               vfpriv->ctx_id, buflist, out_fence);
> > +       dma_fence_put(&out_fence->f);
> >         virtio_gpu_notify(vgdev);
> >         return 0;
> >
> > --
> > 2.21.1 (Apple Git-122.3)
> >
> 
> cc Greg

Why?

$ ./scripts/get_maintainer.pl --file drivers/gpu/drm/virtio/virtgpu_ioctl.c
David Airlie <airlied@linux.ie> (maintainer:VIRTIO GPU DRIVER)
Gerd Hoffmann <kraxel@redhat.com> (maintainer:VIRTIO GPU DRIVER)
Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
Sumit Semwal <sumit.semwal@linaro.org> (maintainer:DMA BUFFER SHARING FRAMEWORK)
"Christian König" <christian.koenig@amd.com> (maintainer:DMA BUFFER SHARING FRAMEWORK)
dri-devel@lists.freedesktop.org (open list:VIRTIO GPU DRIVER)
virtualization@lists.linux-foundation.org (open list:VIRTIO GPU DRIVER)
linux-kernel@vger.kernel.org (open list)
linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK)
linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK)

