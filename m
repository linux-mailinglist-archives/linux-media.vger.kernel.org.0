Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD01E61FD50
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 19:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbiKGSUx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 13:20:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232518AbiKGSU1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 13:20:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80359240AB
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 10:20:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 577A6E7B;
        Mon,  7 Nov 2022 19:20:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667845218;
        bh=xp/yKZ36oVgfQ9VNJlzgYNE76jWopitZ+hIZhzsbgrY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ULWTPfe3/HoL8kcHbTdNcHgzRkuaOhp+t8g6hO7hegsZhZ0I9dlmjSsrMTSTnhEkm
         aALxPx97PKnwF6O17Y0AXzaBxIRMYOt02e3+ntFIjCOROaV4pxTRYmrXchOW7b23uH
         wuV9RQeXgV1O8aVI7/gVcBztZLXMrUVXT4ZNocQc=
Date:   Mon, 7 Nov 2022 20:20:00 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Vaklev <mvaklev@thermal.com>
Cc:     Adam Ford <aford173@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v2 7/7] media: nxp: Add i.MX8 ISI driver
Message-ID: <Y2lMUBY4J/Elaioe@pendragon.ideasonboard.com>
References: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
 <20220712000251.13607-8-laurent.pinchart@ideasonboard.com>
 <CAHCN7xKq+a05P4RKtToLiCqW4ZCQEYjKBpuS6Q0hOv4y3i8n+g@mail.gmail.com>
 <Y0QgWDNor/YKWcZ/@pendragon.ideasonboard.com>
 <CAHCN7xKJ_oeVs1PXiuE+-8CLNfi5EEwYckJA3amu+94u4KQEnA@mail.gmail.com>
 <DM6PR18MB3603AAC96A056B2E027538C6B02B9@DM6PR18MB3603.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM6PR18MB3603AAC96A056B2E027538C6B02B9@DM6PR18MB3603.namprd18.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Wed, Oct 19, 2022 at 02:47:39AM +0000, Martin Vaklev wrote:
> On Monday, October 10, 2022 7:21 PM, Adam Ford wrote:
> > On Mon, Oct 10, 2022 at 8:38 AM Laurent Pinchart wrote:
> > > On Mon, Oct 10, 2022 at 07:27:14AM -0500, Adam Ford wrote:
> > > > On Mon, Jul 11, 2022 at 7:06 PM Laurent Pinchart wrote:
> > > > >
> > > > > The Image Sensing Interface (ISI) combines image processing
> > > > > pipelines with DMA engines to process and capture frames
> > > > > originating from a variety of sources. The inputs to the ISI go
> > > > > through Pixel Link interfaces, and their number and nature is
> > > > > SoC-dependent. They cover both capture interfaces (MIPI CSI-2 RX,
> > HDMI RX) and memory inputs.
> > > > >
> > > > > Signed-off-by: Christian Hemp <c.hemp@phytec.de>
> > > > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > > Signed-off-by: Laurent Pinchart
> > > > > <laurent.pinchart@ideasonboard.com>
> > > > > Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> > > >
> > > > I did some testing on the imx8m Nano using the code from Laurent's
> > > > git repo as a starting point using an OV5640 camera.  I was able to
> > > > capture an image, but there is a solid green line at the top of the
> > > > image.  I am attaching a screenshot of my ceiling fan.  It's a
> > > > little blurry since it was spinning, but I have taken other images
> > > > and this green line remains. It's unclear to me if it's a camera
> > > > issue, CSIS issue or an ISI issue, but I was curious to know if
> > > > anyone has seen this on an imx8m Plus?
> > > >
> > > > I'm going to try to run a similar test on an imx8m Mini when I get
> > > > some more time.  I don't recall seeing this before, but I know there
> > > > have been some updates to the OV5640 and CSIS drivers.  The same
> > > > camera works on the Mini, but it has a different capture part, but I
> > > > think the CSIS is the same, so I'm hoping it might narrow the issue
> > > > down to ISI or not.
> > >
> > > Could you provide the same image in PNG format ? The lossless
> > > compression of JPEG creates artifacts that make it difficult to see
> > > what should be attributed to capture issues and what is caused by the
> > > compression.
> > 
> > I changed the output of the ISI to RGB and captured it as a PNG instead of
> > the JPEG, and the green bar disappeared.  I then re-ran it with JPEG again,
> > and the green bar returned.  I decided to convert to RGB, then capture as
> > JPEG, and the green bar stayed, so it appears to be limited to the JPEG
> > converstion and not the ISI.
> > 
> > I'll run some more experiments when I have more time, but for now , I guess
> > there is nothing to worry about.  Sorry for the noise.
> > 
> > adam
> 
> I did more testing on an imx8mn with ov5640 and I definitely see the
> issue and believe this to be a capture issue. I set up my pipeline to
> run natively in UYVY8_1X16 format all the way across and captured to a
> memory buffer. I do see the first green line (essentially all 0s in
> YUV format) and there are 8 pixels of other garbage at the beginning
> of the line (pictures attached). This only happens on the first frame
> when streaming is started. All consecutive frames are intact and
> shifted up by 1 line in reference to the first one.

