Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE5AF5AFE37
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 09:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbiIGH5U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 03:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbiIGH5S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 03:57:18 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D4AA720A;
        Wed,  7 Sep 2022 00:57:12 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-127f5411b9cso2759221fac.4;
        Wed, 07 Sep 2022 00:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=Qw2l2dKSKd2YLbeWRoh7YxUvU5Nv0dLKebPZixHGBN8=;
        b=IgTxk9zikOhalSYTqbVYGUcK6g/rLqv265xBJi+b9t/2g1iFXamPYXLIO1ET0SPzB5
         XLf1kX/NtN0YtZVsV4evHRL0MA4kAQiik1SusgZZaQlpOf3N97KXhpAvH4BYRlGycHrp
         G2CJiSDsWyQIoXSqWJz7oddQ5fCMkx7vWBIrYuKWu3y73SiixUFtj3FMq8VvOGc5TVtW
         QHU8cJHUQi8gZW5oDbwG4lriR9IfMygv6KrrkfjCKGFyBuSPLZNY8njDWfkRrGO9W5hY
         Rclh11dqwLcJB3gj5AtZn3YfSQwEJH3hmPimy/seXDQssQvZT9uUnOUrU2c2FKvImtHL
         gBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Qw2l2dKSKd2YLbeWRoh7YxUvU5Nv0dLKebPZixHGBN8=;
        b=EDjJVuOjoYBb80T/fQYJrIEUh4J10Ko5Flgz4CSL8aT7QElEZ+rChctig1ijeu9Bqp
         VsKVU4ZD1wj53CZD6JZtRfq91ZeuYDdqZYansITS1OPcTr6mKQ2VjlekShFylByoc4ef
         1R26XbEMUlGJ8G6GVDdm/elQ7cl2svQ1k/ho0SMMU2cgd6bNBGYQ1NzZTrULs1/CfMLU
         7OmWDLp4nvOtYN4w9DLL6Mw9XiD8n9Tsp+xg45I2WM1ifvGBH0LM2KAmIoTk/pyEK6Jw
         KAxIW/eVSB3IEvKdkfuigP9VhmqaCz4gDy0t+IJexKOmTkiKKN4s1/BTkA3bg5pqW8+e
         1F3g==
X-Gm-Message-State: ACgBeo3G5jRztQfayMH5OM5z7/NefroDKsWmnKOzjr36OWlDiRn0nQgl
        1TZ1StNJjXM3O16ckNP5IWmXYlI2evSG8562hCg=
X-Google-Smtp-Source: AA6agR6bZ94mEIf2yGD/4l5J+phi9NkSnE3taatkvaNY+Zk6k6NpZm+UAPCeuA80bnssa5SuuEeRDLVGrb3OYq7S2J8=
X-Received: by 2002:a05:6870:b692:b0:11d:482f:3642 with SMTP id
 cy18-20020a056870b69200b0011d482f3642mr1120605oab.38.1662537431569; Wed, 07
 Sep 2022 00:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220801170459.1593706-1-robdclark@gmail.com> <20220801170459.1593706-2-robdclark@gmail.com>
 <YxejqOuHTjoO/iXg@phenom.ffwll.local>
In-Reply-To: <YxejqOuHTjoO/iXg@phenom.ffwll.local>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 7 Sep 2022 00:57:00 -0700
Message-ID: <CAF6AEGvUqoCegMZY-h9O6_vc1i=gD-TPHnFyvCjDA558Xn_5dw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v2 1/3] dma-buf: Add ioctl to query mmap info
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 6, 2022 at 12:46 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Aug 01, 2022 at 10:04:55AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This is a fairly narrowly focused interface, providing a way for a VMM
> > in userspace to tell the guest kernel what pgprot settings to use when
> > mapping a buffer to guest userspace.
> >
> > For buffers that get mapped into guest userspace, virglrenderer returns
> > a dma-buf fd to the VMM (crosvm or qemu).  In addition to mapping the
> > pages into the guest VM, it needs to report to drm/virtio in the guest
> > the cache settings to use for guest userspace.  In particular, on some
> > architectures, creating aliased mappings with different cache attributes
> > is frowned upon, so it is important that the guest mappings have the
> > same cache attributes as any potential host mappings.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> > v2. fix compiler warning
>
> I think I bikeshedded this on irc already, here for the record too.

You should look at v3 (which I confusingly titled as v2, sry):

https://patchwork.freedesktop.org/patch/497799/?series=106847&rev=3

> - this wont work for buffers which do change the mapping when they move
>   (ttm can do that). And cros does make noises about discrete gpus I've
>   heard, this matters even for you :-)

Correct, in v3 you could use DMA_BUF_MAP_INCOHERENT for this case (or
we could add additional enum values.. DMA_BUF_MAP_IDK or whatever)

