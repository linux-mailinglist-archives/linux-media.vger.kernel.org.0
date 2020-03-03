Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8A21782C6
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 20:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730291AbgCCTFm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 14:05:42 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34475 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728533AbgCCTFm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 14:05:42 -0500
Received: by mail-ed1-f68.google.com with SMTP id dm3so5832842edb.1
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 11:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=OjClmc/+gQuJ6ZLgRTF82QLR/kaFfwhtLhApUK8evZU=;
        b=sOq81SuAg2jb/u4/gxTwVBkocJQ9PKWZ0/96kw7aCwNfbeAHmmQk9tdjpig5G+cFTh
         RQzHF2rrNPuYbhjNqBs4DNALIRszIqQ1RKPJP6BFOwnsHTcVFaUFK2Xhy3NTuIwCh0+q
         TvGK3Pb5lG3ygnLh5vJEvujadlw73UhGuIPNxzIIzVjwcqy8B2R6zQW7s7Om0RI2l5D1
         8umRJ5GKRsObN9nLHzwyReiHJnp1fu/OxfsLW1Gxc3eRRINGRAlXXtbXTOxDztp1IhGO
         4LCLWTPzxUOJJ7VOoWmUU4FVeXu9qGNhSWkeXmxth7nVCOYm/WTAVELaxtp2ua3heWJH
         AI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=OjClmc/+gQuJ6ZLgRTF82QLR/kaFfwhtLhApUK8evZU=;
        b=rXQls/Zjes9Nj2QQj73NsybyMJcO5h0cnYS8vTWhoSEfCV6+5ukvKBXNYoos/sAOr5
         /Lk9iYOdcIINakiW9J1E/4dOa1W9lKhFeRI115l0xE9yTOnun8Z2fdUEahtAZ/cSVc3e
         47t9rBZTaFI1F0BJ79wi4ojwm7OJVDL9jNhTxj2AKM5ZHq4Ga6VPuWw/VYoGNu7y2hVe
         j/pcLpdTdnd9mRBN1OCdD6KWwpT9YRX88XfEub8wFMhaBeDM00EkNrkmg7YFr82DGiQ+
         cv5yUUPEtnzt5/wePwuAxTvQ+cZpR8T1cyrnyW2t7jZ0WZ3g0huxmHtfbS83+svSe1FF
         Mu8Q==
X-Gm-Message-State: ANhLgQ3gThNpqNfxQQa9tHRNIC9tfOvxTkFNBqtci41chyEG1C1jFXxx
        GtAXq3x9+kiWp5n9i5ZCAejX/TANlsBEmQIrVZCkIQ==
X-Received: by 2002:aa7:c983:: with SMTP id c3mt5067705edt.98.1583262339396;
 Tue, 03 Mar 2020 11:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20200226180937.106875-1-jason@jlekstrand.net> <20200303190318.522103-1-jason@jlekstrand.net>
In-Reply-To: <20200303190318.522103-1-jason@jlekstrand.net>
From:   Jason Ekstrand <jason@jlekstrand.net>
Date:   Tue, 3 Mar 2020 13:05:27 -0600
Message-ID: <CAOFGe97suifkJ4shncrjb0vUE+gaO2T7Db-PNcYMdUogUUyi=Q@mail.gmail.com>
Subject: Re: [PATCH] RFC: dma-buf: Add an API for importing and exporting sync
 files (v3)
Cc:     Dave Airlie <airlied@redhat.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Jesse Hall <jessehall@google.com>,
        James Jones <jajones@nvidia.com>,
        Daniel Stone <daniels@collabora.com>,
        =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@google.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Chenbo Feng <fengc@google.com>,
        Greg Hackmann <ghackmann@google.com>,
        linux-media@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Vulkan WSI user of the new API:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037

