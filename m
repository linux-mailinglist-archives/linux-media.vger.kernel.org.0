Return-Path: <linux-media+bounces-13394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DCF90A7BC
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 09:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAA31286208
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 07:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD5A190049;
	Mon, 17 Jun 2024 07:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="yIHWf9hg"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287DC18FDAD
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 07:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718610720; cv=pass; b=OL0iLlp5C/z8EtJDXBBSqzOGdqERuMtj8al0enSrzytDWtpIbASGrVabnL0ClPTnVRSThQTe863lA/8xtlwYBKab1T5nYSecGlMLjo1ZRtcFCmdCZW37Lpgjuf3GLLLBPfZ4IF3Ojj29qqwkVkGJLyUQzLscdM5zSnCec4awAXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718610720; c=relaxed/simple;
	bh=w/gS4ORPGsFjNNF4cppCuOKW+X4z33Qj8MDeOElWDqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DaRrbkxD+N5zQYd21ATyT0Z7XlSAoB+orin0eepLZoV3YT0lUmsqr1SSTdjcUuflzOaObZBReURgtp0KT0tsudq8v+7EX/C7Z53GBvszEC4XmJ6YWULYJ3oattfr/lGqCFB2eryNnWKptO6zGmdxfODQ/kv6u96w6SkCgu1hzuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=yIHWf9hg; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4W2ht23v0PzyRg;
	Mon, 17 Jun 2024 10:51:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1718610715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aQNt3K49s2FcrtkdyJdzkdU16MdBY9q8xK/9cB6sb2k=;
	b=yIHWf9hgEjs/CPajEeR3v5NK7Uwk1CXqou8iJrB45tVA20P2U4fZfQPgRi1v8GEQHAvzY/
	pix3xi5iUp7oGvoZSgGlepR5O3l8+cOE+Zt3dBKgGMUVV12/uW2H9R0BPVAKm5Y//dZYSo
	11ZniUrZVl00COXInEmQP3YJSlfwywQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1718610715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aQNt3K49s2FcrtkdyJdzkdU16MdBY9q8xK/9cB6sb2k=;
	b=Tt8IzPIAfxhYqgQ9QS/D9i1AUOp+Osd0y3xFuqMWIFprygpx+6+sE+w9UDpIEiHSiDVW1n
	+2+gIPmqFVCCSPTU5dRy1DjWL7tqV1wXdIjOj49BOwu7y3jmYECHSWj35Ev8HO2TQWTBIF
	JIbeh0a8FzthkO3bHdVUduN7Sj6i6sM=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1718610715; a=rsa-sha256; cv=none;
	b=lL6YyYpOKw2qPWF6cHUWbLyKPPjByKZY5AfuAXWV5QtkrNSBSr5S9COET7dghjG8bn3lrL
	9ceSZ0MJgo0DNVUMzpPK4P0z6IF5ywA49F34+28GsoFAB67RnzdZoLHpWnlGNeIanrTepM
	lEVBRcCLCs5NMDB5oKFlAMukR7dB90k=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 25C30634C93;
	Mon, 17 Jun 2024 10:51:53 +0300 (EEST)
Date: Mon, 17 Jun 2024 07:51:52 +0000
From: "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Gandhi, Neel" <neel.gandhi@amd.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"Hatle, Mark" <mark.hatle@amd.com>,
	"Allagadapa, Varunkumar" <varunkumar.allagadapa@amd.com>,
	"Sagar, Vishal" <vishal.sagar@amd.com>
Subject: Re: [v4l-utils] utils: media-ctl: Install media-ctl header and
 library files
Message-ID: <Zm_rGLHKsPQjzLho@valkosipuli.retiisi.eu>
References: <20240614065120.896247-1-neel.gandhi@amd.com>
 <20240614100445.GD6806@pendragon.ideasonboard.com>
 <BY5PR12MB4950321E05846F4A64793C25FCC22@BY5PR12MB4950.namprd12.prod.outlook.com>
 <20240615003525.GG9171@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240615003525.GG9171@pendragon.ideasonboard.com>

Hi Laurent,

