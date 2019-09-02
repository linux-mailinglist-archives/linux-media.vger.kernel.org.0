Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56C80A5089
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 10:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729974AbfIBIAK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 04:00:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58266 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbfIBIAK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 04:00:10 -0400
Received: from pendragon.ideasonboard.com (231.125-247-81.adsl-dyn.isp.belgacom.be [81.247.125.231])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C978A303;
        Mon,  2 Sep 2019 10:00:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567411207;
        bh=U+9BdVklBawHPdtmd1jDm2xYgA2xb6dvC4qDJJQPuj4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TVizoMOIVAQ91Rw3rlYiZsHsYYnwHTkOuzT4MXo5mnFmEwlvJv6jVeWaSXVG6vxAD
         eoYN6fUEgo98vTplt75lwjnNW8l0uf3XatutwyxQVCNHYt7Yv95GMnPLUabENdQF8H
         OVuIGS3nheSDeXX7ioLBaeilkIxDAVH94aDirHoA=
Date:   Mon, 2 Sep 2019 11:00:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 2/5] media: v4l2-ctrl: Document V4L2_CID_LOCATION
Message-ID: <20190902080002.GC4777@pendragon.ideasonboard.com>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-3-jacopo@jmondi.org>
 <20190814224340.GD5015@pendragon.ideasonboard.com>
 <664fe7b3-9051-30da-736e-710a4e9cecde@xs4all.nl>
 <d60e4664-3a3f-1723-6c96-4fc822b6a7bb@xs4all.nl>
 <20190815143423.vaoswb4jvzd2blxp@uno.localdomain>
 <cb36e8a0-b941-ff37-e58c-0f9b7f62116a@xs4all.nl>
 <20190901172457.GC1047@bug>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190901172457.GC1047@bug>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pavel,

On Sun, Sep 01, 2019 at 07:24:57PM +0200, Pavel Machek wrote:
> >>>>>> @@ -510,6 +510,29 @@ enum v4l2_scene_mode -
> >>>>>>      value down. A value of zero stops the motion if one is in progress
> >>>>>>      and has no effect otherwise.
> >>>>>>
> >>>>>> +``V4L2_CID_LOCATION (integer)``
> >>>>>
> >>>>> Maybe V4L2_CID_CAMERA_SENSOR_LOCATION ? Same for the values below.
> >>>>
> >>>> Probably a better name, if a bit long. But we might need other location
> >>>> controls in the future (e.g. flash location), so CID_LOCATION is just too
> >>>> generic.
> >>>
> >> 
> >> Thanks for the feedback.
> >> 
> >>> Note that the location defines themselves can most likely be used with any
> >>> LOCATION control, so V4L2_LOCATION_FRONT would be fine with any control.
> >>>
> >> 
> >> What do you think instead of the control type? Would a single integer
> >> control do or an integer menu one would be better? I see merit in both
> >> proposals actually...
> > 
> > Single integer. It's read-only, so it just reports the location.
> > 
> > It would be different if this was a writable control: then you need to
> > know which locations are possible to set, and that requires a menu type.
> > 
> > But it doesn't make sense to set the location from software. However, the
> > location might change as a result of other changes: e.g. if the camera
> > has motor control of the tilt and the tilt changes from forward facing to
> > downward facing, then the driver might change the location from FRONT
> > to DOWN. A convoluted example perhaps, but this is just brainstorming.
> 
> There are phones with exactly such camera setup. And yes, it makes
> sense to be writable in that case, as software can move the camera in
> such case.

Out of curiosity, what phones are those ?

-- 
Regards,

Laurent Pinchart
