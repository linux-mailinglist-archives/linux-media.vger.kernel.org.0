Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB88E58BC0E
	for <lists+linux-media@lfdr.de>; Sun,  7 Aug 2022 19:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiHGRe6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Aug 2022 13:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234537AbiHGRe5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Aug 2022 13:34:57 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98ECC635A;
        Sun,  7 Aug 2022 10:34:56 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id r5so5475077iod.10;
        Sun, 07 Aug 2022 10:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=ebSansuG1dM32cBeaxqS/xJR386PAhX2TqDBltDbYA0=;
        b=RUQNJK6tqS5T1bZdee8NL5VCrHbaG80eWOWXdcFFrSe44BpRDKGh1lnEwrrOoRpevf
         jpUve3kC2pLTburmAILtsZebV296sV2FJplWj5VQ8g/AnNWfifOZY/p8nB6wJ8m2KgF0
         nt3IlBKCjlKhWUPiU5NEQgyieVXz512JAuss88fQGlHN/6+IkfA2iYjVT6vS/taagA5y
         0PQ97v1SsxYZoC8FzOTg1eCCGKojsv4TQ8zZaTgtbvTc49D01NePxu9zb3BZiDzn0vv0
         SWWtLlnuijg60QCXirOw8O747tKZzJRRMRU+IMSWdHm4I5s2sFmnQ7Lweh8sV0Bw7htY
         l/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=ebSansuG1dM32cBeaxqS/xJR386PAhX2TqDBltDbYA0=;
        b=k/HNj/7RxfW9hb//eHn6vV4EKSAVZLXlheIR9h0oUIp7vPwrbubBvzCgQyf8El0rdx
         OGvcl6p7h/9bA8MX5LcBmWSzLV3/ODbl81OThQfGMIjdnw8juw3kdY1s0wIm33oAthDG
         xjY0CvHsqe9SD5si3Cj1p0HkwcYf+E8hrIfG0Hl1TJh8DwWFQf8qtOv1CVI5djuGtHLT
         vnW1AmfH33NuWHTOJkKjCvM9sBOPywoHDQwq8+FiJOoj418WwjYnqE2/+hUGy2ISp5Bg
         dZM0ciSUr7Zf5c+W1jRs0jA9sJRvzossMK90UreUv78jJ2yzqz9MJcwfBOADlIl0E4Kz
         S3gQ==
X-Gm-Message-State: ACgBeo0EYPc8V0SJdRX0nCXj6b/ZPwO9FB5/ouAeG0K8VPerHRkOePgv
        dfHHLdI/huekf+P3qSEhYBCPi5F8is+1wKrkGe0=
X-Google-Smtp-Source: AA6agR4Ai5Z/khVGaA4G7OD9pwZxQ9HDtx/AEB5Nd/iE32heOVLrtJlKTJGTh9HtkFf5hDY+xv4BofsqpXHg6cHL2PI=
X-Received: by 2002:a05:6638:2642:b0:33f:5172:e77 with SMTP id
 n2-20020a056638264200b0033f51720e77mr6758593jat.85.1659893695847; Sun, 07 Aug
 2022 10:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220729170744.1301044-1-robdclark@gmail.com> <20220729170744.1301044-2-robdclark@gmail.com>
 <3d2083aa-fc6c-6875-3daf-e5abe45fb762@gmail.com> <CAF6AEGvKdM3vyCvBZK=ZcdGmak7tsrP1b8ANyyaMjVfNDViqyw@mail.gmail.com>
 <973de2f8-75e4-d4c7-a13a-c541a6cf7c77@amd.com>
