Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B86E2BA398
	for <lists+linux-media@lfdr.de>; Sun, 22 Sep 2019 20:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388543AbfIVSJD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Sep 2019 14:09:03 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:37016 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387966AbfIVSJC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Sep 2019 14:09:02 -0400
Received: by mail-oi1-f182.google.com with SMTP id i16so5790112oie.4;
        Sun, 22 Sep 2019 11:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w1aly3xaiclnpeyBBRUqNQPFH6qbmtCKDeHxfQo/a/s=;
        b=Hy7HGYJ+81nCS/fKnOT6Q+VUpp/Jcv9sjxKgdKWW1kD3cJ1cID34fTsUKbGnqeAWJF
         zkfAxzbEH/LFdqfUJWgigJPe+JuefBmoMH/egCllTB6sXhLFob7s9lTS2JKRGSFlqo8X
         93WbUqlkBk6KHThASdV9MjySL2yeeTi3h4xv9qxMesoAhNgklv/RaEv2pD5BGKJygsQP
         MoDO0RULhKyCzMHHQObU7pyl25ZTdq05CZX56Pj1nBmqGw2jl77hrOQGTR+lb//ipIZ2
         oHfWXzFxceZNrR7LGjzHU4JSs6nmH9bXeHdvQmhzN3thbkaPJwrVJKOYzRRM9z5fPa0i
         atbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w1aly3xaiclnpeyBBRUqNQPFH6qbmtCKDeHxfQo/a/s=;
        b=ZESxVthRqo0HmnZ57NHpQBm3c2IOoGXkny5K4tWyPQzawyvwQKQip9a4QsZfANr5Uq
         Vn1Hty1o74k4hkpon+nGtMfksji6XxMcixdJx30bQa4UgD5BDDdPF+3l0x1yWhtXcdnr
         SIo459OELvrmfn8+8FYcw9yzOu/c0/zvxwgLy802PPJhrGtGBbPK4M9Rc1DnEsSl3+2H
         15IvGnOvBlAH4BroWJ1l0ug8FFSQkhJpl/HHu9M1sfKeTPr4Kyojz5/wJAcGNaj/T/HD
         KzgYquFSTGHnmGgGiSUjRfDbtWZasjSANGKyQ9q209H6eJ0tQVm/410J/KXvI4loRXH1
         gOOw==
X-Gm-Message-State: APjAAAVEZd252m2R9OmBQ9wgBk0WR4T5/OizNqQkL1/9lG2kWrcFhxUP
        SHslpwj4QRofOg2W0KOA+LOd92RVwUlT7u2FJ8g=
X-Google-Smtp-Source: APXvYqxqZm1+anm4ox/p1+ry2zm5txPlhbVid5aaGm0NBsE2Z4ezK78SOytBnDmRL1/xZpRgsY5mWCu8jCU4QLrEtCM=
X-Received: by 2002:aca:b2c4:: with SMTP id b187mr10933940oif.93.1569175741327;
 Sun, 22 Sep 2019 11:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190920170554.29666-1-bparrot@ti.com>
In-Reply-To: <20190920170554.29666-1-bparrot@ti.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sun, 22 Sep 2019 19:08:34 +0100
Message-ID: <CA+V-a8sUnhCaxr8EwBuY+-PBMtRcFWVx_33mtZcdqoRGEAwABQ@mail.gmail.com>
Subject: Re: [Patch v3 00/13] media: am437x-vpfe: overdue maintenance
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 20, 2019 at 6:03 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> This patch series is a collection of patches we have been carrying for a
> while.
>
> A few patches do fix actual bug and v4l2-compliance errors/warnings.
> Other are drivers re-work to simplify/clarify the code for easier
> maintenance.
>
> We also include the SPDX Licensing update which seemed to have been
> missed by the global script thus far.
>
> Changes since v2:
> - Rename VPFE_MAX_ACTIVE_FMT to VPFE_NUM_FORMATS and corrected the
>   comments
> - Move the "Remove print_fourcc helper" patch to the end of the series
>   and rebase it on the pending v4l2_fourcc_conv macros patches
>
> Changes since v1:
> - Address review comment from Joe, Hans and Prabhakar
> - Cleaned-up the function entry debug log
> - Split off the pcr change into its own patch
> - Rework/combine two patches but remove code churn
> - fix miscellaneous typos
>
> =============================
>
> v4l2-compliance SHA: 5b168dc8473911227890526bad26553d9e8ff81b, 32 bits
>
> Compliance test for vpfe device /dev/video0:
>
> Driver Info:
>         Driver name      : vpfe
>         Card type        : TI AM437x VPFE
>         Bus info         : platform:vpfe 48326000.vpfe
>         Driver version   : 5.3.0
>         Capabilities     : 0x85200001
>                 Vide o Capture
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
>                 D evice Capabilities
>         Device Caps      : 0x05200001
>                 Video Capt ure
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
>
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video0 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 1 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls (Input 0):
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 3 Private Controls: 0
>
> Format ioctls (Input 0):
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>                 fail: v4l2-test-formats.cpp(1419): node->frmsizes_count[pixfmt] > 1
>         test Cropping: FAIL
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
>
> Codec ioctls (Input 0):
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls (Input 0):
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>
> Test input 0:
>
> Streaming ioctls:
>         test read/write: OK
>         test blocking wait: OK
>         test MMAP (no poll): OK
>         test MMAP (select): OK
>         test MMAP (epoll): OK
>         test USERPTR (no poll): OK (Not Supported)
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
>
> Total for vpfe device /dev/video0: 51, Succeeded: 50, Failed: 1, Warnings: 0
> ============================
>
> Benoit Parrot (12):
>   media: am437x-vpfe: Fix missing first line
>   media: am437x-vpfe: Rework ISR routine for clarity
>   media: am437x-vpfe: Wait for end of frame before tear-down
>   media: am437x-vpfe: fix start streaming error path
>   media: am437x-vpfe: Streamlined vb2 buffer cleanup
>   media: am437x-vpfe: Setting STD to current value is not an error
>   media: am437x-vpfe: Use a per instance format array instead of a
>     static one
>   media: am437x-vpfe: fix function trace debug log
>   media: am437x-vpfe: TRY_FMT ioctl is not really trying anything
>   media: am437x-vpfe: Remove per bus width static data
>   media: am437x-vpfe: Switch to SPDX Licensing
>   media: am437x-vpfe: Remove print_fourcc helper
>
> Dave Gerlach (1):
>   media: am437x-vpfe: Fix suspend path to always handle pinctrl config
>
>  drivers/media/platform/am437x/am437x-vpfe.c   | 880 ++++++++----------
>  drivers/media/platform/am437x/am437x-vpfe.h   |  43 +-
>  .../media/platform/am437x/am437x-vpfe_regs.h  |  10 +-
>  3 files changed, 406 insertions(+), 527 deletions(-)
>

Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad
