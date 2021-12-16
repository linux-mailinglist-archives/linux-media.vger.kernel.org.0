Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 862AD4774F3
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 15:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234962AbhLPOuI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 09:50:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbhLPOuI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 09:50:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA997C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Dec 2021 06:50:07 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B06773F6;
        Thu, 16 Dec 2021 15:50:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639666204;
        bh=VPViw9qOTEE3KHCAytU7mcJVcdHGY4HZ+0aYgb+K5wM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GROrdfhIbrGBSCn/iVwN+qounV3s4e7uOwQPATtzKJdEH613mLpU74yHOswjhThNR
         oSzAIumYq8kj9hMSTI4UQH4TbWy6/jj0AmCLy4P2jeF86I+1YVnuAuuqzUimzBSG0Z
         qF4/oEWvxSEmxjZXbq9pKtZVRKTlQ1038FpO6c5Y=
Date:   Thu, 16 Dec 2021 16:50:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v10 06/38] media: Documentation: add documentation about
 subdev state
Message-ID: <YbtSGqS/Yn+B1a1v@pendragon.ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-7-tomi.valkeinen@ideasonboard.com>
 <20211214083151.ipksg4fwxuu6u2ow@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211214083151.ipksg4fwxuu6u2ow@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Tue, Dec 14, 2021 at 09:31:51AM +0100, Jacopo Mondi wrote:
> On Tue, Nov 30, 2021 at 04:15:04PM +0200, Tomi Valkeinen wrote:
> > Add documentation about centrally managed subdev state.
> >
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  .../driver-api/media/v4l2-subdev.rst          | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> > index 7736da077fb8..db012729f8e3 100644
> > --- a/Documentation/driver-api/media/v4l2-subdev.rst
> > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> > @@ -518,6 +518,34 @@ The :c:func:`v4l2_i2c_new_subdev` function will call
> >  :c:type:`i2c_board_info` structure using the ``client_type`` and the
> >  ``addr`` to fill it.
> >
> > +Centrally managed subdev active state
> > +-------------------------------------
> > +
> > +Traditionally V4L2 subdev drivers maintained internal state for the active
> > +configuration for the subdev. This is often implemented as an array of struct
> > +v4l2_mbus_framefmt, one entry for each pad.
> 
> Not only v4l2_mbus_framefmt, but the 'active' configuration also
> contains cropping rectangles. I would drop the last statement maybe ?
> 
> > +
> > +In addition to the active configuration, each subdev filehandle has an array of
> > +struct v4l2_subdev_pad_config, managed by V4L2 core, which contains the TRY
> > +configuration.
> > +
> > +To simplify the subdev drivers the V4L2 subdev API now optionally supports a
> > +centrally managed active configuration. A subdev driver must use
> 
> I would here explain what active and try states are and where they
> live.
> 
> "a centrally managed active configuration represented by
> :c:type:`v4l2_subdev_state`. One instance of state, which contains
> the active device configuration, is associated with the sub-device itself as
> part of the :c:type:`v4l2_subdev` structure, while the core associates to
> each open file handle a try state, which contains the configuration
> valid in the file-handle context only."
> 
> > +v4l2_subdev_init_finalize() to initialize the active state between calls to
> > +media_entity_pads_init() and v4l2_*_register_subdev(), and must call
> > +v4l2_subdev_cleanup() to free the state.
> 
> "Sub-device drivers can opt-in and use state to manage their active
> configuration by initializing the subdevice state with a call to
> v4l2_subdev_init_finalize() as the last operation before registering
> the sub-device. They must also call v4l2_subdev_cleanup() to release
> all the acquired resources before unregistering the sub-device. The
> core automatically initializes a state for each open file handle where
> to store the try configurations and releases them at file handle
> closing time."
> 
> > +
> > +The active state must be locked before access, and that can be done with
> > +v4l2_subdev_lock_state() or v4l2_subdev_lock_active_state().
> 
> I would also explain which state to use and when.
> 
> "V4L2 sub-device operations that operates on both the :ref:`ACTIVE and

s/operates/operate/

> TRY formats <v4l2-subdev-format-whence>` receive by the core the

s/by the/from the/ (or just s/by the core //)

> correct state to operate on an operation parameter. The sub-device driver
> can access and modify the configuration stored in the provided state
> after having exclusively acquired it by calling

s/exclusively acquired/locked/

> :c:func:`v4l2_subdev_lock_state()` and released it with
> :c:func:`v4l2_subdev_unlock_state()` when done.

"The driver must then call :c:func:`v4l2_subdev_unlock_state()` to
unlock the state when done."

> Operations that do not receive a state parameter implicitly operates
> on the subdevice active state, which drivers can exclusively access by
> calling :c:func:`v4l2_subdev_lock_active_state()`. The sub-device active
> state should equally be released by calling
> :c:func:`v4l2_subdev_unlock_state()`.
> 
> In no occasions driver should try to manually access the state stored
> in the :c:type`v4l2_subdev` or in the file handle without going
> through the designated helpers".
> 
> > +
> > +The V4L2 core will pass either the TRY or ACTIVE state to various subdev ops.
> > +Unfortunately not all the subdev drivers comply with this yet, and may pass
> 
> If I'm not mistaken it's not the subdev drivers but the top drivers
> which might not comply.
> 
> > +NULL for the ACTIVE case. This is only a problem for subdev drivers which use
> > +the centrally managed active state and are used in media pipelines with older
> > +subdev drivers. In these cases the called subdev ops must also handle the NULL
> > +case. This can be easily managed by the use of
> > +v4l2_subdev_validate_and_lock_state() helper.
> 
> depending on the previous suggestion to fail hard if !state, this
> might be removed ?

Or expanded with a note that this option is only possible when
transitioning existing subdev drivers, and that the function will
eventually be removed. And maybe that it prints a warning, and that host
drivers must be converted as a result.

Otherwise this looks good to me.

On a side note, I think we should prepare to allow subdev drivers to
subclass the state structure at some point :-)

> > +
> >  V4L2 sub-device functions and data structures
> >  ---------------------------------------------
> >

-- 
Regards,

Laurent Pinchart
