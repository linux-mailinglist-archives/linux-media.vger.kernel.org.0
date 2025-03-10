Return-Path: <linux-media+bounces-27934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF36FA590C7
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 11:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83CAC188D3F8
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 10:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB16225760;
	Mon, 10 Mar 2025 10:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6ai2Xsk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53321224B00
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741601344; cv=none; b=P1YKjHsqB8KswhD1CXcGyZkV4IMWryq/sMoY+A2sy8/wuOhOrA8PFow36PItFdmuv20GlOZTFQKrd1QF1Jr/22tavcvQFULqFRfjHksEBf1ZlSC2aKl6fFmzF4hgqGIFkRPy4AH9sCDCWWDGnsxaPGvatoROCEV1hrCiMVNYEdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741601344; c=relaxed/simple;
	bh=ftEfaCon6ean9n923fdL9swVd5UqyZCefPeaIV9zcV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xa46S7PAhgaHsgyr1jLf8UohYhDgzinEwVgxT9wtbqGqyi92eHD86OxSCnGhJ40WVJZAmTr8l6NTrsP0V3OM0MI6/D6rYcpAovXAUZwidMXeAPxz3YMlvsm8wcGyW880Wdsheblc7u61bIcUdK2E+d//r2LZkfGuf9bS13nvPis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6ai2Xsk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741601342; x=1773137342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ftEfaCon6ean9n923fdL9swVd5UqyZCefPeaIV9zcV8=;
  b=m6ai2XskIEdAsI+RSylcKadxCSsGKIp/0sWdQalSJMcxW4SvzieNGfvS
   yh4cr4+rWKwLD9DpN3ArZKH2AovZNzuw1sOnRVrHcId5NWpGS6NbuBcOK
   iRCHFnJuHz1fey/t/mMEx3RFq/PJ1PwtwANf5G3NS/WQoSHe22f+Uy4ei
   d/94DU54zmxO4v41y5iwiTa6KXVfcAHSCcfv+SC/K1SAufUf/fOSlZP78
   q6O7NnfdaeLCfZCBs5IDgZ311mA07UbcLA1NJ3gITXKerRPytiRhDBlLI
   46wKQFazNXNYpJ6sitlr1eA71pMG4I2It8CslKlkr8xDCegWRnmo5K9nt
   Q==;
X-CSE-ConnectionGUID: 6+dQkRg4QnS5F1z1L1h0Mw==
X-CSE-MsgGUID: U6IuDmbHRY6N3XLy+RJ+3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="41839103"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="41839103"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 03:09:01 -0700
X-CSE-ConnectionGUID: RbnzHVW3Q7ajNYZtsAZSBw==
X-CSE-MsgGUID: hvoEb8KpSEKeTdV6DhuuxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="150903398"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 03:08:58 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B47C211F7F0;
	Mon, 10 Mar 2025 12:08:55 +0200 (EET)
Date: Mon, 10 Mar 2025 10:08:55 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Yan, Dongcheng" <dongcheng.yan@intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl, ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, daxing.li@intel.com,
	dongcheng.yan@linux.intel.com, ong.hock.yu@intel.com,
	balamurugan.c@intel.com, wei.a.fu@intel.com, xiaohong.zou@intel.com
Subject: Re: [PATCH v7] media: i2c: add lt6911uxe hdmi bridge driver
Message-ID: <Z866N44N3lhX59CT@kekkonen.localdomain>
References: <20250306060427.859679-1-dongcheng.yan@intel.com>
 <Z8q-zqzAXPUzkUmP@kekkonen.localdomain>
 <c20e68e2-11ef-4f35-a3ca-45d0435e2e22@intel.com>
 <Z8rQp2OCPZbvSnjH@kekkonen.localdomain>
 <f1dec7e7-b2ee-4746-b266-5927faf36c61@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1dec7e7-b2ee-4746-b266-5927faf36c61@intel.com>

Hi Dongcheng,

On Fri, Mar 07, 2025 at 09:36:30PM +0800, Yan, Dongcheng wrote:
> Hi Sakari,
> 
> On 3/7/2025 6:55 PM, Sakari Ailus wrote:
> > Hi Dongcheng,
> > 
> > On Fri, Mar 07, 2025 at 06:00:56PM +0800, Yan, Dongcheng wrote:
> >>>> +		/* MIPI Clock Rate = ByteClock × 4, defined in lt6911uxe spec */
> >>>
> >>> What does the byte clock actually signify? Bytes per second on CSI-2?
> >>>
> >>
> >> This is more like a DSI related calculation, I think lontium uses the
> >> expression related to HDMI and DSI in the video field.
> >> dsi_clk = Bitclk / 2 = Byteclk * 4, dsi_clk is mipi clk, which is used
> >> as link_freq.
> >> Here Bitclk = HTS * VTS * fps * bpp / lanes.
> > 
> > The PHY for CSI-2 and DSI is the same, so the same formula is applicable.
> > The chip is HDMI/CSI-2 (isn'it it?), so I wonder how DSI is related to
> > this. How many HDMI lanes are in use?
> > 
> 
> My expression misunderstood you. I am just explaining why ByteClock is
> used here to name. Yes, ByteClock is Bytes per second on CSI-2, and
> because CSI-2 uses DDR(Double Data Rate), here link_freq = bitclk / 2 =
> ByteClock * 4.

Ack, thanks for confirming this.

-- 
Sakari Ailus

