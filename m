Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA67D2DAA6F
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 10:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbgLOJuN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 04:50:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728522AbgLOJt5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 04:49:57 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E66C0617A7
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 01:49:10 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id a6so16272079wmc.2
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 01:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+bLScCOCNZQdgDM6p7C9MBE40XK/lq18vroRL1z4urY=;
        b=KyRMMUQmBtPcq4c3/MC/uHDb80xB1/HQiJFsbk1YAZ65xFxMfPQr55VtQUX/y9lRMi
         HdvuMMDj21aBlYg7/yHg5MZ6O5UuocG26YAguO8LnHVa/8ujnSrHTH7iVgtafPJiWy4X
         TyneHYCzt1c0WGPBANJzUaeR/ZYq+XtQ4jCx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=+bLScCOCNZQdgDM6p7C9MBE40XK/lq18vroRL1z4urY=;
        b=apfmvctD+g3OB5ANiS79QOi3RXNe/9sgIx8E//XSSWdGHpB7TxUbt+9weAVdCaKbF8
         TbN0CJYiiXJjjUGuCVqPk/Vq1nEwZvJo6gVKaX6UtOlOkiLVZxSAYAzKNiwQdZbtH1+A
         7FS7UM3FwgZB8+xELlHXWIiNSejg3z1WbXFyX6zFoAvZbHMUZjgadq6xtOU+hnC+qzUO
         irMf+IsH8lUpWumiO+ujiwIwqYfLtssoWX1kSuMd+XLgmkXnwBRPOq07iVgyi4IH3nZ6
         souDlS7CrK626PjaSw/Gp5y1JaDSVAqufx9cOhh41o37PcznbccaOTNWyPh9kwUcDGLp
         85Vw==
X-Gm-Message-State: AOAM531PJRG/5RSeXMUqTYDhVJOPGJrFHz+pvlJu5mbR5/WJ9YBUQaAK
        oRmTicHGV8tMB5Np9CIq9+bbeg==
X-Google-Smtp-Source: ABdhPJz/V2fVbYttE2c+SKppjnnX6Lps98PrevHuWGbBCzD/MFwm4B9sRnrp2egyl55dAyEg27IKzQ==
X-Received: by 2002:a7b:cbcc:: with SMTP id n12mr11312405wmi.23.1608025749468;
        Tue, 15 Dec 2020 01:49:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z22sm33831887wml.1.2020.12.15.01.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 01:49:08 -0800 (PST)
Date:   Tue, 15 Dec 2020 10:49:02 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jiaying Liang <wendy.liang@xilinx.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexdeucher@gmail.com>, tejas.patel@xilinx.com,
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
Subject: Re: [PATCH v3 0/9] Xilinx AI engine kernel driver
Message-ID: <X9iEAdStN7lqvZpY@phenom.ffwll.local>
Mail-Followup-To: Jiaying Liang <wendy.liang@xilinx.com>,
        Alex Deucher <alexdeucher@gmail.com>, tejas.patel@xilinx.com,
        ravi.patel@xilinx.com, rajan.vaja@xilinx.com,
        Arnd Bergmann <arnd@arndb.de>,
        devicetree <devicetree@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Rob Herring <robh+dt@kernel.org>, manish.narani@xilinx.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Christian Koenig <christian.koenig@amd.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>
References: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
 <CADnq5_NZrqkouXCFKWc2wv483nc=x4cXXjFCqcEmkUYZpNeMUQ@mail.gmail.com>
 <CAKMK7uFjwmm9W3RFVdQ=EOqHvWeD5ZPA7zP86O_sxxBv3n4jjw@mail.gmail.com>
 <b0d41bb6-0347-24f5-7a2d-a3b41d5444c9@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0d41bb6-0347-24f5-7a2d-a3b41d5444c9@xilinx.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 14, 2020 at 04:24:17PM -0800, Jiaying Liang wrote:
