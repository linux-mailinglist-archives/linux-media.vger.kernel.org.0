Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7049E2FDAFF
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 21:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730807AbhATUik (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 15:38:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392789AbhATUg0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 15:36:26 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D7DC0613C1
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 12:35:38 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id p5so11560464qvs.7
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 12:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Z0QoUnMigHZv62iqBIHVw3IzALde+Sr2xiVtJxAC/JA=;
        b=hRm+u1Ec/AFUit6iuIVxpXiDikz7HhehQDfrW0OBud7m3m2qxq7sRTjVn0SWV9wfw+
         zgcxp2Vb246+0c0qfFipKHsI+d1nB/7/Xv5ubRaNZUt5/4uSFw0hwaBMnL/KJXoIdBhQ
         Y+NeUr9aZZwhS87eFR18MW7ACq9xcJxCsg8uB6JwDbzNDRgQNx0QGp4bUCvxkVTwgGNu
         j9wZkbHpATMBZBmgab1GWsmeYaUGyuI3W15JeNgGprusnojdV4s5HIVUwylhBSKGf2b2
         qgTtFO74fzr/y5vsOaElQcinrWxEobz58GGB/UesnN2IhMUU3gKwLJ5+AbXbMkUIi6Bw
         J71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Z0QoUnMigHZv62iqBIHVw3IzALde+Sr2xiVtJxAC/JA=;
        b=FOkIdss8xxXteijGFk3ykRl4n8L6dR+znGx+MEqYimf0dn4AI7V+QWs5lwF+fggaUJ
         hZhkrY1S+hDRW6NztOkseUwH4X2MUJhssNX28aQQQLRwZ+ue9/4k+5yzo1fku1XvVMdH
         GbyAfU1nqN8nf9fIiyeb+TipV0kf8svvi/6JWLB21i2n/Bu4NtOIKiu5j+qR6FzqndPE
         WaHc9wiF2xWPQb+WhffRZ4inJB61FjnU2qsDQoh+vkffWSuNB95M5TUlLiwU7tj2yENX
         5x3jbnQalnBv8vWeneQOXXMkb6nWJkDh1SDWpZWrlRW9n7/ypl7zWyDdmTbOYbvYtVnZ
         IaJg==
X-Gm-Message-State: AOAM532VWYDE/nc8+47hl81dVComGodN4N0EeVC7XVCvSh1LyO6LNz9S
        28xMyslfMJHBI4icq6ZbWdLUnFTY/CJbLehDoD/zGw==
X-Google-Smtp-Source: ABdhPJxFSrvkUPhzivgN09xn5QczRNY8sy5obem5udP1jEXDUeCqoC6zTMeC4yFMw/DzDQhTFoBNajuC3vbG7HcpCpY=
X-Received: by 2002:a0c:8203:: with SMTP id h3mr11117071qva.0.1611174937158;
 Wed, 20 Jan 2021 12:35:37 -0800 (PST)
MIME-Version: 1.0
References: <20210119225723.388883-1-hridya@google.com> <e5b39e3a-11a5-e380-fa48-82abbb5d4c3a@gmail.com>
 <CAKMK7uEWWZTcEcn3DKTpTXMpOCbCcBkHHt+iV7ehxw+Qj3De5A@mail.gmail.com>
In-Reply-To: <CAKMK7uEWWZTcEcn3DKTpTXMpOCbCcBkHHt+iV7ehxw+Qj3De5A@mail.gmail.com>
From:   Hridya Valsaraju <hridya@google.com>
Date:   Wed, 20 Jan 2021 12:34:59 -0800
Message-ID: <CA+wgaPOoMZaR+=kj0ED5WSE96xCqZAWhaB6o387i0jWpO-dcvg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v2] dmabuf: Add the capability to expose
 DMA-BUF stats in sysfs
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Yiwei Zhang <zzyiwei@android.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Android Kernel Team <kernel-team@android.com>,
        Hyesoo Yu <hyesoo.yu@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 20, 2021 at 4:42 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jan 20, 2021 at 1:22 PM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Am 19.01.21 um 23:57 schrieb Hridya Valsaraju:
