Return-Path: <linux-media+bounces-62563-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCOEGCf/D2pvSQYAu9opvQ
	(envelope-from <linux-media+bounces-62563-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 09:00:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE335AFC55
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 09:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 830EB300FB24
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 07:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941D9384235;
	Fri, 22 May 2026 07:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/aMHvQ+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B1728F948;
	Fri, 22 May 2026 06:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779433201; cv=none; b=spuiIffAnQ7s5pWeqR+YAZwgZq6GxK5WQy38Ri9MdlPjdx+XPPd5qoq/UnGBNlwafps71GLud5Hu4SEIy7fVFNXD4j/xTtcrE04tYLInzbYk3d6XtvR5cgeWtaFrdZfoq7edwmBZbZdnu9e1wyG4XQTAK0Lk3Zeo4fndqcuK5hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779433201; c=relaxed/simple;
	bh=ZFAxxQ5YnXKHQSrmFD0uijQGPXvj16bXWBqa5LluKCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKPj3BePF6r7wf42u13T/Ul11aWdAHs05vml0s70XHcHrn7HLDWeFog2wPKtI1ah26lv8nZk1FhvC5zVtb0NVn30bTE1bn0Yey3bZqHW8hOYlgTpPXGeK/YjymAiwBzk/MUXH9IjW9oBE75TwIPuGrVkU6VXphOxtz8R1+xWzf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/aMHvQ+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779433199; x=1810969199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZFAxxQ5YnXKHQSrmFD0uijQGPXvj16bXWBqa5LluKCc=;
  b=G/aMHvQ+ZcERLzPoXfORAqYJv8Yu9JFpxafTsnYXkbp/AQ0U3cZsthYs
   G+kq5UdSjBSHDpqtV6DP4RdqcrtjVVBgXTJeZLGFg4SvG4K6PVuhf5uUY
   qBfgoy2tm40Va6VZt6cbQh5oHZKHD9ZBSPZpyNmO+/M9ot22u5M58prA2
   lMtxIpB64B7BOFPYRkmMlfk2U3sm0Ryv5GEkEQxBuxRhfNCqwwRyjcIoQ
   eiOAvQlJhSDeCiybmKBN7IDA13uhI3XtSCybYHg/patVFF1Md+KQtwATv
   FwRrlUZXf/T+5ydB7yOyp4HqlMdNx7CynpvB2pEkEh0nZIvfrNFSQKpBY
   Q==;
X-CSE-ConnectionGUID: e1BNO1tJSfKKnwd0EojMkA==
X-CSE-MsgGUID: pdnoHSlwTrCRaNo5Vpx2+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80342513"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80342513"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 23:59:58 -0700
X-CSE-ConnectionGUID: wSg9hgQBRmSDN050CcU7cA==
X-CSE-MsgGUID: DVxaD8fhRSKmOwQdEXis+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="240709138"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.224])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 23:59:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1695D11F851;
	Fri, 22 May 2026 09:59:53 +0300 (EEST)
Date: Fri, 22 May 2026 09:59:53 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mark Brown <broonie@kernel.org>, hansg@kernel.org,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: AtomISP tree for Linux Next
Message-ID: <ag_-6fqLzpvqNKw7@kekkonen.localdomain>
References: <aeop-rkoHOgF2OgQ@ashevche-desk.local>
 <132d71a4-25d7-48b5-9705-0e7d7dfeef20@sirena.org.uk>
 <aeskxK7GODqMUNsH@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeskxK7GODqMUNsH@ashevche-desk.local>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62563-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,kekkonen.localdomain:mid,linuxtv.org:url]
X-Rspamd-Queue-Id: 6BE335AFC55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andy, Mark,

On Fri, Apr 24, 2026 at 11:07:32AM +0300, Andy Shevchenko wrote:
> On Thu, Apr 23, 2026 at 03:40:36PM +0100, Mark Brown wrote:
> > On Thu, Apr 23, 2026 at 05:17:30PM +0300, Andy Shevchenko wrote:
> > 
> > > I think I will express the thought hanging in the air that AtomISP driver needs
> > > to be exposed in Linux Next tree. Currently it's being stored on linuxtv.org
> > > servers [1] which I think is not often appear in the Linux Next. So, for now
> > > can you add that tree to Linux next
> > 
> > > Also note, that one of the reasons behind this is a flow of patches against
> > > the driver that basically repeat each other or unapplicable due to newcomers
> > > have a hard time to realise that they need to be based on a niche tree.
> > 
> > > [1]: https://git.linuxtv.org/sailus/media_tree.git/log/?h=atomisp
> > 
> > > Tree: git://linuxtv.org/sailus/media_tree.git
> > >       https://git.linuxtv.org/sailus/media_tree.git
> > > Branch: atomisp
> > 
> > That'd be totally fine of course if the people working on the tree are
> > happy with that - it looks like it's Sakari?
> 
> He is the maintainer, I'm a reviewer. Sakari, can you confirm the inclusion of
> the tree into Linux Next daily integration/builds?

I guess I could push patches to the atomisp branch after running them
through Media CI. But I'm not sure it's really worth it: the long backlog
of patches is now largely gone and the same fixes or cleanups can be only
merged once anyway. So would you expect the flow to still continue at a
similar level? There's a limit to which degree this driver can be improved
with such cleanups.

-- 
Regards,

Sakari Ailus

