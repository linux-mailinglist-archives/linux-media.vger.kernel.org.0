Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4203C678B
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 02:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233797AbhGMAqJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 20:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233765AbhGMAqI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 20:46:08 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AA5C0613DD
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 17:43:19 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id x192so32006299ybe.6
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 17:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vaSytHjBNZxzqMPH1WnwtrqAyIHo6x1Sku92fcfEEnM=;
        b=StReeKahgRIN1iIBGwqgOn4WXL3L6xi10TbzdNaPDXugh7g5w+cK/dAjEhhfw+Cw4/
         q6g2xLv43qhm/Ab7aDp7sFSixvZrc66MZow2D8vb/lcJlBiT+GG7jtKpnLY0k4ymIPzR
         gyyGTI5GxkcAbYy6wq99IANtp/VTtUhcBDAUoeRF8vDO8/SfjTccneLqPXA0acFqHSmx
         P25CYHZCJJvc1wWJaq11eLvL0HIGiBJq5y0kdL14/OIrWbx7yljSOLRu7WITYF8CGS5/
         Nji+dv3fmSZo33WIINh/RwfJHTpi12W5bg82YoFasMD1ntlqIcoHvldiBnNgcqkF0sbA
         if/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vaSytHjBNZxzqMPH1WnwtrqAyIHo6x1Sku92fcfEEnM=;
        b=SQ3q9xIfjUd4dKher7lkvZsSHPBgyZdnEcfP+7tMY+WmUAxWTKDgJE9X2kBVosQW+u
         WnXAk0K6xKftBsE0sx7AKjpG437OWxmQS8OPWLeXR52sZyffxLPdi2UQpuJ6R6fNOD4G
         0lT2HYiaRlUEosLQNltLHlfw7FgW3TyYW0/PFc5yfSfnX/ivVlbjTqWNb+BiOSfsc8g+
         /zYKYuJj/T2crph1/ZwI45aRPVBzzVzxQAa4yBiuDDCtGUsEvyWspAwMD8c4cu3d8Twx
         O7BVjPOTvljs+Z5ATeXxxjiA7BYrCm3AtgBHRCYVcIWFrDPE4sJSuFCGBfoDjEjzbUCA
         jz0Q==
X-Gm-Message-State: AOAM533WX+q+0e3qPEEGjmgxQy9+Zirbkl1FCE2FDU7mkCn7ZA2Puchj
        eXLqFf+QKnGY3SWQrFEmg3E9aWlM7ef+vTMBiL+k5w==
X-Google-Smtp-Source: ABdhPJyiKI1MOfJfLAwdIsZL1YpLfx5fPdkQgudhx0cangNZRj1iK40tLqO9GMDvnJW8al5Bx1r+v4PmysNdzyZyQ/M=
X-Received: by 2002:a25:2589:: with SMTP id l131mr2261453ybl.259.1626136997169;
 Mon, 12 Jul 2021 17:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210710051027.42828-1-hridya@google.com> <4638d2fd-d8cd-d38b-b935-8ac8c0a935c8@amd.com>
