Return-Path: <linux-media+bounces-66459-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iEmyMXi/R2qUegAAu9opvQ
	(envelope-from <linux-media+bounces-66459-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 15:56:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 596A370322E
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 15:56:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=E9xHi1PQ;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66459-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66459-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45061301A7C9
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 13:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407AD3D9548;
	Fri,  3 Jul 2026 13:55:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E553D16F9;
	Fri,  3 Jul 2026 13:55:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086947; cv=none; b=qFG5D0/axvn7AYd7ntCHcSFq/rWc4UyQXnryWu/jHkWd1StDGlhxZFxOKDk06OOPIEYp6STd8+Ee3yF+g7h3YW03bJjF9FEPFpjoKzN+6ovEhp6NkWZes+c20wgqf5cF/eNmAtyZ9tpgDYbt1xCb+5rUHTxtPbRTFrJ0y20uZKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086947; c=relaxed/simple;
	bh=oWaLTBZdyoTLGMWuohEPtMDh9m6IyuSmsXxx/BcMqxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ia+Xq8tZrBCoj1j/Fyu1y/QyxlhrRcz9bHSzqX4TeqhGoraD9Lnv6sRtQYWzdRcmAKLlXZO4pqmtRGFyMAQpB8tCPFedYFyy99jBRzA5PPGTYYeZYfqEADVqwNb8Vw6xChkcnzVK5xMBd1+JnQ9kgjWg7J4kIaplEKitInoMTls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9xHi1PQ; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783086947; x=1814622947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oWaLTBZdyoTLGMWuohEPtMDh9m6IyuSmsXxx/BcMqxI=;
  b=E9xHi1PQUgFPZNxkg52lwQloXLT0rVZ+L7rlVc3wWyKnnMJ32UjBzbUt
   MqS9fbwQ34ts64jv/SOoPHMCuZUVYjLOkS74MQ10o/IORmOqleLaUQ0Mu
   g8BloXG9lBiaA1DP6eTfZtxzITEiMvbEVwt2ItRx4SEOWppfbIXEwOF5v
   qqE8CQ3XbQ2Y7Vc/IlsxTNtut74ScA/P/yYMkGql7JD//E0fB0OCYbgRp
   vnxCkFBORkTfwJQviIqSamPZUh2GODaE3iHcX59iYwyHrJ+CWVlAIMKA4
   gSRLaFUCF37/o3wzq6Ofj3I2LP6kJw43Z8SlNoMKatUli0XAhSr1RRVzM
   Q==;
X-CSE-ConnectionGUID: XEcxfB/jSkOqG5iIc4+DFg==
X-CSE-MsgGUID: I8uc2KlfSP6nFiLQ3oyUKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101261423"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="101261423"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:55:46 -0700
X-CSE-ConnectionGUID: 353lQIrwRn+GMLHWXvb5wg==
X-CSE-MsgGUID: NNJDSQJETGWHE4GfJjYHZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="248670621"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.80])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:55:44 -0700
Date: Fri, 3 Jul 2026 16:55:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: atomisp: clean up block comment formatting
Message-ID: <ake_XiGhzQNMQx3S@ashevche-desk.local>
References: <20260702135230.19030-1-bohdandmarcus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702135230.19030-1-bohdandmarcus@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bohdandmarcus@gmail.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66459-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 596A370322E

On Thu, Jul 02, 2026 at 04:52:27PM +0300, Bohdan D. Marcus wrote:
> This patch series addresses the block comment formatting issues across
> several header files in the atomisp driver, as suggested in previous
> reviews. The comments have been reformatted to comply with the Linux
> kernel coding style guidelines.

Just no.

There are still issues after your series.
Become familiar with what has been already send in the past half a year
to linux-media@ mailing list regarding to atomisp driver and what comments
were given. lore.kernel.org will help you with that.

-- 
With Best Regards,
Andy Shevchenko



