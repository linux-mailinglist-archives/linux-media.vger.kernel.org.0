Return-Path: <linux-media+bounces-56865-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEncMCF/wmnqdAQAu9opvQ
	(envelope-from <linux-media+bounces-56865-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:10:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8767A307F06
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F65931C7182
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1EB3EFD37;
	Tue, 24 Mar 2026 11:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUgm9WQE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4633D567C;
	Tue, 24 Mar 2026 11:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774353077; cv=none; b=bD7S13k4gIrxFhp60Cm93PCBaV+i1FFuezXzCzX/hbMCoNl+fd82BbSXja/ST6dCGMSunp7musDQfuYbBYL87kfKlYGSVRQJpYxD1hMR8hQt8pt9aZpTVkab/KwxX3BOGqbqTivcixoeppyhPdzRFjy49zpgsF82FbRM2cA0DYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774353077; c=relaxed/simple;
	bh=wh0c9ykovZ/PJSEYZ0Lg057BsC+kyX3BTas7PJvXYkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkhG88Am6fBAVw07sMd74Ecdp2xFAX2R7Cmt+13AQJllzKI9poCnjlZy/0iZzF3rcjCR6hYnyi6F8OyJyPdKr7u5azUEsjhCahZXLqqa0vZve8Ilubz06uCbklJThTuwqhL5lMUrFimdd2VspMIingE2rpp5y53bt5plTGcR2xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUgm9WQE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774353077; x=1805889077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wh0c9ykovZ/PJSEYZ0Lg057BsC+kyX3BTas7PJvXYkI=;
  b=DUgm9WQEF/agtuQ4QOWQrzfmH+U8lyAjNA8vzE+680zR5+Su/hOjWRrE
   gWNcoBLjbkZE3s1hbZsYMEIBqRTBDxmB24umSCk982TVQgYbeMRW06LjU
   UkxtmP905uf6CY3rPCv4xYmi7fbdlMHPNmXQ+Cf8jaAvih+cJW5Uclqs5
   aT0iXwoI6rOLpbnMYyQUoLmivitPzXuvQdcxN9YHCKROlGKdTYAQNj76G
   2JPMTsiIPaaIOype8Xliou9TOYhpekRTDDxE47aO/bBpk+iIqp7yI6Bs0
   doWANAX1Vl+PxOF4xj8ncW7x/Ytzw//uInT210vnKThxUgIIi0JOCBBOU
   g==;
X-CSE-ConnectionGUID: pRott6fcQvCoCQLMMWVApg==
X-CSE-MsgGUID: sNDGweYAQFuiXskykHULOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74387913"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="74387913"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:51:16 -0700
X-CSE-ConnectionGUID: 7lQ8nqwgThKC2ZdXLWZgZg==
X-CSE-MsgGUID: NBJ8JMGJQn6gLFGB3CaP5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="225974773"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:51:14 -0700
Date: Tue, 24 Mar 2026 13:51:12 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: gregkh@linuxfoundation.org, mchehab@kernel.org, hansg@kernel.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: atomisp: pci: remove leading whitespace at the
 start of the line
Message-ID: <acJ6sH4yUyity0gu@ashevche-desk.local>
References: <20260324081007.23165-1-anushkabadhe@gmail.com>
 <acJ6iD5FGE2ZlORd@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acJ6iD5FGE2ZlORd@ashevche-desk.local>
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
	TAGGED_FROM(0.00)[bounces-56865-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 8767A307F06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 01:50:37PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 24, 2026 at 01:40:07PM +0530, Anushka Badhe wrote:
> > Removed the whitespace at the start of the line to comply with
> >  linux kernel coding style.
> 
> Linux

Also note, while fixing the above mentioned problem in the code, the commit
message suffers from the same issue.

-- 
With Best Regards,
Andy Shevchenko



