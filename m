Return-Path: <linux-media+bounces-5561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D14EA85D7F4
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 13:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70A661F22240
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 12:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B607769312;
	Wed, 21 Feb 2024 12:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnrDpsAq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834705231
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 12:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708518938; cv=none; b=H7NY9ctaBHXWi3d1J7NnCWmEzhD65VtXSJyUwjHDLmnuoJMqHnRDlyuZcsuoithcepn6/CU3r28eskTxYUKHNtfzKalwgkb1i/6Qn0XMG/Ny7Rp9+U5QCV98kSRshf532bssNb3viUcI3rhGszCrrMb2Uv8sqfh8AKs4dQYqyck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708518938; c=relaxed/simple;
	bh=sfZPVY/QF4/1Qyk52OJXIOC3kJZPSkYrbsYrlWzLyeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDj7uKm7/2cVDUH210rULhTVwk2T3zXFMwFllnsvAM6cp3g/7r/Nr5pOo9t5KcWPiy7OoUYi3JaQ2pe1K5QEuo4W6JypnB1MiLy4nRvUwE292GQtqKuSLbC5f8TG5GnppwuAFmaQ/kmsTlwJUx5pC/0OBRs1YfrkrMY/gVoqUNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hnrDpsAq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708518937; x=1740054937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sfZPVY/QF4/1Qyk52OJXIOC3kJZPSkYrbsYrlWzLyeA=;
  b=hnrDpsAqvUAPOTbllRON+4fpRwGzyzuZTX2LOk0QisNjyb0+azOORMxW
   OjGN2EJIfT29JD8uEQs6OwhSi+ZsKpTwRQsOX0SY9+IP+T+mmaD0yrRw0
   6nglkPUB8+DPhw8BaJHkDGfo2Y7QL38SaQAvQAW4uUMaxoU4hAiLF4WFh
   hiGX3ALf/zsbK1AV/WfloxipOUKNA650+ZfH8CthXi8XeElXNF80/yRdo
   xZBymPlH2xV+TjTap1vH8yvAgSg6e9BRFL2cht4rWczg7jvvg0ymH2m7m
   YbeXw0A5czzDTUiLbNlm86QkVDzUtrUo2V8BD/f6rSV0zn/7phWAkg9Hn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="25138999"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="25138999"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 04:35:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="36154972"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 04:35:35 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EAAD011F855;
	Wed, 21 Feb 2024 14:35:31 +0200 (EET)
Date: Wed, 21 Feb 2024 12:35:31 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 17/29] media: v4l: Acquire a reference to the media
 device for every video device
Message-ID: <ZdXuE7StSz_vK8F-@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-18-sakari.ailus@linux.intel.com>
 <2708ec26-3156-4269-85ae-d9e783dc3bd1@xs4all.nl>
 <20240207111344.GO23702@pendragon.ideasonboard.com>
 <ZdXT43Fn8x2W5he-@kekkonen.localdomain>
 <20240221121956.GD31348@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221121956.GD31348@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Feb 21, 2024 at 02:19:56PM +0200, Laurent Pinchart wrote:
> On Wed, Feb 21, 2024 at 10:43:47AM +0000, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > Thank you for reviewing the set!
> > 
> > On Wed, Feb 07, 2024 at 01:13:44PM +0200, Laurent Pinchart wrote:
> > > On Mon, Feb 05, 2024 at 03:56:22PM +0100, Hans Verkuil wrote:
> > > > On 20/12/2023 11:37, Sakari Ailus wrote:
> > > > > The video device depends on the existence of its media device --- if there
> > > > > is one. Acquire a reference to it.
> > > > > 
> > > > > Note that when the media device release callback is used, then the V4L2
> > > > > device release callback is ignored and a warning is issued if both are
> > > > > set.
> > > 
> > > Why is that ? The two are distinct objects, why can't they both have a
> > > release function ?
> > 
> > You could, in principle, but in practice both of the structs are part of
> > the same driver's device context struct which is a single allocation. You
> > can only have a single release callback for it.
> 
> If both release callbacks freed the same data structure, that would
> indeed be a problem. There could be other use cases though. For
> instance, in the uvcvideo driver, the top-level structure is
> reference-counted, and the release callbacks of the video devices
> decrement that reference count. I don't expect drivers to do something
> similar with media_device and v4l2_device, but I'm not sure if we should
> forbid it completely. If we do, I would then rather deprecate the
> release callback of v4l2_device completely.

There are quite a few drivers using the struct v4l2_device's release
callback, it seems. We very probably can't get rid of it except possibly in
the long term.

The documentation already takes this into account, see patch "media:
Documentation: Document how Media device resources are released".

-- 
Regards,

Sakari Ailus

