Return-Path: <linux-media+bounces-65853-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IziDMEYjQmpf0wkAu9opvQ
	(envelope-from <linux-media+bounces-65853-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:48:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 142846D727D
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:48:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=PtnZ8Oaf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65853-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65853-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89F753197BB6
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 07:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150753403F6;
	Mon, 29 Jun 2026 07:38:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BD43D813D;
	Mon, 29 Jun 2026 07:38:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718720; cv=none; b=EB0cPtAQjavSe3EsSks5izEmddWB5qMR03RLb4lvtRmscBgHuLNhE5Q0dY4s49cE/8gp2e7daGRd7iojqDWVATKIwiy0PxJIshM1I9AAqzUz2vbWEz+pXhhpwdY1VRUk+At2QOhaA+wVucAXjeBVz6kd/THEk+YZ0qX8GjF9dWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718720; c=relaxed/simple;
	bh=oPLWZXxJjysF+OzWbrv/GEQD9w+rSij56YwU6dqLYHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uw4wF6BjRBkw1zVDRT2KGagD97oPd2uXYBy62iDvkFXtmJrSCKbNqECxU3a8zksIuaUlixdN+uhJf4HDxZa55EiCZBe6WMApa9EdXtBZd0Et4pNpyCa/ofHdODX0niVn3W5pNzmdVTqx2Hhf4j7h6aVyNpRAYSs1vg65MoGPc0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtnZ8Oaf; arc=none smtp.client-ip=198.175.65.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782718717; x=1814254717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oPLWZXxJjysF+OzWbrv/GEQD9w+rSij56YwU6dqLYHA=;
  b=PtnZ8Oaf6P/mzdM9xrXFk5/M8421xKN9PVVNG+jji1bEw9n9+J1vyOk8
   VwcCqCCZ90zGDK1U3yxHzy+BJ581Zr/8CQEEmq9ILKYZip5HXoRWFOL8v
   MLKjsqqx24JBhelvBr8E+f7HFjQmNW0Q1zXVpnIUMnUAJfcUQfIkPsoZp
   fZAFhKzZK3RHtMHXFBh6h1+XGVzy+3JYp0hl6mlG5fix5cDCFQ2njd/Op
   RPW0IvegO+k16X8mID+vto9b8aJRYt3341O4Ekf5sk1zGHGpMpeaVun2h
   OAit8dgADlcuFeTtgJ4YpdG4pXUdWPU9Ss4h2coN+LvsD0azOtsbaYHN0
   Q==;
X-CSE-ConnectionGUID: cQt+lZmLRH+BOzDDJxcqdg==
X-CSE-MsgGUID: DGcaDSBHSAWlsDmbgXKDTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83276760"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="83276760"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 00:38:36 -0700
X-CSE-ConnectionGUID: Y93RFMxrRq2A4kOs0yjNTA==
X-CSE-MsgGUID: +nJ3e+6iS0ajEDIFpQjxsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="255485334"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 00:38:34 -0700
Date: Mon, 29 Jun 2026 10:38:31 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: atomisp: validate sizeimage against the
 allocated frame in framebuffer-to-CSS
Message-ID: <akIg93XXxWDtfHT9@ashevche-desk.local>
References: <cover.1782484857.git.doruk@0sec.ai>
 <023f2124beb3d2fe9ab0ab6bd31717f0a6c9ff81.1782484857.git.doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <023f2124beb3d2fe9ab0ab6bd31717f0a6c9ff81.1782484857.git.doruk@0sec.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65853-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:doruk@0sec.ai,m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ashevche-desk.local:mid,intel.com:dkim,intel.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 142846D727D

On Fri, Jun 26, 2026 at 06:40:41PM +0200, Doruk Tan Ozturk wrote:
> atomisp_v4l2_framebuffer_to_css_frame() allocates the CSS frame
> (res->data) from arg->fmt.{width,height,format} but then
> hmm_store()s arg->fmt.sizeimage bytes into it. sizeimage is an
> independent user-controlled v4l2_pix_format field with no cross-check, so
> a sizeimage larger than the allocated frame overflows res->data (ISP/hmm
> memory). Reject sizeimage > res->data_bytes before the store.
> 
> Found by static analysis; not yet runtime-reproduced (Intel Atom ISP
> hardware required).

> Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).

Is it AI-based / backed? In such a case you may use Assisted-by tag.

-- 
With Best Regards,
Andy Shevchenko



