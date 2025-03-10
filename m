Return-Path: <linux-media+bounces-27918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 101FFA58C3E
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 07:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0A1C7A3944
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 06:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CAC1CC89D;
	Mon, 10 Mar 2025 06:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9SU1Ctb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32F24683;
	Mon, 10 Mar 2025 06:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741589121; cv=none; b=bhp/AGCvcJe16x8W0uFYAWFWDUgYSHgdV/gLOKGnkXE6KnJAEniUwRsW8jRZs85nKdxtXn384wZDrhD/5TPjhpBWAQvovh+L1F40wU+NQU/6fFXwqhUm74zXU2JuyZVMCLU70hJ9zhZKbfmkc9436xOL4RrKu/B2opnYMIEzO/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741589121; c=relaxed/simple;
	bh=Stqj2pQXoYVResVJjOZb6aSlYehB38CWW74n2nQRQFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cznjPzf5nGL1ANZGaOC1GvJVvtPxvaEGbcfEKcWhBKedQMq2hzf5TZ6TaYb4DYLkJ1HkfWKPOMkVhI2b44ETA0RFPAzpvrlZM1+oGvkdMa5zguQRaP6sl2M01PyHDalsQbbI1J6NTYIVtzxi/QP4ueYX81rMJgi+fVU4hOI3G74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9SU1Ctb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741589120; x=1773125120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Stqj2pQXoYVResVJjOZb6aSlYehB38CWW74n2nQRQFk=;
  b=b9SU1CtbojJa58BmnAKuwE/r+Ym3mUfNRmWsbTXNhpk1EhnE3i58eTqs
   32zC4/Vf22ZG2bWHpEmXxlQEdZTTxJ4UK2u7lo8OowkLfj1BTsvWcBu1Q
   ouFd3vUVKz472/KgIzVHgidEq9nROQ9Fn7chkO74VwkQkPE1gAAYdpksb
   nDndShOsO7POJQDBV8fvJue8XbBoWlvavVSeOwt0d2tFt2wa/qLxYgCxu
   0yZycRo6BEwEzBa10pDhFiSiLYWtT2oaRPV1ypVtZhyB2qnDAwlw5xqjA
   iCSq6G4x03LY2HtcduYRsPTT8KXebMR4b9MCeyUxlOHoXWi5cOl1ilopc
   A==;
X-CSE-ConnectionGUID: khHQBAcSTByNlyf5hGK2gw==
X-CSE-MsgGUID: OeB3RTgkRBaI4Z6eCfs86w==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="53949890"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="53949890"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 23:45:19 -0700
X-CSE-ConnectionGUID: it3K4jNIQRGgmXoLQP0XQg==
X-CSE-MsgGUID: BdPAAYj7QKCrVdXAETkN/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="124893133"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 23:45:16 -0700
Date: Mon, 10 Mar 2025 08:45:12 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: eugen.hristev@linaro.org, mchehab@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, hugues.fruchet@foss.st.com,
	alain.volmat@foss.st.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, andriy.shevchenko@linux.intel.com,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Convert media drivers to use devm_kmemdup_array()
Message-ID: <Z86KeDfg9GwFBpGQ@black.fi.intel.com>
References: <20250228073649.152157-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228073649.152157-1-raag.jadav@intel.com>

On Fri, Feb 28, 2025 at 01:06:47PM +0530, Raag Jadav wrote:
> This series converts media drivers to use the newly introduced[1]
> devm_kmemdup_array() helper. This depends on changes available on
> immutable tag[2].
> 
> [1] https://lore.kernel.org/r/20250212062513.2254767-1-raag.jadav@intel.com
> [2] https://lore.kernel.org/r/Z7xGpz3Q4Zj6YHx7@black.fi.intel.com

Bump, anything I can do to move this forward?

Raag

