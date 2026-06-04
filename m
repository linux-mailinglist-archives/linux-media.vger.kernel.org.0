Return-Path: <linux-media+bounces-63770-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /d3EOZhAIWr6BwEAu9opvQ
	(envelope-from <linux-media+bounces-63770-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 11:08:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D18963E5BC
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 11:08:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="fSrp6UK/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63770-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63770-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85C32315E6BF
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 08:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067D53F44F9;
	Thu,  4 Jun 2026 08:58:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1A03F4125
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 08:58:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563536; cv=none; b=Sgvoh9W9oEVPj6yWlMGTB5c0iFtD7cmAISiYilxmhEC6rqxxQHg0mTWeWZmzfSpnUemtCJJzmAQkQKYmqOYHbQkMxdqjn02cdtpwYOCz4gv5pmC3IXU5IK9qrO0/8DxbEPF9HTkg0a9nuQHF/c9xUWAKwWXzHnsNQ+EvlEUIP2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563536; c=relaxed/simple;
	bh=SplngXoaeQ81cpLAw2TiZ8FbLsWFJft9FDC5UCN/I1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcu7vJkzJfNn84MB4lxZjDiHrNGvjvxIzNrNobYvqgvZIFFMkvpNwOgoogCt/yukcRq9ZoVs03r78hWIQGaguPqBj31iEStLvRKsD5EwwV3c3+jQ1xCrBSncWz2N4Bm1Mu0c4jAIetLMBhVRDyghvAcSJRxCXMOpeQs7GxvkdBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fSrp6UK/; arc=none smtp.client-ip=198.175.65.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780563536; x=1812099536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SplngXoaeQ81cpLAw2TiZ8FbLsWFJft9FDC5UCN/I1k=;
  b=fSrp6UK/uNZPKwGd2wvd6jjuzdhCUbj/k0f5kBIiwanKe29xGtKYZjta
   gSpi+PbWd1V6F7DfGHanEg4LqdVL+RcpvDyXEA9mmh6U3dKiLM1bep/4d
   L5VZLsIjQ3ihOKs8Drz5Rb+//VR0QAzBqf1vQ2UBI24qcdfDVdm3Z9Uxl
   4HzvaGurqSbRqhGjM0OMR+GE1f3FjsQcnn2Z5N6j8YkGnSlpV2mXJcFd+
   R0510oUNDw8k0QTU7TJyo2HZcmBMl2vlkv2A2dWcKWXb/TVK0eatJILDq
   ou5eZ/w8b+mP/QGWI14wzCmi/NOnpGv4O7Rrp2E4Kf6LE4c71lW6s4QZd
   g==;
X-CSE-ConnectionGUID: A3w5HMXsQ6iwwWm6cjQ1QQ==
X-CSE-MsgGUID: oB8nAMKbQnq9aOyMI6focg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="85010672"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="85010672"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 01:58:56 -0700
X-CSE-ConnectionGUID: xk44/viaRNCr8OP02H68lg==
X-CSE-MsgGUID: m6hfGbT5RY65CONSe4VhNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="268158557"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 01:58:54 -0700
Date: Thu, 4 Jun 2026 11:58:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v1 1/1] media: tda18250: Use %*ph to print small buffer
Message-ID: <aiE-TFU2UdzB1x4p@ashevche-desk.local>
References: <20260603111724.230522-1-andriy.shevchenko@linux.intel.com>
 <20260603113538.2772E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603113538.2772E1F00893@smtp.kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63770-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ashevche-desk.local:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D18963E5BC

On Wed, Jun 03, 2026 at 11:35:37AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s)
> to consider:
> 
> Pre-existing issues:

^^^ Exactly, but thanks!

To the maintainers, I'm not going to address this report even if it's valid.

> - [High] This problem wasn't introduced by this patch, but an unconditional
> dereference of `client->dev.platform_data` can cause a kernel Oops.

-- 
With Best Regards,
Andy Shevchenko



