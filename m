Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA195694AC
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 23:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234646AbiGFVrv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 17:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234618AbiGFVru (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 17:47:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0169F2A253
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 14:47:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C187A30A;
        Wed,  6 Jul 2022 23:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657144067;
        bh=r38AAIuOlmxI7tEnik+4195/hL/ekrq9T8jJTpf49AM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TuPOFAdQySu9R40l+A82xqlQH99vmNU0r1pAFm8HHXAUVLCWYEwk3f/nV/OpZ942C
         gSdGc52xzEPpa04LM6T+0I2AeQBJ1GeJfFcDTLRauXmM1lYUv+wTAwmhVLjCU0ShB6
         70i1UJPRjJq2RfAKdNSlHZNhh+pIKHdBxxG7j2ic=
Date:   Thu, 7 Jul 2022 00:47:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: Re: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <YsYC6eMtotq7FR2i@pendragon.ideasonboard.com>
References: <YrwFf7Jw2/yDlcDq@carbon.lan>
 <12352558.O9o76ZdvQC@steina-w>
 <YsRVAV8a48CwpaSY@p310.k.g>
 <2450654.irdbgypaU6@steina-w>
 <YsWJBEPhp9WhiYe1@p310.k.g>
 <YsWTXnTpeM+mCImc@pendragon.ideasonboard.com>
 <YsXh/arQZXnaeGAi@carbon.gago.life>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YsXh/arQZXnaeGAi@carbon.gago.life>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petko,

On Wed, Jul 06, 2022 at 10:26:53PM +0300, Petko Manolov wrote:
> On 22-07-06 16:51:26, Laurent Pinchart wrote:
> > On Wed, Jul 06, 2022 at 04:07:16PM +0300, Petko Manolov wrote:
> > > On 22-07-06 08:18:20, Alexander Stein wrote:
> > > > 
> > > > Thanks! Indeed at a first glance it looks straight forward. I was trying
> > > > to get an imx327 running on a imx8mm, called TQMa8MxML. See [1] for some
> > > > details. The cover letter describes the config setup. The media-ctl
> > > > commands might help your setup. Note the settle times are an ugly bitch
> > > > and are crucial to be set on my board, but I'm not sure why they have to
> > > > be that way. Patch 1-8 are obsolete by now with the updates to
> > > > drivers/media/platform/nxp/ imx-mipi-csis.c. Patch 9 might help you
> > > > configure the DT.
> > > 
> > > Right, media-ctl is it.  In fact the pipelines have been properly set up so
> > > i only had to change the format.  The attached media graph is below
> > > 
> > > Now, there are two problems i'm stumbling upon.  One is related to the
> > > capture device not actually supporting imx492 format(s), which are:
> > > 
> > > 	MEDIA_BUS_FMT_SGBRG10_1X10 MEDIA_BUS_FMT_SGBRG12_1X12
> > > 
> > > which i guess is why i am being greeted with (when using v4l2-ctl):
> > > 
> > > 	imx7-csi 32e20000.csi: capture format not valid
> > > 
> > > When i manually force it to something that is actually supported,
> > > MEDIA_BUS_FMT_SGBRG16_1X16, i get:
> > > 
> > > 	imx7-csi 32e20000.csi: pipeline start failed with -67
> > > 
> > > Since this isn't one of the usual error numbers i guess it comes from within
> > > the driver code.  I might be getting this error because the source is 12 bit
> > > while the sink is 16 and i am breaking something, dunno.
> > > 
> > > Shall i go ahead and add MEDIA_BUS_FMT_SGBRG12_1X12 to the capture driver or
> > > i am missing something here?
> > 
> > I had a quick look at the imx7-media-csi driver, and I think it supports 1-bit
> > bayer correctly. You need to use the MEDIA_BUS_FMT_SGBRG10_1X10 or
> > MEDIA_BUS_FMT_SGBRG12_1X12 media bus formats through the pipeline, and the
> > V4L2_PIX_FMT_SGBRG16 pixel format on the video captude node. If that doesn't
> 
> Well, it does work, but is there a reason MEDIA_BUS_FMT_SGBRG12_1X12 can't be
> used instead of V4L2_PIX_FMT_SGBRG16?  I can see the capture node does not
> support the former, but don't understand the logic behind.
> 
> Again, i'm no expert in the field...

MEDIA_BUS_FMT_* are media bus formats, they describe the format of data
as it gets transmitted on buses between entities. The main purposes of
those formats are configuration of entities in the pipeline (an IP core
will need to be configured differently if it receives 10-bit raw data or
12-bit raw data for instance), and validation of the pipeline
configuration (the format on the output of an entity must match the
format on the input of the next entity).

V4L2_PIX_FMT_* are pixel formats, and they describe the format of data
as stored in memory. They're only meaningful for the DMA engines at the
end of the pipeline, and while they're related to the media bus formats
(the DMA engine can't write to memory, for instance, V4L2_PIX_FMT_YUYV
if it receives MEDIA_BUS_FMT_SGRBG10 from the previous entity), there's
no fixed 1:1 mapping between the two formats. The mapping is
device-dependent. For instance, a DMA engine that receives YUV 4:2:2
data in the form of MEDIA_BUS_FMT_YUYV8_1X16 could support writing it in
different pixel formats, such as V4L2_PIX_FMT_YUYV, V4L2_PIX_FMT_NV12,
V4L2_PIX_FMT_NV16, ...

> > > The other problem is when v4l2 tries to allocate buffer for even a single
> > > frame.  This is 8192x5556 10/12bit bayer sensor and, maybe not surprisingly
> > > i get "buffer allocation failed".  Is it possible that i'm the first to step
> > > on this issue on imx8m-mini or in general?
> > 
> > You may want to increase the size of the CMA in the kernel configuration (or
> > on the kernel command line).
> 
> Well, this one was some sort of fun.  After debugging videobuf2-core.c it turned
> out the culprit is in imx-media-capture.c (via call_qop(q, queue_setup, ...))
> calls.
> 
> VID_MEM_LIMIT is only 64MB while the image is ~90MB, but it looks like four of
> those are required.  I increased the CMA to 640MB, defined VID_MEM_LIMIT to
> 512MB and got something that look like it's working.  I am yet to convert the
> raw image to something pleasant for human eye...
> 
> I am not entirely convinced the above approach is the correct one.  OTOH,
> something needs to be done for large resolution sensors.  Ideas?

I have work in progress patches that address issues with the
imx7-csi-bridge driver, once they land we could look into this. I'm
afraid I'm a bit slow these days due to covid.

-- 
Regards,

Laurent Pinchart
