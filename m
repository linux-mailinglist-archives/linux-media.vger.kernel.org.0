Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C952510B7D
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 23:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355539AbiDZVsF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 17:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233752AbiDZVsE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 17:48:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F77863BD4;
        Tue, 26 Apr 2022 14:44:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF88030B;
        Tue, 26 Apr 2022 23:44:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1651009494;
        bh=RhvrIhNLWO946ehassDhyFnuzXpvyHWUxAtfQ5WEoqs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BEHUGc2JhUEYnYLUHbn5IkOzuwjjYrr/tNG44x1daI1Z0alGbA9/z2M6Xz7lIhcKI
         47Z7Asw96+HL7zjUnTfd3wW33Tw48tUHBEEPY5/M/8C58mwXnbCYbL+i/TBbYqzOxa
         NBiQtFC40pxI6zNdRF+QgDAJddQz1uFOjrGVG1lo=
Date:   Wed, 27 Apr 2022 00:44:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, nicolas@ndufresne.ca,
        alexander.stein@ew.tq-group.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 6/9] media: uapi: Add a control for DW100 driver
Message-ID: <Ymhn1dwXgHVROm/H@pendragon.ideasonboard.com>
References: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
 <20220328141309.177611-7-xavier.roumegue@oss.nxp.com>
 <dba106ac-cee1-2493-13c7-ad9aef556a49@xs4all.nl>
 <b3fb75bc-301c-823a-4779-964bce95d051@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b3fb75bc-301c-823a-4779-964bce95d051@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xavier,

On Tue, Apr 26, 2022 at 11:34:55PM +0200, Xavier Roumegue (OSS) wrote:
> On 4/25/22 08:57, Hans Verkuil wrote:
> > On 28/03/2022 16:13, Xavier Roumegue wrote:
> >> The DW100 driver gets the dewarping mapping as a binary blob from the
> >> userspace application through a custom control.
> >> The blob format is hardware specific so create a dedicated control for
> >> this purpose.
> >>
> >> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> >> ---
> >>   Documentation/userspace-api/media/drivers/dw100.rst | 12 ++++++++++++
> >>   include/uapi/linux/dw100.h                          | 11 +++++++++++
> >>   2 files changed, 23 insertions(+)
> >>   create mode 100644 include/uapi/linux/dw100.h
> >>
> >> diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
> >> index 4cd55c75628e..f6d684cadf26 100644
> >> --- a/Documentation/userspace-api/media/drivers/dw100.rst
> >> +++ b/Documentation/userspace-api/media/drivers/dw100.rst
> >> @@ -20,4 +20,16 @@ match the expected size inherited from the destination image resolution.
> >>   More details on the DW100 hardware operations can be found in
> >>   *chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
> >>   
> >> +The Vivante DW100 m2m driver implements the following driver-specific control:
> >> +
> >> +``V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP (integer)``
> > 
> > (integer) -> (__u32 array)
> > 
> > But should this be a __u32 array at all? Wouldn't a __u16 array make more sense?
>
> This is indeed debatable. But the array is describing vertices positions 
> on a 2D dimension space, and thus its size is always even.
> More importantly, the array must follow the format imposed by the 
> hardware which expects __u16 pairs packed in a __u32.
> Lastly, the lut (map) register size unit is __u32.
> 
> Hence, IMHO, using __u32 might make more sense to highlight its hardware 
> dependency.

Agreed.

As mentioned in a reply to another patch, I think it would be useful to
explain this a bit more clearly. Hans mentioned in the review of the
driver itself that there was a bug as an image width of 16 bits results
in a grid width of 2. I think that's correct (a width between 1 and 16
pixels results in a single grid cell horizontally, and thus two
vertices, on the left and right side of the cell), but it would benefit
from an explanation. A small ascii art diagram could help.

> >> +    Specifies to DW100 driver its dewarping map (aka LUT) blob as described in
> >> +    *chapter 13.15.2.3 Dewarping Remap* of IMX8MP_ reference manual as an U32
> >> +    dynamic array. The image is divided into many small 16x16 blocks. If the
> >> +    width of the image is not divisible by 16, the size of the rightmost block
> >> +    is the remainder.
> > 
> > Isn't the same true for the height?
> 
> Yes, will update accordingly.
>
> > The dewarping map only saves the vertex coordinates of the
> > 
> >> +    block. The dewarping grid map is comprised of vertex coordinates for x and y.
> >> +    Each x, y coordinate register uses 16 bits (UQ12.4) to record the coordinate
> > 
> > As mentioned before, UQ12.4 is not necessarily a standard notation. 'unsigned 12.4
> > fixed point' is better, but you also need to specify exactly where the bits are
> > stored inside the __u16. I.e.: 'the integer part is stored in the 12 most significant
> > bits, and the fractional part is stored in the 4 least significant bits of the __u16.'
> > 
> >> +    address, with the Y coordinate in the upper bits and X in the lower bits.
> > 
> > And with a __u16 array this becomes: 'The array contains pairs of X, Y coordinates.'
> > Or something along those lines.
> > 
> >> +
> >>   .. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPRM
> >> diff --git a/include/uapi/linux/dw100.h b/include/uapi/linux/dw100.h
> >> new file mode 100644
> >> index 000000000000..7fdcf2bf42e5
> >> --- /dev/null
> >> +++ b/include/uapi/linux/dw100.h
> >> @@ -0,0 +1,11 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> >> +/* Copyright 2022 NXP */
> >> +
> >> +#ifndef __UAPI_DW100_H__
> >> +#define __UAPI_DW100_H__
> >> +
> >> +#include <linux/v4l2-controls.h>
> >> +
> > 
> > Add a comment referring to the Documentation/userspace-api/media/drivers/dw100.rst
> > documentation so users of this control know where to find the associated
> > documentation.
> > 
> >> +#define V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP (V4L2_CID_USER_DW100_BASE + 1)
> >> +
> >> +#endif

-- 
Regards,

Laurent Pinchart
