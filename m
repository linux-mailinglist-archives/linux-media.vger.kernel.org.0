Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 576632D6813
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 21:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393761AbgLJUHF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 15:07:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393754AbgLJUG7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 15:06:59 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B4CC0613CF
        for <linux-media@vger.kernel.org>; Thu, 10 Dec 2020 12:06:12 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id f14so4692577qto.12
        for <linux-media@vger.kernel.org>; Thu, 10 Dec 2020 12:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lXt80rfOKWzjOUb8F0f6OaGYzYMpuItv2/h9E6Snzrk=;
        b=DjVjLcECBABvGWbqI80/uiXJbmjuStV3KVILJyPl/BjG8Ogff43MQoscFK1w6YAq1U
         nE/TkSQ+NIvERTxAEt3khosY+sxBnY6RL/vIsh7scbKeEvDEVG/PWTY9MVj7A3PGOd8D
         HuAJtSJ33iv3kGbA84udadQOZIzfD0+8XyaTKLQXb8leekKRuiQzS7X/JEjehyym0pUb
         wMRpwCjHTx+GWhoPtTfmNrRlwqLoYn28E8IAEuOyL+VQjybABI1pHiJTmjLn09uI/6Nv
         LYf7ODJ0TM+4e6Zff5kmvukFvgCsrx75I8NW+FuOS8W6TOonkTZyjMcUblyntGpXDkmT
         yYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lXt80rfOKWzjOUb8F0f6OaGYzYMpuItv2/h9E6Snzrk=;
        b=M4phJJ+0hLD05hbjpdCp1Jrv+g9s3StvWFast7drfw0ZuxZ7L6f4E07qd9z/TYKB3v
         cnboRmdYswHDWxGWglGUfPJvmPOdwvRm9fW6TUqWQ3KIvYnspklcjGggWqcp71J+YIXW
         nVGbYqLDhm92Faqsm3kaypmLRDtGhUopuKkppbLu+ouRE1trdc1gi6cugW5okjffA8Df
         Qo+CVf6I1tzYjlm9n/mxA/3NC3/hzjJjM8HwWZvBHLxPv67Uapg7F3nYu7GOvYm1H6wM
         imL/3YE58IXp9pCJOlj2CRF5fucM/ODGtVTwgsQa2ns+A1AjEMCWA41nGfwHSaYjbMcv
         Dn9g==
X-Gm-Message-State: AOAM530CWeNUply6JejhizdVeqkTAMAXKlp985/KRBw/OqT6G6+80ptn
        DaYhHRCTo2eYx+vEpFoPacqRxi2ZIz3PrJZ/1an3XSQjwyg=
X-Google-Smtp-Source: ABdhPJxqkiGRZ+bV5IE6yZdAb6+0xkQmoq8BGar171qctInVUc30b2epZMlYnsycXBsHu3JfJ8GiO/+1n7MGPC4zjyg=
X-Received: by 2002:ac8:7b38:: with SMTP id l24mr11721392qtu.136.1607630771633;
 Thu, 10 Dec 2020 12:06:11 -0800 (PST)
MIME-Version: 1.0
References: <20201210044400.1080308-1-hridya@google.com> <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com>
In-Reply-To: <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com>
From:   Hridya Valsaraju <hridya@google.com>
Date:   Thu, 10 Dec 2020 12:05:35 -0800
Message-ID: <CA+wgaPOCTfES09PYMgAHqWEH3ViOzB6sHUphu5bvb=Zi60F3eQ@mail.gmail.com>
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in sysfs
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org,
        Android Kernel Team <kernel-team@android.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you for the reviews Greg, Christian and Daniel!


On Thu, Dec 10, 2020 at 1:59 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> In general a good idea, but I have a few concern/comments here.
>
> Am 10.12.20 um 05:43 schrieb Hridya Valsaraju:
> > This patch allows statistics to be enabled for each DMA-BUF in
> > sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> >
> > The following stats will be exposed by the interface:
> >
> > /sys/kernel/dmabuf/<inode_number>/exporter_name
> > /sys/kernel/dmabuf/<inode_number>/size
> > /sys/kernel/dmabuf/<inode_number>/dev_map_info
> >
> > The inode_number is unique for each DMA-BUF and was added earlier [1]
> > in order to allow userspace to track DMA-BUF usage across different
> > processes.
> >
> > Currently, this information is exposed in
> > /sys/kernel/debug/dma_buf/bufinfo.
> > However, since debugfs is considered unsafe to be mounted in production=
,
> > it is being duplicated in sysfs.
>
> Mhm, this makes it part of the UAPI. What is the justification for this?
>
> In other words do we really need those debug information in a production
> environment?

