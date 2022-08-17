Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB2659701F
	for <lists+linux-media@lfdr.de>; Wed, 17 Aug 2022 15:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239458AbiHQNoO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Aug 2022 09:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236286AbiHQNoK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Aug 2022 09:44:10 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A424A74350;
        Wed, 17 Aug 2022 06:44:08 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id p184so7253343iod.6;
        Wed, 17 Aug 2022 06:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=nclIjSlJxGqqOaHzQE3LM96PQfYxITkGQPqvg5zHcyU=;
        b=UNgd21RsrpYoA3nIpCCSyyNig59nr5mcXLi+j5WwEHlJn43EQtFkdlFXxO1j5tbPxQ
         Ok1NyjTrNKTXryAZjNd2nlMPObOrY6E9MoKTeAPsnUhc0AUocQg2iO5G5u7YRaWdrCIX
         sHRF7T7bDy7Yz0e21Nj5PbcvHArbG8FfgpMz7pGUOqUwFFJdGFm2zmqJN47ta9vwOjZL
         WtkY4vs76iTBkb3s8mpetEl6IzP6mhMGHcYSP7CbzSJexkGGWqjEjnITo2H/i4XJQn8k
         bgl97F9ex20zlyinA6uUoAFuXFQP+23UVP38pWTIgQ+0RkJwhu+EIkwCN4hVfJf6sdRH
         j+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=nclIjSlJxGqqOaHzQE3LM96PQfYxITkGQPqvg5zHcyU=;
        b=Mk2LENcxD9w73kVT1cV/rBjb7h9Gt98CCMFmVq1Ggv9TiL8neCqEvnUHCQ0hB21aH8
         mn7ucl8BhsNxH2Yb4AAkeR5rpM5YsIwp18aKxd9+Bibg7xmtlQrialwmyt8ePYibv30a
         MFlIh/97h7Tc/QwVaCBJqusR+w8IL0+KJ/teM2OyK2B0ml80t7isfA+ICSCrl2HJKliK
         KPXjZvpyMbfIeIMiFYYUQP1ihH8IgXpkSD0XdZYZQl2Q0XRwqMcSAh6NFpEoGiQ+zuPA
         8XtIAmSg3O58CXmCkOK656Iro0YsDVsKMlediqUHU+6+OrAPe2iUqIGQMe+Y9+Yq9B8M
         ahaw==
X-Gm-Message-State: ACgBeo18ZM9HctvD3A6nZZlge1Qr+lfo3augCg1RW9APUOpoLzY+E0Zm
        T5xXc82KrbVsnhHikGFj6rE0QZpWKUHOXnwtdd8LO8y3
X-Google-Smtp-Source: AA6agR6oT1KObunswQHWxovBc9KRU4o/IIMsl7cBII9rThG4VaasANKrPdXrsfJUlZD9LZoXSD28zGINk4FlOzOCHko=
X-Received: by 2002:a05:6602:26c7:b0:67b:72ef:b87b with SMTP id
 g7-20020a05660226c700b0067b72efb87bmr11396447ioo.175.1660743847727; Wed, 17
 Aug 2022 06:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220815211516.3169470-1-robdclark@gmail.com> <20220815211516.3169470-2-robdclark@gmail.com>
 <327c77d5-5812-a158-6c9f-c68e15a5a6b4@amd.com> <CAF6AEGu3oxM+EX_FsLpw4m0KouMyFMLN=AGGbf=6TVQGkJ7jQg@mail.gmail.com>
 <6396ccf9-a677-427d-f5f9-12d30ad2197e@amd.com> <CAF6AEGsbc9PuSOyvhnr0ALQiLY9gSBySHyisEOfteZq9NXN0VA@mail.gmail.com>
 <8afce42b-db0e-9f71-7cd7-2680b6c9a1c9@amd.com>
