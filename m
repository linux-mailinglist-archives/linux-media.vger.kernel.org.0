Return-Path: <linux-media+bounces-38446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F32EBB11AD0
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 11:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 288DF171B0E
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 09:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6262D1929;
	Fri, 25 Jul 2025 09:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QRe8xlX1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AABE2857C6;
	Fri, 25 Jul 2025 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753435679; cv=none; b=p1eEMxiRfOOuDbdLJsyp/78hK0NN8oX8eMPCqb8UV9ZQRgjj2QWoyEE4DAotyC/FxExOZFESFp1nyz1CFNHyKrQluEtDaTso/FoCn3uIADJ7KLyTWbl7fFLdI53MjLNn271QPsp2TunmwfHcApSdPZ+9q/P+0GGcG3jF1MQJNZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753435679; c=relaxed/simple;
	bh=8nxuPO3GBI6Esz2olFnLCd25KPkJjdXvnuaE6yHt/P0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EaR+FKCSTeN+jupxGq96C594SSl5etBgTt5QSmpwE9MkMs5Zk+ebNP9pRL2m7wMlZQ8xdeFJpnWNExwdQT13OmrKgttRNxHbOuVQ96CYqeW+8h/YyOCgtGwJ/Pa+kvY65EiN8I1CJDwZwRuglmz9PaFm7vjDxlE5IQHNUzTLdX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QRe8xlX1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 35B13C0B;
	Fri, 25 Jul 2025 11:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753435634;
	bh=8nxuPO3GBI6Esz2olFnLCd25KPkJjdXvnuaE6yHt/P0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QRe8xlX1T/JyyphBO7wdyX7TV2TG8aeFCEtSvSn3nELQljXT9CfYrFd5DaQVLtcLZ
	 uz2TAvoRHWudck9KziDU4jBoF6r44toee4hBMx7Tcqhyh0SeXlAZdvb1iAYerO5/U5
	 xlJSgm97JNy97uAIDdneenHXqDgjIilxdCYWwq0I=
Date: Fri, 25 Jul 2025 12:27:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: hans@jjverkuil.nl
Cc: Julien Vuillaumier <julien.vuillaumier@nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	ribalda@chromium.org, jai.luthra@ideasonboard.com,
	laurentiu.palcu@nxp.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
	celine.laurencin@nxp.com
Subject: Re: [RFC 0/2] Add standard exposure and gain controls for multiple
 captures
Message-ID: <20250725092749.GX11202@pendragon.ideasonboard.com>
References: <20250710220544.89066-1-mirela.rabulea@nxp.com>
 <20250715235952.GE19299@pendragon.ideasonboard.com>
 <20250716001205.GG19299@pendragon.ideasonboard.com>
 <38e022d0-cc8f-4df2-8a81-69513c854035@nxp.com>
 <dddcad1a-1f0a-4ecc-8093-8a75ec24d2ec@nxp.com>
 <20250723150206.GE6719@pendragon.ideasonboard.com>
 <ae5ce461-0be5-4e00-8f6b-9c65ec6e66dc@jjverkuil.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae5ce461-0be5-4e00-8f6b-9c65ec6e66dc@jjverkuil.nl>

Hi Hans,

