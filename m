Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC482D7F88
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 20:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393878AbgLKTk2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 14:40:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393841AbgLKTkJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 14:40:09 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3155FC061793
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 11:39:29 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id k2so11073134oic.13
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 11:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s+awO2pr5ClNOCamyu789YlXSRozxdskX216w6cl2f8=;
        b=OvDJplID/dYzRWRamwAVmHKXJiH7h7PuuYrp23AFNRL34x6i3YU2r+Wb/mZGIYpxoa
         2tYYlHM/TmjusEYzJy5hMT4oI7Ra8iLYw980lepj+jLvYjMY3D/eEuT1wkF1aXcoma7z
         gz4bANTGz1SALkF11S4YzZJPpAWHky2LiHNuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s+awO2pr5ClNOCamyu789YlXSRozxdskX216w6cl2f8=;
        b=BkwvJQ2MUYqqBkapBKjmUzoDBZaRejBNvdNisAxW6y3LU64yfIhbYYhor404kq9tkN
         AxYLWv3omw6Rv1Pqhsd4ZXhEmv3FE6iYhhVX2ZfFsSFy1FcVaDZL0pScArETfJhAKYVw
         xgq0R5Y+X02yBdn7ufZUYY02a/Vh8rNlLv5BoHD2Qnl+L4vT968RpGyMd7dFtEOPDqPU
         9VrikrqnBxHP9HeX8Icx4IFFTLzGtrvW0WdooYgMTcdd/tDZPmN3BhA8XKBv17wwcUey
         +VIThhN24Fnqb6XDdeGhni5jMyZijASTqpLZb3gdblAMkZzEB8CaAQpbGvT4AKtBFnDm
         +m9g==
X-Gm-Message-State: AOAM533sSHTGUD8Wj5qKDH+Lr4RBczXCzI3nv/UMqeagm2XTnJKHebck
        ts6GyfUFW7NWk2BSSxVvKKm4Y39H41YzuxI8Nl8FEA==
X-Google-Smtp-Source: ABdhPJx6UGUfdeWodzKFL8AUOZe212yOefuiLcRZ8MxKzIdIKTheoFzCGHQ0qFdoiOS1V9jAVyyTpF5t5mzHbTEiGas=
X-Received: by 2002:aca:54d8:: with SMTP id i207mr10359071oib.101.1607715568446;
 Fri, 11 Dec 2020 11:39:28 -0800 (PST)
MIME-Version: 1.0
References: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com> <CADnq5_NZrqkouXCFKWc2wv483nc=x4cXXjFCqcEmkUYZpNeMUQ@mail.gmail.com>
In-Reply-To: <CADnq5_NZrqkouXCFKWc2wv483nc=x4cXXjFCqcEmkUYZpNeMUQ@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 11 Dec 2020 20:39:17 +0100
Message-ID: <CAKMK7uFjwmm9W3RFVdQ=EOqHvWeD5ZPA7zP86O_sxxBv3n4jjw@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] Xilinx AI engine kernel driver
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Wendy Liang <wendy.liang@xilinx.com>, tejas.patel@xilinx.com,
        ravi.patel@xilinx.com, rajan.vaja@xilinx.com,
        Arnd Bergmann <arnd@arndb.de>,
        devicetree <devicetree@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Rob Herring <robh+dt@kernel.org>, manish.narani@xilinx.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Christian Koenig <christian.koenig@amd.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all

On Fri, Dec 11, 2020 at 8:03 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Mon, Nov 30, 2020 at 3:25 AM Wendy Liang <wendy.liang@xilinx.com> wrote:
> >
> > AI engine is the acceleration engine provided by Xilinx. These engines
> > provide high compute density for vector-based algorithms, and flexible
> > custom compute and data movement. It has core tiles for compute and
> > shim tiles to interface the FPGA fabric.
> >
> > You can check the AI engine architecture document for more hardware details:
> > https://www.xilinx.com/support/documentation/architecture-manuals/am009-versal-ai-engine.pdf
> >
> > This patch series adds a Linux kernel driver to manage the Xilinx AI
> > engine array device and AI engine partitions (groups of AI engine tiles
> > dedicated to an application).
>
> Hi Wendy,
>
> I think it would be good to provide an overview of how your stack
> works in general.  That would give reviewers a better handle on how
> all of this fits together.  I'd suggest including an overview in the
> cover letter and also in the commit message and/or as a comment in the
> code in one of the patches.  I'm not really an expert when it comes to
> FPGAs, but this basically looks like a pretty low level interface to
> set up the data fabric for a kernel that will run on the soft logic or
> maybe the microcontroller on the board.  It doesn't have to be super
> detailed, just a nice flow for how you might use this.  E.g.,
>
> Userspace uses ioctls X, Y, Z to configure the data fabric for the
> FPGA kernel.  The kernels can run on... .  DMA access to system memory
> for data sets can be allocated using ioctl A.  DMA access is limited
> by... . The user can then load the FPGA kernel on to one of the
> engines using ioctl B and finally they can kick off the whole thing
> using ioctl C.  FPGA kernels are compiled using YYY toolchain and use
> use the following runtime (link to runtime) to configure the data
> fabric using ioctls X, Y, Z.

