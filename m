Return-Path: <linux-media+bounces-10283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F718B4DD5
	for <lists+linux-media@lfdr.de>; Sun, 28 Apr 2024 23:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D960281390
	for <lists+linux-media@lfdr.de>; Sun, 28 Apr 2024 21:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA30E9476;
	Sun, 28 Apr 2024 21:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G8td3mJZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFF64A2C
	for <linux-media@vger.kernel.org>; Sun, 28 Apr 2024 21:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714338405; cv=none; b=BSKmnSH9iivBGAFzJoPB+T/mxHXZbzw40JUoobiZdmYetd9iVyCXIhCTh72jPkIo/OVNKWeDCWkJgFmnUaAbqxcFYuNd0KjPxYY/D8nin9Eoud3iLKu31hUAirqHbliheffkIdNRRQNzI5raurA6FWXSQsn0Ga8AWiyXN19ypUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714338405; c=relaxed/simple;
	bh=I0N77ggOC5K3RpmQzb4MXd8xfFTi7+OjQwbV0wTg0s8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKVWAAVfwuUQ7UcKHG6LN6WZIdWwj1BS9U0+l1ybX5sF0nSXkuAepm9x/QpIDtXrNkKC+0LN3N1e99gqkmDGjnJTGw/a0qPDbrsVKOxwXaxIT6gWRl22BPxrJtC+MaI07mb1+nIt1KdDnG+ZKatTwm9NGOdH1YbUxJ0dtrdW+e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G8td3mJZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714338404; x=1745874404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I0N77ggOC5K3RpmQzb4MXd8xfFTi7+OjQwbV0wTg0s8=;
  b=G8td3mJZ0fX5wHOvrhEvQfx7Hs4vCC/hPbwB/siMOiC7rs5h19x5jo3P
   2S5weInkK1H0LU3r6ptWzC8KgNVwOK5bDwxKEGC7mmz/ALjquCz5mSshB
   oPhMYon4tH6ftwnRFXjfgecr9A1n5Vof+z9G0SsTb58llL6q768NDJVYV
   VEUxvDZwkFY9ydmSSu+9Dj1HRJfW4isvMZECcJYxZPByBDDCSaRMn3Gr8
   RKkU14Cu4tjOhq57GkJCxsTkviw5x1v0B3lXNY1onAkhbtojkXJ+4srjJ
   weFz1jCs3CSp9jTjDjJkHaWFw8iLXvvIX4yDnW9l5Vq3vmZjhNWVKu/ln
   A==;
X-CSE-ConnectionGUID: JQYqV+SbQsejd8RAJCLKcw==
X-CSE-MsgGUID: H+kljK+CQ8OU/afq9Xeybg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10106622"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="10106622"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 14:06:43 -0700
X-CSE-ConnectionGUID: BKLETI2JQzmEaKTyo0Kx/Q==
X-CSE-MsgGUID: IrxB+RiTTBafEtzmpyMsbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="30721647"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 14:06:39 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4688311F832;
	Mon, 29 Apr 2024 00:06:36 +0300 (EEST)
Date: Sun, 28 Apr 2024 21:06:36 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com, tfiga@chromium.org,
	senozhatsky@chromium.org, andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: Re: [PATCH v6 16/18] media: intel/ipu6: support line-based metadata
 capture support
Message-ID: <Zi66XKzGqcxOedlr@kekkonen.localdomain>
References: <20240426095822.946453-1-sakari.ailus@linux.intel.com>
 <20240426095822.946453-17-sakari.ailus@linux.intel.com>
 <0da0d721-1e8f-4979-bc5a-43695c8ebf30@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0da0d721-1e8f-4979-bc5a-43695c8ebf30@xs4all.nl>

Hi Hans,

Thank you for the review.

On Sat, Apr 27, 2024 at 06:00:13PM +0200, Hans Verkuil wrote:
> > -static int vidioc_try_fmt_vid_cap(struct file *file, void *fh,
> > -				  struct v4l2_format *f)
> > +static int ipu6_isys_vidioc_s_fmt_meta_cap(struct file *file, void *fh,
> > +					   struct v4l2_format *f)
> >  {
> >  	struct ipu6_isys_video *av = video_drvdata(file);
> >  
> > -	ipu6_isys_video_try_fmt_vid(av, &f->fmt.pix);
> 
> This is missing a vb2_is_busy() check.

To be added in v7.

...

> > @@ -1214,8 +1309,10 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
> >  	av->vdev.queue = &av->aq.vbq;
> >  	av->vdev.lock = &av->mutex;
> >  
> > -	ipu6_isys_video_try_fmt_vid(av, &format.fmt.pix);
> > +	__ipu6_isys_vidioc_try_fmt_vid_cap(av, &format);
> >  	av->pix_fmt = format.fmt.pix;
> > +	__ipu6_isys_vidioc_try_fmt_meta_cap(av, &format_meta);
> 
> Here is the cause of the v4l2-compliance failure (I think): this will
> set the format_meta pixelformat to ipu6_isys_pfmts[0], which is BG12.
> 
> It doesn't check the is_meta flag there.
> 
> So it is not a v4l2-compliance bug, but a driver bug AFAICT.

Looks like you were right. I was quite confused of what actually was the
problem for v4l2-compliance. Additionally the driver didn't also correctly
enumerate the formats for both of the buffer types.

I've fixed both and v4l2-compliance passes now.

-- 
Kind regards,

Sakari Ailus

