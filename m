Return-Path: <linux-media+bounces-50272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDEAD07C13
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 09:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39B2030285A2
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 08:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006082BCF46;
	Fri,  9 Jan 2026 08:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuZW6kcC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC25218E91
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 08:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767946739; cv=none; b=RyeUxj0mY026WtkmfNPAwanX875LUOv714nMKefcEuSg+vlU/RC+EgapzlHUvNSBHi88S7mzC8oqmzKwD8zjhFiiU7b/G24ngrp9IqgR+zLkKT1dssjqaMyWMwzUfCXAdBtATrGwZJa96tzBz3h3lV+OUHbQY0Noyq/Xw+d75kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767946739; c=relaxed/simple;
	bh=dfAwR5lQ4y1miWvp3ebi5UIz0nwxTg/9XDQz1i7CyA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHoG++a5VoIgPZvYY7iU6n72mCW8M0P1FN5y4Ogjy/XAn/7PvjK4AJUb5OsyvwmaH72rvHSPc3uORkvirg1MyxmC2mmEWXe8hLBuOXvQ5UGv6oS9eW9b56YKbgYYrZPgJYmQR4n+kxbFoUUVLVNPgl0+YYfWJLkK3X8wJXluimY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuZW6kcC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767946738; x=1799482738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dfAwR5lQ4y1miWvp3ebi5UIz0nwxTg/9XDQz1i7CyA8=;
  b=EuZW6kcC34EGBi+nqOCVhbaKBwnGFr7+BGk5xVKTsJb6I9wq5wWQ7VeQ
   AUai/VF6174rjqptAmCPol0qRXWy3hY9MgdsO5i1wH2B4ZPyVQvkJXNZL
   FN347j64iImeOtKYdp07GPF9jXLQUgH1der5XuXeHwRMP8kIVMTcxAJrD
   kuUC5r5M3CL7JFgF1Dp0Bjoowqc8b7KPWEXMW6w6TFNgavSsG4leeF/Sj
   wDJsIWAOh8j18xRKNrTCQBo1i0Pn2DVaVgjn94YLFdO/y4GH4lq6S+CHC
   rRxgWwNVpERtMAxfQnU9a08NXFo5IjazgjQ2ysYhJY8BAMvdiC8nEmMk5
   g==;
X-CSE-ConnectionGUID: OHZH85fPSSCEy6RSZcKBjQ==
X-CSE-MsgGUID: Mo4AZMd9TRS/rcdURNqgdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="56881588"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="56881588"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 00:18:57 -0800
X-CSE-ConnectionGUID: Mf99qQeRQ6ul/fbGlSavEA==
X-CSE-MsgGUID: lbUoZEWVQ6u1RNKMHvQN7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203332294"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO mdjait-mobl) ([10.124.223.68])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 00:18:56 -0800
Date: Fri, 9 Jan 2026 09:18:48 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: johannes.goede@oss.qualcomm.com, bingbu.cao@intel.com, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov01a10: Fix digital gain range
Message-ID: <xpiwrxfvzdgme5e7djn2uoqttkwe2z6gf3zle7kqupad3ujjlp@ku7sntzmxclw>
References: <20260108135738.175304-1-mehdi.djait@linux.intel.com>
 <aWAxKVNem7XsKHQi@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWAxKVNem7XsKHQi@kekkonen.localdomain>

Hi Sakari,

On Fri, Jan 09, 2026 at 12:35:21AM +0200, Sakari Ailus wrote:
> Hi Mehdi,
> 
> On Thu, Jan 08, 2026 at 02:57:38PM +0100, Mehdi Djait wrote:
> > Digital gain wraps-around at the maximum of 16838 / 0x3fff.
> > Fix the maximum digital gain by setting it to 0x3fff.
> > 
> > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> 
> Thanks for the patch. I believe this is already covered in my branch.

If you are talking about:

ad3ea1197513 media: i2c: ov01a10: Fix analogue gain range

this is for the analogue gain, the patch I sent is for the digital gain.

--
Kind Regards
Mehdi Djait