> > > This patch allows statistics to be enabled for each DMA-BUF in
> > > sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> > >
> > > The following stats will be exposed by the interface:
> > >
> > > /sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
> > > /sys/kernel/dmabuf/buffers/<inode_number>/size
> > > /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/de=
vice
> > > /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/ma=
p_counter
> > >
> > > The inode_number is unique for each DMA-BUF and was added earlier [1]
> > > in order to allow userspace to track DMA-BUF usage across different
> > > processes.
> > >
> > > Currently, this information is exposed in
> > > /sys/kernel/debug/dma_buf/bufinfo.
> > > However, since debugfs is considered unsafe to be mounted in producti=
on,
> > > it is being duplicated in sysfs.
> > >
> > > This information will be used to derive DMA-BUF
> > > per-exporter stats and per-device usage stats for Android Bug reports=
.
> > > The corresponding userspace changes can be found at [2].
> > > Telemetry tools will also capture this information(along with other
> > > memory metrics) periodically as well as on important events like a
> > > foreground app kill (which might have been triggered by Low Memory
> > > Killer). It will also contribute to provide a snapshot of the system
> > > memory usage on other events such as OOM kills and Application Not
> > > Responding events.
> > >
> > > A shell script that can be run on a classic Linux environment to read
> > > out the DMA-BUF statistics can be found at [3](suggested by John
> > > Stultz).
> > >
> > > The patch contains the following improvements over the previous versi=
on:
> > > 1) Each attachment is represented by its own directory to allow creat=
ing
> > > a symlink to the importing device and to also provide room for future
> > > expansion.
> > > 2) The number of distinct mappings of each attachment is exposed in a
> > > separate file.
> > > 3) The per-buffer statistics are now in /sys/kernel/dmabuf/buffers
> > > inorder to make the interface expandable in future.
> > >
> > > All of the improvements above are based on suggestions/feedback from
> > > Daniel Vetter and Christian K=C3=B6nig.
> > >
> > > [1]: https://lore.kernel.org/patchwork/patch/1088791/
> > > [2]: https://android-review.googlesource.com/q/topic:%22dmabuf-sysfs%=
22+(status:open%20OR%20status:merged)
> > > [3]: https://android-review.googlesource.com/c/platform/system/memory=
/libmeminfo/+/1549734
> > >
> > > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > > ---
> > > Changes in v2:
> > > -Move statistics to /sys/kernel/dmabuf/buffers in oder to allow addit=
ion
> > > of other DMA-BUF-related sysfs stats in future. Based on feedback fro=
m
> > > Daniel Vetter.
> > > -Each attachment has its own directory to represent attaching devices=
 as
> > > symlinks and to introduce map_count as a separate file. Based on
> > > feedback from Daniel Vetter and Christian K=C3=B6nig. Thank you both!
> > > -Commit messages updated to point to userspace code in AOSP that will
> > > read the DMA-BUF sysfs stats.
> > >
> > >   .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  52 ++++
> > >   drivers/dma-buf/Kconfig                       |  11 +
> > >   drivers/dma-buf/Makefile                      |   1 +
> > >   drivers/dma-buf/dma-buf-sysfs-stats.c         | 283 +++++++++++++++=
+++
> > >   drivers/dma-buf/dma-buf-sysfs-stats.h         |  62 ++++
> > >   drivers/dma-buf/dma-buf.c                     |  37 +++
> > >   include/linux/dma-buf.h                       |  20 ++
> > >   7 files changed, 466 insertions(+)
> > >   create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-bu=
ffers
> > >   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
> > >   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
> > >
> > > diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers b/=
Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> > > new file mode 100644
> > > index 000000000000..6f7c65209f07
> > > --- /dev/null
> > > +++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> > > @@ -0,0 +1,52 @@
> > > +What:                /sys/kernel/dmabuf/buffers
> > > +Date:                January 2021
> > > +KernelVersion:       v5.12
> > > +Contact:     Hridya Valsaraju <hridya@google.com>
> > > +Description: The /sys/kernel/dmabuf/buffers directory contains a
> > > +             snapshot of the internal state of every DMA-BUF.
> > > +             /sys/kernel/dmabuf/buffers/<inode_number> will contain =
the
> > > +             statistics for the DMA-BUF with the unique inode number
> > > +             <inode_number>
> > > +Users:               kernel memory tuning/debugging tools
> > > +
> > > +What:                /sys/kernel/dmabuf/buffers/<inode_number>/expor=
ter_name
> > > +Date:                January 2021
> > > +KernelVersion:       v5.12
> > > +Contact:     Hridya Valsaraju <hridya@google.com>
> > > +Description: This file is read-only and contains the name of the exp=
orter of
> > > +             the DMA-BUF.
> > > +
> > > +What:                /sys/kernel/dmabuf/buffers/<inode_number>/size
> > > +Date:                January 2021
> > > +KernelVersion:       v5.12
> > > +Contact:     Hridya Valsaraju <hridya@google.com>
> > > +Description: This file is read-only and specifies the size of the DM=
A-BUF in
> > > +             bytes.
> > > +
> > > +What:                /sys/kernel/dmabuf/buffers/<inode_number>/attac=
hments
> > > +Date:                January 2021
> > > +KernelVersion:       v5.12
> > > +Contact:     Hridya Valsaraju <hridya@google.com>
> > > +Description: This directory will contain subdirectories representing=
 every
