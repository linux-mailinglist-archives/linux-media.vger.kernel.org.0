Return-Path: <linux-media+bounces-40574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B338B2F93D
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D3D7188AE0E
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1859321F5B;
	Thu, 21 Aug 2025 12:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2hNV+FA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8555319844
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 12:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780988; cv=none; b=mKZpx9lrzUjuTv9/V7YbaDWth7J4LHosoDELJvke6CKt1rfdMcMNz83hLH/cEkoMeeMWxKt1GbNm4egCeH12UlaxAwPQ1JPjz7kk0wEiyNf31WXusEUA3qpnuIKzqhQd+KwtwkOaVDXNcOFgj4tDNYt56eiSdGxhLHFy+lifK70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780988; c=relaxed/simple;
	bh=r7WTt2oFZ6/U8vtnEMTYt1LusCx+1FVPffkuABu99c4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QuLF1fP1OEMsGuEXjjTPa7KgB3LwSVAGXC8KB8JMAKhY4aEVZxVd6PHUNYA1hbD/0jMnw8yrK9OpzhDrAs+tA51jaZJiBjxHA2d/hMN8WjkLIjQz630EW3KIsBDnm2Lpb93ZV4l46cSn2OE6U9jsqmwlE7MFp58ineJd84RTsQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2hNV+FA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755780987; x=1787316987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r7WTt2oFZ6/U8vtnEMTYt1LusCx+1FVPffkuABu99c4=;
  b=g2hNV+FAQJhUSSjAW6PBQPQ8hTwgbU/EqLmXVsBAYYGGjS746iQ0lQwH
   brGYBFvU5xWmIrcoAeCXtDcDs578AxspXLHFTzgnCSkROTCaGMpIjlxee
   tp37DZxYrthnbttQTB7FrI5G9nF0a6BdpKZu+JR8dbSQsC9NwTB3f9a1w
   POqphz5W83uW8QWRuJZLbhJW0P1Mo7HfRmpp/cacGnJUy877cbhLq1Nqr
   hsD/5Qx2w71rnzqobWlims5LnVLZZN73U8OFZkJj72JF1L1jw5LPM/YWr
   h5yaiToLElbyhjp/Y4r6kpkwLY6DOWc+PljBdB8bue4XRIrcbAZMPXSPT
   A==;
X-CSE-ConnectionGUID: MPdwvNNmSoa4JccNwm95vw==
X-CSE-MsgGUID: LjkLTkkFRU6BnA0f+nj0Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68664801"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="68664801"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 05:56:26 -0700
X-CSE-ConnectionGUID: BHCAlmlITB+1B1S9U+x37A==
X-CSE-MsgGUID: nQiMiZ7ES16BAcBfzT1Vug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="172823505"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 05:56:24 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8BAFB11FC36;
	Thu, 21 Aug 2025 15:56:20 +0300 (EEST)
Date: Thu, 21 Aug 2025 15:56:20 +0300
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
Message-ID: <aKcXdDDxzsNZ2Bq2@kekkonen.localdomain>
References: <20250821121207.552993-1-sakari.ailus@linux.intel.com>
 <20250821124148.GE8865@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821124148.GE8865@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Aug 21, 2025 at 03:41:48PM +0300, Laurent Pinchart wrote:
> On Thu, Aug 21, 2025 at 03:12:04PM +0300, Sakari Ailus wrote:
> > Hi folks,
> > 
> > This set removes the workaround from v4l2_get_link_freq() that allowed
> > calling it on a control handler. The Amlogic c3-mipi-csi2 driver is
> > converted in the process as well.
> > 
> > As a result there's also no definition of v4l2_get_link_freq() without
> > CONFIG_MEDIA_CONTROLLER but that should be fine now. The Amlogic patch is
> > untested.
> 
> Could you please cherry-pick
> https://lore.kernel.org/linux-media/20250821000944.27849-2-laurent.pinchart@ideasonboard.com/
> and include it in this series ?

If a pad is const, I'd expect the container sub-device would be, too. I'll
see if anything breaks if media_entity_to_v4l2_subdev() would switch to use
container_of_const().

-- 
Regards,

Sakari Ailus

