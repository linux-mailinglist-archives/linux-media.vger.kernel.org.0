Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7835E8EF21
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 17:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732585AbfHOPP3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 11:15:29 -0400
Received: from mga17.intel.com ([192.55.52.151]:23633 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732578AbfHOPP2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 11:15:28 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 08:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; 
   d="scan'208";a="201239857"
Received: from mschitte-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.252.37.7])
  by fmsmga004.fm.intel.com with ESMTP; 15 Aug 2019 08:15:26 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id A3E3A21E6F; Thu, 15 Aug 2019 18:12:31 +0300 (EEST)
Date:   Thu, 15 Aug 2019 18:12:31 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 2/5] media: v4l2-ctrl: Document V4L2_CID_LOCATION
Message-ID: <20190815151231.GA6012@kekkonen.localdomain>
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
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Aug 15, 2019 at 04:40:03PM +0200, Hans Verkuil wrote:
> On 8/15/19 4:34 PM, Jacopo Mondi wrote:
> > Hi Hans,
> > 
> > On Thu, Aug 15, 2019 at 04:14:38PM +0200, Hans Verkuil wrote:
> >> On 8/15/19 4:10 PM, Hans Verkuil wrote:
> >>> On 8/15/19 12:43 AM, Laurent Pinchart wrote:
> >>>> Hi Jacopo,
> >>>>
> >>>> Thank you for the patch.
> >>>>
> >>>> On Wed, Aug 14, 2019 at 10:28:12PM +0200, Jacopo Mondi wrote:
> >>>>> Add documentation for the V4L2_CID_LOCATION camera control. The newly
> >>>>> added read-only control reports the camera device mounting position.
> >>>>>
> >>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>>>> ---
> >>>>>  .../media/uapi/v4l/ext-ctrls-camera.rst       | 23 +++++++++++++++++++
> >>>>>  1 file changed, 23 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> >>>>> index 51c1d5c9eb00..fc0a02eee6d4 100644
> >>>>> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> >>>>> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
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

When the camera points to another direction than directly away from the
surface, then we need another property to describe that. Location tells
where the camera is... well, located. :-)

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
