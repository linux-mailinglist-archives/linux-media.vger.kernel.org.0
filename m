Return-Path: <linux-media+bounces-13401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D897F90A911
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 11:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60D841F24945
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 09:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC380190682;
	Mon, 17 Jun 2024 09:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WCSg4IUn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8C8374D9
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718615248; cv=none; b=D2o0UyoItIinCvtMkdKIYdlgmR98+PNMubra66ylUYieimMtySn3Qq4GPYihe3sFINsXvleD9A8irYBySnuAwRQkCzw8nS+343eUgfzPEVQg6mhe8/wBuslcWIn4ZmiIN95I3zlzi0hrY7REYKYcQdnQVm4Ok0ZVGrDgWn9Ffh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718615248; c=relaxed/simple;
	bh=7qkyUE8GJgg0IzF6KDKrN1+CRFEYS7jQAsuLsSx73ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnU8qPLtR4My/P0ftx76c1h9WNUjv+ObPTnJu9RRB8/PHk8F6imP7kjbrOzqHDz3VZDiOvYICfnxqjTe+RQoTDxW4PQpOjtwkm9zDLv7QC7IKhHqz5KhkrjilShCYIQGD/mYwA4QDzD5qCd+T9CAyDjTfRoAggX6pK3LA6zjNuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WCSg4IUn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FF6D39F;
	Mon, 17 Jun 2024 11:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718615227;
	bh=7qkyUE8GJgg0IzF6KDKrN1+CRFEYS7jQAsuLsSx73ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCSg4IUn5zDOxJu1T0K2nCcjgsr0L/rlb2QmRQ63KoN+Yetuw2ZAxUfy8RLiI1Pz/
	 FFG84T6TQJkik9UVOaWUB1r/xIUuNWq3ddQ/Ownv0drUjol6yObgigZ7vSHVT6KbQk
	 Fak6Ulk2NUGm+j1STXA0bZUfJexUCMluys0mCaG0=
Date: Mon, 17 Jun 2024 12:07:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>
Cc: "Gandhi, Neel" <neel.gandhi@amd.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"Hatle, Mark" <mark.hatle@amd.com>,
	"Allagadapa, Varunkumar" <varunkumar.allagadapa@amd.com>,
	"Sagar, Vishal" <vishal.sagar@amd.com>
Subject: Re: [v4l-utils] utils: media-ctl: Install media-ctl header and
 library files
Message-ID: <20240617090702.GG30324@pendragon.ideasonboard.com>
References: <20240614065120.896247-1-neel.gandhi@amd.com>
 <20240614100445.GD6806@pendragon.ideasonboard.com>
 <BY5PR12MB4950321E05846F4A64793C25FCC22@BY5PR12MB4950.namprd12.prod.outlook.com>
 <20240615003525.GG9171@pendragon.ideasonboard.com>
 <Zm_rGLHKsPQjzLho@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zm_rGLHKsPQjzLho@valkosipuli.retiisi.eu>

