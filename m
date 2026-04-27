Return-Path: <linux-media+bounces-59636-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFzUJLQD72lz3QAAu9opvQ
	(envelope-from <linux-media+bounces-59636-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 08:35:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF8746D9A6
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 08:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A95C73005595
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 06:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25466374E4E;
	Mon, 27 Apr 2026 06:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSsyHOTM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B530737104E;
	Mon, 27 Apr 2026 06:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271727; cv=none; b=nghQx6tKewAZQ9U4vUB8O0XMeu4yi0Dl4IldpPcBWw3wT4q3UznTnt3xs+HvlWDngxRjdExNF+aqqgPhF280vnu3gfLLbcXBgC+Sv0MlSOXyQCKIdqY8HlEQYGeEuACTAP092bSL4oNTNmsOFUpZc29gyB/2VyAnDbhLYTHbtJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271727; c=relaxed/simple;
	bh=0pyENmb/HQwmaYVpGR5rXZtsc4oxwHYbzRginezGzZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFwjOhfnLPy8NBNe3OcSmOuDYud+qijUvaO5Xc56vmBvBQenu6YQ5sQ7vjOZHaaiLL+lKVEfEEBdIIPNpREPqe24XS9gXMP1WL2U17Ko8e+T/8OHbF6F4geBMHLh0m9ePSSW7eN4PVk4BMpiAgeWSh7RBd1lL8+IC4wRs5izX0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSsyHOTM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777271726; x=1808807726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0pyENmb/HQwmaYVpGR5rXZtsc4oxwHYbzRginezGzZA=;
  b=BSsyHOTMRy/Aq1lFXxEYvf0bjNzbcu4oyOvIklN0CPAoS87U97OOwSsG
   9gueUz2n8bODydAac6VgChaVYTaFzBgBJpq0mW9lut4rOVXNhptm70Mzh
   mPOdPQu+JSMvm1Ngq6nr7lR7d+ygsLmCxAb7N1/KlDRJl6nqpH8dqOJoV
   KIQbRbYSiPa4USZbY0sFudDHcIfdNznrHOgkrxPgRZ6E2iAFtI0NgQdON
   rk52+f6imuhr6cKrKjHRMZSXcdwO9PDgcXPIphntRMx7vA3D5WLh7ZmAf
   IWAiqaNfJk8qmUR09S0rWH2Uox5ZashGaajfscKbzkdMqAAaRPxQI1F8O
   w==;
X-CSE-ConnectionGUID: EwKrm6SARTmvLhvniX9qbQ==
X-CSE-MsgGUID: eH5qV53CRdSeV8tYOWOLtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77176415"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="77176415"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 23:35:25 -0700
X-CSE-ConnectionGUID: SVQM0icQSv60/me0RqDkIg==
X-CSE-MsgGUID: D3j6rEvBSbWyWkT10b2UoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="271676692"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 23:35:23 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9760611FA44;
	Mon, 27 Apr 2026 09:35:26 +0300 (EEST)
Date: Mon, 27 Apr 2026 09:35:26 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 0/5] media: lm3560: convert to use OF bindings
Message-ID: <ae8Drq6IUy_M-jVq@kekkonen.localdomain>
References: <20260424072230.90354-1-clamor95@gmail.com>
 <CAPVz0n3osf5=013w7=EhJKNeYmrRNg_JT2s9a9_tKWL_teQm-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPVz0n3osf5=013w7=EhJKNeYmrRNg_JT2s9a9_tKWL_teQm-A@mail.gmail.com>
X-Rspamd-Queue-Id: 2EF8746D9A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59636-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kekkonen.localdomain:mid]

On Fri, Apr 24, 2026 at 07:14:06PM +0300, Svyatoslav Ryhel wrote:
> Hello Sakari! May you please not yet pick this patchset if you had
> such intention. It has a few slight flaws I would like to address in
> v4 next week. Thank you.

Ack, thanks for the info!

-- 
Sakari Ailus

