Return-Path: <linux-media+bounces-59498-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNZ9E10t62mBJgAAu9opvQ
	(envelope-from <linux-media+bounces-59498-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:44:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BB67645BA74
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A80C3013A61
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 08:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB47F350A1B;
	Fri, 24 Apr 2026 08:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7XW4J7l"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018B53385B6;
	Fri, 24 Apr 2026 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777020250; cv=none; b=FipKtlGTAK1okMtUj+IWfiMADuVpD3suNLV0lJqAnrygVE8O/xoVRFRbt9fmfmEfY5RVukirf+bwmHk/WdbAyolvFNzzLpinh63yKRz1I/1Ie2jdy7HlyYPyKhtMMEn49hfdJ7inAH82RC5IRhI5K4D3nfkQURBxxHAZKBRWuLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777020250; c=relaxed/simple;
	bh=EWAzBboTwrjtoW8WqJuznYJilxj9JeFVEexmso5QyTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3to9CJhBkxs3Y0ZEC/wYLj20PXAvrcX5wgxCMjKjCtLACOKTLK5xb5BGnPA806RENudK8G6NkSWbdKBgXGIOzwXou9eWAD66NgY47KBDsrm76YAVcKfQT/gINOX1NZ8rcGyaKQj9aWHuBAeFOqeQn1z1Z6OUeTI1IxFGQBv7jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7XW4J7l; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777020249; x=1808556249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EWAzBboTwrjtoW8WqJuznYJilxj9JeFVEexmso5QyTE=;
  b=c7XW4J7lYQq6E6vAtFkLzaKuLNx1xUU9BYiqxBcOhfO6ebf3f1Xfy6e3
   3ju+A9NuhUGDHVrHQsyGNU+piCcSAkfQAI3QWAjRb5TWq2jGKqyNjFC0w
   qAxNTdf9d3zPTUWPdeOf9Dn7OepuUBIqUFbYQ/dvQsezYxbYMf9EBR8sl
   9hZektQn0jp0Zdz9SX3YCkLBuknKH1Q6w7cSEihhtkkLQ2hYoZZ7Cml+V
   Fxe4RTGuQ0fDa9oul2kAzNMCV4RDz5Kx17JShMPZKDXh57RYaf3cTjAlS
   ldH5nZTHowZbTvsY8DaxF9AwIr7dowJFSHwiqIkWLj1dC3lgc8EitwNbK
   Q==;
X-CSE-ConnectionGUID: 8Zis+e3MTtKHemVG1L0UQA==
X-CSE-MsgGUID: AwO5FPWXT7OjdS27IWd7zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="95560018"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="95560018"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:44:08 -0700
X-CSE-ConnectionGUID: eEbMK7nXQUKqC+D8gH7PYw==
X-CSE-MsgGUID: ncWO/N6/SKeKpcVtDwGDrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="263297127"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:44:05 -0700
Date: Fri, 24 Apr 2026 11:44:03 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Nick Spooner <nicholas.spooner@seagate.com>, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: Use str_on_off() to fix
 Coccinelle warning
Message-ID: <aestU-4THcXaSqKf@ashevche-desk.local>
References: <20260423194727.3200344-1-nicholas.spooner@seagate.com>
 <20260423224113.643cddc5@pumpkin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423224113.643cddc5@pumpkin>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: BB67645BA74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59498-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,seagate.com:email]

On Thu, Apr 23, 2026 at 10:41:13PM +0100, David Laight wrote:
> On Thu, 23 Apr 2026 13:47:27 -0600
> Nick Spooner <nicholas.spooner@seagate.com> wrote:

...

> >  	dev_dbg(subdev->dev, "Setting power state to %s\n",
> > -		on ? "on" : "off");
> > +		str_on_off(on));
> 
> While someone went to the trouble of adding the 'helper' and the Coccinelle
> warning; I'm not really convinced it actually improves the code.
> It doesn't even do &"off\0on"[on_off * 4] - which might be an excuse
> for a helper.

The point of the helper mainly not about the code optimisation, it's all about
making unified tokens when printing stuff (same for dates, times, escaped
strings, et cetera). Btw, the code like `&"off\0on"[on_off * 4]` is unreadable
trick. And I dunno if compiler/linker will be able to pack these string literals
as currently done in case several of str_FOO_BAR() [with the same FOO_BAR] are
in the same compilation unit.

-- 
With Best Regards,
Andy Shevchenko



