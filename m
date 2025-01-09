Return-Path: <linux-media+bounces-24485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 200F6A06FA2
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 09:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17BA93A39E9
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 08:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D566214A96;
	Thu,  9 Jan 2025 08:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DweX6Sz8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95962214A6B
	for <linux-media@vger.kernel.org>; Thu,  9 Jan 2025 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736409707; cv=none; b=u21N2Nit4ieUwr6j1/fA+dON4nn5JKzKJGHEGcU1FLuerc1R3XEyhAjA/6QhEbrJO7Vj5Dye/CpYbNO45EQQw38B1EHLWxAeTdH5sPQUDKislZBXdOCFxUejmDJeZ3OsQ91Y+jhW6eBnodbd4UlpYdtuulOejI+9Xvih7Q+NXno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736409707; c=relaxed/simple;
	bh=4k9H8jQp3EZwsMFFQi1E+C/d4Np7q5WfaBC9YvEUMGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UyMlH2diNQ1rnUZtI4VOcxQgY9tXcGsIKM/1HZ4/y4SWsrfTOAzQcsqWihk+HoF85mtkYoBX8VzIeGEEKBu/etoA5R0VhgvvV9H6pNkY47Q+sbmYZRKhEZAnAbUp4rGGRFSRVS4eudOlmad31PxvtUqYrE0j5GStgI3GRuUTyxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DweX6Sz8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736409705; x=1767945705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4k9H8jQp3EZwsMFFQi1E+C/d4Np7q5WfaBC9YvEUMGw=;
  b=DweX6Sz8WntRSfEfDemKneRIAokTseBNOoGSV309pDPyNNVDyJzEdWhj
   WcBxnUcBXHwRZmdDR9daLSjnCnYf6KaSi982WTek3Dg8Pw/XetCEW4DWl
   2nvwrGEWLSwNmrKVnphFlXJzxCh+HL3v7ti11xZBF1BbhzB6om04cPSJ0
   bBgyGdtmWTykicgUkC/O4uXjMoETV4ZPiLvIfADO7QLh9H8WA0sTe7Um9
   ZX06KFdA0ipRdQQ7u26R9q/9dyOnmGqrtJdJkXwC5aELjH5IV07Hb/BHr
   U3++A2/3n6lqvXQNyrfiDUYS5VlbQp2rQZdlvl5/asWencPPzAY3utYNf
   Q==;
X-CSE-ConnectionGUID: J5k6IKkQSz2hWeKc1fQjcw==
X-CSE-MsgGUID: Geob455OQ9yw/ODeznsT7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40337244"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="40337244"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 00:01:45 -0800
X-CSE-ConnectionGUID: noPayPDGRAKks8Ce58vEZg==
X-CSE-MsgGUID: xlUQbGAESsSeF0GcCPhOhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107948002"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 00:01:39 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F22581201CA;
	Thu,  9 Jan 2025 10:01:36 +0200 (EET)
Date: Thu, 9 Jan 2025 08:01:36 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: Re: [RFC v4 7/9] media: uapi: Add V4L2_CID_BINNING control for
 binning configuration
Message-ID: <Z3-CYGbpNDDlHrxg@kekkonen.localdomain>
References: <20241220132419.1027206-1-sakari.ailus@linux.intel.com>
 <20241220132419.1027206-8-sakari.ailus@linux.intel.com>
 <d2808e45-f7f7-48c3-82b7-32786c8fd23e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2808e45-f7f7-48c3-82b7-32786c8fd23e@ideasonboard.com>

Moi,

On Wed, Jan 08, 2025 at 03:21:05PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 20/12/2024 15:24, Sakari Ailus wrote:
> > Add V4L2_CID_BINNING control for configuting binning and enumerating a
> 
> "configuring".
> 
> > camera sensor's binning capabilities. The control combines horizontal and
> > vertical binning into a single control as the two are generally related.
> 
> It's a bit sad we need to combine different values into one control like
> this, but I see the benefit.

Well, ideally the binning rations horizontally and vertically would be
independent but that's not how it's implemented in hardware. I thought of
using a specific type but I don't think it's worth it.

-- 
Terveisin,

Sakari Ailus

