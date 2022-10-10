Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6AA05F9F85
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 15:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbiJJNin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 09:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiJJNim (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 09:38:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C3E72B44
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 06:38:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69CA5E3A;
        Mon, 10 Oct 2022 15:38:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665409118;
        bh=u+SUgp0INZxf/kSEcr88roehUF3N2V6/sf4QbStUuJ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q+jdAm5As/+WT/VkYdFejOE4KSmdotk1pPSI1TwNZFsnDNIJHfukRz76CNKj/8Se5
         cExM614i2VxcdRhw5Fig1t2K/lw66F6dL+7d9B8NW5Q+Cz59YGWuSj1zkkCXAQzhXX
         5o73mD8vxrrFCrBCSXjSihU95d4T69xKFruJ3gpc=
Date:   Mon, 10 Oct 2022 16:38:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Martin Vaklev <mvaklev@thermal.com>
Subject: Re: [PATCH v2 7/7] media: nxp: Add i.MX8 ISI driver
Message-ID: <Y0QgWDNor/YKWcZ/@pendragon.ideasonboard.com>
References: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
 <20220712000251.13607-8-laurent.pinchart@ideasonboard.com>
 <CAHCN7xKq+a05P4RKtToLiCqW4ZCQEYjKBpuS6Q0hOv4y3i8n+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7xKq+a05P4RKtToLiCqW4ZCQEYjKBpuS6Q0hOv4y3i8n+g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Mon, Oct 10, 2022 at 07:27:14AM -0500, Adam Ford wrote:
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
> 
> I did some testing on the imx8m Nano using the code from Laurent's git
> repo as a starting point using an OV5640 camera.  I was able to
> capture an image, but there is a solid green line at the top of the
> image.  I am attaching a screenshot of my ceiling fan.  It's a little
> blurry since it was spinning, but I have taken other images and this
> green line remains. It's unclear to me if it's a camera issue, CSIS
> issue or an ISI issue, but I was curious to know if anyone has seen
> this on an imx8m Plus?
> 
> I'm going to try to run a similar test on an imx8m Mini when I get
> some more time.  I don't recall seeing this before, but I know there
> have been some updates to the OV5640 and CSIS drivers.  The same
> camera works on the Mini, but it has a different capture part, but I
> think the CSIS is the same, so I'm hoping it might narrow the issue
> down to ISI or not.

Could you provide the same image in PNG format ? The lossless
compression of JPEG creates artifacts that make it difficult to see what
should be attributed to capture issues and what is caused by the
compression.

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
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1fc9ead83d2a..02327b4d8c9f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14270,6 +14270,13 @@ F:     Documentation/devicetree/bindings/clock/imx*
> >  F:     drivers/clk/imx/
> >  F:     include/dt-bindings/clock/imx*
> >
> > +NXP i.MX 8M ISI DRIVER
> > +M:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +L:     linux-media@vger.kernel.org
> > +S:     Maintained
> > +F:     Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > +F:     drivers/media/platform/nxp/imx8-isi/
> > +
> >  NXP i.MX 8MQ DCSS DRIVER
> >  M:     Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> >  R:     Lucas Stach <l.stach@pengutronix.de>
> > diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> > index 1ac0a6e91111..0f5f8976ae78 100644
> > --- a/drivers/media/platform/nxp/Kconfig
> > +++ b/drivers/media/platform/nxp/Kconfig
> > @@ -27,6 +27,8 @@ config VIDEO_VIU
> >           Say Y here if you want to enable VIU device on MPC5121e Rev2+.
> >           In doubt, say N.
> >
> 
> <snip>

-- 
Regards,

Laurent Pinchart
