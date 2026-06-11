Return-Path: <linux-media+bounces-64553-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BQkiO81wKmqDpQMAu9opvQ
	(envelope-from <linux-media+bounces-64553-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 10:24:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E0A66FD30
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 10:24:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Pmq7m7fF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64553-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64553-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7D183130F92
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32E437883E;
	Thu, 11 Jun 2026 08:24:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675273101C8;
	Thu, 11 Jun 2026 08:24:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166253; cv=none; b=AZsf56fRmoAOjPpG+hiKW1DStoohn0TUtl267Wt1mZHVeBlAY2S3cRMX3bIBHWaStRDTtbrB+zFi8k8TTRKvcraEv8GatuVvdrgn43EYGxMis2GsMw9Fy4Pagxpmo81kwbHSeAXGfxbqHh7lALSKNziJm/+5WdlKrVxAuSnGitc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166253; c=relaxed/simple;
	bh=/uL/Z6viEf7LoWHzyzrIuO4VnhS21AaHozLE6cqacAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzO9KWv0jw5S7dV+IbGBoFnWNV5vI+/HQHi69cWpF8/yhlaSA5sxwDpDcnWlcQeZ3DyZVZkg7ivxs7r0SdUA9UlTJFDhFrI4QnvQ7yb2+mP2IZzf2AAVG3yTdw6doESaCrPVtdu9hAt2diBJTOIGodS/tSLUKC5qYFz1V963sQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pmq7m7fF; arc=none smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781166251; x=1812702251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/uL/Z6viEf7LoWHzyzrIuO4VnhS21AaHozLE6cqacAg=;
  b=Pmq7m7fFDjWoO+KTBbpWnKr3JvAT6Y0VJBNENvPdU8pz6Kq2oyFiT9B1
   POITQRXKt+ndzuYpXbFCA+rKmcKeG02CUDBOIO/R0YiKgfA4pKgDiCmTB
   LaT7BHDj1xO8bbsx2viQcY0GdbIHMKFeNINEPxlzja4MGviIwkeWRLfoX
   VitFwUXTrUnS7vvkM7lyg8X5CP8DVvHs3SM1/X6VaKeU4CGCGV2QbUfHz
   6RF5Jc99GFe55wTg6Bm5EsYB+L86HbO5GNj2apzdRuf1DjUOfLVlMNB+q
   tlt7RviSQoNpmlYOFcov4aK2NCrphTgqQubLTG5aZl5Wseq3vBXQNkxzp
   g==;
X-CSE-ConnectionGUID: nEluAgIuQD6wqZB7XS5jjQ==
X-CSE-MsgGUID: FiXVqAXzS9GJjYMxDRa6qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81953270"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81953270"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:24:11 -0700
X-CSE-ConnectionGUID: zic59zJ2S6WzBVmIKYB6kA==
X-CSE-MsgGUID: H52OM4+PTU+HlDvKsfJPHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="240074013"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:24:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 27CC7121C36;
	Thu, 11 Jun 2026 11:24:05 +0300 (EEST)
Date: Thu, 11 Jun 2026 11:24:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: Mark Pearson <mpearson@squebb.ca>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Damjan Georgievski <gdamjan@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: ipu-bridge: Add DMI information of Lenovo
 X9 to the image upside-down list
Message-ID: <aipwpTo5JCiAACVp@kekkonen.localdomain>
References: <20260609124926.1038981-1-hpa@redhat.com>
 <20260609124926.1038981-2-hpa@redhat.com>
 <aineK26VD67Fmibd@kekkonen.localdomain>
 <CAEth8oEv3iAQ1P9=rYddeBRX2qrjZiysUA_JfFp8pUAoJXbGLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEth8oEv3iAQ1P9=rYddeBRX2qrjZiysUA_JfFp8pUAoJXbGLQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64553-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hpa@redhat.com,m:mpearson@squebb.ca,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:tarang.raval@siliconsignals.io,m:gdamjan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[squebb.ca,kernel.org,oss.qualcomm.com,intel.com,siliconsignals.io,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:email,vger.kernel.org:from_smtp,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46E0A66FD30

Hi Kate,

On Thu, Jun 11, 2026 at 03:25:46PM +0800, Kate Hsuan wrote:
> Hi Sakari and Mark,
> 
> On Thu, Jun 11, 2026 at 5:59 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Kate,
> >
> > I know several people have given you different advices but...
> >
> > On Tue, Jun 09, 2026 at 08:49:24PM +0800, Kate Hsuan wrote:
> > > The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor so the image
> > > was displayed upside-down. Add the DMI information of Lenovo X9 to
> > > resolve the issue.
> > >
> > > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > > ---
> > >  drivers/media/pci/intel/ipu-bridge.c | 32 ++++++++++++++++++++++++++++
> > >  1 file changed, 32 insertions(+)
> > >
> > > diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> > > index fc6608e33de4..9e24aaceecdf 100644
> > > --- a/drivers/media/pci/intel/ipu-bridge.c
> > > +++ b/drivers/media/pci/intel/ipu-bridge.c
> > > @@ -134,6 +134,38 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
> > >               },
> > >               .driver_data = "OVTI02C1",
> > >       },
> > > +     {
> > > +             /* Lenovo X9-14 */
> > > +             .matches = {
> > > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > +                     DMI_MATCH(DMI_BOARD_NAME, "21QA"),
> > > +             },
> > > +             .driver_data = "SONY471A",
> > > +     },
> > > +     {
> > > +             /* Lenovo X9-14 */
> >
> > How are the two X9-14's different? It'd be good to have some comment here
> > which model this actually is: the board name is only available (typically
> > at least) in DMI.
> 
> According to the datasheet of X9-14 and 15. Lenovo offers 2 screen
> sizes (14-inch and 15-inch) and 2 CPU types (Core Ultra 5 and 7).

Is the CPU SKU the difference here? If so, can you add that to the comment?

> They may ship customised firmware for a specific purpose with a random
> DMI_PRODUCT_VERSION.
> So, using the DMI_BOARD_NAME prefix to identify the laptop SKU is
> safer and easier.
> 
> I think DMI_MATCH(DMI_BOARD_NAME, "21Q") covers all X9 but I don't
> know the side effect :(
> They may propose a new model with a different MIPI camera or HID.

Indeed. Is the BOARD_NAME guaranteed to be unique by Lenovo? I think I'd
use DMI_EXACT_MATCH(), too.

> 
> >
> > > +             .matches = {
> > > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > +                     DMI_MATCH(DMI_BOARD_NAME, "21QB"),
> > > +             },
> > > +             .driver_data = "SONY471A",
> > > +     },
> > > +     {
> > > +             /* Lenovo X9-15 */
> > > +             .matches = {
> > > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > +                     DMI_MATCH(DMI_BOARD_NAME, "21Q6"),
> > > +             },
> > > +             .driver_data = "SONY471A",
> > > +     },
> > > +     {
> > > +             /* Lenovo X9-15 */
> > > +             .matches = {
> > > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > +                     DMI_MATCH(DMI_BOARD_NAME, "21Q7"),
> > > +             },
> > > +             .driver_data = "SONY471A",
> > > +     },
> > >       {} /* Terminating entry */
> > >  };
> > >
> >

-- 
Kind regards,

Sakari Ailus

