Return-Path: <linux-media+bounces-24483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74986A06F4C
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 08:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A35AC3A17EF
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 07:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87AE214A7C;
	Thu,  9 Jan 2025 07:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiYDCLn3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985C61AC8A2
	for <linux-media@vger.kernel.org>; Thu,  9 Jan 2025 07:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736408715; cv=none; b=N+8//g6MaMs5qy3geeXfAvwr3uhRUAVGgHJLXWDX66y6JwRAKpMlIJ90QE340tV46R8lcbB8eDUjcFdFvyFWLKp4fyaIgYZd408pnnzcI4f2SuNNsEhceHdyNfwU2AYDkjDr4FXCivvIbNEaIeTuXYpf8Kr9r5nkB3Kkl/RQuew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736408715; c=relaxed/simple;
	bh=/KrzM53s1Q8XoDZHBI+CPdJrYCcknG3IRwN/m83mPn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrjBRA9eOj4GalQAbduqTB0/adTtn91vkL3y46lr88sH5SeVV01++GpKz97fQGcNznt/njNxs9TkrUFXAICl6hTh/21+Jx28EI4Om8BZYrIEn6Sr/a6isvVZ55/DuEDidB0Cp8MR8SjeWKDhdsEVxUVR6+gM5QKRQBsrgCvejmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiYDCLn3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736408713; x=1767944713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/KrzM53s1Q8XoDZHBI+CPdJrYCcknG3IRwN/m83mPn4=;
  b=aiYDCLn3z0s7tQmKew8ypgEFCJkzIwfzzvqeAXaB0blf9OeZYQUeBjmQ
   tFTQ8ICUScSzY6dICoyvkUz61lzGorOoQdCsX5/Apf64vj71+JdLFmdGg
   qJDvGWr/rIf88LFfgH/yMf7S0hGf38wrvCrI4n9+HEXfIyVf3i0ogVyBQ
   Amo3oHiD/+0IaqGXCYVG3/KbroWsW34la1P6TA8rPDnxzctyGxB46E4MD
   7/QTe7a0kKD6Gw4Z2ZRjE4J7kuSe8ckKNnTooRtRwQSNULkpJcuwh4nJR
   7zscs4oTG6IgZiy1hsIFFZAB7DIqqa77USa+bOb6kydlFitS2sLw40lCX
   w==;
X-CSE-ConnectionGUID: UdSBYHwlQI278ES7/e+hpw==
X-CSE-MsgGUID: D+yn4MIWRx+iQCbiBX7r8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47153688"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="47153688"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 23:45:12 -0800
X-CSE-ConnectionGUID: MDWZF31RTMWet7wRtKsP1w==
X-CSE-MsgGUID: OeqBqVXuRdCJxoZWpsdrrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="103135840"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 23:45:05 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E3E251201CA;
	Thu,  9 Jan 2025 09:45:02 +0200 (EET)
Date: Thu, 9 Jan 2025 07:45:02 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: Re: [RFC v4 5/9] media: Documentation: Add scaling and post-scaler
 crop for common raw
Message-ID: <Z39-fm14e16Vfqsz@kekkonen.localdomain>
References: <20241220132419.1027206-1-sakari.ailus@linux.intel.com>
 <20241220132419.1027206-6-sakari.ailus@linux.intel.com>
 <fbee3507-ed61-4e9b-b935-466a4e084378@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbee3507-ed61-4e9b-b935-466a4e084378@ideasonboard.com>

Moi,

On Wed, Jan 08, 2025 at 02:08:37PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 20/12/2024 15:24, Sakari Ailus wrote:
> > Document scaling and post-scaler digital crop operations for the common
> > raw sensor model.
> > Signedg-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Missing line feed, and "Signedg". checkpatch didn't complain?

Well, this is in "RFC" phase so I haven't run it through a lot of tests
yet. ;) I'll fix it.

> 
> > ---
> >   .../media/v4l/subdev-config-model.rst         | 24 +++++++++++++++----
> >   1 file changed, 19 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > index b0bd09772ceb..f15e5495cc34 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > @@ -118,11 +118,18 @@ sub-sampling to achieve the desired size.
> >   The digital crop operation takes place after binning and sub-sampling. It is
> >   configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
> > -0/0. The resulting image size is further output by the sensor.
> > +0/0.
> > +
> > +The scaling operation is performed after the digital crop. It is configured by
> > +setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on (pad, stream) pair 0/0,
> > +relative to the digital crop.
> >   The sensor's output mbus code is configured by setting the format on the (pad,
> > -stream) pair 0/0. When setting the format, always use the same width and height
> > -as for the digital crop setting.
> > +stream) pair 0/0. The width and height fields are used to configure post-scaler
> > +digital crop if supported by the driver, affecting the right and bottom edges of
> > +the frame. If post-scaler digital crop is not supported, the width and height
> > +fields of the format will match the compose rectangle sizes applied on the same
> > +0/0 (pad, stream) pair.
> >   Drivers may only support some of even none of these configurations, in which
> >   case they do not expose the corresponding selection rectangles. If any selection
> > @@ -180,12 +187,19 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
> >         - X
> >         - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_COMPOSE``
> >           rectangle on (pad, stream) pair 1/0.
> > +    * - 0/0
> > +      - ``V4L2_SEL_TGT_COMPOSE``
> > +      - \-
> > +      - X
> > +      - Scaling. This rectangle is relative to the ``V4L2_SEL_TGT_CROP``
> > +        rectangle on (pad, stream) pair 0/0.
> >       * - 0/0
> >         - Format
> >         - X
> >         - X
> > -      - Image data source format. Always assign the width and height fields of
> > -        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
> > +      - Image data source format and post-scaler crop. The width and height
> > +        fields of the format, used to configure post-scaler crop on the right
> > +        and bottom edges of the image, are related to the ``V4L2_SEL_TGT_COMPOSE``
> >           rectangle on (pad, stream) pair 0/0. The media bus code reflects the
> >           pixel data output of the sensor.
> >       * - 0/1
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Why wasn't this just part of the previous patch?

There was discussion on whether this should be part of the patches merged
in the first phase or not. If so, I think it indeed should be squashed.

-- 
Terveisin,

Sakari Ailus

