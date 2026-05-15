Return-Path: <linux-media+bounces-61772-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPYFGFdjB2o71QIAu9opvQ
	(envelope-from <linux-media+bounces-61772-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 20:17:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 98753556096
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 20:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E97F300443B
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 18:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB474EA380;
	Fri, 15 May 2026 18:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fn90FaEd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C733F9A00;
	Fri, 15 May 2026 18:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778869046; cv=none; b=CRVdqXST/aeS18hLjVXuU4A8IrbGbAg1BCDJ3MzYvulSPVG9lC/SekSsrF2/RFsuDdVnGlq9e8G0GmF1aB9c6AQcAu6Pt4/eHDvmzdgkap5vpZIduLI9j2JbJtsKL98RR6hRjUvBc4m+oz37I5gzPFeA6vDfk3fCJGiLehrC/2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778869046; c=relaxed/simple;
	bh=3LXl/REku9TApzZj5gcOHCk7X3e8t2rP72+dKRfkf5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7YOE8++ynt2BONknv9Wpdacgg8jvprL4lgdo4xsMAADY/8nC22aLYDxbhgX1bzS1DjPk7KcQJJkY/+iS9NJG5CXNHbH+wtaWbbRpKGrDwIIeIQw2g33XU8PaMMxFOqIvDRwcbwnawLzuvv7Du8LWYgWga958iqOY7gIpEVkatE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fn90FaEd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778869045; x=1810405045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3LXl/REku9TApzZj5gcOHCk7X3e8t2rP72+dKRfkf5g=;
  b=fn90FaEdjwVd3egYdhROhp/J61h8YAJ+VM9HGdid3kOW9Rn/zk5ptI9W
   KOO+2ZT4ZCwQTfunTKnY5DCZ4ZiWSEEBf9o2zhekL1A2goXJKPctznhoD
   XfqphaHs7/HzK3+n/YLu7r9dAMZI+QiSuWgElRp0745FuUJD7PSqA+doC
   JIaWHWM1DQqem/TP4JM62sRRdvyMGCSYLMp4TlduLmZQKfBQVkVVTEL7r
   5+BYJ4InxT8yzKo87weLxk8wDzfbfgIg2Gvc7/I/ZHiENo9nb2Hk2F4hE
   +2x4UUhDyVz7oD1LbX7fEiOenp2W4iK2c/HeX/7TTxK1feysqNzw4h2wK
   w==;
X-CSE-ConnectionGUID: ohnSN9ftQD+Y+8Wmu6L+3g==
X-CSE-MsgGUID: 9TMVfrMrQnCSzq5M/+91zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90524502"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="90524502"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 11:17:24 -0700
X-CSE-ConnectionGUID: TSQGIgeZQm+C00OHHgBb1g==
X-CSE-MsgGUID: 4pjvYKiJQIWFkoIg/NoY2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="237765552"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.89])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 11:17:22 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 66B2D120CFA;
	Fri, 15 May 2026 21:17:21 +0300 (EEST)
Date: Fri, 15 May 2026 21:17:21 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	dan.scally@ideasonboard.com, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH 1/2] platform/x86: int3472: Match MSI laptop board name
Message-ID: <agdjMY2kJNsp9stV@kekkonen.localdomain>
References: <20260319155031.1989179-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319155031.1989179-1-antti.laakso@linux.intel.com>
X-Rspamd-Queue-Id: 98753556096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61772-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Action: no action

Hi folks,

On Thu, Mar 19, 2026 at 05:50:30PM +0200, Antti Laakso wrote:
> Ensure MSI system is correct by checking board name too.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>

Thanks!

I've merged these via the media tree, with the 16-inch model board name
fixed as reported by a user.

-- 
Kind regards,

Sakari Ailus