re: dgpu, I guess those will be pass-thru so not so relevant for this issue

> - I'm pretty sure this will put is even more onto the nasty people list
>   that dma-api folks maintain, especially with passing this all to
>   userspace
> - follow_pte() can figure this out internally in the kernel and kvm is
>   already using this, and I think doing this all internally with mmu
>   notifier and what not to make sure it all stays in sync is the right
>   approach. So your kvm/whatever combo should be able to figure out wth
>   it's supposed to be doing.

This doesn't help, because the VMM is in userspace.. it is the VMM
which needs this information.

> I think if you make this a virtio special case like we've done with the
> magic uuid stuff, then that would make sense. Making it a full dma-buf
> interface doesn't imo.

IMHO we can consider this (at least in case of v3) as a virtio
special, at least in the sense that it is opt-in for the exporting
driver, and exporting drivers are free to not play along

BR,
-R

>
> Cheers, Daniel
>
> >
> >  drivers/dma-buf/dma-buf.c    | 26 ++++++++++++++++++++++++++
> >  include/linux/dma-buf.h      |  7 +++++++
> >  include/uapi/linux/dma-buf.h | 28 ++++++++++++++++++++++++++++
> >  3 files changed, 61 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 32f55640890c..87c52f080274 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -326,6 +326,29 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
> >       return 0;
> >  }
> >
> > +static long dma_buf_info(struct dma_buf *dmabuf, void __user *uarg)
> > +{
> > +     struct dma_buf_info arg;
> > +
> > +     if (copy_from_user(&arg, uarg, sizeof(arg)))
> > +             return -EFAULT;
> > +
> > +     switch (arg.param) {
> > +     case DMA_BUF_INFO_VM_PROT:
> > +             if (!dmabuf->ops->mmap_info)
> > +                     return -ENOSYS;
> > +             arg.value = dmabuf->ops->mmap_info(dmabuf);
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (copy_to_user(uarg, &arg, sizeof(arg)))
> > +             return -EFAULT;
> > +
> > +     return 0;
> > +}
> > +
> >  static long dma_buf_ioctl(struct file *file,
> >                         unsigned int cmd, unsigned long arg)
> >  {
> > @@ -369,6 +392,9 @@ static long dma_buf_ioctl(struct file *file,
> >       case DMA_BUF_SET_NAME_B:
> >               return dma_buf_set_name(dmabuf, (const char __user *)arg);
> >
> > +     case DMA_BUF_IOCTL_INFO:
> > +             return dma_buf_info(dmabuf, (void __user *)arg);
> > +
> >       default:
> >               return -ENOTTY;
> >       }
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 71731796c8c3..6f4de64a5937 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -283,6 +283,13 @@ struct dma_buf_ops {
> >        */
> >       int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
> >
> > +     /**
> > +      * @mmap_info:
> > +      *
> > +      * Return mmapping info for the buffer.  See DMA_BUF_INFO_VM_PROT.
> > +      */
> > +     int (*mmap_info)(struct dma_buf *);
> > +
> >       int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> >       void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> >  };
> > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> > index b1523cb8ab30..a41adac0f46a 100644
> > --- a/include/uapi/linux/dma-buf.h
> > +++ b/include/uapi/linux/dma-buf.h
> > @@ -85,6 +85,32 @@ struct dma_buf_sync {
> >
> >  #define DMA_BUF_NAME_LEN     32
> >
> > +
> > +/**
> > + * struct dma_buf_info - Query info about the buffer.
> > + */
> > +struct dma_buf_info {
> > +
> > +#define DMA_BUF_INFO_VM_PROT      1
> > +#  define DMA_BUF_VM_PROT_WC      0
> > +#  define DMA_BUF_VM_PROT_CACHED  1
> > +
> > +     /**
> > +      * @param: Which param to query
> > +      *
> > +      * DMA_BUF_INFO_BM_PROT:
> > +      *     Query the access permissions of userspace mmap's of this buffer.
> > +      *     Returns one of DMA_BUF_VM_PROT_x
> > +      */
> > +     __u32 param;
> > +     __u32 pad;
> > +
> > +     /**
> > +      * @value: Return value of the query.
> > +      */
> > +     __u64 value;
> > +};
> > +
> >  #define DMA_BUF_BASE         'b'
> >  #define DMA_BUF_IOCTL_SYNC   _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
> >
> > @@ -95,4 +121,6 @@ struct dma_buf_sync {
> >  #define DMA_BUF_SET_NAME_A   _IOW(DMA_BUF_BASE, 1, __u32)
> >  #define DMA_BUF_SET_NAME_B   _IOW(DMA_BUF_BASE, 1, __u64)
> >
> > +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct dma_buf_info)
> > +
> >  #endif
> > --
> > 2.36.1
> >
> > _______________________________________________
> > Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> > To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
