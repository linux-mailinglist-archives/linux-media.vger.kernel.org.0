Return-Path: <linux-media+bounces-56686-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP0nL7kQwWk7QQQAu9opvQ
	(envelope-from <linux-media+bounces-56686-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:06:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4A22EFAA4
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A66CC30DA7C8
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3AF3890FE;
	Mon, 23 Mar 2026 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRbIPHvz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C69388E7A;
	Mon, 23 Mar 2026 10:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260017; cv=none; b=tcJ940NCFSFZMO7xUisIED5YUzbcHOxPlkz0f0j2i+E9JuzqEyWjG3RkQNu0KGX0NHOQnMPWP9XLY94UPVz2BpRMfitq+6PHAvs2CFI1XCPjOI11D1KHk9NG2TdDeI8/Fz3GgYLojkiAYqxGBQY15GFPVLTPgbQfBJ0YM70O+MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260017; c=relaxed/simple;
	bh=OLn+oCG/1ZsiJ/HVpZ2TCVpA2SnTBWc/ZLUfkBeqTFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyl/LIQGK0Z34b6aTV/HhGiZUdKfBzSKtFJ9JShAbwKkief5X6FzXvzf+7BgtiazjjAPJYBCjvdy+SXAFUQiv2UlFzH0yGgL1BegYP9G4UDczKnd8AAj0Uzw0P2rLICfZIIEz4wyPa7NFOs1S0ZlPN1niEbe6oguquz5hvtxoxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRbIPHvz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774260016; x=1805796016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OLn+oCG/1ZsiJ/HVpZ2TCVpA2SnTBWc/ZLUfkBeqTFg=;
  b=fRbIPHvzYDEt717sOETM+gBto7TYgEb9U2MwVX89I9zmwJp4Z4B5fb9x
   T0ryEa0iTUn+Csh/hMti7TMiWUCn7b/IV3DG0qasNGE1AOJtRZkkPLyvn
   1OKnm6aPRu+bjyGsEWRbpUpBHrWgqx+lUyBospPDGu8uEOkDeqivfdHWA
   SreId2Y2/7xpPqJxLvAWa4B+p4cTxnzGAj3t8ffwlHga9JkPpWu90A+e4
   7L1gY7xnaosimdRc7zaBtErQv4LvwgwMZRzcuNnxSUao8VWTCKA/jzd0m
   qPyj0zGuIsDLUNwMqzoeCOp6O4jfXv7zaqxiErD9xy+XJrCtRlV5LqUte
   w==;
X-CSE-ConnectionGUID: obelXq1NQqOUi0M+O+eNEA==
X-CSE-MsgGUID: MH4CbWT6TAKp56HZgqnyzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="77863550"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="77863550"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:00:15 -0700
X-CSE-ConnectionGUID: 850OKc3wTxacb9kJUNBO3Q==
X-CSE-MsgGUID: RxLgb3yYRtWiRAtOoUR38g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="217496911"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:00:13 -0700
Date: Mon, 23 Mar 2026 12:00:11 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: fix spelling mistake
Message-ID: <acEPK6l3_gFQEuFj@ashevche-desk.local>
References: <20260322142506.42022-1-med08elkadiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322142506.42022-1-med08elkadiri@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56686-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 0D4A22EFAA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 03:25:06PM +0100, Mohammed EL Kadiri wrote:
> Correct the spelling of 'uninteruptible' to 'uninterruptible' in a
> comment within system_global.h. This improves code readability and
> searchability within the atomisp driver.

Is this the only typo in the entire driver?
Please, run `codespell` against the driver.

-- 
With Best Regards,
Andy Shevchenko



