Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8883A4ADA
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2019 19:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729061AbfIARZB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Sep 2019 13:25:01 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:39401 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbfIARZA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Sep 2019 13:25:00 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id B003281716; Sun,  1 Sep 2019 19:24:44 +0200 (CEST)
Date:   Sun, 1 Sep 2019 19:24:57 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 2/5] media: v4l2-ctrl: Document V4L2_CID_LOCATION
Message-ID: <20190901172457.GC1047@bug>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-3-jacopo@jmondi.org>
 <20190814224340.GD5015@pendragon.ideasonboard.com>
 <664fe7b3-9051-30da-736e-710a4e9cecde@xs4all.nl>
 <d60e4664-3a3f-1723-6c96-4fc822b6a7bb@xs4all.nl>
 <20190815143423.vaoswb4jvzd2blxp@uno.localdomain>
 <cb36e8a0-b941-ff37-e58c-0f9b7f62116a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb36e8a0-b941-ff37-e58c-0f9b7f62116a@xs4all.nl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

> >>>>> @@ -510,6 +510,29 @@ enum v4l2_scene_mode -
> >>>>>      value down. A value of zero stops the motion if one is in progress
> >>>>>      and has no effect otherwise.
> >>>>>
> >>>>> +``V4L2_CID_LOCATION (integer)``
> >>>>
> >>>> Maybe V4L2_CID_CAMERA_SENSOR_LOCATION ? Same for the values below.
> >>>
> >>> Probably a better name, if a bit long. But we might need other location
> >>> controls in the future (e.g. flash location), so CID_LOCATION is just too
> >>> generic.
> >>
> > 
> > Thanks for the feedback.
> > 
> >> Note that the location defines themselves can most likely be used with any
> >> LOCATION control, so V4L2_LOCATION_FRONT would be fine with any control.
> >>
> > 
> > What do you think instead of the control type? Would a single integer
> > control do or an integer menu one would be better? I see merit in both
> > proposals actually...
> 
> Single integer. It's read-only, so it just reports the location.
> 
> It would be different if this was a writable control: then you need to
> know which locations are possible to set, and that requires a menu type.
> 
> But it doesn't make sense to set the location from software. However, the
> location might change as a result of other changes: e.g. if the camera
> has motor control of the tilt and the tilt changes from forward facing to
> downward facing, then the driver might change the location from FRONT
> to DOWN. A convoluted example perhaps, but this is just brainstorming.

There are phones with exactly such camera setup. And yes, it makes sense to be writable
in that case, as software can move the camera in such case.

										Pavel