On Sat, Jun 15, 2024 at 03:35:25AM +0300, Laurent Pinchart wrote:
> Hi Neel,
> 
> On Fri, Jun 14, 2024 at 01:07:24PM +0000, Gandhi, Neel wrote:
> > Hi Laurent,
> > 
> > Thank you for your quick response. Please see my below inline response.
> > 
> > On Friday, June 14, 2024 3:35 PM, Laurent Pinchart wrote:
> > > On Fri, Jun 14, 2024 at 12:21:20PM +0530, Neel Gandhi wrote:
> > > > Install mediactl and v4l2subdev header and library files, which may be
> > > > required by 3rd party applications to populate and control v4l2subdev
> > > > device node tree
> > > 
> > > We haven't done so because the API of those libraries is currently internal, and
> > > not guaranteed to be stable.
> > 
> > So, if one's application is developed based on those libraries, then
> > is there any alternative solution for it?
> 
> Good question. I personally have no issue with applications using those
> libraries, as long as they don't expect a stable API. This means that
> any future version of v4l-utils may ship incompatible libraries, and
> that won't be considered as a regression, and won't be addressed. If we
> want to go that way, I think we should install static versions of the
> libraries only, as dynamic linking will really be asking for trouble.
> 
> A better option, of course, would be to offer a stable API. That will
> require work, the current API will need to be reviewed and improved to
> make sure we can then extend it in a backward-compatible way whenever
> the kernel APIs get extended. It's not work that I could commit to, so
> we would need a volunteer for work on that and then maintain the
> libraries.
> 
> Hans, Sakari, any opinion ?

Given it's been around for a decade without much changes, it wouldn't seem
unreasonable to consider the API stable. A lot of projects copy the code in
verbatim which makes fixing bugs very hard. :-(

I think the API could be improved on and the library could use G_TOPOLOGY
IOCTL. Neither has happened but these don't much affect the value of the
librarisation.

I've already proposed making this a proper library previously and I still
believe it should be one.

> 
> Neel, out of curiosity, what do you use those libraries for (if you can
> tell publicly) ?
> 
> > As in the prior versions of v4l-utils package, those libraries are
> > available to use but it was removed from v1.25+ onwards (from meson
> > related changes in c2b91b9c3853b2cbcbe170a542864a3147d179ee commitID).
> > We're using yocto scarthgap, which is using v1.26.
> > 
> > > > Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
> > > > ---
> > > >  utils/media-ctl/meson.build | 28 +++++++++++++++++++++-------
> > > >  1 file changed, 21 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build
> > > > index 3a7b0c9a..40669b4c 100644
> > > > --- a/utils/media-ctl/meson.build
> > > > +++ b/utils/media-ctl/meson.build
> > > > @@ -3,14 +3,24 @@ libmediactl_sources = files(
> > > >      'mediactl-priv.h',
> > > >  )
> > > >
> > > > +libmediactl_api = files(
> > > > +    'mediactl.h',
> > > > +    'v4l2subdev.h',
> > > > +)
> > > > +
> > > > +install_headers(libmediactl_api, subdir: 'mediactl')
> > > > +
> > > >  libmediactl_deps = [
> > > >      dep_libudev,
> > > >  ]
> > > >
> > > > -libmediactl = static_library('mediactl',
> > > > -                             libmediactl_sources,
> > > > -                             dependencies : libmediactl_deps,
> > > > -                             include_directories : v4l2_utils_incdir)
> > > > +libmediactl = library('mediactl',
> > > > +                      libmediactl_sources,
> > > > +                      soversion: '0',
> > > > +                      version: '0.0.0',
> > > > +                      install : true,
> > > > +                      dependencies : libmediactl_deps,
> > > > +                      include_directories : v4l2_utils_incdir)
> > > >
> > > >  dep_libmediactl = declare_dependency(link_with : libmediactl)
> > > >
> > > > @@ -18,9 +28,13 @@ libv4l2subdev_sources = files('libv4l2subdev.c')
> > > > libv4l2subdev_sources += media_bus_format_names_h
> > > > libv4l2subdev_sources += media_bus_format_codes_h
> > > >
> > > > -libv4l2subdev = static_library('v4l2subdev',
> > > > -                               libv4l2subdev_sources,
> > > > -                               include_directories : v4l2_utils_incdir)
> > > > +libv4l2subdev = library('v4l2subdev',
> > > > +                        libv4l2subdev_sources,
> > > > +                        soversion: '0',
> > > > +                        version: '0.0.0',
> > > > +                        install : true,
> > > > +                        dependencies : dep_libmediactl,
> > > > +                        include_directories : v4l2_utils_incdir)
> > > >
> > > >  dep_libv4l2subdev = declare_dependency(link_with : libv4l2subdev)
> > > >
> 

-- 
Kind regards,

Sakari Ailus