In-Reply-To: <4638d2fd-d8cd-d38b-b935-8ac8c0a935c8@amd.com>
From:   Hridya Valsaraju <hridya@google.com>
Date:   Mon, 12 Jul 2021 17:42:41 -0700
Message-ID: <CA+wgaPNK203XUBMRiHL=8z5erLnNi6yJK=LxO_354aKECdZ75A@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Delete the DMA-BUF attachment sysfs statistics
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     daniel@ffwll.ch, Sumit Semwal <sumit.semwal@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        kernel-team@android.com, john.stultz@linaro.org, surenb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jul 11, 2021 at 11:43 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 10.07.21 um 07:10 schrieb Hridya Valsaraju:
> > The DMA-BUF attachment statistics form a subset of the DMA-BUF
> > sysfs statistics that recently merged to the drm-misc tree.
> > Since there has been a reported a performance regression due to the
> > overhead of sysfs directory creation/teardown during
> > dma_buf_attach()/dma_buf_detach(), this patch deletes the DMA-BUF
> > attachment statistics from sysfs.
> >
> > Fixes: bdb8d06dfefd (dmabuf: Add the capability to expose DMA-BUF stats
> > in sysfs)
> > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > ---
> >
> > Hello all,
> >
> > One of our partners recently reported a perf regression in a driver
> > which was being caused due to the overhead of setup/teardown of the
> > sysfs attachment statistics in the dma_buf_attach()/dma_buf_detach()
> > invocations. Since the driver's latency requirements were of the order
> > of microseconds(~100us), the overhead was significant.
>
> I find it rather questionable to rely on the performance of attach cause
> that can easily take more than 10ms depending on memory migration needs
> of the exporter.
>
> You should probably consider changing this use case to use cached
> attachments instead.

 I agree, I will convey the same to the partner.

