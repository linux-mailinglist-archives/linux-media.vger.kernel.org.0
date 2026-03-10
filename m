Return-Path: <linux-media+bounces-55275-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN+nHXefsGkwlQIAu9opvQ
	(envelope-from <linux-media+bounces-55275-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:47:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7E22590FD
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D141D30B85AA
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109482D8DC2;
	Tue, 10 Mar 2026 22:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X5C/zuXF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E6B140E5F;
	Tue, 10 Mar 2026 22:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773182780; cv=none; b=qbF9g8iwpi7dT2YRDlUpaOzfWqoFkzWqDBZw8AN0Gdo1GWPvdY7epYujuqjulrqcNeCwPZkF75bH/vD80pFLp9aDca/1KS3t0q3nGvGJ8pWrpe0GjNUE4PdL6TX81FW1zMB06ZQ1NJ5tZQiUnuST3Gz8P23TSCOwCKxdFJVJaGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773182780; c=relaxed/simple;
	bh=wPIYw+bRB1LzsklOC9+3gspMXxwrNY3ONTv8VzwLXcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=taJ08HSf1eWewlF627LX1QUJJ+7ay3p3j8qVGTJa9gtj643rVeBgnSgool8Fwl26egETw8tqAhRORECPpFM2hHPupIMI/sLaji4CleCfYlqaH8IM7/rbRIYb1SS7YqlMebK0P9a7U4ctSW99pS/zxFSFbeuGS9c842C1f3xMb70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X5C/zuXF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773182779; x=1804718779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wPIYw+bRB1LzsklOC9+3gspMXxwrNY3ONTv8VzwLXcA=;
  b=X5C/zuXF9loRM9vEjM/L59pczS2zieyxQVeKsHoYkkKNb+N+5dAtULy7
   y0/KLSFGtSQRjoGuRV4541P9NLA3B3KnMnJ+15p1rZjEkfPsUoT/dyQ1F
   1xPU/sFd1QsxvTv7lljjKmZO9aQfrJlGbbmIBkqXfEokbZg/bDur1eofh
   RUazZ119qsexLGCZq2RKetiGuLpu1/GOU+797uu8EGXPLoqgK3zWmOgRw
   iz9x8YmLQEufmJMHj/RJUeqk/HNrEfqmxn6iNXIGPrpafN6kB1aZ972xP
   MhBhVr6GelyJuZMf9BltllKb7lIbs+6UF1FuHqqnYnp2zJCqY0eFa4OuN
   A==;
X-CSE-ConnectionGUID: cJSxyP0LRu25jHepNlYtkg==
X-CSE-MsgGUID: X0BOhL/IQF2Pdz3vayNFIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="99709874"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="99709874"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 15:46:18 -0700
X-CSE-ConnectionGUID: a7pr8+qSS0mqcmwLv6rMdw==
X-CSE-MsgGUID: Yts02qf8SxWmXU+7JQBdJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="224730903"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 15:46:16 -0700
Date: Wed, 11 Mar 2026 00:46:13 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 00/28] media: staging: atomisp: Remove unnecessary
 return statements from void functions
Message-ID: <abCfNWX2R7rkLJ9n@ashevche-desk.local>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271.ref@yahoo.pl>
 <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 1A7E22590FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55275-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yahoo.pl:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 10:39:11PM +0100, Tomasz Unger wrote:
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Changes in v3:
> - Extended cleanup to all 27 files in the driver containing redundant
>   'return;' statements at the end of void functions (as suggested by
>   Andy Shevchenko): inputfifo.c, bufq.c, ifmtr.c, frame.c, rx.c,
>   binary.c, ia_css_debug.c, mmu_public.h,
>   isp2400_input_system_private.h, hmm_bo.c, sh_css.c, sp_private.h,
>   fifo_monitor_private.h, isp.c, input_formatter_private.h, irq.c,
>   mmu.c, fifo_monitor.c, gp_device.c, gdc.c, event_fifo_private.h,
>   isp_private.h, input_formatter.c, irq_private.h, gpio_private.h,
>   gp_device_private.h, atomisp_cmd.c
> - Each removed 'return;' was verified to be at the end of a void function
> - Compiled successfully: make M=drivers/staging/media/atomisp/
> - Module loaded successfully in QEMU with Linux 7.0-rc3
> - Link to v2: https://lore.kernel.org/r/20260310-atomisp-remove-void-return-v2b-v2-1-b0e73f498e25@yahoo.pl

You sent the series 3 times and all of the times it's not sent in full.
Besides that it must not be split by file! This kind of change is okay
to have in one patch.

-- 
With Best Regards,
Andy Shevchenko



