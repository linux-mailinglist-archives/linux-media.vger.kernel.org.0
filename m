Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70EFC4ACA87
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 21:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbiBGUrr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 15:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243021AbiBGUbS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 15:31:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650D8C0401DA
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 12:31:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28666340;
        Mon,  7 Feb 2022 21:31:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644265874;
        bh=m+T8ZeGP6pS8ivz6cL7kRFi55RAyw7JyFxABP7qbBQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PMshpmJweTyBaAcN4Nap1X/vYRDRAEv1tzwBtA+2VTOTk29ByjvLFPAC2qrO9XzEo
         wvt7G3TkSTA1jkzLZaTpS9U5pGGAOh0eFjNk98K3bLPeEnLIpgbWQ/P4eicx1QuqGc
         BV847QMLPa5wYx/CwQQDUoLv67sjzu1NNqxaoX6o=
Date:   Mon, 7 Feb 2022 22:31:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 6/6] media: Documentation: add documentation about
 subdev state
Message-ID: <YgGBkM006oq38H9U@pendragon.ideasonboard.com>
References: <20211217135022.364954-1-tomi.valkeinen@ideasonboard.com>
 <20211217135022.364954-7-tomi.valkeinen@ideasonboard.com>
 <YcDDzzX3XNlE/K05@paasikivi.fi.intel.com>
 <YcGSG8PHXNHa7VKv@pendragon.ideasonboard.com>
 <YcGsDvZK9AIuitsA@paasikivi.fi.intel.com>
 <YcGtimscb6edlqys@pendragon.ideasonboard.com>
 <YcG2EGCw6b9X2dLr@paasikivi.fi.intel.com>
 <YcJqklqTlwghqn8P@pendragon.ideasonboard.com>
 <27b84528-e2ae-2f6a-53bd-481ded10ad02@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27b84528-e2ae-2f6a-53bd-481ded10ad02@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Feb 07, 2022 at 11:19:23AM +0200, Tomi Valkeinen wrote:
> On 22/12/2021 02:00, Laurent Pinchart wrote:
> 
> >>>>>>> +:c:func:`v4l2_subdev_lock_state()`. The driver must then call
> >>>>>>> +:c:func:`v4l2_subdev_unlock_state()` to unlock the state when done.
> >>>>>>> +
> >>>>>>> +Operations that do not receive a state parameter implicitly operate on the
> >>>>>>> +subdevice active state, which drivers can exclusively access by
> >>>>>>> +calling :c:func:`v4l2_subdev_lock_active_state()`. The sub-device active state
> >>>>>>> +must equally be released by calling :c:func:`v4l2_subdev_unlock_state()`.
> >>>>>>> +
> >>>>>>> +Drivers must never manually access the state stored in the :c:type:`v4l2_subdev`
> >>>>>>> +or in the file-handle without going through the designated helpers.
> >>>>>>
> >>>>>> Have you thought how this will interact with controls?
> >>>>>>
> >>>>>> Generally active state information exists for a device in struct
> >>>>>> v4l2_subdev_state as well as the device's control handler as control
> >>>>>> values. Controls have dependencies to other state information (active and
> >>>>>> try).
> >>>>>>
> >>>>>> Until now, drivers have been responsible for serialising access to this
> >>>>>> state on their own, mostly using a single mutex. Controls require a mutex
> >>>>>> as well, but it's the same mutex independently of whether a driver is
> >>>>>> dealing with active or try subdev state.
> >>>>>>
> >>>>>> In other words, if the above is assumed, when you're dealing with try state
> >>>>>> that has dependencies to controls, you have to hold both that try state's
> >>>>>> mutex as well as the control handler's mutex.
> >>>>>
> >>>>> Going forward, I think we should store the controls in the subdev state.
> >>>>> That will require a uAPI extension to pass a `which` parameter to the
> >>>>> control ioctls, and deprecated the control TRY ioctl on subdevs.
> >>>>> Interactions between controls and pad formats will be easier to test, as
> >>>>> applications will be able to set controls in the TRY state, interacting
> >>>>> with the TRY formats. We will also need to rework the control handler
> >>>>> operations to split .s_ctrl() in two, with one function to adjust a
> >>>>> control value and one function to apply it.
> >>>>>
> >>>>> In the meantime, I think we'll need to acquire both locks, or possibly
> >>>>> use the active state lock as the control handler lock.
> >>>>
> >>>> Note that also trying controls requires locking the control handler,
> >>>> meaning that the control handler's mutex may not be the same as the active
> >>>> state mutex (unless access also to try state is serialised using the same
> >>>> mutex).
> >>>>
> >>>> What I'm saying is that to make this better usable with controls, changes
> >>>> will be needed somewhere as the locking scheme is a poor match with that of
> >>>> controls currently. Just saying the mutexes are acquired in a certain
> >>>> order and pushing the problem to drivers is not a great solution.
> >>>
> >>> Could you maybe provide an example of existing subdev driver code that
> >>> showcases this issue ? I'm not sure we really understand each other
> >>> here.
> >>
> >> Whenever you're dealing with both controls and something in the state. Also
> >> you've got a problem if the sensor driver does I²C writes to more than
> >> 8-bit registers in 8-bit chunks and relies on hardware caching some values
> >> before the entire register is updated.
> >>
> >> For instance, in the CCS driver, computing the PLL tree configuration
> >> requires state (subdev format and selection rectangles) as well as control
> >> values as input from multiple sub-devices. I suppose this is the case with
> >> many sensor drivers --- I just know CCS best.
> >>
> >> The current implementation uses a single mutex for all controls and
> >> subdevs.
> > 
> > For a single subdev, that could be done by setting
> > v4l2_ctrl_handler.lock to &v4l2_subdev.active_state->lock.
> 
> That would only cover the active state, not the try state.

That's right, but semantics of the try operation for formats and
controls are inherently different, so it's impossible to get it
completely right in any case. To really solve this, we need to move
control storage to the v4l2_subdev_state structure, and extend the
subdev control ioctls with a which field. That's out of scope for this
series.

> I made a test change by changing the subdev state to have 'struct mutex 
> _lock' and 'struct mutex *lock', similar to the struct 
> v4l2_ctrl_handler. The driver could then, in its init_cfg(), set the 
> state->lock to either v4l2_ctrl_handler.lock or a lock in the driver's 
> private data.
> 
> This kind of lock sharing makes me a bit uncomfortable (although the 
> controls are already allowing this, and a driver private mutex can be 
> set as the ctrl lock): if I call v4l2_subdev_lock_active_state(), I 
> don't expect the controls to be locked too.
> 
> Then again, if I think about this as the subdev state really containing 
> three parts: 1) the subdev active & try states, 2) controls, 3) driver 
> private data, then it kind of makes sense. In the long run we could move 
> towards combining these pieces together, and thus cleaning up the state 
> management and locking.

I'm fine with this approach as a temporary hack.

-- 
Regards,

Laurent Pinchart
