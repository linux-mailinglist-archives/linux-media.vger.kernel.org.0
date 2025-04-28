Return-Path: <linux-media+bounces-31219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 104AEA9F472
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 17:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 299613BFF5B
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 15:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED54270560;
	Mon, 28 Apr 2025 15:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mec72dAV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E2529D0D;
	Mon, 28 Apr 2025 15:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745854179; cv=none; b=rVP0E5Fkr44dwxmtCxAro+w4n0nPzVrqi+UuOWMUTUSZb8oZDSS2LQs3kNHNZ6c0HavPDna046laJXhDY9D3c/XtNveAk9tfvn32vYZzXBtB93Ro7huzLlFl2Ws9VXsGOBTlLiGdx4axxDUN6K21o6GYi3rNuxTXhZGmBqdNFJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745854179; c=relaxed/simple;
	bh=3qPKbJj/vgOBUPJepC6lSWcEMTN36+KodSuGvFHFbUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YiK9x/pFHVxnr6hEkMctk21MjbZM62F5Mwdty9yeujNnNUNa4vMURR0rxBAY1G7WYUV82SeQXBCuA0DKTIsbbswdVnBUbc5x6xlXf1zL2WIKNlr5qObJgy25RKO63VQvBexmS53P2ioZbpCqf0zGlQXTBoScCz5POW1DyvrCyto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mec72dAV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745854178; x=1777390178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3qPKbJj/vgOBUPJepC6lSWcEMTN36+KodSuGvFHFbUA=;
  b=Mec72dAVaUaszIiSMNdBtRWSE8Yky7mEmCn8xqGHm+jiwJPF8nRfWJCJ
   Y4sbn0W+P0vm+M0iE+AhuLmzHwwoY8BHqbV0K2sYNMIC6IIzTSpGd3Tuu
   z6eBCoVRpF/Zjt04mOF4xQmhHxTg+fz5zPhIFIL3rUo9wkh28CvDP+ugf
   6pYhQeXTrFEAWx6BjKB9ZycNRbSTycZ9sV/zGUtcqL93RSnIN7QC1lXg+
   qRtiJw4a+Cp2RbdAszq2KAB6IeD6rC/G1bYNmBUb+GRD6Xqu54Cl/QF3q
   2ohYOtWf6kod40j0sadjpzIqND9dOP5U6yvjHUNwuY9fvA5dp5NWpsh9/
   w==;
X-CSE-ConnectionGUID: H670ZN/jSp6y3Zh3foyfew==
X-CSE-MsgGUID: C1kGOTOLS+a/1cjOHhByoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47590175"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="47590175"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 08:29:37 -0700
X-CSE-ConnectionGUID: iquNtVCcRkuv0DkXBphH9Q==
X-CSE-MsgGUID: +okzcWZDQIeWwZTTyYBLUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="138731777"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 08:29:34 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1145C1208E5;
	Mon, 28 Apr 2025 18:29:31 +0300 (EEST)
Date: Mon, 28 Apr 2025 15:29:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	hverkuil@xs4all.nl, andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com, u.kleine-koenig@baylibre.com,
	ricardo.ribalda@gmail.com, bingbu.cao@linux.intel.com,
	stable@vger.kernel.org, dongcheng.yan@linux.intel.com,
	hao.yao@intel.com
Subject: Re: [PATCH v3 1/2] platform/x86: int3472: add hpd pin support
Message-ID: <aA-e2zBMgb1OF-8U@kekkonen.localdomain>
References: <20250425104331.3165876-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425104331.3165876-1-dongcheng.yan@intel.com>

Hi Dongcheng,

On Fri, Apr 25, 2025 at 06:43:30PM +0800, Dongcheng Yan wrote:
> Typically HDMI to MIPI CSI-2 bridges have a pin to signal image data is
> being received. On the host side this is wired to a GPIO for polling or
> interrupts. This includes the Lontium HDMI to MIPI CSI-2 bridges
> lt6911uxe and lt6911uxc.
> 
> The GPIO "hpd" is used already by other HDMI to CSI-2 bridges, use it
> here as well.
> 
> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>

Thanks for the update.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Regards,

Sakari Ailus

