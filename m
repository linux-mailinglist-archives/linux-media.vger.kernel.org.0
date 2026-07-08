Return-Path: <linux-media+bounces-66964-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TYSOALUVTmouCwIAu9opvQ
	(envelope-from <linux-media+bounces-66964-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 11:17:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8807238FB
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 11:17:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=MUt4o5Jg;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66964-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66964-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F90A3056CA0
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 09:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B134E408615;
	Wed,  8 Jul 2026 09:14:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943F03E3C4F;
	Wed,  8 Jul 2026 09:14:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502083; cv=none; b=ROfdqmOKytG1KWqpUscyap7y03tV9ezGUUyR+VoalvStWAZBB7QB/E9+4pv+dJIrEACyOTDqtDNQApgoaBzsHReVwdmwQorT1XmGp7wL8pSTDYJoSxibJOxQJuMzS2n0pa3L4d8nLiTHAs/5Iy7tHf/O1i26pa2ElkMHPsN3Rg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502083; c=relaxed/simple;
	bh=tSioEv+crzr4yd6ll0uXjMdfwIfFfwRT9qv9KXXLZbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRO6fXgVyJ51NW7Ggd4aTQFQF7whj2QesxKAOr0CwNNND1OR/zzOTS3xPvaLWjlt4QqNj+2jgeMZaO8vYqQtFOTLDo+CzPDo45RNZmSLTY9j2AhTR99+plhHHRWFSVZipElvoUYzFqF4SabrvgK+J6KFJazXw9p8IADt9h7ntsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MUt4o5Jg; arc=none smtp.client-ip=198.175.65.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783502081; x=1815038081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tSioEv+crzr4yd6ll0uXjMdfwIfFfwRT9qv9KXXLZbo=;
  b=MUt4o5JgsLgtjjuBSmcqKHN3wVqS/xZyxQKxaUpT4LPAUHM4y6etH119
   k52lKF8uhIC0d9j4cqK4LD8MIai8snz3Pa0IkqRe5GWa+bb2IUmHPZz7Y
   QUWSUAo9iSoiyGhdmS/g2ufGAr1sG2Mot3r3pYV1OmgK3Z4EsHmDOQX0l
   Vn68YK1golUiu/DBghUhnTtjQlTz+8yYZlfCfsxFacFXu8+Io1wlrCb2F
   liagveaxeRyEP0z6vIC2ma+DlsLT8DkUZyoeJrvIQoupPoWxOwIvzhcN/
   LQjZQQ9uPnEKWxRfgBYVIddN7s0KbmhhIlFJdzJOuusnyrLGIduu7ZIMd
   A==;
X-CSE-ConnectionGUID: zz3ehgUJQiOVP1PA4elkKg==
X-CSE-MsgGUID: WBUicKtcQXmr/LpxlphsZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="106955776"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="106955776"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 02:14:41 -0700
X-CSE-ConnectionGUID: KOOexP27TBqYRI74dH2FSg==
X-CSE-MsgGUID: SYXkXQbiSiO5T8zmSDbWmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="258539165"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.120])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 02:14:37 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7558B11FB4A;
	Wed, 08 Jul 2026 12:14:37 +0300 (EEST)
Date: Wed, 8 Jul 2026 12:14:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>,
	Damjan Georgievski <gdamjan@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	computman <anis@talbi.fr>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
Message-ID: <ak4U_RTLdWxx07zM@kekkonen.localdomain>
References: <PN3P287MB18292C819793395D643D426A8BF72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <49257d09-a2fd-4a9d-9479-4d2b5e0fb8a6@kernel.org>
 <PN3P287MB182945B5747452110940BEA08BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <c7634571-4682-41d5-aa9d-8b965d641d51@kernel.org>
 <akT2CSCbaR0a3BMA@kekkonen.localdomain>
 <PN3P287MB18296E80E1786B05F5ACF37E8BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <d59e796b-fe53-4103-a94b-5ffba53246b9@kernel.org>
 <aklcEKiFDfZwCFP-@kekkonen.localdomain>
 <PN3P287MB1829FE03558376196C9030328BF12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <CAEth8oG_jDMz3Sspayfv18Ue4vO6103fM0J_f_i_NG6tZ7c4XA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEth8oG_jDMz3Sspayfv18Ue4vO6103fM0J_f_i_NG6tZ7c4XA@mail.gmail.com>
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
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66964-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hpa@redhat.com,m:tarang.raval@siliconsignals.io,m:hansg@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:kieran.bingham@ideasonboard.com,m:anis@talbi.fr,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dan.scally@ideasonboard.com,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,intel.com,gmail.com,ideasonboard.com,talbi.fr,vger.kernel.org,linux.intel.com];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,vger.kernel.org:from_smtp,siliconsignals.io:email,linux.intel.com:from_mime,kekkonen.localdomain:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B8807238FB

