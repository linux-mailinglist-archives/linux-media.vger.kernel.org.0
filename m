Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB24D18359E
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 16:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgCLP5v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 11:57:51 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41884 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbgCLP5v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 11:57:51 -0400
Received: by mail-ed1-f67.google.com with SMTP id m25so8060482edq.8
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2020 08:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KFoqHlKe9Gz1nlNRRZBNdmBmwauPKFbN5aYg7hDMwdo=;
        b=WLT7lfY1Zqf5BYzaQ3nByDF7r8CnBHJmE8k2xiyOm5ryCtZVvF3kqw9VEgPERQ3doW
         jl7Zbji/5as/viceoo72pqyg9iLh0ho5veyGgzrYbGSJO0lnMBIIrg01a7TcN1aCzZu9
         oHn0i+nC7jlLU/VstInQEF3vfZfmEClUdqxjySThnoXB3dANG2jVLqiKWLY9QEr6A34u
         7KZehc4ThmcKDtfbR/oCwHgiC+NBBryX9pDxL262/x6dHtJOU6ZrgNOmxsUccM+F3zkE
         idCpGSxw+0v0vYwIC+IarVC5vhHEcniYv9Hos0h/Z0H8O90meja4D03QH47TzZqw0xrI
         MOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KFoqHlKe9Gz1nlNRRZBNdmBmwauPKFbN5aYg7hDMwdo=;
        b=au0moMMZECd84TB6Hes/sEPoNIML1gmL1cLmf9j2ypvrZuM5RqTz7O5dM7uCPyGoli
         7RIrBvrZSRgKnJq/235dYNGgqJTsTXlcU37uwCXtpTjijDNuTswi0lymBqMg5Y1lBAyG
         gUq/tkfz90+ydSTtdk83rmNCcqXm9S4jQqGMke3aUFQbFbWBQ7t3sE8pqlGyMZWNIid8
         hI/yxfjnF6uKVjZLYPEbepdebL9prS4D6xKD/Tkhl9k7FjWgbzDLO53ZC8193zq1hjZA
         U0B/HIHzQ9ZY8yHy8eSXivyuSDloDubrjdUYXC40ipw97+7RXSwaqU1wgxVCSiKgDT3v
         sVxQ==
X-Gm-Message-State: ANhLgQ3yAllIMgK6XXVMBaP0Vc1x1nT6TQsWD/ZnBxMASb/shdsW+JSA
        dBwW8XMO0IZbF8CTX0Q4pVILPaHlvwTZOvfuHBwmCQ==
X-Google-Smtp-Source: ADFU+vtrhhYk6GUgRImv9L/MfX6bT3C6fKT+3UCMlb5umWq+7s3Q85gXhMXy72HAwJfbPATR6JHEwoaAgknMk5a0RPc=
X-Received: by 2002:a50:9998:: with SMTP id m24mr8165526edb.98.1584028669210;
 Thu, 12 Mar 2020 08:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200303190318.522103-1-jason@jlekstrand.net> <20200311034351.1275197-1-jason@jlekstrand.net>
 <20200311034351.1275197-3-jason@jlekstrand.net> <bcd22ed3-c1fe-c018-5cb2-a077562eb1ff@amd.com>
In-Reply-To: <bcd22ed3-c1fe-c018-5cb2-a077562eb1ff@amd.com>
From:   Jason Ekstrand <jason@jlekstrand.net>
Date:   Thu, 12 Mar 2020 10:57:37 -0500
Message-ID: <CAOFGe96gbU03odF2OoLMnA7t7UgM6XrscogOD75dk62=hVFRmA@mail.gmail.com>
Subject: Re: [PATCH 3/3] RFC: dma-buf: Add an API for importing and exporting
 sync files (v4)
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Dave Airlie <airlied@redhat.com>,
        Jesse Hall <jessehall@google.com>,
        James Jones <jajones@nvidia.com>,
        Daniel Stone <daniels@collabora.com>,
        =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@google.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Greg Hackmann <ghackmann@google.com>,
        Chenbo Feng <fengc@google.com>, linux-media@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
        LKML <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 11, 2020 at 8:18 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 11.03.20 um 04:43 schrieb Jason Ekstrand:
> > Explicit synchronization is the future.  At least, that seems to be wha=
t
> > most userspace APIs are agreeing on at this point.  However, most of ou=
r
> > Linux APIs (both userspace and kernel UAPI) are currently built around
> > implicit synchronization with dma-buf.  While work is ongoing to change
> > many of the userspace APIs and protocols to an explicit synchronization
> > model, switching over piecemeal is difficult due to the number of
> > potential components involved.  On the kernel side, many drivers use
> > dma-buf including GPU (3D/compute), display, v4l, and others.  In
> > userspace, we have X11, several Wayland compositors, 3D drivers, comput=
e
> > drivers (OpenCL etc.), media encode/decode, and the list goes on.
> >
> > This patch provides a path forward by allowing userspace to manually
> > manage the fences attached to a dma-buf.  Alternatively, one can think
> > of this as making dma-buf's implicit synchronization simply a carrier
> > for an explicit fence.  This is accomplished by adding two IOCTLs to
> > dma-buf for importing and exporting a sync file to/from the dma-buf.
> > This way a userspace component which is uses explicit synchronization,
> > such as a Vulkan driver, can manually set the write fence on a buffer
> > before handing it off to an implicitly synchronized component such as a
> > Wayland compositor or video encoder.  In this way, each of the differen=
t
> > components can be upgraded to an explicit synchronization model one at =
a
> > time as long as the userspace pieces connecting them are aware of it an=
d
> > import/export fences at the right times.
> >
> > There is a potential race condition with this API if userspace is not
> > careful.  A typical use case for implicit synchronization is to wait fo=
r
> > the dma-buf to be ready, use it, and then signal it for some other
> > component.  Because a sync_file cannot be created until it is guarantee=
d
> > to complete in finite time, userspace can only signal the dma-buf after
> > it has already submitted the work which uses it to the kernel and has
> > received a sync_file back.  There is no way to atomically submit a
> > wait-use-signal operation.  This is not, however, really a problem with
> > this API so much as it is a problem with explicit synchronization
> > itself.  The way this is typically handled is to have very explicit
> > ownership transfer points in the API or protocol which ensure that only
> > one component is using it at any given time.  Both X11 (via the PRESENT
> > extension) and Wayland provide such ownership transfer points via
> > explicit present and idle messages.
> >
> > The decision was intentionally made in this patch to make the import an=
d
> > export operations IOCTLs on the dma-buf itself rather than as a DRM
> > IOCTL.  This makes it the import/export operation universal across all
> > components which use dma-buf including GPU, display, v4l, and others.
> > It also means that a userspace component can do the import/export
> > without access to the DRM fd which may be tricky to get in cases where
> > the client communicates with DRM via a userspace API such as OpenGL or
> > Vulkan.  At a future date we may choose to add direct import/export API=
s
> > to components such as drm_syncobj to avoid allocating a file descriptor
> > and going through two ioctls.  However, that seems to be something of a
> > micro-optimization as import/export operations are likely to happen at =
a
> > rate of a few per frame of rendered or decoded video.
> >
> > v2 (Jason Ekstrand):
> >   - Use a wrapper dma_fence_array of all fences including the new one
> >     when importing an exclusive fence.
> >
> > v3 (Jason Ekstrand):
> >   - Lock around setting shared fences as well as exclusive
> >   - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
> >   - Initialize ret to 0 in dma_buf_wait_sync_file
> >
> > v4 (Jason Ekstrand):
> >   - Use the new dma_resv_get_singleton helper
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >   drivers/dma-buf/dma-buf.c    | 96 +++++++++++++++++++++++++++++++++++=
+
> >   include/uapi/linux/dma-buf.h | 13 ++++-
> >   2 files changed, 107 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index d4097856c86b..09973c689866 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -20,6 +20,7 @@
> >   #include <linux/debugfs.h>
> >   #include <linux/module.h>
> >   #include <linux/seq_file.h>
> > +#include <linux/sync_file.h>
> >   #include <linux/poll.h>
> >   #include <linux/dma-resv.h>
> >   #include <linux/mm.h>
> > @@ -348,6 +349,95 @@ static long dma_buf_set_name(struct dma_buf *dmabu=
f, const char __user *buf)
> >       return ret;
> >   }
> >
> > +static long dma_buf_wait_sync_file(struct dma_buf *dmabuf,
> > +                                const void __user *user_data)
> > +{
> > +     struct dma_buf_sync_file arg;
> > +     struct dma_fence *fence;
> > +     int ret =3D 0;
> > +
> > +     if (copy_from_user(&arg, user_data, sizeof(arg)))
> > +             return -EFAULT;
> > +
> > +     if (arg.flags !=3D 0 && arg.flags !=3D DMA_BUF_SYNC_FILE_SYNC_WRI=
TE)
> > +             return -EINVAL;
> > +
> > +     fence =3D sync_file_get_fence(arg.fd);
> > +     if (!fence)
> > +             return -EINVAL;
> > +
> > +     dma_resv_lock(dmabuf->resv, NULL);
> > +
> > +     if (arg.flags & DMA_BUF_SYNC_FILE_SYNC_WRITE) {
> > +             struct dma_fence *singleton =3D NULL;
> > +             ret =3D dma_resv_get_singleton(dmabuf->resv, fence, &sing=
leton);
> > +             if (!ret && singleton)
> > +                     dma_resv_add_excl_fence(dmabuf->resv, singleton);
> > +     } else {
> > +             dma_resv_add_shared_fence(dmabuf->resv, fence);
> > +     }
>
> You also need to create a singleton when adding a shared fences.
>
> The problem is that shared fences must always signal after exclusive
> ones and you can't guarantee that for the fence you add here.

I'm beginning to think that I should just drop the flags and always
wait on all fences and always take what's currently the "write" path.
Otherwise, something's going to get it wrong somewhere.  Thoughts?

Also, Michelle (added to CC) commented on IRC today that amdgpu does
something with implicit sync fences where it sorts out the fences
which affect one queue vs. others.  He thought that stuffing fences in
the dma-buf in this way might cause that to not work.  Thoughts?

--Jason


> Regards,
> Christian.
>
> > +
> > +     dma_resv_unlock(dmabuf->resv);
> > +
> > +     dma_fence_put(fence);
> > +
> > +     return ret;
> > +}
> > +
> > +static long dma_buf_signal_sync_file(struct dma_buf *dmabuf,
> > +                                  void __user *user_data)
> > +{
> > +     struct dma_buf_sync_file arg;
> > +     struct dma_fence *fence =3D NULL;
> > +     struct sync_file *sync_file;
> > +     int fd, ret;
> > +
> > +     if (copy_from_user(&arg, user_data, sizeof(arg)))
> > +             return -EFAULT;
> > +
> > +     if (arg.flags !=3D 0 && arg.flags !=3D DMA_BUF_SYNC_FILE_SYNC_WRI=
TE)
> > +             return -EINVAL;
> > +
> > +     fd =3D get_unused_fd_flags(O_CLOEXEC);
> > +     if (fd < 0)
> > +             return fd;
> > +
> > +     if (arg.flags & DMA_BUF_SYNC_FILE_SYNC_WRITE) {
> > +             /* We need to include both the exclusive fence and all of
> > +              * the shared fences in our fence.
> > +              */
> > +             ret =3D dma_resv_get_singleton(dmabuf->resv, NULL, &fence=
);
> > +             if (ret)
> > +                     goto err_put_fd;
> > +     } else {
> > +             fence =3D dma_resv_get_excl_rcu(dmabuf->resv);
> > +     }
> > +
> > +     if (!fence)
> > +             fence =3D dma_fence_get_stub();
> > +
> > +     sync_file =3D sync_file_create(fence);
> > +
> > +     dma_fence_put(fence);
> > +
> > +     if (!sync_file) {
> > +             ret =3D -EINVAL;
> > +             goto err_put_fd;
> > +     }
> > +
> > +     fd_install(fd, sync_file->file);
> > +
> > +     arg.fd =3D fd;
> > +     if (copy_to_user(user_data, &arg, sizeof(arg)))
> > +             return -EFAULT;
> > +
> > +     return 0;
> > +
> > +err_put_fd:
> > +     put_unused_fd(fd);
> > +     return ret;
> > +}
> > +
> >   static long dma_buf_ioctl(struct file *file,
> >                         unsigned int cmd, unsigned long arg)
> >   {
> > @@ -390,6 +480,12 @@ static long dma_buf_ioctl(struct file *file,
> >       case DMA_BUF_SET_NAME:
> >               return dma_buf_set_name(dmabuf, (const char __user *)arg)=
;
> >
> > +     case DMA_BUF_IOCTL_WAIT_SYNC_FILE:
> > +             return dma_buf_wait_sync_file(dmabuf, (const void __user =
*)arg);
> > +
> > +     case DMA_BUF_IOCTL_SIGNAL_SYNC_FILE:
> > +             return dma_buf_signal_sync_file(dmabuf, (void __user *)ar=
g);
> > +
> >       default:
> >               return -ENOTTY;
> >       }
> > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.=
h
> > index dbc7092e04b5..86e07acca90c 100644
> > --- a/include/uapi/linux/dma-buf.h
> > +++ b/include/uapi/linux/dma-buf.h
> > @@ -37,8 +37,17 @@ struct dma_buf_sync {
> >
> >   #define DMA_BUF_NAME_LEN    32
> >
> > +struct dma_buf_sync_file {
> > +     __u32 flags;
> > +     __s32 fd;
> > +};
> > +
> > +#define DMA_BUF_SYNC_FILE_SYNC_WRITE (1 << 0)
> > +
> >   #define DMA_BUF_BASE                'b'
> > -#define DMA_BUF_IOCTL_SYNC   _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync=
)
> > -#define DMA_BUF_SET_NAME     _IOW(DMA_BUF_BASE, 1, const char *)
> > +#define DMA_BUF_IOCTL_SYNC       _IOW(DMA_BUF_BASE, 0, struct dma_buf_=
sync)
> > +#define DMA_BUF_SET_NAME         _IOW(DMA_BUF_BASE, 1, const char *)
> > +#define DMA_BUF_IOCTL_WAIT_SYNC_FILE _IOW(DMA_BUF_BASE, 2, struct dma_=
buf_sync)
> > +#define DMA_BUF_IOCTL_SIGNAL_SYNC_FILE       _IOWR(DMA_BUF_BASE, 3, st=
ruct dma_buf_sync)
> >
> >   #endif
>
