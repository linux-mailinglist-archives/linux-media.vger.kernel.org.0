Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0060439448
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 12:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232410AbhJYK6E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 06:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbhJYK6D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 06:58:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4EC3C061767
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 03:55:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 155EEE0A;
        Mon, 25 Oct 2021 12:55:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635159340;
        bh=UEq5GMgPT9eOgGtAvT5Rv+DD9SmBX91Gm41MrfhkshQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T7bfBgGwQy0VZuL81x8ApUnLMA3AuVuS8FvADuYKYkN+pjZVN/vFYutbH+31BOAp3
         o7vfkEl/ljb9FtLgzTTGT5ZlgQ/TO7yrLDMtQ1OZeRKmiJMa9jb/7etRd2/hMCUeXf
         kbq1B50BD8Dege6XB5IVNfYEyiq2zI0g+iEpHvVs=
Date:   Mon, 25 Oct 2021 13:55:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Dan Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org
Subject: Re: Userspace API for controlling the focus of the Surface Go [2]
 main/back-camera
Message-ID: <YXaNFulQvs/P0iXC@pendragon.ideasonboard.com>
References: <c7c94544-8af4-ad29-04ef-6131774e68b8@redhat.com>
 <YXaHMd3czQy0NKJn@pendragon.ideasonboard.com>
 <30ad631c-6c6e-6c1a-7b0a-d50d70a169d2@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <30ad631c-6c6e-6c1a-7b0a-d50d70a169d2@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Oct 25, 2021 at 12:47:05PM +0200, Hans Verkuil wrote:
> On 25/10/2021 12:30, Laurent Pinchart wrote:
> > On Mon, Oct 25, 2021 at 12:06:30PM +0200, Hans de Goede wrote:
> >> Hi All,
> >>
> >> With my (and Dan's) kernel patch-series to enable the back camera on
> >> the Surface Go shaping up (and hopefully going upstream soon),
> >> the next step is to enable control of the focus lens for the back
> >> camera.
> >>
> >> The focus is controlled through a separate i2c-client which is
> >> described by a 2nd I2cSerialBusV2 resource entry in the ACPI
> >> device for the ov8865 sensor. By default the kernel only instantiates
> >> an i2c-client for the first I2cSerialBusV2 resource entry for an
> >> ACPI device, getting an i2c-client for the 2nd one is easy and
> >> out of scope for this discussion.
> >>
> >> The question which I have is, assuming we have the 2nd i2c-client
> >> instantiated and we have a i2c-driver binding to it, how do we
> >> represent the focus control to userspace.
> >>
> >> I see 2 possible directions we can go here:
> >>
> >> 1. Somehow inject an extra v4l2ctrl for this into the v4l2ctrl
> >> list of the sensor. AFAIK we don't have infra for this atm, but
> >> we could add some generic mechanism to do this to the v4l2-ctrls
> >> core. IMHO from a userspace pov this is the cleanest, but at the
> >> cost of some extra work / possible ugliness on the kernel side.
> >>
> >> 2. Register a separate v4l2_subdev for the focus-ctrl and in
> >> some way provide information to userspace to which sensor this
> >> belongs.
> > 
> > The second approach is what V4L2 does already. We have a set of drivers
> > for VCMs already (search for V4L2_CID_FOCUS_ABSOLUTE in
> > drivers/media/i2c/).
> > 
> >> I believe that both are valid approaches. So before diving into
> >> this I wonder what others are thinking about this.
> >>
> >> Specific questions:
> >>
> >> 1. Hans Verkuil, what do you think about adding
> >> support for another driver to inject ctrls into the ctrl
> >> list of another v4l2(sub)dev ? Maybe something like this
> >> already exists ? If not do you think this is feasible
> >> and desirable to add ?
> >>
> >> 2. If we go with a separate v4l2_subdev, how do we communicate
> >> to which sensor the focus-control belongs to userspace ?
> > 
> > The information was initially envisioned to be conveyed to userspace
> > through the media controller API, using the entity group ID to group the
> > camera sensor, lens controller and flash controller, but the
> > media_entity_desc.group_id field is now obsolete. No other mechanism
> > exist to replace that as far as I know, so we'll have to create
> > something. There have been some talks about using a special kind of link
> > to expose the relationship between the camera sensor and other
> > components.
> 
> I thought this was implemented: there should be an interface link from the
> sensor entity to the subdev for the flash or focus control.

Interface links are only meant to link entities to interfaces, not
entities to entities. media_create_intf_link() is only called for that
purpose today.

> To my knowledge, this is all available.

To my knowledge, it isn't :-) I'd be happy to be proven wrong though.

-- 
Regards,

Laurent Pinchart
