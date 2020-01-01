Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3157F12DE87
	for <lists+linux-media@lfdr.de>; Wed,  1 Jan 2020 11:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbgAAKUX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jan 2020 05:20:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:33998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbgAAKUX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jan 2020 05:20:23 -0500
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B43C0206DB;
        Wed,  1 Jan 2020 10:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577874022;
        bh=loySFV+1No4UURYPX1PiQoRkdoL7jCSrVNRiVe2Ay7U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vJKdmpVoVliMKfQ9/EqIQ6l/bJQxbUA3PLLf5DtkC9ivcovKamHhsc1U7woqUmCoF
         6u8zwmMsqKc0DuVH2MM9Kym/cp2Q/qIQpfymya7DB/eRULV4L25FoEjnM3//bKJ4yo
         BNmlXlnCS7y6UfJme+vnPCfakKerHguIjSJOQrFg=
Received: by mail-wr1-f44.google.com with SMTP id q10so36747687wrm.11;
        Wed, 01 Jan 2020 02:20:21 -0800 (PST)
X-Gm-Message-State: APjAAAXf9Q2OfIpL2rdhQuEMvyjSuH68HI6CtzpTkB1P246yGyDbXSeY
        pWZLeN2NVz9gD0j7ymMrNxiJqnL4UkflMXasbPQ=
X-Google-Smtp-Source: APXvYqzh5wHLqjlcU5A/ZD5QRw8rK2s/y+6ksfYFN5O7FNyf1M1xi1TNzp8b9mNSXqfr3PwCJlbHmm4GVvyZb8/RaXA=
X-Received: by 2002:a05:6000:11c6:: with SMTP id i6mr78369163wrx.178.1577874020171;
 Wed, 01 Jan 2020 02:20:20 -0800 (PST)
MIME-Version: 1.0
References: <20191215165924.28314-1-wens@kernel.org>
In-Reply-To: <20191215165924.28314-1-wens@kernel.org>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Wed, 1 Jan 2020 18:20:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v645ZGy4M80bDNnuwg7LybqyOTkZTzwvzVbb3HrF9A687w@mail.gmail.com>
Message-ID: <CAGb2v645ZGy4M80bDNnuwg7LybqyOTkZTzwvzVbb3HrF9A687w@mail.gmail.com>
Subject: Re: [PATCH 00/14] media: sun4i-csi: A10/A20 CSI1 and R40 CSI0 support
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,


On Mon, Dec 16, 2019 at 12:59 AM Chen-Yu Tsai <wens@kernel.org> wrote:
>
> From: Chen-Yu Tsai <wens@csie.org>
>
> Hi everyone,
>
> This series adds basic support for CSI1 on Allwinner A10/A20 and CSI0 on
> Allwinner R40. The CSI1 block has the same structure and layout as the
> CSI0 block. Differences include:
>
>   - Only one channel in BT.656 instead of four in CSI0
>   - 10-bit raw data input vs 8-bit in CSI0
>   - 24-bit RGB888/YUV444 input vs 16-bit RGB565/YUV422 in CSI0
>   - No ISP hardware (CSI SCLK not needed)
>
> The CSI0 block in the Allwinner R40 SoC looks to be the same as the one
> in the A20. The register maps line up, and they support the same
> features. The R40 appears to support BT.1120 based on the feature
> overview, but it is not mentioned anywhere else. Also like the A20, the
> ISP is not mentioned, but the CSI special clock needs to be enabled for
> the hardware to function. The manual does state that the CSI special
> clock is the TOP clock for all CSI hardware, but currently no hardware
> exists for us to test if CSI1 also depends on it or not.
>
> Included are a couple of fixes for signal polarity and DRAM offset
> handling.
>
> Patches 1 and 2 add compatible strings for the newly supported hardware.
>
> Patches 3 and 4 fix the polarity setting of [HV]sync and data sampling.
> Allwinner hardware uses [HV]ref semantics instead of [HV]sync.
>
> Patch 5 deals with the DRAM offset when the CSI hardware does DMA. The
> hardware does DMA directly to the memory bus, thus requiring the address
> to not be offset like when DMA is done over the system bus.
>
> Patch 6 add support for the CSI1 hardware block. For now this simply
> means not requiring the ISP clock.
>
> Patches 7 and 8 add CSI1 to A10 (sun4i) and A20 (sun7i) dtsi files.
>
> Patch 9 adds I2C pixmuxing options for the R40. Used in the last example
> patch.
>
> Patch 10 adds a compatible string for the R40's MBUS (memory bus).
>
> Patch 11 adds CSI0 to the R40 dtsi file
>
> Patches 12 through 14 are examples of cameras hooked up to boards.
>
> Please have a look. The MBUS compatible patch is likely to conflict
> with a DT binding conversion patch Maxime sent out.
>
> Also, I sent out an email asking about the polarity settings for
> [HV]sync, how to signal the use of [HV]ref instead, and how to pass
> timings from the camera to the capture interface. So far I haven't
> heard back. In particular I think the OV7670 driver has inverted
> polarity settings for HSYNC. Not sure about VSYNC.
>
>
> Regards
> ChenYu
>
>
> Chen-Yu Tsai (14):
>   dt-bindings: media: sun4i-csi: Add compatible for CSI1 on A10/A20
>   dt-bindings: media: sun4i-csi: Add compatible for CSI0 on R40
>   media: sun4i-csi: Fix data sampling polarity handling
>   media: sun4i-csi: Fix [HV]sync polarity handling
>   media: sun4i-csi: Deal with DRAM offset
>   media: sun4i-csi: Add support for A10 CSI1 camera sensor interface

Any news on these 6 patches? I believe they have the required acks.

We (sunxi maintainers) will take the remain patches once these are in.

ChenYu

>   ARM: dts: sun4i: Add CSI1 controller and pinmux options
>   ARM: dts: sun7i: Add CSI1 controller and pinmux options
>   ARM: dts: sun8i: r40: Add I2C pinmux options
>   dt-bindings: bus: sunxi: Add R40 MBUS compatible
>   ARM: dts: sun8i: r40: Add device node for CSI0
>   [DO NOT MERGE] ARM: dts: sun4i: cubieboard: Enable OV7670 camera on
>     CSI1
>   [DO NOT MERGE] ARM: dts: sun7i: cubieboard2: Enable OV7670 camera on
>     CSI1
>   [DO NOT MERGE] ARM: dts: sun8i-r40: bananapi-m2-ultra: Enable OV5640
>     camera
>
>  .../bindings/arm/sunxi/sunxi-mbus.txt         |  1 +
>  .../media/allwinner,sun4i-a10-csi.yaml        | 14 +++-
>  arch/arm/boot/dts/sun4i-a10-cubieboard.dts    | 42 ++++++++++++
>  arch/arm/boot/dts/sun4i-a10.dtsi              | 35 ++++++++++
>  arch/arm/boot/dts/sun7i-a20-cubieboard2.dts   | 42 ++++++++++++
>  arch/arm/boot/dts/sun7i-a20.dtsi              | 36 ++++++++++
>  .../boot/dts/sun8i-r40-bananapi-m2-ultra.dts  | 67 +++++++++++++++++++
>  arch/arm/boot/dts/sun8i-r40.dtsi              | 64 ++++++++++++++++++
>  .../platform/sunxi/sun4i-csi/sun4i_csi.c      | 57 ++++++++++++++--
>  .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  6 +-
>  .../platform/sunxi/sun4i-csi/sun4i_dma.c      | 20 ++++--
>  11 files changed, 370 insertions(+), 14 deletions(-)
>
> --
> 2.24.0
>