In-Reply-To: <973de2f8-75e4-d4c7-a13a-c541a6cf7c77@amd.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 7 Aug 2022 10:35:22 -0700
Message-ID: <CAF6AEGuhQT6A_jh8kLWh5xMoUGc1osdewyBk-8NoprtWOHseaQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/3] dma-buf: Add ioctl to query mmap info
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Aug 7, 2022 at 10:14 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 07.08.22 um 19:02 schrieb Rob Clark:
> > On Sun, Aug 7, 2022 at 9:09 AM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Am 29.07.22 um 19:07 schrieb Rob Clark:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> This is a fairly narrowly focused interface, providing a way for a VM=
M
> >>> in userspace to tell the guest kernel what pgprot settings to use whe=
n
> >>> mapping a buffer to guest userspace.
> >>>
> >>> For buffers that get mapped into guest userspace, virglrenderer retur=
ns
> >>> a dma-buf fd to the VMM (crosvm or qemu).
> >> Wow, wait a second. Who is giving whom the DMA-buf fd here?
> > Not sure I understand the question.. the dma-buf fd could come from
> > EGL_MESA_image_dma_buf_export, gbm, or similar.
> >
> >> My last status was that this design was illegal and couldn't be
> >> implemented because it requires internal knowledge only the exporting
> >> driver can have.
> > This ioctl provides that information from the exporting driver so that
> > a VMM doesn't have to make assumptions ;-)
>
> And exactly that was NAKed the last time it came up. Only the exporting
> driver is allowed to mmap() the DMA-buf into the guest.

except the exporting driver is in the host ;-)

> This way you also don't need to transport any caching information anywher=
e.
>
> > Currently crosvm assumes if (drivername =3D=3D "i915") then it is a cac=
hed
> > mapping, otherwise it is wc.  I'm trying to find a way to fix this.
> > Suggestions welcome, but because of how mapping to a guest VM works, a
> > VMM is a somewhat special case where this information is needed in
> > userspace.
>
> Ok that leaves me completely puzzled. How does that work in the first pla=
ce?
>
> In other words how does the mapping into the guest page tables happen?

There are multiple levels to this, but in short mapping to guest
userspace happens via drm/virtio (aka "virtio_gpu" or "virtgpu"), the
cache attributes are set via "map_info" attribute returned from the
host VMM (host userspace, hence the need for this ioctl).

In the host, the host kernel driver mmaps to host userspace (VMM).
Here the exporting driver is performing the mmap with correct cache
attributes.  The VMM uses KVM to map these pages into the guest so
they appear as physical pages to the guest kernel.  The guest kernel
(virtgpu) in turn maps them to guest userspace.

BR,
-R

