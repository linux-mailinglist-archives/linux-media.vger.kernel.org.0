Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1F2222EEB
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 01:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbgGPXUm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 19:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726337AbgGPXUm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 19:20:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FDC6C061755
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2020 16:20:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 945522B7;
        Fri, 17 Jul 2020 01:20:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594941639;
        bh=9dZV2B19CUdnhhfz2eo1wjhNzdE8QvKiZL2p2aTVIf0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J2YjL2/I5d/Scn/8UNEfssehyhbuCn0Uac+ivIQfjm+58or771OwGmEd1dhhwEFk0
         JkNtHyxXJGX+NfTVBNQ6vtrwo7EXyxyhTfL0DNj+Br9aeFFYZ6EIvm0HQVbuXygMD8
         AtC51Mots+cgWLGNgl1S+N3+/Ny3nfRlDZawR+d0=
Date:   Fri, 17 Jul 2020 02:20:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH] imx219: selection compliance fixes
Message-ID: <20200716232031.GI5960@pendragon.ideasonboard.com>
References: <b580ac9d-5ae4-29ce-c81a-a1f98b1d953b@xs4all.nl>
 <20200714123146.5xhmslath7vqqfds@uno.localdomain>
 <20200714234938.GP5854@pendragon.ideasonboard.com>
 <20200715071954.uk4mhur6use6nson@uno.localdomain>
 <5adade02-c863-1473-8c71-65f49be5e5b3@xs4all.nl>
 <20200716125917.GA5960@pendragon.ideasonboard.com>
 <a6c1896c-583d-3b74-dd18-30c735218b98@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6c1896c-583d-3b74-dd18-30c735218b98@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jul 16, 2020 at 03:53:41PM +0200, Hans Verkuil wrote:
