Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 829CD54C3AA
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 10:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345197AbiFOIkG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 04:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239494AbiFOIkE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 04:40:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 939B74A3F7;
        Wed, 15 Jun 2022 01:40:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFAA35A9;
        Wed, 15 Jun 2022 10:39:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655282398;
        bh=KGKLMUcRX4NPWW86tzSHm0IqynOavFPPyfh6fINs/dA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RO9k0MojSHaoU/gsSNJT/oQwCGAgOCW+38Mi1+BFIHZxybgUybo86zN4hxRo6jyn7
         GtVZjG6fDPWkTLyLtjUdxvW/WiIfzuttqxTQcfODoI1iE65nX8I2txp4srEoN+a/D7
         VeKiKGdoug3Hx9qe3ffd87zLhFRYCKGPO4Cx0v1M=
Date:   Wed, 15 Jun 2022 11:39:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>, mchehab@kernel.org,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, nicolas@ndufresne.ca,
        alexander.stein@ew.tq-group.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/9] videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
Message-ID: <Yqma1AuWU7I47cUR@pendragon.ideasonboard.com>
References: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
 <20220503093925.876640-2-xavier.roumegue@oss.nxp.com>
 <YqjznJSwPFH4GrhO@pendragon.ideasonboard.com>
 <3e5e2531-00b7-a8d5-4199-9f59fc35ed39@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3e5e2531-00b7-a8d5-4199-9f59fc35ed39@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Jun 15, 2022 at 09:37:17AM +0200, Hans Verkuil wrote:
> On 6/14/22 22:46, Laurent Pinchart wrote:
> > On Tue, May 03, 2022 at 11:39:17AM +0200, Xavier Roumegue wrote:
> >> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>
> >> Add a new flag that indicates that this control is a dynamically sized
> >> array. Also document this flag.
> >>
> >> Currently dynamically sized arrays are limited to one dimensional arrays,
> >> but that might change in the future if there is a need for it.
> >>
> >> The initial use-case of dynamic arrays are stateless codecs. A frame
> >> can be divided in many slices, so you want to provide an array containing
> >> slice information for each slice. Typically the number of slices is small,
> >> but the standard allow for hundreds or thousands of slices. Dynamic arrays
> >> are a good solution since sizing the array for the worst case would waste
> >> substantial amounts of memory.
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> ---
> >>  .../userspace-api/media/v4l/vidioc-queryctrl.rst          | 8 ++++++++
> >>  include/uapi/linux/videodev2.h                            | 1 +
> >>  2 files changed, 9 insertions(+)
> >>
> >> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> >> index 88f630252d98..a20dfa2a933b 100644
> >> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> >> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> >> @@ -625,6 +625,14 @@ See also the examples in :ref:`control`.
> >>  	``V4L2_CTRL_FLAG_GRABBED`` flag when buffers are allocated or
> >>  	streaming is in progress since most drivers do not support changing
> >>  	the format in that case.
> >> +    * - ``V4L2_CTRL_FLAG_DYNAMIC_ARRAY``
> >> +      - 0x0800
> >> +      - This control is a dynamically sized 1-dimensional array. It
> >> +        behaves the same as a regular array, except that the number
> >> +	of elements as reported by the ``elems`` field is between 1 and
> >> +	``dims[0]``. So setting the control with a differently sized
> >> +	array will change the ``elems`` field when the control is
> >> +	queried afterwards.
> > 
> > Wrong indentation.
> 
> No, it's just that the tab in front makes it look a bit weird.

I thought .rst files had to use spaces for indentation, but it seems I
was wrong.

> > Can the dimension be changed by the application only, or by the driver
> > too ? In the latter case, is an event generated ?
> 
> Interesting question. 'dims[0]' is the maximum number of elements allowed
> by the driver for this dynamic array. Applications can set the control to
> any number of elements up to that maximum. For the current use case I expect
> that this maximum reflects what the hardware supports, and is not really
> related to the video resolution. Currently the code expects the maximum
> number of elements (dims[0]) to remain constant.

The maximum should be fixed, I agree. The video resolution however
matters, as it dictates (in the DW100 case) the number of actual
elements in the control array. When changing the format, the control
value thus needs to be updated accordingly. There are multiple
strategies there. One of them would be for the driver to automatically
update the control value, most probably to a default (as there's no way
the driver could derive a new meaningful value from the old one).
Another one, which is implemented in this series, is to keep the control
as-is, but ignore its value at stream on time if it hasn't been updated
by userspace. There could be other options.

Do we want to mandate a particular strategy here, or leave it to
individual controls ?

> Technically a driver can increase dims[0] as needed. Should that be needed,
> then we probably need an event to signal that.
> 
> > Considering this in the context of this series, the driver needs to
> > change the dimension, as the use case is to size the control based on
> > the image size. Do we want to document here that the driver will reset
> > the control to a default value when the dimension changes, or is that
> > something that should be control-specific ?
> 
> As mentioned above, in the current context the maximum number of allowed
> elements in a dynamic array is fixed, so this issue does not occur.
> 
> >>  
> >>  Return Value
> >>  ============
> >> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> >> index 3768a0a80830..8df13defde75 100644
> >> --- a/include/uapi/linux/videodev2.h
> >> +++ b/include/uapi/linux/videodev2.h
> >> @@ -1886,6 +1886,7 @@ struct v4l2_querymenu {
> >>  #define V4L2_CTRL_FLAG_HAS_PAYLOAD	0x0100
> >>  #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
> >>  #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
> >> +#define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
> >>  
> >>  /*  Query flags, to be ORed with the control ID */
> >>  #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000

-- 
Regards,

Laurent Pinchart