> 
> On 12/11/20 11:39 AM, Daniel Vetter wrote:
> > Hi all
> > 
> > On Fri, Dec 11, 2020 at 8:03 PM Alex Deucher<alexdeucher@gmail.com>  wrote:
> > > On Mon, Nov 30, 2020 at 3:25 AM Wendy Liang<wendy.liang@xilinx.com>  wrote:
> > > > AI engine is the acceleration engine provided by Xilinx. These engines
> > > > provide high compute density for vector-based algorithms, and flexible
> > > > custom compute and data movement. It has core tiles for compute and
> > > > shim tiles to interface the FPGA fabric.
> > > > 
> > > > You can check the AI engine architecture document for more hardware details:
> > > > https://www.xilinx.com/support/documentation/architecture-manuals/am009-versal-ai-engine.pdf
> > > > 
> > > > This patch series adds a Linux kernel driver to manage the Xilinx AI
> > > > engine array device and AI engine partitions (groups of AI engine tiles
> > > > dedicated to an application).
> > > Hi Wendy,
> > > 
> > > I think it would be good to provide an overview of how your stack
> > > works in general.  That would give reviewers a better handle on how
> > > all of this fits together.  I'd suggest including an overview in the
> > > cover letter and also in the commit message and/or as a comment in the
> > > code in one of the patches.  I'm not really an expert when it comes to
> > > FPGAs, but this basically looks like a pretty low level interface to
> > > set up the data fabric for a kernel that will run on the soft logic or
> > > maybe the microcontroller on the board.  It doesn't have to be super
> > > detailed, just a nice flow for how you might use this.  E.g.,
> > > 
> > > Userspace uses ioctls X, Y, Z to configure the data fabric for the
> > > FPGA kernel.  The kernels can run on... .  DMA access to system memory
> > > for data sets can be allocated using ioctl A.  DMA access is limited
> > > by... . The user can then load the FPGA kernel on to one of the
> > > engines using ioctl B and finally they can kick off the whole thing
> > > using ioctl C.  FPGA kernels are compiled using YYY toolchain and use
> > > use the following runtime (link to runtime) to configure the data
> > > fabric using ioctls X, Y, Z.
> > At least for drm drivers we ideally have that as a .rst file in
> > Documentation/. With that you can even do full svg graphs, or just dot
> > graphs, of the overall stack if you really want to go overboard :-)
> > 
> > > It would also be good to go over the security implications of the
> > > design.  E.g., can the FPGA kernel(s) access the DMA engine directly,
> > > or is it limited to just the DMA regions set up by the ioctls?  Also,
> > > does the hardware and software design allow for multiple users?  If
> > > so, how does that work?
> > I've also seen indications that there's some on-chip or on-card
> > memory. How that's planned to be used and whether we want to manage
> > this (maybe even with something like ttm) would be good to understand.
> > 
> > All excellent questions from Alex, just figured I add some more.
> > 
> > Cheers, Daniel
> 
> Hi Alex, Daniel,
> 
> Below is an overview of the driver.
> 
> AI engine kernel driver manages Xilinx AI engine device. An AI engine device
> contains cores tiles and SHIM tiles. Core tiles are the computation tiles
> , the SHIM tiles are the tiles interfacing to external components.
> 
>           +--------+--------+--------+--------+
>            | Core        | Core        | Core        | Core | ...
>            |                |                | |                |
>           +-----------------------------------+
>            | Core        | Core        | Core        | Core     | ...
>            |                |                | |             |
>           +--------+--------+--------+---------
>            ...
>           +--------+--------+-----------------+
>           | SHIM        | SHIM       | SHIM       |SHIM        |
>           | PL            | PL           | PL            |PL | NOC  |
>           +---+----+---+----+---+-----+-------+
>   AXI Streams   |        |                |              |    |AXI MM
>                        |        |                | |    |
> Events Singals |        |                |              |    |
>                        |        |                | |    |
>                        |        |                | |    |
>           +---+--------+--------+-----+ +--+------+
>           |       FPGA                                        | |  
> NOC        |
>           | | |                  |
>           +---------------------------+ +--+-------+
>                                            |
>                                            |
>                                        +---+------+
>                                        |   DDR           |
>                                        +----------+
> 

