Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9F6E8296
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 08:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbfJ2Hjy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 03:39:54 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37289 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbfJ2Hjy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 03:39:54 -0400
Received: by mail-qt1-f196.google.com with SMTP id g50so18846725qtb.4
        for <linux-media@vger.kernel.org>; Tue, 29 Oct 2019 00:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wxscl9rbX8BRoI/WgHiuXS+DBs0jDeUy/iCrArGyhgs=;
        b=NF0EVE0YYOZ/tSfdWF3zK2oaymlQKyAcLcBBYa5CYZkTBEyvAuLb+IY39vxfocSof7
         DvCT/R6u/hTjCbr+bsA69MQtgLX1HdXUW733lyY2k0FRphXOqMkcsfPL+QjyxNyRhQTx
         ljkZh9hYg4YSvPc2uHdmsVKRbU0EdQiRkx+Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wxscl9rbX8BRoI/WgHiuXS+DBs0jDeUy/iCrArGyhgs=;
        b=ecrQidgcXnBkJBPeyZFC5rO0V8Ic1aj8hLFyttE0EUFtGEO2KFhRaoSgYZ33kBq0cu
         l4725MQXtI95X1mRjGW1RSbTJB0Qj5oDemPmo4GgBbLK/4LoMRNvXavOru2wO0Cdmktb
         AOj1VTHQSOeLtSy2XAcRSGgmp6lLZWV+0lRvREzTHan366FJqQOJMrjY6EvwR8aSxmaZ
         Fs3etpMeSliHIIkrxT8RY1FINPvfdqDX4P9+fI9ZeQMeKhEvehrjPWUWe6UYTr1s6Sxb
         bEImo7VxyVLpHvRL/pYc8qYOlONfpTmnIJUhOwLpq5tJosgOTtVEOGchZhAxJCc5sKT/
         K8yQ==
X-Gm-Message-State: APjAAAUo+8aToBFoAeQ9KJKYdR1/53QJoJ03PivWCGrX7m6O8kSZLCsQ
        ujfulOWwBGbfij4DrxtGFqxKy5+6ypgJM3a4bZ1x0Q==
X-Google-Smtp-Source: APXvYqzlk15OHXfak3lQp/wt1qliKdeFCRpf8LFjdNlPAPFzWuHHP5URqyrLvHtWK5GLH2hIuh3XVEfHRdvaDOhfI0g=
X-Received: by 2002:ac8:4415:: with SMTP id j21mr2774442qtn.187.1572334793196;
 Tue, 29 Oct 2019 00:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190919093404.182015-1-keiichiw@chromium.org>
 <4037801.MZecyecTDs@os-lin-dmo> <CAAFQd5CfNK1oisDaOWaW+9NTQOLn1EHPrPzvxMPcSxLkBgv3Ww@mail.gmail.com>
 <15135216.K0K410U5qv@os-lin-dmo> <CAAFQd5DuChujakwmhtQ8v2CSLFqVYjLz9eGHuqrQnJ7apft+3Q@mail.gmail.com>
 <20191017071952.s3dq2oxdiy3khp5w@sirius.home.kraxel.org> <CAAFQd5ByuyTDqwiBeT7U7cVA8omOPGRRxb2tB8=J-u7WYU-urQ@mail.gmail.com>
 <20191017101304.pbjoj3knyveuacqm@sirius.home.kraxel.org>
In-Reply-To: <20191017101304.pbjoj3knyveuacqm@sirius.home.kraxel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Tue, 29 Oct 2019 16:39:42 +0900
Message-ID: <CAD=HUj5QMQS=Sig11vA8_D2+d=yjejAB-dYBPSbG98G444BqPw@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH] [RFC RESEND] vdec: Add virtio video decode
 device specification
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        virtio-dev@lists.oasis-open.org,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> When running drm-misc-next you should be able to test whenever that'll
> actually work without any virtio-gpu driver changes.

I did some experimentation with the Chrome OS kernel-next branch
(based on v5.4-rc3) plus drm-misc-next. I looked at both the chromeos
downstream virtio-wayland driver as well as the virtio-vdec driver
that was recently proposed to upstream.

Using the dma address of buffers generally works. However, it does
require the addition of some synchronization in the virtio-gpu driver
to prevent races between the virtio-gpu device registering the buffer
with the guest dma address (which happens with the ATTACH_BACKING
command) and other virtio devices using the guest dma address as a
buffer identifier. I've included a patch that adds this
synchronization.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  2 +
 drivers/gpu/drm/virtio/virtgpu_object.c | 15 +++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 64 +++++++++++++++++++++----
 3 files changed, 71 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h
b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 314e02f94d9c4..00a2c0e6b6382 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -72,6 +72,8 @@ struct virtio_gpu_object {
        uint32_t mapped;
        bool dumb;
        bool created;
+
+       bool attach_backing_complete;
 };
 #define gem_to_virtio_gpu_obj(gobj) \
        container_of((gobj), struct virtio_gpu_object, base.base)
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c
b/drivers/gpu/drm/virtio/virtgpu_object.c
index 017a9e0fc3bb8..812a0a48f6385 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -75,13 +75,26 @@ static void virtio_gpu_free_object(struct
drm_gem_object *obj)
        drm_gem_shmem_free_object(obj);
 }

