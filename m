Return-Path: <linux-media+bounces-55736-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP1FJt81tGn4igAAu9opvQ
	(envelope-from <linux-media+bounces-55736-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:05:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3739B286A3D
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:05:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 74A17303BF78
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819843BED7F;
	Fri, 13 Mar 2026 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxJ+xJkR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23FE3BD237;
	Fri, 13 Mar 2026 16:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417892; cv=none; b=RLpQ6YvouA3Epu5/7diU9PVtGxPyqSlnvfHN90mMs7Bjm9uHEp+O8LAPKX/Y0jmLAyKsj1yUKsMJUn8em1lGF1gvwNzNIdYNQNwNlXDV0y88mbXGdwx8eJVHYZ8Ml20q+Ls3o/vXWzpMNOqRc0KtVUeOVEuvAu59xCMBMiveJP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417892; c=relaxed/simple;
	bh=TkNilpnVN+nNdhU6DZX2qB70pfEN2ZaJLtBY/tZgWwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acD/4AJTmizWCd3IOHQuST5sfiCKcZ5U1Vw+c++KY7XwhF8dfyd3DR1mghdIwaqS3DuwyKqYkj5tBeTubj3lGzivy4/yd3MqzE+ExaQKT6BTwbfoXI/ufO9eIdz8dj+MG+sVHJD84svQvFUx7Dp9e2BfVzNAeveeo7wcOzYf2Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxJ+xJkR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773417891; x=1804953891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TkNilpnVN+nNdhU6DZX2qB70pfEN2ZaJLtBY/tZgWwM=;
  b=ZxJ+xJkRYbpR9YxbzYEuR98qBLGnwYlvzNVvF1XIA7kK3fALnaui9upf
   6GcOFU5CjB8091VEG73m4ezq3td5EZBt1BhydK8rL02aP2/JjQbDeGHGw
   P1wQre8VtFsTjDAfP4bzmkNEq0GvZLnpUCagq3JmE2Wfb6ATZMmWQkLzL
   mfYa/5fQWyCTjdLSBvuz7D9J6yOxCfW64NmZ1g0ZrvFDCJtBDPsdx7B4+
   4skNJLMXeU6g9xZj9sFB5qovgBJBmz/4hQlMLC1wC/0+hJ0MuOjEXjGn8
   dl08nCk862KcMoQiDhEVgRgXzj+Fz+ZagVWa/rkAMGF+O2SoMXkT840QS
   A==;
X-CSE-ConnectionGUID: s7A+uh/zRsiCRyCx3x7JFA==
X-CSE-MsgGUID: RHqo5DFDRTGA3n1Rrj0ySA==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74421868"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74421868"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 09:04:50 -0700
X-CSE-ConnectionGUID: rAMRlgNaQMOxf0VlgOIFqA==
X-CSE-MsgGUID: k+YO9BR2SwOtymTi8j+6DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="225662203"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.246])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 09:04:48 -0700
Date: Fri, 13 Mar 2026 18:04:45 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Lin YuChen <starpt.official@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] staging: media: atomisp: use kmalloc_array() for
 sh_css_blob_info
Message-ID: <abQ1nYvEpKV-rkL8@ashevche-desk.local>
References: <20260313152936.14560-1-starpt.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313152936.14560-1-starpt.official@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55736-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 3739B286A3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 11:29:36PM +0800, Lin YuChen wrote:
> Replace the open-coded multiplication in kmalloc() with kmalloc_array()
> to provide overflow protection and improve code readability.

> ---
> v2:
>  - Remove unnecessary parentheses in kmalloc_array() call as suggested
>    by Andy Shevchenko.

This marked as v1 and 2/2, where is the patch 1, and what is v2 here?

-- 
With Best Regards,
Andy Shevchenko



