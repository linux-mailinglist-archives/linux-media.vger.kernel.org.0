Return-Path: <linux-media+bounces-57033-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J9dDzTfw2kgugQAu9opvQ
	(envelope-from <linux-media+bounces-57033-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 14:12:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEC1325802
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 14:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1334331AE9F7
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7783D3D00;
	Wed, 25 Mar 2026 12:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myg16ehK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538453BD649;
	Wed, 25 Mar 2026 12:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441692; cv=none; b=XTTbxrpqdIojqqn9nao320t/fY8cRX4XfnMJ5gzXcG4dcM+K/aV3snqneB4h903F9HsnyX+/MRLhSXOvDdAsdps1sjonWF01vUmruTZGKWIkDexftECUZ3IB5EEj5udksPXu1RLVJCtGycSZ0m4HOUWap/HJINIe+pEuuovnzlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441692; c=relaxed/simple;
	bh=HKBn5uysag1AqcbJn18u4AYp5pUb3WuGKnYvEnUulkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieZ8B+7t6ANre+SXiXEz+AiktBHcqLkhqWmqfjdCsUZJpqQAIXAmm4uFSis42lMXiBOMl3q3KL8ORm6vhEs9mzKKNn+HWd+TC/sDg9fxi4xpfbJsVp8tWbkKL6B4WtmBQjIxamMD8Eix2C3TWKt33m0K+zY8poCJxQVQfyMtTnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myg16ehK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774441691; x=1805977691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HKBn5uysag1AqcbJn18u4AYp5pUb3WuGKnYvEnUulkE=;
  b=myg16ehKmA7xEsii7u94I/IRj1NYUh3VGaOEtyT6qCLxsd57kpM63J8D
   hl8RfSlm5Bbs8D7Wa12ZepHb9tT+AONaBQ8u4Tgj3scQfoPOn2iJnXxkD
   rdAattLzBEsFY/a85fNiGHcyh8h6JndRBmYrOEwq0Ris8Qt32cJfJObaW
   q2B+8YVf9P+eYrwwOSgyxEjwvJLJyllfQpFTcV5+P/j7Uzb/GvBX1feFN
   aqYe9ZM9KFASCXTyV0dBlrMWdvwRvhGeL6TiTaXPD40aTc1I8zMcxobwg
   ju4ZicRUtJx417b0+kYSwoSNjPvKacjRtVZdV5F3cfkCcZ3JheeuIvGZU
   w==;
X-CSE-ConnectionGUID: oCBm2pqQT2G3o64MS6pIwA==
X-CSE-MsgGUID: dkQ3CnT6QtKVPjI1wwjEzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93052995"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="93052995"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:28:11 -0700
X-CSE-ConnectionGUID: WXmCbLvHSYWw9oqjto/1YQ==
X-CSE-MsgGUID: IjuF3ATRRquJzxN6WE8fcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="224929354"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:28:09 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EB56C121CF9;
	Wed, 25 Mar 2026 14:28:12 +0200 (EET)
Date: Wed, 25 Mar 2026 14:28:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	tarang.raval@siliconsignals.io,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx415: Drop redundant runtime PM callbacks
Message-ID: <acPU3H9pYEwzuuOS@kekkonen.localdomain>
References: <20260324124524.135278-1-elgin.perumbilly@siliconsignals.io>
 <1378ed13-6744-422a-b0b8-02621117238f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1378ed13-6744-422a-b0b8-02621117238f@collabora.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57033-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8EEC1325802
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michael,

On Tue, Mar 24, 2026 at 08:42:31PM +0100, Michael Riesch wrote:
> Hi Elgin,
> 
> Thanks for the patch but...
> 
> On 3/24/26 13:45, Elgin Perumbilly wrote:
> > Replace runtime_suspend/resume wrappers by using power helpers
> > directly with DEFINE_RUNTIME_DEV_PM_OPS().
> 
> ...why? What advantage does this refactoring bring?

It looks like patch removes two redundant functions, doesn't it? :-)

-- 
Regards,

Sakari Ailus

