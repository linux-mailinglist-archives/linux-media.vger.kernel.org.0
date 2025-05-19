Return-Path: <linux-media+bounces-32774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF60BABBD0B
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89CEA1788AE
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 11:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4CB265CDC;
	Mon, 19 May 2025 11:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ANg2mois"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9159C274656
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 11:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747655814; cv=none; b=RSwGfu2vV7q5pvuifXtWBfHFom26JYTQ1+Z3sXLurD865b7cyZJhybg1s9oiEQCXp4Kc1oO/KAlt8MnuoA6xvogqPFJQCD52QR9NgILAMzOwp34IjNRf3SQbW4kpNxSeKVrnEXLK4BnMyforRDUUtKa8fuwn2Khs1LW0o1qWsMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747655814; c=relaxed/simple;
	bh=d6W8WsKL/Su4cw5zA1yzSqmSFabp12gnUvGJSpVCkxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prUTkJWkRCBhbQmidgSEBGkLDhWsERruVvQSAtQ4VnjBVqJvLHFANy1wIPcKjvrwelZbzZKoWwjQoeuPdI8oJOzfp3ZK4rgEZJu4/pqn6bMfuwXKQShYxhWob1Dr8r4n+3io+isGVTeEMrH4VvOnpp+QgAhGuYEYNeWs1qUF3B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ANg2mois; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747655813; x=1779191813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d6W8WsKL/Su4cw5zA1yzSqmSFabp12gnUvGJSpVCkxk=;
  b=ANg2moispHb6/+zEisD5h7I2USRDQs66DzeyYW0WtGpnApZV72tfQNWS
   yQUz75e/K0HQr/8dzLLnffpWNM2C7arYQ1mvoqIrv/J/R6XR4MbCbLyjm
   81voDqs1F32kwuBXorhf8TNhxins9QfrQnumUxtD8dxtgbswntX2pwLuQ
   8xwcsACmG8UFlZJi2UKipcO6f14+2oFG9j8/NrtBHNaRWHWJi7GuZMer1
   yq6ZBsu5NAH6T69CIbFDhEhH4LfaxuoLMOBU6v/ktivEpk3NUb+dZ+Jg6
   9bi+BWDl66nkx+ky1Cdy8uv6KknaOqWKOzLutFO8EmBG4Uc3LGjzIxKKu
   g==;
X-CSE-ConnectionGUID: W1s0r0N6RpCiLSPEUUE4xA==
X-CSE-MsgGUID: xiYIktgaQ9mtC3+TmmA6JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60186032"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="60186032"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:56:51 -0700
X-CSE-ConnectionGUID: CedvRqOvR9qSRpXZZrLCVA==
X-CSE-MsgGUID: oHMdxRizSo6oDRnw4WF9aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="143349535"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.190])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:56:44 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BC206120297;
	Mon, 19 May 2025 14:56:41 +0300 (EEST)
Date: Mon, 19 May 2025 11:56:41 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
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
	"Hu,               Jerry W" <jerry.w.hu@intel.com>,
	Steve Cho <stevecho@chromium.org>,
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
Message-ID: <aCsceUYURNc8_C7E@kekkonen.localdomain>
References: <20250507081338.53614-1-sakari.ailus@linux.intel.com>
 <174682345593.819131.7462679299915630940@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174682345593.819131.7462679299915630940@ping.linuxembedded.co.uk>

Hi Kieran,

On Fri, May 09, 2025 at 09:44:15PM +0100, Kieran Bingham wrote:
> Hi Sakari,
> 
> Quoting Sakari Ailus (2025-05-07 09:13:38)
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
> > 
> 
> Thanks for starting this! Definitely something I would like to see a
> solution for indeed.
> 
> > The intent indeed is to address the regular use case where we have a
> > single sensor in a camera module. For cases where we have more, we'll need
> > something else, not based on individual properties. I believe this is
> > still the way to go, to address current issues and for a couple of
> > additional reasons:
> > 
> > - Cameras with more than one sensor tend to be collections of camera
> >   modules so this is still relevant in most cases.
> > 
> > - It's much simpler to have a single property than begin having new nodes
> >   in DT. In practice such nodes would be a poor fit for DT generally as
> >   they have (few or) no functions.
> > 
> > The biggest difficulty is still in module identification. These components
> > tend to be often ignored and the best we have for a module name in that
> > case is random-looking string if even that. Besides DT bindings, we need
> > an additional (git?) tree to describe the modules that have no proper
> > names but it could be also useful for those that do, for instance to
> > include information on lens, field of view, IR filter, photos of the
> > module etc. There is some overlap with what libcamera needs, too.
> > 
> 
> One aspect that jumps to my mind here - is how do we handle variations
> of modules?
> 
> For instance I have two IMX335 modules from Arducam - which are
> otherwise identical except for different lenses with different
> field-of-view.
> 
> Do we need more properties (later?) to express the different
> configuration options of the module?

I think I'd document these as two different modules. Arducam SKU
identifiers are probably best to be used as models here and I presume SKU
is different between your modules?

> 
> 
> At some point I would love to be able to describe a 'module' as the
> whole component including a VCM for instance - in a way that can be
> abstracted as something that could be connected to a 'port' (see [0],
> [1]) where it would be helpful to be able to group/abstract a movable
> component and identify the full camera module in a way that doesn't have
> to be duplicated in every platform configuration that it could be
> connected.

This would likely require having a node for the module, too. It's a
heavy-weight solution compared to just a property (or a few).

How commonly do you swap lenses outside R&D in practice?

> 
> [0] https://www.konsulko.com/wp-content/uploads/2016/09/portable-device-tree-connector.pdf
> [1] https://lore.kernel.org/all/1464986273-12039-2-git-send-email-pantelis.antoniou@konsulko.com/

-- 
Kind regards,

Sakari Ailus