> On 16/07/2020 14:59, Laurent Pinchart wrote:
> > On Thu, Jul 16, 2020 at 11:48:19AM +0200, Hans Verkuil wrote:
> >> On 15/07/2020 09:19, Jacopo Mondi wrote:
> >>> On Wed, Jul 15, 2020 at 02:49:38AM +0300, Laurent Pinchart wrote:
> >>>> On Tue, Jul 14, 2020 at 02:31:46PM +0200, Jacopo Mondi wrote:
> >>>>> On Thu, Jul 02, 2020 at 03:50:04PM +0200, Hans Verkuil wrote:
> >>>>>> The top/left crop coordinates were 0, 0 instead of 8, 8 in the
> >>>>>> supported_modes array. This was a mismatch with the default values,
> >>>>>> so this is corrected. Found with v4l2-compliance.
> >>>>>>
> >>>>>> Also add V4L2_SEL_TGT_CROP_BOUNDS support: CROP_DEFAULT and CROP_BOUNDS
> >>>>>> always go together. Found with v4l2-compliance.
> >>>>>
> >>>>> I actually introduced this with
> >>>>> e6d4ef7d58aa ("media: i2c: imx219: Implement get_selection")
> >>>>>
> >>>>>>
> >>>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>>>>> ---
> >>>>>>  drivers/media/i2c/imx219.c | 17 +++++++++--------
> >>>>>>  1 file changed, 9 insertions(+), 8 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> >>>>>> index 0a546b8e466c..935e2a258ce5 100644
> >>>>>> --- a/drivers/media/i2c/imx219.c
> >>>>>> +++ b/drivers/media/i2c/imx219.c
> >>>>>> @@ -473,8 +473,8 @@ static const struct imx219_mode supported_modes[] = {
> >>>>>>  		.width = 3280,
> >>>>>>  		.height = 2464,
> >>>>>>  		.crop = {
> >>>>>> -			.left = 0,
> >>>>>> -			.top = 0,
> >>>>>> +			.left = 8,
> >>>>>> +			.top = 8,
> >>>>>
> >>>>> Mmmm, why this change ?
> >>>>> This values are used to report V4L2_SEL_TGT_CROP rectangle, which
> >>>>> according to the documentation is defined as
> >>>>> "Crop rectangle. Defines the cropped area."
> >>>>> (not a much extensive description :)
> >>
> >> Unless changed by calling S_SELECTION(TGT_CROP) the initial crop is equal
> >> to TGT_CROP_DEFAULT, and but TGT_CROP and TGT_CROP_DEFAULT shall be inside
> >> TGT_CROP_BOUNDS. CROP_BOUNDS may be larger than CROP_DEFAULT and describes
> >> the whole area from which you can crop. I.e. in the case of sensors you can
> >> set the crop rectangle to include optical blanks active pixels.
> >>
> >> In this driver the initial TGT_CROP rectangle as specified in supported_modes
> >> (aligned with the top-left pixel) was outside CROP_BOUNDS (centered) and also
> >> a mismatch with CROP_DEFAULT (also centered).
> >>
> >>>>> Clearly this is a faulty definition, and I know from experience how
> >>>>> hard is proving to define pixel array properties and in which extent
> >>>>> the documentation has to go:
> >>>>> https://lists.libcamera.org/pipermail/libcamera-devel/2020-June/009115.html
> >>>>>
> >>>>> My understanding is that target should report the current crop
> >>>>> rectangle, defined from the rectangle retrieved with the
> >>>>> V4L2_SEL_TGT_CROP_DEFAULT target, which, according documentation
> >>>>> reports the:
> >>>>> "Suggested cropping rectangle that covers the “whole picture”.
> >>>>> This includes only active pixels and excludes other non-active pixels such
> >>>>> as black pixels"
> >>>>>
> >>>>> The TGT_CROP_DEFAULT then reports the active pixel array portion, and
> >>>>> needs to be defined in respect to the TGT_NATIVE_SIZE, which reports
> >>>>> the dimensions of the whole pixel matrix, including non-active pixels,
> >>>>> optical blanks active and non-active pixels.
> >>
> >> The relationship between NATIVE_SIZE and CROP_BOUNDS is not properly defined,
> >> but I would expect that CROP_BOUNDS is inside the NATIVE_SIZE target rectangle.
> >>
> >> If NATIVE_SIZE is larger than BOUNDS, then I would expect that the additional
> >> margins are pixels that are invalid or otherwise useless.
> >>
> >> The hard rule though is that you can crop anywhere within the CROP_BOUNDS area.
> >>
> >> Historically CROP_BOUNDS originated with analog SDTV video capture where it was
> >> possible to capture more data than just the typical 720x576/480 PAL/NTSC active
> >> video area. Analog video was often overscanned, i.e. there was more video data
> >> outside the 'active' video area. That was how CRTs worked. So you could move the
> >> crop window around within the CROP_BOUNDS area, or just capture the full CROP_BOUNDS
> >> are. Although this was often poorly tested/implemented. The bttv driver is one of
> >> the few that could do this.
> >>
> >> This is actually simplified since you could do weird things with the horizontal
> >> sample rate as well, effectively changing the pixel aspect ratio, making things
> >> really complicated. It's analog video so while the video lines were discrete,
> >> horizontally you are just sampling a waveform, so you could sample at different
> >> rates if you wanted to. I doubt anyone ever used it since doing that would give
> >> you a huge headache :-)
> >>
> >> With digital video interfaces (HDMI, DVI, SDI, DP, etc.) that no longer applies and
> >> for those receivers the initial CROP/CROP_DEFAULT/CROP_BOUNDS rectangles are all
> >> the same, e.g. 1920x1080 for 1080p HDMI video.
> >>
> >>>>>
> >>>>> The TGT_CROP rectangle is hence defined from the CROP_DEFAULT one, and
> >>>>> if the 'whole active area' is selected, its top-left corner is placed
> >>>>> in position (0, 0) (what's the point of defining it in respect to an
> >>>>> area which cannot be read anyway ?)
> >>>>>
> >>>>> Unless TGT_CROP should be defined in respect to the NATIVE_SIZE
> >>>>> rectangle too, but that's not specified anywhere.
> >>>>>
> >>>>> Anyway, those selection targets badly apply to image sensors, are
> >>>>> ill-defined as the definition of active pixels, optical blank (active
> >>>>> and non-active) pixels is not provided anywhere, and it's not specified
> >>>>> anywhere what is the reference area for each of those rectangles, so I
> >>>>> might very well got them wrongly.
> >>>>
> >>>> My understanding is that both TGT_CROP_DEFAULT and TGT_CROP_BOUNDS are
> >>>> relative to TGT_NATIVE_SIZE. BOUNDS defines all the pixels that can be
> >>>
> >>> And what is TGT_CROP reference in your understanding ?
> >>
> >> That's the rectangle you are actually cropping. Initially CROP == CROP_DEFAULT
> >> and CROP shall always be inside CROP_BOUNDS. And CROP_BOUNDS shall be equal
> >> or larger than CROP_DEFAULT.
> > 
> > I think you've missed the point of Jacopo's question. He wasn't asking
> > if CROP needed to be inside CROP_BOUNDS, but what the reference was for
> > the left and top coordinates. That is, for all the crop rectangles, what
> > is the location of the (0,0) point ? Do they all refer to the same
> > location, or are they relative to each other ? This is not defined.
> 
> Ah, I misunderstood.
> 
> For analog video it was actually undefined. It could be anything, although typically
> the initial crop rectangle was at (0, 0). That meant that the larger BOUNDS area
> could be at (-8, -8).
> 
> For sensors nothing is defined at the moment, but IMHO the largest rectangle
> (i.e. TGT_NATIVE_SIZE) should be at (0, 0). I think negative top-left coordinates
> are just weird and can potentially cause signedness issues.
> 
> In any case, all target rectangles are relative to the same point since you need
> to know where the BOUNDS rectangle is within the larger NATIVE_SIZE rectangle
> (ugly name BTW), and ditto for CROP/CROP_DEFAULT within the larger CROP_BOUNDS.

That makes sense to me, having the same reference for all targets should
make it simpler. Jacopo, do you think that's good ?

> >>>> captured, including optical black and invalid pixels, while DEFAULT
> >>>> defines the active area, excluding optical black and invalida pixels. To
> >>>> put it another way, DEFAULT is what the kernel recommends applications
> >>>> to use if they have no specific requirement and/or no specific knowledge
> >>>> about the sensor.
> >>>>
> >>>> I fully agree this is very under-documented, which also means that my
> >>>> understanding may be wrong :-)
> >>>
> >>> With some consensus on this interpretation I would be happy to update
> >>> the documentation. I already considered that, but the selection API
> >>> does not apply to image sensors only, and giving a description which
> >>> is about the pixel array properties might be not totally opportune as
> >>> it would rule out other devices like bridges or muxers.
> >>
> >> And m2m devices like codecs.
> >>
> >>>>>>  			.width = 3280,
> >>>>>>  			.height = 2464
> >>>>>>  		},
> >>>>>> @@ -489,8 +489,8 @@ static const struct imx219_mode supported_modes[] = {
> >>>>>>  		.width = 1920,
> >>>>>>  		.height = 1080,
> >>>>>>  		.crop = {
> >>>>>> -			.left = 680,
> >>>>>> -			.top = 692,
> >>>>>> +			.left = 8 + 680,
> >>>>>> +			.top = 8 + 692,
> >>>>>>  			.width = 1920,
> >>>>>>  			.height = 1080
> >>>>>>  		},
> >>>>>> @@ -505,8 +505,8 @@ static const struct imx219_mode supported_modes[] = {
> >>>>>>  		.width = 1640,
> >>>>>>  		.height = 1232,
> >>>>>>  		.crop = {
> >>>>>> -			.left = 0,
> >>>>>> -			.top = 0,
> >>>>>> +			.left = 8,
> >>>>>> +			.top = 8,
> >>>>>>  			.width = 3280,
> >>>>>>  			.height = 2464
> >>>>>>  		},
> >>>>>> @@ -521,8 +521,8 @@ static const struct imx219_mode supported_modes[] = {
> >>>>>>  		.width = 640,
> >>>>>>  		.height = 480,
> >>>>>>  		.crop = {
> >>>>>> -			.left = 1000,
> >>>>>> -			.top = 752,
> >>>>>> +			.left = 8 + 1000,
> >>>>>> +			.top = 8 + 752,
> >>>>>>  			.width = 1280,
> >>>>>>  			.height = 960
> >>>>>>  		},
> >>>>>> @@ -1014,6 +1014,7 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
> >>>>>>  		return 0;
> >>>>>>
> >>>>>>  	case V4L2_SEL_TGT_CROP_DEFAULT:
> >>>>>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> >>>>>
> >>>>> Still not getting what is the purpose of two targets if the "always
> >>>>> have to go together" :)
> >>>>>
> >>>>>>  		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> >>>>>>  		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> >>>>>>  		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;

-- 
Regards,

Laurent Pinchart
