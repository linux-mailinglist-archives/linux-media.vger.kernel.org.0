Return-Path: <linux-media+bounces-27031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3A6A45D4A
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 12:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B2C81897AB0
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 11:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F702153EA;
	Wed, 26 Feb 2025 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/uvCfzk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C87322A
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 11:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740569799; cv=none; b=dMMq+P2DP8y05KUrcAtulHFCpMQe3LAW/mtHZMTa/00ZVcfKKtm+75YeSLEUCrSxF3vh9iAT2niaiwY2uxpFGGftkfzOcMIq+PTeIqVGqGO7hafrrTiufyCUYwxRmv9Noydnw+2BaGRuYyZHo6O4dtscqEVKnG2PCVbwXlGu4Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740569799; c=relaxed/simple;
	bh=pT5en15CKkCPW/er7fANvO8IwLdQocjON+iCLWxrRBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4eUyg6Niqy4s8bb6o44wzxrG17Lx2TMuCwePl+n3dxpA0WcR4tQCW6zd0suejhaFINGJXYpyLoYQ+af6l7YdJ7LhOPeAqO7VGjMVjClt8QRHumiQYerFf4IyVWVLCxgtJCuuXb1atv4FJrTxZO5yxW9B7U+xRCRk3Uv8SUujUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/uvCfzk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740569798; x=1772105798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pT5en15CKkCPW/er7fANvO8IwLdQocjON+iCLWxrRBQ=;
  b=F/uvCfzkwFBhu9lT0JgPLfoYjaxbmqW+0vGU5np5cg4t1fyrChCko9gJ
   HIuCUrxpSitSDeECH5sAlsaUBOFT9UF4CVvxyrTGrb8WPHOeVTmLY/taG
   nmP3Ih4SmEw95snIa1nXeYhiRVWVt+vLv7qYrTi4unZF622lLL3FTUX4H
   U/vIc7Ts4CtFMfYso1aDP7YitlZi9EN6XhzLMNmozqYYJX9i3xvSeOpgW
   KBvG1j1B7HZ7tdgRWFfWOotUPoi3NNSNTbDmSwMCgdKOgfRslgCRBMB4g
   /nk4yUuIzvf9mwN19TIMKUezTwRSa4NMm6Qz+EPM77rbo+cy9dIp/MgxY
   Q==;
X-CSE-ConnectionGUID: GX8TRBPHS3aw2T0f51GdZw==
X-CSE-MsgGUID: nhEi6R2yTGOsNYNJmoE8zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41539401"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="41539401"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:36:15 -0800
X-CSE-ConnectionGUID: fFR1F0CWRlqzyMrxjvksDQ==
X-CSE-MsgGUID: sWWXCqKiR5+Dy9kvMq9Gow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="153848288"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:36:12 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A6BC711F944;
	Wed, 26 Feb 2025 13:36:09 +0200 (EET)
Date: Wed, 26 Feb 2025 11:36:09 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Dongcheng Yan <dongcheng.yan@intel.com>, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, daxing.li@intel.com,
	dongcheng.yan@linux.intel.com, ong.hock.yu@intel.com,
	balamurugan.c@intel.com, wei.a.fu@intel.com
Subject: Re: [PATCH v5] media: i2c: add lt6911uxe hdmi bridge driver
Message-ID: <Z778qdS_4fkIm3dk@kekkonen.localdomain>
References: <20250210060923.2434047-1-dongcheng.yan@intel.com>
 <09dd94dd-f63a-422b-9452-647f24b7c217@xs4all.nl>
 <Z778R0tL-2knQOwd@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z778R0tL-2knQOwd@kekkonen.localdomain>

On Wed, Feb 26, 2025 at 11:34:31AM +0000, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Feb 26, 2025 at 11:51:48AM +0100, Hans Verkuil wrote:
> > On 10/02/2025 07:09, Dongcheng Yan wrote:
> > > +static int lt6911uxe_s_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
> > > +				  struct v4l2_dv_timings *timings)
> > > +{
> > > +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
> > > +	struct v4l2_subdev_state *state;
> > > +
> > > +	state = v4l2_subdev_lock_and_get_active_state(sd);
> > > +	if (v4l2_match_dv_timings(&lt6911uxe->timings, timings, 0, false))
> > 
> > You're not unlocking the state here.
> 
> I think the driver needs to do that as it's using the state lock to
> serialise access to its own device context data structure as well.

Oops. I misread the comment and the code. Please ignore.

-- 
Sakari Ailus

