Return-Path: <linux-media+bounces-40599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E686B2FAB2
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F4C7AE31B1
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB8833471E;
	Thu, 21 Aug 2025 13:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBQYfpXk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134681F8676
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783060; cv=none; b=hsI3jaKXL7QHEGq2rfd1nZj2NdnKy0Tkbgo2HvbHHI+Th3KLAJVfWQLc47Va4E7pcfwVoR3Nls4yvlJM6hoPLSF7QiewyEanQgR8cS/CaOP/8RtjTVRcJ6RNXIjQDFbpGir6nSM23STM9X2/AWnuS51khHfyKXtiISWZl5JQC0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783060; c=relaxed/simple;
	bh=eiO2jSr42FdAo6ZLoWDCDMaHQL6TDCgyNzXtNG/tTHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INKm6iyKr0mIjSOe3Fll3V24lWArkzwNkP8t1oqJb5B2S6XAqK79WD/9WiYYWtYg6UrxfOfcKAXjUbXf3YeZ+MGTrqXP/gRsNZxu8XWwauJ24eTVkhyqYxYvQey3yHp+YRc8Ga6ytqWzg6Fzy8rIRjnOvwFqXG1tB84f6vv+PXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBQYfpXk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755783059; x=1787319059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eiO2jSr42FdAo6ZLoWDCDMaHQL6TDCgyNzXtNG/tTHs=;
  b=XBQYfpXkc4TjaprjPljkRb/BS2CFJAub4bGMiRuZc9AC7RI3Sj+rL76O
   NcgApMYAc3bBESzdK6eZDJB1klW73qDUI7iu8GJRHQ7QbGFRIv3bd9UKh
   AjmxRmaMes/2o2cPwGiZX77rmYd1vxwXV3lCN2V+VF6/D19PMxOlntN6B
   ttC+AaoLmE8Bj3akKLw/XaJH4xzIBu2rPVVu96bjyte7msgNk7/9ThuIc
   WGTSYs3Yfn5XmSJjY2jIBEGinZcfJxaDj8FbQ6KG7BuyuzWf/gNfuwOgx
   ADUHhv41PZvM7/pgZuWnRn0poLhzDMysyjG5f6yvzuX8WaXPJDf7bih40
   Q==;
X-CSE-ConnectionGUID: FpdYzm/vRl6ws/B96ADM6Q==
X-CSE-MsgGUID: whEqDWmWTaSzY0ALIoyaYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75656134"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="75656134"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:30:58 -0700
X-CSE-ConnectionGUID: LLyNO8qhQkC2ddAhRXrMfw==
X-CSE-MsgGUID: MclZFYiMRQGHL0xvCbxMwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="173750523"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:30:55 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C398111FC36;
	Thu, 21 Aug 2025 16:30:52 +0300 (EEST)
Date: Thu, 21 Aug 2025 16:30:52 +0300
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
Message-ID: <aKcfjNOvUqlSJ_IH@kekkonen.localdomain>
References: <20250821121207.552993-1-sakari.ailus@linux.intel.com>
 <20250821124148.GE8865@pendragon.ideasonboard.com>
 <aKcXdDDxzsNZ2Bq2@kekkonen.localdomain>
 <20250821130125.GF8865@pendragon.ideasonboard.com>
 <aKcd9DtPXy7j7yYQ@kekkonen.localdomain>
 <20250821132709.GA1484@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821132709.GA1484@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Aug 21, 2025 at 04:27:09PM +0300, Laurent Pinchart wrote:
> On Thu, Aug 21, 2025 at 04:24:04PM +0300, Sakari Ailus wrote:
> > On Thu, Aug 21, 2025 at 04:01:25PM +0300, Laurent Pinchart wrote:
> > > On Thu, Aug 21, 2025 at 03:56:20PM +0300, Sakari Ailus wrote:
> > > > On Thu, Aug 21, 2025 at 03:41:48PM +0300, Laurent Pinchart wrote:
> > > > > On Thu, Aug 21, 2025 at 03:12:04PM +0300, Sakari Ailus wrote:
> > > > > > Hi folks,
> > > > > > 
> > > > > > This set removes the workaround from v4l2_get_link_freq() that allowed
> > > > > > calling it on a control handler. The Amlogic c3-mipi-csi2 driver is
> > > > > > converted in the process as well.
> > > > > > 
> > > > > > As a result there's also no definition of v4l2_get_link_freq() without
> > > > > > CONFIG_MEDIA_CONTROLLER but that should be fine now. The Amlogic patch is
> > > > > > untested.
> > > > > 
> > > > > Could you please cherry-pick
> > > > > https://lore.kernel.org/linux-media/20250821000944.27849-2-laurent.pinchart@ideasonboard.com/
> > > > > and include it in this series ?
> > > > 
> > > > If a pad is const, I'd expect the container sub-device would be, too. I'll
> > > > see if anything breaks if media_entity_to_v4l2_subdev() would switch to use
> > > > container_of_const().
> > > 
> > > pad->entity will still not be const, so media_entity_to_v4l2_subdev()
> > > will return a non-const pointer anyway.
> > 
> > It may be technically correct but const suggests the argument (and what is
> > referred from that) is const henceforth, but that's not the case.
> 
> Yes, and that's why I'm adding a const here. The function retrieves the
> link frequency, it should not change the state of the pad, entity or
> subdev. That's the meaning conveyed by the API change. Internally, due
> to the nature of the C language, we go from a const struct media_pad to
> a non-const sturct media_entity. That's fine, it's inside the
> v4l2_get_link_freq() function, and it means the function must simply be
> careful not to break the API contract. It doesn't change the nature of
> the contract.

I'd like to have a third opinion here. Hans?

> 
> > I simply wouldn't change this. 
> 

-- 
Regards,

Sakari Ailus

