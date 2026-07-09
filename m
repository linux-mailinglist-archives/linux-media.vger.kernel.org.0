Return-Path: <linux-media+bounces-67124-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 32oZKJxgT2r4fQIAu9opvQ
	(envelope-from <linux-media+bounces-67124-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 10:49:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5529972E791
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 10:49:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=A51zVoYm;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67124-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67124-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20BC73012BE3
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 08:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97143E9C2D;
	Thu,  9 Jul 2026 08:49:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4123803CC;
	Thu,  9 Jul 2026 08:49:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586950; cv=none; b=dQQJZ3QscJyaIlXs9kc4yOPiKHO+z9JcQVaecjS0KagLnBvr+kOvi8pRoI24mWeEguog3OxdhdoFd70+G8wynbJqYPHvCXHTdOtZ6y2MaVGc3uwGGbEa9ZICEholokkrco7HLqjTju9z5s7YGiVGRvY8InI4VVF7DTy6lsFMpEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586950; c=relaxed/simple;
	bh=kBPhtFu1/KtyPGIGcVkLLnshkb3noND8h1QXuTVNjX4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fqoixi7maDoTiS0XrGjZhNSJoJjt/pNlh1p4OhzBNfrC25UyFhrdU4FXrgb/7zuGZqqgcwLgXl3UESjeR4NUYDizpbNE8AOr4JFDKQkBwzR5AX44ONQpjcyVcM32rctuvnzJrb6RiNlMxQ55B25IU3gvz3z8xKQ1yQBd8D+ujRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A51zVoYm; arc=none smtp.client-ip=192.198.163.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783586948; x=1815122948;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kBPhtFu1/KtyPGIGcVkLLnshkb3noND8h1QXuTVNjX4=;
  b=A51zVoYmC6MeL90JIQ0/E2qaOewdi58P/c0NhmSNB1zFgbv9tHtGwzS1
   gjxal0rT5Ol1352qQ8O4PkktVKRdo80Ep7cnSC4ECJ1mUPwjsBl4jboaP
   /6rXmJL2gUg4snPaOZFZbAoN9JphBANpWyWuIZTU47LqI7MhTr4ScxsAG
   ZzvuJC6MFAlje5trI9c5OwPJZWKCdhF/1jaoNCJr+UXZ247nvZeb/XSij
   dyw3M3t2wmATDCSypXztCfJpvOH0oLLiFTX13yZ5/IvXJmLd+RKp13gRu
   mdCeFvGMTRl3YEY35dj88RiaMp1CHL6/x+j3GXKzpqXafH2jYfRrmRyQ8
   w==;
X-CSE-ConnectionGUID: 3Xc9K42KQ1ePwJ8pjt9ysA==
X-CSE-MsgGUID: co4Fwq5KSeOyde4AJEnAKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94908632"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94908632"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:49:07 -0700
X-CSE-ConnectionGUID: WZheVVdTQNiZWVDfeGKmKg==
X-CSE-MsgGUID: ItZHiQ+ERVa/EcDVDl5cYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253431806"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:49:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 9 Jul 2026 11:49:01 +0300 (EEST)
To: Sakari Ailus <sakari.ailus@linux.intel.com>
cc: Daniel Scally <dan.scally@ideasonboard.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] MAINTAINERS: Merge int3472 driver patches via the
 media tree by default
In-Reply-To: <20260708114740.47134-1-sakari.ailus@linux.intel.com>
Message-ID: <326d3746-0f81-f0b4-0f75-e80234a069b3@linux.intel.com>
References: <20260708114740.47134-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1629362935-1783586941=:1261"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67124-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ilpo.jarvinen@linux.intel.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:dan.scally@ideasonboard.com,m:hansg@kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,vger.kernel.org:from_smtp,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5529972E791

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1629362935-1783586941=:1261
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 8 Jul 2026, Sakari Ailus wrote:

> The int3472 driver (under drivers/platform/x86/intel/int3472) implements
> an effective kernel API (via instantiating regulators, clocks and GPIOs)
> that is primarily used by the drivers under drivers/media. This means tha=
t
> there are often dependencies between patches to the int3472 driver and th=
e
> camera sensor drivers whereas dependencies to other parts of the x86
> platform tree are fairly rare.
>=20
> Assign the int3472 driver tree to the Media tree.
>=20
> Patches that have dependencies elsewhere than in the Media tree will be
> coordinated with the respective maintainers as usual.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2aec6afa8108..d41544a41c07 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13379,6 +13379,7 @@ INTEL SKYLAKE INT3472 ACPI DEVICE DRIVER
>  M:=09Daniel Scally <dan.scally@ideasonboard.com>
>  M:=09Sakari Ailus <sakari.ailus@linux.intel.com>
>  S:=09Maintained
> +T:=09git git://linuxtv.org/media.git
>  F:=09drivers/platform/x86/intel/int3472/
>  F:=09include/linux/platform_data/x86/int3472.h

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1629362935-1783586941=:1261--