+int virtio_gpu_gem_object_pin(struct drm_gem_object *obj)
+{
+       struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+       struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+
+       if (!bo->attach_backing_complete)
+               wait_event(vgdev->resp_wq, bo->attach_backing_complete);
+       if (!bo->attach_backing_complete)
+               return -EFAULT;
+
+       return drm_gem_shmem_pin(obj);
+}
+
 static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
        .free = virtio_gpu_free_object,
        .open = virtio_gpu_gem_object_open,
        .close = virtio_gpu_gem_object_close,

        .print_info = drm_gem_shmem_print_info,
-       .pin = drm_gem_shmem_pin,
+       .pin = virtio_gpu_gem_object_pin,
        .unpin = drm_gem_shmem_unpin,
        .get_sg_table = drm_gem_shmem_get_sg_table,
        .vmap = drm_gem_shmem_vmap,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c
b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 80176f379ad51..8bc2359a6d625 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -579,26 +579,42 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct
virtio_gpu_device *vgdev,
        virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, &cmd_p->hdr, fence);
 }

+static void
+virtio_gpu_cmd_resource_attach_backing_cb(struct virtio_gpu_device *vgdev,
+                                         struct virtio_gpu_vbuffer *vbuf)
+{
+       struct virtio_gpu_object_array *objs = vbuf->objs;
+       struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
+
+       bo->attach_backing_complete = true;
+       wake_up_all(&vgdev->resp_wq);
+}
+
 static void
 virtio_gpu_cmd_resource_attach_backing(struct virtio_gpu_device *vgdev,
-                                      uint32_t resource_id,
+                                      struct virtio_gpu_object *bo,
                                       struct virtio_gpu_mem_entry *ents,
                                       uint32_t nents,
+                                      struct virtio_gpu_object_array *objs,
                                       struct virtio_gpu_fence *fence)
 {
        struct virtio_gpu_resource_attach_backing *cmd_p;
        struct virtio_gpu_vbuffer *vbuf;

-       cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+       cmd_p = virtio_gpu_alloc_cmd_resp(
+               vgdev, virtio_gpu_cmd_resource_attach_backing_cb, &vbuf,
+               sizeof(*cmd_p), sizeof(struct virtio_gpu_ctrl_hdr), NULL);
        memset(cmd_p, 0, sizeof(*cmd_p));

        cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING);
-       cmd_p->resource_id = cpu_to_le32(resource_id);
+       cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
        cmd_p->nr_entries = cpu_to_le32(nents);

        vbuf->data_buf = ents;
        vbuf->data_size = sizeof(*ents) * nents;

+       vbuf->objs = objs;
+
        virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, &cmd_p->hdr, fence);
 }

@@ -1048,9 +1064,10 @@ int virtio_gpu_object_attach(struct
virtio_gpu_device *vgdev,
                             struct virtio_gpu_fence *fence)
 {
        bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
+       struct virtio_gpu_object_array *objs = NULL;
        struct virtio_gpu_mem_entry *ents;
        struct scatterlist *sg;
-       int si, nents, ret;
+       int si, nents, ret = 0;

        if (WARN_ON_ONCE(!obj->created))
                return -EINVAL;
@@ -1063,8 +1080,8 @@ int virtio_gpu_object_attach(struct
virtio_gpu_device *vgdev,

        obj->pages = drm_gem_shmem_get_sg_table(&obj->base.base);
        if (obj->pages == NULL) {
-               drm_gem_shmem_unpin(&obj->base.base);
-               return -EINVAL;
+               ret = -EINVAL;
+               goto err_unpin;
        }

        if (use_dma_api) {
@@ -1081,7 +1098,8 @@ int virtio_gpu_object_attach(struct
virtio_gpu_device *vgdev,
                             GFP_KERNEL);
        if (!ents) {
                DRM_ERROR("failed to allocate ent list\n");
-               return -ENOMEM;
+               ret = -ENOMEM;
+               goto err_unmap;
        }

        for_each_sg(obj->pages->sgl, sg, nents, si) {
@@ -1092,10 +1110,38 @@ int virtio_gpu_object_attach(struct
virtio_gpu_device *vgdev,
                ents[si].padding = 0;
        }

-       virtio_gpu_cmd_resource_attach_backing(vgdev, obj->hw_res_handle,
+       objs = virtio_gpu_array_alloc(1);
+       if (!objs) {
+               ret = -ENOMEM;
+               goto err_free_ents;
+       }
+       virtio_gpu_array_add_obj(objs, &obj->base.base);
+
+       if (fence) {
+               ret = virtio_gpu_array_lock_resv(objs);
+               if (ret != 0)
+                       goto err_put_objs;
+       }
+
+       virtio_gpu_cmd_resource_attach_backing(vgdev, obj,
                                               ents, nents,
-                                              fence);
+                                              objs, fence);
        return 0;
+
+err_put_objs:
+       virtio_gpu_array_put_free(objs);
+err_free_ents:
+       kfree(ents);
+err_unmap:
+       if (use_dma_api) {
+               dma_unmap_sg(vgdev->vdev->dev.parent,
+                            obj->pages->sgl, obj->pages->nents,
+                            DMA_TO_DEVICE);
+               obj->mapped = 0;
+       }
+err_unpin:
+       drm_gem_shmem_unpin(&obj->base.base);
+       return ret;
 }

 void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,
--
2.24.0.rc0.303.g954a862665-goog