> > > +             attachment of the DMA-BUF.
> > > +
> > > +What:                /sys/kernel/dmabuf/buffers/<inode_number>/attac=
hments/<attachment_uid>
> > > +Date:                January 2021
> > > +KernelVersion:       v5.12
> > > +Contact:     Hridya Valsaraju <hridya@google.com>
> > > +Description: This directory will contain information on the attachin=
g device
> > > +             and the number of current distinct device mappings.
> > > +
> > > +What:                /sys/kernel/dmabuf/buffers/<inode_number>/attac=
hments/<attachment_uid>/device
> > > +Date:                January 2021
> > > +KernelVersion:       v5.12
> > > +Contact:     Hridya Valsaraju <hridya@google.com>
> > > +Description: This file is read-only and is a symlink to the attachin=
g devices's
> > > +             sysfs entry.
> > > +
> > > +What:                /sys/kernel/dmabuf/buffers/<inode_number>/attac=
hments/<attachment_uid>/map_counter
> > > +Date:                January 2021
> > > +KernelVersion:       v5.12
> > > +Contact:     Hridya Valsaraju <hridya@google.com>
> > > +Description: This file is read-only and contains a map_counter indic=
ating the
> > > +             number of distinct device mappings of the attachment.
> > > diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> > > index 4f8224a6ac95..27e6a2dafeaa 100644
> > > --- a/drivers/dma-buf/Kconfig
> > > +++ b/drivers/dma-buf/Kconfig
> > > @@ -64,6 +64,17 @@ menuconfig DMABUF_HEAPS
> > >         allows userspace to allocate dma-bufs that can be shared
> > >         between drivers.
> > >
> > > +menuconfig DMABUF_SYSFS_STATS
> > > +     bool "DMA-BUF sysfs statistics"
> > > +     select DMA_SHARED_BUFFER
> > > +     help
> > > +        Choose this option to enable DMA-BUF sysfs statistics
> > > +        in location /sys/kernel/dmabuf/buffers.
> > > +
> > > +        /sys/kernel/dmabuf/buffers/<inode_number> will contain
> > > +        statistics for the DMA-BUF with the unique inode number
> > > +        <inode_number>.
> > > +
> > >   source "drivers/dma-buf/heaps/Kconfig"
> > >
> > >   endmenu
> > > diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> > > index 995e05f609ff..40d81f23cacf 100644
> > > --- a/drivers/dma-buf/Makefile
> > > +++ b/drivers/dma-buf/Makefile
> > > @@ -6,6 +6,7 @@ obj-$(CONFIG_DMABUF_HEAPS)    +=3D heaps/
> > >   obj-$(CONFIG_SYNC_FILE)             +=3D sync_file.o
> > >   obj-$(CONFIG_SW_SYNC)               +=3D sw_sync.o sync_debug.o
> > >   obj-$(CONFIG_UDMABUF)               +=3D udmabuf.o
> > > +obj-$(CONFIG_DMABUF_SYSFS_STATS) +=3D dma-buf-sysfs-stats.o
> > >
> > >   dmabuf_selftests-y :=3D \
> > >       selftest.o \
> > > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/=
dma-buf-sysfs-stats.c
> > > new file mode 100644
> > > index 000000000000..61f85c3d16a5
> > > --- /dev/null
> > > +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> > > @@ -0,0 +1,283 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * DMA-BUF sysfs statistics.
> > > + *
> > > + * Copyright (C) 2021 Google LLC.
> > > + */
> > > +
> > > +#include <linux/dma-buf.h>
> > > +#include <linux/dma-resv.h>
> > > +#include <linux/kobject.h>
> > > +#include <linux/printk.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/sysfs.h>
> > > +
> > > +#define to_dma_buf_entry_from_kobj(x) container_of(x, struct dma_buf=
_sysfs_entry, kobj)
> > > +
> > > +struct dma_buf_stats_attribute {
> > > +     struct attribute attr;
> > > +     ssize_t (*show)(struct dma_buf *dmabuf,
> > > +                     struct dma_buf_stats_attribute *attr, char *buf=
);
> > > +};
> > > +#define to_dma_buf_stats_attr(x) container_of(x, struct dma_buf_stat=
s_attribute, attr)
> > > +
> > > +static ssize_t dma_buf_stats_attribute_show(struct kobject *kobj,
> > > +                                         struct attribute *attr,
> > > +                                         char *buf)
> > > +{
> > > +     struct dma_buf_stats_attribute *attribute;
> > > +     struct dma_buf_sysfs_entry *sysfs_entry;
> > > +     struct dma_buf *dmabuf;
> > > +
> > > +     attribute =3D to_dma_buf_stats_attr(attr);
> > > +     sysfs_entry =3D to_dma_buf_entry_from_kobj(kobj);
> > > +     dmabuf =3D sysfs_entry->dmabuf;
> > > +
> > > +     if (!dmabuf || !attribute->show)
> > > +             return -EIO;
> > > +
> > > +     return attribute->show(dmabuf, attribute, buf);
> > > +}
> > > +
> > > +static const struct sysfs_ops dma_buf_stats_sysfs_ops =3D {
> > > +     .show =3D dma_buf_stats_attribute_show,
> > > +};
> > > +
> > > +static ssize_t exporter_name_show(struct dma_buf *dmabuf,
> > > +                               struct dma_buf_stats_attribute *attr,
> > > +                               char *buf)
> > > +{
> > > +     return sysfs_emit(buf, "%s\n", dmabuf->exp_name);
> > > +}
> > > +
> > > +static ssize_t size_show(struct dma_buf *dmabuf,
> > > +                      struct dma_buf_stats_attribute *attr,
> > > +                      char *buf)
> > > +{
> > > +     return sysfs_emit(buf, "%zu\n", dmabuf->size);
> > > +}
> > > +
> > > +static struct dma_buf_stats_attribute exporter_name_attribute =3D
> > > +     __ATTR_RO(exporter_name);
> > > +static struct dma_buf_stats_attribute size_attribute =3D __ATTR_RO(s=
ize);
> > > +
> > > +static struct attribute *dma_buf_stats_default_attrs[] =3D {
> > > +     &exporter_name_attribute.attr,
> > > +     &size_attribute.attr,
> > > +     NULL,
> > > +};
> > > +ATTRIBUTE_GROUPS(dma_buf_stats_default);
> > > +
> > > +static void dma_buf_sysfs_release(struct kobject *kobj)
> > > +{
> > > +     struct dma_buf_sysfs_entry *sysfs_entry;
> > > +
> > > +     sysfs_entry =3D to_dma_buf_entry_from_kobj(kobj);
> > > +     kfree(sysfs_entry);
> > > +}
> > > +
> > > +static struct kobj_type dma_buf_ktype =3D {
> > > +     .sysfs_ops =3D &dma_buf_stats_sysfs_ops,
> > > +     .release =3D dma_buf_sysfs_release,
> > > +     .default_groups =3D dma_buf_stats_default_groups,
> > > +};
> > > +
> > > +#define to_dma_buf_attach_entry_from_kobj(x) container_of(x, struct =
dma_buf_attach_sysfs_entry, kobj)
> > > +
> > > +struct dma_buf_attach_stats_attribute {
> > > +     struct attribute attr;
> > > +     ssize_t (*show)(struct dma_buf_attach_sysfs_entry *sysfs_entry,
> > > +                     struct dma_buf_attach_stats_attribute *attr, ch=
ar *buf);
> > > +};
> > > +#define to_dma_buf_attach_stats_attr(x) container_of(x, struct dma_b=
uf_attach_stats_attribute, attr)
> > > +
> > > +static ssize_t dma_buf_attach_stats_attribute_show(struct kobject *k=
obj,
> > > +                                                struct attribute *at=
tr,
> > > +                                                char *buf)
> > > +{
> > > +     struct dma_buf_attach_stats_attribute *attribute;
> > > +     struct dma_buf_attach_sysfs_entry *sysfs_entry;
> > > +
> > > +     attribute =3D to_dma_buf_attach_stats_attr(attr);
> > > +     sysfs_entry =3D to_dma_buf_attach_entry_from_kobj(kobj);
> > > +
> > > +     if (!attribute->show)
> > > +             return -EIO;
> > > +
> > > +     return attribute->show(sysfs_entry, attribute, buf);
> > > +}
> > > +
> > > +static const struct sysfs_ops dma_buf_attach_stats_sysfs_ops =3D {
> > > +     .show =3D dma_buf_attach_stats_attribute_show,
> > > +};
> > > +
> > > +static ssize_t map_counter_show(struct dma_buf_attach_sysfs_entry *s=
ysfs_entry,
> > > +                             struct dma_buf_attach_stats_attribute *=
attr,
> > > +                             char *buf)
> > > +{
> > > +     return sysfs_emit(buf, "%u\n", sysfs_entry->map_counter);
> > > +}
> > > +
> > > +static struct dma_buf_attach_stats_attribute map_counter_attribute =
=3D
> > > +     __ATTR_RO(map_counter);
> > > +
> > > +static struct attribute *dma_buf_attach_stats_default_attrs[] =3D {
> > > +     &map_counter_attribute.attr,
> > > +     NULL,
> > > +};
> > > +ATTRIBUTE_GROUPS(dma_buf_attach_stats_default);
> > > +
> > > +static void dma_buf_attach_sysfs_release(struct kobject *kobj)
> > > +{
> > > +     struct dma_buf_attach_sysfs_entry *sysfs_entry;
> > > +
> > > +     sysfs_entry =3D to_dma_buf_attach_entry_from_kobj(kobj);
> > > +     kfree(sysfs_entry);
> > > +}
> > > +
> > > +static struct kobj_type dma_buf_attach_ktype =3D {
> > > +     .sysfs_ops =3D &dma_buf_attach_stats_sysfs_ops,
> > > +     .release =3D dma_buf_attach_sysfs_release,
> > > +     .default_groups =3D dma_buf_attach_stats_default_groups,
> > > +};
> > > +
> > > +void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach=
)
> > > +{
> > > +     struct dma_buf_attach_sysfs_entry *sysfs_entry;
> > > +
> > > +     sysfs_entry =3D attach->sysfs_entry;
> > > +     if (!sysfs_entry)
> > > +             return;
> > > +
> > > +     sysfs_delete_link(&sysfs_entry->kobj, &attach->dev->kobj, "devi=
ce");
> > > +
> > > +     kobject_del(&sysfs_entry->kobj);
> > > +     kobject_put(&sysfs_entry->kobj);
> > > +}
> > > +
> > > +int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
> > > +                            unsigned int uid)
> > > +{
> > > +     struct dma_buf_attach_sysfs_entry *sysfs_entry;
> > > +     int ret;
> > > +     struct dma_buf *dmabuf;
> > > +
> > > +     if (!attach)
> > > +             return -EINVAL;
> > > +
> > > +     dmabuf =3D attach->dmabuf;
> > > +
> > > +     sysfs_entry =3D kzalloc(sizeof(struct dma_buf_attach_sysfs_entr=
y),
> > > +                           GFP_KERNEL);
> > > +     if (!sysfs_entry)
> > > +             return -ENOMEM;
> > > +
> > > +     sysfs_entry->kobj.kset =3D dmabuf->sysfs_entry->attach_stats_ks=
et;
> > > +
> > > +     attach->sysfs_entry =3D sysfs_entry;
> > > +
> > > +     ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_attac=
h_ktype,
> > > +                                NULL, "%u", uid);
> > > +     if (ret)
> > > +             goto kobj_err;
> > > +
> > > +     ret =3D sysfs_create_link(&sysfs_entry->kobj, &attach->dev->kob=
j,
> > > +                             "device");
> > > +     if (ret)
> > > +             goto link_err;
> > > +
> > > +     return 0;
> > > +
> > > +link_err:
> > > +     kobject_del(&sysfs_entry->kobj);
> > > +kobj_err:
> > > +     kobject_put(&sysfs_entry->kobj);
> > > +     attach->sysfs_entry =3D NULL;
> > > +
> > > +     return ret;
> > > +}
> > > +void dma_buf_stats_teardown(struct dma_buf *dmabuf)
> > > +{
> > > +     struct dma_buf_sysfs_entry *sysfs_entry;
> > > +
> > > +     sysfs_entry =3D dmabuf->sysfs_entry;
> > > +     if (!sysfs_entry)
> > > +             return;
> > > +
> > > +     kset_unregister(sysfs_entry->attach_stats_kset);
> > > +     kobject_del(&sysfs_entry->kobj);
> > > +     kobject_put(&sysfs_entry->kobj);
> > > +}
> > > +
> > > +static struct kset *dma_buf_stats_kset;
> > > +static struct kset *dma_buf_per_buffer_stats_kset;
> > > +int dma_buf_init_sysfs_statistics(void)
> > > +{
> > > +     dma_buf_stats_kset =3D kset_create_and_add("dmabuf", NULL, kern=
el_kobj);
> > > +     if (!dma_buf_stats_kset)
> > > +             return -ENOMEM;
> > > +
> > > +     dma_buf_per_buffer_stats_kset =3D kset_create_and_add("buffers"=
, NULL,
> > > +                                                         &dma_buf_st=
ats_kset->kobj);
> > > +     if (!dma_buf_per_buffer_stats_kset) {
> > > +             kset_unregister(dma_buf_stats_kset);
> > > +             return -ENOMEM;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +void dma_buf_uninit_sysfs_statistics(void)
> > > +{
> > > +     kset_unregister(dma_buf_per_buffer_stats_kset);
> > > +     kset_unregister(dma_buf_stats_kset);
> > > +}
> > > +
> > > +int dma_buf_stats_setup(struct dma_buf *dmabuf)
> > > +{
> > > +     struct dma_buf_sysfs_entry *sysfs_entry;
> > > +     int ret;
> > > +     struct kset *attach_stats_kset;
> > > +
> > > +     if (!dmabuf || !dmabuf->file)
> > > +             return -EINVAL;
> > > +
> > > +     if (!dmabuf->exp_name) {
> > > +             pr_err("exporter name must not be empty if stats needed=
\n");
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     sysfs_entry =3D kzalloc(sizeof(struct dma_buf_sysfs_entry), GFP=
_KERNEL);
> > > +     if (!sysfs_entry)
> > > +             return -ENOMEM;
> > > +
> > > +     sysfs_entry->kobj.kset =3D dma_buf_per_buffer_stats_kset;
> > > +     sysfs_entry->dmabuf =3D dmabuf;
> > > +
> > > +     dmabuf->sysfs_entry =3D sysfs_entry;
> > > +
> > > +     /* create the directory for buffer stats */
> > > +     ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype=
, NULL,
> > > +                                "%lu", file_inode(dmabuf->file)->i_i=
no);
> > > +     if (ret)
> > > +             goto err_sysfs_dmabuf;
> > > +
> > > +     /* create the directory for attachment stats */
> > > +     attach_stats_kset =3D kset_create_and_add("attachments", NULL,
> > > +                                             &sysfs_entry->kobj);
> > > +     if (!attach_stats_kset) {
> > > +             ret =3D -ENOMEM;
> > > +             goto err_sysfs_attach;
> > > +     }
> > > +
> > > +     sysfs_entry->attach_stats_kset =3D attach_stats_kset;
> > > +
> > > +     return 0;
> > > +
> > > +err_sysfs_attach:
> > > +     kobject_del(&sysfs_entry->kobj);
> > > +err_sysfs_dmabuf:
> > > +     kobject_put(&sysfs_entry->kobj);
> > > +     dmabuf->sysfs_entry =3D NULL;
> > > +     return ret;
> > > +}
> > > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/=
dma-buf-sysfs-stats.h
> > > new file mode 100644
> > > index 000000000000..5f4703249117
> > > --- /dev/null
> > > +++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
> > > @@ -0,0 +1,62 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * DMA-BUF sysfs statistics.
> > > + *
> > > + * Copyright (C) 2021 Google LLC.
> > > + */
> > > +
> > > +#ifndef _DMA_BUF_SYSFS_STATS_H
> > > +#define _DMA_BUF_SYSFS_STATS_H
> > > +
> > > +#ifdef CONFIG_DMABUF_SYSFS_STATS
> > > +
> > > +int dma_buf_init_sysfs_statistics(void);
> > > +void dma_buf_uninit_sysfs_statistics(void);
> > > +
> > > +int dma_buf_stats_setup(struct dma_buf *dmabuf);
> > > +int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
> > > +                            unsigned int uid);
> > > +static inline void dma_buf_update_attachment_map_count(struct dma_bu=
f_attachment *attach,
> > > +                                                    int delta)
> > > +{
> > > +     struct dma_buf_attach_sysfs_entry *entry =3D attach->sysfs_entr=
y;
> > > +
> > > +     entry->map_counter +=3D delta;
> > > +}
> > > +void dma_buf_stats_teardown(struct dma_buf *dmabuf);
> > > +void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach=
);
> > > +static inline unsigned int dma_buf_update_attach_uid(struct dma_buf =
*dmabuf)
> > > +{
> > > +     struct dma_buf_sysfs_entry *entry =3D dmabuf->sysfs_entry;
> > > +
> > > +     return entry->attachment_uid++;
> > > +}
> > > +#else
> > > +
> > > +static inline int dma_buf_init_sysfs_statistics(void)
> > > +{
> > > +     return 0;
> > > +}
> > > +
> > > +static inline void dma_buf_uninit_sysfs_statistics(void) {}
> > > +
> > > +static inline int dma_buf_stats_setup(struct dma_buf *dmabuf)
> > > +{
> > > +     return 0;
> > > +}
> > > +static inline int dma_buf_attach_stats_setup(struct dma_buf_attachme=
nt *attach,
> > > +                                          unsigned int uid)
> > > +{
> > > +     return 0;
> > > +}
> > > +
> > > +static inline void dma_buf_stats_teardown(struct dma_buf *dmabuf) {}
> > > +static inline void dma_buf_attach_stats_teardown(struct dma_buf_atta=
chment *attach) {}
> > > +static inline void dma_buf_update_attachment_map_count(struct dma_bu=
f_attachment *attach,
> > > +                                                    int delta) {}
> > > +static inline unsigned int dma_buf_update_attach_uid(struct dma_buf =
*dmabuf)
> > > +{
> > > +     return 0;
> > > +}
> > > +#endif
> > > +#endif // _DMA_BUF_SYSFS_STATS_H
> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index 9ad6397aaa97..29f9ea18eb47 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -29,6 +29,8 @@
> > >   #include <uapi/linux/dma-buf.h>
> > >   #include <uapi/linux/magic.h>
> > >
> > > +#include "dma-buf-sysfs-stats.h"
> > > +
> > >   static inline int is_dma_buf_file(struct file *);
> > >
> > >   struct dma_buf_list {
> > > @@ -79,6 +81,7 @@ static void dma_buf_release(struct dentry *dentry)
> > >       if (dmabuf->resv =3D=3D (struct dma_resv *)&dmabuf[1])
> > >               dma_resv_fini(dmabuf->resv);
> > >
> > > +     dma_buf_stats_teardown(dmabuf);
> > >       module_put(dmabuf->owner);
> > >       kfree(dmabuf->name);
> > >       kfree(dmabuf);
> > > @@ -579,6 +582,10 @@ struct dma_buf *dma_buf_export(const struct dma_=
buf_export_info *exp_info)
> > >       file->f_mode |=3D FMODE_LSEEK;
> > >       dmabuf->file =3D file;
> > >
> > > +     ret =3D dma_buf_stats_setup(dmabuf);
> > > +     if (ret)
> > > +             goto err_sysfs;
> > > +
> > >       mutex_init(&dmabuf->lock);
> > >       INIT_LIST_HEAD(&dmabuf->attachments);
> > >
> > > @@ -588,6 +595,14 @@ struct dma_buf *dma_buf_export(const struct dma_=
buf_export_info *exp_info)
> > >
> > >       return dmabuf;
> > >
> > > +err_sysfs:
> > > +     /*
> > > +      * Set file->f_path.dentry->d_fsdata to NULL so that when
> > > +      * dma_buf_release() gets invoked by dentry_ops, it exits
> > > +      * early before calling the release() dma_buf op.
> > > +      */
> > > +     file->f_path.dentry->d_fsdata =3D NULL;
> > > +     fput(file);
> > >   err_dmabuf:
> > >       kfree(dmabuf);
> > >   err_module:
> > > @@ -692,6 +707,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, st=
ruct device *dev,
> > >   {
> > >       struct dma_buf_attachment *attach;
> > >       int ret;
> > > +     unsigned int attach_uid;
> > >
> > >       if (WARN_ON(!dmabuf || !dev))
> > >               return ERR_PTR(-EINVAL);
> > > @@ -717,8 +733,13 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, s=
truct device *dev,
> > >       }
> > >       dma_resv_lock(dmabuf->resv, NULL);
> > >       list_add(&attach->node, &dmabuf->attachments);
> > > +     attach_uid =3D dma_buf_update_attach_uid(dmabuf);
> > >       dma_resv_unlock(dmabuf->resv);
> > >
> > > +     ret =3D dma_buf_attach_stats_setup(attach, attach_uid);
> > > +     if (ret)
> > > +             goto err_sysfs;
> > > +
> > >       /* When either the importer or the exporter can't handle dynami=
c
> > >        * mappings we cache the mapping here to avoid issues with the
> > >        * reservation object lock.
> > > @@ -745,6 +766,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, st=
ruct device *dev,
> > >                       dma_resv_unlock(attach->dmabuf->resv);
> > >               attach->sgt =3D sgt;
> > >               attach->dir =3D DMA_BIDIRECTIONAL;
> > > +             dma_buf_update_attachment_map_count(attach, 1 /* delta =
*/);
> > >       }
> > >
> > >       return attach;
> > > @@ -761,6 +783,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, st=
ruct device *dev,
> > >       if (dma_buf_is_dynamic(attach->dmabuf))
> > >               dma_resv_unlock(attach->dmabuf->resv);
> > >
> > > +err_sysfs:
> > >       dma_buf_detach(dmabuf, attach);
> > >       return ERR_PTR(ret);
> > >   }
> > > @@ -799,6 +822,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struc=
t dma_buf_attachment *attach)
> > >                       dma_resv_lock(attach->dmabuf->resv, NULL);
> > >
> > >               dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach-=
>dir);
> > > +             dma_buf_update_attachment_map_count(attach, -1 /* delta=
 */);
