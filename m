Return-Path: <linux-media+bounces-58972-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IzDGXPs4WmKzgAAu9opvQ
	(envelope-from <linux-media+bounces-58972-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:16:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E5D41878B
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 312C1303D567
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 08:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DBB39E6C9;
	Fri, 17 Apr 2026 08:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmB+xRu6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7665739FCA7;
	Fri, 17 Apr 2026 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776413755; cv=none; b=CkVoGn/jZTF5bZdMtFhQ76UYNIh29Ta+3vObYQ+BVVaiVhuLjKm8rjue+qWIkpIpN2RTZccj2LwX6m4pcHZYeylWiso/ibgpz2dXwPOXbWPXyGd6U5bY0FQHUcvI+rU9Vj9mDIk4/nrfK/pxm6CF+rT/nPzqV5FX03ucoLeb2F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776413755; c=relaxed/simple;
	bh=u2Fsjjw5cj9mEcZHeaep0Ri8KvEYxWGrpnKPA4s4FbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdE1IhqPYvvaG0jiFN1z3F+1Sw/IURJIhw5PRzyghv2JPCVkmvdxZDLSC3IpMNmH7a7G2QjuGW/BhhEK970FKRpTYpyUMrU8Ms+qfRVdeO2ZbwLL23pFCr6OW0bc77Pv0lsfYggu+Co1fR96zOa+kEwn4988xVR2sllrEtI3Z1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YmB+xRu6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776413751; x=1807949751;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u2Fsjjw5cj9mEcZHeaep0Ri8KvEYxWGrpnKPA4s4FbU=;
  b=YmB+xRu6mHXXAAPI4304kctEfvAYo0ygeGsEosErTyYkbOv+X4Oh4OMg
   hnrs/LiuNIjvmM2SKqJFjQaKI+FLM/0ICe++M58E8FrReLtZ+NXTFLt0I
   mww0N0nlhNpTrnmGeQIYzEkTvwCYlCZKqPmZEw/dA26S1VNHQHwzw325V
   ELqP3lad6o1EJCUBVvuC7fNn+cP5Uco1daWSmMfSTsTqDSeZk2OYBp4o7
   p9LucHf8yCoWXouaiY8fAeBmr1BXLOUrEJcAgDx+5yAKwvUIrDVYrk4QD
   HaVZFuzaRjHWds05vn4dGtBUzle5ILrzD754+abJAgJ2rtH6HzABh7cWa
   g==;
X-CSE-ConnectionGUID: wou36qoxTXKPjK7298u9uw==
X-CSE-MsgGUID: NLTALPh9QYS95Xf/QjlDWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77545846"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="77545846"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 01:15:49 -0700
X-CSE-ConnectionGUID: mcGQ7J8YSousPOTmT/RNow==
X-CSE-MsgGUID: iL3zw46hStWQ0IEBtDZeUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="254196617"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 01:15:47 -0700
Date: Fri, 17 Apr 2026 11:15:45 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Huihui Huang <hhhuang@smu.edu.sg>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: atomisp: fix memory leak of dvs2_coeff
Message-ID: <aeHsMXwZEn29dROH@ashevche-desk.local>
References: <V2_MESSAGE_ID>
 <20260417070124.2677399-1-hhhuang@smu.edu.sg>
 <aeHncYMO-m183mOZ@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeHncYMO-m183mOZ@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58972-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 08E5D41878B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 10:55:29AM +0300, Dan Carpenter wrote:
> On Fri, Apr 17, 2026 at 03:01:24PM +0800, Huihui Huang wrote:
> > There is a memory leak in
> > drivers/staging/media/atomisp/pci/atomisp_compat_css20.c.
> > 
> > In atomisp_alloc_dis_coef_buf(), dvs2_coeff is allocated by
> > ia_css_dvs2_coefficients_allocate() and stored in
> > asd->params.css_param.dvs2_coeff. If the subsequent
> > ia_css_dvs2_statistics_allocate() for dvs_stat fails, the function
> > returns -ENOMEM without freeing the previously allocated dvs2_coeff.
> > 
> > Add the missing ia_css_dvs2_coefficients_free() call before returning
> > on the error path.

> The design of this code is that if we have an -ENOMEM here the caller,
> atomisp_update_grid_info(), calls atomisp_css_free_stat_buffers() which
> calls ia_css_dvs2_coefficients_free().  I can't tell if adding a second
> ia_css_dvs2_coefficients_free() here leads to a double free.

Exactly my point about NULLification... I asked that question twice and
no answer has been received. :-( I believe the atomisp must not be given
as the material for "the first contribution to the Linux kernel" mentored
by anybody. This driver is quite heavy (100kLoC) and very complex with all
magic inside.

> I call this style of error handling One Magical Cleanup Function.  It's
> always buggy...
> https://staticthinking.wordpress.com/2025/03/31/reviewing-magical-cleanup-functions/

-- 
With Best Regards,
Andy Shevchenko



