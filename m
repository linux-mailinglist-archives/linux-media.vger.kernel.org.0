Return-Path: <linux-media+bounces-50256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D48BD06718
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 23:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5054A3021067
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 22:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EB63242A9;
	Thu,  8 Jan 2026 22:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9Ji2aiN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A612035966
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 22:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767911711; cv=none; b=l0SuwyZHiB0tweaE+0kprRYSy/a8058+ETwJlCW31jed9fw4OpVyXIsWa63X7UWgEAqCkW8OCwnESJgw3rW7xJ7cWfs3Uo24UTxlviV1e2J3sGGvOg5ulwYgsAvZCaWow/O63gPxqTlflBQRG8lDtBZZiVeepKR+vrXqDGW83iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767911711; c=relaxed/simple;
	bh=BFvSjeWXzNr/PuXNYa4v26agNVtyxd+7oWemAuuXC0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozCuLgR8hsFBNSdHn7fAA9TMJzgHXEuSTHr0ZbBwuX5KcSuLDKxPB/L3SttYS50wESepXb9haanN3fwiLXm4wjSPaVJjoUPgnbP7Xq5sT9xh+Qvxf6wJE0w0qu5FxC7meAoYVoeg5WZcaHXTOyDzW7Owl53ag1Xcuh4c6fL9rDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c9Ji2aiN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767911710; x=1799447710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BFvSjeWXzNr/PuXNYa4v26agNVtyxd+7oWemAuuXC0Q=;
  b=c9Ji2aiNM4c71gCizAkGxEyxym38rpno93fuKW2jI4ohYlBJycmns+ai
   gN3vxvnUI5xjr/mfW7aiy0Z/HFdbCU2d8RyDHjk6PTUSeAzq/R4zy9oNS
   Hc1gjmDj34/ga73fLehfqzt3mu6fDsjPmI0WB6eNefrTUDuuAqs0pOZnf
   LKBhvpMazq4TCiEt/Ma1dCRuRyOktrzVsYrm3cdaGoXwflIxH2uy0iU3X
   V7bZCawi1vNuzliZ05snByV9FcjjMqDJbQfgSSCDbD7Ocrr+PFH/404JQ
   WQ5PNC/XQFNciCF9VFPRGaqaffeOleMUgdWBe6kZvg5/Qe97zFaipnfGp
   w==;
X-CSE-ConnectionGUID: aedBv72IQSmZZ511JBRr/g==
X-CSE-MsgGUID: 85Op0QX3RLC2CN37ijOz+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80663245"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="80663245"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 14:35:10 -0800
X-CSE-ConnectionGUID: 4hszacOfQKalLkvKylgF1A==
X-CSE-MsgGUID: wKCs1di7TbWzS2iG+bx8cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="202937166"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.75])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 14:35:09 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3E4321203D1;
	Fri, 09 Jan 2026 00:35:21 +0200 (EET)
Date: Fri, 9 Jan 2026 00:35:21 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: johannes.goede@oss.qualcomm.com, bingbu.cao@intel.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov01a10: Fix digital gain range
Message-ID: <aWAxKVNem7XsKHQi@kekkonen.localdomain>
References: <20260108135738.175304-1-mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108135738.175304-1-mehdi.djait@linux.intel.com>

Hi Mehdi,

On Thu, Jan 08, 2026 at 02:57:38PM +0100, Mehdi Djait wrote:
> Digital gain wraps-around at the maximum of 16838 / 0x3fff.
> Fix the maximum digital gain by setting it to 0x3fff.
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>

Thanks for the patch. I believe this is already covered in my branch.

-- 
Kind regards,

Sakari Ailus

