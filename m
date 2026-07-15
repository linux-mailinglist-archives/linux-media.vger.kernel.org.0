Return-Path: <linux-media+bounces-67677-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AUxHCrCAV2oBTgAAu9opvQ
	(envelope-from <linux-media+bounces-67677-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:44:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 632FE75E4CA
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:44:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=R5AFOLh0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67677-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67677-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 049B930608E0
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 12:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A47F472792;
	Wed, 15 Jul 2026 12:39:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F98241D63E;
	Wed, 15 Jul 2026 12:39:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119155; cv=none; b=KvO/7fAaIPw1wAA2WMvU6YtmH6mhYdZLA9q7ANpIYmAZqMIsiQmg3bJGAO3j/JraUOflVHsHOA6EhGisZ+DJ4SIzT0LOBnHgIoV171AGvF0h6FFaE92N9Xe/wz2LufmkoLm42c13JUDEklO1YWKrw2l8zyYp5uHqj/6dcFTPKIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119155; c=relaxed/simple;
	bh=HaHn6du7UJCN/OY2gbQQnyrEzeX3lUdDNjiP8v2c8Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pR1QeVlkVGUdaEIuFMc0ghlsaxeMo9c5vXfb+8aUfwDdAILwpDFnAyq8ydEfHFEE2ujSjLZW0URGPyi4nlawy+h2ciw43CgW9kZdfW0cXKlB5nltS4Dmmkp4qyprh7YC/86IrECJph652OKVN3oe5t70HHSmhUe/pUeRPTuyvtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5AFOLh0; arc=none smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784119153; x=1815655153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HaHn6du7UJCN/OY2gbQQnyrEzeX3lUdDNjiP8v2c8Cw=;
  b=R5AFOLh0qMvL1fAF3Eheq0htHMPOkE3mdaObDgbI5GKHznVKfUnZldzj
   duId6PO3ORh41z/d8PB3OWCfzhpTZLICUj97aH8kCFjTI81eZNGV1YIJ7
   jqzTrNlXPHAe80TVG85L2NCxl+COoIF4OiEorm/F/fldmltktD4yHTsJT
   BrJapSRUUm8+U3a3Ozjf3/uvCmRxniCYQHp1dV6H31x4J5zDTTOdRGqKv
   um6tbytzRQpG9QGJlesl8wcWXMNzbhfeAauI5/p1w2HDgCBhZzDkt851w
   eq6dt0qxGK+YfzZSEUhiuoZXGMHGAgPYk5SV+NNXwjNZQVeA73Nj6CrTs
   A==;
X-CSE-ConnectionGUID: D6i7PTWmS2Kzpzreu7rOWA==
X-CSE-MsgGUID: o/zqT2eSSCiLInTP8uJcUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96270117"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="96270117"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 05:39:13 -0700
X-CSE-ConnectionGUID: 0sYvquUNRleP+whao6LD5g==
X-CSE-MsgGUID: FHrpsGMqQa21fqZd4Q8rNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="258132129"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.106])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 05:39:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 85AC512080C;
	Wed, 15 Jul 2026 15:39:10 +0300 (EEST)
Date: Wed, 15 Jul 2026 15:39:10 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] media: atomisp: Demote all broken kernel-doc comments
Message-ID: <ald_bjVSGvEZKd7k@kekkonen.localdomain>
References: <20260629-atomisp-kerneldoc-simple-v1-0-8ae282b85c5c@chromium.org>
 <20260629-atomisp-kerneldoc-simple-v1-1-8ae282b85c5c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-atomisp-kerneldoc-simple-v1-1-8ae282b85c5c@chromium.org>
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67677-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 632FE75E4CA
X-Rspamd-Action: no action

On Mon, Jun 29, 2026 at 11:48:28AM +0000, Ricardo Ribalda wrote:
> The atomisp code has been very heavily annotated in doxygen format.
> 
> Unfortunately, both doxygen and kernel-doc use the same mark for signify
> the beginning of a comment (/**).
> 
> As a result of this, kernel-doc gets confused when it parses atomisp and
> throws tons of warnings, which made us completely disable atomisp
> kernel-doc checks in Media-CI.
> 
> Demote all the broken comments so we can have 100% coverage.
> 
> Future patches can convert the doxygen annotations to kernel-doc if this
> is deemed useful.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

