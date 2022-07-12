Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23620571CF4
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 16:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbiGLOjy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 10:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233404AbiGLOjv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 10:39:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5740BAAB5
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 07:39:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2EA5A25B;
        Tue, 12 Jul 2022 16:39:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657636786;
        bh=u0ow13esJwuiXCBONFIemgWQjr1DnyY8R5hfSHicOTM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EuxMloimoHJIGwVFLHaZS7za+7hHaQFNZuJcg2RcdNdZ/jO4dFt0J5RHZjAgcSTRm
         6WHeGFoHiRGi6MJBfWJLjqUzBmYS8zfKGWfIGGUb2+fW35Qic9e2kBEurLLV91EHd+
         pVMTZyN4gskzG6Lc8AtOfaRv7wymm8XfhSsaW940=
Date:   Tue, 12 Jul 2022 17:39:17 +0300
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
Message-ID: <Ys2Hle/HvOG7OKDc@pendragon.ideasonboard.com>
References: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
 <20220712000251.13607-8-laurent.pinchart@ideasonboard.com>
 <CAHCN7xL_uSOxNCUMiRBzU354_Pb+DSvPMVtemFhaCmxPzwe7TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7xL_uSOxNCUMiRBzU354_Pb+DSvPMVtemFhaCmxPzwe7TQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Tue, Jul 12, 2022 at 07:29:45AM -0500, Adam Ford wrote:
> On Mon, Jul 11, 2022 at 7:06 PM Laurent Pinchart wrote:
> >
> > The Image Sensing Interface (ISI) combines image processing pipelines
> > with DMA engines to process and capture frames originating from a
> > variety of sources. The inputs to the ISI go through Pixel Link
> > interfaces, and their number and nature is SoC-dependent. They cover
> > both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.
> 
> I have a patch set pending this which adds the functionality to the
> Nano which I have tested using an OV5640 camera.  If/when this gets
> accepted, I can submit the corresponding Nano patches.

It will probably take a bit of time due to the dependency on the V4L2
streams series, but I'm quite hopeful :-)

> I haven't tried all possible video formats due to the limitations of
> the camera I used, but for those that I tried:
> 
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mn-beacon

Thank you. By the way, we have developed libcamera support for the ISI,
you can find it at [1]. It will get merged in the main libcamera
repository once the patches get accepted in the kernel.

[1] https://gitlab.com/ideasonboard/nxp/libcamera/-/tree/pinchartl/simple/imx8

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

-- 
Regards,

Laurent Pinchart
