Return-Path: <linux-media+bounces-66601-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1KK9Mh9cSWq/0gAAu9opvQ
	(envelope-from <linux-media+bounces-66601-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 21:16:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4D37083AB
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 21:16:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=cz2a7ig3;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66601-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66601-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F29730099AF
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 19:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B865376490;
	Sat,  4 Jul 2026 19:16:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE952750E6;
	Sat,  4 Jul 2026 19:16:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783192599; cv=none; b=UH9zzQQagnvNhmoXR0wKxV4lW0rdk50SXNeZ3PgMWcO+KWw3Ka6hy7IZB1uX4aGDi5Tn72V78XLTeWJzONdkjnsIFDsyqi8VMFyNo5OOaD6rueaFOTOmpuePza9sJTB214zoz1xEwmxxf+ThocIt8DrDFn0IgvnsyElZcVDF15w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783192599; c=relaxed/simple;
	bh=q8I1b/ESMjjJgXoEisyy//ZVVILPMKwxuT6+E+794WU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIqo9Szfpy5FcDzDLoHA/lFJ9KHpPclHsnmrHXlfWlNx4dAAm8d7zAAd+vWQc30wkmz6T/5FSHn1ZVCe4SjXu3//WLXytBTNCFbUWjUopDLVug5d6Ur2zjCfMLSuZf/PE7ot4DBtCBpIfU2dXMhivsiluFDRouwBGUSuJwzPdGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cz2a7ig3; arc=none smtp.client-ip=198.175.65.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783192597; x=1814728597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q8I1b/ESMjjJgXoEisyy//ZVVILPMKwxuT6+E+794WU=;
  b=cz2a7ig3ZjnJUwIsRZaKGHOvQxTkshayZMYo4870wppunfT/Y7T86Y/j
   2wKBjPDD9x5VaZycqDtQIFoBrMGnbntkym36ZgMylaNbB+gr2/kTTWfT+
   XA/PsO9PoY8h3bmhBMXh6eHadANIEfjfb2mi8kt6NBuJPSEWnV/wWEXW9
   BaoMOLrD0yZDCy1UFO/V8z/T66alE1xPPMbrBcmVjk7zkem/8IQw7/sjK
   fa8E3Ri5RaKWL9oU63D3akeUUh4TVvj8OilkU4UsSOIQNnvCoxjBGWNim
   4SESK1JLDPAiNWP2VWBzKQzqm6aZs2ccdjqdzxj0HWDh48GJIE0igH0un
   g==;
X-CSE-ConnectionGUID: sBCkZbzhRNe2eDCAWoTY2w==
X-CSE-MsgGUID: tHtakjJHSPq5co9PqmSv6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="87570897"
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="87570897"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 12:16:37 -0700
X-CSE-ConnectionGUID: YVfTG/+gQfiUa3s88E1N1w==
X-CSE-MsgGUID: E1u3m22ZQj6b/WqoB9xXJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="277681934"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.246])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 12:16:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 91A69120DF0;
	Sat, 04 Jul 2026 22:16:32 +0300 (EEST)
Date: Sat, 4 Jul 2026 22:16:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Kate Hsuan <hpa@redhat.com>,
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
Message-ID: <aklcEKiFDfZwCFP-@kekkonen.localdomain>
References: <20260629074026.35490-1-hpa@redhat.com>
 <20260629074026.35490-4-hpa@redhat.com>
 <PN3P287MB18292C819793395D643D426A8BF72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <49257d09-a2fd-4a9d-9479-4d2b5e0fb8a6@kernel.org>
 <PN3P287MB182945B5747452110940BEA08BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <c7634571-4682-41d5-aa9d-8b965d641d51@kernel.org>
 <akT2CSCbaR0a3BMA@kekkonen.localdomain>
 <PN3P287MB18296E80E1786B05F5ACF37E8BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <d59e796b-fe53-4103-a94b-5ffba53246b9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d59e796b-fe53-4103-a94b-5ffba53246b9@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66601-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:tarang.raval@siliconsignals.io,m:hpa@redhat.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:kieran.bingham@ideasonboard.com,m:anis@talbi.fr,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dan.scally@ideasonboard.com,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,redhat.com,kernel.org,intel.com,gmail.com,ideasonboard.com,talbi.fr,vger.kernel.org,linux.intel.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:from_mime,intel.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A4D37083AB

Hi Hans, Tarang,

On Thu, Jul 02, 2026 at 08:05:25PM +0200, Hans de Goede wrote:
> > I went through the INT3472 driver and would like to propose a generic     
> > approach that satisfies both sides without per-HID quirks or sensor driver
> > changes.                                                                  
> >                                                                           
> > The problem is:                                                      
> >  - INT3472 standardizes on "avdd" internally                             
> >  - Sony IMX sensor drivers use "vana" per datasheet, and all existing    
> >    Sony DT bindings (imx219, imx290, imx415) already use vana-supply     
> >  - Changing imx471 to "avdd" now will create inconsistency with those    
> >    bindings, or require a rename later
> 
> Ack, as mentioned in my reply to Sakari from 1 minute ago I'm ok
> with sticking with vana for the imx* case,

At least some Sony sensors use "INT" PnP vendor prefix and so telling them
apart from the rest doesn't work at least this way. There could also be
other prefixes as well, they're not all "SONY". Right now there is one with
INT prefix and three with SONY prefix.

If we start having lots of devices with the same quirk, we could also
introduce a pointer to an array of IDs to avoid repeating the same quirk
over and over.

Kate's patch adds two quirks so this could be already considered (and only
one of these IDs is using SONY prefix).

-- 
Regards,

Sakari Ailus

