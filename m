Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C648B1B043E
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 10:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgDTIWS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 04:22:18 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60176 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgDTIWR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 04:22:17 -0400
Received: from ip5f5af183.dynamic.kabel-deutschland.de ([95.90.241.131] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1jQRgv-0004mr-1c; Mon, 20 Apr 2020 08:22:09 +0000
Date:   Mon, 20 Apr 2020 10:22:07 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        driverdevel <devel@driverdev.osuosl.org>,
        Laura Abbott <labbott@redhat.com>,
        Todd Kjos <tkjos@android.com>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        lkml <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
        Anders Pedersen <anders.pedersen@arm.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        =?utf-8?B?w5hyamFu?= Eide <orjan.eide@arm.com>,
        nd <nd@arm.com>, Martijn Coenen <maco@android.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Brauner <christian@brauner.io>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: android: ion: Skip sync if not mapped
Message-ID: <20200420082207.ui7iyg7dsnred2vv@wittgenstein>
References: <20200414134629.54567-1-orjan.eide@arm.com>
 <20200414141849.55654-1-orjan.eide@arm.com>
 <20200414142810.GA958163@kroah.com>
 <CALAqxLX-SUhHPH6ewt-s9cEMc8DtMTgXem=JruAkLofuJf1syg@mail.gmail.com>
 <20200416102508.GA820251@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200416102508.GA820251@kroah.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 16, 2020 at 12:25:08PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 14, 2020 at 09:41:31PM -0700, John Stultz wrote:
> > On Tue, Apr 14, 2020 at 7:28 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Apr 14, 2020 at 04:18:47PM +0200, Ørjan Eide wrote:
> > > > Only sync the sg-list of an Ion dma-buf attachment when the attachment
> > > > is actually mapped on the device.
> > > >
> > > > dma-bufs may be synced at any time. It can be reached from user space
> > > > via DMA_BUF_IOCTL_SYNC, so there are no guarantees from callers on when
> > > > syncs may be attempted, and dma_buf_end_cpu_access() and
> > > > dma_buf_begin_cpu_access() may not be paired.
> > > >
> > > > Since the sg_list's dma_address isn't set up until the buffer is used
> > > > on the device, and dma_map_sg() is called on it, the dma_address will be
> > > > NULL if sync is attempted on the dma-buf before it's mapped on a device.
> > > >
> > > > Before v5.0 (commit 55897af63091 ("dma-direct: merge swiotlb_dma_ops
> > > > into the dma_direct code")) this was a problem as the dma-api (at least
> > > > the swiotlb_dma_ops on arm64) would use the potentially invalid
> > > > dma_address. How that failed depended on how the device handled physical
> > > > address 0. If 0 was a valid address to physical ram, that page would get
> > > > flushed a lot, while the actual pages in the buffer would not get synced
> > > > correctly. While if 0 is an invalid physical address it may cause a
> > > > fault and trigger a crash.
> > > >
> > > > In v5.0 this was incidentally fixed by commit 55897af63091 ("dma-direct:
> > > > merge swiotlb_dma_ops into the dma_direct code"), as this moved the
> > > > dma-api to use the page pointer in the sg_list, and (for Ion buffers at
> > > > least) this will always be valid if the sg_list exists at all.
> > > >
> > > > But, this issue is re-introduced in v5.3 with
> > > > commit 449fa54d6815 ("dma-direct: correct the physical addr in
> > > > dma_direct_sync_sg_for_cpu/device") moves the dma-api back to the old
> > > > behaviour and picks the dma_address that may be invalid.
> > > >
> > > > dma-buf core doesn't ensure that the buffer is mapped on the device, and
> > > > thus have a valid sg_list, before calling the exporter's
> > > > begin_cpu_access.
> > > >
> > > > Signed-off-by: Ørjan Eide <orjan.eide@arm.com>
> > > > ---
> > > >  drivers/staging/android/ion/ion.c | 12 ++++++++++++
> > > >  1 file changed, 12 insertions(+)
> > > >
> > > > Resubmit without disclaimer, sorry about that.
> > > >
> > > > This seems to be part of a bigger issue where dma-buf exporters assume
> > > > that their dma-buf begin_cpu_access and end_cpu_access callbacks have a
> > > > certain guaranteed behavior, which isn't ensured by dma-buf core.
> > > >
> > > > This patch fixes this in ion only, but it also needs to be fixed for
> > > > other exporters, either handled like this in each exporter, or in
> > > > dma-buf core before calling into the exporters.
> > > >
> > > > diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
> > > > index 38b51eace4f9..7b752ba0cb6d 100644
> > > > --- a/drivers/staging/android/ion/ion.c
> > > > +++ b/drivers/staging/android/ion/ion.c
> > >
> > > Now that we have the dma-buff stuff in the tree, do we even need the
> > > ion code in the kernel anymore?  Can't we delete it now?
> > >
> > 
> > I agree that we shouldn't be taking further (non-security/cleanup)
> > patches to the ION code.
> > 
> > I'd like to give developers a little bit of a transition period (I was
> > thinking a year, but really just one LTS release that has both would
> > do) where they can move their ION heaps over to dmabuf heaps and test
> > both against the same tree.
> > 
> > But I do think we can mark it as deprecated and let folks know that
> > around the end of the year it will be deleted.
> 
> No one ever notices "depreciated" things, they only notice if the code
> is no longer there :)
> 
> So I'm all for just deleting it and seeing who even notices...

Agreed.
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
