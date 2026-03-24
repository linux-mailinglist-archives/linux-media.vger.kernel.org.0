Return-Path: <linux-media+bounces-56881-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFpQJUiSwmkXfAQAu9opvQ
	(envelope-from <linux-media+bounces-56881-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 14:31:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBD530976A
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 14:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB4CA30850E3
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A84D3F99FE;
	Tue, 24 Mar 2026 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asQTbdUX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBC53D47C6;
	Tue, 24 Mar 2026 13:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358803; cv=none; b=eklWXh/+3p3VEVBUED/9nV/eESOq41yWo1RVCi6jbKKyV9OqrH4K3RqlwHxd9F0eBOHSLX2QqXyuOr/h5Np4LS/te823/Yd8fmgT2ZhsVu8GpIE0oJ3plK8+ZGJDYjvKdwheoAcuwJNboSX7KuXEAlX349Nl44icrea+TygmmEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358803; c=relaxed/simple;
	bh=fMq3umxxGnxo52mw4FTUH72El5YwMDLLFh+pTjKypA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzgFtrodFsvr5JFz7MUeUtQ2IdBH9hQzXMROLvu1cOQsGxA+3lbAPY/C071fMHPVguT5JU9ibWFkTEwPG0nVGK/b9Kcn1+tyrBqY9lco5efAZJr8i/7e5YSQS4/rYicrIOrPagksfUApikGYCflR2t985flKU1AF6z1rR+Pe6Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asQTbdUX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774358802; x=1805894802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fMq3umxxGnxo52mw4FTUH72El5YwMDLLFh+pTjKypA8=;
  b=asQTbdUXJienY23umc6XyaJS7Tz6SJi4S40MCvK0s93dHfPCIGU5Breo
   D0/sXsrWO1wwBUX7eHsJ0roTOiqS0aLkDYSqzs6Tm1E3pmEZjIc9Dbw35
   idonE9j/5uyN9h5BDym2wOMA7iLmHyNGgrVp7OksmMIsLQMTUkof3bBtZ
   hSgrGZCWxwk7YK+iRZwG1AevqIvlv+FPoie2IxUKrbP/FDleXqegKz3F7
   9FQ8uxhuwcCRLqe1OGRvGvKpUlEGqGhyoun/TpigLMblz/k+FZ6AMGXth
   TeHlkrFbqz21IpSlfAMKy6Ex/ULOZaTIdsAfasirmZ700iH9sZl46PveU
   g==;
X-CSE-ConnectionGUID: Qry4H/wRTNaxllbUvu4qsg==
X-CSE-MsgGUID: PUaC5EmOSEKZYQeJ+Pk1eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79230413"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="79230413"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:26:41 -0700
X-CSE-ConnectionGUID: 5EXPghFTR8enw31qyS86Rw==
X-CSE-MsgGUID: aHYJkkXnSpuzBcmU6qSTsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247427635"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:26:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 58A0211FB50;
	Tue, 24 Mar 2026 15:26:42 +0200 (EET)
Date: Tue, 24 Mar 2026 15:26:42 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v12] media: Add t4ka3 camera sensor driver
Message-ID: <acKREpGPr1J_1Oaj@kekkonen.localdomain>
References: <20260323071647.38086-1-hpa@redhat.com>
 <0532e7b1-b3c5-4bb3-80e4-76db00c385ea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0532e7b1-b3c5-4bb3-80e4-76db00c385ea@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56881-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 2EBD530976A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,

On Tue, Mar 24, 2026 at 02:17:38PM +0100, Hans Verkuil wrote:
> I'm missing an entry for the MAINTAINERS file.

Thanks for noticing. I already picked this and it's in a PR... there are a
few other (minor) remaining matters, too, which I asked Kate to address on
a follow-up patch. Would it be ok to address these at the same time, after
the driver is merged?

-- 
Sakari Ailus

