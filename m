Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975CC1D2C45
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 12:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgENKNc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 06:13:32 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:52475 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgENKNc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 06:13:32 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 902F2FF808;
        Thu, 14 May 2020 10:13:27 +0000 (UTC)
Date:   Thu, 14 May 2020 12:16:43 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/6] media: v4l2-subdev: Deprecate g_mbus_config video
 op
Message-ID: <20200514101643.6a4xqhdiegukmltk@uno.localdomain>
References: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
 <20200415105004.2497356-3-jacopo+renesas@jmondi.org>
 <20200420014846.GB15673@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200420014846.GB15673@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Hans, Sakari

On Mon, Apr 20, 2020 at 04:48:46AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Wed, Apr 15, 2020 at 12:49:59PM +0200, Jacopo Mondi wrote:
> > Deprecate 'g_mbus_config' video operation in favor of the newly
> > introduced 'get_mbus_config' pad operation.
> >
> > Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Not necessarily a blocker for this series, but it would be nice to
> convert the handful of users of this API (you can leave soc-camera
> untouched as it's on its way out of the kernel).

I'm trying to, but I'm having an hard time fixing the new operations
semantic, specifically on set_mbus_config, as if I have to deprecate
the existing users, a replacement for s_mbus_config is required.

In particular, the old API seems to work as follows:
1) Report all supported config options through g_mbus_config
2) Apply the requested ones (assumed to be in the set of configurable
ones) though s_mbus_config.

There is no mention of how to treat unsupported configuration
parameters, no mention of how handle configuration errors, if
s_mbus_config should behave like set_fmt (update the received
configuration to reflect the current status and don't fail if the
configuration cannot be applied).

The new operation has a different semantic (which still has to be
defined) particularly:
1) get_mbus_config() reports the -current- media bus configuration, not the
list of supported options that could be tweaked.
2) set_mbus_config() has the following behavior specified:
  - Do not fail if received config is unsupported, update it to
    reflect the current configuration
  - Apply changes to the supported configuration options, ignore the
    non supported one, but do not fail.

I'm still trying to understand if a new set_mbus_config() is actually
welcome or not, but apart from this, I think porting existing users to
the new API, even if it could be made to compile successfully will
change quite some behaviour, and honestly I'm not sure we want to go
that way, or keep both the existing operations and only deprecate the
existing one in the documentation.

For reference ov6650.c is the only mainline user of s_mbus_config I
can see as well pxa_camera is the only platform driver using
g_mbus_config. Porting both to the new API would require testing I
cannot perform probably, or would you be ok with just compile testing
it ?

Thanks
   j

>
> > ---
> >  include/media/v4l2-subdev.h | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index d1a5e9d1ea63..9bf14c41626d 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -466,7 +466,9 @@ struct v4l2_mbus_pad_config {
> >   *
> >   * @query_dv_timings: callback for VIDIOC_QUERY_DV_TIMINGS() ioctl handler code.
> >   *
> > - * @g_mbus_config: get supported mediabus configurations
> > + * @g_mbus_config: get supported mediabus configurations. This operation is
> > + *		   deprecated in favour of the get_mbus_config() pad operation
> > + *		   and should not be used by new software.
> >   *
> >   * @s_mbus_config: set a certain mediabus configuration. This operation is added
> >   *	for compatibility with soc-camera drivers and should not be used by new
>
> --
> Regards,
>
> Laurent Pinchart
