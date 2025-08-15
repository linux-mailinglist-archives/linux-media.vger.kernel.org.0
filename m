Return-Path: <linux-media+bounces-39972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 309ABB27BEF
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 10:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BF521D01C12
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 08:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA9129B8E6;
	Fri, 15 Aug 2025 08:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zr3bs6xJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A595319879
	for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248043; cv=none; b=pjaBlxRg6iMoWCtVg4+6dyKo0YAZdajASfVCVmXcaDshvQETsiHZvBa+D7NfmrE1h2iD7hAGJUYkIbUdOLtyC39kkbyfUfCwkhCNPLPNk196HU4AmMY9Vleq/n77D9YT32S/gCUq2uWQU431B8lPi/kNcMZn2Suf7vchiijlAHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248043; c=relaxed/simple;
	bh=VnpOiai8yWzH4LpSpENFOum5cMuiZ9Cztg1riVyw8Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETBbowF7evkSujXb6Gz/KmteaU9AXZRU1WqBVDIQI7CZj8PjILLI/PgJaejhu0TAgQMas1QbH0Fc/PdCBT1vARO3ScDROP5XcwAKb1pck373nPb4x6FDpu8PKBSNTykCzefVv4ihiIKeB8rRpXuS616ba7Tb2uIgqh/+2yXjvpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zr3bs6xJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755248041; x=1786784041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VnpOiai8yWzH4LpSpENFOum5cMuiZ9Cztg1riVyw8Hw=;
  b=Zr3bs6xJA2QllVBfEHMWD8HyOHm5FCG7WRnmz/pv+NYYrm/eJahEzHTT
   j+sLlbwnrPbGjrSd9mG8Z0JrSRUB07S97nJMAHCi6zwqeCwDHxN/levEI
   ZuSmoVbcuB6+8ADoLwv4baVmuQZiQD4qUxPVkzlBXVPvtzW9B9LFhDY6U
   Xc5VuUbuN1wdrEAneTluCB5nbWTaEXVZSmAklLpQp+dUCB3pHO5uZGazT
   VAcXv4Yc1pURRGIEJEx6LlYjQaZ0H8hXqiGxLgug4OhClowHGjcpbb0Y0
   uAl1GTfDF5DJVEfc8kssLlxy9gAxuDo+709oC3kqGJS0ueAT0Y89F/ZmV
   w==;
X-CSE-ConnectionGUID: e6n2HLJZSYaD6OsCTtdz3Q==
X-CSE-MsgGUID: E+ME/niiQ66ET0XmstCR8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="75139637"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="75139637"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 01:54:00 -0700
X-CSE-ConnectionGUID: bkuv4A33Qd+rL50Rx2Cq3w==
X-CSE-MsgGUID: Fxb5JtZJR2iKP5/O1Yyd9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="197823930"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 01:53:54 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0CF9C11FA65;
	Fri, 15 Aug 2025 11:53:52 +0300 (EEST)
Date: Fri, 15 Aug 2025 08:53:51 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	hdegoede@redhat.com, arnd@arndb.de, alain.volmat@foss.st.com,
	andrzej.hajda@intel.com, benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com, hansg@kernel.org,
	jacopo.mondi@ideasonboard.com, kieran.bingham@ideasonboard.com,
	khalasa@piap.pl, mani@kernel.org, m.felsch@pengutronix.de,
	matthias.fend@emfend.at, mchehab@kernel.org,
	michael.riesch@collabora.com, naush@raspberrypi.com,
	nicholas@rothemail.net, nicolas.dufresne@collabora.com,
	paul.elder@ideasonboard.com, dan.scally@ideasonboard.com,
	pavel@kernel.org, rashanmu@gmail.com, ribalda@chromium.org,
	slongerbeam@gmail.com, tomi.valkeinen@ideasonboard.com,
	linux-media@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/1] media: v4l2-common: Improve
 devm_v4l2_sensor_clk_get() documentation
Message-ID: <aJ71n5XXblxUBxxc@kekkonen.localdomain>
References: <46b76530-023f-4f36-bec3-1d3ab79c682c@kernel.org>
 <20250814135007.273084-1-sakari.ailus@linux.intel.com>
 <p34vy7ioby56z7qmfvhyqmbyrln2fpy2djsmv5a5ergwks7ppr@h2kurip4uouo>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <p34vy7ioby56z7qmfvhyqmbyrln2fpy2djsmv5a5ergwks7ppr@h2kurip4uouo>

Hi Mehdi,

On Fri, Aug 15, 2025 at 08:00:06AM +0200, Mehdi Djait wrote:
> Hi Sakari,
> 
> Thank you for the patch!
> 
> On Thu, Aug 14, 2025 at 04:50:07PM +0300, Sakari Ailus wrote:
> > Remove the extra leading period and provide more elaborate explanation for
> > why devm_v4l2_sensor_clk_get() is only allowed to be used on camera sensor
> > devices.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/media/v4l2-common.h | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index 9d6c236e8f14..39dd0c78d70f 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -623,7 +623,7 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
> >  
> >  /**
> >   * devm_v4l2_sensor_clk_get - lookup and obtain a reference to a clock producer
> > - *	for a camera sensor.
> > + *	for a camera sensor
> >   *
> >   * @dev: device for v4l2 sensor clock "consumer"
> >   * @id: clock consumer ID
> > @@ -643,6 +643,14 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
> >   *
> >   * In this case try to set the clock-frequency value to the provided clock.
> >   *
> > + * As the name indicates, this function may only be used on camera sensor
> > + * devices. This is because generally only camera sensors do need a clock to
> > + * query the frequency from, due to the requirement to configure the PLL for a
> > + * given CSI-2 interface frequency where the sensor's external clock frequency
> > + * is a factor. Additionally, the clock frequency tends to be available on ACPI
> > + * firmware based systems for camera sensors specifically (if e.g. DisCo for
> > + * Imaging compliant).
> > + *
> 
> I don't know about the last sentence about ACPI. Does it help explain
> why this helper is intended only for camera sensors ?

There couldn't be a generic function to do this due to how the firmware is
implemented, that's because I think it's relevant.

I think we could later on support ACPI clock input resource descriptors but
I'd wait for actual use first -- or DisCo for Imaging update advocating
them instead of the clock-frequency property. In ACPI clock handling in
general takes place through power resources so unless drivers are
interested in a particular frequency, there's no need to provide that. Of
course some cases could be up to a debate at least to some degree.

-- 
Regards,

Sakari Ailus