I suppose that the first frame starts with an extra line, and subsequent
frames are correct. It would be nice to confirm that with a test
pattern. The square test pattern may be a good match.

Also, it would be useful to prefill the buffers with a known pattern, to
see if the first line is written with 0s, or not written at all.

> I also get several
> IRQ events reported on each stream start:
>
> [12724.275344] imx-mipi-csis 32e30000.mipi-csi: SOT Error events: 1
> [12724.281372] imx-mipi-csis 32e30000.mipi-csi: Lost Frame Start Error events: 195
> [12724.288682] imx-mipi-csis 32e30000.mipi-csi: CRC Error events: 186
> 
> A few things that come to mind which I intend to further verify: 
> - Check whether the HS_SETTLE and CLK_SETTLE times are being
>   appropriately set; they appear to be calculated rather than being set
>   by a DT property

I'm more confident about the HS settle value than the CLK settle value.
The former is computed from the clock frequency and should be OK
assuming "standard" timings on the CSI-2 source side. The CLK settle
value is missing proper documentation in the NXP reference manuals, so
there's a big question mark there.

> - Check if receiver is potentially enabled prior to sensor powered up
>   and properly entered LP-11 stop state, which would cause the noise on
>   the line to be interpreted by the receiver

That could cause some issues indeed.

> - Test different image frame sizes as this is captured in 640x480
> 
> > > > > ---
> > > > >  MAINTAINERS                                   |    7 +
> > > > >  drivers/media/platform/nxp/Kconfig            |    2 +
> > > > >  drivers/media/platform/nxp/Makefile           |    1 +
> > > > >  drivers/media/platform/nxp/imx8-isi/Kconfig   |   22 +
> > > > >  drivers/media/platform/nxp/imx8-isi/Makefile  |    9 +
> > > > >  .../platform/nxp/imx8-isi/imx8-isi-core.c     |  646 +++++++
> > > > >  .../platform/nxp/imx8-isi/imx8-isi-core.h     |  394 +++++
> > > > >  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  529 ++++++
> > > > >  .../platform/nxp/imx8-isi/imx8-isi-debug.c    |  109 ++
> > > > >  .../media/platform/nxp/imx8-isi/imx8-isi-hw.c |  651 +++++++
> > > > >  .../platform/nxp/imx8-isi/imx8-isi-m2m.c      |  858 ++++++++++
> > > > >  .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  867 ++++++++++
> > > > >  .../platform/nxp/imx8-isi/imx8-isi-regs.h     |  418 +++++
> > > > >  .../platform/nxp/imx8-isi/imx8-isi-video.c    | 1513 +++++++++++++++++
> > > > >  14 files changed, 6026 insertions(+)  create mode 100644
> > > > > drivers/media/platform/nxp/imx8-isi/Kconfig
> > > > >  create mode 100644 drivers/media/platform/nxp/imx8-isi/Makefile
> > > > >  create mode 100644
> > > > > drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > >  create mode 100644
> > > > > drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > >  create mode 100644
> > > > > drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > > > >  create mode 100644
> > > > > drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> > > > >  create mode 100644
> > > > > drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > > > >  create mode 100644
> > > > > drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> > > > >  create mode 100644
> > > > > drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> > > > >  create mode 100644
> > > > > drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> > > > >  create mode 100644
> > > > > drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > > >
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS index
> > > > > 1fc9ead83d2a..02327b4d8c9f 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -14270,6 +14270,13 @@ F: Documentation/devicetree/bindings/clock/imx*
> > > > >  F:     drivers/clk/imx/
> > > > >  F:     include/dt-bindings/clock/imx*
> > > > >
> > > > > +NXP i.MX 8M ISI DRIVER
> > > > > +M:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > +L:     linux-media@vger.kernel.org
> > > > > +S:     Maintained
> > > > > +F:     Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > > > +F:     drivers/media/platform/nxp/imx8-isi/
> > > > > +
> > > > >  NXP i.MX 8MQ DCSS DRIVER
> > > > >  M:     Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > > > >  R:     Lucas Stach <l.stach@pengutronix.de>
> > > > > diff --git a/drivers/media/platform/nxp/Kconfig
> > > > > b/drivers/media/platform/nxp/Kconfig
> > > > > index 1ac0a6e91111..0f5f8976ae78 100644
> > > > > --- a/drivers/media/platform/nxp/Kconfig
> > > > > +++ b/drivers/media/platform/nxp/Kconfig
> > > > > @@ -27,6 +27,8 @@ config VIDEO_VIU
> > > > >           Say Y here if you want to enable VIU device on MPC5121e Rev2+.
> > > > >           In doubt, say N.
> > > > >
> > > >
> > > > <snip>

-- 
Regards,

Laurent Pinchart
