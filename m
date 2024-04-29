Return-Path: <linux-media+bounces-10310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B708B5256
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 09:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 893B81F21CA3
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 07:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0456A14005;
	Mon, 29 Apr 2024 07:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZQSdoL3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2F6EED4
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 07:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714375731; cv=none; b=HER4rKWhapDFA6XTievxIJVw18Sv4pnH172Fcf4IkT+XiWZ61OlOGwFAehxcvDNfd3A+fmgcYJrocbHDeFv9dQBH6L0mLm2L95dR1GXxlWFQxvKEKYr7qF7mVuP8GtZcRz79YhjS/mc8W/qiJyzfpkmSVXgHCNuBauTVXKm0yQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714375731; c=relaxed/simple;
	bh=rcvuF7DK6wxhdEmazgsDVlzVrqEUnsApqRXXydRbGIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7FzrGR9N2WKhhLw4YhNTSQmeJE1CpnyU23laGV+xSEmaQis5PQT3oFnVwgedo7cKOyvkWxjgRYrE/8i/QTQoseKt83ptU31hnYEcfa+/XKRWEQirm3SylOMgY1PJx8l+PkF2h9NkMQ0Os6paxjIHbnPR9Ru+TEpuLoVNAOdje0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZQSdoL3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714375729; x=1745911729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rcvuF7DK6wxhdEmazgsDVlzVrqEUnsApqRXXydRbGIc=;
  b=XZQSdoL3KLbAlztqtyMtLA/vxJgJHI22FiiuSZgw/xAMOxM1w6+oM8cT
   FnCELNkjJCcXElQaj32ffsVuy/gBIymildS1OSaLbZi+roJfLU8AUFyGY
   SSvafSqkPeJlXxhUpmrY0jTUUE4wjhPvc42cmR34xuySHcY6iR/KK0Uzu
   7ZSI4KC2emEiWrYGs6DapV38i8wDaDUttUIdtDmye1u/E66GuKjHRtHHg
   bKdociIPP7p9MSJHpk/148uCjJnsIOy5hs/fbSjJrhaaKIjWtWiebtmLI
   OreoxolCrAwrXO9kRhsG6fvM3CT72yIAxyazoRbPje/IdO/wQyg6koM3N
   w==;
X-CSE-ConnectionGUID: 6px1KhbkR5eGFwBE0DU2IA==
X-CSE-MsgGUID: +e6pSGaATeq9j0CxI6cdjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10243324"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="10243324"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 00:28:49 -0700
X-CSE-ConnectionGUID: M4sc2W79QPS4ehY0K766HA==
X-CSE-MsgGUID: HSMixKrWTnKIACXVQaF0ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26099548"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 00:28:47 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 380DD11F830;
	Mon, 29 Apr 2024 10:28:45 +0300 (EEST)
Date: Mon, 29 Apr 2024 07:28:45 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v2 0/3] Use INTEGER64 type for MEI CSI LINK_FREQ control
Message-ID: <Zi9MLcZzS4xW1tyU@kekkonen.localdomain>
References: <20240426145538.654212-1-sakari.ailus@linux.intel.com>
 <20240428232028.GD4950@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240428232028.GD4950@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Apr 29, 2024 at 02:20:28AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patches.
> 
> On Fri, Apr 26, 2024 at 05:55:35PM +0300, Sakari Ailus wrote:
> > Hi folks,
> > 
> > An integer menu isn't a useful control type for conveying the frequency
> > depending on an external device to the receiver. Instead, in the MEI CSI
> > driver, just obtain the link frequency from the upsteam sub-device and
> > pass it on to the receiver.
> > 
> > The v4l2_get_link_freq() is changed to add support for this and it's
> > documented as well.
> 
> Using a control for this seems to be a bit of a hack :-S Wouldn't it fit
> more nicely in the .get_mbus_config() operation ? That would avoid
> exposing this to userspace, and would also have the nice advantage that
> the value could be queried per pad.

Works for me. I also think it's better than using a new control for this
actually.

> 
> > since v1:
> > 
> > - Add a new 64-bit integer control V4L2_CID_CUR_LINK_FREQ instead of
> >   re-using V4L2_CID_LINK_FREQ.
> > 
> > Sakari Ailus (3):
> >   media: Documentation: v4l: Add CUR_LINK_FREQ control
> >   media: v4l: Support obtaining link frequency from CUR_LINK_FREQ
> >     control
> >   media: ivsc: csi: Fix link frequency control behaviour
> > 
> >  .../media/v4l/ext-ctrls-image-process.rst     |  4 ++++
> >  drivers/media/pci/intel/ivsc/mei_csi.c        | 24 ++++++-------------
> >  drivers/media/v4l2-core/v4l2-common.c         |  6 ++++-
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  5 ++++
> >  include/uapi/linux/v4l2-controls.h            |  1 +
> >  5 files changed, 22 insertions(+), 18 deletions(-)
> > 
> > 
> > base-commit: 6612d1ae37b52d37d1d515d7c5110b9f3afe94d2
> 

-- 
Regards,

Sakari Ailus

