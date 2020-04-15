Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25641A924D
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 07:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393248AbgDOFQW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 01:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389851AbgDOFQU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 01:16:20 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01DA0C061A0C
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 22:16:18 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id m2so2253055otr.1
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 22:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UETgjLgGy1I8D/vK9hQsvwfCTgzWUx9NFafEAQacD6E=;
        b=F7vBBsb6EuShtNKrJqxknW9giKiJqe3/N8z/mYG48/aDXLbHF654CqZdbRpMn/wTGk
         ejJd/XN9ME8sUsM+DYAMJSN6J6gxmdghDCpc08SJOmBnSltQS/zl4hn7obWjD9lPN+x2
         cP4A0M5fBhyeKwlhk7aGqZejoaNgOX+6yHk6jpmCCUjRFI/OmbY0paA1ytezd6cvDw0F
         ukkGdEX2xV2p649BOCB92WZAKdRP8FxBnzzD16p/dLzZSf3tby53qr79TCn95taktjUM
         xj65E5akugViYZHtL83yL6vTDgQtLtz0xP6SW54QMximpjR33+0LPxCDniRUx35cfXz9
         WIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UETgjLgGy1I8D/vK9hQsvwfCTgzWUx9NFafEAQacD6E=;
        b=Yvvf6WBPPv5/JmSX7Qu9xBukAFGdLbF9D6mjf6lnV7ZZ/oZCdHYazvuO4dMMCPij38
         HqIo6A+TBTHR1NaKZPCfN0y6xFYlasQpBq2mVSKllBhJ0TJKwhY13Nwb1UIJEo++Ttrw
         456+y5Db3wJJ3vvKMKBTHrOP5L1TU/RnVqWhzpveoizz/Qm1P8gippj4zuic9JzZiT7R
         AAIiateRSy7EsfK3UkVWO9daWhHQ5P86qIRx4JI6yGb6eFwNa2yQW/rc7HeVU7kkf16C
         7sNTsA9KLlmItKFuCrRHEjb5H6pnYCTaHfEhr2L4cgYGlZ75zFAUEK0sZ3OSgYBP3vID
         PqnA==
X-Gm-Message-State: AGi0PuboNcLDY0aspbHfl0m+y1VbXdnpb8Rk2cEC+s8njcdSuFck1Int
        A+hpks9+PSyMCuWAYJ23p7Zizu2pFa/A/OAFglN6Bw==
X-Google-Smtp-Source: APiQypIty2GFH7AT8Ct4yPfxkBQyl5Hh92NEBt4okHCUEtJD5zk9q94TPKfT/jPH6jgTg/aMTeFvV2K62fwQy8Poqnk=
X-Received: by 2002:a05:6830:22dc:: with SMTP id q28mr239826otc.221.1586927778029;
 Tue, 14 Apr 2020 22:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200414134629.54567-1-orjan.eide@arm.com> <20200414141849.55654-1-orjan.eide@arm.com>
 <20200414142810.GA958163@kroah.com> <20200414161114.GA1949@e123356-lin.trondheim.arm.com>
In-Reply-To: <20200414161114.GA1949@e123356-lin.trondheim.arm.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 14 Apr 2020 22:16:06 -0700
Message-ID: <CALAqxLVM1i+Cj29h+kGfurEN9gEMwnD-9n9H1o0B4wRukmJRQw@mail.gmail.com>
Subject: Re: [PATCH] staging: android: ion: Skip sync if not mapped
To:     =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>, nd <nd@arm.com>,
        Anders Pedersen <anders.pedersen@arm.com>,
        Laura Abbott <labbott@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <christian@brauner.io>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>,
        driverdevel <devel@driverdev.osuosl.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        lkml <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 14, 2020 at 9:11 AM =C3=98rjan Eide <orjan.eide@arm.com> wrote:
>
> On Tue, Apr 14, 2020 at 04:28:10PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Apr 14, 2020 at 04:18:47PM +0200, =EF=BF=BDrjan Eide wrote:
> > > Only sync the sg-list of an Ion dma-buf attachment when the attachmen=
t
> > > is actually mapped on the device.
> > >
> > > dma-bufs may be synced at any time. It can be reached from user space
> > > via DMA_BUF_IOCTL_SYNC, so there are no guarantees from callers on wh=
en
> > > syncs may be attempted, and dma_buf_end_cpu_access() and
> > > dma_buf_begin_cpu_access() may not be paired.
> > >
> > > Since the sg_list's dma_address isn't set up until the buffer is used
> > > on the device, and dma_map_sg() is called on it, the dma_address will=
 be
> > > NULL if sync is attempted on the dma-buf before it's mapped on a devi=
ce.
> > >
> > > Before v5.0 (commit 55897af63091 ("dma-direct: merge swiotlb_dma_ops
> > > into the dma_direct code")) this was a problem as the dma-api (at lea=
st
> > > the swiotlb_dma_ops on arm64) would use the potentially invalid
> > > dma_address. How that failed depended on how the device handled physi=
cal
> > > address 0. If 0 was a valid address to physical ram, that page would =
get
> > > flushed a lot, while the actual pages in the buffer would not get syn=
ced
> > > correctly. While if 0 is an invalid physical address it may cause a
> > > fault and trigger a crash.
> > >
> > > In v5.0 this was incidentally fixed by commit 55897af63091 ("dma-dire=
ct:
> > > merge swiotlb_dma_ops into the dma_direct code"), as this moved the
> > > dma-api to use the page pointer in the sg_list, and (for Ion buffers =
at
> > > least) this will always be valid if the sg_list exists at all.
> > >
> > > But, this issue is re-introduced in v5.3 with
> > > commit 449fa54d6815 ("dma-direct: correct the physical addr in
> > > dma_direct_sync_sg_for_cpu/device") moves the dma-api back to the old
> > > behaviour and picks the dma_address that may be invalid.
> > >
> > > dma-buf core doesn't ensure that the buffer is mapped on the device, =
and
> > > thus have a valid sg_list, before calling the exporter's
> > > begin_cpu_access.
> > >
> > > Signed-off-by: =EF=BF=BDrjan Eide <orjan.eide@arm.com>
> > > ---
> > >  drivers/staging/android/ion/ion.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > Resubmit without disclaimer, sorry about that.
> > >
> > > This seems to be part of a bigger issue where dma-buf exporters assum=
e
> > > that their dma-buf begin_cpu_access and end_cpu_access callbacks have=
 a
> > > certain guaranteed behavior, which isn't ensured by dma-buf core.
> > >
> > > This patch fixes this in ion only, but it also needs to be fixed for
> > > other exporters, either handled like this in each exporter, or in
> > > dma-buf core before calling into the exporters.
> > >
> > > diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/andr=
oid/ion/ion.c
> > > index 38b51eace4f9..7b752ba0cb6d 100644
> > > --- a/drivers/staging/android/ion/ion.c
> > > +++ b/drivers/staging/android/ion/ion.c
> >
> > Now that we have the dma-buff stuff in the tree, do we even need the
> > ion code in the kernel anymore?  Can't we delete it now?
>
> It looks like the new dma-heaps have the same issue as ion. The
> heap-helpers also do dma_sync_sg_for_device() unconditionally on
> end_cpu_access which may happen before dma_map_sg(), leading to use of
> the 0 dma_address in the sg list of a, yet unmapped, attachment.

Yea, the dma-buf heaps code came from the ION logic, so it likely has
the same faults.

> It could be fixed in dma-heaps just like this patch does for ion. Is
> patch a valid way to fix this problem? Or, should this rather be handled
> in dma-buf core by tracking the mapped state of attachments there?

In the short-term, I'd definitely prefer to have a fix to dmabuf heaps
rather then ION, but I also agree that long term it probably shouldn't
just be up to the dma-buf exporter (as there are other dmabuf
exporters that may have it wrong too), and that we need to address
some DMA API expectations/limitations to better handle multiple device
pipelines. (I actually gave a talk last fall on some of the issues I
see around it: https://youtu.be/UsEVoWD_o0c )

thanks
-john
