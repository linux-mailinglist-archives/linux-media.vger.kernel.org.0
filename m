Return-Path: <linux-media+bounces-25406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B08A21DE7
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 14:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B7CF18873D3
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 13:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE78712EBE7;
	Wed, 29 Jan 2025 13:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bO1qBQiO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEEA13D503;
	Wed, 29 Jan 2025 13:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738157626; cv=none; b=aEszBT9dwwy4dAwptYiNCsFkkO+eOcYfBuViGVIQM3Wr2p/oiRb76Tqd4x0cHd2yRzy9Jdvuhd+38SuLjE6SLzeaB5mdsTE8cnsBnPkenAPSehrZOio2Qu7g6XRKZBuRxGP2bVxh8QhVsA+98YGJolhNy3ww0JD9SNpK0ul42Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738157626; c=relaxed/simple;
	bh=BznABFZ/NlB39cvM170PkIUpDQCAwzRCwLUgXe+zKvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSEqBTMIQhYzhw/fzuQU3qp4B44mjn2aaqQPqMmUNkLAWf0d0OdEk324XMByiZ0Zoi30WuUEmMdQQZNjXU0vihpzbVLYXtOlg4ZVOlsHt2f2Ef82nM65PVUUDoYqvLXc1+vtkp/K/jLbfEkDWViRPy7sYR+WaZCnGrv95BnLUBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bO1qBQiO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF532D21;
	Wed, 29 Jan 2025 14:32:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738157548;
	bh=BznABFZ/NlB39cvM170PkIUpDQCAwzRCwLUgXe+zKvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bO1qBQiOsHM6eaulPckHMq1RIo/H3TgMG4x1VgnJGURzQCcvW4n6tVxzqVzL7RaM3
	 JdBa21dVS0HiOpOGUGMdD6bCCyR5R1f5lm8ukUSPoRlaNW02qkr59WbL3TpItaanv/
	 qULX17Yz0WO2EHGFquhsSL+zwTTmPVXX9PATYZXI=
Date: Wed, 29 Jan 2025 15:33:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	mchehab@kernel.org, hverkuil-cisco@xs4all.nl, robh@kernel.org,
	krzk+dt@kernel.org, bryan.odonoghue@linaro.org,
	laurentiu.palcu@nxp.com, robert.chiras@nxp.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com,
	dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
	alain.volmat@foss.st.com, devicetree@vger.kernel.org,
	conor+dt@kernel.org, alexander.stein@ew.tq-group.com,
	umang.jain@ideasonboard.com, zhi.mao@mediatek.com, festevam@denx.de,
	julien.vuillaumier@nxp.com, alice.yuan@nxp.com
Subject: Re: Re: [PATCH v2 2/4] media: ox05b1s: Add omnivision OX05B1S raw
 sensor driver
Message-ID: <20250129133324.GB16795@pendragon.ideasonboard.com>
References: <20241126155100.1263946-1-mirela.rabulea@nxp.com>
 <20241126155100.1263946-3-mirela.rabulea@nxp.com>
 <131271d3-f3be-450f-b4e1-a7efb65362f3@redhat.com>
 <20250125001437.GA19927@pendragon.ideasonboard.com>
 <367710fc-9c66-4cf5-9059-1df00320f1f3@redhat.com>
 <20250125121832.GC1805@pendragon.ideasonboard.com>
 <1751e672-9ba1-4e8c-92bd-c7385afbe624@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1751e672-9ba1-4e8c-92bd-c7385afbe624@nxp.com>

