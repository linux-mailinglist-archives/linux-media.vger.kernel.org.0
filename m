Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E80F5FFD61
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 07:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbiJPFhh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 01:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbiJPFhg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 01:37:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B4DF3B957
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 22:37:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C55F830A;
        Sun, 16 Oct 2022 07:37:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665898654;
        bh=Cdo10kVf+8QXQQK5JpHQ9e3eksy1uVG7M5/5I25PAkM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OzscfKNFZYIo5xyPs6VQnYfVoiu82dggWKNDTXgp5K3+eqmOPZ7jsvJlBh+mG16/Z
         TM9LM92MOsyvJ0jjuoKj5T4mvgK2FWHejsudcVJCQXW7TG0jhuL6d46msBpDMbkB1j
         moLkaR3j1wjlxNih6L1Ekmvw9ze6Ggv8qFyK1QuY=
Date:   Sun, 16 Oct 2022 08:37:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 00/19] media: i2c: imx290: Miscellaneous improvements
Message-ID: <Y0uYhiny89r9J8//@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <YwQpT5JpyfXBEIVE@pendragon.ideasonboard.com>
 <CAPY8ntAsJNOAJ2te2vQSK6AeXj8LyB6Krepc88FL=6U6O9zb2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntAsJNOAJ2te2vQSK6AeXj8LyB6Krepc88FL=6U6O9zb2g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Mon, Oct 10, 2022 at 11:31:33AM +0100, Dave Stevenson wrote:
> Hi Laurent
> 
> Do you have plans for a v2 on this patch set? I also have a number of
> patches for imx290 and there's little point in causing grief to each
> other with conflicts.
> Or I could take the non-controversial patches from your set and send a
> combined patch set?

I'm working on a v2, I'll send it shortly. Do I assume correctly you'll
submit IMX327 support on top ? :-)

> On Tue, 23 Aug 2022 at 02:12, Laurent Pinchart wrote:
> >
> > Hi Sakari,
> >
> > Could you already pick up patches 01/19, 02/19, 04/19, 05/19 and 06/19
> > in your tree ? Your opinion on 03/19 woud be appreciated too, I think
> > it's a candidate for merge as well.
> >
> > On Thu, Jul 21, 2022 at 11:35:21AM +0300, Laurent Pinchart wrote:
> > > Hello,
> > >
> > > This patch series gathers miscellaneous improvements for the imx290
> > > driver. The most notable changes on the kernel side is patch 07/19 that
> > > simplifies register access, and on the userspace API side patches 14/19,
> > > 15/19 and 18/19 that extend the driver with controls and selection
> > > rectangles required by libcamera.
> > >
> > > Laurent Pinchart (19):
> > >   media: i2c: imx290: Use device lock for the control handler
> > >   media: i2c: imx290: Print error code when I2C transfer fails
> > >   media: i2c: imx290: Specify HMAX values in decimal
> > >   media: i2c: imx290: Replace macro with explicit ARRAY_SIZE()
> > >   media: i2c: imx290: Drop imx290_write_buffered_reg()
> > >   media: i2c: imx290: Drop regmap cache
> > >   media: i2c: imx290: Support variable-sized registers
> > >   media: i2c: imx290: Correct register sizes
> > >   media: i2c: imx290: Simplify error handling when writing registers
> > >   media: i2c: imx290: Define more register macros
> > >   media: i2c: imx290: Add exposure time control
> > >   media: i2c: imx290: Fix max gain value
> > >   media: i2c: imx290: Split control initialization to separate function
> > >   media: i2c: imx290: Implement HBLANK and VBLANK controls
> > >   media: i2c: imx290: Create controls for fwnode properties
> > >   media: i2c: imx290: Move registers with fixed value to init array
> > >   media: i2c: imx290: Factor out format retrieval to separate function
> > >   media: i2c: imx290: Add crop selection targets support
> > >   media: i2c: imx290: Replace GAIN control with ANALOGUE_GAIN
> > >
> > >  drivers/media/i2c/imx290.c | 781 ++++++++++++++++++++++---------------
> > >  1 file changed, 458 insertions(+), 323 deletions(-)

-- 
Regards,

Laurent Pinchart
