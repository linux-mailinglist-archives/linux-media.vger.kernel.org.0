Return-Path: <linux-media+bounces-38517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12499B131B9
	for <lists+linux-media@lfdr.de>; Sun, 27 Jul 2025 22:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C31A165AAF
	for <lists+linux-media@lfdr.de>; Sun, 27 Jul 2025 20:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA75230BCC;
	Sun, 27 Jul 2025 20:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L8FvRXIp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E670A22E406;
	Sun, 27 Jul 2025 20:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753648040; cv=none; b=lKMrK3rZx2FNP0UbFVgJY5rexs512lxX1BQ/SWWd8Ri4ToHOj+pz5ag2Kw482SjdC8vB5dD29Uc1sw48QKO1r6tPA7eua3CNiQM7sjXo5DkKDWE/d9rm3yOvTsMoFwnA8Bk+ztnyR38uJ+LrVH4EyfybSDSmE8tNtR7ccer9Xnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753648040; c=relaxed/simple;
	bh=hwJMRBiwVYp7oXd0l6dskolRuamIxQCJspfm4M9o+lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aovKTsS+TlyfBDObSX/oyWtI9+kctvsQqFjh65nek52XM5XPajWxz577jqVaaoWDan8fvqYdoYeXnU0O9m+T5Wnm61ETLAUXTYT8W94MKe/5F35aWjKN4hcfUC+EbrOy69x/uie9DhoIVHy2pXl4TJpCWRMepvWxOAjneDXQjjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L8FvRXIp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 88C0D55C;
	Sun, 27 Jul 2025 22:26:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753647986;
	bh=hwJMRBiwVYp7oXd0l6dskolRuamIxQCJspfm4M9o+lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L8FvRXIpvNtcDnkj2vXS60Upd5W4bC4YF7L3nIVwsWWLFOwltZ+/BCo8Q7l6VkcT+
	 xz34xWmwkb07ZSVFHBspbYcY2sKL4/x04ppbAaX4/wVUJiOg/4p+EBMdt5Zjwoi4eC
	 AT/Ouf7MBbcJozjRdDLkG2rp1DsyiYWTrhYmmyQg=
Date: Sun, 27 Jul 2025 23:27:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl, ribalda@chromium.org,
	jai.luthra@ideasonboard.com, laurentiu.palcu@nxp.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com, julien.vuillaumier@nxp.com,
	celine.laurencin@nxp.com
Subject: Re: Re: Re: [RFC 2/2] Documentation: media: Describe exposure and
 gain controls for multiple captures
Message-ID: <20250727202701.GA787@pendragon.ideasonboard.com>
References: <20250710220544.89066-1-mirela.rabulea@nxp.com>
 <20250710220544.89066-3-mirela.rabulea@nxp.com>
 <20250716000738.GF19299@pendragon.ideasonboard.com>
 <fcb87e2d-5ddf-4f33-b5f7-5af67c438af5@nxp.com>
 <20250723134942.GC6719@pendragon.ideasonboard.com>
 <e86c8543-b883-4bd3-ae21-87e7c9443957@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e86c8543-b883-4bd3-ae21-87e7c9443957@nxp.com>

Hi Mirela,

