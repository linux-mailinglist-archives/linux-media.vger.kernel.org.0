Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 885971760EC
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 18:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbgCBRTz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 12:19:55 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42982 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727261AbgCBRTz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 12:19:55 -0500
Received: by mail-lj1-f195.google.com with SMTP id d10so310333ljl.9
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2020 09:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mh25Tn0NVBkPeT5RPZ+4oavaskR/W4VBUnNVJVqelAs=;
        b=n8LQQReeuRW9yN+Gv397bengB3/JggQF7g+SESyU+JzFogcuU/IYgCgfQvUbFr1n/O
         5iG1onCuCQPyiIXiUguLMNfxMSmSRTo+4Z1sK3DFP/dWh8IID71O+T4gBmmtGWce6E0l
         nTa+5tY99sQ0Xms0Hb0D/sD1gKBMta2+pLF2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mh25Tn0NVBkPeT5RPZ+4oavaskR/W4VBUnNVJVqelAs=;
        b=WGik3x3AcPiIBfiPBKoxUlq9esl0ixYy9dv235ye6g33pXdtH4eciFXW6yInorL3ZI
         UvsUgHaPARg6EmybBBzJRR/23lU2tPgXSYjreb3Q6BSJ2bYZ5HnaQPQRWUOZQHKPy712
         UjxedI4aohh03QUmXg7+2b5Z1j45nojpmXSzBemRzPP+X/lA2Hvy6ehsBLrCgo1ZQXlI
         qtn+yBu0F6PWaIvghn5ojp4ZAWEiC7VTZbJSaZ6JsihOwAqweQPMCH5iHyLWt5UPQjTR
         0AE22VofzG7X0qyffbMO4uvfsVtpJdzpTpHr1R8z9wFZO1ViwFthmLVzeipdES/MRMuu
         Ocmg==
X-Gm-Message-State: ANhLgQ1sY+WTnARvL8xbsL5knRob8TZv1byh92HfZ7dln/zZ+K1z6afK
        NCRdsIx3zIzsfKBgaivBYiz/M5WwL70=
X-Google-Smtp-Source: ADFU+vtMhRZgWh+Uxx2tGdhpd8DWZrNu6rrG5KatDbWHIdQX5/IOOnIaPGHMMWaBFQY+g8E2TgyglA==
X-Received: by 2002:a05:651c:555:: with SMTP id q21mr11844319ljp.241.1583169592301;
        Mon, 02 Mar 2020 09:19:52 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id a5sm10486331lfl.4.2020.03.02.09.19.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 09:19:51 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id d10so310249ljl.9
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2020 09:19:51 -0800 (PST)
X-Received: by 2002:a05:651c:50a:: with SMTP id o10mr11509481ljp.189.1583169590652;
 Mon, 02 Mar 2020 09:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20200302121524.7543-1-stevensd@chromium.org> <20200302121524.7543-5-stevensd@chromium.org>
In-Reply-To: <20200302121524.7543-5-stevensd@chromium.org>
From:   Gurchetan Singh <gurchetansingh@chromium.org>
Date:   Mon, 2 Mar 2020 09:19:38 -0800
X-Gmail-Original-Message-ID: <CAAfnVBk46vsP77hx3kUHqVCPG8Eakh7Kgi0kEHZtrHD-0bHzqQ@mail.gmail.com>
Message-ID: <CAAfnVBk46vsP77hx3kUHqVCPG8Eakh7Kgi0kEHZtrHD-0bHzqQ@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH v2 4/4] drm/virtio: Support virtgpu exported resources
To:     David Stevens <stevensd@chromium.org>
Cc:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        open list <linux-kernel@vger.kernel.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO GPU DRIVER" 
        <virtualization@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linaro-mm-sig@lists.linaro.org, virtio-dev@lists.oasis-open.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 2, 2020 at 4:15 AM David Stevens <stevensd@chromium.org> wrote:
>
> Add support for UUID-based resource sharing mechanism to virtgpu. This
> implements the new virtgpu commands and hooks them up to dma-buf's
> get_uuid callback.
>
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 ++
>  drivers/gpu/drm/virtio/virtgpu_drv.h   | 19 ++++++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 48 ++++++++++++++++++--
>  drivers/gpu/drm/virtio/virtgpu_vq.c    | 62 ++++++++++++++++++++++++++
>  5 files changed, 133 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index ab4bed78e656..776e6667042e 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -165,6 +165,7 @@ static unsigned int features[] = {
>         VIRTIO_GPU_F_VIRGL,
>  #endif
>         VIRTIO_GPU_F_EDID,
> +       VIRTIO_GPU_F_RESOURCE_UUID,
>  };
>  static struct virtio_driver virtio_gpu_driver = {
>         .feature_table = features,
> @@ -202,7 +203,9 @@ static struct drm_driver driver = {
>         .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>         .gem_prime_mmap = drm_gem_prime_mmap,
> +       .gem_prime_export = virtgpu_gem_prime_export,
>         .gem_prime_import_sg_table = virtgpu_gem_prime_import_sg_table,
> +       .gem_prime_get_uuid = virtgpu_gem_prime_get_uuid,
>
>         .gem_create_object = virtio_gpu_create_object,
>         .fops = &virtio_gpu_driver_fops,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index af9403e1cf78..4be84de73d86 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -49,6 +49,11 @@
>  #define DRIVER_MINOR 1
>  #define DRIVER_PATCHLEVEL 0
>
> +#define UUID_NOT_INITIALIZED 0
> +#define UUID_INITIALIZING 1
> +#define UUID_INITIALIZED 2
> +#define UUID_INITIALIZATION_FAILED 3
> +
>  struct virtio_gpu_object_params {
>         uint32_t format;
>         uint32_t width;
> @@ -75,6 +80,9 @@ struct virtio_gpu_object {
>
>         bool dumb;
>         bool created;
> +
> +       int uuid_state;
> +       uuid_t uuid;
>  };
>  #define gem_to_virtio_gpu_obj(gobj) \
>         container_of((gobj), struct virtio_gpu_object, base.base)
> @@ -196,6 +204,7 @@ struct virtio_gpu_device {
>         bool has_virgl_3d;
>         bool has_edid;
>         bool has_indirect;
> +       bool has_resource_assign_uuid;
>
>         struct work_struct config_changed_work;
>
> @@ -206,6 +215,8 @@ struct virtio_gpu_device {
>         struct virtio_gpu_drv_capset *capsets;
>         uint32_t num_capsets;
>         struct list_head cap_cache;
> +
> +       spinlock_t resource_export_lock;
>  };
>
>  struct virtio_gpu_fpriv {
> @@ -338,6 +349,10 @@ void virtio_gpu_dequeue_fence_func(struct work_struct *work);
>  void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev);
>  void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev);
>
> +int
> +virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
> +                                   struct virtio_gpu_object *bo);
> +
>  /* virtio_gpu_display.c */
>  void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
>  void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
> @@ -366,6 +381,10 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>                              struct virtio_gpu_object **bo_ptr,
>                              struct virtio_gpu_fence *fence);
>  /* virtgpu_prime.c */
> +struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
> +                                        int flags);
> +int virtgpu_gem_prime_get_uuid(struct drm_gem_object *obj,
> +                              uuid_t *uuid);
>  struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
>         struct drm_device *dev, struct dma_buf_attachment *attach,
>         struct sg_table *sgt);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 4009c2f97d08..5a2aeb6d2f35 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -134,6 +134,7 @@ int virtio_gpu_init(struct drm_device *dev)
>         vgdev->dev = dev->dev;
>
>         spin_lock_init(&vgdev->display_info_lock);
> +       spin_lock_init(&vgdev->resource_export_lock);
>         ida_init(&vgdev->ctx_id_ida);
>         ida_init(&vgdev->resource_ida);
>         init_waitqueue_head(&vgdev->resp_wq);
> @@ -162,6 +163,9 @@ int virtio_gpu_init(struct drm_device *dev)
>         if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
>                 vgdev->has_indirect = true;
>         }
> +       if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
> +               vgdev->has_resource_assign_uuid = true;
> +       }
>
>         DRM_INFO("features: %cvirgl %cedid\n",
>                  vgdev->has_virgl_3d ? '+' : '-',
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index 050d24c39a8f..12ceda34b4f9 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -26,9 +26,51 @@
>
>  #include "virtgpu_drv.h"
>
> -/* Empty Implementations as there should not be any other driver for a virtual
> - * device that might share buffers with virtgpu
> - */
> +int virtgpu_gem_prime_get_uuid(struct drm_gem_object *obj,
> +                              uuid_t *uuid)
> +{
> +       struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +       struct virtio_gpu_device *vgdev = obj->dev->dev_private;
> +
> +       // The state should have changed when the buffer was exported.
> +       WARN_ON(bo->uuid_state == UUID_NOT_INITIALIZED);
> +
> +       wait_event(vgdev->resp_wq, bo->uuid_state != UUID_INITIALIZING);
> +       if (bo->uuid_state != UUID_INITIALIZED)
> +               return -ENODEV;
> +
> +       uuid_copy(uuid, &bo->uuid);
> +
> +       return 0;
> +}
> +
> +struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
> +                                        int flags)
> +{
> +       struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +       struct virtio_gpu_device *vgdev = obj->dev->dev_private;
> +       bool needs_init = false;
> +       int ret = 0;
> +
> +       if (vgdev->has_resource_assign_uuid) {
> +               spin_lock(&vgdev->resource_export_lock);
> +               if (bo->uuid_state == UUID_NOT_INITIALIZED) {
> +                       bo->uuid_state = UUID_INITIALIZING;
> +                       needs_init = true;
> +               }
> +               spin_unlock(&vgdev->resource_export_lock);
> +
> +               if (needs_init) {
> +                       ret = virtio_gpu_cmd_resource_assign_uuid(vgdev, bo);
> +                       if (ret)
> +                               return ERR_PTR(ret);
> +               }
> +       } else {
> +               bo->uuid_state = UUID_INITIALIZATION_FAILED;
> +       }
> +
> +       return drm_gem_prime_export(obj, flags);
> +}
>
>  struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
>         struct drm_device *dev, struct dma_buf_attachment *attach,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index cfe9c54f87a3..e692098fc573 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -1111,3 +1111,65 @@ void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
>         memcpy(cur_p, &output->cursor, sizeof(output->cursor));
>         virtio_gpu_queue_cursor(vgdev, vbuf);
>  }
> +
> +static void virtio_gpu_cmd_resource_uuid_cb(struct virtio_gpu_device *vgdev,
> +                                           struct virtio_gpu_vbuffer *vbuf)
> +{
> +       struct virtio_gpu_resp_resource_uuid *resp =
> +               (struct virtio_gpu_resp_resource_uuid *)vbuf->resp_buf;
> +       struct virtio_gpu_object *obj =
> +               (struct virtio_gpu_object *)vbuf->data_buf;
> +       uint32_t resp_type = le32_to_cpu(resp->hdr.type);
> +
> +       /*
> +        * Keeps the data_buf, which points to this virtio_gpu_object, from
> +        * getting kfree'd after this cb returns.
> +        */
> +       vbuf->data_buf = NULL;
> +
> +       spin_lock(&vgdev->resource_export_lock);
> +       WARN_ON(obj->uuid_state != UUID_INITIALIZING);
> +
> +       if (resp_type == VIRTIO_GPU_RESP_OK_RESOURCE_UUID &&
> +                       obj->uuid_state == UUID_INITIALIZING) {
> +               memcpy(&obj->uuid.b, resp->uuid, sizeof(obj->uuid.b));
> +               obj->uuid_state = UUID_INITIALIZED;
> +       } else {
> +               obj->uuid_state = UUID_INITIALIZATION_FAILED;
> +       }
> +       spin_unlock(&vgdev->resource_export_lock);
> +
> +       drm_gem_object_put_unlocked(&obj->base.base);
> +       wake_up_all(&vgdev->resp_wq);
> +}
> +
> +int
> +virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
> +                                   struct virtio_gpu_object *bo)
> +{
> +       struct virtio_gpu_resource_assign_uuid *cmd_p;
> +       struct virtio_gpu_vbuffer *vbuf;
> +       struct virtio_gpu_resp_resource_uuid *resp_buf;
> +
> +       resp_buf = kzalloc(sizeof(*resp_buf), GFP_KERNEL);
> +       if (!resp_buf) {
> +               spin_lock(&vgdev->resource_export_lock);
> +               bo->uuid_state = UUID_INITIALIZATION_FAILED;
> +               spin_unlock(&vgdev->resource_export_lock);
> +               return -ENOMEM;
> +       }
> +
> +       cmd_p = virtio_gpu_alloc_cmd_resp(vgdev,
> +               virtio_gpu_cmd_resource_uuid_cb, &vbuf, sizeof(*cmd_p),
> +               sizeof(struct virtio_gpu_resp_resource_uuid), resp_buf);
> +       memset(cmd_p, 0, sizeof(*cmd_p));
> +
> +       cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID);

cmd_p->hdr.ctx_id =

Before this completion of this hypercall, this resource can be
considered context local, while afterward it can be considered
"exported".

> +       cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
> +
> +       /* Reuse the data_buf pointer for the object pointer. */
> +       vbuf->data_buf = bo;
> +       drm_gem_object_get(&bo->base.base);

vbuf->objs?

> +       virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
> +       return 0;


> +}
> --
> 2.25.0.265.gbab2e86ba0-goog
>
>
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>
