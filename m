Return-Path: <linux-media+bounces-51056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1242ED3A9EC
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 14:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A056F30081A9
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 13:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B74364EBB;
	Mon, 19 Jan 2026 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pdG3Wzv4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235B136404B
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 13:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828124; cv=none; b=cb+MYrRIw35jsxj3j+SNPx/Ij6CVEGOCUrG/XyAa3lohUZs8eFulzGn5uxHH3F4/jZfB+j672KEBa3L5c6qRaLk43fOQFc9HlGcM2WSw+Me4W7WWHJh4cvmm1HLWqijL6LmWf+vJ3PSnX8HAenQXRb8Yexng+HMx6TrNdbU10Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828124; c=relaxed/simple;
	bh=Wbugdw29u8A6Bkh9XlucRIkHY/Zjm+DtEutptWwtBWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kH2EpyGqO24CH2YdcG5tk4iLdT8tVTujvMgjzWue9458FGvVmWSImbc+kR+jOoIjYGhlufhXxlQrQ/N3wOgq39tU6mi5KQu8CElQSpIsjB38fqSmkWFlQWQdDVhtG1eM79qS9VX/QvU54Rc7JSRH/bKKrgomC3CMq/u15GV4Z4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pdG3Wzv4; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b876f3f603eso727591466b.0
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 05:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768828119; x=1769432919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAfYRQkT3Ezomz71v5iTAhW0+70GaCmS0ngv6YppkZI=;
        b=pdG3Wzv4eZ/snv/ro5DgpcRPP2O9cuqwgA7TOMCc9S+yCVSWCiEmEcXncBic4coa/5
         /MX/fBW+nFTiKOQhmnD6Vhv/Dom7m2NhNc3PCVY7K0VBg7TxlDTqjwr/WCowWq0f3t/f
         20VJqf+miCQ8JXY7ud4S98IbIfCA1wc6SIJMjdMT4kCm4mJjdkGYhjKdVra9aHX/wdZC
         CZrFBvu9ncDq5ruQHonUT2AnzLHw1ODBxYYHVgMN+BmZHVmVf+E6jM0bU16kvc83QLtt
         isVlcslJ0gfgsZt2Fcb10vBCsqQpxnsB5H3REBtgSKYksSxRgUN1iDCGfHqxk//Brzov
         rqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828119; x=1769432919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DAfYRQkT3Ezomz71v5iTAhW0+70GaCmS0ngv6YppkZI=;
        b=EOmdeLvtaUI8PdOnfwqxxaIRvXMDL6n/ESYmRjH3Ts1eIMgLNdHNboBCHGLAlK8Yhd
         4evuZqO7l83SPKy83i1bcTZNE8LnMKMvgE5xRRKoGuW+BruExD7oNshH9Jr0FMyft7YW
         LMQSjReL0U5ops92+uH3whYj/eUUXGKxt5wyvlU0DulD0RoFX5NY74KwFEPNMR9tGhbB
         TKwfTIbD6pjFkhGtXcdvIoIKTxy4TDUoigURCv95hjOIYYSqGyDuFRcWFAT0qJ6IR1Cv
         ZKElSsMXPfGjvHdODDgWyyoUOAHOOFQzc4kKOqJEmX4yzLKS9m2O+HJR0IqF6HUENUEa
         l2EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvPAgI1Y9UnX0vvfIv3031FKh1fmxN+iSCw03RbLrxixNhyXiJG2BU4b9tvqFRFqanq/0et8X0kXK3zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrFwSDPVTe9phBguU7czQM4DGjvA4Q57O/T63VwRZzzNhK27XW
	sm7BZr1Q27oQW7EmSeZxbXb0za/BZcc7ueu96eOowvi7U5ZgN8KzX8TiHZZKsXx+M9FN9CGEbcQ
	DBXvVM7DOyk8cG3NE6WP/nX0e/IR6qpZfkHKQoPw4Dw==
