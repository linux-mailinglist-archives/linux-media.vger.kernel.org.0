Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC272FD9A4
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 20:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389903AbhATT2o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 14:28:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392562AbhATT2V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 14:28:21 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B59C0613D3
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 11:27:40 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id r9so17122497qtp.11
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 11:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tWUrYQEsXQ/3sPjqvYeiB5ySO5VAOvnnOy9W8/LpQBg=;
        b=IIC78N+8aag/Hsw/iL44l3IWhH1DfsZAUNyTZbC8amR3VJnBGJM+1bhKyonugHLOWl
         DOUz1D9ZBCPXqEqUdG5FqlLfoRMOFU9yHWHJn6NHRU2km80L3jYG95b8c8apum7F5ecm
         fQfx45V4zljJ/g39VO2Xw33LCSbI6gYlpbAnB3lFjlJ9BxEO4U5EQn/RO8H3ShISrv/U
         yWUCtGAZIn3oMJkr5t4dEEZLuqvhKYRLTjxXMBmurapUI9LaR3KxEkViy4o33ub1F40w
         8328ARqW9BkEpurKLXhdYkqKoiwgRxgMbAoKzEEK6CpvTI3Ovrz4Tliy1nIBm4KpwCXm
         9haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tWUrYQEsXQ/3sPjqvYeiB5ySO5VAOvnnOy9W8/LpQBg=;
        b=PPkMb1fiDd1iXdwCmZ5hsISqqyTnfMHxQMwHqrGglGeRAerp6C/Wd2h0qmjaufV2UL
         XTL2jx9AP3HFe4fuAHgQRy04XdgegFpGZ5Ggz4FNgIOuvFfq5g07K1zd4ApbtmRLuznw
         nt0Y0TVcyWNbzEORzgtJjsyMSgwhcTQV9ymIx4c3xRf5zKytXfJiS2g0GSlvJbuRSCuR
         94EwOy8+lzNYrd6KbB1U4sVE++IVfHUWXA6XmaQhal6wjK50I7zhlJrR5BjSkGefsW6Y
         pMNQ9CPFdKks/SHA1l02P5/YjpMRzVdaOeWAMdTf9pGywmn1e3D1pLx5EAWlqjTWp0GV
         x5Kg==
X-Gm-Message-State: AOAM533hlpe11NdQ0q01IiCZG3eyQEpLccpwdzfFZJknUczM6Uk6cu1I
        pmWzbFcpCuW4OgbA+7akGiJHESN2n3q8mPTJjNcdgQ==
X-Google-Smtp-Source: ABdhPJxkw7Jb12CN9YqTKszzOBoQw2ZxaWT0ceI4IWsvylrXUrTTiVds6nSGEUnNCXyb07XFh0XqGRDcHjYQbxyqzeg=
X-Received: by 2002:aed:3949:: with SMTP id l67mr10488531qte.322.1611170859437;
 Wed, 20 Jan 2021 11:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20210119225723.388883-1-hridya@google.com> <e5b39e3a-11a5-e380-fa48-82abbb5d4c3a@gmail.com>
In-Reply-To: <e5b39e3a-11a5-e380-fa48-82abbb5d4c3a@gmail.com>
From:   Hridya Valsaraju <hridya@google.com>
Date:   Wed, 20 Jan 2021 11:27:01 -0800
Message-ID: <CA+wgaPPSKiLb9zfiqzCbgPiYzLqBpqVJPbopVYDn4VaB_FwvAQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v2] dmabuf: Add the capability to expose
 DMA-BUF stats in sysfs
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org,
        John Stultz <john.stultz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Android Kernel Team <kernel-team@android.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Hyesoo Yu <hyesoo.yu@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 20, 2021 at 4:22 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 19.01.21 um 23:57 schrieb Hridya Valsaraju:
