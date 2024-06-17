Return-Path: <linux-media+bounces-13402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A397590A91D
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 11:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 472262857D3
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 09:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B0019147D;
	Mon, 17 Jun 2024 09:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sq3PcwYW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FCA1836FC
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 09:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718615356; cv=none; b=f7hk9mqxMWNwAs/dHxyWodWKebL7MnWRB3rlj97SKTfYZ34/xkRhfWZHb8B6WminYK7NJhAnC1ePwCvVufP/b0FEuwzNEoCTuM7CV0MReIsmDlnb+7eG8ez3ZSArg1J3zikg9rv0Z51IDpM8SxfUIcPF2W0rLaiRbLYcxp7Njy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718615356; c=relaxed/simple;
	bh=m36N2QaiZu1gKB9SN7R699xmAviPQPm7ChqEdsIULAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaJxth2VXHxykGJ0T8mRU1J6NXcq9vtOBFzXIJYIbVq8CJkOaFmzCVBI3o2qM80lKNw8Yw4lW1YeNpHTxeuaNcxkh5fhTjyQRl7Q5QDSIubzV93tHVln+ycg2S+awPmK8h4TwVIMa0zOb0/d9G3+1lDHdX735KjeXRxbV03ulIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sq3PcwYW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 479CF39F;
	Mon, 17 Jun 2024 11:08:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718615336;
	bh=m36N2QaiZu1gKB9SN7R699xmAviPQPm7ChqEdsIULAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sq3PcwYW93OxBYu7+UmSw5rKya7KtN86YNdnyQGAUgDBw42k4VFk+hpdAiosxT24B
	 pXixj2RRznrWqAql3kXiGcmSCM+LB74ugrTFS6TdNFUwoVlRqvsOKCEcqVDUZSLNMk
	 A3CMSypOjRX8m6eTU668bchhIT/5cnUIiDtBlA9I=
Date: Mon, 17 Jun 2024 12:08:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>,
	"Gandhi, Neel" <neel.gandhi@amd.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"Hatle, Mark" <mark.hatle@amd.com>,
	"Allagadapa, Varunkumar" <varunkumar.allagadapa@amd.com>,
	"Sagar, Vishal" <vishal.sagar@amd.com>
Subject: Re: [v4l-utils] utils: media-ctl: Install media-ctl header and
 library files
Message-ID: <20240617090851.GH30324@pendragon.ideasonboard.com>
References: <20240614065120.896247-1-neel.gandhi@amd.com>
 <20240614100445.GD6806@pendragon.ideasonboard.com>
 <BY5PR12MB4950321E05846F4A64793C25FCC22@BY5PR12MB4950.namprd12.prod.outlook.com>
 <20240615003525.GG9171@pendragon.ideasonboard.com>
 <Zm_rGLHKsPQjzLho@valkosipuli.retiisi.eu>
 <6028df14-a73b-42e9-857c-6202297fc5b9@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6028df14-a73b-42e9-857c-6202297fc5b9@xs4all.nl>

