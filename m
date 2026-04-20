Return-Path: <linux-media+bounces-59168-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBDgH+hd5ml6vQEAu9opvQ
	(envelope-from <linux-media+bounces-59168-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 19:10:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF07430A5A
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 19:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 760BE30826CB
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CBF359A8E;
	Mon, 20 Apr 2026 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Esq1Aerx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E8A34CFAD;
	Mon, 20 Apr 2026 16:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776703114; cv=none; b=FEYJqgY3j0W2gErj5wW23eQL6l+1cPm/lQEOmqauxlHILsyWQS6X8V50GFlmeuXrB6c0ELL4ynlk6JmvXXqX9u5B6kgWYzcDXa8JI15k/Ytti0x50Eyv6NiPsSjJulG05yX98midl7F5pJ/EGJOhGVqj0YCkd57BjF+SLMa+spU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776703114; c=relaxed/simple;
	bh=sDMKr+I0wPw0EgTY5uXghh8IDBSMUMByoxKE7SP//dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vs4seiePHbVMbbeJXO97cQqrUaFuUarBARvq4owjJaqO6JqmLDuEwjOrR7iK3FsmaTuuxgGIfqjWadIfVDYM/TEBi5dXs6jRTeAZ2SeA8dyIh2SmqPCxTC+uvkRWKiMW58A4ivrdI6hSdeScxJuGKu0F2haA3G7SFG8R5nvJ8j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Esq1Aerx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776703112; x=1808239112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sDMKr+I0wPw0EgTY5uXghh8IDBSMUMByoxKE7SP//dY=;
  b=Esq1AerxfvTboF16ZkmuqXbYSCOZA1NEmUVuJ2oFlxWvy6riopmXYg+v
   uHtGHyZL0VElqF6wV6qg2tPVgC/D6rhYaDsRQn8p7Hp/0NabS4zz2xPcG
   wSkhPX3rrN8GJI44ZYaRnnOTG1Gef9EP7blKP3tKqZBBUCAJPPNBPH1ri
   eDjICnmhG0l635+CDnbQX6/QUKvAUtZhRVA9GgsFBSlQNQxFKa2pjEMBx
   3ihoRSbndJKi2A4tstUXhjdI9u79l2lJCnr2gN+QvHE2ZGCZWpfX6OiVZ
   UiuTnGshU1g+xVmbX/ge5uqoXYplMOujzz4SQkCdYMtEO0VhknimGUcBJ
   A==;
X-CSE-ConnectionGUID: zANUO/S1STK+Knx5RgqxqQ==
X-CSE-MsgGUID: w9xQqME4TpOzdnei/0P/xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77808038"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="77808038"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 09:38:32 -0700
X-CSE-ConnectionGUID: aRk3h2QWQraEGMNwpTYDsA==
X-CSE-MsgGUID: oXRg4GqQRnWoF/NAH+AFhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="230893594"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.218])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 09:38:28 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A13C211FC4C;
	Mon, 20 Apr 2026 19:38:25 +0300 (EEST)
Date: Mon, 20 Apr 2026 19:38:25 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Conor Dooley <conor@kernel.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
Message-ID: <aeZWgcARBqMQatrr@kekkonen.localdomain>
References: <20260419093412.40796-1-clamor95@gmail.com>
 <20260419093412.40796-2-clamor95@gmail.com>
 <20260420-affection-ferocious-e28cd29f360a@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-affection-ferocious-e28cd29f360a@spud>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-59168-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1AF07430A5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Conor,

On Mon, Apr 20, 2026 at 05:20:28PM +0100, Conor Dooley wrote:
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,lm3559
> > +      - ti,lm3560
> 
> What differentiates these devices to the point that fallback compatibles
> are not suitable?

Good question.

It seems the currents are different albeit the register values themselves
are the same. The driver doesn't seem to handle that properly right now, so
it's a driver bug.

I'd keep the compatibles as-is as the current limit applied should be as
specified in DT.

-- 
Kind regards,

Sakari Ailus

