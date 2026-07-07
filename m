Return-Path: <linux-media+bounces-66819-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VIosAOzBTGoApQEAu9opvQ
	(envelope-from <linux-media+bounces-66819-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 11:07:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83E719860
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 11:07:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=lSYq5kIQ;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66819-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66819-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAC9A3100426
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 09:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0D83905FD;
	Tue,  7 Jul 2026 09:00:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3B323394B;
	Tue,  7 Jul 2026 09:00:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414829; cv=none; b=BD9MbI+UsA6k8mCqjfCXfmJ9FgKBXVJaUtKXfhm75qe/xI90C8ArDhNDmATMFQNqQdx6E0klTpfHHQwc3OP7DZZAjbkBgw8bo79JepG11NsFPhgH7lGLkNH4z5zOn2mP6gV59hsdX3wM8q3j+Zm79Kgbc3jKqng1DrX3mOxtN5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414829; c=relaxed/simple;
	bh=ZYNjbp+fxCd/Ev2TPUKV7YvCVxIkasH2kNS7bWFSCiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tR0FFK5MfVgb8Lc8ICayLhKXrfaxYsbBUXquBHSxqHcfnSuyenqhEgEpyOu9f+E7WSQ/Qp80/j8pI0dmqXmqXgN/FW+S9U/Crbw35u+HVKAVuSaQTvVnSaNKCP31MpEaEhv/y7+ZzekrrC9auph1qtZEk1c3SX3YcT9N2LuFjXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lSYq5kIQ; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783414828; x=1814950828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZYNjbp+fxCd/Ev2TPUKV7YvCVxIkasH2kNS7bWFSCiU=;
  b=lSYq5kIQJh/W2IvAw0BXjHxtzfbdpCJcARStpr+XvqEUg125MX9oy6Sk
   Zc+mZcdCiCuCBXZLsLvBo/uV1TKoGhfFm2+vFMqUvGXuixAESiO3/dUPo
   bjguIB58aj7pzmhJSB95ZTsMPpr9myBT2LmDYrLQzvs+kX4tpRmwmut+D
   U+E0PxfAJTwjykKCj3uBXqYY9KOtbM0RQ2A3tWJ8pXlXBeUH9D2ZwEEgW
   qSf+yVLhjaligBSvHBGo+jmi5wPP+2+OOrJURosvMWYD65XINPAjHm4n8
   t4pvApSSjGd/4weU4p/92RmM+tIqRJ2DLJn4MjG/HjqsARICFp8CU+ZrK
   A==;
X-CSE-ConnectionGUID: PQJD/A9lRV+ooi9UUsBI6A==
X-CSE-MsgGUID: iaMJILA3QUK722dJcLNSiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="86606229"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="86606229"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:00:27 -0700
X-CSE-ConnectionGUID: gczYZBwSQHCVh298C+84IA==
X-CSE-MsgGUID: dp6Zg802QRCi19GLT3Dsuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="258848273"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.178])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:00:25 -0700
Date: Tue, 7 Jul 2026 12:00:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ziad Ali <zalshemy9@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: atomisp: fix typo in atomisp_tables.h
Message-ID: <akzAJ1pN1nyInsbS@ashevche-desk.local>
References: <20260707074020.12332-1-zalshemy9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707074020.12332-1-zalshemy9@gmail.com>
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
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zalshemy9@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66819-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:from_mime,intel.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C83E719860

On Tue, Jul 07, 2026 at 10:40:20AM +0300, Ziad Ali wrote:

No. Read, how to describe changes and write commit message.
Also I'm going to NAK patches against single files. Do your homework.

NAK.

...

> -/*Green enhencement image effect table*/
> +/*Green enhancement image effect table*/

Even after the change this has another style mistake. Read and study
documentation to understand what is that.

-- 
With Best Regards,
Andy Shevchenko



