Return-Path: <linux-media+bounces-66122-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hMGwAaXfQ2pakwoAu9opvQ
	(envelope-from <linux-media+bounces-66122-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 17:24:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0EC6E5E6D
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 17:24:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=f8WYt1Ll;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66122-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66122-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01808304C772
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D44E370AD4;
	Tue, 30 Jun 2026 15:24:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59525331EC4;
	Tue, 30 Jun 2026 15:24:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833051; cv=none; b=btXDhJFX/u/GjKUBm09XQY/wx0NTBWvPm6axuOpdPKl5Z2vaJsBVxNom35jr8TIbpSsc3IQUx2PPE7QN5V/w1U0BftXlaRGbtOSJ/5eRLPVCeSe/rRHe1PCPBNbf/p3fiTQQZIEwa+dyZ18GyBEX4NNVE9iIgOPEgyLw4CGht/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833051; c=relaxed/simple;
	bh=rffeOx1ZNGZ/71pnrS5g5M7MX9Nh/43FzsVfPNKxPXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbizKhPsZOyFsY2l+EJRrYKmJZ7Q21cO6TgrH/pnKsFmuQO+cOUTH/XIFeu+ahAMmVYYb7rAmqeRPxQtFHJhesQKvaw1mQ4B/Nlf6eNem7y4OK8KFpaWwKigoXimzQ2a0b4mnDXxPosXG6/KJGGUZwNCAwPRrYeq2Xm4NiuxOpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8WYt1Ll; arc=none smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782833050; x=1814369050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rffeOx1ZNGZ/71pnrS5g5M7MX9Nh/43FzsVfPNKxPXo=;
  b=f8WYt1LlplxgSXrvhX+Vy7hKvTDjUpq8sUrNa3CNP3L5+V3nKhrEMQHU
   9nwvRuiyPGVEPPxU45RX6AszO47po5AXdbVNwPe2Vs7JlOD3LPV8Z0PTJ
   f+inO5qsbiFq820RyiCpXh4xsVdpY0RNVv8nn0OwUtEUeVAQbNt2f/0QG
   WOZd+WCQTBY6ALDxbKgjiUJRad0dn/qlXVvWXun2Aqs2wCnBydUU2bR5X
   ykzDeizoBMFRv8yNztwwbRctyDtbe4qIEMiQclPJn9QF7s4AG1frPwjeP
   l6qQZ5akwyeYPSvhEo6WJrQU1LUdT6ez/BeOgvlMkRXQIUK/Crxz0Y57I
   w==;
X-CSE-ConnectionGUID: 3GpNtapRQie6Jr3uOtlYqA==
X-CSE-MsgGUID: nOLVOUXfSuW35Lt/bI7MJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="95053253"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="95053253"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:24:10 -0700
X-CSE-ConnectionGUID: sKtIce60T7OZ38UwmOE+Qw==
X-CSE-MsgGUID: LzRQ8voRSf24oUL9Ro6r1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="254200766"
Received: from slindbla-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.241])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:24:07 -0700
Date: Tue, 30 Jun 2026 17:24:00 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/15] media: i2c: os05b10: split common and
 mode-specific init registers
Message-ID: <akPfZLgX7zTVWt_6@mdjait-mobl>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <20260325114404.95188-5-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325114404.95188-5-tarang.raval@siliconsignals.io>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66122-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tarang.raval@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:himanshu.bhavani@siliconsignals.io,m:elgin.perumbilly@siliconsignals.io,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.intel.com:from_mime,intel.com:dkim,intel.com:email,mdjait-mobl:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A0EC6E5E6D

Hi Tarang,

On Wed, Mar 25, 2026 at 05:13:50PM +0530, Tarang Raval wrote:
> Separate common initialization registers from mode-specific settings.
> Move resolution-dependent registers into a per-mode register list and
> program them during stream enable.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>

--
Kind Regards
Mehdi Djait