On Tue, Jan 28, 2025 at 02:09:52PM +0200, Mirela Rabulea wrote:
> On 25.01.2025 14:18, Laurent Pinchart wrote:
> > On Sat, Jan 25, 2025 at 11:12:16AM +0100, Hans de Goede wrote:
> >> On 25-Jan-25 1:14 AM, Laurent Pinchart wrote:
> >>> On Fri, Jan 24, 2025 at 06:17:40PM +0100, Hans de Goede wrote:
> >>>> On 26-Nov-24 4:50 PM, Mirela Rabulea wrote:
> >>>>> Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor.
> >>>>>
> >>>>> The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an
> >>>>> active array size of 2592 x 1944.
> >>>>>
> >>>>> The following features are supported for OX05B1S:
> >>>>> - Manual exposure an gain control support
> >>>>> - vblank/hblank control support
> >>>>> - Supported resolution: 2592 x 1944 @ 30fps (SGRBG10)
> >>>>>
> >>>>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> >>>> Thank you for your contribution, I noticed in $subject
> >>>> that the model-nr ends in a "S" and that you describe
> >>>> this as a RGB-IR sensor.
> >>>>
> >>>> I've been working on OV01A1S support myself and one of
> >>>> the issues is how to communicate the RGB-IR color-filter
> >>>> to userspace.
> >>>>
> >>>> <snip>
> >>>>
> >>>> I see here:
> >>>>
> >>>>> +static const struct ox05b1s_sizes ox05b1s_supported_codes[] = {
> >>>>> + {
> >>>>> +         .code = MEDIA_BUS_FMT_SGRBG10_1X10,
> >>>>> +         .sizes = ox05b1s_sgrbg10_sizes,
> >>>>> + }, {
> >>>>> +         /* sentinel */
> >>>>> + }
> >>>>> +};
> >>>> That you are using MEDIA_BUS_FMT_SGRBG10_1X10, but that suggests
> >>>> this sensor is using a plain Bayer color filter which is not correct.
> >>>>
> >>>> Here is what I have come up with:
> >>>>
> >>>> diff --git a/include/linux/drm_fourcc.h b/include/linux/drm_fourcc.h
> >>>> index db679877..68ed65c5 100644
> >>>> --- a/include/linux/drm_fourcc.h
> >>>> +++ b/include/linux/drm_fourcc.h
> >>>> @@ -447,6 +447,8 @@ extern "C" {
> >>>>   #define DRM_FORMAT_SGRBG10        fourcc_code('B', 'A', '1', '0')
> >>>>   #define DRM_FORMAT_SGBRG10        fourcc_code('G', 'B', '1', '0')
> >>>>   #define DRM_FORMAT_SBGGR10        fourcc_code('B', 'G', '1', '0')
> >>>> +/* Mixed 10 bit bayer + ir pixel pattern found on Omnivision ov01a1s */
> >>>> +#define DRM_FORMAT_SIGIG_GBGR_IGIG_GRGB10 fourcc_code('O', 'V', '1', 'S')
> >>>>
> >>>>   /* 12-bit Bayer formats */
> >>>>   #define DRM_FORMAT_SRGGB12        fourcc_code('R', 'G', '1', '2')
> >>>> diff --git a/include/linux/media-bus-format.h b/include/linux/media-bus-format.h
> >>>> index b6acf8c8..e2938f0d 100644
> >>>> --- a/include/linux/media-bus-format.h
> >>>> +++ b/include/linux/media-bus-format.h
> >>>> @@ -122,7 +122,7 @@
> >>>>   #define MEDIA_BUS_FMT_YUV16_1X48          0x202a
> >>>>   #define MEDIA_BUS_FMT_UYYVYY16_0_5X48             0x202b
> >>>>
> >>>> -/* Bayer - next is        0x3025 */
> >>>> +/* Bayer - next is        0x3026 */
> >>>>   #define MEDIA_BUS_FMT_SBGGR8_1X8          0x3001
> >>>>   #define MEDIA_BUS_FMT_SGBRG8_1X8          0x3013
> >>>>   #define MEDIA_BUS_FMT_SGRBG8_1X8          0x3002
> >>>> @@ -159,6 +159,8 @@
> >>>>   #define MEDIA_BUS_FMT_SGBRG20_1X20                0x3022
> >>>>   #define MEDIA_BUS_FMT_SGRBG20_1X20                0x3023
> >>>>   #define MEDIA_BUS_FMT_SRGGB20_1X20                0x3024
> >>>> +/* Mixed bayer + ir pixel pattern found on ov01a1s */
> >>>> +#define MEDIA_BUS_FMT_SIGIG_GBGR_IGIG_GRGB10_1X10 0x3025
> >>>>
> >>>>   /* JPEG compressed formats - next is      0x4002 */
> >>>>   #define MEDIA_BUS_FMT_JPEG_1X8                    0x4001
> >>>> diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
> >>>> index 3829c0b6..1b91ed0e 100644
> >>>> --- a/include/linux/videodev2.h
> >>>> +++ b/include/linux/videodev2.h
> >>>> @@ -706,6 +706,9 @@ struct v4l2_pix_format {
> >>>>   #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* 16  GBGB.. RGRG.. */
> >>>>   #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
> >>>>   #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
> >>>> +  /* 10bit mixed bayer + ir pixel pattern found on ov01a1s */
> >>>> +#define V4L2_PIX_FMT_SIGIG_GBGR_IGIG_GRGB10  v4l2_fourcc('O', 'V', '1', 'S') /* unpacked */
> >>>> +#define V4L2_PIX_FMT_SIGIG_GBGR_IGIG_GRGB10P v4l2_fourcc('O', 'V', '1', 'P') /* packed */
> >>>>
> >>>>   /* HSV formats */
> >>>>   #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
> >>>>
> >>>> For this, note:
> >>>>
> >>>> 1. This is against libcamera's copy of the relevant linux headers, the paths
> >>>> to the .h files are different in the kernel
> >>>>
> >>>> 2. Since I wrote this I learned that it looks like the intel driver for
> >>>> the ov01a1s:
> >>>>
> >>>> /https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov01a1s.c/
> >>>>
> >>>> may have enabled horizontal-flip / mirroring by default, which means that
> >>>> the order of each of the quads needs to be flipped.
> >>>>
> >>>> IMHO we need to resolve how to communicate the color-filters used on
> >>>> these OV xxxxx"S" models to userspace. When I last discussed this with
> >>>> Laurent, Laurent suggested using V4L2_PIX_FMT_Y10, combined with
> >>>> a new field or v4l2-control to query the actual filter.
> >>>
> >>> Yes, adding new pixel formats and media bus codes to represent CFA
> >>> patterns won't scale. We need to switch to using controls to report
> >>> those. Sakari is already working on a series for that.
>
> That is why we also did not try to add some BGGR-IR format, because 
> there were too many combinations possible. Even if we are using just one 
> particular format, someone else would probably need another format, and 
> in the end, we agree that such a solution won't scale. So, separating 
> the size from the CFA information seems the practical thing to do.
>
> >> Interesting, do you have a link to Sakari's work ?
> >
> > I don't think it has been posted yet (Sakari can correct me if I'm
> > wrong). I believe the plan is to include it in a new version of "RFC v4
> > 0/9] Sub-device configuration models".
> 
> Looking forward for that :)
> 
> >>>> The idea is to separate the depth/packing info from the filter info,
> >>>> avoiding the possible combinatioral explosion of needing this special
> >>>> filter with all possible deths. I gave this a quick try but at least on
> >>>> the libcamera side there is still a lot of code assuming that both
> >>>> depth and color-filter-type are communicated through a single fmt
> >>>> integer. Also it seems that in practice there only is this one new
> >>>> RGB-IR color filter used on the OV xxxxx"S" models so I think we
> >>>> need just 1 new V4L2_PIX_FMT_ define (*).
> >>>
> >>> Changes in libcamera are surely needed. There's work to be done, we'll
> >>> do the work, and we'll solve this problem. Let's focus the effort in
> >>> that direction.
> >>
> >> Ok, so what does that mean for upstreaming support for omnivision
> >> OVxxxxS sensors? Clearly advertising MEDIA_BUS_FMT_SGRBG10_1X10 is
> >> wrong. So I guess that upstreaming this driver needs to wait until
> >> at least the kernel API side of this is resolved?
> >
> > It depends. I don't know if that's the case for this particular sensor,
> > but I wouldn't be surprised if some sensors could interpolate
> > neighbouring pixels to replace the IR pixels and produce a regular 2x2
> > Bayer CFA pattern. If the sensor you're working with can do that, then
> > the feature can be enabled by default, and the driver can advertise the
> > corresponding existing media bus code. Otherwise, let's cooperate to
> > review and merge the subdev configuration models series :-)
>
> For this ox05b1s sensor specifically, the CFA pattern is
> B G
> G IR
> 
> And when mirroring:
> G R
> IR G
> 
> So, we choose MEDIA_BUS_FMT_SGRBG10_1X10, as that was the closest match, 
> and our ISP gets extra information from userspace (libcamera) about the 
> CFA pattern.
> 
> >> Sensors relying on the new CFA control to communicatethe CFA type
> >> could use a new (e.g.) MEDIA_BUS_FMT_RAW_1X10 or are we going to re-use
> >> the monochrome (Y only) media bus fmts, so e.g. this sensor would
> >> advertise MEDIA_BUS_FMT_Y10_1X10 and then the CFA control would provide
> >> the actual CFA info ?
> >>
> >> IMHO re-using the monochrome (Y only) media bus fmts seems best
> >> to avoid needing to have to make a "RAW" copy of all of them.
> > I believe the plan is to use new RAW media bus codes, but we can also
> > consider reusing the Y formats.
> 
> So, should we try to re-submit this driver with Y format, or rather wait 
> for the new RAW media bus codes? Is there some work already started on 
> RAW media bus codes, are you referring to the generic MEDIA_BUS_FMT_META 
> formats?

I've discussed this with Sakari yesterday, and we both agreed that Hans'
idea of reusing the Y media bus codes and pixel formats is a good
approach, provided we don't run into issues.

Sakari is working on documenting a control to expose the CFA pattern. In
parallel, I think you can switch to Y formats for the next version of
this driver, and then implement the CFA pattern control as soon as
patches get posted.

> >> This also matches with what we are already doing for IR only sensors.
> >> AFAIK MEDIA_BUS_FMT_Y10_1X10 is currently already used for infrared
> >> sensors, so sticking with that and adding a IR CFA option to
> >> the CFA control to make clear this really is IR (*) seems to make
> >> sensor for IR only sensors. At which point extending this to RGB-IR
> >> sensors seems logical.
> >>
> >> *) Actually the whole spectrum the sensor is sensitive to really AFAIK
> >
> > I don't think I would report the sensitivity to light of individual
> > pixels through the new CFA pattern control. It seems a candidate for a
> > different API if we want to expose it from kernel to userspace, but we
> > could also simply add it to the camera sensor database in libcamera.

-- 
Regards,

Laurent Pinchart

