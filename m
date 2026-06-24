Return-Path: <linux-media+bounces-65527-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9QV9B0OrO2pPbAgAu9opvQ
	(envelope-from <linux-media+bounces-65527-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:02:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E28A6BD29E
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:02:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=EwfV3xlC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65527-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65527-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BD843023325
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1873AFCFC;
	Wed, 24 Jun 2026 10:01:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EC122126C;
	Wed, 24 Jun 2026 10:01:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782295305; cv=none; b=OnjAy49p9VlM19S0xD4xwQbvCo7Bvm9F5i0h7klcKC5wfSUyhzyHfLSQw8Qox3ZKnDxgx3+3apftxIiUaswxVMbdVCoVxA3Gk6QiVLbKMwHrlJOXhmD5D3ftzJp3LWXy1C2dM++r5JhCviqbDrl8YtfM3gyCoS7wD4ESf5rIefA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782295305; c=relaxed/simple;
	bh=xEBB5cVIJ3yefCR9cNDyPUmkdLalWNQL/6VMylzbSa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brUdOq5UNLwnYX0tJcWYUB7xNW/xSQJXgJPSD1OnzzMb8yzfg2Fru2pAuTJJRCC2AM+qxT/Y8VVUbl5hMm9vUBQaI3pvQ6DAJ8yzqhXDmCuiZm/0+vEBo+NhROAyeydnyATc16YYUjHef/y0JlgJrJtQMOHJ9dXdT4A01TRYCoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EwfV3xlC; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782295304; x=1813831304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xEBB5cVIJ3yefCR9cNDyPUmkdLalWNQL/6VMylzbSa4=;
  b=EwfV3xlC7unnwfmLsv9rBSj8YGcy4u6jsMoM9KXyHTgLsW0sm8fFkYon
   NP0An51KFQc9WAyzwKUSQENrG3OAS+QnAI2ZARq9Wa3lZtqkI954HhBgJ
   iruduDb0DerxcxHsAx5kmZ/NBd/1HlxbS4kKAw4akd0Y6DMHzFz0gTmTn
   ls1X9T9OALrBsyvDMgpPHTI40B6I3NhuLxmRv7fPN1YqJaC3wvbhRfIQo
   JrrFOtamdVVp1Fp6jFf86gUfhXajJm/lEHn5dA0+f/JesiaF2IkH6pHOF
   QM1rQIDXHV3lL0oOvx3hKz3u5n05by+QSX7MtVLRNN8Us4KSfQcBp91vC
   g==;
X-CSE-ConnectionGUID: kG+KHqHBTSOKvvoU+B8ARQ==
X-CSE-MsgGUID: 7r7IQHe4R3y9BzCc5CO9LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83050682"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="83050682"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 03:01:44 -0700
X-CSE-ConnectionGUID: 3betBBihQ2aCXigQYTTjsA==
X-CSE-MsgGUID: VkCHVaseTDmqe228Myqa8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="279950967"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.168])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 03:01:37 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 00571121C4F;
	Wed, 24 Jun 2026 13:01:34 +0300 (EEST)
Date: Wed, 24 Jun 2026 13:01:34 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Kate Hsuan <hpa@redhat.com>, Serin Yeh <serin.yeh@intel.com>,
	Damjan Georgievski <gdamjan@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Message-ID: <ajuq_pDnirv1NvKg@kekkonen.localdomain>
References: <20260624033508.27391-1-hpa@redhat.com>
 <20260624033508.27391-4-hpa@redhat.com>
 <PN3P287MB1829650C00C45055F7E923468BED2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <CAEth8oFeS_aQ=6rdiJwCN4fuj1H530qFEG5iXMRJWJCL23rtiw@mail.gmail.com>
 <PN3P287MB1829B3B10DBA560A46BC96038BED2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3P287MB1829B3B10DBA560A46BC96038BED2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65527-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tarang.raval@siliconsignals.io,m:hpa@redhat.com,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,intel.com,gmail.com,kernel.org,oss.qualcomm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E28A6BD29E

On Wed, Jun 24, 2026 at 09:58:11AM +0000, Tarang Raval wrote:
> > So, avdd is necessary.
> 
> Could you please try adding a mapping for SONY471A in
> int3472_gpio_map[] in drivers/platform/x86/intel/int3472/discrete.c?
> 
> Not fully sure, I have to check, but hopefully it will work.

That's the intent, yes.

-- 
Sakari Ailus

