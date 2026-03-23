Return-Path: <linux-media+bounces-56677-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGaeE6ANwWngQAQAu9opvQ
	(envelope-from <linux-media+bounces-56677-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:53:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5D92EF670
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3818A30465EA
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A848D38758A;
	Mon, 23 Mar 2026 09:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dePwy1FW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB1E387596;
	Mon, 23 Mar 2026 09:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259351; cv=none; b=pUvpJpNYp6qBiX53mRe997YzBjEh0RjhoTveQb+bl9cckEsZJXcFfP7LZFQY3udL0uyq/y/OEA7IT1AVuhwNqc0y+ACO3utMm5hxsseMOPWBV6w+kQRlc80gtNrN+kjsHqiBHbwJ8nVl+qy8mINsht4Q5iq9x2RkR9eT34p9410=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259351; c=relaxed/simple;
	bh=E83D9J1KjH/B4LmCiMib3fQ3u8gwvrN0E/XkgYgWciQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkpR0EMcT+fM6grSDKf6cinyLDYh96MCLyhsqTDNmxXbB+7vpZ33k4izPZAn8Unixgt2T7F5OEUd9GMFxegVYG+EauX2pmO4Hbi2L4mSne0hCjAZnsxnQmzz9RI+wgQAOvVLA2R7+PhJQEx0rE6fhmx5ulUi0+DOrAkMFsWKxiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dePwy1FW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774259350; x=1805795350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E83D9J1KjH/B4LmCiMib3fQ3u8gwvrN0E/XkgYgWciQ=;
  b=dePwy1FWvpan62JddcsQy9/aTBW5DsAW3ypSx+rBQDcW/H44nvTQyAXd
   mniHGeiFczP4/xkliKvDcNDZcu18ZoqtvoW6afnirTdXxYIT3Fym1hzCL
   79DhJ1+bGxrZ87NzSWbYnXm/Jh4bfAGvZXMTL9KjVyse2JKbOOi6XVA2i
   UddbdBoQ3N4jr1fk2VxwHitNJjGCgA2n72cEVPh9kxlk47rIf/gvBPoR5
   BmmRADloQwVA+YFtqNUS740T6RzGx8E4osezAW2QE9+3NVk/9Znjtzf+3
   rDRqQhMqAcbN/qVWzutxIkVouY+ksimBugK9SQyKhyQuMwbS5vangI7np
   A==;
X-CSE-ConnectionGUID: AjJm8MTNT5ya8KMK6VvmAQ==
X-CSE-MsgGUID: U9/pneVsRYWWCwyfAIXzJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="78849777"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="78849777"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:49:09 -0700
X-CSE-ConnectionGUID: 4AMVKzdJQeWilF8iP2VcaA==
X-CSE-MsgGUID: T0HwGYf+T5SKxXpUm4qYlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="261890556"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:49:08 -0700
Date: Mon, 23 Mar 2026 11:49:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chethan C <mail.chethanc@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Petr Mladek <pmladek@suse.com>, Kees Cook <kees@kernel.org>,
	Osama Albahrani <osalbahr@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: media: av7110: fix coding style
Message-ID: <acEMkNSAlZzbhdrJ@ashevche-desk.local>
References: <20260321155544.548537-1-mail.chethanc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321155544.548537-1-mail.chethanc@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56677-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,suse.com,gmail.com,ideasonboard.com,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: CD5D92EF670
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 09:25:29PM +0530, Chethan C wrote:
> Fixed Indentation, Alignment issues reported by checkpatch.pl.
> 
> Renamed enum av7110_rec_play_state, av7110_type_rec_play_format,
> av7110_encoder_command and wss_data from camel case to upper case
> underscore style to comply kernel style guidelines.

I believe my comments given again another version of this patch are still
actual.


-- 
With Best Regards,
Andy Shevchenko