Yes, we currently collect this information on production devices as well.

>
> >
> > This information is intended to help with root-causing
> > low-memory kills and the debugging/analysis of other memory-related iss=
ues.
> >
> > It will also be used to derive DMA-BUF
> > per-exporter stats and per-device usage stats for Android Bug reports.
> >
> > [1]: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1088791%2F&amp;data=3D04%7C01%7Cchr=
istian.koenig%40amd.com%7C30a0e015502b4d20e18208d89cc63f1a%7C3dd8961fe4884e=
608e11a82d994e183d%7C0%7C0%7C637431722574983797%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
sdata=3DRdGMvj5VsFUwJcVOuSPaLuAr4eI3CR1YOaznupmpTqg%3D&amp;reserved=3D0
> >
> > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > ---
> >   Documentation/ABI/testing/sysfs-kernel-dmabuf |  32 ++++
> >   drivers/dma-buf/Kconfig                       |  11 ++
> >   drivers/dma-buf/Makefile                      |   1 +
> >   drivers/dma-buf/dma-buf-sysfs-stats.c         | 162 +++++++++++++++++=
+
> >   drivers/dma-buf/dma-buf-sysfs-stats.h         |  37 ++++
> >   drivers/dma-buf/dma-buf.c                     |  29 ++++
> >   include/linux/dma-buf.h                       |  13 ++
> >   7 files changed, 285 insertions(+)
> >   create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf
> >   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
> >   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
> >
> > diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf b/Documentat=
ion/ABI/testing/sysfs-kernel-dmabuf
> > new file mode 100644
> > index 000000000000..02d407d57aaa
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf
> > @@ -0,0 +1,32 @@
> > +What:                /sys/kernel/dmabuf
> > +Date:                November 2020
> > +KernelVersion:       v5.11
> > +Contact:     Hridya Valsaraju <hridya@google.com>
> > +Description: The /sys/kernel/dmabuf directory contains a
> > +             snapshot of the internal state of every DMA-BUF.
> > +             /sys/kernel/dmabuf/<inode_number> will contain the
> > +             statistics for the DMA-BUF with the unique inode number
> > +             <inode_number>
> > +Users:               kernel memory tuning/debugging tools
> > +
> > +What:                /sys/kernel/dmabuf/<inode_number>/exporter_name
> > +Date:                November 2020
> > +KernelVersion:       v5.11
> > +Contact:     Hridya Valsaraju <hridya@google.com>
> > +Description: This file is read-only and contains the name of the expor=
ter of
> > +             the DMA-BUF.
> > +
> > +What:                /sys/kernel/dmabuf/<inode_number>/size
> > +Dat:         November 2020
> > +KernelVersion:       v5.11
> > +Contact:     Hridya Valsaraju <hridya@google.com>
> > +Description: This file is read-only and specifies the size of the DMA-=
BUF in
> > +             bytes.
> > +
> > +What:                /sys/kernel/dmabuf/<inode_number>/dev_map_info
> > +Dat:         November 2020
> > +KernelVersion:       v5.11
> > +Contact:     Hridya Valsaraju <hridya@google.com>
> > +Description: This file is read-only and lists the name of devices curr=
ently
> > +             mapping the DMA-BUF in a space-separated format.
> > +
> > diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> > index 4f8224a6ac95..2fed26f14548 100644
> > --- a/drivers/dma-buf/Kconfig
> > +++ b/drivers/dma-buf/Kconfig
> > @@ -64,6 +64,17 @@ menuconfig DMABUF_HEAPS
> >         allows userspace to allocate dma-bufs that can be shared
> >         between drivers.
> >
> > +menuconfig DMABUF_SYSFS_STATS
> > +     bool "DMA-BUF sysfs statistics"
> > +     select DMA_SHARED_BUFFER
> > +     help
> > +        Choose this option to enable DMA-BUF sysfs statistics
> > +        in location /sys/kernel/dmabuf.
> > +
> > +        /sys/kernel/dmabuf/<inode_number> will contain
> > +        statistics for the DMA-BUF with the unique inode number
> > +        <inode_number>.
> > +
> >   source "drivers/dma-buf/heaps/Kconfig"
> >
> >   endmenu
> > diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> > index 995e05f609ff..40d81f23cacf 100644
> > --- a/drivers/dma-buf/Makefile
> > +++ b/drivers/dma-buf/Makefile
> > @@ -6,6 +6,7 @@ obj-$(CONFIG_DMABUF_HEAPS)    +=3D heaps/
> >   obj-$(CONFIG_SYNC_FILE)             +=3D sync_file.o
> >   obj-$(CONFIG_SW_SYNC)               +=3D sw_sync.o sync_debug.o
> >   obj-$(CONFIG_UDMABUF)               +=3D udmabuf.o
> > +obj-$(CONFIG_DMABUF_SYSFS_STATS) +=3D dma-buf-sysfs-stats.o
> >
> >   dmabuf_selftests-y :=3D \
> >       selftest.o \
> > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dm=
a-buf-sysfs-stats.c
> > new file mode 100644
> > index 000000000000..bcbef81e0a5f
> > --- /dev/null
> > +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> > @@ -0,0 +1,162 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +
> > +#include <linux/dma-buf.h>
> > +#include <linux/dma-resv.h>
> > +#include <linux/kobject.h>
> > +#include <linux/printk.h>
> > +#include <linux/slab.h>
> > +#include <linux/sysfs.h>
> > +
> > +#define to_dma_buf_entry_from_kobj(x) container_of(x, struct dma_buf_s=
ysfs_entry, kobj)
> > +
> > +struct dma_buf_stats_attribute {
> > +     struct attribute attr;
> > +     ssize_t (*show)(struct dma_buf *dmabuf,
> > +                     struct dma_buf_stats_attribute *attr, char *buf);
> > +};
> > +#define to_dma_buf_stats_attr(x) container_of(x, struct dma_buf_stats_=
attribute, attr)
> > +
> > +static ssize_t dma_buf_stats_attribute_show(struct kobject *kobj,
> > +                                         struct attribute *attr,
> > +                                         char *buf)
> > +{
> > +     struct dma_buf_stats_attribute *attribute;
> > +     struct dma_buf_sysfs_entry *sysfs_entry;
> > +     struct dma_buf *dmabuf;
> > +
> > +     attribute =3D to_dma_buf_stats_attr(attr);
> > +     sysfs_entry =3D to_dma_buf_entry_from_kobj(kobj);
> > +     dmabuf =3D sysfs_entry->dmabuf;
> > +
> > +     if (!dmabuf || !attribute->show)
> > +             return -EIO;
> > +
> > +     return attribute->show(dmabuf, attribute, buf);
> > +}
> > +
> > +static const struct sysfs_ops dma_buf_stats_sysfs_ops =3D {
> > +     .show =3D dma_buf_stats_attribute_show,
> > +};
> > +
> > +static ssize_t exporter_name_show(struct dma_buf *dmabuf,
> > +                               struct dma_buf_stats_attribute *attr,
> > +                               char *buf)
> > +{
> > +     return sysfs_emit(buf, "%s\n", dmabuf->exp_name);
> > +}
> > +
> > +static ssize_t size_show(struct dma_buf *dmabuf,
> > +                      struct dma_buf_stats_attribute *attr,
> > +                      char *buf)
> > +{
> > +     return sysfs_emit(buf, "%zu\n", dmabuf->size);
> > +}
> > +
> > +static ssize_t dev_map_info_show(struct dma_buf *dmabuf,
> > +                              struct dma_buf_stats_attribute *attr,
> > +                              char *buf)
> > +{
> > +     ssize_t ret;
> > +     struct dma_buf_attachment *attachment;
> > +
> > +     ret =3D dma_resv_lock_interruptible(dmabuf->resv, NULL);
> > +     if (ret)
> > +             return ret;
> > +
> > +     list_for_each_entry(attachment, &dmabuf->attachments, node) {
> > +             if (attachment->map_counter) {
> > +                     ret +=3D sysfs_emit_at(buf, ret, "%s ",
> > +                                          dev_name(attachment->dev));
> > +             }
>
> Why do you emit this only when there is a mapping? It is perfectly valid
> and current practice that importers map things only on first use.

I did it this way since I thought that it would be more accurate to
eliminate the attachments without mappings :) Since it appears that it
was an incorrect assumption, I will change it in the next version to
only represent the attachments instead and drop the map_counter member
from struct dma_buf_attachment.

>
> The number of mapping is in general rather interesting, but I would just
> print that together with the importer name.
>
> And BTW I would rename the dev_map_info to something like "attachments".

I will make this change in the next version of the patch!

Thanks,
Hridya


>
> Regards,
> Christian.
>
> > +     }
> > +     dma_resv_unlock(dmabuf->resv);
> > +
> > +     ret +=3D sysfs_emit_at(buf, ret, "\n");
> > +     return ret;
> > +}
> > +
> > +static struct dma_buf_stats_attribute exporter_name_attribute =3D
> > +     __ATTR_RO(exporter_name);
> > +static struct dma_buf_stats_attribute size_attribute =3D __ATTR_RO(siz=
e);
> > +static struct dma_buf_stats_attribute dev_map_info_attribute =3D
> > +     __ATTR_RO(dev_map_info);
> > +
> > +static struct attribute *dma_buf_stats_default_attrs[] =3D {
> > +     &exporter_name_attribute.attr,
> > +     &size_attribute.attr,
> > +     &dev_map_info_attribute.attr,
> > +     NULL,
> > +};
> > +ATTRIBUTE_GROUPS(dma_buf_stats_default);
> > +
> > +static void dma_buf_sysfs_release(struct kobject *kobj)
> > +{
> > +     struct dma_buf_sysfs_entry *sysfs_entry;
> > +
> > +     sysfs_entry =3D to_dma_buf_entry_from_kobj(kobj);
> > +     kfree(sysfs_entry);
> > +}
> > +
> > +static struct kobj_type dma_buf_ktype =3D {
> > +     .sysfs_ops =3D &dma_buf_stats_sysfs_ops,
> > +     .release =3D dma_buf_sysfs_release,
> > +     .default_groups =3D dma_buf_stats_default_groups,
> > +};
> > +
> > +void dma_buf_sysfs_free(struct dma_buf *dmabuf)
> > +{
> > +     struct dma_buf_sysfs_entry *sysfs_entry;
> > +
> > +     sysfs_entry =3D dmabuf->sysfs_entry;
> > +     if (!sysfs_entry)
> > +             return;
> > +
> > +     kobject_del(&sysfs_entry->kobj);
> > +     kobject_put(&sysfs_entry->kobj);
> > +}
> > +
> > +static struct kset *dma_buf_stats_kset;
> > +int dma_buf_init_sysfs_statistics(void)
> > +{
> > +     dma_buf_stats_kset =3D kset_create_and_add("dmabuf", NULL, kernel=
_kobj);
> > +     if (!dma_buf_stats_kset)
> > +             return -ENOMEM;
> > +
> > +     return 0;
> > +}
> > +
> > +void dma_buf_uninit_sysfs_statistics(void)
> > +{
> > +     kset_unregister(dma_buf_stats_kset);
> > +}
> > +
> > +int dma_buf_init_stats_kobj(struct dma_buf *dmabuf)
> > +{
> > +     struct dma_buf_sysfs_entry *sysfs_entry;
> > +     int ret;
> > +
> > +     if (!dmabuf || !dmabuf->file)
> > +             return -EINVAL;
> > +
> > +     if (!dmabuf->exp_name) {
> > +             pr_err("exporter name must not be empty if stats needed\n=
");
> > +             return -EINVAL;
> > +     }
> > +
> > +     sysfs_entry =3D kzalloc(sizeof(struct dma_buf_sysfs_entry), GFP_K=
ERNEL);
> > +     if (!sysfs_entry)
> > +             return -ENOMEM;
> > +
> > +     sysfs_entry->kobj.kset =3D dma_buf_stats_kset;
> > +     sysfs_entry->dmabuf =3D dmabuf;
> > +
> > +     dmabuf->sysfs_entry =3D sysfs_entry;
> > +
> > +     ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, =
NULL,
> > +                                "%lu", file_inode(dmabuf->file)->i_ino=
);
> > +     if (ret)
> > +             kobject_put(&sysfs_entry->kobj);
> > +
> > +     return ret;
> > +}
> > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dm=
a-buf-sysfs-stats.h
> > new file mode 100644
> > index 000000000000..42fae7d1b11f
> > --- /dev/null
> > +++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
> > @@ -0,0 +1,37 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef _DMA_BUF_SYSFS_STATS_H
> > +#define _DMA_BUF_SYSFS_STATS_H
> > +
> > +#ifdef CONFIG_DMABUF_SYSFS_STATS
> > +
> > +int dma_buf_init_sysfs_statistics(void);
> > +void dma_buf_uninit_sysfs_statistics(void);
> > +
> > +int dma_buf_init_stats_kobj(struct dma_buf *dmabuf);
> > +static inline void dma_buf_update_attachment_map_count(struct dma_buf_=
attachment *attach,
> > +                                                    int delta)
> > +{
> > +     attach->map_counter +=3D delta;
> > +}
> > +void dma_buf_sysfs_free(struct dma_buf *dmabuf);
> > +
> > +#else
> > +
> > +static inline int dma_buf_init_sysfs_statistics(void)
> > +{
> > +     return 0;
> > +}
> > +
> > +static inline void dma_buf_uninit_sysfs_statistics(void) {}
> > +
> > +static inline int dma_buf_init_stats_kobj(struct dma_buf *dmabuf)
> > +{
> > +     return 0;
> > +}
> > +static inline void dma_buf_sysfs_free(struct dma_buf *dmabuf) {}
> > +static inline void dma_buf_update_attachment_map_count(struct dma_buf_=
attachment *attach,
> > +                                                    int delta) {}
> > +
> > +#endif
> > +#endif // _DMA_BUF_SYSFS_STATS_H
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index e63684d4cd90..e93df0069bf8 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -29,6 +29,8 @@
> >   #include <uapi/linux/dma-buf.h>
> >   #include <uapi/linux/magic.h>
> >
> > +#include "dma-buf-sysfs-stats.h"
> > +
> >   static inline int is_dma_buf_file(struct file *);
> >
> >   struct dma_buf_list {
> > @@ -83,6 +85,7 @@ static void dma_buf_release(struct dentry *dentry)
> >       if (dmabuf->resv =3D=3D (struct dma_resv *)&dmabuf[1])
> >               dma_resv_fini(dmabuf->resv);
> >
> > +     dma_buf_sysfs_free(dmabuf);
> >       module_put(dmabuf->owner);
> >       kfree(dmabuf->name);
> >       kfree(dmabuf);
> > @@ -566,6 +569,10 @@ struct dma_buf *dma_buf_export(const struct dma_bu=
f_export_info *exp_info)
> >       file->f_mode |=3D FMODE_LSEEK;
> >       dmabuf->file =3D file;
> >
> > +     ret =3D dma_buf_init_stats_kobj(dmabuf);
> > +     if (ret)
> > +             goto err_sysfs;
> > +
> >       mutex_init(&dmabuf->lock);
> >       INIT_LIST_HEAD(&dmabuf->attachments);
> >
> > @@ -575,6 +582,14 @@ struct dma_buf *dma_buf_export(const struct dma_bu=
f_export_info *exp_info)
> >
> >       return dmabuf;
> >
> > +err_sysfs:
> > +     /*
> > +      * Set file->f_path.dentry->d_fsdata to NULL so that when
> > +      * dma_buf_release() gets invoked by dentry_ops, it exits
> > +      * early before calling the release() dma_buf op.
> > +      */
> > +     file->f_path.dentry->d_fsdata =3D NULL;
> > +     fput(file);
> >   err_dmabuf:
> >       kfree(dmabuf);
> >   err_module:
> > @@ -732,6 +747,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, stru=
ct device *dev,
> >                       dma_resv_unlock(attach->dmabuf->resv);
> >               attach->sgt =3D sgt;
> >               attach->dir =3D DMA_BIDIRECTIONAL;
> > +             dma_buf_update_attachment_map_count(attach, 1 /* delta */=
);
> >       }
> >
> >       return attach;
> > @@ -786,6 +802,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct =
dma_buf_attachment *attach)
> >                       dma_resv_lock(attach->dmabuf->resv, NULL);
> >
> >               dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach->d=
ir);
> > +             dma_buf_update_attachment_map_count(attach, -1 /* delta *=
/);
> >
> >               if (dma_buf_is_dynamic(attach->dmabuf)) {
> >                       dma_buf_unpin(attach);
> > @@ -925,6 +942,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_=
buf_attachment *attach,
> >       }
> >   #endif /* CONFIG_DMA_API_DEBUG */
> >
> > +     if (!IS_ERR(sg_table))
> > +             dma_buf_update_attachment_map_count(attach, 1 /* delta */=
);
> > +
> >       return sg_table;
> >   }
> >   EXPORT_SYMBOL_GPL(dma_buf_map_attachment);
> > @@ -962,6 +982,8 @@ void dma_buf_unmap_attachment(struct dma_buf_attach=
ment *attach,
> >       if (dma_buf_is_dynamic(attach->dmabuf) &&
> >           !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> >               dma_buf_unpin(attach);
> > +
> > +     dma_buf_update_attachment_map_count(attach, -1 /* delta */);
> >   }
> >   EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
> >
> > @@ -1399,6 +1421,12 @@ static inline void dma_buf_uninit_debugfs(void)
> >
> >   static int __init dma_buf_init(void)
> >   {
> > +     int ret;
> > +
> > +     ret =3D dma_buf_init_sysfs_statistics();
> > +     if (ret)
> > +             return ret;
> > +
> >       dma_buf_mnt =3D kern_mount(&dma_buf_fs_type);
> >       if (IS_ERR(dma_buf_mnt))
> >               return PTR_ERR(dma_buf_mnt);
> > @@ -1414,5 +1442,6 @@ static void __exit dma_buf_deinit(void)
> >   {
> >       dma_buf_uninit_debugfs();
> >       kern_unmount(dma_buf_mnt);
> > +     dma_buf_uninit_sysfs_statistics();
> >   }
> >   __exitcall(dma_buf_deinit);
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index cf72699cb2bc..f5cab13afdfc 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -294,6 +294,7 @@ struct dma_buf_ops {
> >    * @poll: for userspace poll support
> >    * @cb_excl: for userspace poll support
> >    * @cb_shared: for userspace poll support
> > + * @sysfs_entry: for exposing information about this buffer in sysfs
> >    *
> >    * This represents a shared buffer, created by calling dma_buf_export=
(). The
> >    * userspace representation is a normal file descriptor, which can be=
 created by
> > @@ -329,6 +330,13 @@ struct dma_buf {
> >
> >               __poll_t active;
> >       } cb_excl, cb_shared;
> > +#ifdef CONFIG_DMABUF_SYSFS_STATS
> > +     /* for sysfs stats */
> > +     struct dma_buf_sysfs_entry {
> > +             struct kobject kobj;
> > +             struct dma_buf *dmabuf;
> > +     } *sysfs_entry;
> > +#endif
> >   };
> >
> >   /**
> > @@ -378,6 +386,8 @@ struct dma_buf_attach_ops {
> >    * @importer_ops: importer operations for this attachment, if provide=
d
> >    * dma_buf_map/unmap_attachment() must be called with the dma_resv lo=
ck held.
> >    * @importer_priv: importer specific attachment data.
> > + * @map_counter: Number of times the buffer has been mapped through th=
is
> > + * dma_buf_map_attachment.
> >    *
> >    * This structure holds the attachment information between the dma_bu=
f buffer
> >    * and its user device(s). The list contains one attachment struct pe=
r device
> > @@ -398,6 +408,9 @@ struct dma_buf_attachment {
> >       const struct dma_buf_attach_ops *importer_ops;
> >       void *importer_priv;
> >       void *priv;
> > +#ifdef CONFIG_DMABUF_SYSFS_STATS
> > +     unsigned int map_counter;
> > +#endif
> >   };
> >
> >   /**
>
