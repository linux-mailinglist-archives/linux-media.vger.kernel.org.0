Return-Path: <linux-media+bounces-66619-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qe4XN6L+SWpV9QAAu9opvQ
	(envelope-from <linux-media+bounces-66619-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 08:50:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 461D77092D4
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 08:50:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="b/8nvRbu";
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66619-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66619-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0A9B300E172
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 06:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1CF2641EE;
	Sun,  5 Jul 2026 06:50:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E90D2609EE;
	Sun,  5 Jul 2026 06:50:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783234206; cv=none; b=PB2MD6jtVsXxyXKvuE5/48+Xntudrzq6nxGcxiqcFFb8JoD0nbVP8ComXyEa1qqfvo8T2zQOPxDlggWfetFsGUQ3eGkiEBoAoCb0pvceLf25r2qJXNptT7A7OBvaDXAYqiGLNfMfBApyXCwzlRjIQM5FRsVmsTCGcbAD1mv3lwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783234206; c=relaxed/simple;
	bh=3/mDoSqD0dmq0n7Xb9urDH1LgUjE3ahiwVuSxPlpFXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnYnQJs8VuLL+QjJZ3o4OGJUwZ4kBr14VvX1Z7/akyrFNpqAdCsurdquIY8+rWwmwqscKiz/XTUBa6DETYAIC4Hd0E3Wur1WSTmPP1fdj/8IfUVyz77WRVO3VP19Rv6bkGdwE3tj7idf/G4Tx3eDNA5WXIvn0EFFrT4DyXIEsPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/8nvRbu; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783234204; x=1814770204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3/mDoSqD0dmq0n7Xb9urDH1LgUjE3ahiwVuSxPlpFXY=;
  b=b/8nvRbuI1ZO8oXI8wQrH24VagvgGhz4IdY76N/ZKfEe+dCAlua4DhWy
   QZrGBq0RDWc/7LNKUtaM2e3wJ3EI3iJhkPpArWUVo3ntovV88D35IEdSV
   ufv654HsI7NKA/HAP+1dfAl4dvnICwJC+1Bo0c8JcrQfLjlj1m5QEg4Zy
   Ih67WY+j3Cw9mZX3ydHUnalLmzsDrJyFJilJ1xNMFIwJWffGBTwTNV6/v
   FRE+h8nPw6jO45mDzhRcwQeq1mn+eKlWLfXXUCKzpdBUbTj3dUOaaVIfR
   gcbf9/1JfDRJrHDeYloJTrCJIuIirjsSbY7723B3dWqprZOLw+aCjk4/7
   w==;
X-CSE-ConnectionGUID: H0OGlDLKQAekR/djNFgaCw==
X-CSE-MsgGUID: ptwcQZzJT56uHwhcEd4ogg==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="83008401"
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="83008401"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 23:50:04 -0700
X-CSE-ConnectionGUID: hoKwTULzTZi6OhCAE5Wcrw==
X-CSE-MsgGUID: 1xpAr8tyTfunI11Cswj8Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="253563032"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 23:50:01 -0700
Date: Sun, 5 Jul 2026 09:49:59 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ruziev Miraly <miraly.dev@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: flatten pre_power_down logic and
 clean up staging code
Message-ID: <akn-l_8jVLI4VmbB@ashevche-desk.local>
References: <20260704190854.114172-1-miraly.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704190854.114172-1-miraly.dev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66619-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miraly.dev@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:miralydev@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,intel.com:from_mime,intel.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 461D77092D4

On Sun, Jul 05, 2026 at 12:08:54AM +0500, Ruziev Miraly wrote:
> Refactor atomisp_mrfld_pre_power_down() by removing the redundant
> nested 'else' block, making the function structure linear and easier
> to follow. Keep both error logging branches intact to ensure consistency
> in hardware failure reporting.
> 
> In addition, fix minor checkpatch.pl style warnings in the same file
> regarding code alignment and hanging open parentheses.

> ---
> Changes in v2:

As I see this went completely wrong. Read my previous reply why.
Please, slow down and take your time to study how the Git works
and what is the process to upstream the changes and read related
(in-kernel) documentation for that (also articles from lwn.net
will be helpful).

On top of that, find a hardware to test your changes. It's usually quite cheap
no-name Intel Bay Trail or Intel Cherry Trail tablets one may find.

-- 
With Best Regards,
Andy Shevchenko



