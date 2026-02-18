Return-Path: <linux-media+bounces-53029-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJG1CNt1lWlCRwIAu9opvQ
	(envelope-from <linux-media+bounces-53029-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 09:18:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A25153F10
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 09:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E1433019BBC
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 08:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B97A30CDA4;
	Wed, 18 Feb 2026 08:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPRojI1j"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1842F6930
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 08:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771402709; cv=none; b=o+JH5CE1Pw6l4HqBd18c5zHlyMLgmwnPpALia000hUUSoW04AsmMVlR1Fb1mw24QsWxoAr4HrdFJ+iRVZFhM8mlyBV4uY3LXV6rZ1vRJNs8jHpHzUIVrxlkKWUQZHbD1UyAfaRUsu29RowZngfMFbQz7gsNEbT2XZsM/UnS7Fqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771402709; c=relaxed/simple;
	bh=tVOWB7tEmyu5WaXITu+dXffB6nvim8nL8ZfWHDuZvTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTR5WcYuVFiw4xEGbiyOj7uEsqx6vXl18lqkIcYChGMkvKOS+VvsbR7LaXJjMD7U87w64Uj2fnaoG3Ddjo+ywdz3xX+pq0uIlFJfY0zh5FtZIRyKDkaQkEinMumlME/eqziKkG+MIq0wkW1Ayg3OCw0C+XJUgwm9aDA/idlWYUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPRojI1j; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771402707; x=1802938707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tVOWB7tEmyu5WaXITu+dXffB6nvim8nL8ZfWHDuZvTY=;
  b=dPRojI1jIdf6ozYtDNhbyiOv91BAaG2dRuupDUA3BvLziY9v2GjGZBJ2
   SuEiTsAkDL6OFUwydWW+rfmD8D7D3DChVaXTJLg9MDdp8s1MgllZDsZ84
   +Y8iCNAJ0+RQLesZBVjX2uCVdSX2q7hKj9Bv8+PHD/dq7mcGt1wnJSHqO
   C02QWr5ZTGym4wpUnHxKz78MyLJHG9ir8jUNje62afBJ2uok6peQa5tm6
   mY/mCOR1POKNfMi7U8z3hMiOjlPrZk6DddensySpvMKMmRL6yHqnm9puy
   LS9ViKHlcBzwVninzLUIyfWiXIIGzWDMYWvTTIDHXJ/Q+TVvuWr6/MFBz
   g==;
X-CSE-ConnectionGUID: fVfkObpWSzeNrdLwXZ6gTQ==
X-CSE-MsgGUID: xJgHMAwgSymOiltdEsuTnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72542296"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72542296"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 00:18:25 -0800
X-CSE-ConnectionGUID: SVcJeMe9QvyLl/oJ/Y27MQ==
X-CSE-MsgGUID: I+xDGYoyTHmVm7uPTcEhgg==
X-ExtLoop1: 1
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.5])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 00:18:24 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 04ED7120B7D;
	Wed, 18 Feb 2026 10:18:47 +0200 (EET)
Date: Wed, 18 Feb 2026 10:18:46 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH 1/2] Add compiler options to avoid warnings
Message-ID: <aZV15mb9uCOmsn7P@kekkonen.localdomain>
References: <20260217214435.2431864-1-sakari.ailus@linux.intel.com>
 <20260217214435.2431864-2-sakari.ailus@linux.intel.com>
 <20260217235933.GD18192@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217235933.GD18192@killaraus.ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-53029-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 46A25153F10
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 12:59:33AM +0100, Laurent Pinchart wrote:
> On Tue, Feb 17, 2026 at 11:44:34PM +0200, Sakari Ailus wrote:
> > Add -Wno-missing-field-initializers and -Wno-implicit-fallthrough options
> 
> How about fixing the implicit fallthrough occurrences ? :-)

Well, at this time of day it seems a more plausible approach. :-) But it
introduces a compiler dependency which I guess is fine nowadays though.

-- 
Sakari Ailus

