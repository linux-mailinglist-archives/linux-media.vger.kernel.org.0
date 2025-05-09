Return-Path: <linux-media+bounces-32070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED72AB0918
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 06:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61B353B62C8
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 04:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5061023ED75;
	Fri,  9 May 2025 04:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7SoyGRe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93F22CA6
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 04:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746764706; cv=none; b=JL8Ze4KX4BiMQIYy2rdd6uCbeGP/7h5uSA03erveVkqz32LTp+wAGJOlP3ME91wQG7tVPOhcjTtBn7t39ki1L9JyprJVpzVCzP+vunl9omw95hCH+tIOSMkYHhvqnawijrSDZipRhqCCiuel70elHPkF7DFChAhlA1rRT4ZqBLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746764706; c=relaxed/simple;
	bh=e2JnhkD9N6t+YIMxUyiAqTdoq3GgYaY+FgR6SQJo7pM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ts/kZP7jmvNcPPX3absPndl8XN2WiUN+6j/QcqS9rtDAYeyqzLxj7K4Tub67B00xs1iUQDrY1chvg5/Sq2uXXg2Xrzsw1+lTVRZHxyXlEowkJ5m3j2Qlg1sy7HIjeUo9IpkRTy2SKVMJBpf3EFI1yS5BRIFYEJB57ddzpCsEvIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7SoyGRe; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746764705; x=1778300705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e2JnhkD9N6t+YIMxUyiAqTdoq3GgYaY+FgR6SQJo7pM=;
  b=A7SoyGRe6Ub3Yyf6cwJWeLd7SDXB/ebI9lJFTEwVUUL8X0cmT4NcO9jM
   3qbnkrO6Myj5vA9JbpkwH8XP5c6PDE5xB9YdM++Q7IsfcBTl3erbmklNx
   8Nkzr/bSNPyZNXKXMAeVnPfCFwrCzq/CHrZ9PY2GBjM3zDLpShCHdfOLg
   V3Ir+IPGxgnsJELQXG63atWyi2c6Ac3rvlUIIoqfluXaUAZIuFTgkLkUj
   /j6MriVKwkQPjEt7Gm+c/H+iwdfE9bM2867LCGhMGx60vpDWdKOak4guo
   WNhuHNiXBOIpRqZznoKcN9dTQFCSp17DnHRqCz76ISkIAon0iZtuzDBUz
   A==;
X-CSE-ConnectionGUID: uD+5w1DtQaqG5hJAldOI1A==
X-CSE-MsgGUID: A/+whBiWQQi2IwSMMS7tzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58793793"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="58793793"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 21:25:04 -0700
X-CSE-ConnectionGUID: LsT45ifqQmGz7JRFbp3uzA==
X-CSE-MsgGUID: kGlXbpBdSpWrym5NbINVdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="137430174"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.83.20])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 21:25:03 -0700
Date: Fri, 9 May 2025 06:25:00 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v3 0/5] media: intel/ipu6: continue on ipu7 code sharing
 preparation
Message-ID: <aB2DnGn39pSKcZh8@linux.intel.com>
References: <20250502154446.88965-1-stanislaw.gruszka@linux.intel.com>
 <aBhzDoUZSb40MzBv@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBhzDoUZSb40MzBv@kekkonen.localdomain>

Hi Sakari,

On Mon, May 05, 2025 at 08:13:02AM +0000, Sakari Ailus wrote:
> Hi Stanislaw,
> 
> On Fri, May 02, 2025 at 05:44:41PM +0200, Stanislaw Gruszka wrote:
> > Cleanups and code sharing preparation with ipu7 driver.
> > 
> > This is on top of:
> > https://git.linuxtv.org/sailus/media_tree.git/log/?h=devel
> > Plus:
> > https://lore.kernel.org/linux-media/20250317073856.162147-1-stanislaw.gruszka@linux.intel.com/
> > https://lore.kernel.org/linux-media/20250428161643.321617-1-stanislaw.gruszka@linux.intel.com/#t
> 
> Thanks for these. I've applied patches from 1 to 3 for now.
> 
> Going forward, could you post cleanups and reorganising the code into
> common bits in separate sets? 

I don't know what can be cleaned up before I start modifying the code.
And since I change a lot of code during refactoring, changing patches order
and separate the changes is not that easy, I would prefer to do this.

> It'll be easier to see where this is going
> when all related patches are in the same set. Cleanups and fixes we can
> merge earlier on anyway.

I can post bigger sets.

Regards
Stanislaw