>
> > Since this indicates that the solution might not work well for
> > all DMA-BUF importers, I think the right thing to do might be to delete
> > the same before it reaches upstream and becomes ABI :( I apologize for
> > the inconvenience.
>
> The information that this is not UABI yet should be part of the commit
> message.

Yes, I will update the commit message to include the same.

>
> Apart from that feel free to add Reviewed-by: Christian K=C3=B6nig
> <christian.koenig@amd.com>

Thank you for the reviews Christian and Greg.

>
> >
> > This patch is based on the drm-misc-next branch. Please feel free to
> > let me know if you would prefer that I send a full revert and new patch=
 that
> > adds the rest of the statistics.
>
> Yeah, that's perfectly ok. Please provide a v2 with updated commit
> message and I can push that ASAP.

Thanks Christian. I will update the commit message and send out v2 soon.

Regards,
Hridya

>
> Regards,
> Christian.
>
> >
> > Regards,
> > Hridya
> >
> >   .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  28 ----
> >   drivers/dma-buf/dma-buf-sysfs-stats.c         | 140 +----------------=
-
> >   drivers/dma-buf/dma-buf-sysfs-stats.h         |  27 ----
> >   drivers/dma-buf/dma-buf.c                     |  16 --
> >   include/linux/dma-buf.h                       |  17 ---
> >   5 files changed, 4 insertions(+), 224 deletions(-)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers b/Do=
cumentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> > index a243984ed420..5d3bc997dc64 100644
> > --- a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> > +++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> > @@ -22,31 +22,3 @@ KernelVersion:     v5.13
> >   Contact:    Hridya Valsaraju <hridya@google.com>
> >   Description:        This file is read-only and specifies the size of =
the DMA-BUF in
> >               bytes.
> > -
> > -What:                /sys/kernel/dmabuf/buffers/<inode_number>/attachm=
ents
> > -Date:                May 2021
> > -KernelVersion:       v5.13
> > -Contact:     Hridya Valsaraju <hridya@google.com>
> > -Description: This directory will contain subdirectories representing e=
very
> > -             attachment of the DMA-BUF.
> > -
> > -What:                /sys/kernel/dmabuf/buffers/<inode_number>/attachm=
ents/<attachment_uid>
> > -Date:                May 2021
> > -KernelVersion:       v5.13
> > -Contact:     Hridya Valsaraju <hridya@google.com>
> > -Description: This directory will contain information on the attached d=
evice
> > -             and the number of current distinct device mappings.
> > -
> > -What:                /sys/kernel/dmabuf/buffers/<inode_number>/attachm=
ents/<attachment_uid>/device
> > -Date:                May 2021
> > -KernelVersion:       v5.13
> > -Contact:     Hridya Valsaraju <hridya@google.com>
> > -Description: This file is read-only and is a symlink to the attached d=
evice's
> > -             sysfs entry.
> > -
> > -What:                /sys/kernel/dmabuf/buffers/<inode_number>/attachm=
ents/<attachment_uid>/map_counter
> > -Date:                May 2021
> > -KernelVersion:       v5.13
> > -Contact:     Hridya Valsaraju <hridya@google.com>
> > -Description: This file is read-only and contains a map_counter indicat=
ing the
> > -             number of distinct device mappings of the attachment.
> > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dm=
a-buf-sysfs-stats.c
> > index a2638e84199c..053baadcada9 100644
> > --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> > +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> > @@ -40,14 +40,11 @@
> >    *
> >    * * ``/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name``
> >    * * ``/sys/kernel/dmabuf/buffers/<inode_number>/size``
> > - * * ``/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_u=
id>/device``
> > - * * ``/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_u=
id>/map_counter``
> >    *
> > - * The information in the interface can also be used to derive per-exp=
orter and
> > - * per-device usage statistics. The data from the interface can be gat=
hered
> > - * on error conditions or other important events to provide a snapshot=
 of
> > - * DMA-BUF usage. It can also be collected periodically by telemetry t=
o monitor
> > - * various metrics.
> > + * The information in the interface can also be used to derive per-exp=
orter
> > + * statistics. The data from the interface can be gathered on error co=
nditions
> > + * or other important events to provide a snapshot of DMA-BUF usage.
> > + * It can also be collected periodically by telemetry to monitor vario=
us metrics.
> >    *
> >    * Detailed documentation about the interface is present in
> >    * Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers.
> > @@ -121,120 +118,6 @@ static struct kobj_type dma_buf_ktype =3D {
> >       .default_groups =3D dma_buf_stats_default_groups,
> >   };
> >
> > -#define to_dma_buf_attach_entry_from_kobj(x) container_of(x, struct dm=
a_buf_attach_sysfs_entry, kobj)
> > -
> > -struct dma_buf_attach_stats_attribute {
> > -     struct attribute attr;
> > -     ssize_t (*show)(struct dma_buf_attach_sysfs_entry *sysfs_entry,
> > -                     struct dma_buf_attach_stats_attribute *attr, char=
 *buf);
> > -};
> > -#define to_dma_buf_attach_stats_attr(x) container_of(x, struct dma_buf=
_attach_stats_attribute, attr)
> > -
> > -static ssize_t dma_buf_attach_stats_attribute_show(struct kobject *kob=
j,
> > -                                                struct attribute *attr=
,
> > -                                                char *buf)
> > -{
> > -     struct dma_buf_attach_stats_attribute *attribute;
> > -     struct dma_buf_attach_sysfs_entry *sysfs_entry;
> > -
> > -     attribute =3D to_dma_buf_attach_stats_attr(attr);
> > -     sysfs_entry =3D to_dma_buf_attach_entry_from_kobj(kobj);
> > -
> > -     if (!attribute->show)
> > -             return -EIO;
> > -
> > -     return attribute->show(sysfs_entry, attribute, buf);
> > -}
> > -
> > -static const struct sysfs_ops dma_buf_attach_stats_sysfs_ops =3D {
> > -     .show =3D dma_buf_attach_stats_attribute_show,
> > -};
> > -
> > -static ssize_t map_counter_show(struct dma_buf_attach_sysfs_entry *sys=
fs_entry,
> > -                             struct dma_buf_attach_stats_attribute *at=
tr,
> > -                             char *buf)
> > -{
> > -     return sysfs_emit(buf, "%u\n", sysfs_entry->map_counter);
> > -}
> > -
> > -static struct dma_buf_attach_stats_attribute map_counter_attribute =3D
> > -     __ATTR_RO(map_counter);
> > -
> > -static struct attribute *dma_buf_attach_stats_default_attrs[] =3D {
> > -     &map_counter_attribute.attr,
> > -     NULL,
> > -};
> > -ATTRIBUTE_GROUPS(dma_buf_attach_stats_default);
> > -
> > -static void dma_buf_attach_sysfs_release(struct kobject *kobj)
> > -{
> > -     struct dma_buf_attach_sysfs_entry *sysfs_entry;
> > -
> > -     sysfs_entry =3D to_dma_buf_attach_entry_from_kobj(kobj);
> > -     kfree(sysfs_entry);
> > -}
> > -
> > -static struct kobj_type dma_buf_attach_ktype =3D {
> > -     .sysfs_ops =3D &dma_buf_attach_stats_sysfs_ops,
> > -     .release =3D dma_buf_attach_sysfs_release,
> > -     .default_groups =3D dma_buf_attach_stats_default_groups,
> > -};
> > -
> > -void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach)
> > -{
> > -     struct dma_buf_attach_sysfs_entry *sysfs_entry;
> > -
> > -     sysfs_entry =3D attach->sysfs_entry;
> > -     if (!sysfs_entry)
> > -             return;
> > -
> > -     sysfs_delete_link(&sysfs_entry->kobj, &attach->dev->kobj, "device=
");
> > -
> > -     kobject_del(&sysfs_entry->kobj);
> > -     kobject_put(&sysfs_entry->kobj);
> > -}
> > -
> > -int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
> > -                            unsigned int uid)
> > -{
> > -     struct dma_buf_attach_sysfs_entry *sysfs_entry;
> > -     int ret;
> > -     struct dma_buf *dmabuf;
> > -
> > -     if (!attach)
> > -             return -EINVAL;
> > -
> > -     dmabuf =3D attach->dmabuf;
> > -
> > -     sysfs_entry =3D kzalloc(sizeof(struct dma_buf_attach_sysfs_entry)=
,
> > -                           GFP_KERNEL);
> > -     if (!sysfs_entry)
> > -             return -ENOMEM;
> > -
> > -     sysfs_entry->kobj.kset =3D dmabuf->sysfs_entry->attach_stats_kset=
;
> > -
> > -     attach->sysfs_entry =3D sysfs_entry;
> > -
> > -     ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_attach_=
ktype,
> > -                                NULL, "%u", uid);
> > -     if (ret)
> > -             goto kobj_err;
> > -
> > -     ret =3D sysfs_create_link(&sysfs_entry->kobj, &attach->dev->kobj,
> > -                             "device");
> > -     if (ret)
> > -             goto link_err;
> > -
> > -     return 0;
> > -
> > -link_err:
> > -     kobject_del(&sysfs_entry->kobj);
> > -kobj_err:
> > -     kobject_put(&sysfs_entry->kobj);
> > -     attach->sysfs_entry =3D NULL;
> > -
> > -     return ret;
> > -}
> >   void dma_buf_stats_teardown(struct dma_buf *dmabuf)
> >   {
> >       struct dma_buf_sysfs_entry *sysfs_entry;
> > @@ -243,7 +126,6 @@ void dma_buf_stats_teardown(struct dma_buf *dmabuf)
> >       if (!sysfs_entry)
> >               return;
> >
> > -     kset_unregister(sysfs_entry->attach_stats_kset);
> >       kobject_del(&sysfs_entry->kobj);
> >       kobject_put(&sysfs_entry->kobj);
> >   }
> > @@ -290,7 +172,6 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
> >   {
> >       struct dma_buf_sysfs_entry *sysfs_entry;
> >       int ret;
> > -     struct kset *attach_stats_kset;
> >
> >       if (!dmabuf || !dmabuf->file)
> >               return -EINVAL;
> > @@ -315,21 +196,8 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
> >       if (ret)
> >               goto err_sysfs_dmabuf;
> >
> > -     /* create the directory for attachment stats */
> > -     attach_stats_kset =3D kset_create_and_add("attachments",
> > -                                             &dmabuf_sysfs_no_uevent_o=
ps,
> > -                                             &sysfs_entry->kobj);
> > -     if (!attach_stats_kset) {
> > -             ret =3D -ENOMEM;
> > -             goto err_sysfs_attach;
> > -     }
> > -
> > -     sysfs_entry->attach_stats_kset =3D attach_stats_kset;
> > -
> >       return 0;
> >
> > -err_sysfs_attach:
> > -     kobject_del(&sysfs_entry->kobj);
> >   err_sysfs_dmabuf:
> >       kobject_put(&sysfs_entry->kobj);
> >       dmabuf->sysfs_entry =3D NULL;
> > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dm=
a-buf-sysfs-stats.h
> > index 5f4703249117..a49c6e2650cc 100644
> > --- a/drivers/dma-buf/dma-buf-sysfs-stats.h
> > +++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
> > @@ -14,23 +14,8 @@ int dma_buf_init_sysfs_statistics(void);
> >   void dma_buf_uninit_sysfs_statistics(void);
> >
> >   int dma_buf_stats_setup(struct dma_buf *dmabuf);
> > -int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
> > -                            unsigned int uid);
> > -static inline void dma_buf_update_attachment_map_count(struct dma_buf_=
attachment *attach,
> > -                                                    int delta)
> > -{
> > -     struct dma_buf_attach_sysfs_entry *entry =3D attach->sysfs_entry;
> >
> > -     entry->map_counter +=3D delta;
> > -}
> >   void dma_buf_stats_teardown(struct dma_buf *dmabuf);
> > -void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach);
> > -static inline unsigned int dma_buf_update_attach_uid(struct dma_buf *d=
mabuf)
> > -{
> > -     struct dma_buf_sysfs_entry *entry =3D dmabuf->sysfs_entry;
> > -
> > -     return entry->attachment_uid++;
> > -}
> >   #else
> >
> >   static inline int dma_buf_init_sysfs_statistics(void)
> > @@ -44,19 +29,7 @@ static inline int dma_buf_stats_setup(struct dma_buf=
 *dmabuf)