On Mon, Jun 17, 2024 at 10:38:39AM +0200, Hans Verkuil wrote:
> On 17/06/2024 09:51, sakari.ailus@iki.fi wrote:
> > On Sat, Jun 15, 2024 at 03:35:25AM +0300, Laurent Pinchart wrote:
> >> On Fri, Jun 14, 2024 at 01:07:24PM +0000, Gandhi, Neel wrote:
> >>> Hi Laurent,
> >>>
> >>> Thank you for your quick response. Please see my below inline response.
> >>>
> >>> On Friday, June 14, 2024 3:35 PM, Laurent Pinchart wrote:
> >>>> On Fri, Jun 14, 2024 at 12:21:20PM +0530, Neel Gandhi wrote:
> >>>>> Install mediactl and v4l2subdev header and library files, which may be
> >>>>> required by 3rd party applications to populate and control v4l2subdev
> >>>>> device node tree
> >>>>
> >>>> We haven't done so because the API of those libraries is currently internal, and
> >>>> not guaranteed to be stable.
> >>>
> >>> So, if one's application is developed based on those libraries, then
> >>> is there any alternative solution for it?
> >>
> >> Good question. I personally have no issue with applications using those
> >> libraries, as long as they don't expect a stable API. This means that
> >> any future version of v4l-utils may ship incompatible libraries, and
> >> that won't be considered as a regression, and won't be addressed. If we
> >> want to go that way, I think we should install static versions of the
> >> libraries only, as dynamic linking will really be asking for trouble.
> >>
> >> A better option, of course, would be to offer a stable API. That will
> >> require work, the current API will need to be reviewed and improved to
> >> make sure we can then extend it in a backward-compatible way whenever
> >> the kernel APIs get extended. It's not work that I could commit to, so
> >> we would need a volunteer for work on that and then maintain the
> >> libraries.
> >>
> >> Hans, Sakari, any opinion ?
> > 
> > Given it's been around for a decade without much changes, it wouldn't seem
> > unreasonable to consider the API stable. A lot of projects copy the code in
> > verbatim which makes fixing bugs very hard. :-(
> > 
> > I think the API could be improved on and the library could use G_TOPOLOGY
> > IOCTL. Neither has happened but these don't much affect the value of the
> > librarisation.
> > 
> > I've already proposed making this a proper library previously and I still
> > believe it should be one.
> 
> I quickly looked at the API and I think it needs work before it is suitable
> for a generic library API. It is was never meant as a public API.
> 
> Making it a proper library is a lot more work and needs someone to maintain
> it. I'm not maintaining this code, so it is not up to me, but for what it is
> worth, I would recommend against it.

I hack on that code occasionally when I need new features, but I'm not
sure that makes me a maintainer. In any case, I won't have time to turn
this into a public API in the near future. If someone wants to volunteer
to do that work, I could at least try to review the proposals.

> >> Neel, out of curiosity, what do you use those libraries for (if you can
> >> tell publicly) ?
> >>
> >>> As in the prior versions of v4l-utils package, those libraries are
> >>> available to use but it was removed from v1.25+ onwards (from meson
> >>> related changes in c2b91b9c3853b2cbcbe170a542864a3147d179ee commitID).
> >>> We're using yocto scarthgap, which is using v1.26.
> >>>
> >>>>> Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
> >>>>> ---
> >>>>>  utils/media-ctl/meson.build | 28 +++++++++++++++++++++-------
> >>>>>  1 file changed, 21 insertions(+), 7 deletions(-)
> >>>>>
> >>>>> diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build
> >>>>> index 3a7b0c9a..40669b4c 100644
> >>>>> --- a/utils/media-ctl/meson.build
> >>>>> +++ b/utils/media-ctl/meson.build
> >>>>> @@ -3,14 +3,24 @@ libmediactl_sources = files(
> >>>>>      'mediactl-priv.h',
> >>>>>  )
> >>>>>
> >>>>> +libmediactl_api = files(
> >>>>> +    'mediactl.h',
> >>>>> +    'v4l2subdev.h',
> >>>>> +)
> >>>>> +
> >>>>> +install_headers(libmediactl_api, subdir: 'mediactl')
> >>>>> +
> >>>>>  libmediactl_deps = [
> >>>>>      dep_libudev,
> >>>>>  ]
> >>>>>
> >>>>> -libmediactl = static_library('mediactl',
> >>>>> -                             libmediactl_sources,
> >>>>> -                             dependencies : libmediactl_deps,
> >>>>> -                             include_directories : v4l2_utils_incdir)
> >>>>> +libmediactl = library('mediactl',
> >>>>> +                      libmediactl_sources,
> >>>>> +                      soversion: '0',
> >>>>> +                      version: '0.0.0',
> >>>>> +                      install : true,
> >>>>> +                      dependencies : libmediactl_deps,
> >>>>> +                      include_directories : v4l2_utils_incdir)
> >>>>>
> >>>>>  dep_libmediactl = declare_dependency(link_with : libmediactl)
> >>>>>
> >>>>> @@ -18,9 +28,13 @@ libv4l2subdev_sources = files('libv4l2subdev.c')
> >>>>> libv4l2subdev_sources += media_bus_format_names_h
> >>>>> libv4l2subdev_sources += media_bus_format_codes_h
> >>>>>
> >>>>> -libv4l2subdev = static_library('v4l2subdev',
> >>>>> -                               libv4l2subdev_sources,
> >>>>> -                               include_directories : v4l2_utils_incdir)
> >>>>> +libv4l2subdev = library('v4l2subdev',
> >>>>> +                        libv4l2subdev_sources,
> >>>>> +                        soversion: '0',
> >>>>> +                        version: '0.0.0',
> >>>>> +                        install : true,
> >>>>> +                        dependencies : dep_libmediactl,
> >>>>> +                        include_directories : v4l2_utils_incdir)
> >>>>>
> >>>>>  dep_libv4l2subdev = declare_dependency(link_with : libv4l2subdev)
> >>>>>

-- 
Regards,

Laurent Pinchart