On Thu, Jul 24, 2025 at 12:33:41PM +0300, Mirela Rabulea wrote:
> On 7/23/25 16:49, Laurent Pinchart wrote:
> > On Sun, Jul 20, 2025 at 10:02:13PM +0300, Mirela Rabulea wrote:
> >> On 7/16/25 03:07, Laurent Pinchart wrote:
> >>> On Fri, Jul 11, 2025 at 01:05:44AM +0300, Mirela Rabulea wrote:
> >>>> The standard controls for exposure and gains allow a
> >>>> single value, for a single capture. For sensors with HDR
> >>>> capabilities or context switching, this is not enough, so
> >>>> add new controls that allow multiple values, one for each
> >>>> capture.
> >>>
> >>> One important question not addressed by this patch is how the new
> >>> controls interact with the old ones. For instance, if a sensor
> >>> implements 2-DOL, it should expose a V4L2_CID_EXPOSURE_MULTI control
> >>> with 2 elements. Should it also expose the V4L2_CID_EXPOSURE control,
> >>> when operating in SDR mode ? What should happen when both controls are
> >>> set ?
> >>
> >> Yes, it's a good point. I experimented with the option of implementing
> >> both, at least for backward compatibility (libcamera requires them) and
> >> kept them consistent, I mean if V4L2_CID_EXPOSURE_MULTI values change,
> >> also change V4L2_CID_EXPOSURE and viceversa, so basically keep
> >> consistent the values from V4L2_CID_EXPOSURE with the values for the
> >> first exposure from V4L2_CID_EXPOSURE_MULTI. Also, I had to check if hdr
> >> mode is not enabled, do nothing in s_ctrl for V4L2_CID_EXPOSURE_MULTI
> >> (cannot return error, as it will make __v4l2_ctrl_handler_setup fail).
> >>
> >>> There are also sensors that implement multi-exposure with direct control
> >>> of the long exposure, and indirect control of the short exposure through
> >>> an exposure ratio. The sensors I'm working on support both, so we could
> >>> just ignore the exposure ratio, but if I recall correctly CCS allows
> >>> sensors to implement exposure ratio only without direct short exposure
> >>> control. How should we deal with that ?
> >>
> >> I'm not sure I understand, but in case of indirect short exposure
> >> control I think we do not need these multiple exposure controls, we can
> >> use the existing ones, as only the value for the long exposure is
> >> needed, the driver can derive the value for the short exposure using the
> >> ratio.
> > 
> > I'm talking about sensors that implement the CCS exposure ratio, or a
> > similar mechanism. With those sensors, the long exposure time is set
> > directly, and the short exposure time is calculated by the sensor by
> > dividing the long exposure time by a ratio. The ratio is programmed by
> > the driver through a register. The ratio could be set to a fixed value,
> > but I think there are use cases for controlling it from userspace.
> 
> Sounds like we could use another control to allow userspace to control 
> the exposure ratio, let's hypothetically call it 
> V4L2_CID_EXPOSURE_RATIO? Would the ratio be a scalar number, or do you 
> think we need an array?

If we have more than two exposures we would probably need an array,
assuming the sensor can set different ratios between the long and short
exposures compared to the short and very short exposures ratio. I
haven't analyzed enough sensors to have a good enough view of the
typical configuration parameters for exposure ratios.

> While a combination of the existing V4L2_CID_EXPOSURE + a new 
> V4L2_CID_EXPOSURE_RATIO control could make an API for sensors with 
> indirect exposure control only, I am concerned that if we were to add 
> such a control, we would also need to define it's interaction with 
> V4L2_CID_EXPOSURE/V4L2_CID_EXPOSURE_MULTI, I think the logic here can 
> get complicated, especially if we begin to think also for sensors that 
> support both direct and indirect short exposure control.

I agree. This is an area where the V4L2 control framework, with its
extensive API and genericity, is counter-productive. When setting the
V4L2_CID_EXPOSURE_RATIO ratio control, the driver would likely need to
update the V4L2_CID_EXPOSURE_MULTI control. That's more work, for no
gain as userspace would really not care.

> > Some sensors support both direct control of the short exposure and
> > indirect control through a ratio, while other may support indirect
> > control only. For the sensors that support both, we could decide to only
> > expose the multi-exposure control with direct control of the short
> > exposure. For sensors that support indirect control only, we need to
> > define an API. We could possibly still use the same multi-exposure
> > control and compute the ratio internally in the driver, but there may be
> > a better option.
> 
> I think I like better the idea of using the multi-exposure control and 
> compute the ratio internally in the driver, it sounds more flexible, in 
> case different ratios are needed, maybe for sensors with more than 2 
> exposures, it saves us the trouble of adding a new ratio control 
> (possibly array) and defining it's interaction with the other controls.
> 
> For the sensors that support both direct and indirect short exposure 
> control, I like the idea of exposing only the multi controls, and let 
> the driver use what it needs from the array, depending on what routes 
> are active. But, if needed for backward compatibility with userspace 
> applications, we can have both.

Let's start with just direct exposure control then, and see where it
leads us.

