Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6191D510B38
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 23:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355412AbiDZV3R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 17:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355408AbiDZV3P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 17:29:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CBC72315E;
        Tue, 26 Apr 2022 14:26:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83BB4E5;
        Tue, 26 Apr 2022 23:26:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1651008361;
        bh=u4unucx5kOTmf9ocLgtATWqLVFzxZpZzCbtmr2Yhkco=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K1rA/9MP2/Zs3wxK6sj/sGSJb7YwxCz1+UjnvCAy3Z+0NhqnghOK/ndKbkBfhHUY2
         BUwyvoE3GzCDBuW1Xhc23vilEsJLF5HpcToTUTy0Muor0+VJSbZm4m6WLNhsHkm6KK
         la3tdhnQwUaA113PcKHx+iaFwh+ui5QJzo0KqDTU=
Date:   Wed, 27 Apr 2022 00:26:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>, mchehab@kernel.org,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, nicolas@ndufresne.ca,
        alexander.stein@ew.tq-group.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/9] media: Documentation: dw100: Add user
 documentation for the DW100 driver
Message-ID: <YmhjaU8fC828k5o0@pendragon.ideasonboard.com>
References: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
 <20220328141309.177611-5-xavier.roumegue@oss.nxp.com>
 <a0a59b93-50e6-4721-f5a9-c48c9721a8a4@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a0a59b93-50e6-4721-f5a9-c48c9721a8a4@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 25, 2022 at 08:18:21AM +0200, Hans Verkuil wrote:
> On 28/03/2022 16:13, Xavier Roumegue wrote:
> > Add user documentation for the DW100 driver.
> > 
> > Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> > ---
> >  .../userspace-api/media/drivers/dw100.rst     | 23 +++++++++++++++++++
> >  .../userspace-api/media/drivers/index.rst     |  1 +
> >  2 files changed, 24 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst
> > 
> > diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
> > new file mode 100644
> > index 000000000000..4cd55c75628e
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/drivers/dw100.rst
> > @@ -0,0 +1,23 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +DW100 dewarp driver
> > +===========================

Looks like the underline can be shorten.

> > +
> > +The Vivante DW100 Dewarp Processor IP core found on i.MX8MP SoC applies a
> > +programmable geometrical transformation on input image to correct distorsion
> 
> distorsion -> distortion
> 
> > +introduced by lenses.
> > +
> > +The transformation function is exposed by the hardware as a grid map with 16x16
> > +pixel macroblocks indexed using X, Y vertex coordinates. Each x, y coordinate
> > +register uses 16 bits to record the coordinate address in UQ12.4 fixed point
> > +format.
> > +
> > +The dewarping map can be set from application through a dedicated v4l2 control.

s/v4l2/V4L2/

I'd mention the control ID.

> > +If not set or invalid, the driver computes an identity map prior to start the
> > +processing engine. The map is evaluated as invalid if the array size does not
> > +match the expected size inherited from the destination image resolution.

I'd swap the two sentences and clarify this a bit:

----
The dewarping map is set from applications using the
V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP control. The control contains
an array of u32 values storing (x, y) destination coordinates for each
vertex of the grid. The x coordinate is stored in the 16 LSBs and the y
coordinate in the 16 MSBs. The number of elements in the array must
match the image size:

    elems = (DIV_ROUND_UP(width, 16) + 1)
          * (DIV_ROUND_UP(height, 16) + 1);

If the control doesn't contain the correct number of elements, the
driver uses an identity map.
----

This assumes I got the size calculation right :-)

Bonus points if you can format the code block correctly for sphinx.

I'm also wondering if the driver shouldn't return an error when the map
is incorrect, defaulting silently to an identity map can be confusing.

> > +
> > +More details on the DW100 hardware operations can be found in
> > +*chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
> 
> manuel -> manual
> 
> > +
> > +.. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPRM
> > diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> > index 12e3c512d718..8826777321b0 100644
> > --- a/Documentation/userspace-api/media/drivers/index.rst
> > +++ b/Documentation/userspace-api/media/drivers/index.rst
> > @@ -33,6 +33,7 @@ For more details see the file COPYING in the source distribution of Linux.
> >  
> >  	ccs
> >  	cx2341x-uapi
> > +	dw100
> >          hantro

While at it you could replace the spaces with a tab here (and mention
that in the commit message, with a "While at it, ..." line).

> >  	imx-uapi
> >  	max2175

-- 
Regards,

Laurent Pinchart
