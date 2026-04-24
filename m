Return-Path: <linux-media+bounces-59492-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NLrKhkl62kwJAAAu9opvQ
	(envelope-from <linux-media+bounces-59492-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:08:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 673A845B33C
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C680F3003834
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 08:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C9C377EB0;
	Fri, 24 Apr 2026 08:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y16naCEe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9E5244687;
	Fri, 24 Apr 2026 08:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018131; cv=none; b=HPg9fnIKyxGI6JcyeAoEfcqEmIuygOkirl4l1BpRZF3siSVFDbGIcLNbKrkDv+ECiO95JuhWIXeP2LP0TAzvwGPQ4IQFkfMSEhtvpGPWWIuLfTXDgkrNovdpTkMiYX2KGnr5mG+SHPqwaRztgA0MVa+QttSl1f94S98h0F+q/zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018131; c=relaxed/simple;
	bh=el6eAALVXVx8JxatyilzXF+lnYX3GZ0QJibHKHB+uhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTnU349rHTgM5K86g5nocpp2BUgtuq8IEikMIx8eG9k7lUblwzBfavtubL0Fr3vCiimXNqBZP6Q3C1AAFJVSi56n6mwbF9JNeSUpOGqU4XNdYQ5x/z4jjqDT+cv2ZFCoJqDRknzcudzMJZukzGem9Jg7Uw+5Px774o2FtPo4EL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y16naCEe; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777018130; x=1808554130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=el6eAALVXVx8JxatyilzXF+lnYX3GZ0QJibHKHB+uhY=;
  b=Y16naCEeRThmnicSuDOJEwa55NdoP5mquC+sFBNvlTEfDZza57d6Ui2t
   jSg0iqZj/3HNs7OYTYbKm226FHlVsCdMYun72yD0/fEJ7tufrQtehAQ/8
   Dv0w3kngGYXlsyQJ9H+QCRLMHrWoAODlDTLtYC5AmOiV14uslKe+6iSos
   OWQXAYVKF+gspx0q/SXGug+2pBH8NLGQxXNiNpXpQQv1drre8s0MTLZ0f
   djtV0YcB5ms6bqyndRmC6UNF547Mcx6t+vaL/wSy/zyh4MAQjG3egLkwv
   /xAJithOXs4d5jszMDyjBQbbyOToHJWHfcTkKW1PqWqsjPv1KIVDS854h
   A==;
X-CSE-ConnectionGUID: dWLf9g35Qo61V5Ltsw7fDA==
X-CSE-MsgGUID: Rc9bSL2QRcKBzF9zEpxQFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="80579870"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="80579870"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:08:49 -0700
X-CSE-ConnectionGUID: VhiwT5QPRqmTmIfM6AQQaw==
X-CSE-MsgGUID: KaLtWwHHQpucdZbsZz+EVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="232799104"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:07:35 -0700
Date: Fri, 24 Apr 2026 11:07:32 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: sakari.ailus@linux.intel.com, hansg@kernel.org,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: AtomISP tree for Linux Next
Message-ID: <aeskxK7GODqMUNsH@ashevche-desk.local>
References: <aeop-rkoHOgF2OgQ@ashevche-desk.local>
 <132d71a4-25d7-48b5-9705-0e7d7dfeef20@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <132d71a4-25d7-48b5-9705-0e7d7dfeef20@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 673A845B33C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59492-lists,linux-media=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxtv.org:url,intel.com:dkim]

On Thu, Apr 23, 2026 at 03:40:36PM +0100, Mark Brown wrote:
> On Thu, Apr 23, 2026 at 05:17:30PM +0300, Andy Shevchenko wrote:
> 
> > I think I will express the thought hanging in the air that AtomISP driver needs
> > to be exposed in Linux Next tree. Currently it's being stored on linuxtv.org
> > servers [1] which I think is not often appear in the Linux Next. So, for now
> > can you add that tree to Linux next
> 
> > Also note, that one of the reasons behind this is a flow of patches against
> > the driver that basically repeat each other or unapplicable due to newcomers
> > have a hard time to realise that they need to be based on a niche tree.
> 
> > [1]: https://git.linuxtv.org/sailus/media_tree.git/log/?h=atomisp
> 
> > Tree: git://linuxtv.org/sailus/media_tree.git
> >       https://git.linuxtv.org/sailus/media_tree.git
> > Branch: atomisp
> 
> That'd be totally fine of course if the people working on the tree are
> happy with that - it looks like it's Sakari?

He is the maintainer, I'm a reviewer. Sakari, can you confirm the inclusion of
the tree into Linux Next daily integration/builds?

-- 
With Best Regards,
Andy Shevchenko



