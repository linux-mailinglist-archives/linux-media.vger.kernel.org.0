Return-Path: <linux-media+bounces-59289-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAXXEJl76GlvKwIAu9opvQ
	(envelope-from <linux-media+bounces-59289-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:41:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0454430C8
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9277E303133F
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 07:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34215372B4B;
	Wed, 22 Apr 2026 07:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aAqD3sKH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7C02C3251;
	Wed, 22 Apr 2026 07:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776843285; cv=none; b=vDJAazp/3CJJWXHHufzs3xY/h+dnVSFaEgh05ASpuMj4or6fBQk/js9zOIJcPgZ1FTaEe7EwWsCB1q05a6xvkigjinJB26Ou/9KOMOyuJpjDenMZPj7H2CibUC53X85e7yX4CmdNYtFT2q58lJEdz3h8dqj5y4tM1qgFm2LV8lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776843285; c=relaxed/simple;
	bh=05WxGtzMdmiwqE6XcONX+oUDFFRR6Sb8327INIxDCS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OY7iOY3EBa0aPxGKES7iAcTyCaBxkiSBjvFFuI4oo1GNl8xIhrK6FEfSRKal/CW3rH3XWI1IRN1s4gMOOkni0IENOAfk8qGUkDf3Fmv/GXsW0PvkGaVwH9j4y+DBwXYOft3iwv4IQ/WCRrhHcbsli9+hcJhzQ6Aki0S73hdcTBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aAqD3sKH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776843284; x=1808379284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=05WxGtzMdmiwqE6XcONX+oUDFFRR6Sb8327INIxDCS0=;
  b=aAqD3sKHSA1qjQUClm1VaX4wmRf4oWEHWH1KVzLZKVQrZcS0b4USLmGY
   od8scjJTXMxRuFkylAENV+/GdqIGZP36InsQDSILpK/oqsynwjase0kMj
   kXB2syfjWWZ9NlxEw+QVSsWjOPAaeXigTm0kruUVddaQ63pCNdpYFoyyG
   yphdcEyXFcfVF5oWL/nWu/yq5tEQpsY+ySoiJ2CfVdTgx9KDS9jb2j/7i
   x0ztlv3kRtVToKwljTGAMcCPHGLTMD5Z1tX3cbmnVx2VWhZw90I2OQZU/
   sp4YsnAL516YXYGyELVxjJ7BU+zDhnnySGtfr1p1zAMeQPRoXxPhfpuJ+
   w==;
X-CSE-ConnectionGUID: IepQu+RuT0G4XhtTc2n1Ew==
X-CSE-MsgGUID: rdXxCXaRQp2A3QQdJzigpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="81655807"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="81655807"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 00:34:44 -0700
X-CSE-ConnectionGUID: znrJKIjGSLSQm1SROwah8w==
X-CSE-MsgGUID: 5eOc6QXPQkilE0Ihai1hfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="231389757"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 00:34:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 742891201FC;
	Wed, 22 Apr 2026 10:34:39 +0300 (EEST)
Date: Wed, 22 Apr 2026 10:34:39 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
Message-ID: <aeh6DwKm0_8L5GJu@kekkonen.localdomain>
References: <20260419093412.40796-1-clamor95@gmail.com>
 <20260419093412.40796-2-clamor95@gmail.com>
 <20260420-affection-ferocious-e28cd29f360a@spud>
 <aeZWgcARBqMQatrr@kekkonen.localdomain>
 <CAPVz0n10Us=zU38v4ieqWXkQ2pXRKi=6M4i3k1Q5bJ4g2QQjgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n10Us=zU38v4ieqWXkQ2pXRKi=6M4i3k1Q5bJ4g2QQjgA@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59289-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 9C0454430C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Svyatoslav,

On Wed, Apr 22, 2026 at 09:36:16AM +0300, Svyatoslav Ryhel wrote:
> пн, 20 квіт. 2026 р. о 19:38 Sakari Ailus <sakari.ailus@linux.intel.com> пише:
> >
> > Hi Conor,
> >
> > On Mon, Apr 20, 2026 at 05:20:28PM +0100, Conor Dooley wrote:
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - ti,lm3559
> > > > +      - ti,lm3560
> > >
> > > What differentiates these devices to the point that fallback compatibles
> > > are not suitable?
> >
> > Good question.
> >
> > It seems the currents are different albeit the register values themselves
> > are the same. The driver doesn't seem to handle that properly right now, so
> > it's a driver bug.
> >
> > I'd keep the compatibles as-is as the current limit applied should be as
> > specified in DT.
> >
> 
> This is a valid point. Unfortunately, I don't have device with lm3559
> to adjust driver accordingly and test.
> 
> So, Conor, Sakari, what changes if any I should apply here in v3?

I'd mention the different current limit in bindings. The driver would be
nice to fix but 10 % too low current isn't a grave problem.

-- 
Regards,

Sakari Ailus