> >> In some cases, this may be enough, but when direct individual
> >> control is needed for both long and short exposure, then we need the
> >> multiple exposure controls. Do you have a specific sensor example in mind?
> >> I think in the past we looked at imx708, and my understanding was that
> >> the exposure control affects only the long exposure and the sensor will
> >> automatically divide the medium and short one with the corresponding ratio:
> >> https://github.com/raspberrypi/linux/blob/rpi-6.12.y/drivers/media/i2c/imx708.c
> > 
> > The ratio seems configurable. Register 0x0220 is programmed to 0x62,
> > which selects ratio-based control of the exposure. I don't know if the
> > sensor supports direct control of the short (and very short) exposure.
> > 
> >>> Finally, I was recently wondering if it would be possible to reuse the
> >>> existing controls instead, allowing them to be either single values or
> >>> arrays. The idea would be that setting the control to a single value
> >>> (essentially ignoring it's an array) would provide the current
> >>> behaviour, while setting values for multiple elements would control the
> >>> separate exposures.
> >>
> >> You mean to divide the 32 bits value of the current controls between the
> >> multiple exposures?
> >> Just one comment here, we have encountered the ox03c10 sensor with 4
> >> exposures (that will leave only 8 bits per exposure), and the ox05b1s
> >> sensor with context switching and the exposure on 24 bits (for 2
> >> contexts, 2x24=48). So reusing current 32 bit controls  might not be
> >> enough.
> > 
> > I'm not sure the controls here should be used in the context switching
> > use case. It would be better to define a more generic mechanism that
> > supports multiple contexts for all controls.
> 
> Stream-aware controls could also do it, in case of context switching we 
> have a stream/vc per context.

It depends on the sensor, some sensors have multiple contexts but do not
output images on different virtual channels (or at least not
necessarily, it can also sometimes be configurable).

> >> Or do you mean changing the current controls type from
> >> V4L2_CTRL_TYPE_INTEGER to u32 array?
> > 
> > Yes, this is what I mean.
> > 
> >> Would that not cause issues with
> >> applications already using current controls?
> > 
> > That would only work if the kernel could handle some type of backward
> > compatibility, doing the right thing when userspace sets the control to
> > a single value (as opposed to an array of values). That's probably not
> > very realistic, as the control would enumerate as a compound control,
> > and that may break existing userspace.
> > 
> > Another option would be to change the control type at runtime based on
> > whether or not HDR is enabled, but that also sounds like it will cause
> > lots of issue.
> 
> Let me know if you think it is worth investigating any of these paths 
> (control as single&array or change control type at runtime).

I don't think that's needed. Let's stick to the new MULTI controls, and
see how they work in sensor drivers and in libcamera.

> >>> I haven't checked if the control framework supports
> >>> this, or if it could be supported with minimum changes. The advantage is
> >>> that we wouldn't need to define how the new and old controls interact if
> >>> we don't introduce new controls.
> >>
> >> I think the same advantage will be achieved with stream-aware controls
> >> (no new controls, also the min/max/def semantics remain clear), but
> >> there is the issue we do not have streams if the sensor does internally
> >> the hdr merge. Does it sound any better to introduce some fake streams
> >> or pads that are not associated with any pixel stream, but just to allow
> >> multiple exposure control?
> > 
> > That also sounds like quite a bit of complexity for little gain. It
> 
> What sounds like complexity, stream-aware controls or fake streams/pads?

The fake streams. Per-stream controls also add complexity, but are in my
opinion still potentially worth the complexity. Adding fake streams and
internal pads seems cumbersome. But maybe I'm worrying too much, if you
think it's worth investigating, we could look at how it translates to
patches (for both kernel and userspace).

> > seems that new controls are the best option. There are still a few
> > issues to solve:
> > 
> > - Should sensors that support multi-exposure (or gains) implement
> >    V4L2_CID_EXPOSURE for backward compatibility, or only
> >    V4L2_CID_EXPOSURE_MULTI ? If both are implemented, how should the two
> >    controls interact ?
> 
> I think sensor developer's life would be simpler with only 
> V4L2_CID_EXPOSURE_MULTI, it would have been ideal if V4L2_CID_EXPOSURE 
> was an array in the first place.

Give me a time machine please, there are so many things I'd like to
change in V4L2 :-)