On Mon, Jun 17, 2024 at 07:51:52AM +0000, Sakari Ailus wrote:
> On Sat, Jun 15, 2024 at 03:35:25AM +0300, Laurent Pinchart wrote:
> > On Fri, Jun 14, 2024 at 01:07:24PM +0000, Gandhi, Neel wrote:
> > > Hi Laurent,
> > > 
> > > Thank you for your quick response. Please see my below inline response.
> > > 
> > > On Friday, June 14, 2024 3:35 PM, Laurent Pinchart wrote:
> > > > On Fri, Jun 14, 2024 at 12:21:20PM +0530, Neel Gandhi wrote:
> > > > > Install mediactl and v4l2subdev header and library files, which may be
> > > > > required by 3rd party applications to populate and control v4l2subdev
> > > > > device node tree
> > > > 
> > > > We haven't done so because the API of those libraries is currently internal, and
> > > > not guaranteed to be stable.
> > > 
> > > So, if one's application is developed based on those libraries, then
> > > is there any alternative solution for it?
> > 
> > Good question. I personally have no issue with applications using those
> > libraries, as long as they don't expect a stable API. This means that
> > any future version of v4l-utils may ship incompatible libraries, and
> > that won't be considered as a regression, and won't be addressed. If we
> > want to go that way, I think we should install static versions of the
> > libraries only, as dynamic linking will really be asking for trouble.
> > 
> > A better option, of course, would be to offer a stable API. That will
> > require work, the current API will need to be reviewed and improved to
> > make sure we can then extend it in a backward-compatible way whenever
> > the kernel APIs get extended. It's not work that I could commit to, so
> > we would need a volunteer for work on that and then maintain the
> > libraries.
> > 
> > Hans, Sakari, any opinion ?
> 
> Given it's been around for a decade without much changes, it wouldn't seem
> unreasonable to consider the API stable. A lot of projects copy the code in
> verbatim which makes fixing bugs very hard. :-(

Well, I've pushed API-breaking changes not later than last week :-)
Having to preserve the API would have been annoying.

> I think the API could be improved on and the library could use G_TOPOLOGY
> IOCTL. Neither has happened but these don't much affect the value of the
> librarisation.
> 
> I've already proposed making this a proper library previously and I still
> believe it should be one.

I agree it would be nice. Someone would have to step up as a maintainer,
and start by desining the API in a way to would allow for future
extensions.

> > Neel, out of curiosity, what do you use those libraries for (if you can
> > tell publicly) ?
> > 
> > > As in the prior versions of v4l-utils package, those libraries are
> > > available to use but it was removed from v1.25+ onwards (from meson
> > > related changes in c2b91b9c3853b2cbcbe170a542864a3147d179ee commitID).
> > > We're using yocto scarthgap, which is using v1.26.
> > > 
> > > > > Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
> > > > > ---
> > > > >  utils/media-ctl/meson.build | 28 +++++++++++++++++++++-------
> > > > >  1 file changed, 21 insertions(+), 7 deletions(-)
> > > > >
> > > > > diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build
> > > > > index 3a7b0c9a..40669b4c 100644
> > > > > --- a/utils/media-ctl/meson.build
> > > > > +++ b/utils/media-ctl/meson.build
> > > > > @@ -3,14 +3,24 @@ libmediactl_sources = files(
> > > > >      'mediactl-priv.h',
> > > > >  )
> > > > >
> > > > > +libmediactl_api = files(
> > > > > +    'mediactl.h',
> > > > > +    'v4l2subdev.h',
> > > > > +)
> > > > > +
> > > > > +install_headers(libmediactl_api, subdir: 'mediactl')
> > > > > +
> > > > >  libmediactl_deps = [
> > > > >      dep_libudev,
> > > > >  ]
> > > > >
> > > > > -libmediactl = static_library('mediactl',
> > > > > -                             libmediactl_sources,
> > > > > -                             dependencies : libmediactl_deps,
> > > > > -                             include_directories : v4l2_utils_incdir)
> > > > > +libmediactl = library('mediactl',
> > > > > +                      libmediactl_sources,
> > > > > +                      soversion: '0',
> > > > > +                      version: '0.0.0',
> > > > > +                      install : true,
> > > > > +                      dependencies : libmediactl_deps,
> > > > > +                      include_directories : v4l2_utils_incdir)
> > > > >
> > > > >  dep_libmediactl = declare_dependency(link_with : libmediactl)
> > > > >
> > > > > @@ -18,9 +28,13 @@ libv4l2subdev_sources = files('libv4l2subdev.c')
> > > > > libv4l2subdev_sources += media_bus_format_names_h
> > > > > libv4l2subdev_sources += media_bus_format_codes_h
> > > > >
> > > > > -libv4l2subdev = static_library('v4l2subdev',
> > > > > -                               libv4l2subdev_sources,
> > > > > -                               include_directories : v4l2_utils_incdir)
> > > > > +libv4l2subdev = library('v4l2subdev',
> > > > > +                        libv4l2subdev_sources,
> > > > > +                        soversion: '0',
> > > > > +                        version: '0.0.0',
> > > > > +                        install : true,
> > > > > +                        dependencies : dep_libmediactl,
> > > > > +                        include_directories : v4l2_utils_incdir)
> > > > >
> > > > >  dep_libv4l2subdev = declare_dependency(link_with : libv4l2subdev)
> > > > >

-- 
Regards,

Laurent Pinchart

