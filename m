Return-Path: <linux-media+bounces-61456-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPVRKe2HBGoJLQIAu9opvQ
	(envelope-from <linux-media+bounces-61456-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:17:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C7D534D9D
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6481B30F1298
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918633093CF;
	Wed, 13 May 2026 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhijEQ/H"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D498D304BA3;
	Wed, 13 May 2026 14:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680850; cv=none; b=n4OpD33phEWJk22OvzQJQX1taw4+xlBWpAMdLrJEiCGEW5RuytFxiDjAcnGb4EupVb5HXlwt9Kgog6P9bzdTS5xcIqXSBOuitJAHKTb8gYdeRYFUZYAVgJwYdVr0ihTE6zgBuU+HlSYuwurv6l4VJRKqQ/nR0mPrQnbDJsP+GO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680850; c=relaxed/simple;
	bh=Bw1C9JL2piKJzvwC5VL//CVGEW1j0mlc7RMZSghq6tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GAgq8DSrOlhDLPnRtu+fRJopmD7jFHaAZ/RFhAQDTDmtryx8TN3F3HIrArvcGcML1Xunla8+prYbcfCGqwtzcFjHZgahesJmIV+zpqAlOIYnifWutjy7Avkdd9KMRKTDsZdA+bvk0eIY9yrWRjksW3tQrcLNskzUjdGQOjK569E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhijEQ/H; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778680849; x=1810216849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bw1C9JL2piKJzvwC5VL//CVGEW1j0mlc7RMZSghq6tM=;
  b=bhijEQ/HhHWUs+SMyXu60xsJkqSC2NR1QNgFxHse5qOi+Ns/kG/I8RR0
   MrebFenvQ1OENxkF5dCWFbHYFqGJjYbcHvZOz0KV8uGWdX/URJ9scsPk7
   glO3TsxSLa84QADLK+2D3lPZE0sgXEp/2bYJDGntK4DfRNChHsICjYYzo
   RNWmGN3zGGH44FSDTQVHWb8m1eQAT3keEggiLz083wF+ujtCW2bkHG4je
   u6FDO2diHIhE3EwNAqjcYERYgZ9WsJxeRgMO//IhoGphSN4LdNltZgPbW
   VgbRvga2xvLOZIIXUTv8yDVPOFFXZZJrSs08zHBy3nX0u25uNtgGceBop
   Q==;
X-CSE-ConnectionGUID: 1NafUBJ9RRa/GkO54AKYEQ==
X-CSE-MsgGUID: 0hbMtql1S8mMtgQpQie5ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79786086"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79786086"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:00:49 -0700
X-CSE-ConnectionGUID: 0GOQXddWRsmNK6MjzDE6vA==
X-CSE-MsgGUID: mqz3WQyNQiGCqUCReIfDsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="239902049"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:00:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 012BF121C9E;
	Wed, 13 May 2026 17:00:43 +0300 (EEST)
Date: Wed, 13 May 2026 17:00:42 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 3/5] media: hi846: fix modes handling for different
 lane cases
Message-ID: <agSECpQ2xiP80E24@kekkonen.localdomain>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
 <20260511103927.279550-4-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511103927.279550-4-mitltlatltl@gmail.com>
X-Rspamd-Queue-Id: 49C7D534D9D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-61456-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,posteo.de,puri.sm,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Action: no action

Hi Pengyu,

On Mon, May 11, 2026 at 06:39:25PM +0800, Pengyu Luo wrote:
> When using 4-lane, v4l2_find_nearest_size may return an unsupported
> mode, 640x480 mode, and it is set to the default mode.

Could you use v4l2_find_nearest_size_conditional()?

Ideally we should get rid of the cur_mode field altogether.

-- 
Regards,

Sakari Ailus

