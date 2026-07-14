Return-Path: <linux-media+bounces-67551-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p7+0EpsCVmqGxwAAu9opvQ
	(envelope-from <linux-media+bounces-67551-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 11:34:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B055E752E48
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 11:34:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=HkztDQ+f;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67551-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67551-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0DE5306FF3E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 09:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B9E3F4101;
	Tue, 14 Jul 2026 09:32:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26B5353A73;
	Tue, 14 Jul 2026 09:32:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021565; cv=none; b=CWncStQvzK5hl9c3ciLiWslehPcO9WBBECvNNUJMHkYErb2O8qsaBm2nahSY1EoxQyxNmaDqOiL8QvYHrGEhllq7bqPMViigWSUsMTp6X/UwTD2Q1vUTZm5ZlyjtNWsbnWRyN0vMvToFehpv6AZ11QBEyOPu+THtPZO7d5A7y0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021565; c=relaxed/simple;
	bh=5WXemK2NJP/9zt8GtYbI3hR+2oNQVbvI18m/qFSkq7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEwZTrvrxGIAhrSPulFv4fogoKSXSj1aBBEojBdp8/UUsyUQnZt/cDDOFM1uoPg5LIjR7RpVdcJRRUlNQzXpFkrzF1Ux8eNpzzfV1TfIcKOIgcXNXRBWTe+iPmnjS7/fHbgQ1Zgukw3stZ2IbUceKYdlUKkN5FDer/5j72uoyOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkztDQ+f; arc=none smtp.client-ip=198.175.65.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784021564; x=1815557564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5WXemK2NJP/9zt8GtYbI3hR+2oNQVbvI18m/qFSkq7Y=;
  b=HkztDQ+flFOOI+PMo+x9uYTaOWP4MAB84J2jgatGctQcjsAgGwaaz4hz
   koy41+h3XYlKzgMy5UvXNBImf3LhvJFWGB6+/HHWe5gv1Hv5hReHpb692
   PzFyGnoZxZ8GlTabou59sGtL0y4r3Lgze4P2Fob8g5LkKYkwULkFPnAB6
   4uj7ep6ZPKuYD2fzXMT46vtXBelEoiUDa60FUF3O9KDU+gQqMTTSLSsv5
   3b5isOa/hNn+5NbONrKO7lggBK85lNmbVBWGSRZpa/baOb306wfgBa4mC
   fB8tPXX9YGRrj/K8dKOgu21XDsIPYN/TUsG+xwy+Yk3ItVCszZm3qqzLo
   Q==;
X-CSE-ConnectionGUID: 3X7fqPmAQsGbnzTd95foCg==
X-CSE-MsgGUID: yFvrBKM4TmqnglGY5L4pgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84495257"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84495257"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 02:32:43 -0700
X-CSE-ConnectionGUID: c+2KGqAbToqgzjlPCa+7zQ==
X-CSE-MsgGUID: QlNQhZHNSqSzA+zSY0luDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="257776382"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.245])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 02:32:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 899C511F8AD;
	Tue, 14 Jul 2026 12:32:40 +0300 (EEST)
Date: Tue, 14 Jul 2026 12:32:40 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ov5693: add OVTI5693 ACPI HID for IPU6 Surface
 devices
Message-ID: <alYCOJR2PZoMJYTS@kekkonen.localdomain>
References: <20260708213633.18392-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708213633.18392-1-fernandorimoli11@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:fernandorimoli11@gmail.com,m:dan.scally@ideasonboard.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67551-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:dkim,linux.intel.com:from_mime,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B055E752E48

Hi Fernando,

On Wed, Jul 08, 2026 at 11:36:33PM +0200, Fernando Rimoli wrote:
> The ov5693 driver only matches the "INT33BE" ACPI HID. Some Intel IPU6
> Surface devices (e.g. Microsoft Surface Pro 9) enumerate the same OV5693
> front camera with the ACPI HID "OVTI5693" instead. Without this HID the
> i2c core never binds the driver, and the IPU bridge never builds the
> firmware node graph for the sensor, so the front camera is unusable.

Could you split this into two, once for each?

> 
> Add "OVTI5693" to the sensor driver's ACPI match table and to the IPU
> bridge's supported-sensor list. The link frequency (419200000) matches
> the existing INT33BE entry, as it is the same sensor. Devices that use
> "INT33BE" (e.g. Surface Go 4) are unaffected.
> 
> Tested on Surface Pro 9 (IPU6): the sensor enumerates as OVTI5693:00
> (ACPI path \_SB_.PC00.I2C3.CAMF) and binds with this change.
> 
> Link: https://github.com/linux-surface/linux-surface/pull/2171
> Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
> ---
> Note: this HID addition makes the sensor bind and enumerate, but a fully
> working front camera on IPU6 also requires programming MIPI_CTRL00
> (0x4800 = 0x2d) before stream-on, otherwise the IPU6 CSI-2 receiver never
> locks and capture times out. That register change is being handled
> separately (see the Link: above). This patch is independent and useful on
> its own for enumeration, so I'm sending it standalone; happy to reorder if
> you'd prefer it after the register fix.

Have you tested other values for 0x4800? Besides IPU3 (CIO2), the sensor is
used on a Rockchip board, so changing the settings needs to be done with
care.

If you haven't, I'd be interested to know how 0x04 works -- it should be a
safe change (LP00 -> LP11 in idle). If not, then testing other individual
bits would be useful as well; hopefully changing one bit makes a
difference.

-- 
Kind regards,

Sakari Ailus