> >   {
> >       return 0;
> >   }
> > -static inline int dma_buf_attach_stats_setup(struct dma_buf_attachment=
 *attach,
> > -                                          unsigned int uid)
> > -{
> > -     return 0;
> > -}
> >
> >   static inline void dma_buf_stats_teardown(struct dma_buf *dmabuf) {}
> > -static inline void dma_buf_attach_stats_teardown(struct dma_buf_attach=
ment *attach) {}
> > -static inline void dma_buf_update_attachment_map_count(struct dma_buf_=
attachment *attach,
> > -                                                    int delta) {}
> > -static inline unsigned int dma_buf_update_attach_uid(struct dma_buf *d=
mabuf)
> > -{
> > -     return 0;
> > -}
> >   #endif
> >   #endif // _DMA_BUF_SYSFS_STATS_H
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 510b42771974..b1a6db71c656 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -738,7 +738,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, stru=
ct device *dev,
> >   {
> >       struct dma_buf_attachment *attach;
> >       int ret;
> > -     unsigned int attach_uid;
> >
> >       if (WARN_ON(!dmabuf || !dev))
> >               return ERR_PTR(-EINVAL);
> > @@ -764,13 +763,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, str=
uct device *dev,
> >       }
> >       dma_resv_lock(dmabuf->resv, NULL);
> >       list_add(&attach->node, &dmabuf->attachments);
> > -     attach_uid =3D dma_buf_update_attach_uid(dmabuf);
> >       dma_resv_unlock(dmabuf->resv);
> >
> > -     ret =3D dma_buf_attach_stats_setup(attach, attach_uid);
> > -     if (ret)
> > -             goto err_sysfs;
> > -
> >       /* When either the importer or the exporter can't handle dynamic
> >        * mappings we cache the mapping here to avoid issues with the
> >        * reservation object lock.
> > @@ -797,7 +791,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, stru=
ct device *dev,
> >                       dma_resv_unlock(attach->dmabuf->resv);
> >               attach->sgt =3D sgt;
> >               attach->dir =3D DMA_BIDIRECTIONAL;
> > -             dma_buf_update_attachment_map_count(attach, 1 /* delta */=
);
> >       }
> >
> >       return attach;
> > @@ -814,7 +807,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, stru=
ct device *dev,
> >       if (dma_buf_is_dynamic(attach->dmabuf))
> >               dma_resv_unlock(attach->dmabuf->resv);
> >
> > -err_sysfs:
> >       dma_buf_detach(dmabuf, attach);
> >       return ERR_PTR(ret);
> >   }
> > @@ -864,7 +856,6 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct =
dma_buf_attachment *attach)
> >                       dma_resv_lock(attach->dmabuf->resv, NULL);
> >
> >               __unmap_dma_buf(attach, attach->sgt, attach->dir);
> > -             dma_buf_update_attachment_map_count(attach, -1 /* delta *=
/);
> >
> >               if (dma_buf_is_dynamic(attach->dmabuf)) {
> >                       dmabuf->ops->unpin(attach);
> > @@ -878,7 +869,6 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct =
dma_buf_attachment *attach)
> >       if (dmabuf->ops->detach)
> >               dmabuf->ops->detach(dmabuf, attach);
> >
> > -     dma_buf_attach_stats_teardown(attach);
> >       kfree(attach);
> >   }
> >   EXPORT_SYMBOL_GPL(dma_buf_detach);
> > @@ -1020,10 +1010,6 @@ struct sg_table *dma_buf_map_attachment(struct d=
ma_buf_attachment *attach,
> >               }
> >       }
> >   #endif /* CONFIG_DMA_API_DEBUG */
> > -
> > -     if (!IS_ERR(sg_table))
> > -             dma_buf_update_attachment_map_count(attach, 1 /* delta */=
);
> > -
> >       return sg_table;
> >   }
> >   EXPORT_SYMBOL_GPL(dma_buf_map_attachment);
> > @@ -1061,8 +1047,6 @@ void dma_buf_unmap_attachment(struct dma_buf_atta=
chment *attach,
> >       if (dma_buf_is_dynamic(attach->dmabuf) &&
> >           !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> >               dma_buf_unpin(attach);
> > -
> > -     dma_buf_update_attachment_map_count(attach, -1 /* delta */);
> >   }
> >   EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
> >
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 2b814fde0d11..678b2006be78 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -444,15 +444,6 @@ struct dma_buf {
> >       struct dma_buf_sysfs_entry {
> >               struct kobject kobj;
> >               struct dma_buf *dmabuf;
> > -
> > -             /**
> > -              * @sysfs_entry.attachment_uid:
> > -              *
> > -              * This is protected by the dma_resv_lock() on @resv and =
is
> > -              * incremented on each attach.
> > -              */
> > -             unsigned int attachment_uid;
> > -             struct kset *attach_stats_kset;
> >       } *sysfs_entry;
> >   #endif
> >   };
> > @@ -504,7 +495,6 @@ struct dma_buf_attach_ops {
> >    * @importer_ops: importer operations for this attachment, if provide=
d
> >    * dma_buf_map/unmap_attachment() must be called with the dma_resv lo=
ck held.
> >    * @importer_priv: importer specific attachment data.
> > - * @sysfs_entry: For exposing information about this attachment in sys=
fs.
> >    *
> >    * This structure holds the attachment information between the dma_bu=
f buffer
> >    * and its user device(s). The list contains one attachment struct pe=
r device
> > @@ -525,13 +515,6 @@ struct dma_buf_attachment {
> >       const struct dma_buf_attach_ops *importer_ops;
> >       void *importer_priv;
> >       void *priv;
> > -#ifdef CONFIG_DMABUF_SYSFS_STATS
> > -     /* for sysfs stats */
> > -     struct dma_buf_attach_sysfs_entry {
> > -             struct kobject kobj;
> > -             unsigned int map_counter;
> > -     } *sysfs_entry;
> > -#endif
> >   };
> >
> >   /**
>
