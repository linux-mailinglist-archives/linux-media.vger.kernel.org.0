Return-Path: <linux-media+bounces-27832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B429AA565EC
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 11:56:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1CEB3A7B55
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B87921323D;
	Fri,  7 Mar 2025 10:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDMcrW7D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E7621019E
	for <linux-media@vger.kernel.org>; Fri,  7 Mar 2025 10:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741344947; cv=none; b=b+F4UhAdrkM9+KJ2OcfR0NlvSNFekJjro54f28hT5ylCHsuqE6ngX/2Knrf2agygNvTVg6VKM4H0cz5fenOi2qML56HsH7MvJb7ZWTI1unAyY/CRSdrnLPonGv7DUrCe0UVAfx5QcMQZrNDthISEeHJI4WCf4XoyX74HHHSrfLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741344947; c=relaxed/simple;
	bh=725mOYdUznaKxvS195LOncTGxZlN7PlASqq6UwrH2dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DM1n1UEwRfZxcu/OHym7UyOJn42BE9gFP4Nt760L5W0U7fW5iLSb2qgVc1FhRex/zeiXu2Js7RvHvk8YZAch+BU9UqSUDRCazKZrefJeIzZAF7DOq2lmWeYlrib3XOl1E3RXRnbd3L2y1PHVpU6n3FwJzX+bibjEyPhmCLEXUr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDMcrW7D; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741344945; x=1772880945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=725mOYdUznaKxvS195LOncTGxZlN7PlASqq6UwrH2dc=;
  b=cDMcrW7D/XRwm9K+IK9n1XO47EZXEVZ/BjDoHd+0SUq+Ij7VzsjaI2hS
   wfehXKTG9YINccUDYZHmvXa2M+GLgJ5XPY+geapOJGRHKIkKo6EW1nPlD
   /kIBda8gLjL7MZmBOkCmwZdBMzVNXQiGcFIzTJ8KizdMruyne0S/rOkmf
   s0GKeYlDATaA1OiR41n+lQt8fO7I5YiO0mTlZGCvI9bwRo1Y9TRHxd0w+
   d8xR3RZEMGEl17tNa5c1nLSeC60DJeWRTC0dl4yHUF4GAq/PVkBnyDSRb
   f5AX9xaUA/hSj3uxM7MdVESfbSUfDLchJYEvutMK4YxtG3K6LoE+39K4L
   A==;
X-CSE-ConnectionGUID: x7xeseviQ+uPky+lSCMBkA==
X-CSE-MsgGUID: Z+AHZlQxTwWP6Hu6B99K7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41643998"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="41643998"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 02:55:43 -0800
X-CSE-ConnectionGUID: TL/U/4vPSECy/PUmvF8lcQ==
X-CSE-MsgGUID: YNbqV3wXSm6WiFNorJcMKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124329005"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 02:55:40 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CF91211F9DA;
	Fri,  7 Mar 2025 12:55:35 +0200 (EET)
Date: Fri, 7 Mar 2025 10:55:35 +0000
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
Message-ID: <Z8rQp2OCPZbvSnjH@kekkonen.localdomain>
References: <20250306060427.859679-1-dongcheng.yan@intel.com>
 <Z8q-zqzAXPUzkUmP@kekkonen.localdomain>
 <c20e68e2-11ef-4f35-a3ca-45d0435e2e22@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c20e68e2-11ef-4f35-a3ca-45d0435e2e22@intel.com>

Hi Dongcheng,

On Fri, Mar 07, 2025 at 06:00:56PM +0800, Yan, Dongcheng wrote:
> >> +		/* MIPI Clock Rate = ByteClock × 4, defined in lt6911uxe spec */
> > 
> > What does the byte clock actually signify? Bytes per second on CSI-2?
> > 
> 
> This is more like a DSI related calculation, I think lontium uses the
> expression related to HDMI and DSI in the video field.
> dsi_clk = Bitclk / 2 = Byteclk * 4, dsi_clk is mipi clk, which is used
> as link_freq.
> Here Bitclk = HTS * VTS * fps * bpp / lanes.

The PHY for CSI-2 and DSI is the same, so the same formula is applicable.
The chip is HDMI/CSI-2 (isn'it it?), so I wonder how DSI is related to
this. How many HDMI lanes are in use?

-- 
Regards,

Sakari Ailus