X-Gm-Gg: AY/fxX7fkrXLeK9F0aLhTt5O83jCN+6TQSGnb+kcF0eFjFOUhTn6oOTBPAwMm7u6zLA
	+350JL0bWEgOqr3f7BIDHMrXSqGqc/nR4C7CaLe+Fv/sDwAJ09m4OVf9F/xvzhueg27tT1mS+Za
	JZDeZZ5vAkDjjpysgDq0sJrLi9XlwAWFxAPyjpDabw/dWKJ0I2GvhzVBxFuW67zbGPc3nLA5RM0
	XUO9PIx0VzsPb6xwhT0+yYiQ+ntbP5wc6f/UjM1qsxYpVlNtB6MX04ZlHTbFQXEnoL3qJUje8tv
	enDLXP2gjI+0Xcvym4+Imqsgyeo=
X-Received: by 2002:a17:906:730e:b0:b87:115c:4a30 with SMTP id
 a640c23a62f3a-b879690c497mr900814166b.16.1768828119105; Mon, 19 Jan 2026
 05:08:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116190517.3268458-1-tjmercier@google.com> <4cd1ed61-0b19-45ef-a77c-7fccde818ae9@amd.com>
In-Reply-To: <4cd1ed61-0b19-45ef-a77c-7fccde818ae9@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Mon, 19 Jan 2026 18:38:27 +0530
X-Gm-Features: AZwV_QhnM8x45IrWjp5NER5n7vrxCzj5VjavxW9RTC9k9PvsskuNtL1BUJrWUho
Message-ID: <CAO_48GENCZrXNCgXnW4rujNMHk8d9QrXoACT1zpJhWR0r0jACw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Remove DMA-BUF sysfs stats
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi T J,

On Mon, 19 Jan 2026 at 15:15, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 1/16/26 20:05, T.J. Mercier wrote:
> > Commit bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stat=
s
> > in sysfs") added dmabuf statistics to sysfs in 2021 under
> > CONFIG_DMABUF_SYSFS_STATS. After being used in production, performance
> > problems were discovered leading to its deprecation in 2022 in commit
> > e0a9f1fe206a ("dma-buf: deprecate DMABUF_SYSFS_STATS"). Some of the
> > problems with this interface were discussed in my LPC 2025 talk. [1][2]
> >
> > Android was probably the last user of the interface, which has since
> > been migrated to use the dmabuf BPF iterator [3] to obtain the same
> > information more cheaply. As promised in that series, now that the
> > longterm stable 6.18 kernel has been released let's remove the sysfs
> > dmabuf statistics from the kernel.
> >
> > [1] https://www.youtube.com/watch?v=3DD83qygudq9c
> > [2] https://lpc.events/event/19/contributions/2118/
> > [3] https://lore.kernel.org/all/20250522230429.941193-1-tjmercier@googl=
e.com/
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
>
> Oh yes please :)
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Thank you for your patch, LGTM :)

If its not pushed yet, I'll push it tonight.

