Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF29458BC22
	for <lists+linux-media@lfdr.de>; Sun,  7 Aug 2022 19:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234491AbiHGR4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Aug 2022 13:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbiHGR4J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Aug 2022 13:56:09 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A6CF70;
        Sun,  7 Aug 2022 10:56:08 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id z145so5509684iof.9;
        Sun, 07 Aug 2022 10:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=HCkk+GrBRH/PjWLfXgNy6ENV/ENALxsgi2qnlLaH8vk=;
        b=WCLgY5He9ua+U7aKUE8pVXSf1VPsqeHW/US4PiwJbm8IIAxIhqgeDqLcawZlahfW9s
         y50QwmaztjewseJNqT+q6s7MG55+rm/VW2qW+mcm+ryZAqQVas4sV5VnKXlXdIPYt2Cj
         uYC1/AyJNSOhDzAoeUkxorvyrFkltCthL4T/VE3tZcbzdDbYXanoSzdLDqSSvQ/zXnU/
         POKiV9vB/CO6jhkAdDjXCL57Xs5W68nYLBM4JhDeLDw9LXafNzRy4lSyZ9IySCRPtitj
         MUR20V8nisSrFXS+httdKHu4d32XcKTz2YRPks9o6OLhO+K60o8EtJTza5gG5E8kxPur
         lMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=HCkk+GrBRH/PjWLfXgNy6ENV/ENALxsgi2qnlLaH8vk=;
        b=WjWXlHSSGMS+47dVjc6WW5/lnQnlG5MFqBabzAAuihocXkkpVj91o3OAjrBaPv1OKH
         rAO18700CZSfDlVwcusYmdT2GUR2xP2BRcJDPLR2lqpb/l6Xe6U/LGKI8Hze6OBjeLlc
         EpDmWChNMCdwKvamSJsXP6OT4/07BZeLiwDy+OnvMYyjQCVPNE1eP53vE0hUeWfK1L8s
         LoWfzKe3yx0wp18wKxWZlP1QLsQSSKqarKqGZjUfbk2jNC+2JDR7EGuKbiFjcfvWQOJW
         wV0guNJrbUqHfNCflY/aaB/fmUuIryxdsSTwDx0NdzIV9xvpWqFqmXWgNFe0tBBgrlzk
         1n7w==
X-Gm-Message-State: ACgBeo3v1GDeLZCKz/mVUcbIdp3yjvw4LY/frzsGx4IoaXwQepmacl4C
        roB8v37X1wOSkB6eL5Uv7Dwe48l9qyI/aAAAnMc=
X-Google-Smtp-Source: AA6agR4DrhBlRLCKRpOIeviOzOvGsh2aGxTkvP6PXEqOuW4fswYcrsPXePxYNqkbeLgPR4xT9KBvxPUd8l+h8TDItSU=
X-Received: by 2002:a05:6638:f8f:b0:342:cb21:f6d6 with SMTP id
 h15-20020a0566380f8f00b00342cb21f6d6mr4215721jal.138.1659894967953; Sun, 07
 Aug 2022 10:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220729170744.1301044-1-robdclark@gmail.com> <20220729170744.1301044-2-robdclark@gmail.com>
 <3d2083aa-fc6c-6875-3daf-e5abe45fb762@gmail.com> <CAF6AEGvKdM3vyCvBZK=ZcdGmak7tsrP1b8ANyyaMjVfNDViqyw@mail.gmail.com>
 <973de2f8-75e4-d4c7-a13a-c541a6cf7c77@amd.com> <CAF6AEGuhQT6A_jh8kLWh5xMoUGc1osdewyBk-8NoprtWOHseaQ@mail.gmail.com>
 <2fc74efe-220f-b57a-e804-7d2b3880d14f@gmail.com>
In-Reply-To: <2fc74efe-220f-b57a-e804-7d2b3880d14f@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 7 Aug 2022 10:56:34 -0700
Message-ID: <CAF6AEGv9H+fSFKPNqwPxYUjkgj05AimpXbp-p_JL8nKLnzON=w@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/3] dma-buf: Add ioctl to query mmap info
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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