On Tue, Mar 3, 2020 at 1:03 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> Explicit synchronization is the future.  At least, that seems to be what
> most userspace APIs are agreeing on at this point.  However, most of our
> Linux APIs (both userspace and kernel UAPI) are currently built around
> implicit synchronization with dma-buf.  While work is ongoing to change
> many of the userspace APIs and protocols to an explicit synchronization
> model, switching over piecemeal is difficult due to the number of
> potential components involved.  On the kernel side, many drivers use
> dma-buf including GPU (3D/compute), display, v4l, and others.  In
> userspace, we have X11, several Wayland compositors, 3D drivers, compute
> drivers (OpenCL etc.), media encode/decode, and the list goes on.
>
> This patch provides a path forward by allowing userspace to manually
> manage the fences attached to a dma-buf.  Alternatively, one can think
> of this as making dma-buf's implicit synchronization simply a carrier
> for an explicit fence.  This is accomplished by adding two IOCTLs to
> dma-buf for importing and exporting a sync file to/from the dma-buf.
> This way a userspace component which is uses explicit synchronization,
> such as a Vulkan driver, can manually set the write fence on a buffer
> before handing it off to an implicitly synchronized component such as a
> Wayland compositor or video encoder.  In this way, each of the different
> components can be upgraded to an explicit synchronization model one at a
> time as long as the userspace pieces connecting them are aware of it and
> import/export fences at the right times.
>
> There is a potential race condition with this API if userspace is not
> careful.  A typical use case for implicit synchronization is to wait for
> the dma-buf to be ready, use it, and then signal it for some other
> component.  Because a sync_file cannot be created until it is guaranteed
> to complete in finite time, userspace can only signal the dma-buf after
> it has already submitted the work which uses it to the kernel and has
> received a sync_file back.  There is no way to atomically submit a
> wait-use-signal operation.  This is not, however, really a problem with
> this API so much as it is a problem with explicit synchronization
> itself.  The way this is typically handled is to have very explicit
> ownership transfer points in the API or protocol which ensure that only
> one component is using it at any given time.  Both X11 (via the PRESENT
> extension) and Wayland provide such ownership transfer points via
> explicit present and idle messages.
>
> The decision was intentionally made in this patch to make the import and
> export operations IOCTLs on the dma-buf itself rather than as a DRM
> IOCTL.  This makes it the import/export operation universal across all
> components which use dma-buf including GPU, display, v4l, and others.
> It also means that a userspace component can do the import/export
> without access to the DRM fd which may be tricky to get in cases where
> the client communicates with DRM via a userspace API such as OpenGL or
> Vulkan.  At a future date we may choose to add direct import/export APIs
> to components such as drm_syncobj to avoid allocating a file descriptor
> and going through two ioctls.  However, that seems to be something of a
> micro-optimization as import/export operations are likely to happen at a
> rate of a few per frame of rendered or decoded video.
>
> v2 (Jason Ekstrand):
>  - Use a wrapper dma_fence_array of all fences including the new one
>    when importing an exclusive fence.
>
> v3 (Jason Ekstrand):
>  - Lock around setting shared fences as well as exclusive
>  - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
>  - Initialize ret to 0 in dma_buf_wait_sync_file
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/dma-buf/dma-buf.c    | 164 +++++++++++++++++++++++++++++++++++
>  include/uapi/linux/dma-buf.h |  13 ++-
>  2 files changed, 175 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index d4097856c86b..2c4608bae3c2 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -20,6 +20,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/module.h>
>  #include <linux/seq_file.h>
> +#include <linux/sync_file.h>
>  #include <linux/poll.h>
>  #include <linux/dma-resv.h>
>  #include <linux/mm.h>
> @@ -348,6 +349,163 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>         return ret;
>  }
>
> +/* This function takes a ref to add_fence on success.  The caller still
> + * owns its ref and has to dma_fence_put it.
> + */
> +static struct dma_fence *dma_buf_get_unified_fence(struct dma_buf *dmabuf,
> +                                                  struct dma_fence *add_fence)
> +{
> +       struct dma_fence **fences = NULL;
> +       struct dma_fence_array *array;
> +       unsigned i, num_fences = 0;
> +       int ret;
> +
> +       ret = dma_resv_get_fences_rcu(dmabuf->resv, NULL,
> +                                     &num_fences, &fences);
> +       if (ret)
> +               return NULL; /* ret can only be 0 or -ENOMEM */
> +
> +       if (num_fences == 0) {
> +               if (add_fence) {
> +                       return add_fence;
> +               } else {
> +                       return dma_fence_get_stub();
> +               }
> +       } else if (num_fences == 1 && (!add_fence || add_fence == fences[0])) {
> +               struct dma_fence *fence = fences[0];
> +               kfree(fences);
> +               return fence;
> +       }
> +
> +       if (add_fence) {
> +               struct dma_fence **nfences;
> +               size_t sz;
> +
> +               /* Get a ref to add_fence so that we have a ref to every
> +                * fence we are going to put in the array.
> +                */
> +               dma_fence_get(add_fence);
> +
> +               sz = (num_fences + 1) * sizeof(*fences);
> +               nfences = krealloc(fences, sz, GFP_NOWAIT | __GFP_NOWARN);
> +               if (!nfences)
> +                       goto err_put_fences;
> +
> +               nfences[num_fences++] = add_fence;
> +       }
> +
> +       array = dma_fence_array_create(num_fences, fences,
> +                                      dma_fence_context_alloc(1),
> +                                      1, false);
> +       if (!array)
> +               goto err_put_fences;
> +
> +       /* The fence array now owns fences_arr and our references to each
> +        * of the individual fences.  We only own a reference to the one
> +        * array fence.
> +        */
> +
> +       return &array->base;
> +
> +err_put_fences:
> +       for (i = 0; i < num_fences; i++)
> +               dma_fence_put(fences[0]);
> +       dma_fence_put(add_fence);
> +       kfree(fences);
> +       return NULL;
> +}
> +
> +static long dma_buf_wait_sync_file(struct dma_buf *dmabuf,
> +                                  const void __user *user_data)
> +{
> +       struct dma_buf_sync_file arg;
> +       struct dma_fence *fence, *unified_fence;
> +       int ret = 0;
> +
> +       if (copy_from_user(&arg, user_data, sizeof(arg)))
> +               return -EFAULT;
> +
> +       if (arg.flags != 0 && arg.flags != DMA_BUF_SYNC_FILE_SYNC_WRITE)
> +               return -EINVAL;
> +
> +       fence = sync_file_get_fence(arg.fd);
> +       if (!fence)
> +               return -EINVAL;
> +
> +       dma_resv_lock(dmabuf->resv, NULL);
> +
> +       if (arg.flags & DMA_BUF_SYNC_FILE_SYNC_WRITE) {
> +               unified_fence = dma_buf_get_unified_fence(dmabuf, fence);
> +               if (unified_fence)
> +                       dma_resv_add_excl_fence(dmabuf->resv, fence);
> +               else
> +                       ret = -ENOMEM;
> +       } else {
> +               dma_resv_add_shared_fence(dmabuf->resv, fence);
> +       }
> +
> +       dma_resv_unlock(dmabuf->resv);
> +
> +       dma_fence_put(fence);
> +
> +       return ret;
> +}
> +
> +static long dma_buf_signal_sync_file(struct dma_buf *dmabuf,
> +                                    void __user *user_data)
> +{
> +       struct dma_buf_sync_file arg;
> +       struct dma_fence *fence = NULL;
> +       struct sync_file *sync_file;
> +       int fd, ret;
> +
> +       if (copy_from_user(&arg, user_data, sizeof(arg)))
> +               return -EFAULT;
> +
> +       if (arg.flags != 0 && arg.flags != DMA_BUF_SYNC_FILE_SYNC_WRITE)
> +               return -EINVAL;
> +
> +       fd = get_unused_fd_flags(O_CLOEXEC);
> +       if (fd < 0)
> +               return fd;
> +
> +       if (arg.flags & DMA_BUF_SYNC_FILE_SYNC_WRITE) {
> +               /* We need to include both the exclusive fence and all of
> +                * the shared fences in our fence.
> +                */
> +               fence = dma_buf_get_unified_fence(dmabuf, NULL);
> +               if (!fence) {
> +                       ret = -ENOMEM;
> +                       goto err_put_fd;
> +               }
> +       } else {
> +               fence = dma_resv_get_excl_rcu(dmabuf->resv);
> +               if (!fence)
> +                       fence = dma_fence_get_stub();
> +       }
> +
> +       sync_file = sync_file_create(fence);
> +
> +       dma_fence_put(fence);
> +
> +       if (!sync_file) {
> +               ret = -EINVAL;
> +               goto err_put_fd;
> +       }
> +
> +       fd_install(fd, sync_file->file);
> +
> +       arg.fd = fd;
> +       if (copy_to_user(user_data, &arg, sizeof(arg)))
> +               return -EFAULT;
> +
> +       return 0;
> +
> +err_put_fd:
> +       put_unused_fd(fd);
> +       return ret;
> +}
> +
>  static long dma_buf_ioctl(struct file *file,
>                           unsigned int cmd, unsigned long arg)
>  {
> @@ -390,6 +548,12 @@ static long dma_buf_ioctl(struct file *file,
>         case DMA_BUF_SET_NAME:
>                 return dma_buf_set_name(dmabuf, (const char __user *)arg);
>
> +       case DMA_BUF_IOCTL_WAIT_SYNC_FILE:
> +               return dma_buf_wait_sync_file(dmabuf, (const void __user *)arg);
> +
> +       case DMA_BUF_IOCTL_SIGNAL_SYNC_FILE:
> +               return dma_buf_signal_sync_file(dmabuf, (void __user *)arg);
> +
>         default:
>                 return -ENOTTY;
>         }
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index dbc7092e04b5..86e07acca90c 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -37,8 +37,17 @@ struct dma_buf_sync {
>
>  #define DMA_BUF_NAME_LEN       32
>
> +struct dma_buf_sync_file {
> +       __u32 flags;
> +       __s32 fd;
> +};
> +
> +#define DMA_BUF_SYNC_FILE_SYNC_WRITE   (1 << 0)
> +
>  #define DMA_BUF_BASE           'b'
> -#define DMA_BUF_IOCTL_SYNC     _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
> -#define DMA_BUF_SET_NAME       _IOW(DMA_BUF_BASE, 1, const char *)
> +#define DMA_BUF_IOCTL_SYNC         _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
> +#define DMA_BUF_SET_NAME           _IOW(DMA_BUF_BASE, 1, const char *)
> +#define DMA_BUF_IOCTL_WAIT_SYNC_FILE   _IOW(DMA_BUF_BASE, 2, struct dma_buf_sync)
> +#define DMA_BUF_IOCTL_SIGNAL_SYNC_FILE _IOWR(DMA_BUF_BASE, 3, struct dma_buf_sync)
>
>  #endif
> --
> 2.24.1
>
