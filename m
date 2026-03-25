Return-Path: <linux-media+bounces-57030-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM+6BsPXw2lwuQQAu9opvQ
	(envelope-from <linux-media+bounces-57030-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:40:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AC032508B
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B9CF3254150
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1786D3CF678;
	Wed, 25 Mar 2026 12:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpnxEcm2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE1A3D1CAD;
	Wed, 25 Mar 2026 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440512; cv=none; b=ZqOcmT94Ulf2S2n3PlhzA/cBS/qXZGENQtkZgIhUqhZ6uCVFkEagsSuVyu8xcvU5iLGe4P9NS5X/HSjM9+qFJsC1xAYtNoLv+wnKosXoGJVEToOlOcz7LAwEcPJ/fDs6D3IR6IOTkm5DCT53CygojetHisvCGdvHntjDsrvZwOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440512; c=relaxed/simple;
	bh=5yuJSLQ7z5NpTLLdJi81NteytuRZpaVCcXKOaqqjLyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4G4UImIMB2tP6sXvHgOCcefrtedrQKnM267/5860X3sSEAtSRLFH5WDlJ+m5mIMEPrHG0sQubIj5BQbbsJP5ta+SufP+9GtkqIKr7DCxckpF1g9ZZZA8Bv5RpqRxYr68nMuG6W+c0nOlRaufBezcegel+4DNPr84UMjjDnRHs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpnxEcm2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774440511; x=1805976511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5yuJSLQ7z5NpTLLdJi81NteytuRZpaVCcXKOaqqjLyo=;
  b=jpnxEcm23jF5oezRH6ywPFrDwcb6Z/j1uM9nEsbzhicQnJBt6GpJbXjO
   tRNYKqgc9FfvBByeLPUWr7q+giNuLekCt/cOv5za/yUIjJRqJq6rip5cU
   79FpNCGu+UuYLKmNt50bgpgCDRV2EHHladrkF7efVurkXqB+sUkwpt7PD
   wCi8GcdP1dKhuI6Q42pnbm0Oj8YMmrhG9w4+LfSZWrdZUk4UPVi+WAjhP
   NUw609dk+medlGTtBIbmKk2AKaoHbdeSTVvRij3l7xj9LIJH4v84q0kQg
   rEnvw5ZT8jhb5KC1BBO5k4xPh9yH2bNoLULsAN1tCdfBFkPrlbp1R5MzE
   A==;
X-CSE-ConnectionGUID: Ozpxm0/iQI+dqd/HPIrg5w==
X-CSE-MsgGUID: uNI0xWgeSByIUuhNez1xoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79381716"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79381716"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:08:30 -0700
X-CSE-ConnectionGUID: CDBfxRZtT/uoMei0Ecq7VQ==
X-CSE-MsgGUID: LV2mQTE9SsmMnJ3+Cv1/QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="255161078"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.32])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:08:28 -0700
Date: Wed, 25 Mar 2026 14:08:26 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v3] staging: media: atomisp: pci: fix block comment style
 and merge split declaration
Message-ID: <acPQOplQWD_-saf9@ashevche-desk.local>
References: <20260324180821.42084-1-anushkabadhe@gmail.com>
 <20260324194356.49090-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324194356.49090-1-anushkabadhe@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57030-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 90AC032508B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 01:13:56AM +0530, Anushka Badhe wrote:
> The closing */ of a block comment is on the same line as the comment
> text, violating kernel coding style. GP_TIMER_BASE declaration is also
> unnecessarily split across two lines. Fix both issues.

You are doing two things in one change. And doing first half-way...
NAK.

-- 
With Best Regards,
Andy Shevchenko



