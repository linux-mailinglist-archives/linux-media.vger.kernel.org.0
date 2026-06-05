Return-Path: <linux-media+bounces-63874-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pDl4GBN/ImowYwEAu9opvQ
	(envelope-from <linux-media+bounces-63874-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 09:47:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 901B36461DB
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 09:47:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=f+EI+0yq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63874-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63874-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F887307EA29
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 07:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67687426EAD;
	Fri,  5 Jun 2026 07:39:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8EB47AF6D
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 07:39:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780645151; cv=none; b=kgxKlZ9RZotb8OHW8o2EueIb6po+u8zvsy3qhVGPWWUb8QUTD7ofTYDSw8Ry02ZQcUvxuF8+QZ3jV2Njbnd4Z9SNOStozBV+du+5DNLd+/Xv5qCyleVyLp43Fsz+5wPBHG5227CfxsOrbqbgUvQYsTtXfAl08Z8KwKZ3aBtUv3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780645151; c=relaxed/simple;
	bh=rNMB8kxn0OUrsy60C3NPa30RzdU1wBclSSfW0FUzHQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcuZaO7kE/FISL+pei5LerVjnjHmAKs0Q20bLi4hUPiEOATLVuC8QgsMJ7MHXJqTDMQ8u6A7e2sS2Z2r7GymaRMvXQa9rbXqWrSuyVM4F2R0RouOa7NEXm/WAe+35DUVsnqB9029B8YRe45yWzj9d/RLX9k1RiPqScv7zhn1ovU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+EI+0yq; arc=none smtp.client-ip=192.198.163.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780645150; x=1812181150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rNMB8kxn0OUrsy60C3NPa30RzdU1wBclSSfW0FUzHQc=;
  b=f+EI+0yq3dpkDPlxWS3pZ+qe6gvSMyezD37aenU8POHoOflVcn0DpuyM
   fbw0OUs3eCea3sNaSfDPRXF6KmhPPLZwgFsmSgQ6AlrpXTbtz/Cw5tbRf
   2pM+6sRy6ok09P7S7jjaN5Kbd44jxvcGgKZ33J/f8L0gKyyctj95L2K7O
   K/+DQyndir26Uor3ZBTNGw0VEWdbNOlSFVPTvkyMB7PxzBg9iSKcpzBxl
   LVYlFmN12ZL2JutXfA2z8nTXxYcShWE+AADon5E9aataUIAZq3yBfOfmV
   bCZt36vi+0Xi0xY0dyIqvk+cmTJgL/9fjErhJJl6Mx7H1C7FktxNP1GOJ
   Q==;
X-CSE-ConnectionGUID: ze1v5TUdR6mBbyEDmBr3Hg==
X-CSE-MsgGUID: bByJYu2KTk6HqnW92VTHdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81509627"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81509627"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 00:39:04 -0700
X-CSE-ConnectionGUID: ahE34fx3QTayJmI+YYX9rA==
X-CSE-MsgGUID: QpzCmYu/Q0Cku6+Zhp6WFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="275020930"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.207])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 00:39:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1333B1206D5;
	Fri, 05 Jun 2026 10:39:01 +0300 (EEST)
Date: Fri, 5 Jun 2026 10:39:00 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Cao, Bingbu" <Bingbu.Cao@amd.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"tfiga@google.com" <tfiga@google.com>,
	"ribalda@chromium.org" <ribalda@chromium.org>
Subject: Re: [PATCH v2] media: update contact email of Bingbu Cao
Message-ID: <aiJ9FE1mhTlPRXI3@kekkonen.localdomain>
References: <20260601065555.150536-1-bingbu.cao@amd.com>
 <ah1B9h8baqGqZ8Zj@kekkonen.localdomain>
 <BN3PR12MB95698640E1B433B04559BD438B152@BN3PR12MB9569.namprd12.prod.outlook.com>
 <ah1WLSwptKxFrHkN@kekkonen.localdomain>
 <BN3PR12MB956901A268C35C90BD53E2208B152@BN3PR12MB9569.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN3PR12MB956901A268C35C90BD53E2208B152@BN3PR12MB9569.namprd12.prod.outlook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63874-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bingbu.Cao@amd.com,m:linux-media@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:tfiga@google.com,m:ribalda@chromium.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,vger.kernel.org:from_smtp,linux.intel.com:from_mime,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 901B36461DB

Hi Bingbu,

On Mon, Jun 01, 2026 at 10:00:15AM +0000, Cao, Bingbu wrote:
> > > > It looks like the ov9734 driver will be left without a maintainer,
> > > > would
> > > > you be interested in maintaining it? I'd also add myself as
> > maintainer
> > > > for
> > > > the imx319 and the ov01a10 drivers.
> > >
> > > I would like to be reviewer for ov9734, could you take the
> > maintainer?
> >
> > I don't have access to the sensor nor I know where it can be found. :-
> > ( Any
> > idea?
> 
> I think the Intel camera team on Chrome(in India now) could help you.

Thanks. I'll put M: there for now at least.

-- 
Regards,

Sakari Ailus

