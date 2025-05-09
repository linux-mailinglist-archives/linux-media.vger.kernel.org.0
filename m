Return-Path: <linux-media+bounces-32113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C40AB0DE0
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 111983B403E
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4662C27465D;
	Fri,  9 May 2025 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GcWVEREu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A9021FF23
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 08:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780955; cv=none; b=eZzjDyAAi0SeBkekiMv/iMwyXASYr7ynOHo+7Rgy+++1iF+tyTUW80Ajzdkklyucv/SdZL8YVXksq2I3rIa92l9IqIREum18BmhJXg6aSNR9Wrz9leppbDTlj4A+OFx4ua4VwxyIDp6R+yjAKuhP6+yKvcXegvM8rMN3+sjZJQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780955; c=relaxed/simple;
	bh=42fHj4r0jioJNAGglgxgoAzdmkMcb3jf9MFoCy3/hKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+8zBJvjjHSpbPJl0wrpUkfbxYrtDeSlpGdld5hMGD0heQ6Sf7N24oGRmXc0wttepX2jivu5C4p6FnEa1nxOrg7zz50mp4cDmEVe/rI1We8EFe/aRgA79Mf9eVfVrqdx2BA/DubVS3W/XqOQdCtnbNMUVlWEwZVe6tGDsCJeGpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GcWVEREu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746780954; x=1778316954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=42fHj4r0jioJNAGglgxgoAzdmkMcb3jf9MFoCy3/hKI=;
  b=GcWVEREuaJS1Ca0MA2+R3MUq/IhERkt4KN8w11iT350WMFUU3T/lTLp+
   t8vWDvW06sigYS593Skozd9hLOTNmPAV2yC9BzRGzdhtt7LuY0mAph9E6
   S7g1DNUL2omr7MJ1SX7XYyeAGOhVkTpqstbXhptblMbO5NUYxOidVhjY7
   YDxkTRNdkhUdzLmlFSA8EcgV6WX2KfywS1FHpoeI2jcIT6Yo4iv4WWpEg
   LKbyddgFpkRtNgeayMmFY5Wb1dM86ycomKY4RI+CMONhku5HOjCbInrXO
   WUZkkX46mVYnwHAXZrR0bLEuFNhBtqmA5RFpa+Ejxp/5Fcw/8hvTjGDzD
   g==;
X-CSE-ConnectionGUID: rO985rEdRzyFN9s6wYKdpg==
X-CSE-MsgGUID: XRFJVlOdTYGHsoDoi8aXwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58817786"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="58817786"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 01:55:53 -0700
X-CSE-ConnectionGUID: p3b3p6ZbQ7KYDXPQixDDfA==
X-CSE-MsgGUID: sf8CwSPlSCWuXT98RaL1yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="141510630"
Received: from opintica-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.95])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 01:55:45 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C07F21201C3;
	Fri,  9 May 2025 11:55:41 +0300 (EEST)
Date: Fri, 9 May 2025 08:55:41 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>, Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Maxime Ripard <mripard@kernel.org>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [PATCH 1/1] media: dt-bindings: Add bindings for camera modules
Message-ID: <aB3DDer_LQIvoF_v@kekkonen.localdomain>
References: <20250507081338.53614-1-sakari.ailus@linux.intel.com>
 <918b7cba-195a-443e-a4bf-218e7cc6745e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <918b7cba-195a-443e-a4bf-218e7cc6745e@kernel.org>

Hi Krzysztof,

On Thu, May 08, 2025 at 07:51:34AM +0200, Krzysztof Kozlowski wrote:
> On 07/05/2025 10:13, Sakari Ailus wrote:
> > Add bindings for camera modules to allow telling especially the user space
> > which module is found in the system. Camera modules do not have a device
> > node so this is a property for the camera sensor device node. This allows
> > describing modules that contain a single camera sensor.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Hi all,
> > 
> > Here's the patch to give some advance warning for the camera module
> > discussion. The good thing is that it's quite short.
> If you do not expect any review, then mark your patches with RFC or
> [IGNORE].

This was indeed meant to be an RFC: right now we're still discussing the
requirements.

-- 
Regards,

Sakari Ailus

