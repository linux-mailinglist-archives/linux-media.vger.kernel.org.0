Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46AD36EC23
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 16:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237314AbhD2OKX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 10:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233602AbhD2OKX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 10:10:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD6AC06138B
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 07:09:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D876E70;
        Thu, 29 Apr 2021 16:09:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619705372;
        bh=OZwGB5rAIXjNubZefMV6t7iZpSTCeD3PIc7tOMlkqMg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dpnJCOBY6vIR8tjcIZ+cQJUhJBDmPV+xCKRlIlZbUasEgaHy1k6ADkvKjrE77vYSx
         qOiMIeGsU1u8AYki5aR7+jGqafdZlt1KMnNkqzqskFxEcxOhPCIYb2YizCMMcMYAlH
         00t5HTcu7FLZgnBM1WoOnBUO8Y+srQAFNQWHQnQk=
Date:   Thu, 29 Apr 2021 17:09:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 15/24] v4l: Add bus type to frame descriptors
Message-ID: <YIq+FlDs7T+5FjCN@pendragon.ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-16-tomi.valkeinen@ideasonboard.com>
 <YHyHN2hWN1Hb3Gv1@pendragon.ideasonboard.com>
 <20210420115050.GO3@paasikivi.fi.intel.com>
 <2f39d7b6-ccc4-1afb-d8b2-6e0d44a311b0@ideasonboard.com>
 <20210429115811.GV3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210429115811.GV3@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Apr 29, 2021 at 02:58:11PM +0300, Sakari Ailus wrote:
> On Thu, Apr 22, 2021 at 03:30:55PM +0300, Tomi Valkeinen wrote:
> > On 20/04/2021 14:50, Sakari Ailus wrote:
> > > On Sun, Apr 18, 2021 at 10:23:35PM +0300, Laurent Pinchart wrote:
> > > > On Thu, Apr 15, 2021 at 04:04:41PM +0300, Tomi Valkeinen wrote:
> > > > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > 
> > > > > Add the media bus type to the frame descriptor. CSI-2 specific
> > > > > information will be added in next patch to the frame descriptor.
> > > > 
> > > > I'd squash the next patch with this one.
> > > > 
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > > 
> > > > > - Make the bus type a named enum
> > > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > > ---
> > > > >   include/media/v4l2-subdev.h | 9 +++++++++
> > > > >   1 file changed, 9 insertions(+)
> > > > > 
> > > > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > > > index d0e9a5bdb08b..85977abbea46 100644
> > > > > --- a/include/media/v4l2-subdev.h
> > > > > +++ b/include/media/v4l2-subdev.h
> > > > > @@ -340,12 +340,21 @@ struct v4l2_mbus_frame_desc_entry {
> > > > >   #define V4L2_FRAME_DESC_ENTRY_MAX	4
> > > > > +enum v4l2_mbus_frame_desc_type {
> > > > > +	V4L2_MBUS_FRAME_DESC_TYPE_PLATFORM,
> > > > > +	V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL,
> > > > > +	V4L2_MBUS_FRAME_DESC_TYPE_CCP2,
> > > > > +	V4L2_MBUS_FRAME_DESC_TYPE_CSI2,
> > > > > +};
> > > > 
> > > > This should be documented. In particular, I have no idea what
> > > > V4L2_MBUS_FRAME_DESC_TYPE_PLATFORM is. I also wonder if we shouldn't
> > > > drop CCP2 (at least for now), does anyone use that anymore ?
> > > 
> > > I guess we don't need one here, not now at least.
> > > 
> > > I agree on the documentation.
> > 
> > As it's the first one in the list, I think it really means "undefined", so
> > that current users have a value there (I presume they initialize the struct
> > to 0). Sakari?
> 
> I guess you could drop PLATFORM if there's no need for it now. In practice
> PARALLEL is probably a good choice.

Works for me too.

-- 
Regards,

Laurent Pinchart