In-Reply-To: <8afce42b-db0e-9f71-7cd7-2680b6c9a1c9@amd.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 17 Aug 2022 06:44:39 -0700
Message-ID: <CAF6AEGvBhx9ZFBzb8dUymhN99HPq7eTyGwVH-Uk9GQr1QjWN+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dma-buf: Add ioctl to query mmap coherency/cache info
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
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

On Wed, Aug 17, 2022 at 2:57 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> Am 16.08.22 um 19:29 schrieb Rob Clark:
> > On Tue, Aug 16, 2022 at 9:51 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 16.08.22 um 16:26 schrieb Rob Clark:
> >>> On Tue, Aug 16, 2022 at 1:27 AM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>> Am 15.08.22 um 23:15 schrieb Rob Clark:
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
> >>>>> a dma-buf fd to the VMM (crosvm or qemu).  In addition to mapping t=
he
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
> >>>>> v2: Combine with coherency, as that is a related concept.. and it i=
s
> >>>>>        relevant to the VMM whether coherent access without the SYNC=
 ioctl
> >>>>>        is possible; set map_info at export time to make it more cle=
ar
> >>>>>        that it applies for the lifetime of the dma-buf (for any mma=
p
> >>>>>        created via the dma-buf)
> >>>> Well, exactly that's a conceptual NAK from my side.
> >>>>
> >>>> The caching information can change at any time. For CPU mappings eve=
n
> >>>> without further notice from the exporter.
> >>> You should look before you criticize, as I left you a way out.. the
> >>> idea was that DMA_BUF_MAP_INCOHERENT should indicate that the buffer
> >>> cannot be mapped to the guest.  We could ofc add more DMA_BUF_MAP_*
> >>> values if something else would suit you better.  But the goal is to
> >>> give the VMM enough information to dtrt, or return an error if mappin=
g
> >>> to guest is not possible.  That seems better than assuming mapping to
> >>> guest will work and guessing about cache attrs
> >> Well I'm not rejecting the implementation, I'm rejecting this from the
> >> conceptual point of view.
> >>
> >> We intentional gave the exporter full control over the CPU mappings.
> >> This approach here breaks that now.
> >>
> >> I haven't seen the full detailed reason why we should do that and to b=
e
> >> honest KVM seems to mess with things it is not supposed to touch.
> >>
> >> For example the page reference count of mappings marked with VM_IO is =
a
> >> complete no-go. This is a very strong evidence that this was based on
> >> rather dangerous halve knowledge about the background of the handling =
here.
> >>
> >> So as long as I don't see a full explanation why KVM is grabbing
> >> reference to pages while faulting them and why we manually need to
> >> forward the caching while the hardware documentation indicates otherwi=
se
> >> I will be rejecting this whole approach.
> > Didn't we cover this on the previous iteration already.  From a host
> > kernel PoV these are just normal host userspace mappings.  The
> > userspace VMM mapping becomes the "physical address" in the guest and
> > the stage 2 translation tables map it to the guest userspace.
> >
> > The resulting cache attrs from combination of S1 and S2 translation
> > can differ.  So ideally we setup the S2 pgtables in guest aligned with
> > host userspace mappings
>
> Well exactly that is not very convincing.
>
> What you want to do is to use one channel for the address and a
> different one for the cache attrs, that's not something I would
> recommend doing in general.

How would that work.. mmap() is the channel for the address, we'd need
to introduce a new syscall that returned additional information?

> Instead the client pgtables should be setup in a way so that host can
> overwrite them.

How?  That is completely not how VMs work.  Even if the host knew
where the pgtables were and somehow magically knew the various guest
userspace VAs, it would be racey.

BR,
-R