On Sun, Aug 7, 2022 at 10:38 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 07.08.22 um 19:35 schrieb Rob Clark:
> > On Sun, Aug 7, 2022 at 10:14 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 07.08.22 um 19:02 schrieb Rob Clark:
> >>> On Sun, Aug 7, 2022 at 9:09 AM Christian K=C3=B6nig
> >>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>> Am 29.07.22 um 19:07 schrieb Rob Clark:
> >>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>
> >>>>> This is a fairly narrowly focused interface, providing a way for a =
VMM
> >>>>> in userspace to tell the guest kernel what pgprot settings to use w=
hen
> >>>>> mapping a buffer to guest userspace.
> >>>>>
> >>>>> For buffers that get mapped into guest userspace, virglrenderer ret=
urns
> >>>>> a dma-buf fd to the VMM (crosvm or qemu).
> >>>> Wow, wait a second. Who is giving whom the DMA-buf fd here?
> >>> Not sure I understand the question.. the dma-buf fd could come from
> >>> EGL_MESA_image_dma_buf_export, gbm, or similar.
> >>>
> >>>> My last status was that this design was illegal and couldn't be
> >>>> implemented because it requires internal knowledge only the exportin=
g
> >>>> driver can have.
> >>> This ioctl provides that information from the exporting driver so tha=
t
> >>> a VMM doesn't have to make assumptions ;-)
> >> And exactly that was NAKed the last time it came up. Only the exportin=
g
> >> driver is allowed to mmap() the DMA-buf into the guest.
> > except the exporting driver is in the host ;-)
> >
> >> This way you also don't need to transport any caching information anyw=
here.
> >>
> >>> Currently crosvm assumes if (drivername =3D=3D "i915") then it is a c=
ached
> >>> mapping, otherwise it is wc.  I'm trying to find a way to fix this.
> >>> Suggestions welcome, but because of how mapping to a guest VM works, =
a
> >>> VMM is a somewhat special case where this information is needed in
> >>> userspace.
> >> Ok that leaves me completely puzzled. How does that work in the first =
place?
> >>
> >> In other words how does the mapping into the guest page tables happen?
> > There are multiple levels to this, but in short mapping to guest
> > userspace happens via drm/virtio (aka "virtio_gpu" or "virtgpu"), the
> > cache attributes are set via "map_info" attribute returned from the
> > host VMM (host userspace, hence the need for this ioctl).
> >
> > In the host, the host kernel driver mmaps to host userspace (VMM).
> > Here the exporting driver is performing the mmap with correct cache
> > attributes.
>
> > The VMM uses KVM to map these pages into the guest so
>
> And exactly that was declared completely illegal the last time it came
> up on the mailing list.
>
> Daniel implemented a whole bunch of patches into the DMA-buf layer to
> make it impossible for KVM to do this.

This issue isn't really with KVM, it is not making any CPU mappings
itself.  KVM is just making the pages available to the guest.  Like I
said the CPU mapping to the guest userspace is setup by virtgpu.  But
based on information that the host VMM provides.  This patch simply
provides a way for the host VMM to provide the correct information.

> I have absolutely no idea why that is now a topic again and why anybody
> is still using this approach.

Because this is how VMMs work.  And it is how the virtgpu device
spec[1] is designed.

[1] https://github.com/oasis-tcs/virtio-spec/blob/master/virtio-gpu.tex#L76=
7

> @Daniel can you clarify.

Like I've said, I'd be happy to hear alternative suggestions.  But the
root problem is that it is not possible for the host kernel to
directly map into guest userspace.  So I don't really see an
alternative.  Even if it were possible for host kernel to directly map
to guest userspace, that ship has already sailed as far as virtio
device specification.

BR,
-R

> Thanks,
> Christian.
>
> > they appear as physical pages to the guest kernel.  The guest kernel
> > (virtgpu) in turn maps them to guest userspace.
> >
> > BR,
> > -R
> >
> >> Regards,
> >> Christian.
> >>
> >>> BR,
> >>> -R
> >>>
> >>>> @Daniel has anything changed on that is or my status still valid?
> >>>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>>      In addition to mapping the
> >>>>> pages into the guest VM, it needs to report to drm/virtio in the gu=
est
> >>>>> the cache settings to use for guest userspace.  In particular, on s=
ome
> >>>>> architectures, creating aliased mappings with different cache attri=
butes
> >>>>> is frowned upon, so it is important that the guest mappings have th=
e
> >>>>> same cache attributes as any potential host mappings.
> >>>>>
> >>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>> ---
> >>>>>     drivers/dma-buf/dma-buf.c    | 26 ++++++++++++++++++++++++++
> >>>>>     include/linux/dma-buf.h      |  7 +++++++
> >>>>>     include/uapi/linux/dma-buf.h | 28 ++++++++++++++++++++++++++++
> >>>>>     3 files changed, 61 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >>>>> index 32f55640890c..d02d6c2a3b49 100644
> >>>>> --- a/drivers/dma-buf/dma-buf.c
> >>>>> +++ b/drivers/dma-buf/dma-buf.c
> >>>>> @@ -326,6 +326,29 @@ static long dma_buf_set_name(struct dma_buf *d=
mabuf, const char __user *buf)
> >>>>>         return 0;
> >>>>>     }
> >>>>>
> >>>>> +static long dma_buf_info(struct dma_buf *dmabuf, const void __user=
 *uarg)
