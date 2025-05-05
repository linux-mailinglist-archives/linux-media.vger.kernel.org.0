Return-Path: <linux-media+bounces-31690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 896DBAA8E8C
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 10:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DC9B3B7CE5
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 08:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA131F4639;
	Mon,  5 May 2025 08:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjK397Cj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AB11F3BBB
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 08:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746435129; cv=none; b=ZCc1U/U0oTwcsw513+Jtk+2TA0tvWQxqKjyBPQO0f1RDbH97gGHrT49QLSR8u8iUv22SL1jxwMpuQigoBlRP3y7evOFaOAm/9wC4g/RzUcodn8L+3Scf+98IH1YrHU+RCWFQl5MIgKk0fdJ84D3r7NS+nLd2RPsh3WsEfIDgMe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746435129; c=relaxed/simple;
	bh=3fmaZRn+ufPmBNNZOimLphI2w5x+FvUIdMpTDo+LtBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQaxwq2IxHOgUsl4y0XKWA1HspGFBXduIH+4V1OAHJllbU02T38Qlrnv8HUSXmu/AfxOHk2wbG3OoiQ7FE/0OISx2+0FmzZH6EQ1qyq8VpnzcEFy00/At/myXxHh5Wuhnzt5vKMvFuDgchAlVa7nFSsaELH3um74hm5TcpsIRHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjK397Cj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746435129; x=1777971129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3fmaZRn+ufPmBNNZOimLphI2w5x+FvUIdMpTDo+LtBo=;
  b=UjK397CjDh0kQnsesnEceY1RmapZIrKabdReGo5U8Hv38I7NihKlMwL0
   BDyo5qit2VpeQj5EcHncD75wjZClzV7qqgQyOpXppXYcO6pEweorwX5RH
   pw4CHx7l9LBNTRxt5vNqbcV6sNFBm6xdvxuk8NmE6YClzXdKpCmLSHda5
   RFvspf4BMZZ7s+k/Glx3XWz6aDIFMxsVJcM8JNLsCb4FKU7niZu+AwFSj
   gRsOJSHBcCP3jnC+6MoWoMF99VznEQZjorPDltf8Z/VVMANRapHoF96oC
   bqc8UDbyQQ0E/yyR3fmhUEU8j/deUzrzqjfldJqY00PJSCgkTEN4nkVKp
   A==;
X-CSE-ConnectionGUID: +d3qC3QdQ0Ox1UkRja8SGQ==
X-CSE-MsgGUID: vbcyeoFrTOSJ58dhkqe33g==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="65438674"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="65438674"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 01:52:08 -0700
X-CSE-ConnectionGUID: kSv8GRsjTqKkw3D2aolJ/Q==
X-CSE-MsgGUID: W7iqc9wuSJaCoZJm0kbqTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="139983917"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.252])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 01:52:06 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F3566120D43;
	Mon,  5 May 2025 11:13:02 +0300 (EEST)
Date: Mon, 5 May 2025 08:13:02 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v3 0/5] media: intel/ipu6: continue on ipu7 code sharing
 preparation
Message-ID: <aBhzDoUZSb40MzBv@kekkonen.localdomain>
References: <20250502154446.88965-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502154446.88965-1-stanislaw.gruszka@linux.intel.com>

Hi Stanislaw,

On Fri, May 02, 2025 at 05:44:41PM +0200, Stanislaw Gruszka wrote:
> Cleanups and code sharing preparation with ipu7 driver.
> 
> This is on top of:
> https://git.linuxtv.org/sailus/media_tree.git/log/?h=devel
> Plus:
> https://lore.kernel.org/linux-media/20250317073856.162147-1-stanislaw.gruszka@linux.intel.com/
> https://lore.kernel.org/linux-media/20250428161643.321617-1-stanislaw.gruszka@linux.intel.com/#t

Thanks for these. I've applied patches from 1 to 3 for now.

Going forward, could you post cleanups and reorganising the code into
common bits in separate sets? It'll be easier to see where this is going
when all related patches are in the same set. Cleanups and fixes we can
merge earlier on anyway.

Thanks.

-- 
Kind regards,

Sakari Ailus

