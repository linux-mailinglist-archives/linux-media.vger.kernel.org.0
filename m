Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 965482D7F08
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 20:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391442AbgLKTEm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 14:04:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388276AbgLKTEM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 14:04:12 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AAC4C0613CF;
        Fri, 11 Dec 2020 11:03:31 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id 11so9172499oty.9;
        Fri, 11 Dec 2020 11:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hMSZzneyru50Jjj6PQ349xugCKpWN0AAxELTHUziJRQ=;
        b=e/3x12FgAZ2f6zDCJbdCrGnFjHRooeKYCO5Lj/7CTcVjWow3xKvntvdwjioO+bb+xv
         g9XYxsfeTtpYsapnCuBfdjL2E7koXIYCOQOsbIuV3cbxA5qZrgNegyd1sQl7PlF71lpj
         SFLfykKC+SoOxkdRyDY7aF09ldBEKqHcYwdaaZN/Qcyj12PINOF+3yuVZYoKeeZ54fy/
         3fTDlCXaVPH9rCNy5P18xqTAaZOozDv4Yk4IMDxOPcCy2rO6nfE39MwRX2kK6p3LjL3t
         LRLTN/3+N+n4QK9WKV/LJU1MPOpLFRJ+wJf8Jc1szsU7TJNgp40ePZvE4VvKa2audbFK
         vrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hMSZzneyru50Jjj6PQ349xugCKpWN0AAxELTHUziJRQ=;
        b=oUAKR0OVthQkUvoraci8QSvVSVT/3xMiO34GEZxM8GGtwe+nky9xpFrdlUh9PieMQU
         YHjuPpY6e1rTHYkfrOj1xEmds8BlpCBaRnQgzk28EfzGHkdhCCgFC6D4dvS8loXebgm4
         VGIQkf/q2X4hH9vW7joGdDLULr205kYjD35TftcnsMQp0DUQvy0HxGDoyx0xOANIGEiR
         w63rNCd2kL9BjkaVlALok1eTU4uS3mw8Flg23Wi5TuTV7cpRcnl+aqjhiwvJoCyAEHbk
         acVIRibMfzN9hTFmoCJztIuotvDnQpSkXoArUy2T2sKc9jZRuxCmWsfXqXAxxIIvWZVP
         D8Cg==
X-Gm-Message-State: AOAM530wzNl2XzRZ0heFQCI5xADn3UrCHT4SlpawoR+JtRl4LMlWs6uO
        57z+U9V1KajEQmfE0I3QaNpYo/q3nzpUlStX1vY=
X-Google-Smtp-Source: ABdhPJy2mrdQLQnweRVWCZf1CH2ySoGSW/W3cTUdlzTnUQYgB4HAULPfBkRMIXrFL6f67AOxSFdhFpOO4seosF1t2Js=
X-Received: by 2002:a9d:4ce:: with SMTP id 72mr10975948otm.23.1607713410935;
 Fri, 11 Dec 2020 11:03:30 -0800 (PST)
MIME-Version: 1.0
References: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
In-Reply-To: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 11 Dec 2020 14:03:19 -0500
Message-ID: <CADnq5_NZrqkouXCFKWc2wv483nc=x4cXXjFCqcEmkUYZpNeMUQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] Xilinx AI engine kernel driver
To:     Wendy Liang <wendy.liang@xilinx.com>
Cc:     Rob Herring <robh+dt@kernel.org>, michal.simek@xilinx.com,
        Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        derek.kiernan@xilinx.com, dragan.cvetic@xilinx.com,
        rajan.vaja@xilinx.com, tejas.patel@xilinx.com,
        manish.narani@xilinx.com, ravi.patel@xilinx.com,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 30, 2020 at 3:25 AM Wendy Liang <wendy.liang@xilinx.com> wrote:
>
> AI engine is the acceleration engine provided by Xilinx. These engines
> provide high compute density for vector-based algorithms, and flexible
> custom compute and data movement. It has core tiles for compute and
> shim tiles to interface the FPGA fabric.
>
> You can check the AI engine architecture document for more hardware details:
> https://www.xilinx.com/support/documentation/architecture-manuals/am009-versal-ai-engine.pdf
>
> This patch series adds a Linux kernel driver to manage the Xilinx AI
> engine array device and AI engine partitions (groups of AI engine tiles
> dedicated to an application).

Hi Wendy,