On Fri, Jul 25, 2025 at 11:01:11AM +0200, Hans Verkuil wrote:
> On 23/07/2025 17:02, Laurent Pinchart wrote:
> > On Tue, Jul 22, 2025 at 11:53:53AM +0200, Julien Vuillaumier wrote:
> >> On 20/07/2025 20:56, Mirela Rabulea wrote:
> >>> On 7/16/25 03:12, Laurent Pinchart wrote:
> >>>> On Wed, Jul 16, 2025 at 02:59:54AM +0300, Laurent Pinchart wrote:
> >>>>> On Fri, Jul 11, 2025 at 01:05:42AM +0300, Mirela Rabulea wrote:
> >>>>>> Add new standard controls as U32 arrays, for sensors with multiple
> >>>>>> captures: V4L2_CID_EXPOSURE_MULTI, V4L2_CID_AGAIN_MULTI and
> >>>>>> V4L2_CID_DGAIN_MULTI. These will be particularly useful for sensors
> >>>>>> that have multiple captures, but the HDR merge is done inside the 
> >>>>>> sensor,
> >>>>>> in the end exposing a single stream, but still requiring AEC control
> >>>>>> for all captures.
> >>>>>
> >>>>> It's also useful for sensors supporting DOL or DCG with HDR merge being
> >>>>> performed outside of the sensor.
> >>>>
> >>>> Regarless of where HDR merge is implemented, we will also need controls
> >>>> to select the HDR mode. We have V4L2_CID_HDR_SENSOR_MODE, which doesn't
> >>>> standardize the values, and that's not good enough. At least for DOL and
> >>>> DCG with HDR merge implemented outside of the sensor, we need to
> >>>> standardize the modes.
> >>>>
> >>>> Can you tell which sensor(s) you're working with ?
> >>>
> >>> We are working mostly with these 3:
> >>> Omnivision's os08a20 (2 exposures staggered hdr, each exposure on a 
> >>> separate virtual channel, there are also other hdr modes which we do not 
> >>> use)
> >>> Omnivision ox05b1s (RGB-Ir with context switching based on group holds, 
> >>> 1 context optimized for RGB, the other context optimized for Ir, each 
> >>> context on a different virtual channel)
> >>> Omnivision ox03c10 (4 exposures, hdr merge in sensor).
> >>>
> >>>>>> All controls are in the same class, so they could all be set
> >>>>>> atomically via VIDIOC_S_EXT_CTRLS, this could turn out to be
> >>>>>> useful in case of sensors with context switching.
> >>>>>
> >>>>> Agreed, we should be able to set them all. Are we still unable to set
> >>>>> controls from multiple classes atomatically ? I thought that limitation
> >>>>> has been lifted.
> >>>
> >>> Maybe I need some background check on this, but looking at kernel tag 
> >>> next-20250718, this comment still lies in the documentation:
> >>> "These ioctls allow the caller to get or set multiple controls
> >>> atomically. Control IDs are grouped into control classes (see
> >>> :ref:`ctrl-class`) and all controls in the control array must belong
> >>> to the same control class."
> >>>
> >>> Maybe it needs to be updated, or not...since there is also this check in 
> >>> check_ext_ctrls():
> >>>      /* Check that all controls are from the same control class. */
> >>>      for (i = 0; i < c->count; i++) {
> >>>          if (V4L2_CTRL_ID2WHICH(c->controls[i].id) != c->which) {
> >>>              c->error_idx = ioctl == VIDIOC_TRY_EXT_CTRLS ? i :
> >>>                                        c->count;
> >>>              return false;
> >>>          }
> >>>      }
> > 
> > This only when c->which is set to a control class. If you set it to
> > V4L2_CTRL_WHICH_CUR_VAL (equal to 0) then you can set (or get) controls
> > from multiple classes in one go.
> 
> That's correct. Early implementations of the control framework required
> that all controls were from the same control class, but later I dropped
> that requirement and you can just set 'which' to 0 and it no longer matters.
> 
> >>> There is also another inconvenient, the VIDIOC_S_EXT_CTRLS does not 
> >>> reach the v4l2 subdevice driver, what we get in the sensor driver is a 
> >>> set of .s_ctrl calls. I don't know about other sensors, but for the 
> >>> Omivision sensors which I am familiar with, the group holds feature 
> >>> could be used to get multiple registers to be applied atomically in the 
> >>> same frame, but the sensor driver would need to know when to start and 
> >>> when to end filling the group hold with the desired registers. If there 
> >>> is some similar feature in other sensors, I think the VIDIOC_S_EXT_CTRLS 
> >>> should have a corresponding v4l2-subdev operation, so that it can be 
> >>> implemented in the sensor subdevice driver. This would probably require 
> >>> some changes in the v4l2 core, as currently the subdev_do_ioctl() 
> >>> function does not let the VIDIOC_S_EXT_CTRLS go to the subdevice.
> >>>
> >>> Laurent, Hans, any thoughts on this?
> > 
> > I can think of at least 3 ways to handle this.
> > 
> > The first method would be to group all controls in a cluster. That way
> > you will get a single .s_ctrl() call per VIDIOC_S_EXT_CTRLS. You will
> > have to iterate over the controls to see which ones have changed, and
> > configure the sensor accordingly. This short-circuits the logic in the
> > control framework that dispatches individual controls to separate
> > .s_ctrl() calls (or rather still goes through that logic, but doesn't
> > make use of it), and requires reimplementing it manually in the
> > .s_ctrl() handler. It's not ideal.
> 
> This should work out-of-the-box.
> 
> > The second method would be to add new .begin() and .end() (name to be
> > bikeshedded) control operations. I experimented with this a while ago to
> > expose group hold to userspace, but never upstreamed the patches as I
> > didn't really need them in the end. Alternatively, the VIDIOC_S_EXT_CTRL
> > could be exposed to drivers, allowing them to implement begin/end
> > operations before and after calling the control framework. I don't have
> > a strong preference (maybe Hans would).
> 
> I wonder if you could make 'HOLD_BEGIN' and 'HOLD_END' button controls, and
> start and end the control array in VIDIOC_S_EXT_CTRLS with it. There are
> some issues that need to be figured out, but I think this is doable.

