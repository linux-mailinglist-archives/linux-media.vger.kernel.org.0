Return-Path: <linux-media+bounces-56018-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBTqNa0guWkrrwEAu9opvQ
	(envelope-from <linux-media+bounces-56018-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:36:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D59E12A6EB6
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C293E3043623
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698AF371CFE;
	Tue, 17 Mar 2026 09:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fO3DLMDX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102E8371CE9;
	Tue, 17 Mar 2026 09:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740007; cv=none; b=maxJQhQS8N8IDMc7LWlXebzuHf5knXxO/tLbMoWpiP+3lA7AHT5jS8IRxck4skn63Uf4BHuScjQrQeaKO2EmpmUgTnSCDo6DK7t3eFJO48kZM+IUp0Q5i2F28TJ4UJacaNMh+6zmY41nC87MDrjbKQEXNLsEJQP87FNKjs4ch9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740007; c=relaxed/simple;
	bh=o7cd+HVeX1tC031s7B2HYg/pTMstxYJyYrz/evoPXBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=envYjA6gS78YAUz+xqcA12tnxZT0haW+5Y1rfZA5uyEracSPYLsCpbridtxfFSEFGNXOrQMKLPRcKB83i6RE5gl1IXkdYa5k2DTlO27CDG/DqJMiOjBXIIzrAffe3QAwB9XRMeD8z4Vi7I639kuQ4ETyKUHc7v0ZLwpenOe1Qms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fO3DLMDX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773740007; x=1805276007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=o7cd+HVeX1tC031s7B2HYg/pTMstxYJyYrz/evoPXBw=;
  b=fO3DLMDXLjHoOxzoRPl6b4jVDkQA5g8ZeAX7o6UYOlVG5PzvmjYuIiQQ
   FWS1aoHdpuvhG6eUfddrCDE62QRMzxm4Zb3MHm9L3ha2EA6qYjHajdGxj
   6Iwp5ki2ylhYxoZQ+xDsFySrqh3PZpgz7uhYxrnSv/9+QGtyYwIhHpUz/
   ymd7O8i0xOrnbup0//iJOwHz1cSfGPxX657jSNMN40GCEnyjRk5A7vE5X
   QiZ84/qPuVem/wHNPyzGGuN5JBQ6RJNjE4JJTcfPbzoXjja/EOlPIL1D2
   IJV5v8COcxNoKhCyyS5b2Zqf2lyuW04NuYy1Zy1Fql45K/s+g26oExFh6
   Q==;
X-CSE-ConnectionGUID: vhRPY0kLTEOsH6hj2ed3WA==
X-CSE-MsgGUID: iA8F9e6PTdibwT5fG25LsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="92151109"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="92151109"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:33:26 -0700
X-CSE-ConnectionGUID: bj4DElf/T/ij6gtnlgq7Tg==
X-CSE-MsgGUID: PmosvjiVRVuW/J83Vecj7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222267358"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:33:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E2C3411F870;
	Tue, 17 Mar 2026 11:33:04 +0200 (EET)
Date: Tue, 17 Mar 2026 11:33:04 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kalyani patra <kalyanipatra2003@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Simona Toaca <simona.toaca@nxp.com>, d-gole@ti.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: atomisp: fix brace style and trailing
 whitespace in isp_param.c
Message-ID: <abkf0KPSKnKZep5V@kekkonen.localdomain>
References: <20260311151302.105992-1-kalyanipatra2003@gmail.com>
 <a26ba4c7-05d9-4df0-b4ec-1a82d2df075e@nxp.com>
 <CACjYBviU6v_QbpPy0zhfpaBYMoQrO-pBNywzXZb9cHgerCCGBw@mail.gmail.com>
 <abkRdID5NGk2mkOF@kekkonen.localdomain>
 <CACjYBvir9vnXqH4HVXKqMs-pmqTWjs3wA92WH9_KUpwSr3KD8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACjYBvir9vnXqH4HVXKqMs-pmqTWjs3wA92WH9_KUpwSr3KD8Q@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56018-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: D59E12A6EB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kalyani,

On Tue, Mar 17, 2026 at 02:12:20PM +0530, Kalyani patra wrote:
> Hi Sakari,
> Noted. I’ll keep both of that in kind going forward.
> Thanks!

I first applied the patch to a different branch and it seems the issue the
patch addressed was already fixed by another patch in the atomisp branch.

Thanks.

-- 
Kind regards,

Sakari Ailus