> >>>>> +{
> >>>>> +     struct dma_buf_info arg;
> >>>>> +
> >>>>> +     if (copy_from_user(&arg, uarg, sizeof(arg)))
> >>>>> +             return -EFAULT;
> >>>>> +
> >>>>> +     switch (arg.param) {
> >>>>> +     case DMA_BUF_INFO_VM_PROT:
> >>>>> +             if (!dmabuf->ops->mmap_info)
> >>>>> +                     return -ENOSYS;
> >>>>> +             arg.value =3D dmabuf->ops->mmap_info(dmabuf);
> >>>>> +             break;
> >>>>> +     default:
> >>>>> +             return -EINVAL;
> >>>>> +     }
> >>>>> +
> >>>>> +     if (copy_to_user(uarg, &arg, sizeof(arg)))
> >>>>> +             return -EFAULT;
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>>     static long dma_buf_ioctl(struct file *file,
> >>>>>                           unsigned int cmd, unsigned long arg)
> >>>>>     {
> >>>>> @@ -369,6 +392,9 @@ static long dma_buf_ioctl(struct file *file,
> >>>>>         case DMA_BUF_SET_NAME_B:
> >>>>>                 return dma_buf_set_name(dmabuf, (const char __user =
*)arg);
> >>>>>
> >>>>> +     case DMA_BUF_IOCTL_INFO:
> >>>>> +             return dma_buf_info(dmabuf, (const void __user *)arg)=
;
> >>>>> +
> >>>>>         default:
> >>>>>                 return -ENOTTY;
> >>>>>         }
> >>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >>>>> index 71731796c8c3..6f4de64a5937 100644
> >>>>> --- a/include/linux/dma-buf.h
> >>>>> +++ b/include/linux/dma-buf.h
> >>>>> @@ -283,6 +283,13 @@ struct dma_buf_ops {
> >>>>>          */
> >>>>>         int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
> >>>>>
> >>>>> +     /**
> >>>>> +      * @mmap_info:
> >>>>> +      *
> >>>>> +      * Return mmapping info for the buffer.  See DMA_BUF_INFO_VM_=
PROT.
> >>>>> +      */
> >>>>> +     int (*mmap_info)(struct dma_buf *);
> >>>>> +
> >>>>>         int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> >>>>>         void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *ma=
p);
> >>>>>     };
> >>>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-=
buf.h
> >>>>> index b1523cb8ab30..a41adac0f46a 100644
> >>>>> --- a/include/uapi/linux/dma-buf.h
> >>>>> +++ b/include/uapi/linux/dma-buf.h
> >>>>> @@ -85,6 +85,32 @@ struct dma_buf_sync {
> >>>>>
> >>>>>     #define DMA_BUF_NAME_LEN    32
> >>>>>
> >>>>> +
> >>>>> +/**
> >>>>> + * struct dma_buf_info - Query info about the buffer.
> >>>>> + */
> >>>>> +struct dma_buf_info {
> >>>>> +
> >>>>> +#define DMA_BUF_INFO_VM_PROT      1
> >>>>> +#  define DMA_BUF_VM_PROT_WC      0
> >>>>> +#  define DMA_BUF_VM_PROT_CACHED  1
> >>>>> +
> >>>>> +     /**
> >>>>> +      * @param: Which param to query
> >>>>> +      *
> >>>>> +      * DMA_BUF_INFO_BM_PROT:
> >>>>> +      *     Query the access permissions of userspace mmap's of th=
is buffer.
> >>>>> +      *     Returns one of DMA_BUF_VM_PROT_x
> >>>>> +      */
> >>>>> +     __u32 param;
> >>>>> +     __u32 pad;
> >>>>> +
> >>>>> +     /**
> >>>>> +      * @value: Return value of the query.
> >>>>> +      */
> >>>>> +     __u64 value;
> >>>>> +};
> >>>>> +
> >>>>>     #define DMA_BUF_BASE                'b'
> >>>>>     #define DMA_BUF_IOCTL_SYNC  _IOW(DMA_BUF_BASE, 0, struct dma_bu=
f_sync)
> >>>>>
> >>>>> @@ -95,4 +121,6 @@ struct dma_buf_sync {
> >>>>>     #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, __u32)
> >>>>>     #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, __u64)
> >>>>>
> >>>>> +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct dma_buf=
_info)
> >>>>> +
> >>>>>     #endif
>
