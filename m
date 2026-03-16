Return-Path: <linux-media+bounces-55950-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB36LEI1uGnXaQEAu9opvQ
	(envelope-from <linux-media+bounces-55950-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 17:52:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8C529DAA2
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 17:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 198D830659DC
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 16:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0A43CEB9B;
	Mon, 16 Mar 2026 16:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5Qt8kMu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A185B3ACEF8;
	Mon, 16 Mar 2026 16:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773679691; cv=none; b=DOer6sS75WXkHliC1BRdnC9jmbTt7HlBlI46KJ9Qj+vVaC2kyG2VW6FgJsUU/1T0tq4vbOEsRPE9J8NJ5DkbAPaa5rLc0vZSYuNivU/5x1BaoKum4PC2rgxcIi/JT/C4QSvrxZAdtEUpnqHFHLHFrzPaQzb6MQFcFyIMXsHc6kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773679691; c=relaxed/simple;
	bh=/rqfx04MebP1xiG4Dc3Vwrh0asx9rLsOe4AaLBqGw8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETvDRdSKVzyZzbN5SUACD2gP3egQZ5nf+2yl5YLu/baM+iysX4uolaQFrBzSHDrAJYDWCJCjXMmJg563E81Wz6hwGmM5FaFmN5v3DcsVrZxPHE4jRBy1ia2BPw3zT0sjkl4T88RepGnq0yvtmwaCuIb0ZAgw90i8PRomY5HXJW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5Qt8kMu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773679690; x=1805215690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/rqfx04MebP1xiG4Dc3Vwrh0asx9rLsOe4AaLBqGw8Y=;
  b=M5Qt8kMuQQ8TOt1o79z0aAY3+PXoKXVVgNwYXLML/wZuuCRLDsY4khuC
   M89jNhtqE9bFJWx002yntUPQ0VeiPU3mUm35nDiBrq7AtSJB8viwr44b1
   BjyQsRkxfgmvqjlVenR0A5K47ORvH7ZTQ5eur+YIir0+q+/9WOeWMCj+T
   wOCChj0nPGGdWrXn3FN/xRCWWwD7POA6/QwGXuBrV4rSRqV+PrjaYJZiw
   01bGauFGMl7vTzqJNnV/xfqHXkxFZ76vnm7Jv7w0F6r4OBWw+81mSPATn
   fYvKYfsj+TXvC6f6fbdDYktC+zFozncIVVXfUy4UjqybOtEW4a3UPT0QM
   Q==;
X-CSE-ConnectionGUID: /DlHPyixT4aIS7Jxv+w0RQ==
X-CSE-MsgGUID: khs9FKExQ+GdQ4uKUDI6eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74592138"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74592138"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 09:48:10 -0700
X-CSE-ConnectionGUID: NHxPFYVZRz6lSKq7knY4nA==
X-CSE-MsgGUID: jG3IhSsEQFyfhwz2pMu7hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226653006"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.29])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 09:48:09 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 29CC9121D04;
	Mon, 16 Mar 2026 18:48:07 +0200 (EET)
Date: Mon, 16 Mar 2026 18:48:07 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "luo.liu.linux" <luo.liu.linux@163.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH] media:v4l2-async:debugfs for registered
 subdevices
Message-ID: <abg0R5zerwCM_1mK@kekkonen.localdomain>
References: <20260313075824.2818713-1-luo.liu.linux@163.com>
 <abPm3VGGRAIsY1eQ@kekkonen.localdomain>
 <5e63e8aa.943f.19ce6ee4ad5.Coremail.luo.liu.linux@163.com>
 <abP4Mr_s8JRpQH0B@kekkonen.localdomain>
 <384d2274.9b3e.19ce776ec2c.Coremail.luo.liu.linux@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <384d2274.9b3e.19ce776ec2c.Coremail.luo.liu.linux@163.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55950-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[kekkonen.localdomain:query timed out,intel.com:query timed out];
	RCVD_TLS_LAST(0.00)[];
	SURBL_MULTI_FAIL(0.00)[kekkonen.localdomain:query timed out];
	RSPAMD_URIBL_FAIL(0.00)[intel.com:query timed out];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RBL_VIRUSFREE_UNKNOWN_FAIL(0.00)[172.234.253.10:query timed out];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	BLOCKLISTDE_FAIL(0.00)[100.90.174.1:query timed out,10.60.135.145:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ED8C529DAA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luo,

On Fri, Mar 13, 2026 at 09:50:56PM +0800, luo.liu.linux wrote:
> 
> Hi Sakari,
> 
>     Apologies if my previous explanation wasn't clear enough. 
> 
>     To clarify, the primary goal of this interface is not merely to verify if insmod/rmmod succeeds, 
> but to validate the correctness of the asynchronous subdevice registration and unregistration paths,
> specifically ensuring that resource allocation and reclamation are handled properly.
> 
>    I would like to share a real-world scenario that motivated this patch:
> 
>    We had a camera subsystem pipeline like sensor -> dphy -> mipi-csi2 -> isp
> subdevice driver that appeared to function perfectly for six months. insmod and rmmod completed without any errors,
> and the system seemed stable during normal operation. However, just before a major release, a QA engineer performed 
> stress testing involving rapid, repeated cycles of insmod and rmmod, which eventually triggered a kernel crash.
> 
> During the debugging process, I inspected the internal global lists:
> 
> static LIST_HEAD(subdev_list);
> static LIST_HEAD(notifier_list);
> 
> By dumping the subdev_list via this debugfs interface, I discovered that a D-PHY subdevice entry remained in the list even 
> after its driver was unloaded. Crucially, the output explicitly showed the device name, allowing me to immediately pinpoint
> the D-PHY driver as the culprit, rather than blindly troubleshooting other components in the pipeline (such as the sensor or ISP).
> 
> This was the critical clue that led me to the root cause: 
> 
> The D-PHY subdriver's remove function was missing a call to v4l2_async_cleanup(sd). Consequently, the subdevice was never properly 
> unregistered from the async framework, leading to a use-after-free or stale pointer issue during the stress test.
> 
> Without this debugfs interface, detecting such "silent" registration leaks is extremely difficult. 
> The driver loads and unloads without reporting errors, and standard logs (dmesg) often provide
> no indication that an entry was left behind in the core framework's list until a crash occurs under specific timing conditions.
> 
> 
> Given this experience, I believe this interface provides a vital visibility point for engineers to:
> 
> 1,Verify that subdevices are correctly removed from the global list upon driver unload.
> 2,Catch missing cleanup calls (like v4l2_async_cleanup) early in the development cycle, rather than discovering them through random crashes in stress testing.

I guess you'd have found this with either KASAN or linked list debugging?

-- 
Sakari Ailus

