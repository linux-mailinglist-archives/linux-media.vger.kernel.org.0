Return-Path: <linux-media+bounces-56482-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHphDKgDvWkO5gIAu9opvQ
	(envelope-from <linux-media+bounces-56482-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:22:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B79C2D721D
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D9A530F2FBC
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 08:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A2337188D;
	Fri, 20 Mar 2026 08:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yplt6jjQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0043596E1;
	Fri, 20 Mar 2026 08:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773994691; cv=none; b=S+7M/jXTiUtWm5X9MbJUCPXmkUvwU8BFk76wztuuhZgX324oG6f7sbX+BNyrnAmIXOYYIrLk2VwJsO0A4LA4V3x76MzoDDTenvgGybmOo5h6CsZXXCR+DLYGiuyk4UO/ndIO8OcpeMLb+oR2H1tHYCDA0U0iyew56Z/uchrbfP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773994691; c=relaxed/simple;
	bh=Cbs6fDbIVm4cxqy5zfwG+B9ee7arLRyURHKCIhe1zUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1oSnjnoC8IL9lN7eBVuwsbvDheVMTxLuCCMJHND5qe0ZtzmuwgdtTPm3FrhQ0+gYwvb1+Hpi55ilWVp7J14anjcO5dxOdHdNRscq5AYUaQvP3K6zU0c33O5aEKZ8WSo0C5U8w6t+IblKCmYdTEjynj2L6HugJxIGbdMoxNkP6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yplt6jjQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773994690; x=1805530690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cbs6fDbIVm4cxqy5zfwG+B9ee7arLRyURHKCIhe1zUM=;
  b=Yplt6jjQzLwqH/r4ijPlb0TH42bOOXMzylaL/iipsr9gp+4v3bqEFHrs
   ikHNSrY3IQS9zwv9s1D3LGXctktyZbpMdv4z7sEhPsg+VFpjpHNnPWOgL
   583W2US24yXyyy+eg9clTcWvZY/Y8XX53PwL9ZVBM/uqdFIYW8mpKDQwU
   EE9rQkdeYGROlRXI63Z8lK+ojgW76uLBp1PFUC3xuQImE/Fh1eyfV1MVc
   Ov6IAZiDEi41bfZxHjnOPs0yKFF2+GUAT2Xz2fITrcwXJMoOgmzR3q92z
   d+BD40Mwlc+XB51uCN59gAo0BTd8nHlKtEnnlcoTwMC+GNYNNTSuCUC29
   g==;
X-CSE-ConnectionGUID: 5DtVXCi+Rfm5Q3q0GzZeGQ==
X-CSE-MsgGUID: gFOoKvyBSZ+bVrT4q3aQ2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92650479"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="92650479"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 01:18:09 -0700
X-CSE-ConnectionGUID: CEB5EzedQiSCpRlmKKLplA==
X-CSE-MsgGUID: sIrSlVdjSeqRxIkQ2bU8yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="222313546"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.40])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 01:18:06 -0700
Date: Fri, 20 Mar 2026 10:18:03 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Choi, Yuho" <yqc5929@psu.edu>
Cc: "hansg@kernel.org" <hansg@kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"andy@kernel.org" <andy@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: atomisp: fix UAF and memory leak in gc2335
Message-ID: <ab0Cu8NnIt-m7pQc@ashevche-desk.local>
References: <54321DD5-808B-441A-8F68-B812A3D72E5E@psu.edu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54321DD5-808B-441A-8F68-B812A3D72E5E@psu.edu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56482-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,psu.edu:email]
X-Rspamd-Queue-Id: 9B79C2D721D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 07:30:10PM +0000, Choi, Yuho wrote:
> From: Yuho Choi <yqc5929@psu.edu>
> Date: Wed, 18 Mar 2026 17:08:57 -0400
> Subject: [PATCH] media: atomisp: gc2335: fix UAF and memory leak

Make sure you understand the tools and how properly to send patches

Also note, your patch is mangled and may not be applied.

> This commit addresses two potential resource management vulnerabilities

Please, take your time to study Submitting Patches documentation,
in particular on how to use imperative mode.

> within the gc2235_probe function's error handling paths.

As below refer to the function as func():

gc2235_probe()

> 1.  UAF: If media_entity_pads_init fails, the driver
>     invokes gc2235_remove(), which frees the 'dev' object.
>     The execution flow then inadvertently fails through to
>     atomis_register_i2c_module(), dereferencing the freed 'dev' pointer.
> 2.  Memory Leak: If atomisp_register_i2c_module() fails, the function
>     returns the error code immediately without executing any teardown
>     routines. This leavs the 'dev' structure, v4l2 control handler,
>     and media entity permanently orphaned.
> 
> This fix follows a standard goto-based teadown routines to ensure all
> allocated resources are freed in reverse order.

-- 
With Best Regards,
Andy Shevchenko