Best,
Sumit
>
> > ---
> >  .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  24 ---
> >  Documentation/driver-api/dma-buf.rst          |   5 -
> >  drivers/dma-buf/Kconfig                       |  15 --
> >  drivers/dma-buf/Makefile                      |   1 -
> >  drivers/dma-buf/dma-buf-sysfs-stats.c         | 202 ------------------
> >  drivers/dma-buf/dma-buf-sysfs-stats.h         |  35 ---
> >  drivers/dma-buf/dma-buf.c                     |  18 --
> >  include/linux/dma-buf.h                       |  12 --
> >  8 files changed, 312 deletions(-)
> >  delete mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffe=
rs
> >  delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
> >  delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
> >
> > diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers b/Do=
cumentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> > deleted file mode 100644
> > index 5d3bc997dc64..000000000000
> > --- a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> > +++ /dev/null
> > @@ -1,24 +0,0 @@
> > -What:                /sys/kernel/dmabuf/buffers
> > -Date:                May 2021
> > -KernelVersion:       v5.13
> > -Contact:     Hridya Valsaraju <hridya@google.com>
> > -Description: The /sys/kernel/dmabuf/buffers directory contains a
> > -             snapshot of the internal state of every DMA-BUF.
> > -             /sys/kernel/dmabuf/buffers/<inode_number> will contain th=
e
> > -             statistics for the DMA-BUF with the unique inode number
> > -             <inode_number>
> > -Users:               kernel memory tuning/debugging tools
> > -
> > -What:                /sys/kernel/dmabuf/buffers/<inode_number>/exporte=
r_name
> > -Date:                May 2021
> > -KernelVersion:       v5.13
> > -Contact:     Hridya Valsaraju <hridya@google.com>
> > -Description: This file is read-only and contains the name of the expor=
ter of
> > -             the DMA-BUF.
> > -
> > -What:                /sys/kernel/dmabuf/buffers/<inode_number>/size
> > -Date:                May 2021
> > -KernelVersion:       v5.13
> > -Contact:     Hridya Valsaraju <hridya@google.com>
> > -Description: This file is read-only and specifies the size of the DMA-=
BUF in
> > -             bytes.
> > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/drive=
r-api/dma-buf.rst
> > index 29abf1eebf9f..2f36c21d9948 100644
> > --- a/Documentation/driver-api/dma-buf.rst
> > +++ b/Documentation/driver-api/dma-buf.rst
> > @@ -125,11 +125,6 @@ Implicit Fence Poll Support
> >  .. kernel-doc:: drivers/dma-buf/dma-buf.c
> >     :doc: implicit fence polling
> >
> > -DMA-BUF statistics
> > -~~~~~~~~~~~~~~~~~~
> > -.. kernel-doc:: drivers/dma-buf/dma-buf-sysfs-stats.c
> > -   :doc: overview
> > -
> >  DMA Buffer ioctls
> >  ~~~~~~~~~~~~~~~~~
> >
> > diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> > index fdd823e446cc..012d22e941d6 100644
> > --- a/drivers/dma-buf/Kconfig
> > +++ b/drivers/dma-buf/Kconfig
> > @@ -75,21 +75,6 @@ menuconfig DMABUF_HEAPS
> >         allows userspace to allocate dma-bufs that can be shared
> >         between drivers.
> >
> > -menuconfig DMABUF_SYSFS_STATS
> > -     bool "DMA-BUF sysfs statistics (DEPRECATED)"
> > -     depends on DMA_SHARED_BUFFER
> > -     help
> > -        Choose this option to enable DMA-BUF sysfs statistics
> > -        in location /sys/kernel/dmabuf/buffers.
> > -
> > -        /sys/kernel/dmabuf/buffers/<inode_number> will contain
> > -        statistics for the DMA-BUF with the unique inode number
> > -        <inode_number>.
> > -
> > -        This option is deprecated and should sooner or later be remove=
d.
> > -        Android is the only user of this and it turned out that this r=
esulted
> > -        in quite some performance problems.
> > -
> >  source "drivers/dma-buf/heaps/Kconfig"
> >
> >  endmenu
> > diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> > index 2008fb7481b3..7a85565d906b 100644
> > --- a/drivers/dma-buf/Makefile
> > +++ b/drivers/dma-buf/Makefile
> > @@ -6,7 +6,6 @@ obj-$(CONFIG_DMABUF_HEAPS)    +=3D heaps/
> >  obj-$(CONFIG_SYNC_FILE)              +=3D sync_file.o
> >  obj-$(CONFIG_SW_SYNC)                +=3D sw_sync.o sync_debug.o
> >  obj-$(CONFIG_UDMABUF)                +=3D udmabuf.o
> > -obj-$(CONFIG_DMABUF_SYSFS_STATS) +=3D dma-buf-sysfs-stats.o
> >
> >  dmabuf_selftests-y :=3D \
> >       selftest.o \
> > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dm=
a-buf-sysfs-stats.c
> > deleted file mode 100644
> > index b5b62e40ccc1..000000000000
> > --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> > +++ /dev/null
> > @@ -1,202 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0-only
> > -/*
> > - * DMA-BUF sysfs statistics.
> > - *
> > - * Copyright (C) 2021 Google LLC.
> > - */
> > -
> > -#include <linux/dma-buf.h>
> > -#include <linux/dma-resv.h>
> > -#include <linux/kobject.h>
> > -#include <linux/printk.h>
> > -#include <linux/slab.h>
> > -#include <linux/sysfs.h>
> > -
> > -#include "dma-buf-sysfs-stats.h"
> > -
> > -#define to_dma_buf_entry_from_kobj(x) container_of(x, struct dma_buf_s=
ysfs_entry, kobj)
> > -
> > -/**
> > - * DOC: overview
> > - *
> > - * ``/sys/kernel/debug/dma_buf/bufinfo`` provides an overview of every=
 DMA-BUF
> > - * in the system. However, since debugfs is not safe to be mounted in
> > - * production, procfs and sysfs can be used to gather DMA-BUF statisti=
cs on
> > - * production systems.
> > - *
> > - * The ``/proc/<pid>/fdinfo/<fd>`` files in procfs can be used to gath=
er
> > - * information about DMA-BUF fds. Detailed documentation about the int=
erface
> > - * is present in Documentation/filesystems/proc.rst.
> > - *
> > - * Unfortunately, the existing procfs interfaces can only provide info=
rmation
> > - * about the DMA-BUFs for which processes hold fds or have the buffers=
 mmapped
> > - * into their address space. This necessitated the creation of the DMA=
-BUF sysfs
> > - * statistics interface to provide per-buffer information on productio=
n systems.
> > - *
> > - * The interface at ``/sys/kernel/dmabuf/buffers`` exposes information=
 about
> > - * every DMA-BUF when ``CONFIG_DMABUF_SYSFS_STATS`` is enabled.
> > - *
> > - * The following stats are exposed by the interface:
> > - *
> > - * * ``/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name``
> > - * * ``/sys/kernel/dmabuf/buffers/<inode_number>/size``
> > - *
> > - * The information in the interface can also be used to derive per-exp=
orter
> > - * statistics. The data from the interface can be gathered on error co=
nditions
> > - * or other important events to provide a snapshot of DMA-BUF usage.
> > - * It can also be collected periodically by telemetry to monitor vario=
us metrics.
> > - *
> > - * Detailed documentation about the interface is present in
> > - * Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers.
> > - */
> > -
> > -struct dma_buf_stats_attribute {
> > -     struct attribute attr;
> > -     ssize_t (*show)(struct dma_buf *dmabuf,
> > -                     struct dma_buf_stats_attribute *attr, char *buf);
> > -};
> > -#define to_dma_buf_stats_attr(x) container_of(x, struct dma_buf_stats_=
attribute, attr)
> > -
> > -static ssize_t dma_buf_stats_attribute_show(struct kobject *kobj,
> > -                                         struct attribute *attr,
> > -                                         char *buf)
> > -{
> > -     struct dma_buf_stats_attribute *attribute;
> > -     struct dma_buf_sysfs_entry *sysfs_entry;
> > -     struct dma_buf *dmabuf;
> > -
> > -     attribute =3D to_dma_buf_stats_attr(attr);
> > -     sysfs_entry =3D to_dma_buf_entry_from_kobj(kobj);
> > -     dmabuf =3D sysfs_entry->dmabuf;
> > -
> > -     if (!dmabuf || !attribute->show)
> > -             return -EIO;
> > -
> > -     return attribute->show(dmabuf, attribute, buf);
> > -}
> > -
> > -static const struct sysfs_ops dma_buf_stats_sysfs_ops =3D {
> > -     .show =3D dma_buf_stats_attribute_show,
> > -};
> > -
> > -static ssize_t exporter_name_show(struct dma_buf *dmabuf,
> > -                               struct dma_buf_stats_attribute *attr,
> > -                               char *buf)
> > -{
> > -     return sysfs_emit(buf, "%s\n", dmabuf->exp_name);
> > -}
> > -
> > -static ssize_t size_show(struct dma_buf *dmabuf,
> > -                      struct dma_buf_stats_attribute *attr,
> > -                      char *buf)
> > -{
> > -     return sysfs_emit(buf, "%zu\n", dmabuf->size);
> > -}
> > -
> > -static struct dma_buf_stats_attribute exporter_name_attribute =3D
> > -     __ATTR_RO(exporter_name);
> > -static struct dma_buf_stats_attribute size_attribute =3D __ATTR_RO(siz=
e);
> > -
> > -static struct attribute *dma_buf_stats_default_attrs[] =3D {
> > -     &exporter_name_attribute.attr,
> > -     &size_attribute.attr,
> > -     NULL,
> > -};
> > -ATTRIBUTE_GROUPS(dma_buf_stats_default);
> > -
> > -static void dma_buf_sysfs_release(struct kobject *kobj)
> > -{
> > -     struct dma_buf_sysfs_entry *sysfs_entry;
> > -
> > -     sysfs_entry =3D to_dma_buf_entry_from_kobj(kobj);
> > -     kfree(sysfs_entry);
> > -}
> > -
> > -static const struct kobj_type dma_buf_ktype =3D {
> > -     .sysfs_ops =3D &dma_buf_stats_sysfs_ops,
> > -     .release =3D dma_buf_sysfs_release,
> > -     .default_groups =3D dma_buf_stats_default_groups,
> > -};
> > -
> > -void dma_buf_stats_teardown(struct dma_buf *dmabuf)
> > -{
> > -     struct dma_buf_sysfs_entry *sysfs_entry;
> > -
> > -     sysfs_entry =3D dmabuf->sysfs_entry;
> > -     if (!sysfs_entry)
> > -             return;
> > -
> > -     kobject_del(&sysfs_entry->kobj);
> > -     kobject_put(&sysfs_entry->kobj);
> > -}
> > -
> > -
> > -/* Statistics files do not need to send uevents. */
> > -static int dmabuf_sysfs_uevent_filter(const struct kobject *kobj)
> > -{
> > -     return 0;
> > -}
> > -
> > -static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops =3D {
> > -     .filter =3D dmabuf_sysfs_uevent_filter,
> > -};
> > -
> > -static struct kset *dma_buf_stats_kset;
> > -static struct kset *dma_buf_per_buffer_stats_kset;
> > -int dma_buf_init_sysfs_statistics(void)
> > -{
> > -     dma_buf_stats_kset =3D kset_create_and_add("dmabuf",
> > -                                              &dmabuf_sysfs_no_uevent_=
ops,
> > -                                              kernel_kobj);
> > -     if (!dma_buf_stats_kset)
> > -             return -ENOMEM;
> > -
> > -     dma_buf_per_buffer_stats_kset =3D kset_create_and_add("buffers",
> > -                                                         &dmabuf_sysfs=
_no_uevent_ops,
> > -                                                         &dma_buf_stat=
s_kset->kobj);
> > -     if (!dma_buf_per_buffer_stats_kset) {
> > -             kset_unregister(dma_buf_stats_kset);
> > -             return -ENOMEM;
> > -     }
> > -
> > -     return 0;
> > -}
> > -
> > -void dma_buf_uninit_sysfs_statistics(void)
> > -{
> > -     kset_unregister(dma_buf_per_buffer_stats_kset);
> > -     kset_unregister(dma_buf_stats_kset);
> > -}
> > -
> > -int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file)
> > -{
> > -     struct dma_buf_sysfs_entry *sysfs_entry;
> > -     int ret;
> > -
> > -     if (!dmabuf->exp_name) {
> > -             pr_err("exporter name must not be empty if stats needed\n=
");
> > -             return -EINVAL;
> > -     }
> > -
> > -     sysfs_entry =3D kzalloc(sizeof(struct dma_buf_sysfs_entry), GFP_K=
ERNEL);
> > -     if (!sysfs_entry)
> > -             return -ENOMEM;
> > -
> > -     sysfs_entry->kobj.kset =3D dma_buf_per_buffer_stats_kset;
> > -     sysfs_entry->dmabuf =3D dmabuf;
> > -
> > -     dmabuf->sysfs_entry =3D sysfs_entry;
> > -
> > -     /* create the directory for buffer stats */
> > -     ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, =
NULL,
> > -                                "%lu", file_inode(file)->i_ino);
> > -     if (ret)
> > -             goto err_sysfs_dmabuf;
> > -
> > -     return 0;
> > -
> > -err_sysfs_dmabuf:
> > -     kobject_put(&sysfs_entry->kobj);
> > -     dmabuf->sysfs_entry =3D NULL;
> > -     return ret;
> > -}
> > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dm=
a-buf-sysfs-stats.h
> > deleted file mode 100644
> > index 7a8a995b75ba..000000000000
> > --- a/drivers/dma-buf/dma-buf-sysfs-stats.h
> > +++ /dev/null
> > @@ -1,35 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0-only */
> > -/*
> > - * DMA-BUF sysfs statistics.
> > - *
> > - * Copyright (C) 2021 Google LLC.
> > - */
> > -
> > -#ifndef _DMA_BUF_SYSFS_STATS_H
> > -#define _DMA_BUF_SYSFS_STATS_H
> > -
> > -#ifdef CONFIG_DMABUF_SYSFS_STATS
> > -
> > -int dma_buf_init_sysfs_statistics(void);
> > -void dma_buf_uninit_sysfs_statistics(void);
> > -
> > -int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file);
> > -
> > -void dma_buf_stats_teardown(struct dma_buf *dmabuf);
> > -#else
> > -
> > -static inline int dma_buf_init_sysfs_statistics(void)
> > -{
> > -     return 0;
> > -}
> > -
> > -static inline void dma_buf_uninit_sysfs_statistics(void) {}
> > -
> > -static inline int dma_buf_stats_setup(struct dma_buf *dmabuf, struct f=
ile *file)
> > -{
> > -     return 0;
> > -}
> > -
> > -static inline void dma_buf_stats_teardown(struct dma_buf *dmabuf) {}
> > -#endif
> > -#endif // _DMA_BUF_SYSFS_STATS_H
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index a4d8f2ff94e4..8e23580f1754 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -33,8 +33,6 @@
> >  #include <uapi/linux/dma-buf.h>
> >  #include <uapi/linux/magic.h>
> >
> > -#include "dma-buf-sysfs-stats.h"
> > -
> >  #define CREATE_TRACE_POINTS
> >  #include <trace/events/dma_buf.h>
> >
> > @@ -184,7 +182,6 @@ static void dma_buf_release(struct dentry *dentry)
> >        */
> >       BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
> >
> > -     dma_buf_stats_teardown(dmabuf);
> >       dmabuf->ops->release(dmabuf);
> >
> >       if (dmabuf->resv =3D=3D (struct dma_resv *)&dmabuf[1])
> > @@ -765,10 +762,6 @@ struct dma_buf *dma_buf_export(const struct dma_bu=
f_export_info *exp_info)
> >               dmabuf->resv =3D resv;
> >       }
> >
> > -     ret =3D dma_buf_stats_setup(dmabuf, file);
> > -     if (ret)
> > -             goto err_dmabuf;
> > -
> >       file->private_data =3D dmabuf;
> >       file->f_path.dentry->d_fsdata =3D dmabuf;
> >       dmabuf->file =3D file;
> > @@ -779,10 +772,6 @@ struct dma_buf *dma_buf_export(const struct dma_bu=
f_export_info *exp_info)
> >
> >       return dmabuf;
> >
> > -err_dmabuf:
> > -     if (!resv)
> > -             dma_resv_fini(dmabuf->resv);
> > -     kfree(dmabuf);
> >  err_file:
> >       fput(file);
> >  err_module:
> > @@ -1802,12 +1791,6 @@ static inline void dma_buf_uninit_debugfs(void)
> >
> >  static int __init dma_buf_init(void)
> >  {
> > -     int ret;
> > -
> > -     ret =3D dma_buf_init_sysfs_statistics();
> > -     if (ret)
> > -             return ret;
> > -
> >       dma_buf_mnt =3D kern_mount(&dma_buf_fs_type);
> >       if (IS_ERR(dma_buf_mnt))
> >               return PTR_ERR(dma_buf_mnt);
> > @@ -1821,6 +1804,5 @@ static void __exit dma_buf_deinit(void)
> >  {
> >       dma_buf_uninit_debugfs();
> >       kern_unmount(dma_buf_mnt);
> > -     dma_buf_uninit_sysfs_statistics();
> >  }
> >  __exitcall(dma_buf_deinit);
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 0bc492090237..91f4939db89b 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -429,18 +429,6 @@ struct dma_buf {
> >
> >               __poll_t active;
> >       } cb_in, cb_out;
> > -#ifdef CONFIG_DMABUF_SYSFS_STATS
> > -     /**
> > -      * @sysfs_entry:
> > -      *
> > -      * For exposing information about this buffer in sysfs. See also
> > -      * `DMA-BUF statistics`_ for the uapi this enables.
> > -      */
> > -     struct dma_buf_sysfs_entry {
> > -             struct kobject kobj;
> > -             struct dma_buf *dmabuf;
> > -     } *sysfs_entry;
> > -#endif
> >  };
> >
> >  /**
> >
> > base-commit: 26b4309a3ab82a0697751cde52eb336c29c19035
>