> For backward compatibility though, which is an important practical 
> aspect, we can allow both V4L2_CID_EXPOSURE and V4L2_CID_EXPOSURE_MULTI, 
> with the mention that V4L2_CID_EXPOSURE, when used,it has clear effects 
> on the first (longest?) exposure, but may have undefined behavior for 
> the other exposures (a default ratio could be applied by the driver, or 
> a default or previous exposure could be set). On the other hand, 
> V4L2_CID_EXPOSURE_MULTI has clear effects on all exposures and would 
> recommended it to be used in case of multiple captures.

From a very selfish point of view, considering libcamera, I wouldn't
mind camera sensors that only expose V4L2_CID_EXPOSURE_MULTI without
V4L2_CID_EXPOSURE. They will work all fine (once support for
V4L2_CID_EXPOSURE_MULTI will be merged in libcamera, of course), even in
the non-HDR case.

On the other hand, some people may object to all the rest of userspace
having to be updated to support new sensor drivers. If we want to
support V4L2_CID_EXPOSURE, I think we can restrict the control to
operating only when HDR is disabled (an HDR-unaware userspace should
never enable HDR in the first place, and wouldn't work if it's enabled
anyway), and define V4L2_CID_EXPOSURE_MULTI as having priority over
V4L2_CID_EXPOSURE, and setting V4L2_CID_EXPOSURE to the first array
value. We can also adapt this behaviour to ease the implementation.

Note that I think this should be implemented in a helper (possibly in the
control handler core ?), HDR-aware drivers should deal with
V4L2_CID_EXPOSURE_MULTI, and the V4L2_CID_EXPOSURE control should be
created by the helper, and fully handled by it. Otherwise we'll make
drivers more complex, and open the door to variations in behaviour
between different drivers.

> > - How do we handle ratio-based exposure control ?
> 
> For ratio-based exposure control, I'm thinking it is better to use 
> V4L2_CID_EXPOSURE_MULTI for both direct and indirect short exposure 
> control. Let the driver calculate the ratio, and there can be n-1 ratios 
> (n=number of exposures). This would save us the troubles to define and 
> manage the interaction of a ratio control with the exposure controls.

Ack.

> > - In which order are the exposures (and gains) stored in the array ?
> 
> With the os08a20 in mind, I would propose from the longest to the 
> shortest (when the sensor operates in non-hdr mode, only the long 
> exposure registers are used, that is the first and only exposure).

Ack.

> Well, these are my opinions, more or less justified, I would like to 
> hear your opinion further, as well as anyone's else.
> 
> >> BTW, Jay, what are your plans around the stream-aware controls?
> >>
> >> Thanks again for feedback, Laurent!
> >>
> >>> Hans, what do you think ?
> >>
> >> Same question from me ;)
> >>
> >>>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> >>>> ---
> >>>>    .../media/v4l/ext-ctrls-image-source.rst             | 12 ++++++++++++
> >>>>    1 file changed, 12 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> >>>> index 71f23f131f97..6efdb58dacf5 100644
> >>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> >>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> >>>> @@ -92,3 +92,15 @@ Image Source Control IDs
> >>>>        representing a gain of exactly 1.0. For example, if this default value
> >>>>        is reported as being (say) 128, then a value of 192 would represent
> >>>>        a gain of exactly 1.5.
> >>>> +
> >>>> +``V4L2_CID_EXPOSURE_MULTI (__u32 array)``
> >>>> +    Same as V4L2_CID_EXPOSURE, but for multiple exposure sensors. Each
> >>>> +    element of the array holds the exposure value for one capture.
> >>>> +
> >>>> +``V4L2_CID_AGAIN_MULTI (__u32 array)``
> >>>> +    Same as V4L2_CID_ANALOGUE_GAIN, but for multiple exposure sensors. Each
> >>>> +    element of the array holds the analog gain value for one capture.
> >>>> +
> >>>> +``V4L2_CID_DGAIN_MULTI (__u32 array)``
> >>>> +    Same as V4L2_CID_DIGITAL_GAIN, but for multiple exposure sensors. Each
> >>>> +    element of the array holds the digital gain value for one capture.

-- 
Regards,

Laurent Pinchart