> Regards,
> Christian.
>
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
> >>>> If the hardware can't use the caching information from the host CPU =
page
> >>>> tables directly then that pretty much completely breaks the concept =
that
> >>>> the exporter is responsible for setting up those page tables.
> >>>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>>     drivers/dma-buf/dma-buf.c    | 63 +++++++++++++++++++++++++++--=
----
> >>>>>     include/linux/dma-buf.h      | 11 ++++++
> >>>>>     include/uapi/linux/dma-buf.h | 68 +++++++++++++++++++++++++++++=
+++++++
> >>>>>     3 files changed, 132 insertions(+), 10 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >>>>> index 32f55640890c..262c4706f721 100644
> >>>>> --- a/drivers/dma-buf/dma-buf.c
> >>>>> +++ b/drivers/dma-buf/dma-buf.c
> >>>>> @@ -125,6 +125,32 @@ static struct file_system_type dma_buf_fs_type=
 =3D {
> >>>>>         .kill_sb =3D kill_anon_super,
> >>>>>     };
> >>>>>
> >>>>> +static int __dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_s=
truct *vma)
> >>>>> +{
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     /* check if buffer supports mmap */
> >>>>> +     if (!dmabuf->ops->mmap)
> >>>>> +             return -EINVAL;
> >>>>> +
> >>>>> +     ret =3D dmabuf->ops->mmap(dmabuf, vma);
> >>>>> +
> >>>>> +     /*
> >>>>> +      * If the exporter claims to support coherent access, ensure =
the
> >>>>> +      * pgprot flags match the claim.
> >>>>> +      */
> >>>>> +     if ((dmabuf->map_info !=3D DMA_BUF_MAP_INCOHERENT) && !ret) {
> >>>>> +             pgprot_t wc_prot =3D pgprot_writecombine(vma->vm_page=
_prot);
> >>>>> +             if (dmabuf->map_info =3D=3D DMA_BUF_COHERENT_WC) {
> >>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) !=
=3D pgprot_val(wc_prot));
> >>>>> +             } else {
> >>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) =
=3D=3D pgprot_val(wc_prot));
> >>>>> +             }
> >>>>> +     }
> >>>>> +
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>>     static int dma_buf_mmap_internal(struct file *file, struct vm_a=
rea_struct *vma)
> >>>>>     {
> >>>>>         struct dma_buf *dmabuf;
> >>>>> @@ -134,16 +160,12 @@ static int dma_buf_mmap_internal(struct file =
*file, struct vm_area_struct *vma)
> >>>>>
> >>>>>         dmabuf =3D file->private_data;
> >>>>>
> >>>>> -     /* check if buffer supports mmap */
> >>>>> -     if (!dmabuf->ops->mmap)
> >>>>> -             return -EINVAL;
> >>>>> -
> >>>>>         /* check for overflowing the buffer's size */
> >>>>>         if (vma->vm_pgoff + vma_pages(vma) >
> >>>>>             dmabuf->size >> PAGE_SHIFT)
> >>>>>                 return -EINVAL;
> >>>>>
> >>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
> >>>>> +     return __dma_buf_mmap(dmabuf, vma);
> >>>>>     }
> >>>>>
> >>>>>     static loff_t dma_buf_llseek(struct file *file, loff_t offset, =
int whence)
> >>>>> @@ -326,6 +348,27 @@ static long dma_buf_set_name(struct dma_buf *d=
mabuf, const char __user *buf)
> >>>>>         return 0;
> >>>>>     }
> >>>>>
> >>>>> +static long dma_buf_info(struct dma_buf *dmabuf, void __user *uarg=
)
> >>>>> +{
> >>>>> +     struct dma_buf_info arg;
> >>>>> +
> >>>>> +     if (copy_from_user(&arg, uarg, sizeof(arg)))
> >>>>> +             return -EFAULT;
> >>>>> +
> >>>>> +     switch (arg.param) {
> >>>>> +     case DMA_BUF_INFO_MAP_INFO:
> >>>>> +             arg.value =3D dmabuf->map_info;
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
> >>>>> @@ -369,6 +412,9 @@ static long dma_buf_ioctl(struct file *file,
> >>>>>         case DMA_BUF_SET_NAME_B:
> >>>>>                 return dma_buf_set_name(dmabuf, (const char __user =
*)arg);
> >>>>>
> >>>>> +     case DMA_BUF_IOCTL_INFO:
> >>>>> +             return dma_buf_info(dmabuf, (void __user *)arg);
> >>>>> +
> >>>>>         default:
> >>>>>                 return -ENOTTY;
> >>>>>         }
> >>>>> @@ -530,6 +576,7 @@ struct dma_buf *dma_buf_export(const struct dma=
_buf_export_info *exp_info)
> >>>>>         dmabuf->priv =3D exp_info->priv;
> >>>>>         dmabuf->ops =3D exp_info->ops;
> >>>>>         dmabuf->size =3D exp_info->size;
> >>>>> +     dmabuf->map_info =3D exp_info->map_info;
> >>>>>         dmabuf->exp_name =3D exp_info->exp_name;
> >>>>>         dmabuf->owner =3D exp_info->owner;
> >>>>>         spin_lock_init(&dmabuf->name_lock);
> >>>>> @@ -1245,10 +1292,6 @@ int dma_buf_mmap(struct dma_buf *dmabuf, str=
uct vm_area_struct *vma,
> >>>>>         if (WARN_ON(!dmabuf || !vma))
> >>>>>                 return -EINVAL;
> >>>>>
> >>>>> -     /* check if buffer supports mmap */
> >>>>> -     if (!dmabuf->ops->mmap)
> >>>>> -             return -EINVAL;
> >>>>> -
> >>>>>         /* check for offset overflow */
> >>>>>         if (pgoff + vma_pages(vma) < pgoff)
> >>>>>                 return -EOVERFLOW;
> >>>>> @@ -1262,7 +1305,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, stru=
ct vm_area_struct *vma,
> >>>>>         vma_set_file(vma, dmabuf->file);
> >>>>>         vma->vm_pgoff =3D pgoff;
> >>>>>
> >>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
> >>>>> +     return __dma_buf_mmap(dmabuf, vma);
> >>>>>     }
> >>>>>     EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
> >>>>>
> >>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >>>>> index 71731796c8c3..37923c8d5c24 100644
> >>>>> --- a/include/linux/dma-buf.h
> >>>>> +++ b/include/linux/dma-buf.h
> >>>>> @@ -23,6 +23,8 @@
> >>>>>     #include <linux/dma-fence.h>
> >>>>>     #include <linux/wait.h>
> >>>>>
> >>>>> +#include <uapi/linux/dma-buf.h>
> >>>>> +
> >>>>>     struct device;
> >>>>>     struct dma_buf;
> >>>>>     struct dma_buf_attachment;
> >>>>> @@ -307,6 +309,13 @@ struct dma_buf {
> >>>>>          */
> >>>>>         size_t size;
> >>>>>
> >>>>> +     /**
> >>>>> +      * @map_info:
> >>>>> +      *
> >>>>> +      * CPU mapping/coherency information for the buffer.
> >>>>> +      */
> >>>>> +     enum dma_buf_map_info map_info;
> >>>>> +
> >>>>>         /**
> >>>>>          * @file:
> >>>>>          *
> >>>>> @@ -533,6 +542,7 @@ struct dma_buf_attachment {
> >>>>>      * @ops:    Attach allocator-defined dma buf ops to the new buf=
fer
> >>>>>      * @size:   Size of the buffer - invariant over the lifetime of=
 the buffer
> >>>>>      * @flags:  mode flags for the file
> >>>>> + * @map_info:        CPU mapping/coherency information for the buf=
fer
> >>>>>      * @resv:   reservation-object, NULL to allocate default one
> >>>>>      * @priv:   Attach private data of allocator to this buffer
> >>>>>      *
> >>>>> @@ -545,6 +555,7 @@ struct dma_buf_export_info {
> >>>>>         const struct dma_buf_ops *ops;
> >>>>>         size_t size;
> >>>>>         int flags;
> >>>>> +     enum dma_buf_map_info map_info;
> >>>>>         struct dma_resv *resv;
> >>>>>         void *priv;
> >>>>>     };
> >>>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-=
buf.h
> >>>>> index b1523cb8ab30..07b403ffdb43 100644
> >>>>> --- a/include/uapi/linux/dma-buf.h
> >>>>> +++ b/include/uapi/linux/dma-buf.h
> >>>>> @@ -85,6 +85,72 @@ struct dma_buf_sync {
> >>>>>
> >>>>>     #define DMA_BUF_NAME_LEN    32
> >>>>>
> >>>>> +/**
> >>>>> + * enum dma_buf_map_info - CPU mapping info
> >>>>> + *
> >>>>> + * This enum describes coherency of a userspace mapping of the dma=
buf.
> >>>>> + *
> >>>>> + * Importing devices should check dma_buf::map_info flag and rejec=
t an
> >>>>> + * import if unsupported.  For example, if the exporting device us=
es
> >>>>> + * @DMA_BUF_COHERENT_CACHED but the importing device does not supp=
ort
> >>>>> + * CPU cache coherency, the dma-buf import should fail.
> >>>>> + */
> >>>>> +enum dma_buf_map_info {
> >>>>> +     /**
> >>>>> +      * @DMA_BUF_MAP_INCOHERENT: CPU mapping is incoherent.
> >>>>> +      *
> >>>>> +      * Use of DMA_BUF_IOCTL_SYNC is required for CPU managed cohe=
renency.
> >>>>> +      */
> >>>>> +     DMA_BUF_MAP_INCOHERENT,
> >>>>> +
> >>>>> +     /**
> >>>>> +      * @DMA_BUF_COHERENT_WC: CPU mapping is coherent but not cach=
ed.
> >>>>> +      *
> >>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not =
required.
> >>>>> +      * However fences may be still required for synchronizing acc=
ess.  Ie.
> >>>>> +      * coherency can only be relied upon by an explicit-fencing u=
serspace.
> >>>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_SY=
NC.
> >>>>> +      *
> >>>>> +      * The cpu mapping is writecombine.
> >>>>> +      */
> >>>>> +     DMA_BUF_COHERENT_WC,
> >>>>> +
> >>>>> +     /**
> >>>>> +      * @DMA_BUF_COHERENT_CACHED: CPU mapping is coherent and CPU =
cached.
> >>>>> +      *
> >>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not =
required.
> >>>>> +      * However fences may be still required for synchronizing acc=
ess.  Ie.
> >>>>> +      * coherency can only be relied upon by an explicit-fencing u=
serspace.
> >>>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_SY=
NC.
> >>>>> +      *
> >>>>> +      * The cpu mapping is cached.
> >>>>> +      */
> >>>>> +     DMA_BUF_COHERENT_CACHED,
> >>>>> +};
> >>>>> +
> >>>>> +/**
> >>>>> + * struct dma_buf_info - Query info about the buffer.
> >>>>> + */
> >>>>> +struct dma_buf_info {
> >>>>> +
> >>>>> +#define DMA_BUF_INFO_MAP_INFO    1
> >>>>> +
> >>>>> +     /**
> >>>>> +      * @param: Which param to query
> >>>>> +      *
> >>>>> +      * DMA_BUF_INFO_MAP_INFO:
> >>>>> +      *     Returns enum dma_buf_map_info, describing the coherenc=
y and
> >>>>> +      *     caching of a CPU mapping of the buffer.
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
> >>>>> @@ -95,4 +161,6 @@ struct dma_buf_sync {
> >>>>>     #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, __u32)
> >>>>>     #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, __u64)
> >>>>>
> >>>>> +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct dma_buf=
_info)
> >>>>> +
> >>>>>     #endif
>