That seems needlessly complicated for userspace. Ultimately, what we
want in userspace is to set several controls in an atomic way. What
mechanism the sensor and driver use for this should be internal. As we
already have a way to set multiple controls in the V4L2 API, I don't see
a reason to introduce more userspace complexity.

> > I increasingly think that the control framework doesn't provide the best
> > value for subdevs. It has been developed for video devices, and for
> > subdevs in video-centric devices where subdevs are hidden behind a video
> > device, but not for MC-centric use cases where subdevs are exposed to
> > userspace. The third option would be to implement something better,
> > dropping the useless features and adding support for the needs of modern
> > devices, but that would be much more work.
> > 
> >>>>>> Each element of the array will hold an u32 value (exposure or gain)
> >>>>>> for one capture. The size of the array is up to the sensor driver which
> >>>>>> will implement the controls and initialize them via 
> >>>>>> v4l2_ctrl_new_custom().
> >>>>>> With this approach, the user-space will have to set valid values
> >>>>>> for all the captures represented in the array.
> >>>>>
> >>>>> I'll comment on the controls themselves in patch 2/2.
> >>>>>
> >>>>>> The v4l2-core only supports one scalar min/max/step value for the
> >>>>>> entire array, and each element is validated and adjusted to be within
> >>>>>> these bounds in v4l2_ctrl_type_op_validate(). The significance for the
> >>>>>> maximum value for the exposure control could be "the max value for the
> >>>>>> long exposure" or "the max value for the sum of all exposures". If none
> >>>>>> of these is ok, the sensor driver can adjust the values as supported and
> >>>>>> the user space can use the TRY operation to query the sensor for the
> >>>>>> minimum or maximum values.
> >>>>>
> >>>>> Hmmmm... I wonder if we would need the ability to report different
> >>>>> limits for different array elements. There may be over-engineering
> >>>>> though, my experience with libcamera is that userspace really needs
> >>>>> detailed information about those controls, and attempting to convey the
> >>>>> precise information through the kernel-userspace API is bound to fail.
> >>>>> That's why we implement a sensor database in libcamera, with information
> >>>>> about how to convert control values to real gain and exposure time.
> >>>>> Exposing (close to) raw register values and letting userspace handle the
> >>>>> rest may be better.
> >>>
> >>> Julien, any thoughts on this?
> >>
> >> Reporting min/max value per array element could have made sense for some 
> >> controls. For instance we have a HDR sensor whose long capture analog 
> 
> Actually, support for this exists. See the VIDIOC_G_EXT_CTRLS documentation
> and look for V4L2_CTRL_WHICH_DEF_VAL/V4L2_CTRL_WHICH_MIN_VAL/V4L2_CTRL_WHICH_MAX_VAL.

Ah thanks.

> >> gain range is different from the shorter captures gain. Conversely, it 
> >> may not work well for the multi-capture exposure control where the 
> >> constraint can be more about the sum of the exposures for each capture 
> >> rather than the individual exposure values. In that case, exposing 
> >> min/max values per array element does not really help the user space.
> >>
> >> Thus, having the user space to have the necessary insight into each 
> >> sensor specifics for its AEC control seems to be the versatile option.
> > 
> > Then I think we should look at a libcamera implementation alongside with
> > this patch series, and review them together.
> > 
> >>> If we don't need to report different limits for different array 
> >>> elements, we are fine, just we need to document better what those limits 
> >>> stand for in case of arrays.
> >>>
> >>>>>> Mirela Rabulea (2):
> >>>>>>    LF-15161-6: media: Add exposure and gain controls for multiple
> >>>>>>      captures
> >>>>>>    LF-15161-7: Documentation: media: Describe exposure and gain 
> >>>>>> controls
> >>>>>>      for multiple captures
> >>>>>
> >>>>> Did you forget to remove the LF-* identifiers ? :-)
> >>>
> >>> Yes, at least in the cover-letter, my bad :(
> >>>
> >>> Thanks for feedback.
> >>>
> >>>>>>   .../media/v4l/ext-ctrls-image-source.rst             | 12 ++++++++++++
> >>>>>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c            |  8 ++++++++
> >>>>>>   include/uapi/linux/v4l2-controls.h                   |  3 +++
> >>>>>>   3 files changed, 23 insertions(+)

-- 
Regards,

Laurent Pinchart