At least for drm drivers we ideally have that as a .rst file in
Documentation/. With that you can even do full svg graphs, or just dot
graphs, of the overall stack if you really want to go overboard :-)

> It would also be good to go over the security implications of the
> design.  E.g., can the FPGA kernel(s) access the DMA engine directly,
> or is it limited to just the DMA regions set up by the ioctls?  Also,
> does the hardware and software design allow for multiple users?  If
> so, how does that work?

I've also seen indications that there's some on-chip or on-card
memory. How that's planned to be used and whether we want to manage
this (maybe even with something like ttm) would be good to understand.

All excellent questions from Alex, just figured I add some more.

Cheers, Daniel

> Thanks,
>
> Alex
>
>
> >
> > v3:
> > * unlock AIE dev mutex after failed to gain the partition lock in
> >   errors handing
> > * replace pointer with __u64 and enum with __u32 in ioctl
> >
> > v2:
> > * Fix dtschema check errors
> > * Fix test bot warning on interrupt implementation. Removed set but
> >   unused  varaible.
> > * Fix compilation unused function warning of firmware change in case
> >   ZynqMP firmware is not configured
> > * There are other warning on ZynqMP firmware reported from testbot
> >   which is not introduced by this patch set.
> >   "[PATCH] firmware: xlnx-zynqmp: fix compilation warning" is submitted
> >   for those fixes.
> >
> >
> > Izhar Ameer Shaikh (1):
> >   firmware: xilinx: Add IOCTL support for AIE ISR Clear
> >
> > Nishad Saraf (2):
> >   misc: xilinx-ai-engine: Add support to request device management
> >     services
> >   misc: xilinx-ai-engine: Add support for servicing error interrupts
> >
> > Wendy Liang (6):
> >   dt-binding: soc: xilinx: ai-engine: Add AI engine binding
> >   misc: Add Xilinx AI engine device driver
> >   misc: xilinx-ai-engine: Implement AI engine cleanup sequence
> >   misc: xilinx-ai-engine: expose AI engine tile memories to userspace
> >   misc: xilinx-ai-engine: add setting shim dma bd operation
> >   misc: xilinx-ai-engine: add request and release tiles
> >
> >  .../bindings/soc/xilinx/xlnx,ai-engine.yaml        | 126 ++++
> >  MAINTAINERS                                        |   8 +
> >  drivers/firmware/xilinx/zynqmp.c                   |  14 +
> >  drivers/misc/Kconfig                               |  12 +
> >  drivers/misc/Makefile                              |   1 +
> >  drivers/misc/xilinx-ai-engine/Makefile             |  16 +
> >  drivers/misc/xilinx-ai-engine/ai-engine-aie.c      | 608 +++++++++++++++++++
> >  drivers/misc/xilinx-ai-engine/ai-engine-clock.c    | 245 ++++++++
> >  drivers/misc/xilinx-ai-engine/ai-engine-dev.c      | 496 ++++++++++++++++
> >  drivers/misc/xilinx-ai-engine/ai-engine-dma.c      | 481 +++++++++++++++
> >  drivers/misc/xilinx-ai-engine/ai-engine-internal.h | 519 ++++++++++++++++
> >  .../misc/xilinx-ai-engine/ai-engine-interrupt.c    | 659 +++++++++++++++++++++
> >  drivers/misc/xilinx-ai-engine/ai-engine-mem.c      | 275 +++++++++
> >  drivers/misc/xilinx-ai-engine/ai-engine-part.c     | 635 ++++++++++++++++++++
> >  drivers/misc/xilinx-ai-engine/ai-engine-res.c      | 219 +++++++
> >  drivers/misc/xilinx-ai-engine/ai-engine-reset.c    | 159 +++++
> >  include/linux/firmware/xlnx-zynqmp.h               |   8 +
> >  include/uapi/linux/xlnx-ai-engine.h                | 238 ++++++++
> >  18 files changed, 4719 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
> >  create mode 100644 drivers/misc/xilinx-ai-engine/Makefile
> >  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-aie.c
> >  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-clock.c
> >  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dev.c
> >  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dma.c
> >  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-internal.h
> >  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-interrupt.c
> >  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-mem.c
> >  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-part.c
> >  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-res.c
> >  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-reset.c
> >  create mode 100644 include/uapi/linux/xlnx-ai-engine.h
> >
> > --
> > 2.7.4
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
