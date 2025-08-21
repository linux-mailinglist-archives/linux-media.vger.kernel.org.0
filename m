Return-Path: <linux-media+bounces-40586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85162B2FA56
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 565E217D0B5
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA0C33437E;
	Thu, 21 Aug 2025 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHLrtABm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850873314D7
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 13:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782652; cv=none; b=R+iCB63bcEj1YYt0iDDN1QXAX1V/FWftYSQ2lGHmPmP5k7Zy2C0amGgoOy029FJim5dUpuvHb8V/XbgFPUEKQypOotRU07l7D7QT3ZAPSpKeT+VrRrwddNgbYCAlcmnb46CR/xBX5cxPGLeVBSYtuTVyBZjI2bl9yEJciNVl/Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782652; c=relaxed/simple;
	bh=EKepTPGrD6SSQrFjUaSiMIr/EbJAkuzis4T81kKeHyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tu+n1zwn+ec+uT/M8h/d3+6V7n+wRwTdlgWiMmaWDTEEK19kPZAQgH3D3bYdHFgNKsrDg6onUOkLHOij8GqqkrJuK2TL005bA3Gjc4Jf7DKCxaiQHsIPzGAHZjQjFNTwmdWfDaWADXSrCblx8CIjVAF0P/nJptIJ8zseZBZFhDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHLrtABm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755782650; x=1787318650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EKepTPGrD6SSQrFjUaSiMIr/EbJAkuzis4T81kKeHyE=;
  b=iHLrtABmsRLAGXhHMvwOEBd8JktKEnFjsoqm3cJCJpIcedpA79TF8sZ4
   rLHnYeplSJ+mROBrwMF46cLWzp+SaeklpoxeuXxuzChOZv++GYqSiiSI+
   Bv9E+MrkESE5wFEhQejvyidU8u2xKuEO//uTyC7SVMd13rpF73oh6glDP
   f24gUlgZg2e1C6YLVUFryu2dN/ukjj1kTLpl8hWW+QNToP965nLErxMej
   Oq62Y+leQLyPgA1SZutUF8WtiPyOvlf1HEHkfMZJa2wX7MIzQewRgZDtF
   1PvQaFPQZ9JzOoKz2pgl5aJSYh4aoqddq21d0IS+IwBg5Koe6Q3HOnlit
   w==;
X-CSE-ConnectionGUID: LRD7/e3CReCWf3ZoO91h9g==
X-CSE-MsgGUID: FopjCLQiRmihmxfYsjrQBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68342873"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="68342873"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:24:09 -0700
X-CSE-ConnectionGUID: UZRWikwgRaOLyCJ1bImqXw==
X-CSE-MsgGUID: QQdRJ686Qe+ePVZuQCC+bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168654409"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:24:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2AA7911FC36;
	Thu, 21 Aug 2025 16:24:04 +0300 (EEST)
Date: Thu, 21 Aug 2025 16:24:04 +0300
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
Subject: Re: [PATCH v2 0/3] Drop control handler argument support for
 v4l2_get_link_freq()
Message-ID: <aKcd9DtPXy7j7yYQ@kekkonen.localdomain>
References: <20250821121207.552993-1-sakari.ailus@linux.intel.com>
 <20250821124148.GE8865@pendragon.ideasonboard.com>
 <aKcXdDDxzsNZ2Bq2@kekkonen.localdomain>
 <20250821130125.GF8865@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821130125.GF8865@pendragon.ideasonboard.com>

On Thu, Aug 21, 2025 at 04:01:25PM +0300, Laurent Pinchart wrote:
> On Thu, Aug 21, 2025 at 03:56:20PM +0300, Sakari Ailus wrote:
> > On Thu, Aug 21, 2025 at 03:41:48PM +0300, Laurent Pinchart wrote:
> > > On Thu, Aug 21, 2025 at 03:12:04PM +0300, Sakari Ailus wrote:
> > > > Hi folks,
> > > > 
> > > > This set removes the workaround from v4l2_get_link_freq() that allowed
> > > > calling it on a control handler. The Amlogic c3-mipi-csi2 driver is
> > > > converted in the process as well.
> > > > 
> > > > As a result there's also no definition of v4l2_get_link_freq() without
> > > > CONFIG_MEDIA_CONTROLLER but that should be fine now. The Amlogic patch is
> > > > untested.
> > > 
> > > Could you please cherry-pick
> > > https://lore.kernel.org/linux-media/20250821000944.27849-2-laurent.pinchart@ideasonboard.com/
> > > and include it in this series ?
> > 
> > If a pad is const, I'd expect the container sub-device would be, too. I'll
> > see if anything breaks if media_entity_to_v4l2_subdev() would switch to use
> > container_of_const().
> 
> pad->entity will still not be const, so media_entity_to_v4l2_subdev()
> will return a non-const pointer anyway.

It may be technically correct but const suggests the argument (and what is
referred from that) is const henceforth, but that's not the case.

I simply wouldn't change this. 

-- 
Sakari Ailus