Hi Kate,

On Mon, Jul 06, 2026 at 09:05:08PM +0800, Kate Hsuan wrote:
> Hi Hans, Sakari and Tarang,
> 
> Thank you for your comments.
> 
> On Mon, Jul 6, 2026 at 3:16 PM Tarang Raval
> <tarang.raval@siliconsignals.io> wrote:
> >
> > Hi Sakari,
> >
> > > On Thu, Jul 02, 2026 at 08:05:25PM +0200, Hans de Goede wrote:
> > > > > I went through the INT3472 driver and would like to propose a generic
> > > > > approach that satisfies both sides without per-HID quirks or sensor driver
> > > > > changes.
> > > > >
> > > > > The problem is:
> > > > >  - INT3472 standardizes on "avdd" internally
> > > > >  - Sony IMX sensor drivers use "vana" per datasheet, and all existing
> > > > >    Sony DT bindings (imx219, imx290, imx415) already use vana-supply
> > > > >  - Changing imx471 to "avdd" now will create inconsistency with those
> > > > >    bindings, or require a rename later
> > > >
> > > > Ack, as mentioned in my reply to Sakari from 1 minute ago I'm ok
> > > > with sticking with vana for the imx* case,
> > >
> > > At least some Sony sensors use "INT" PnP vendor prefix and so telling them
> > > apart from the rest doesn't work at least this way. There could also be
> > > other prefixes as well, they're not all "SONY". Right now there is one with
> > > INT prefix and three with SONY prefix.
> > >
> > > If we start having lots of devices with the same quirk, we could also
> > > introduce a pointer to an array of IDs to avoid repeating the same quirk
> > > over and over.
> > >
> > > Kate's patch adds two quirks so this could be already considered (and only
> > > one of these IDs is using SONY prefix).
> 
> The idea may look like
> 
> const char *sony_hids [] = {

I'd call this "power_enable_hids_vana" as other bindings than Sony are also
using vana regulator, e.g. ST and Toshiba.

> "SONY471A",
> "TBE20A0,
> NULL
> };
> 
>  { /* imx471 expects "vana" as con_id for power enable */
>      .hid = sony_hids,   <--- A ponter to sony_hids
>      .type_from = INT3472_GPIO_TYPE_POWER_ENABLE,
>      .type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
>      .con_id = "vana",
>      .enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
>  },
> 
> and
> and the following functions need to be changed.
> Do I understand it correctly?
> 
> Sakari, do you want to implement this approach or could Tarang and I do that?
> 
> >
> > The HID prefix is not actually a concern for the alias idea, because the
> > alias table triggers on supply_name not on HID. Since INT3472 always
> > assigns "avdd" to any POWER_ENABLE GPIO regardless of HID prefix, the
> > alias would work the same for SONY471A, TBE20A0 or any future INTXXXXX
> > prefix.
> >
> > However there is a different problem with the alias idea: it would register
> > both avdd and vana for every sensor that has a POWER_ENABLE GPIO, not just
> > Sony IMX sensors. So I agree this is not a good approach.
> >
> > The NULL-terminated HID array is the correct approach, the mapping is
> > explicit and only applied to hid we explicitly list.
> >
> > I can send a patch implementing this on top of Kate's patch.
> Sounds good.
> If Sakari agree with that, I can include your patch in my series.

Feel free to write a patch. Looks like this series is fine for merging so
I'll pick it later today.

> 
> Thank you :)

Thank you for the series!

-- 
Kind regards,

Sakari Ailus

