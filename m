Return-Path: <linux-media+bounces-17134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAF8964526
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 14:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84F3528B060
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 12:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED901AE864;
	Thu, 29 Aug 2024 12:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RheK0eJn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F801AE875;
	Thu, 29 Aug 2024 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724935286; cv=none; b=U3HFGtyEoJDiqrmblHIghhOuhG4t9r04nfSmhH/Psaaye3Jw+4U59Fs2oF1zj1tFzIqSnMbJ0ZkLAiqA/taOf3kFXfQHsQ0Zb1BPn/Z9p/ko0OIVb2IRNKp7LNYuObWvSZIhW442bhRETc6sIMZB0X1GLd98QzVljj+aEgSBRbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724935286; c=relaxed/simple;
	bh=Zky79R8egVa2/458w11Fjk7M+s9u0qsu+pDvP20i4R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyFF2cwovmrMFfyE/Zwm4m+rCUGuGBcUqlfWyppBpW0tmZ8ywd2LGmC3FMQSF0amK/VEEtVORoaEqAal+KyfC8dFxvPM5IChF8HePuJeQ1cdXngn+9ikSEBGejIaafy+oxUbIG1CgObIXPk0JeIO15zXM5BxGAt5oSZOBpjaBz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RheK0eJn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724935285; x=1756471285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zky79R8egVa2/458w11Fjk7M+s9u0qsu+pDvP20i4R8=;
  b=RheK0eJnKdl7hBuwZO0MPjzV3WU/f/s9za8cIRejURJ2FFS5ikxtwNLV
   hLgnuWceclEGgb3qMsvuvABJYekHBSuMrz8mhYAXzzmXy6QPPlNvUcTRm
   4kDLnaIGviVZYZ2D/lu6am0GapZ1SgqtM15x3s2YcXPCIzcM2yrfDvCQs
   080g6uybmY6aystZiCEOQwQ7CO0U+wGxL8Qh3ME03upEt2M9BQunSc0uD
   w8fpmIaek4TnecGBLdUE8mO+X3M1s1+K3JifxcpQhkJD/Q0P3nyazsQk4
   eLRNNCoLNRjys2bUWHhDsK4ERBewVF4/K5mvdzNLRB7ZlN5GK4kBFZ4pi
   Q==;
X-CSE-ConnectionGUID: MWMzuYjaRoqLJThnBEUPCw==
X-CSE-MsgGUID: xvsd5VNSRGO//k/inHMqgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23475730"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="23475730"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 05:41:24 -0700
X-CSE-ConnectionGUID: ptMrzakzRz+L/7xuh5uPjA==
X-CSE-MsgGUID: 3wxTiZkJSsWmbKmy7hz5cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="67945773"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 05:41:23 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1A25A11F843;
	Thu, 29 Aug 2024 15:41:20 +0300 (EEST)
Date: Thu, 29 Aug 2024 12:41:20 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Bara <bbara93@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v2 1/2] media: i2c: imx290: Check for availability in
 probe()
Message-ID: <ZtBscIbqWr2GWrJF@kekkonen.localdomain>
References: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
 <20240828-imx290-avail-v2-1-bd320ac8e8fa@skidata.com>
 <ZtAdvtkjr0XNbvmu@kekkonen.localdomain>
 <ZtBsB1iqm4PhbfnH@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtBsB1iqm4PhbfnH@kekkonen.localdomain>

On Thu, Aug 29, 2024 at 12:39:36PM +0000, Sakari Ailus wrote:
> On Thu, Aug 29, 2024 at 07:05:34AM +0000, Sakari Ailus wrote:
> > the next time. I'll wrap the line this time.
> 
> Based on the other review comments I'll wait for v2.

Oh well, wrong e-mail. Please ignore.

-- 
Sakari Ailus