Your diagram here didn't survive email unfortunately :-/

Quick question: Where's the fpga driver for this chip? I'm assuming it's
something separate.

> Each Core tile contains computing module, local memory and DMA module. The
> local memory DMA module takes data from or to the AXI streams and writes
> it to or reads it from the local memory. The computing module can also
> directly get/put data from/to the AXI stream. The AIE SHIM enables AIE tiles
> to get/put data from/to AXI streams from FPGA, enables external master to
> access AI engine address space through AXI MM. SHIM NoC module has DMA
> engine,
> which can access extern memory though AXI MM and push it to internal AXI
> streams.
> 
> At runtime, the AI engine tiles interconnection needs to be configured so
> that
> it can get fetch data from external components or adjacent tiles, and AI
> engine
> core program needs to be loaded. And then user application can push data to
> the
> AI engine array and start/stop AI engine core. AI engine device errors can
> be
> raised as events, the AI engine kernel driver listens to the events
> interrupt
> to monitor runtime async device errors.
> 
> Instead of application directly interacting with the AI engine kernel APIs,
> user
> application/libraries interacts with AI engine userspace library:
> https://github.com/Xilinx/embeddedsw/tree/master/XilinxProcessorIPLib/drivers/aienginev2
> It provides cross OSes low level functional abstraction such as how to
> connect one
> stream port to another stream port, how to configure core tile local DMA.
> 
> The AI engine library can be used by other runtime libraries such as Xilinx
> runtime (XRT)
> library: https://xilinx.github.io/XRT/master/html/index.html,
> which provides acceleration abstraction for Xilinx accelerators, it has
> extensions
> to interface to other acceleration framework such as OpenCL.
> XRT provides buffer handling abstractions for user application to share data
> between
> applicaiton and devices.
> 
> Here is an example of application runtime stack:
> 
>             +----------------------------+
>             |      Application                              |
>             | |
>             +----------------------------+
>             |       XRT                                        |
>             | |
>             +----------------------------+
>             |      AIE Library                               |
>             | |
>            +----------------------------+
>     +----------------------------------------+
> Kern    +----------------------------+
>             |         AIE Partition                        +--+
>            +----------------------------+    |
>                   |----------------------------+
>             +----------------------------+
>              |         AIE Device                           |
>              | |
>             +----------------------------+
> 
> 
> 
> The AI engine kernel driver provides the following user interfaces:
>  * AIE device driver is the root device driver to manage the partitions of
>    of the AI engine device array. AI engine array can be partitioned into
>    column wised isolated partitions. Each applicaiton can only access its
>    own partitions.
>  * AIE device driver monitors the interrupt from the AI enigne device. All
>    AI engine tiles shared the same interrupt for error events.
>  * AIE partition driver controls address mapping and access of the
>    registers/local memories of the tiles within a partition.
>    * It provides mmap operation to enable application to direclty access the
>      tiles local memories for small data update such as parameter update for
>      performance.
>    * It provides mmap operatio to map all the registers as readonly for
>      application to poll registers efficiently to check status.
>    * It provides ioctl for userspace to pass I/O commands to write/mask
> write
>      the registers. How to configure is defined by userspace. Userspace will
>      pass the I/O commands sequence to the kernel driver, and kernel driver
>      will validate the commands before it writes to the registers.
>    * It provides ioctl to import dmabuf and ioctl to configure the the DMA
> module
>      in the SHIM tile which can access memory outside AI engine array.

This sounds a bit like there's no model for running multiple userspace,
aside from hard-partitioning the chip? Could we suspend/resume clients by
saving/restoring that entire mmio range that they set up?

> The buffer management is out of this driver. In the above example, user
> application
> uses Xilinx runtime(XRT), XRT is the one to manage the buffers.