I think it would be good to provide an overview of how your stack
works in general.  That would give reviewers a better handle on how
all of this fits together.  I'd suggest including an overview in the
cover letter and also in the commit message and/or as a comment in the
code in one of the patches.  I'm not really an expert when it comes to
FPGAs, but this basically looks like a pretty low level interface to
set up the data fabric for a kernel that will run on the soft logic or
maybe the microcontroller on the board.  It doesn't have to be super
detailed, just a nice flow for how you might use this.  E.g.,

Userspace uses ioctls X, Y, Z to configure the data fabric for the
FPGA kernel.  The kernels can run on... .  DMA access to system memory
for data sets can be allocated using ioctl A.  DMA access is limited
by... . The user can then load the FPGA kernel on to one of the
engines using ioctl B and finally they can kick off the whole thing
using ioctl C.  FPGA kernels are compiled using YYY toolchain and use
use the following runtime (link to runtime) to configure the data
fabric using ioctls X, Y, Z.

It would also be good to go over the security implications of the
design.  E.g., can the FPGA kernel(s) access the DMA engine directly,
or is it limited to just the DMA regions set up by the ioctls?  Also,
does the hardware and software design allow for multiple users?  If
so, how does that work?

Thanks,

Alex


>
> v3:
> * unlock AIE dev mutex after failed to gain the partition lock in
>   errors handing
> * replace pointer with __u64 and enum with __u32 in ioctl
>
> v2:
> * Fix dtschema check errors
> * Fix test bot warning on interrupt implementation. Removed set but
>   unused  varaible.
> * Fix compilation unused function warning of firmware change in case
>   ZynqMP firmware is not configured
> * There are other warning on ZynqMP firmware reported from testbot
>   which is not introduced by this patch set.
>   "[PATCH] firmware: xlnx-zynqmp: fix compilation warning" is submitted
>   for those fixes.
>
>
> Izhar Ameer Shaikh (1):
>   firmware: xilinx: Add IOCTL support for AIE ISR Clear
>
> Nishad Saraf (2):
>   misc: xilinx-ai-engine: Add support to request device management
>     services
>   misc: xilinx-ai-engine: Add support for servicing error interrupts
>
> Wendy Liang (6):
>   dt-binding: soc: xilinx: ai-engine: Add AI engine binding
>   misc: Add Xilinx AI engine device driver
>   misc: xilinx-ai-engine: Implement AI engine cleanup sequence
>   misc: xilinx-ai-engine: expose AI engine tile memories to userspace
>   misc: xilinx-ai-engine: add setting shim dma bd operation
>   misc: xilinx-ai-engine: add request and release tiles
>
>  .../bindings/soc/xilinx/xlnx,ai-engine.yaml        | 126 ++++
>  MAINTAINERS                                        |   8 +
>  drivers/firmware/xilinx/zynqmp.c                   |  14 +
>  drivers/misc/Kconfig                               |  12 +
>  drivers/misc/Makefile                              |   1 +
>  drivers/misc/xilinx-ai-engine/Makefile             |  16 +
>  drivers/misc/xilinx-ai-engine/ai-engine-aie.c      | 608 +++++++++++++++++++
>  drivers/misc/xilinx-ai-engine/ai-engine-clock.c    | 245 ++++++++
>  drivers/misc/xilinx-ai-engine/ai-engine-dev.c      | 496 ++++++++++++++++
>  drivers/misc/xilinx-ai-engine/ai-engine-dma.c      | 481 +++++++++++++++
>  drivers/misc/xilinx-ai-engine/ai-engine-internal.h | 519 ++++++++++++++++
>  .../misc/xilinx-ai-engine/ai-engine-interrupt.c    | 659 +++++++++++++++++++++
>  drivers/misc/xilinx-ai-engine/ai-engine-mem.c      | 275 +++++++++
>  drivers/misc/xilinx-ai-engine/ai-engine-part.c     | 635 ++++++++++++++++++++
>  drivers/misc/xilinx-ai-engine/ai-engine-res.c      | 219 +++++++
>  drivers/misc/xilinx-ai-engine/ai-engine-reset.c    | 159 +++++
>  include/linux/firmware/xlnx-zynqmp.h               |   8 +
>  include/uapi/linux/xlnx-ai-engine.h                | 238 ++++++++
>  18 files changed, 4719 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>  create mode 100644 drivers/misc/xilinx-ai-engine/Makefile
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-aie.c
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-clock.c
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dev.c
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dma.c
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-internal.h
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-interrupt.c
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-mem.c
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-part.c
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-res.c
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-reset.c
>  create mode 100644 include/uapi/linux/xlnx-ai-engine.h
>
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
