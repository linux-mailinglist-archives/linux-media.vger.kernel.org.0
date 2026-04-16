Return-Path: <linux-media+bounces-58862-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HppHaic4GnokAAAu9opvQ
	(envelope-from <linux-media+bounces-58862-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 10:24:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1C940B7CD
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 10:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36C66303F7FA
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 08:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD7A3914FF;
	Thu, 16 Apr 2026 08:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fi4C10lJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DE23806AF;
	Thu, 16 Apr 2026 08:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327514; cv=none; b=lJHrTa+YFnnqn/4s7MwWWrLWNp+M9aLGvKv0VpdprA+ZIquf9VnJIPzBhk6As5ylSJk3SDSFVakOUrtSRRJA9LlXcdBLfUgFCvllz6Z+woPvHhzPm2t0ve8hQn6SyzMQdsO09QtYEcr47Bd9UZQobQAWq5kIlCm9N1Y+v/aThzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327514; c=relaxed/simple;
	bh=gS18znHgFeciu4g1YYcDoFRxpODrze5FQhO2pZy83zA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiKUPC9lNVwVdL2Nv7DtXiZTXpHKt4H2bIfNPurnzPtMTiLGKv9QxO2r6c6qPAfpDXJiwFh3+4gfgyJacFcISpi/cdpbIoKFyGq0kAs0kIo2jE2bZWc/+F6FHXCdEHV+OaF738HMP6/TDW3pUlILEGI/gvdJ31j8bss4y14caRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fi4C10lJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776327513; x=1807863513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gS18znHgFeciu4g1YYcDoFRxpODrze5FQhO2pZy83zA=;
  b=Fi4C10lJTji56qjgsBU6uvvRz4TJph1SKxVR7RbHDtFDQ1/0bWrinxHm
   YS8PCuwD/cHPzkRDazACQCFf3+UgNlItgzf78aiOxVsW3+xkTBY9jM/Lm
   4Wrwym3UKXSRSJpmxyQxaI6cXXLr6cquEvv5aeDAgwGr6hJWzJS9YwwOK
   YAtNnf2XtY6YuIz8a+yyjwzNgYH2BOtq1NBDtdh5DehXluwOD8HnF/T/Z
   9aQ0hWwxhmthlcD4axrN8cRhgljIMna9RN/Iqot5n/SGVMsFvKdX5U1oq
   K9ySx8E4FafPV71waiGps9qRp2e+1h3ulc470pLZKqt2q3Z2QwUtkOoq7
   w==;
X-CSE-ConnectionGUID: YG/rwg/cQPal3AfLzFYMUw==
X-CSE-MsgGUID: q4yERsNXRcWyQmY0EKGEAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="81191378"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="81191378"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 01:18:33 -0700
X-CSE-ConnectionGUID: RdWpbPheSLKRXPeZY1b41Q==
X-CSE-MsgGUID: vof9brrZQjOEnhTVWiqtnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="268655178"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 01:18:31 -0700
Date: Thu, 16 Apr 2026 11:18:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Huihui Huang <hhhuang@smu.edu.sg>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix memory leak of
 raw_black_frame
Message-ID: <aeCbVKLebxC9v-4r@ashevche-desk.local>
References: <20260416063058.2479566-1-hhhuang@smu.edu.sg>
 <aeCaPExt-sUiY-B9@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeCaPExt-sUiY-B9@valkosipuli.retiisi.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:server fail];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-58862-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smu.edu.sg:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,seu.edu.cn:email]
X-Rspamd-Queue-Id: 2C1C940B7CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 11:13:48AM +0300, Sakari Ailus wrote:
> On Thu, Apr 16, 2026 at 02:30:58PM +0800, Huihui Huang wrote:
> > Our code analyzer reported a memory leak in
> > drivers/staging/media/atomisp/pci/atomisp_cmd.c.
> > 
> > In atomisp_fixed_pattern_table(), raw_black_frame is allocated by
> > atomisp_v4l2_framebuffer_to_css_frame(). If sh_css_set_black_frame()
> > fails, the function returns -ENOMEM directly without freeing
> > raw_black_frame. The allocated memory is only freed on the success
> > path.
> > 
> > My patch adds the missing ia_css_frame_free() call before the error
> > return, to free raw_black_frame when sh_css_set_black_frame() fails.
> > 
> > Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
> 
> Thanks for the patch.
> 
> I believe the problem has been already addressed by
> <20260203163134.3901110-1-zilin@seu.edu.cn>. It's in my atomisp branch.

And exactly the way I suggested here, thanks, Sakari!

P.S.
It would be nice to see rather links to the Git commits in question, because
patch in the mailing list is just patch in the mailing list :-)

-- 
With Best Regards,
Andy Shevchenko