>
> Regards,
> Christian.
>
> >
> > BR,
> > -R
> >
> >> @Daniel has anything changed on that is or my status still valid?
> >>
> >> Regards,
> >> Christian.
> >>
> >>>     In addition to mapping the
> >>> pages into the guest VM, it needs to report to drm/virtio in the gues=
t
> >>> the cache settings to use for guest userspace.  In particular, on som=
e
> >>> architectures, creating aliased mappings with different cache attribu=
tes
> >>> is frowned upon, so it is important that the guest mappings have the
> >>> same cache attributes as any potential host mappings.
> >>>
> >>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>> ---
> >>>    drivers/dma-buf/dma-buf.c    | 26 ++++++++++++++++++++++++++
> >>>    include/linux/dma-buf.h      |  7 +++++++
> >>>    include/uapi/linux/dma-buf.h | 28 ++++++++++++++++++++++++++++
> >>>    3 files changed, 61 insertions(+)
> >>>
> >>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >>> index 32f55640890c..d02d6c2a3b49 100644
> >>> --- a/drivers/dma-buf/dma-buf.c
> >>> +++ b/drivers/dma-buf/dma-buf.c
> >>> @@ -326,6 +326,29 @@ static long dma_buf_set_name(struct dma_buf *dma=
buf, const char __user *buf)
> >>>        return 0;
> >>>    }
> >>>
> >>> +static long dma_buf_info(struct dma_buf *dmabuf, const void __user *=
uarg)
> >>> +{
> >>> +     struct dma_buf_info arg;
> >>> +
> >>> +     if (copy_from_user(&arg, uarg, sizeof(arg)))
> >>> +             return -EFAULT;
> >>> +
> >>> +     switch (arg.param) {
> >>> +     case DMA_BUF_INFO_VM_PROT:
> >>> +             if (!dmabuf->ops->mmap_info)
> >>> +                     return -ENOSYS;
> >>> +             arg.value =3D dmabuf->ops->mmap_info(dmabuf);
> >>> +             break;
> >>> +     default:
> >>> +             return -EINVAL;
> >>> +     }
> >>> +
> >>> +     if (copy_to_user(uarg, &arg, sizeof(arg)))
> >>> +             return -EFAULT;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>>    static long dma_buf_ioctl(struct file *file,
> >>>                          unsigned int cmd, unsigned long arg)
> >>>    {
> >>> @@ -369,6 +392,9 @@ static long dma_buf_ioctl(struct file *file,
> >>>        case DMA_BUF_SET_NAME_B:
> >>>                return dma_buf_set_name(dmabuf, (const char __user *)a=
rg);
> >>>
> >>> +     case DMA_BUF_IOCTL_INFO:
> >>> +             return dma_buf_info(dmabuf, (const void __user *)arg);
> >>> +
> >>>        default:
> >>>                return -ENOTTY;
> >>>        }
> >>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >>> index 71731796c8c3..6f4de64a5937 100644
> >>> --- a/include/linux/dma-buf.h
> >>> +++ b/include/linux/dma-buf.h
> >>> @@ -283,6 +283,13 @@ struct dma_buf_ops {
> >>>         */
> >>>        int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
> >>>
> >>> +     /**
> >>> +      * @mmap_info:
> >>> +      *
> >>> +      * Return mmapping info for the buffer.  See DMA_BUF_INFO_VM_PR=
OT.
> >>> +      */
> >>> +     int (*mmap_info)(struct dma_buf *);
> >>> +
> >>>        int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> >>>        void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> >>>    };
> >>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-bu=
f.h
> >>> index b1523cb8ab30..a41adac0f46a 100644
> >>> --- a/include/uapi/linux/dma-buf.h
> >>> +++ b/include/uapi/linux/dma-buf.h
> >>> @@ -85,6 +85,32 @@ struct dma_buf_sync {
> >>>
> >>>    #define DMA_BUF_NAME_LEN    32
> >>>
> >>> +
> >>> +/**
> >>> + * struct dma_buf_info - Query info about the buffer.
> >>> + */
> >>> +struct dma_buf_info {
> >>> +
> >>> +#define DMA_BUF_INFO_VM_PROT      1
> >>> +#  define DMA_BUF_VM_PROT_WC      0
> >>> +#  define DMA_BUF_VM_PROT_CACHED  1
> >>> +
> >>> +     /**
> >>> +      * @param: Which param to query
> >>> +      *
> >>> +      * DMA_BUF_INFO_BM_PROT:
> >>> +      *     Query the access permissions of userspace mmap's of this=
 buffer.
> >>> +      *     Returns one of DMA_BUF_VM_PROT_x
> >>> +      */
> >>> +     __u32 param;
> >>> +     __u32 pad;
> >>> +
> >>> +     /**
> >>> +      * @value: Return value of the query.
> >>> +      */
> >>> +     __u64 value;
> >>> +};
> >>> +
> >>>    #define DMA_BUF_BASE                'b'
> >>>    #define DMA_BUF_IOCTL_SYNC  _IOW(DMA_BUF_BASE, 0, struct dma_buf_s=
ync)
> >>>
> >>> @@ -95,4 +121,6 @@ struct dma_buf_sync {
> >>>    #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, __u32)
> >>>    #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, __u64)
> >>>
> >>> +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct dma_buf_i=
nfo)
> >>> +
> >>>    #endif
>