> > This patch allows statistics to be enabled for each DMA-BUF in
> > sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> >
> > The following stats will be exposed by the interface:
> >
> > /sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
> > /sys/kernel/dmabuf/buffers/<inode_number>/size
> > /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/devi=
ce
> > /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/map_=
counter
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
> >
> > This information will be used to derive DMA-BUF
> > per-exporter stats and per-device usage stats for Android Bug reports.
> > The corresponding userspace changes can be found at [2].
> > Telemetry tools will also capture this information(along with other
> > memory metrics) periodically as well as on important events like a
> > foreground app kill (which might have been triggered by Low Memory
> > Killer). It will also contribute to provide a snapshot of the system
> > memory usage on other events such as OOM kills and Application Not
> > Responding events.
> >
> > A shell script that can be run on a classic Linux environment to read
> > out the DMA-BUF statistics can be found at [3](suggested by John
> > Stultz).
> >
> > The patch contains the following improvements over the previous version=
:
> > 1) Each attachment is represented by its own directory to allow creatin=
g
> > a symlink to the importing device and to also provide room for future
> > expansion.
> > 2) The number of distinct mappings of each attachment is exposed in a
> > separate file.
> > 3) The per-buffer statistics are now in /sys/kernel/dmabuf/buffers
> > inorder to make the interface expandable in future.
> >
> > All of the improvements above are based on suggestions/feedback from
> > Daniel Vetter and Christian K=C3=B6nig.
> >
> > [1]: https://lore.kernel.org/patchwork/patch/1088791/
> > [2]: https://android-review.googlesource.com/q/topic:%22dmabuf-sysfs%22=
+(status:open%20OR%20status:merged)
> > [3]: https://android-review.googlesource.com/c/platform/system/memory/l=
ibmeminfo/+/1549734
> >
> > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > ---
> > Changes in v2:
> > -Move statistics to /sys/kernel/dmabuf/buffers in oder to allow additio=
n
> > of other DMA-BUF-related sysfs stats in future. Based on feedback from
> > Daniel Vetter.
> > -Each attachment has its own directory to represent attaching devices a=
s
> > symlinks and to introduce map_count as a separate file. Based on
> > feedback from Daniel Vetter and Christian K=C3=B6nig. Thank you both!
> > -Commit messages updated to point to userspace code in AOSP that will
> > read the DMA-BUF sysfs stats.
> >
> >   .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  52 ++++
> >   drivers/dma-buf/Kconfig                       |  11 +
> >   drivers/dma-buf/Makefile                      |   1 +
> >   drivers/dma-buf/dma-buf-sysfs-stats.c         | 283 +++++++++++++++++=
+
> >   drivers/dma-buf/dma-buf-sysfs-stats.h         |  62 ++++
> >   drivers/dma-buf/dma-buf.c                     |  37 +++
> >   include/linux/dma-buf.h                       |  20 ++
> >   7 files changed, 466 insertions(+)
> >   create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buff=
ers
> >   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
> >   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
> >
> > diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers b/Do=
cumentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> > new file mode 100644
> > index 000000000000..6f7c65209f07
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> > @@ -0,0 +1,52 @@
> > +What:                /sys/kernel/dmabuf/buffers
> > +Date:                January 2021
> > +KernelVersion:       v5.12
> > +Contact:     Hridya Valsaraju <hridya@google.com>
> > +Description: The /sys/kernel/dmabuf/buffers directory contains a
> > +             snapshot of the internal state of every DMA-BUF.
> > +             /sys/kernel/dmabuf/buffers/<inode_number> will contain th=
e
> > +             statistics for the DMA-BUF with the unique inode number
> > +             <inode_number>
> > +Users:               kernel memory tuning/debugging tools
> > +
> > +What:                /sys/kernel/dmabuf/buffers/<inode_number>/exporte=
r_name
> > +Date:                January 2021
> > +KernelVersion:       v5.12
> > +Contact:     Hridya Valsaraju <hridya@google.com>
> > +Description: This file is read-only and contains the name of the expor=
ter of
> > +             the DMA-BUF.
> > +
> > +What:                /sys/kernel/dmabuf/buffers/<inode_number>/size
> > +Date:                January 2021
> > +KernelVersion:       v5.12
> > +Contact:     Hridya Valsaraju <hridya@google.com>
> > +Description: This file is read-only and specifies the size of the DMA-=
BUF in
> > +             bytes.
> > +
> > +What:                /sys/kernel/dmabuf/buffers/<inode_number>/attachm=
ents
> > +Date:                January 2021
> > +KernelVersion:       v5.12
> > +Contact:     Hridya Valsaraju <hridya@google.com>
> > +Description: This directory will contain subdirectories representing e=
very
> > +             attachment of the DMA-BUF.
> > +
> > +What:                /sys/kernel/dmabuf/buffers/<inode_number>/attachm=
ents/<attachment_uid>
> > +Date:                January 2021
> > +KernelVersion:       v5.12
> > +Contact:     Hridya Valsaraju <hridya@google.com>
> > +Description: This directory will contain information on the attaching =
device
> > +             and the number of current distinct device mappings.
> > +
> > +What:                /sys/kernel/dmabuf/buffers/<inode_number>/attachm=
ents/<attachment_uid>/device
> > +Date:                January 2021
> > +KernelVersion:       v5.12
> > +Contact:     Hridya Valsaraju <hridya@google.com>
> > +Description: This file is read-only and is a symlink to the attaching =
devices's
> > +             sysfs entry.
> > +
> > +What:                /sys/kernel/dmabuf/buffers/<inode_number>/attachm=
ents/<attachment_uid>/map_counter
> > +Date:                January 2021
> > +KernelVersion:       v5.12
> > +Contact:     Hridya Valsaraju <hridya@google.com>
> > +Description: This file is read-only and contains a map_counter indicat=
ing the
> > +             number of distinct device mappings of the attachment.
> > diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> > index 4f8224a6ac95..27e6a2dafeaa 100644
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
> > +        in location /sys/kernel/dmabuf/buffers.
> > +
> > +        /sys/kernel/dmabuf/buffers/<inode_number> will contain
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
> > index 000000000000..61f85c3d16a5
> > --- /dev/null
> > +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> > @@ -0,0 +1,283 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * DMA-BUF sysfs statistics.
> > + *
> > + * Copyright (C) 2021 Google LLC.
> > + */
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
> > +static struct dma_buf_stats_attribute exporter_name_attribute =3D
> > +     __ATTR_RO(exporter_name);
> > +static struct dma_buf_stats_attribute size_attribute =3D __ATTR_RO(siz=
e);
> > +
> > +static struct attribute *dma_buf_stats_default_attrs[] =3D {
> > +     &exporter_name_attribute.attr,
> > +     &size_attribute.attr,
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
> > +#define to_dma_buf_attach_entry_from_kobj(x) container_of(x, struct dm=
a_buf_attach_sysfs_entry, kobj)
> > +
> > +struct dma_buf_attach_stats_attribute {
> > +     struct attribute attr;
> > +     ssize_t (*show)(struct dma_buf_attach_sysfs_entry *sysfs_entry,
> > +                     struct dma_buf_attach_stats_attribute *attr, char=
 *buf);
> > +};
> > +#define to_dma_buf_attach_stats_attr(x) container_of(x, struct dma_buf=
_attach_stats_attribute, attr)
> > +
> > +static ssize_t dma_buf_attach_stats_attribute_show(struct kobject *kob=
j,
> > +                                                struct attribute *attr=
,
> > +                                                char *buf)
> > +{
> > +     struct dma_buf_attach_stats_attribute *attribute;
> > +     struct dma_buf_attach_sysfs_entry *sysfs_entry;
> > +
> > +     attribute =3D to_dma_buf_attach_stats_attr(attr);
> > +     sysfs_entry =3D to_dma_buf_attach_entry_from_kobj(kobj);
> > +
> > +     if (!attribute->show)
> > +             return -EIO;
> > +
> > +     return attribute->show(sysfs_entry, attribute, buf);
> > +}
> > +
> > +static const struct sysfs_ops dma_buf_attach_stats_sysfs_ops =3D {
> > +     .show =3D dma_buf_attach_stats_attribute_show,
> > +};
> > +
> > +static ssize_t map_counter_show(struct dma_buf_attach_sysfs_entry *sys=
fs_entry,
> > +                             struct dma_buf_attach_stats_attribute *at=
tr,
> > +                             char *buf)
> > +{
> > +     return sysfs_emit(buf, "%u\n", sysfs_entry->map_counter);
> > +}
> > +
> > +static struct dma_buf_attach_stats_attribute map_counter_attribute =3D
> > +     __ATTR_RO(map_counter);
> > +
> > +static struct attribute *dma_buf_attach_stats_default_attrs[] =3D {
> > +     &map_counter_attribute.attr,
> > +     NULL,
> > +};
> > +ATTRIBUTE_GROUPS(dma_buf_attach_stats_default);
> > +
> > +static void dma_buf_attach_sysfs_release(struct kobject *kobj)
> > +{
> > +     struct dma_buf_attach_sysfs_entry *sysfs_entry;
> > +
> > +     sysfs_entry =3D to_dma_buf_attach_entry_from_kobj(kobj);
> > +     kfree(sysfs_entry);
> > +}
> > +
> > +static struct kobj_type dma_buf_attach_ktype =3D {
> > +     .sysfs_ops =3D &dma_buf_attach_stats_sysfs_ops,
> > +     .release =3D dma_buf_attach_sysfs_release,
> > +     .default_groups =3D dma_buf_attach_stats_default_groups,
> > +};
> > +
> > +void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach)
> > +{
> > +     struct dma_buf_attach_sysfs_entry *sysfs_entry;
> > +
> > +     sysfs_entry =3D attach->sysfs_entry;
> > +     if (!sysfs_entry)
> > +             return;
> > +
> > +     sysfs_delete_link(&sysfs_entry->kobj, &attach->dev->kobj, "device=
");
> > +
> > +     kobject_del(&sysfs_entry->kobj);
> > +     kobject_put(&sysfs_entry->kobj);
> > +}
> > +
> > +int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
> > +                            unsigned int uid)
> > +{
> > +     struct dma_buf_attach_sysfs_entry *sysfs_entry;
> > +     int ret;
> > +     struct dma_buf *dmabuf;
> > +
> > +     if (!attach)
> > +             return -EINVAL;
> > +
> > +     dmabuf =3D attach->dmabuf;
> > +
> > +     sysfs_entry =3D kzalloc(sizeof(struct dma_buf_attach_sysfs_entry)=
,
> > +                           GFP_KERNEL);
> > +     if (!sysfs_entry)
> > +             return -ENOMEM;
> > +
> > +     sysfs_entry->kobj.kset =3D dmabuf->sysfs_entry->attach_stats_kset=
;
> > +
> > +     attach->sysfs_entry =3D sysfs_entry;
> > +
> > +     ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_attach_=
ktype,
> > +                                NULL, "%u", uid);
> > +     if (ret)
> > +             goto kobj_err;
> > +
> > +     ret =3D sysfs_create_link(&sysfs_entry->kobj, &attach->dev->kobj,
> > +                             "device");
> > +     if (ret)
> > +             goto link_err;
> > +
> > +     return 0;
> > +
> > +link_err:
> > +     kobject_del(&sysfs_entry->kobj);
> > +kobj_err:
> > +     kobject_put(&sysfs_entry->kobj);
> > +     attach->sysfs_entry =3D NULL;
> > +
> > +     return ret;
> > +}
> > +void dma_buf_stats_teardown(struct dma_buf *dmabuf)
> > +{
> > +     struct dma_buf_sysfs_entry *sysfs_entry;
> > +
> > +     sysfs_entry =3D dmabuf->sysfs_entry;
> > +     if (!sysfs_entry)
> > +             return;
> > +
> > +     kset_unregister(sysfs_entry->attach_stats_kset);
> > +     kobject_del(&sysfs_entry->kobj);
> > +     kobject_put(&sysfs_entry->kobj);
> > +}
> > +
> > +static struct kset *dma_buf_stats_kset;
> > +static struct kset *dma_buf_per_buffer_stats_kset;
> > +int dma_buf_init_sysfs_statistics(void)
> > +{
> > +     dma_buf_stats_kset =3D kset_create_and_add("dmabuf", NULL, kernel=
_kobj);
> > +     if (!dma_buf_stats_kset)
> > +             return -ENOMEM;
> > +
> > +     dma_buf_per_buffer_stats_kset =3D kset_create_and_add("buffers", =
NULL,
> > +                                                         &dma_buf_stat=
s_kset->kobj);
> > +     if (!dma_buf_per_buffer_stats_kset) {
> > +             kset_unregister(dma_buf_stats_kset);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +void dma_buf_uninit_sysfs_statistics(void)
> > +{
> > +     kset_unregister(dma_buf_per_buffer_stats_kset);
> > +     kset_unregister(dma_buf_stats_kset);
> > +}
> > +
> > +int dma_buf_stats_setup(struct dma_buf *dmabuf)
> > +{
> > +     struct dma_buf_sysfs_entry *sysfs_entry;
> > +     int ret;
> > +     struct kset *attach_stats_kset;
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
> > +     sysfs_entry->kobj.kset =3D dma_buf_per_buffer_stats_kset;
> > +     sysfs_entry->dmabuf =3D dmabuf;
> > +
> > +     dmabuf->sysfs_entry =3D sysfs_entry;
> > +
> > +     /* create the directory for buffer stats */
> > +     ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, =
NULL,
> > +                                "%lu", file_inode(dmabuf->file)->i_ino=
);
> > +     if (ret)
> > +             goto err_sysfs_dmabuf;
> > +
> > +     /* create the directory for attachment stats */
> > +     attach_stats_kset =3D kset_create_and_add("attachments", NULL,
> > +                                             &sysfs_entry->kobj);
> > +     if (!attach_stats_kset) {
> > +             ret =3D -ENOMEM;
> > +             goto err_sysfs_attach;
> > +     }
> > +
> > +     sysfs_entry->attach_stats_kset =3D attach_stats_kset;
> > +
> > +     return 0;
> > +
> > +err_sysfs_attach:
> > +     kobject_del(&sysfs_entry->kobj);
> > +err_sysfs_dmabuf:
> > +     kobject_put(&sysfs_entry->kobj);
> > +     dmabuf->sysfs_entry =3D NULL;
> > +     return ret;
> > +}
> > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dm=
a-buf-sysfs-stats.h
> > new file mode 100644
> > index 000000000000..5f4703249117
> > --- /dev/null
> > +++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
> > @@ -0,0 +1,62 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * DMA-BUF sysfs statistics.
> > + *
> > + * Copyright (C) 2021 Google LLC.
> > + */
> > +
> > +#ifndef _DMA_BUF_SYSFS_STATS_H
> > +#define _DMA_BUF_SYSFS_STATS_H
> > +
> > +#ifdef CONFIG_DMABUF_SYSFS_STATS
> > +
> > +int dma_buf_init_sysfs_statistics(void);
> > +void dma_buf_uninit_sysfs_statistics(void);
> > +
> > +int dma_buf_stats_setup(struct dma_buf *dmabuf);
> > +int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
> > +                            unsigned int uid);
> > +static inline void dma_buf_update_attachment_map_count(struct dma_buf_=
attachment *attach,
> > +                                                    int delta)
> > +{
> > +     struct dma_buf_attach_sysfs_entry *entry =3D attach->sysfs_entry;
> > +
> > +     entry->map_counter +=3D delta;
> > +}
> > +void dma_buf_stats_teardown(struct dma_buf *dmabuf);
> > +void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach);
> > +static inline unsigned int dma_buf_update_attach_uid(struct dma_buf *d=
mabuf)
> > +{
> > +     struct dma_buf_sysfs_entry *entry =3D dmabuf->sysfs_entry;
> > +
> > +     return entry->attachment_uid++;
> > +}
> > +#else
> > +
> > +static inline int dma_buf_init_sysfs_statistics(void)
> > +{
> > +     return 0;
> > +}
> > +
> > +static inline void dma_buf_uninit_sysfs_statistics(void) {}
> > +
> > +static inline int dma_buf_stats_setup(struct dma_buf *dmabuf)
> > +{
> > +     return 0;
> > +}
> > +static inline int dma_buf_attach_stats_setup(struct dma_buf_attachment=
 *attach,
> > +                                          unsigned int uid)
> > +{
> > +     return 0;
> > +}
> > +
> > +static inline void dma_buf_stats_teardown(struct dma_buf *dmabuf) {}
> > +static inline void dma_buf_attach_stats_teardown(struct dma_buf_attach=
ment *attach) {}
> > +static inline void dma_buf_update_attachment_map_count(struct dma_buf_=
attachment *attach,
> > +                                                    int delta) {}
> > +static inline unsigned int dma_buf_update_attach_uid(struct dma_buf *d=
mabuf)
> > +{
> > +     return 0;
> > +}
> > +#endif
> > +#endif // _DMA_BUF_SYSFS_STATS_H
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 9ad6397aaa97..29f9ea18eb47 100644
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
> > @@ -79,6 +81,7 @@ static void dma_buf_release(struct dentry *dentry)
> >       if (dmabuf->resv =3D=3D (struct dma_resv *)&dmabuf[1])
> >               dma_resv_fini(dmabuf->resv);
> >
> > +     dma_buf_stats_teardown(dmabuf);
> >       module_put(dmabuf->owner);
> >       kfree(dmabuf->name);
> >       kfree(dmabuf);
> > @@ -579,6 +582,10 @@ struct dma_buf *dma_buf_export(const struct dma_bu=
f_export_info *exp_info)
> >       file->f_mode |=3D FMODE_LSEEK;
> >       dmabuf->file =3D file;
> >
> > +     ret =3D dma_buf_stats_setup(dmabuf);
> > +     if (ret)
> > +             goto err_sysfs;
> > +
> >       mutex_init(&dmabuf->lock);
> >       INIT_LIST_HEAD(&dmabuf->attachments);
> >
> > @@ -588,6 +595,14 @@ struct dma_buf *dma_buf_export(const struct dma_bu=
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
> > @@ -692,6 +707,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, stru=
ct device *dev,
> >   {
> >       struct dma_buf_attachment *attach;
> >       int ret;
> > +     unsigned int attach_uid;
> >
> >       if (WARN_ON(!dmabuf || !dev))
> >               return ERR_PTR(-EINVAL);
> > @@ -717,8 +733,13 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, str=
uct device *dev,
> >       }
> >       dma_resv_lock(dmabuf->resv, NULL);
> >       list_add(&attach->node, &dmabuf->attachments);
> > +     attach_uid =3D dma_buf_update_attach_uid(dmabuf);
> >       dma_resv_unlock(dmabuf->resv);
> >
> > +     ret =3D dma_buf_attach_stats_setup(attach, attach_uid);
> > +     if (ret)
> > +             goto err_sysfs;
> > +
> >       /* When either the importer or the exporter can't handle dynamic
> >        * mappings we cache the mapping here to avoid issues with the
> >        * reservation object lock.
> > @@ -745,6 +766,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, stru=
ct device *dev,
> >                       dma_resv_unlock(attach->dmabuf->resv);
> >               attach->sgt =3D sgt;
> >               attach->dir =3D DMA_BIDIRECTIONAL;
> > +             dma_buf_update_attachment_map_count(attach, 1 /* delta */=
);
> >       }
> >
> >       return attach;
> > @@ -761,6 +783,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, stru=
ct device *dev,
> >       if (dma_buf_is_dynamic(attach->dmabuf))
> >               dma_resv_unlock(attach->dmabuf->resv);
> >
> > +err_sysfs:
> >       dma_buf_detach(dmabuf, attach);
> >       return ERR_PTR(ret);
> >   }
> > @@ -799,6 +822,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct =
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
> > @@ -812,6 +836,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct =
dma_buf_attachment *attach)
> >       if (dmabuf->ops->detach)
> >               dmabuf->ops->detach(dmabuf, attach);
> >
> > +     dma_buf_attach_stats_teardown(attach);
> >       kfree(attach);
> >   }
> >   EXPORT_SYMBOL_GPL(dma_buf_detach);
> > @@ -938,6 +963,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_=
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
> > @@ -975,6 +1003,8 @@ void dma_buf_unmap_attachment(struct dma_buf_attac=
hment *attach,
> >       if (dma_buf_is_dynamic(attach->dmabuf) &&
> >           !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> >               dma_buf_unpin(attach);
> > +
> > +     dma_buf_update_attachment_map_count(attach, -1 /* delta */);
> >   }
> >   EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
> >
> > @@ -1412,6 +1442,12 @@ static inline void dma_buf_uninit_debugfs(void)
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
> > @@ -1427,5 +1463,6 @@ static void __exit dma_buf_deinit(void)
> >   {
> >       dma_buf_uninit_debugfs();
> >       kern_unmount(dma_buf_mnt);
> > +     dma_buf_uninit_sysfs_statistics();
> >   }
> >   __exitcall(dma_buf_deinit);
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index cf72699cb2bc..4ae5cc38a4a7 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -294,6 +294,9 @@ struct dma_buf_ops {
> >    * @poll: for userspace poll support
> >    * @cb_excl: for userspace poll support
> >    * @cb_shared: for userspace poll support
> > + * @sysfs_entry: for exposing information about this buffer in sysfs.
> > + * The attachment_uid member of @sysfs_entry is protected by dma_resv =
lock
> > + * and is incremented on each attach.
> >    *
> >    * This represents a shared buffer, created by calling dma_buf_export=
(). The
> >    * userspace representation is a normal file descriptor, which can be=
 created by
> > @@ -329,6 +332,15 @@ struct dma_buf {
> >
> >               __poll_t active;
> >       } cb_excl, cb_shared;
> > +#ifdef CONFIG_DMABUF_SYSFS_STATS
> > +     /* for sysfs stats */
> > +     struct dma_buf_sysfs_entry {
> > +             struct kobject kobj;
> > +             struct dma_buf *dmabuf;
> > +             unsigned int attachment_uid;
> > +             struct kset *attach_stats_kset;
> > +     } *sysfs_entry;
> > +#endif
>
> Why not directly embed that?

Thank you for the review Christian! Kobjects need to act as reference
counters to the objects they are embedded in. Since ref-counting for
struct dma_buf is already handled by its 'file' member, we cannot
embed the kobject directly into struct dma_buf.

>
> >   };
> >
> >   /**
> > @@ -378,6 +390,7 @@ struct dma_buf_attach_ops {
> >    * @importer_ops: importer operations for this attachment, if provide=
d
> >    * dma_buf_map/unmap_attachment() must be called with the dma_resv lo=
ck held.
> >    * @importer_priv: importer specific attachment data.
> > + * @sysfs_entry: For exposing information about this attachment in sys=
fs.
> >    *
> >    * This structure holds the attachment information between the dma_bu=
f buffer
> >    * and its user device(s). The list contains one attachment struct pe=
r device
> > @@ -398,6 +411,13 @@ struct dma_buf_attachment {
> >       const struct dma_buf_attach_ops *importer_ops;
> >       void *importer_priv;
> >       void *priv;
> > +#ifdef CONFIG_DMABUF_SYSFS_STATS
> > +     /* for sysfs stats */
> > +     struct dma_buf_attach_sysfs_entry {
> > +             struct kobject kobj;
> > +             unsigned int map_counter;
> > +     } *sysfs_entry;
> > +#endif
>
> Same question here.

It is not directly embedded into struct dma_buf_attachment for the
same reason as above since I do not think that it is correct to have
the kobject act as reference count for struct dma_buf_attachment.

Thanks again for all the reviews!

Regards,
Hridya



>
> Apart from that the general approach looks solid to me now.
>
> But somebody with more sysfs background should check if everything there
> is the right thing to do.
>
> Regards,
> Christian.
>
>
>
> >   };
> >
> >   /**
