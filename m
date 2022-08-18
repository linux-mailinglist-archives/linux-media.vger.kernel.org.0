Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11AA65981AA
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 12:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244125AbiHRKvj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 06:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243983AbiHRKvh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 06:51:37 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5403D8606A
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 03:51:36 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id B4A51C0007;
        Thu, 18 Aug 2022 10:51:33 +0000 (UTC)
Date:   Thu, 18 Aug 2022 12:51:31 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: Re: imx8m-mini csi-2 limitations
Message-ID: <20220818105131.gurtn74av2ilr7bi@uno.localdomain>
References: <YvpPusE1rOzmgPYN@carbon.k.g>
 <Yv4GEUTj4rMiagAX@p310.k.g>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yv4GEUTj4rMiagAX@p310.k.g>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petko

On Thu, Aug 18, 2022 at 12:27:45PM +0300, Petko Manolov wrote:
> 	Hello again,
>
> After digging down NXP's documentation and reading some comments within kernel
> drivers (sorry Jacopo, you've left some nice comments in imx7-media-csi.c, hence
> you're spammed now :) i came to the conclusion that mipi-csi to csi-bridge data

No worries.

I tried re-reading all the discussions, but memory still fails me
here.

I recall I had an issue with the CSIS bandwidth and somewhere I
suggested that it might be due to the CSI-2 specification version that
the peripheral implemented. I can't find that email anymore though :/

> path can only be 8bits in raw12 format.  The only exception is YUV422 format,
> which get BIT_MIPI_DOUBLE_CMPNT flag set.
>

Yes, there has been quite some discussions about how to mix-and-match
the settings between the CSIS (mipi-csi) and the CSI (csi-bridge) [*]

If I recall correctly there are at least three configurations at play:

- The CSIS pixel mode selection

  MIPI_CSI_ISP_CONFIG[13:12]

  The driver currently forces dual pixel sampling mode for YUV422
  and report a TODO:

  * TODO: Verify which other formats require DUAL (or QUAD) modes.

  Here you're trying to transfer RAW12 data, which is indicated in the
  register documentation as one of the formats suitable for DUAL/QUAD
  mode transfer

  - I'm actually not sure how and if RAW12 gets expanded to 16 bit
    samples by filling the 16-bit word with 0s or it either gets
    packed in 6 bytes with no paddings. Figure "13-33. Pixel
    alignment" seems to suggest that, but I'm not sure I really got
    that diagram

- The CSI-bridge

  - CSI_CR3[3] SENSOR_16BITS
  - CSI_CR18[20] MIPI_DOUBLE_CMP

  The comment in imx7_csi_configure() explains how different versions
  of YUYV (2X8 and 1X16) are handled, and why SENSOR_16BITS and
  MIPI_DOUBLE_CMP have to be enabled when the csi-bridge has to be instructed
  to sample 16 bits samples from the RX queue.

I guess the key would be here to find out what combination of
SINGLE/DUAL/QUAD sampling is opportune for RAW12 (I would try with
DUAL first and then QUAD) and then configure the csi-bridge bus
sampling mode accordingly (likely in the same was as it is done for
YUYV_1X16)

When it comes to bandwidth limitation, can you try to reduce the
sensor output size to make sure you chase one issue at the time ?

[*] Is "CSI" the most abused acronym of history ?

> So i guess there are two questions:
>
> 	a) can the csi-bridge (and mipi-csi) be persuaded to do two-bytes for
> 	raw12 format;

See above :)

> 	b) what's the maximum frequency for csi-bridge PIXCLK?
>

Not sure about this one.

I've anyway cc-ed Laurent and Xavier, which can surely be helpful here

Thanks
   j

> I've increased PIXCLK up to 1ghz (as opposed to the default 500mhz) and this seem
> to hung the bridge.
>
>
> cheers,
> Petko
>
>
> On 22-08-15 16:52:59, Petko Manolov wrote:
> > 	Hello guys,
> >
> > I'm developing a driver for Sony imx492 sensor and i'm using imx8m-mini
> > (Variscite SoM on Symphony carrier board) platform.  Thanks to Laurent i dumped
> > the vendor mipi-csi and csi-bridge drivers in favor of mainline (v5.19-rc6 atm)
> > and parts started to click in place.  However, there are still a few rough
> > edges.
> >
> > The sensor is 47mpix, and is only capable of streaming over all four CSI-2
> > lanes.  Each lane is 1.728gbit, which makes 6.912gbps total bandwidth.
> > imx8m-mini's d-phy can handle (on paper) up to 6gbps.
> >
> > I guess the main question here is: what's the fastest transfer rate that's known
> > to work with this SoC?  Does anyone have experience with imx8m-mini in this
> > regard?
> >
> >
> > Even with the settings that i'm able to obtain a (distorted) test pattern image
> > with, i keep getting tons of:
> >
> > [99910.847591] imx-mipi-csis 32e30000.mipi-csi: FIFO Overflow Error events: 1353347
> >
> > IRQs also look a suspicious on the 'csi' part:
> >
> > 214:    2653716          0          0          0     GICv3  49 Level     32e30000.mipi-csi
> > 215:          2          0          0          0     GICv3  48 Level     csi
> >
> > That's with this clock setup:
> >
> >  sys_pll2                             1        1        0  1000000000          0     0  50000         Y
> >     sys_pll2_out                      5        5        0  1000000000          0     0  50000         Y
> >        sys_pll2_1000m                 3        3        0  1000000000          0     0  50000         Y
> >           csi1_phy_ref                1        1        0  1000000000          0     0  50000         Y
> >           csi1_core                   1        1        0   500000000          0     0  50000         Y
> >              csi1_root_clk            1        1        0   500000000          0     0  50000         Y
> >
> > However, if i change the latter two (csi1_core & csi1_root_clk) to 1ghz, there
> > are still mipi-csi IRQs coming in, but nothing from the csi-bridge.
> >
> > Any advice on where i shall start looking first?
> >
> >
> > thanks,
> > Petko
