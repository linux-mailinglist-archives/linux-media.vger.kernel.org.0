Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B68847BBF6
	for <lists+linux-media@lfdr.de>; Tue, 21 Dec 2021 09:36:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235699AbhLUIgs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 03:36:48 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35536 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235700AbhLUIgr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 03:36:47 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 486D3881;
        Tue, 21 Dec 2021 09:36:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1640075806;
        bh=V8NTf7uoNGHTNLgiDojCJZxI5r3g2oA0NrFUp76JbyM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tZGNjiXDaTDU4mnQ0q+H9mKcp5MUXJ6KYOrqK3PKQs6sYQE9gVI296h4bSEGgWXa1
         QPhEXqXEdsBlJkGVrY8KUVUKqmDkcuojhSL3U3PFCJ6h8Te+ArckFtkG30wO13Bb1k
         nlcqnv+1ST3yMRecyJl3OlzQXKRn22ooDbd8EutE=
Date:   Tue, 21 Dec 2021 10:36:43 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 6/6] media: Documentation: add documentation about
 subdev state
Message-ID: <YcGSG8PHXNHa7VKv@pendragon.ideasonboard.com>
References: <20211217135022.364954-1-tomi.valkeinen@ideasonboard.com>
 <20211217135022.364954-7-tomi.valkeinen@ideasonboard.com>
 <YcDDzzX3XNlE/K05@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YcDDzzX3XNlE/K05@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi Sakari,

On Mon, Dec 20, 2021 at 07:56:31PM +0200, Sakari Ailus wrote:
> Moi,
> 
> Thanks for the update.

Kiitos arvostelusta.

> On Fri, Dec 17, 2021 at 03:50:22PM +0200, Tomi Valkeinen wrote:
> > Add documentation about centrally managed subdev state.
> > 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  .../driver-api/media/v4l2-subdev.rst          | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> > 
> > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> > index 08ea2673b19e..18b00bd3d6d4 100644
> > --- a/Documentation/driver-api/media/v4l2-subdev.rst
> > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> > @@ -518,6 +518,63 @@ The :c:func:`v4l2_i2c_new_subdev` function will call
> >  :c:type:`i2c_board_info` structure using the ``client_type`` and the
> >  ``addr`` to fill it.
> >  
> > +Centrally managed subdev active state
> > +-------------------------------------
> > +
> > +Traditionally V4L2 subdev drivers maintained internal state for the active
> > +device configuration. This is often implemented e.g. as an array of
> > +struct v4l2_mbus_framefmt, one entry for each pad, and similarly for cropping
> > +and composition rectangles.

I think we usually write

s/cropping/crop/
s/composition/compose/

> > +
> > +In addition to the active configuration, each subdev file-handle has an array of

s/file-handle/file handle/ (through the whole patch)

> > +struct v4l2_subdev_pad_config, managed by V4L2 core, which contains the try
> > +configuration.
> > +
> > +To simplify the subdev drivers the V4L2 subdev API now optionally supports a
> > +centrally managed active configuration represented by
> > +:c:type:`v4l2_subdev_state`. One instance of state, which contains the active
> > +device configuration, is associated with the sub-device itself as part of

s/associated with/stored in/

> > +the :c:type:`v4l2_subdev` structure, while the core associates to each open
> > +file-handle a try state, which contains the configuration valid in the
> > +file-handle context only.

I'd write

[...] while the core associates a try state to each open file-handle, to
store the try configuration related to that file-handle.

> > +
> > +Sub-device drivers can opt-in and use state to manage their active configuration
> > +by initializing the subdevice state with a call to v4l2_subdev_init_finalize()
> > +before registering the sub-device. They must also call v4l2_subdev_cleanup()
> > +to release all the acquired resources before unregistering the sub-device.

s/acquired/allocated/

> > +The core automatically initializes a state for each open file-handle where to

s/initializes/allocates and initializes/
s/where to/to/

