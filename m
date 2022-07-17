Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 502B45776D2
	for <lists+linux-media@lfdr.de>; Sun, 17 Jul 2022 16:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbiGQO4l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jul 2022 10:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232757AbiGQO4k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jul 2022 10:56:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7EB312D3A
        for <linux-media@vger.kernel.org>; Sun, 17 Jul 2022 07:56:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45A2533F;
        Sun, 17 Jul 2022 16:56:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658069797;
        bh=iPvsuKkgMpBzxO1+IZOzppvpOKLJgwFJwdD7dQ9hpHM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X4WHru0Y61gdW61iL5ryXTX5Y12uh2BewqtF+azrG9BjSzZf5qh5FDHfLgSVyDIMz
         evyBJRKflyr1jCufAeVZHTDjgVqRjhxG5wElSDs1+6elACxYu05Sl0Gm8ndCsk6X3/
         jWk9oPs8zoWFjFTuWQcT/F15ep92FGhRgtJJaI9g=
Date:   Sun, 17 Jul 2022 17:56:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>
Subject: Re: [PATCH v2 7/7] media: nxp: Add i.MX8 ISI driver
Message-ID: <YtQjBcxQeUzEaXwZ@pendragon.ideasonboard.com>
References: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
 <20220712000251.13607-8-laurent.pinchart@ideasonboard.com>
 <CAHCN7xKfYabhnFKu46jfcE+qBj4TcF_ei6=7PWEcqUb=wHwd7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7xKfYabhnFKu46jfcE+qBj4TcF_ei6=7PWEcqUb=wHwd7w@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Sat, Jul 16, 2022 at 12:59:35PM -0500, Adam Ford wrote:
> On Mon, Jul 11, 2022 at 7:06 PM Laurent Pinchart wrote:
> >
> > The Image Sensing Interface (ISI) combines image processing pipelines
> > with DMA engines to process and capture frames originating from a
> > variety of sources. The inputs to the ISI go through Pixel Link
> > interfaces, and their number and nature is SoC-dependent. They cover
> > both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.
> >
> > Signed-off-by: Christian Hemp <c.hemp@phytec.de>
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> > ---
> >  MAINTAINERS                                   |    7 +
> >  drivers/media/platform/nxp/Kconfig            |    2 +
> >  drivers/media/platform/nxp/Makefile           |    1 +
> >  drivers/media/platform/nxp/imx8-isi/Kconfig   |   22 +
> >  drivers/media/platform/nxp/imx8-isi/Makefile  |    9 +
> >  .../platform/nxp/imx8-isi/imx8-isi-core.c     |  646 +++++++
> >  .../platform/nxp/imx8-isi/imx8-isi-core.h     |  394 +++++
> >  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  529 ++++++
> >  .../platform/nxp/imx8-isi/imx8-isi-debug.c    |  109 ++
> >  .../media/platform/nxp/imx8-isi/imx8-isi-hw.c |  651 +++++++
> >  .../platform/nxp/imx8-isi/imx8-isi-m2m.c      |  858 ++++++++++
> >  .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  867 ++++++++++
> >  .../platform/nxp/imx8-isi/imx8-isi-regs.h     |  418 +++++
> >  .../platform/nxp/imx8-isi/imx8-isi-video.c    | 1513 +++++++++++++++++
> >  14 files changed, 6026 insertions(+)
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/Kconfig
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/Makefile
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> 
> (snip)
> 
> Laurent,
> 
> Thank you for this series.
> 
> > +
> > +/* -----------------------------------------------------------------------------
> > + * IRQ
> > + */
> > +
> > +u32 mxc_isi_channel_irq_status(struct mxc_isi_pipe *pipe, bool clear)
> > +{
> > +       u32 status;
> > +
> > +       status = mxc_isi_read(pipe, CHNL_STS);
> > +       if (clear)
> > +               mxc_isi_write(pipe, CHNL_STS, status);
> > +
> > +       return status;
> > +}
> > +
> > +void mxc_isi_channel_irq_clear(struct mxc_isi_pipe *pipe)
> > +{
> > +       mxc_isi_write(pipe, CHNL_STS, 0xffffffff);
> > +}
> > +
> 
> I was reading through the TRM for both Nano and Plus, and it seems
> like there are a few bits in CHNL_STS that are always 0, but we're
> setting them 1.  Bit 0-7, 11-15 an 24 all show 0. The TRM says to
> write a 1 to any bit that's set in order to clear it, and
> mxc_isi_channel_irq_status can do this.  Why not just have
> mxc_isi_channel_irq_clear call mxc_isi_channel_irq_status(pipe, true)?
>  It seems clearer to me than writing a hard-coded hex value.  This
> way, it's only clearing any set bits and not arbitrarily writing 1's
> to bit locations that might not be desired..

This is the usual question of how to handle reserved bits, and if taking
shortcuts that simplify the driver implementation is acceptable. I've
heard various arguments related to this topic over time, ranging from
strict compliance with the datasheet for fear of unwanted behaviour, to
forward-compatibility with newer IP versions that may use those reserved
bits.

In practice, true reserved bits are very likely to be ignored by the
hardware when written, so it shouldn't matter much, and
forward-compatibility is often more of a theoretical argument as a newer
IP version that includes changes to registers will most likely need
driver updates anyway. However, bits documented as reserved may do
something undocumented, so without feedback from the vendor that
reserved bits are safe to be written, it's hard to be 100% sure.

In this specific case, I don't think a simple write(read()) would be the
best idea, as it will be more costly due to the additional read. It's
also not clear what happens when the read-only bits of the CHNL_STS
register do when written, I assume writes are just ignored, but if
you're concerned about writing to arbitrary bits, one could also argue
that writing 1's to read-only locations could be a problem.

We could replace the above with

	mxc_isi_write(pipe, CHNL_STS, 0xfeff0000);

Would that handle your concern ? Note that the i.MX8 DualX, DualXPlus
and QuadXPlus include an ISI that has a different layout for the
CHNL_STS register, with "clear on write" interrupt bits in [31:14], so
the function would need to be adapted when supporting that SoC. One
option would be to write

	mxc_isi_write(pipe, CHNL_STS, 0xffffc000);

on the assumption that bits 14, 15 and 24 are really not implemented in
i.MX8MM and i.MX8MP.

Xavier, do you have any preference ? Is there any rule followed by NXP
for this ?

> (snip)

-- 
Regards,

Laurent Pinchart
