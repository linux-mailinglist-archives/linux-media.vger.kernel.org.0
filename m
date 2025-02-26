Return-Path: <linux-media+bounces-27030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29822A45D3C
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 12:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 367A73A9637
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 11:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E060E2144DB;
	Wed, 26 Feb 2025 11:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFGscWTP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE02D322A
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 11:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740569679; cv=none; b=JDItWW4k1a5mJAsXwKWchVIyUV9KKcfnuy1UyMOu9rboL6iQdGw9tA0ZE5qFKpFhcj3zhzBJKrwNThWu31WsgbbqdljEYdDYJfGG4Hd5svDUFkYYbZcmZfty0hvXw+JXf6uUxL3NDSIZ5kFM5cRwnggz0cpbTd4xNzNwOFBxJfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740569679; c=relaxed/simple;
	bh=NfosLfhMy+7hxgJd+cdLO+SV8T5v1pueV5bSrcq9gTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fw9MXT0wxw/MCSn3wbUxopbXzDdmXfci0xG1Sb9BOqlPX+4g1930b0qoeEQ0CLntuLzaFXoIdphUEco9piua1XoLYLUJW4o939XCydnf9CfM8x4qT3WLr2F7J7q9rSmXiQoc2f7hGg6Zo7FDqnXJEb9HFcsB7v/PVwyFNTpgX8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFGscWTP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740569677; x=1772105677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NfosLfhMy+7hxgJd+cdLO+SV8T5v1pueV5bSrcq9gTs=;
  b=gFGscWTPAFPkuZgdV4vvBLtMytktxUIG2n6RPIKz3Fh++0YZMJ15df4V
   voMSx5R1ezRH/AYyOoReioF2NRQfvz/n1mc+9FP/OiDxxRTgsf8y9Gs5x
   cIh9MOyjYn6/HN0ouwF0zYUFVdMPC5drBfLmJ0kusLiWfZ5/IhgEnckHt
   37wnlAhVUBhTAhcW6NMTYwusaTwgYjt2tJLWDuRkdBpQaSZC4Qvdey7g3
   GF/g8ftPUALOO2Xg5f72pvTsKNxAYgtWK5mFypOpPuO4zqdu+iEIfC7Cp
   IM7tXP3S8PAx5RnqmM6+ZNQFtc8cqlIYVrVKeOq8l3+3NBQWaxeDFEHQF
   w==;
X-CSE-ConnectionGUID: 5Hb16/9RS3SpddCghPAbhw==
X-CSE-MsgGUID: c7mV4cfqQUegoyZIsExQAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41539295"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41539295"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:34:37 -0800
X-CSE-ConnectionGUID: t+u6Cfz2QmS2YaikdiFPmw==
X-CSE-MsgGUID: 1zUIt84YRpKwTWnkhxCtvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="153847955"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:34:34 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6DE7211F944;
	Wed, 26 Feb 2025 13:34:31 +0200 (EET)
Date: Wed, 26 Feb 2025 11:34:31 +0000
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
Message-ID: <Z778R0tL-2knQOwd@kekkonen.localdomain>
References: <20250210060923.2434047-1-dongcheng.yan@intel.com>
 <09dd94dd-f63a-422b-9452-647f24b7c217@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09dd94dd-f63a-422b-9452-647f24b7c217@xs4all.nl>

Hi Hans,

On Wed, Feb 26, 2025 at 11:51:48AM +0100, Hans Verkuil wrote:
> On 10/02/2025 07:09, Dongcheng Yan wrote:
> > +static int lt6911uxe_s_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
> > +				  struct v4l2_dv_timings *timings)
> > +{
> > +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
> > +	struct v4l2_subdev_state *state;
> > +
> > +	state = v4l2_subdev_lock_and_get_active_state(sd);
> > +	if (v4l2_match_dv_timings(&lt6911uxe->timings, timings, 0, false))
> 
> You're not unlocking the state here.

I think the driver needs to do that as it's using the state lock to
serialise access to its own device context data structure as well.

-- 
Kind regards,

Sakari Ailus