> > +store the try configurations and releases them at file-handle closing time.

s/releases it at file-handle closing time/frees it when closing the file handle/

> > +
> > +V4L2 sub-device operations that use both the :ref:`ACTIVE and TRY formats
> > +<v4l2-subdev-format-whence>` receive the correct state to operate on as a

s/as a/through the/

> > +'state' parameter. The sub-device driver can access and modify the
> > +configuration stored in the provided state after having locked it by calling

s/locked it/locked the state/

> > +:c:func:`v4l2_subdev_lock_state()`. The driver must then call
> > +:c:func:`v4l2_subdev_unlock_state()` to unlock the state when done.
> > +
> > +Operations that do not receive a state parameter implicitly operate on the
> > +subdevice active state, which drivers can exclusively access by
> > +calling :c:func:`v4l2_subdev_lock_active_state()`. The sub-device active state
> > +must equally be released by calling :c:func:`v4l2_subdev_unlock_state()`.
> > +
> > +Drivers must never manually access the state stored in the :c:type:`v4l2_subdev`
> > +or in the file-handle without going through the designated helpers.
> 
> Have you thought how this will interact with controls?
> 
> Generally active state information exists for a device in struct
> v4l2_subdev_state as well as the device's control handler as control
> values. Controls have dependencies to other state information (active and
> try).
> 
> Until now, drivers have been responsible for serialising access to this
> state on their own, mostly using a single mutex. Controls require a mutex
> as well, but it's the same mutex independently of whether a driver is
> dealing with active or try subdev state.
> 
> In other words, if the above is assumed, when you're dealing with try state
> that has dependencies to controls, you have to hold both that try state's
> mutex as well as the control handler's mutex.

Going forward, I think we should store the controls in the subdev state.
That will require a uAPI extension to pass a `which` parameter to the
control ioctls, and deprecated the control TRY ioctl on subdevs.
Interactions between controls and pad formats will be easier to test, as
applications will be able to set controls in the TRY state, interacting
with the TRY formats. We will also need to rework the control handler
operations to split .s_ctrl() in two, with one function to adjust a
control value and one function to apply it.

In the meantime, I think we'll need to acquire both locks, or possibly
use the active state lock as the control handler lock.

> > +
> > +While the V4L2 core will pass the correct try- or active-state to the

s/try-/try/
s/active-/active /

> > +subdevice operations, device drivers might call operations on other
> > +subdevices by using :c:func:`v4l2_subdev_call()` kAPI and pass NULL as the
> > +state. This is only a problem for subdev drivers which use the
> > +centrally managed active-state and are used in media pipelines with older
> > +subdev drivers. In these cases the called subdev ops must also handle the NULL
> > +case. This can be easily managed by the use of
> > +:c:func:`v4l2_subdev_lock_and_return_state()` helper.

This doesn't emphasize strongly enough that this pattern should be
phased out. You could write it as follows.

While the V4L2 core passes the correct try or active state to the
subdevice operations, some existing device drivers pass a NULL state
when calling operations with :c:func:`v4l2_subdev_call()`. This legacy
construct causes issues with subdevice drivers that let the V4L2 core
manage the active state, as they expect to receive the appropriate state
as a parameter. To help the conversion of subdevice drivers to a managed
active state without having to convert all callers at the same time, the
:c:func:`v4l2_subdev_lock_and_return_state()` helper function can be
used by subdevice drivers to retrieve the active state if a NULL state
is passed to the subdevice operation.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > +
> > +:c:func:`v4l2_subdev_lock_and_return_state()` should only be used when porting
> > +an existing driver to the new state management when it cannot be guaranteed
> > +that the current callers will pass the state properly. The function prints a
> > +notice when the passed state is NULL to encourage the porting of the callers
> > +to the new state management.
> > +
> >  V4L2 sub-device functions and data structures
> >  ---------------------------------------------
> >  

-- 
Regards,

Laurent Pinchart