> > >
> > >               if (dma_buf_is_dynamic(attach->dmabuf)) {
> > >                       dma_buf_unpin(attach);
> > > @@ -812,6 +836,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struc=
t dma_buf_attachment *attach)
> > >       if (dmabuf->ops->detach)
> > >               dmabuf->ops->detach(dmabuf, attach);
> > >
> > > +     dma_buf_attach_stats_teardown(attach);
> > >       kfree(attach);
> > >   }
> > >   EXPORT_SYMBOL_GPL(dma_buf_detach);
> > > @@ -938,6 +963,9 @@ struct sg_table *dma_buf_map_attachment(struct dm=
a_buf_attachment *attach,
> > >       }
> > >   #endif /* CONFIG_DMA_API_DEBUG */
> > >
> > > +     if (!IS_ERR(sg_table))
> > > +             dma_buf_update_attachment_map_count(attach, 1 /* delta =
*/);
> > > +
> > >       return sg_table;
> > >   }
> > >   EXPORT_SYMBOL_GPL(dma_buf_map_attachment);
> > > @@ -975,6 +1003,8 @@ void dma_buf_unmap_attachment(struct dma_buf_att=
achment *attach,
> > >       if (dma_buf_is_dynamic(attach->dmabuf) &&
> > >           !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> > >               dma_buf_unpin(attach);
> > > +
> > > +     dma_buf_update_attachment_map_count(attach, -1 /* delta */);
> > >   }
> > >   EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
> > >
> > > @@ -1412,6 +1442,12 @@ static inline void dma_buf_uninit_debugfs(void=
)
> > >
> > >   static int __init dma_buf_init(void)
> > >   {
> > > +     int ret;
> > > +
> > > +     ret =3D dma_buf_init_sysfs_statistics();
> > > +     if (ret)
> > > +             return ret;
> > > +
> > >       dma_buf_mnt =3D kern_mount(&dma_buf_fs_type);
> > >       if (IS_ERR(dma_buf_mnt))
> > >               return PTR_ERR(dma_buf_mnt);
> > > @@ -1427,5 +1463,6 @@ static void __exit dma_buf_deinit(void)
> > >   {
> > >       dma_buf_uninit_debugfs();
> > >       kern_unmount(dma_buf_mnt);
> > > +     dma_buf_uninit_sysfs_statistics();
> > >   }
> > >   __exitcall(dma_buf_deinit);
> > > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > > index cf72699cb2bc..4ae5cc38a4a7 100644
> > > --- a/include/linux/dma-buf.h
> > > +++ b/include/linux/dma-buf.h
> > > @@ -294,6 +294,9 @@ struct dma_buf_ops {
> > >    * @poll: for userspace poll support
> > >    * @cb_excl: for userspace poll support
> > >    * @cb_shared: for userspace poll support
> > > + * @sysfs_entry: for exposing information about this buffer in sysfs=
.
> > > + * The attachment_uid member of @sysfs_entry is protected by dma_res=
v lock
> > > + * and is incremented on each attach.
> > >    *
> > >    * This represents a shared buffer, created by calling dma_buf_expo=
rt(). The
> > >    * userspace representation is a normal file descriptor, which can =
be created by
> > > @@ -329,6 +332,15 @@ struct dma_buf {
> > >
> > >               __poll_t active;
> > >       } cb_excl, cb_shared;
> > > +#ifdef CONFIG_DMABUF_SYSFS_STATS
> > > +     /* for sysfs stats */
> > > +     struct dma_buf_sysfs_entry {
> > > +             struct kobject kobj;
> > > +             struct dma_buf *dmabuf;
> > > +             unsigned int attachment_uid;
> > > +             struct kset *attach_stats_kset;
> > > +     } *sysfs_entry;
> > > +#endif
> >
> > Why not directly embed that?
> >
> > >   };
> > >
> > >   /**
> > > @@ -378,6 +390,7 @@ struct dma_buf_attach_ops {
> > >    * @importer_ops: importer operations for this attachment, if provi=
ded
> > >    * dma_buf_map/unmap_attachment() must be called with the dma_resv =
lock held.
> > >    * @importer_priv: importer specific attachment data.
> > > + * @sysfs_entry: For exposing information about this attachment in s=
ysfs.
> > >    *
> > >    * This structure holds the attachment information between the dma_=
buf buffer
> > >    * and its user device(s). The list contains one attachment struct =
per device
> > > @@ -398,6 +411,13 @@ struct dma_buf_attachment {
> > >       const struct dma_buf_attach_ops *importer_ops;
> > >       void *importer_priv;
> > >       void *priv;
> > > +#ifdef CONFIG_DMABUF_SYSFS_STATS
> > > +     /* for sysfs stats */
> > > +     struct dma_buf_attach_sysfs_entry {
> > > +             struct kobject kobj;
> > > +             unsigned int map_counter;
> > > +     } *sysfs_entry;
> > > +#endif
> >
> > Same question here.
> >
> > Apart from that the general approach looks solid to me now.
> >
> > But somebody with more sysfs background should check if everything ther=
e
> > is the right thing to do.
>
> So apparently Android is completely revamping all of this, but feeding
> it to upstream in pieces, and that doesn't work. Here's another part:
>
> https://lore.kernel.org/dri-devel/CAKMK7uE3xF80AsJ1zGfSM-KTry=3DikJ-S-Dn6=
nK8ZAvCSWw2FHQ@mail.gmail.com/

Thank you for taking a look and the guidance so far Daniel! The above
patch (which adds tracepoints to track total GPU memory allocations)
is independent of the DMA-BUF sysfs stats effort. I agree that the
value from the tracepoint will include memory that is shared as
DMA-BUFs. However, there is no interdependency between the two
efforts. I have linked to the AOSP code that will parse the DMA-BUF
sysfs statistics in the commit message. We do have plans to expand the
sysfs interface itself in future(thank you for suggesting to make it
expandable in v1!) but when we do, we will make sure to send the
userspace code that uses it as well so that you can get the full
picture.

Regards,
Hridya

>
> I think we need an overall integrated solution here, or we're just
> building uapi that won't last (but we still have to support it
> forever).
>
> I think aside from having the full android side covered (but on
> upstream drivers, and including dma-buf sharing, not just only
> virtio-gpu) we also need to figure out how this will fit into other
> tracking efforts like cgroups. Otherwise we end up with one way of
> tracking gpu memory usage for android, implemented by out-of-tree
> drivers mostly. Another one for servers in cgroups, implemented by amd
> and intel, and then probably a third one for cros
> virtualization/containers, just because. That doesn't work too well.
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
