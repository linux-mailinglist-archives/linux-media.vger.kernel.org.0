Return-Path: <linux-media+bounces-40575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80300B2F910
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CC787B2791
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAA236CDE1;
	Thu, 21 Aug 2025 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wog2UHRt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFE62C859
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 12:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755781078; cv=none; b=VmGMRs//1UeU/td6q5dsvD9ddNCDZDJE3arq7ZscOD21L+QaqwfQOx4L4p3qa36hAD4xl12mpiX/B5mBjunM+LbH1SrtFAaqUZ5qFpEkCVAOTndw+ufGDi+ePbWnKELaFJAWKme5/48TqYyybeFH924tLEDQQXMMMNIV0UROeEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755781078; c=relaxed/simple;
	bh=oJoFilf4WCry/mSUgNHo0CNOoHVGrnaKInZAijlTXuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrEO0B9JfTJrpobFMdWdiOCH1GAyJyTMtw6DsYaPC6c1aOdJDkBTyXCV5xSQbLlst4tHYKCyjxZB1f0IX/ke9DSUTTdh6WkqKKoXnT8fM6c+IAUDX663BE+EDf0G0GzmXTiWUux+bADul6sCw6224RQnWyP+SUfhTOGukd5uGag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wog2UHRt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755781078; x=1787317078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oJoFilf4WCry/mSUgNHo0CNOoHVGrnaKInZAijlTXuk=;
  b=Wog2UHRtvcXu6prSITnKf9S/sJooQ4cVFaSVsjZE7GrrKkspUzxtsGWQ
   Y+xu3aDJvqN4rYni1ADCrgUey4tyhgZbSfUEsMeprgYlyUfDOLcLvFubR
   4qJY00LfCAzB0UjFRwFFU10VWpCxfT+taRCJPyW4Yms8ecEhcbOVhjlMA
   Rkq1lV1Zg6t8dYwGUaEk5aIonjRvjy++9xtopA8aSelt+crgkiFXp95xT
   NjYYidStyh6zV7j0qvj38lB8uHt0lETxo5bEGdHH1m2KtrpH56mVcy0oP
   EbaubYTH0t+n/RVbVs45p596oUpn39ta0j1QjrIP7is9uMeP9JbddDzP5
   A==;
X-CSE-ConnectionGUID: gz1s0N1hS/mUpDCMAhyz+A==
X-CSE-MsgGUID: 6ccCBl3yT56EfXdSDXAJ7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80665883"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="80665883"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 05:57:57 -0700
X-CSE-ConnectionGUID: Av07Q+HGT8GapvwLvzSw3A==
X-CSE-MsgGUID: K+sbPHFqSiy+khrPqr8CMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="205585556"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 05:57:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AD91611FC36;
	Thu, 21 Aug 2025 15:57:51 +0300 (EEST)
Date: Thu, 21 Aug 2025 15:57:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Keke Li <keke.li@amlogic.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v3 3/3] media: v4l2-common: Update v4l2_get_link_freq()
 documentation
Message-ID: <aKcXz7BomAQo_gnS@kekkonen.localdomain>
References: <20250821121207.552993-1-sakari.ailus@linux.intel.com>
 <20250821121207.552993-4-sakari.ailus@linux.intel.com>
 <20250821124056.GD8865@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821124056.GD8865@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Aug 21, 2025 at 03:40:56PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Aug 21, 2025 at 03:12:07PM +0300, Sakari Ailus wrote:
> > Document that v4l2_get_link_freq() obtains the link frequency primarily
> > by calling the get_mbus_config sub-device pad operation.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/media/v4l2-common.h | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index ab0ce8e605c3..c387deffbdd0 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -567,9 +567,11 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> >   *	 times two on D-PHY, 1 on parallel. 0 otherwise.
> >   *
> >   * This function is intended for obtaining the link frequency from the
> > - * transmitter sub-device's pad. It returns the link rate, either from the
> > - * V4L2_CID_LINK_FREQ control implemented by the transmitter, or value
> > - * calculated based on the V4L2_CID_PIXEL_RATE implemented by the transmitter.
> > + * transmitter sub-device's @pad. It returns the link rate, primarily obtained
> > + * through the get_mbus_config sub-device pad operation or secondarily through
> > + * either from the V4L2_CID_LINK_FREQ control implemented by the transmitter, or
> 
> "through either from" should be either "through either" or "either
> from".
> 
> > + * value calculated based on the V4L2_CID_PIXEL_RATE implemented by the
> > + * transmitter.
> 
> I think this can be clarified further:
> 
>  * This function obtains and returns the link frequency from the transmitter
>  * sub-device's pad. The link frequency is retrieved using the get_mbus_config
>  * sub-device pad operation. If this fails, the function falls back to obtaining
>  * the frequency either directly from the V4L2_CID_LINK_FREQ control if
>  * implemented by the transmitter, or by calculating it from the pixel rate
>  * obtained from the V4L2_CID_PIXEL_RATE control.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks. I'll use the text in v4.

-- 
Sakari Ailus

