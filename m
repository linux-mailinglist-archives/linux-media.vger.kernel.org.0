Return-Path: <linux-media+bounces-47954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90854C9778C
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 14:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 640113A35AF
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 13:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6642C30F527;
	Mon,  1 Dec 2025 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5WFNXiA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42452F5A23;
	Mon,  1 Dec 2025 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594134; cv=none; b=KgJjnfQDC/47+qqNUFNjnUJ1Z2JUNT2B0MvA4iA4BYr1NpWfkVAFmIqYuoDdQ/dbaOnKtTgI5DsLbFWBrcTZs63odkCVceNm9+RPZiF3tcOPCiiztcCg3t3qbTvdb7Hr4jbiWWJF3KWAL/QUegtPi7EQ5RScP7Nh1G7xtYxkkpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594134; c=relaxed/simple;
	bh=zBhKvrYIYmGzNnSp9N4v414e9rx+SbS84pM+RPL/hsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLQxwbxYSjSoehAMwgufp4odWEhKkKL9k1l645/wny2lZAKy2LUk5NyCBWzb3kMd+AFAgSnLY6iBYvOTWDtUPJ/fTGIik8xBS0LktuK39TiSj4/fABPCKFemFYpxuErFmPfxXE2tpHP8cyd+MZnyVkDFjuZDNUOZY1U/EvYptN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5WFNXiA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764594133; x=1796130133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zBhKvrYIYmGzNnSp9N4v414e9rx+SbS84pM+RPL/hsk=;
  b=i5WFNXiAa+uGujtYGkRwFt+dzIKLsOUobKflB82o5xxiRutCdcR7ZbYm
   K5jya3PKUxPvl1igduM1u8QVuPUWd07l+O7+cRqJJHjaE9xmhIF0NfU5u
   H4vYwO02sBhSzqJi++P7FnLQATgDf+ooohOag1ii7glq/HSNPt9RdAXHO
   SFrHjT63q7LXtxYlX447POwyyXdBNFdkw+jw5C5pFKJ9ZS5d6xGfsfjkP
   cXZhq9wHJw7RIlimj/jOfCy2V8g7Wa3QcY9U91txmXo1K+SurWe+rSbtG
   3EGZsYZg79GBTvAPvUUzU3+uKPapLc2WVlztwuGO6SqelOXTls0865mpO
   w==;
X-CSE-ConnectionGUID: MfTUJxmdQpCMFtGFpkNtMg==
X-CSE-MsgGUID: pTTHc7AWRB2VKrChz3FvPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="78001110"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="78001110"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 05:02:12 -0800
X-CSE-ConnectionGUID: dGHm7A39S86jBrv1aLLJ/w==
X-CSE-MsgGUID: OQNXB+kKTv6YjMh3fa+68Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="199185518"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.162])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 05:02:10 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 676F011FA74;
	Mon, 01 Dec 2025 15:02:11 +0200 (EET)
Date: Mon, 1 Dec 2025 15:02:11 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: johannes.goede@oss.qualcomm.com
Cc: Xiaolei Wang <xiaolei.wang@windriver.com>,
	dave.stevenson@raspberrypi.com, jacopo@jmondi.org,
	mchehab@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5647: use our own mutex for the ctrl lock
Message-ID: <aS2R0z_pHd64fpOf@kekkonen.localdomain>
References: <20251201000026.690298-1-xiaolei.wang@windriver.com>
 <4553d9ed-ba4e-4f83-b48e-e819e7979293@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4553d9ed-ba4e-4f83-b48e-e819e7979293@oss.qualcomm.com>

Hi Hans, Xiaolei,

On Mon, Dec 01, 2025 at 10:31:59AM +0100, johannes.goede@oss.qualcomm.com wrote:
> Hi,
> 
> On 1-Dec-25 1:00 AM, Xiaolei Wang wrote:
> > __v4l2_ctrl_handler_setup() and __v4l2_ctrl_modify_range()
> > contains an assertion to verify that the v4l2_ctrl_handler::lock
> > is held, as it should only be called when the lock has already
> > been acquired. Therefore use our own mutex for the ctrl lock,
> > otherwise a warning will be  reported.
> > 
> > Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> 
> Generally speaking as a default locking setup for sensor
> drivers we are moving in the direction of removing driver
> specific locks and instead using the control-handler
> lock everywhere, including using it as the active state
> lock, see e.g. :
> 
> https://lore.kernel.org/linux-media/20250313184314.91410-14-hdegoede@redhat.com/
> 
> which sets ov02c10->sd.state_lock = ov02c10->ctrl_handler.lock
> and then removes a bunch of manual mutex_lock / unlock calls
> since all ops which get called with a sd_state will already
> have the lock called when operating on the active_state
> (and when called in try mode they should not touch anything
> needing locking).
> 
> Note if you also want to make the ctrl_handler lock
> the active state lock then you need to add calls to
> v4l2_subdev_init_finalize() / v4l2_subdev_cleanup()
> to allocate the active-state to probe().

I agree with the above, but the driver is old and it uses its own lock to
serialise access to its data structures while it uses the control lock
separately. So this looks like a bugfix that could be backported.

I wonder if anyone still has a system with this sensor.

-- 
Regards,

Sakari Ailus

