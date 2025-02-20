Return-Path: <linux-media+bounces-26469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02044A3DC66
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 009BA1778AE
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE74D1FBCA1;
	Thu, 20 Feb 2025 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ke62+k5i"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE1E1FECA6;
	Thu, 20 Feb 2025 14:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061020; cv=none; b=pTJxClVpOVlIU94NmW16q/0dDAee6V+Te1Kd07+OXJGkOrH8t6T/oZZcBTs1Rq3NkAaRmNMMkl3SCbzOD2gHxCP9iKtZSA2Kq+GLASaMI5Z0y9nOkAQRuz+8gO50BQUXsglEd9hoIZVqWpwpzizGc8/9MDQvULHMMTe3G+piMaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061020; c=relaxed/simple;
	bh=90sGWHgBiFWC8WmFaCJEHLODTZgic+HaEiiKAov7w4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwwNCoJtaq+HUNDGDNwYtjzQshTbjPPoZN256M8SMsuYoeJ92+QjTnOh4q+q6kXPqtk8H7qDDgV6wqbJN4MxgHwKl+wLsFDl28JtA1ffgLtvs6MeqymyurasOaQiCX7D8rwv7o4pCIsRsziMs4wK5FfrkrixYS46dggWHXPioYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ke62+k5i; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740061019; x=1771597019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=90sGWHgBiFWC8WmFaCJEHLODTZgic+HaEiiKAov7w4A=;
  b=ke62+k5iT3nUABtyLj1Eu2JDOvcH/eVtsvx4+Rz+bC5UvNiWlnzenmU6
   U0Xi+qxhc7ySX1QJwotH5qSDf0put+lS8XaW/+rCEKXY03F8rx5FiTsFo
   Yg5U4F9gnJsOG+U2WkKquWhArjxBBChDtCzuxrXTtvjbioo1y+qyQkYg1
   kQu8NpZggrUxw+4zJQ6thkTOtqu27KTKNnsOW2zQoApTF4s0TvdSaGNDr
   bCpIdAAD4IxanoXTZ3I6C8fC66CBf7C/sNhX2179l1WBrdQtDUQgi+S7a
   q367V8AHEA19BgXFXZg7T6RnwXljvVYAZSUKLnJKgE8zlEcQ1Yd3AvfK5
   A==;
X-CSE-ConnectionGUID: ipYRUw8YSKCGq1faEvlWzQ==
X-CSE-MsgGUID: 7xhhdUE8ShiEJKS2Sn569A==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="28438585"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="28438585"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:16:58 -0800
X-CSE-ConnectionGUID: hq/WbzC4RBWGAxh3UZBwRw==
X-CSE-MsgGUID: xVSkBMrZR/qIo+idZR+y5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="119672464"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:16:54 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 649C911F7F2;
	Thu, 20 Feb 2025 16:16:51 +0200 (EET)
Date: Thu, 20 Feb 2025 14:16:51 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] media: add v4l2_subdev_state_xlate_streams()
Message-ID: <Z7c5U6u5rr0-X0aK@kekkonen.localdomain>
References: <20250220092036.6757-1-demonsingur@gmail.com>
 <tw6x663t5dmxsdarrxjtopza3mou3lnhwazu3dfv2k27fv47v2@bvftfepqqhss>
 <c94580f0-3ab0-4a19-a996-9bb37e23dd39@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c94580f0-3ab0-4a19-a996-9bb37e23dd39@gmail.com>

Hi Cosmin,

On Thu, Feb 20, 2025 at 03:01:41PM +0200, Cosmin Tanislav wrote:
> 
> 
> On 2/20/25 1:38 PM, Jacopo Mondi wrote:
> > Hi Cosmin
> > 
> > On Thu, Feb 20, 2025 at 11:20:32AM +0200, Cosmin Tanislav wrote:
> > > Currently, the v4l2_subdev_state_xlate_streams() function is used
> > > to translate streams from one pad to another.
> > > This function takes the entire subdev state as argument, but only makes
> > > use of the routing.
> > 
> > Correct, but is this a problem ?
> > 
> 
> No, it's not a problem.

I think I have a slight preference to keep the pattern of referring to the
state as other functions do.

I wonder what Laurent and Hans think, too.

> 
> > Is this the first step for a larger rework or is this a drive-by
> > beautification ?
> > 
> 
> Mostly a drive-by beautification to avoid passing the whole state around
> where we only need the routing. I'm planning to submit drivers for more
> GMSL2/3 chips and we're using this just to not pass the whole state
> around. I think I can just use v4l2_subdev_state_xlate_streams(),
> but I had these patches in my tree and it would have been good to get
> them upstream, in preparations for submitting the GMSL2/3 drivers.
> 
> > I'm asking because (and I know it's hard to strike a balance) this
> > kind of changes tend to make back-porting a more painful, and if
> > only justified by "it looks better" I would be a bit hesitant in
> > taking them.
> > 
> > 
> > > 
> > > Introduce a v4l2_subdev_routing_xlate_streams() function which can be
> > > used without the entire subdev state, to avoid passing the entire state
> > > around when not needed.
> > > 
> > > Convert all usages of v4l2_subdev_state_xlate_streams() to
> > > v4l2_subdev_routing_xlate_streams().
> > > 
> > > Remove v4l2_subdev_state_xlate_streams().
> > > 
> > > V2:
> > >    * Fix description of parameters
> > > 
> > > Cosmin Tanislav (3):
> > >    media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
> > >    media: use v4l2_subdev_routing_xlate_streams()
> > >    media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()
> > > 
> > >   drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
> > >   drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
> > >   drivers/media/i2c/max96714.c                  | 16 ++++++-------
> > >   drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
> > >   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
> > >   .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
> > >   drivers/media/v4l2-core/v4l2-subdev.c         |  7 +++---
> > >   include/media/v4l2-subdev.h                   | 10 ++++----
> > >   8 files changed, 53 insertions(+), 47 deletions(-)
> > > 
> > > --
> > > 2.48.1
> > > 
> > > 
> 

-- 
Regards,

Sakari Ailus

