Return-Path: <linux-media+bounces-65997-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xzH6C16dQmq/+gkAu9opvQ
	(envelope-from <linux-media+bounces-65997-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:29:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 886A16DD56A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:29:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=TCBC+FNT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65997-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65997-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAA7B304C8AD
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE70D44E045;
	Mon, 29 Jun 2026 16:25:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1085A42189A;
	Mon, 29 Jun 2026 16:24:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782750301; cv=none; b=i2O1ZGjy3TXBrQAYSUP099bvjHmMBjKWqJuo0Cpobd3LSMFluEfApMk/ba+QO6i2icSVe2KTNyVKKRd2hIjuz6KIt/NGjIJqS96sK11SMxuO31djxav8HVkqssaCxc1DI+G5kSg099/39+AXwmrW9766/TI2TbwMq8ED0uA2Hp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782750301; c=relaxed/simple;
	bh=o5t4J99Ft/B/ByL7TptJC3aZCmUArFeilGEd4v9Czsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TlpvZgF/0Zr6h5p1SBkcedp6khm7l4AFzxJCg/QbAApYMopzAfVa3ShyAd1WB0pA9hEDOZQkhvkynCkwsfkvebZQgEs4wS+va4gXRIHm8M6cnNTn1NzuhmThqeLdUxxq2j2bFEwXys+29CMVJXSAaSnvcbtSuJjHTRsuR+FSau8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCBC+FNT; arc=none smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782750299; x=1814286299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o5t4J99Ft/B/ByL7TptJC3aZCmUArFeilGEd4v9Czsk=;
  b=TCBC+FNTA5zNbT9lqAWn3aRgHFjJ8zjxrPGq+L29zjrYbZtM1czSTNOB
   RZZ2/vtIG4GQ58lwwoWzYQYUL2OaMVDhwZAWkJdLiZG/qExbfHMtIatiW
   H0IAUHfOvFXdwad5bDd+e0BYFFtKgfbggiIvt7cCNoBVzjZYOLHMsHSqo
   ih8xoFBhCZDHksb2JJnMCnLLM/b1i8vUYIC3ppA2jd5MJhMUMF0ABj59G
   D0/aBMKBN5EeHvGx5BJEh7XMNKNogzcbScxv1U/F/VJ50W+Rv/p0F2INe
   xEot1Yr56ElEjqIJ0/EusAEwU3tcP2pJOIDS8bYLFRaiUSuLcpf/BmPHt
   w==;
X-CSE-ConnectionGUID: oLnQ5Kp9QsuljvES7S1lGA==
X-CSE-MsgGUID: Jpqc0rgSTy27FHnzOeuq+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94037116"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="94037116"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 09:24:58 -0700
X-CSE-ConnectionGUID: HwLbCL2STuaekElzD4r5Fg==
X-CSE-MsgGUID: hSueI52aQAik0VNE7/UIuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="276272790"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 09:24:56 -0700
Date: Mon, 29 Jun 2026 19:24:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: hansg@kernel.org, andy@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, error27@gmail.com,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: atomisp: validate sizeimage against the
 allocated frame in framebuffer-to-CSS
Message-ID: <akKcVudM8hj5Germ@ashevche-desk.local>
References: <20260627100119.97650-1-doruk@0sec.ai>
 <20260627100119.97650-2-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627100119.97650-2-doruk@0sec.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65997-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:doruk@0sec.ai,m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,gmail.com,linux.intel.com,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,0sec.ai:url,0sec.ai:email,intel.com:dkim,intel.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 886A16DD56A

On Sat, Jun 27, 2026 at 12:01:18PM +0200, Doruk Tan Ozturk wrote:
> atomisp_v4l2_framebuffer_to_css_frame() allocates the CSS frame from
> arg->fmt.{width,height,pixelformat}, but then copies and stores
> arg->fmt.sizeimage bytes into it. sizeimage is an independent,
> user-controlled v4l2_pix_format field, and nothing checks it against the
> allocated frame, so a sizeimage larger than width*height*bpp overflows
> res->data in hmm_store().
> 
> Reject a sizeimage that exceeds the allocated frame (res->data_bytes)
> before the copy/store.
> 
> Note this ioctl path (S_ISP_FPN_TABLE) is currently gated off by
> 2b7eb2c5dc72 ("staging: media: atomisp: Disallow all private IOCTLs"),
> so it is not reachable from userspace today; this hardens the
> disabled-but-revivable path.

> Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
> Found by static analysis; not yet runtime-reproduced (Intel
> Baytrail/Cherrytrail ISP hardware required).

This can go to the comment block. Otherwise you have a tag below already.
Same for other patches in the series.

> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Assisted-by: 0sec:claude-opus-4.8
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>

-- 
With Best Regards,
Andy Shevchenko



