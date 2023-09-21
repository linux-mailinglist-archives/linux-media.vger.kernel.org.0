Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30E1D7AA325
	for <lists+linux-media@lfdr.de>; Thu, 21 Sep 2023 23:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232557AbjIUVt2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Sep 2023 17:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjIUVtO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Sep 2023 17:49:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9044C30;
        Thu, 21 Sep 2023 14:38:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2152B75;
        Thu, 21 Sep 2023 23:36:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695332198;
        bh=NThWvHw/aARo5ErtAywC9nCCLOadrRsIw0AMenwcXNw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GwAaH1jRjiYvUOxWQHccJeivxljlg2nX5PSbYElTHWWezSMcE8Z2Cf/myqHg4q4T4
         i0n4QO6JW3Ps3noPKPf7zpgljFFWNx6HAxQogngXW/vJpR1ll4HS+AWJ+Ukqf9LMpp
         NiyMgKEzgUb5zd8zqLfHs7ji/NSGVT1NVnK8fQyA=
Date:   Fri, 22 Sep 2023 00:38:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, guoniu.zhou@oss.nxp.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, mchehab@kernel.org,
        alexander.stein@ew.tq-group.com, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, conor+dt@kernel.org,
        jacopo.mondi@ideasonboard.com,
        Nelson Costa <Nelson.Costa@synopsys.com>
Subject: Re: [PATCH v2 2/2] media: nxp: add driver for i.MX93 MIPI CSI-2
 controller and D-PHY
Message-ID: <20230921213827.GD19112@pendragon.ideasonboard.com>
References: <20230710060352.584286-1-guoniu.zhou@oss.nxp.com>
 <20230710060352.584286-3-guoniu.zhou@oss.nxp.com>
 <ZQIdQmsv4wEmmyau@valkosipuli.retiisi.eu>
 <20230917212509.GB16448@pendragon.ideasonboard.com>
 <ZQyPURd-I2WwOsh5@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZQyPURd-I2WwOsh5@oden.dyn.berto.se>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

CC'ing Nelson Costa from Synopsys.

On Thu, Sep 21, 2023 at 08:45:37PM +0200, Niklas Söderlund wrote:
> Hello,
> 
> On 2023-09-18 00:25:09 +0300, Laurent Pinchart wrote:
> 
> [snip]
> 
> > > > diff --git a/drivers/media/platform/nxp/dwc-mipi-csi2.h 
> > > > b/drivers/media/platform/nxp/dwc-mipi-csi2.h
> > > > new file mode 100644
> > > > index 000000000000..470023787c25
> > > > --- /dev/null
> > > > +++ b/drivers/media/platform/nxp/dwc-mipi-csi2.h
> > > > @@ -0,0 +1,299 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +/*
> > > > + * Copyright 2023 NXP
> > > > + */
> > > > +
> > > > +#ifndef __DWC_MIPI_CSI2_H__
> > > > +#define __DWC_MIPI_CSI2_H__
> > > > +
> > > > +#include <linux/device.h>
> > > > +#include <linux/delay.h>
> > > > +#include <linux/io.h>
> > > > +
> > > > +#include <media/v4l2-ctrls.h>
> > > > +#include <media/v4l2-device.h>
> > > > +#include <media/v4l2-fwnode.h>
> > > > +#include <media/v4l2-mc.h>
> > > > +#include <media/v4l2-subdev.h>
> > > 
> > > I don't think you need many of these headers here. Please move to the .c
> > > file those you don't need here.
> > > 
> > > > +
> > > > +/* MIPI CSI-2 Host Controller Registers Define */
> > > > +
> > 
> > Niklas, is it me, or do the registers here look very familiar ? The
> > R-Car V4H may have the same CSI-2 RX. Should we have a single driver ?
> 
> I agree it looks very familiar. The register space to indeed start out 
> aligned between this driver and R-Car V4H (not checked every bit tho).  
> But once we get to later registers it seems the two diverge a bit. If 
> this is due to usage or something else I don't know. I have very sparse 
> documentation for the V4H.
> 
> It becomes even more interesting. Have a look at this drivers 
> hsfreqrange lookup table, dwc_csi_mbps_table[]. That overlaps with R-Car 
> V3U (rcar-csi2.c hsfreqrange_v3u[]) instead of V4H, but V3U appears to 
> support faster bus.

I expect different SoCs to have different frequency range tables,
depending on how the IP core is synthesized (the manufacturing process
may play a role too).

> I think we can agree these two drivers are very similar, but not 
> identical. The most interesting register here is the first one 
> CSI2RX_VERSION. Maybe if we can figure that out we could start to think 
> about a generic driver? Unfortunately I have no documentation for the 
> content of this register. And the V4H driver do not use it, so I don't 
> even know if it contains anything.
> 
> Is there any publicly documentation about this device? I have very 
> sparse documentation about V4H, and nothing I can share. As to not block 
> anyone maybe two drivers are OK and if we can figure out what parts, if 
> any can be shared?

I don't think there's any public documentation available from Synopsys.
Various SoC manuals, public or private, include different level of
details.

Nelson, do you have any insight you could share, or maybe point us to
someone familiar with this IP core ?

-- 
Regards,

Laurent Pinchart
