Return-Path: <linux-media+bounces-59230-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKshNVKr52kM/AEAu9opvQ
	(envelope-from <linux-media+bounces-59230-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 18:52:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D8B43D9C2
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 18:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EDF6303E8DB
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 16:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B429A37F723;
	Tue, 21 Apr 2026 16:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zp8syc1F"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93BE28504F;
	Tue, 21 Apr 2026 16:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776790338; cv=none; b=oyjiWWCFKw3Y5tg1aLYWLLBRInxlW5oGZIER7fYHkjkDNduaS6uFN5mJY0vEF2C0+5cQK2rPA06hMdxCFc30siQkAUskZB/a1Omtrmu8mxS4r+TvnqOvSrR92SJJSdKyJm1jHoNMdKMJypUTvo/72dCYPy2tnJAa9U7APri59IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776790338; c=relaxed/simple;
	bh=PlOny4vRH1ucGjNqEV8TWJMOlQe6fI56+SKom77gcxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnp3HnZFaAOEFoPFBaemKXlIOA0bZsGRkI5iUhm3i1k6Do6o6JlWEdTGqcP1wjicCiQzOtt+ssUnbm5vVKpdWtBlNzhk2s4fG7VU/VNbzDy0DF26YrTG+tN8hU/QFV37eHhCmckY+4Rtcj5Cc+NpJMDuzbaJPLdUk1/jyWNU62Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zp8syc1F; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776790337; x=1808326337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PlOny4vRH1ucGjNqEV8TWJMOlQe6fI56+SKom77gcxM=;
  b=Zp8syc1FX0paUqcjxJFSLKcsQlrs2WRQ0pMeeKRG9Zu+J+Zb1thcJdDm
   gJ0hr6Cxps9h2JQz7RvNu5JA+V0N9oBMQpi2ZOnWmF+TuQXEIsGKoy7Lw
   DqVXEwzE8wKEiVHg9C2X6Zi0cHQmYJcb//9oBJ8gMqbL05G3ms+Xg5l0P
   OInedUWDUtP7H9M8lRNq87T8aawvNyG8+yglF8aJ52Jtj6UydOLY8YCkm
   FMH17cs7T1F/2MzecHKVJ1yLewZPiqxKVVLZMnO1ET0j+mU5Doj0qC/rH
   fAydCOGr2ByYLXkH80h+jFg0Uja4YABZBhPo4HPWGW9Sh01JNDndzV55P
   g==;
X-CSE-ConnectionGUID: KQrxK3bHSIyLM62m7h4q0Q==
X-CSE-MsgGUID: MYaiYUEUS/CVulBaADeZ+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="76894054"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="76894054"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 09:52:15 -0700
X-CSE-ConnectionGUID: AE6qVMuaSbiI6r6QW7simQ==
X-CSE-MsgGUID: hwwZfCMKT9KeQEJWSSEkPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="232001119"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.135])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 09:52:13 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D64DF120D05;
	Tue, 21 Apr 2026 19:52:10 +0300 (EEST)
Date: Tue, 21 Apr 2026 19:52:10 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pedro Pontes <pontescpedro@gmail.com>, hansg@kernel.org,
	gregkh@linuxfoundation.org, mchehab@kernel.org, andy@kernel.org,
	kees@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: use kmalloc_objs for array allocations
Message-ID: <aeerOursgkNeoMQo@kekkonen.localdomain>
References: <20260416134214.130665-2-pontescpedro@gmail.com>
 <CAHp75VeyCRCdR4VD8+KM33zYv3OMBSRGaeSE5B2Wc5hn9Q9hEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeyCRCdR4VD8+KM33zYv3OMBSRGaeSE5B2Wc5hn9Q9hEA@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59230-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 55D8B43D9C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andy,

On Thu, Apr 16, 2026 at 09:26:47PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 16, 2026 at 4:46 PM Pedro Pontes <pontescpedro@gmail.com> wrote:
> >
> > Convert manual kmalloc() multiplications to the modern kmalloc_objs()
> > interface to improve type safety and prevent potential integer
> > overflows.
> 
> There is already a patch doing it in a slightly better way. Have you
> followed the mailing list?

I must have missed it, too. :-\

> Please, better to help with this driver is to subscribe to the mailing
> list and review already
> submitted ones.

-- 
Regards,

Sakari Ailus