Somehow you're getting data in/out of these compute tiles, and from your
description it sounds like that's done through special AXI streams that
connect to this NOC thing?

So someone needs to manage that memory, and on the kernel side you
probably need something which can do the dma_map_sg for said memory. So
which kernel driver does that?

In the past there was a drm driver submission for iirc a xilinx fpga, but
we can't take that one because only the runtime, not the compiler are open
source. Is that the part which provides memory management (together with
the userspace runtime)?
-Daniel

> 
> 
> Best Regards,
> 
> Wendy
> 
> > 
> > > Thanks,
> > > 
> > > Alex
> > > 
> > > 
> > > > v3:
> > > > * unlock AIE dev mutex after failed to gain the partition lock in
> > > >    errors handing
> > > > * replace pointer with __u64 and enum with __u32 in ioctl
> > > > 
> > > > v2:
> > > > * Fix dtschema check errors
> > > > * Fix test bot warning on interrupt implementation. Removed set but
> > > >    unused  varaible.
> > > > * Fix compilation unused function warning of firmware change in case
> > > >    ZynqMP firmware is not configured
> > > > * There are other warning on ZynqMP firmware reported from testbot
> > > >    which is not introduced by this patch set.
> > > >    "[PATCH] firmware: xlnx-zynqmp: fix compilation warning" is submitted
> > > >    for those fixes.
> > > > 
> > > > 
> > > > Izhar Ameer Shaikh (1):
> > > >    firmware: xilinx: Add IOCTL support for AIE ISR Clear
> > > > 
> > > > Nishad Saraf (2):
> > > >    misc: xilinx-ai-engine: Add support to request device management
> > > >      services
> > > >    misc: xilinx-ai-engine: Add support for servicing error interrupts
> > > > 
> > > > Wendy Liang (6):
> > > >    dt-binding: soc: xilinx: ai-engine: Add AI engine binding
> > > >    misc: Add Xilinx AI engine device driver
> > > >    misc: xilinx-ai-engine: Implement AI engine cleanup sequence
> > > >    misc: xilinx-ai-engine: expose AI engine tile memories to userspace
> > > >    misc: xilinx-ai-engine: add setting shim dma bd operation
> > > >    misc: xilinx-ai-engine: add request and release tiles
> > > > 
> > > >   .../bindings/soc/xilinx/xlnx,ai-engine.yaml        | 126 ++++
> > > >   MAINTAINERS                                        |   8 +
> > > >   drivers/firmware/xilinx/zynqmp.c                   |  14 +
> > > >   drivers/misc/Kconfig                               |  12 +
> > > >   drivers/misc/Makefile                              |   1 +
> > > >   drivers/misc/xilinx-ai-engine/Makefile             |  16 +
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-aie.c      | 608 +++++++++++++++++++
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-clock.c    | 245 ++++++++
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-dev.c      | 496 ++++++++++++++++
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-dma.c      | 481 +++++++++++++++
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-internal.h | 519 ++++++++++++++++
> > > >   .../misc/xilinx-ai-engine/ai-engine-interrupt.c    | 659 +++++++++++++++++++++
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-mem.c      | 275 +++++++++
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-part.c     | 635 ++++++++++++++++++++
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-res.c      | 219 +++++++
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-reset.c    | 159 +++++
> > > >   include/linux/firmware/xlnx-zynqmp.h               |   8 +
> > > >   include/uapi/linux/xlnx-ai-engine.h                | 238 ++++++++
> > > >   18 files changed, 4719 insertions(+)
> > > >   create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/Makefile
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-aie.c
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-clock.c
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dev.c
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dma.c
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-internal.h
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-interrupt.c
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-mem.c
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-part.c
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-res.c
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-reset.c
> > > >   create mode 100644 include/uapi/linux/xlnx-ai-engine.h
> > > > 
> > > > --
> > > > 2.7.4
> > > > 
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
