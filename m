Return-Path: <linux-media+bounces-24422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5651A05D10
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 14:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99D081670A0
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 13:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332DE1FC7C3;
	Wed,  8 Jan 2025 13:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRtYbN13"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2951FC103
	for <linux-media@vger.kernel.org>; Wed,  8 Jan 2025 13:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343742; cv=none; b=LLPiR2dJb8W78+TnpY4xmISnMOL88j56NYMAdbfu9E5evjUbKp+RXs3QCbZYJ8Cb6c2jFCkDtQhA1om9wzOu0bnwGQv58SpCu18/ppY2l/bggyeGVxdkd7ReGxmKP36DUUQ4Xfz19nVBsFxNkQBspSLpTssri8bxc6IaSAiUqsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343742; c=relaxed/simple;
	bh=lOEvnsfC+98W/jt6x1dIJwkMKbzbYPPRT2ADYW6aR2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5Le3KjNsjl8IUKHWE8dJpW+/Oz1y3xBQYzFHV9CNouNLnNuUvP5kIY/3H5tqi17J4Qoj2dQ9e0buAV3UxcYIYVnT79+oS08vx1M5T4tz3vIL/2hts4rlpJE5Iy6hGcPJG98c235h3ZzDoVeXXnJM6HO8ixmGd8ER9NzBCxr6Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRtYbN13; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736343741; x=1767879741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lOEvnsfC+98W/jt6x1dIJwkMKbzbYPPRT2ADYW6aR2k=;
  b=YRtYbN13Trr5ERsLhM098TygNJfm/lvlFC19QtmaSb7hGh2kvs9yWH3M
   54Ewa55ZfTDE2YZ6ExM1EwbcM0R2EXbelsPAmtZjRN6/qoJe/z8OEHJ5G
   eWzRrla5OLTBv1haJJDsoO3xiNM94NBadf/UVdfTzy8DwxXzJ5fUuppXl
   frW/Ca4rY/4iSok1bkca5kD0zzZYVC1oZTTbAplxNZ4kdVsmy2vztbASK
   6FjcHn2cQ8EuqKmzK2L5WBznnRPkCsh6DEazKl7yXeHi+Icd99sotH0ZV
   6EEtjSSrWPQpvwcP1tE4PMxBzG1IxmQwtppDcDiSzD1dJLdKN1Vu4QQmo
   g==;
X-CSE-ConnectionGUID: Dci07jalR2iwFxTrardqbA==
X-CSE-MsgGUID: zrI0LFv3R9iSDzXEDyCk+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40246892"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="40246892"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 05:42:19 -0800
X-CSE-ConnectionGUID: sTRuuVuGRcOpT7NrfztPWA==
X-CSE-MsgGUID: 4A+mo/n8SDWFyD62obzdvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="108083936"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 05:42:17 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C0E9E11F8DF;
	Wed,  8 Jan 2025 15:42:14 +0200 (EET)
Date: Wed, 8 Jan 2025 13:42:14 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com
Subject: Re: [PATCH v8 6/9] media: Documentation: Add a note to set all
 fields in get_mbus_config op
Message-ID: <Z36Att20SRvDiGQL@kekkonen.localdomain>
References: <20241217215445.901459-1-sakari.ailus@linux.intel.com>
 <20241217215445.901459-7-sakari.ailus@linux.intel.com>
 <eb0fe9bd-7d1a-4b1a-a127-4e9ce89ede8e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb0fe9bd-7d1a-4b1a-a127-4e9ce89ede8e@ideasonboard.com>

On Fri, Dec 20, 2024 at 03:29:27PM +0200, Tomi Valkeinen wrote:
> 
> On 17/12/2024 23:54, Sakari Ailus wrote:
> > Document that the implementations of the V4L2 sub-device pad operation
> > get_mbus_config shall set all fields of the struct to defined values.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   include/media/v4l2-subdev.h | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 2f2200875b03..abcc879fabb2 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -822,7 +822,10 @@ struct v4l2_subdev_state {
> >    *		     possible configuration from the remote end, likely calling
> >    *		     this operation as close as possible to stream on time. The
> >    *		     operation shall fail if the pad index it has been called on
> > - *		     is not valid or in case of unrecoverable failures.
> > + *		     is not valid or in case of unrecoverable failures. The
> > + *		     implementations of the get_mbus_config operation shall set
> > + *		     all the values of struct v4l2_mbus_config to defined
> > + *		     values.
> 
> The drivers can't set all fields, as we can add new fields (like you do in
> this series). So I assume this means that the drivers should memset() the
> struct to 0, and only then set the values it wants?
> 
> I think we should have a wrapper for get_mbus_config, which would clear the
> struct before calling the op. And the drivers should always use that
> wrapper.

It seems we already have a wrapper actually, one that checks the pad
argument is valid. I'll add the memset().

-- 
Sakari Ailus

