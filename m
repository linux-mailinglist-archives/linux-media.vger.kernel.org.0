Return-Path: <linux-media+bounces-64406-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jwJbJH9AKWohTAMAu9opvQ
	(envelope-from <linux-media+bounces-64406-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:46:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA336686A4
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:46:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=UjRkHHFr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64406-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64406-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66D9230ABEDF
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B2B3F0AA2;
	Wed, 10 Jun 2026 10:30:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400C53F076B
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 10:30:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087429; cv=none; b=jd89GVLSxtzjMbnF0rgn8/XSTu6BBLkWR/W3NIpPoEsStcH5tJ+BkvsuItmfxS7IiHUS4b6dY+YveHsyJ/25FX3tw8taSG0fA5f/9MuDQrI4V8xj4XAH+fl1Yr4Cl07GFJFTky0S0wvWbIThbaP8AiBy3Fk+Gmi49XU1za5ZzrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087429; c=relaxed/simple;
	bh=ko81T1zT05pTNinPNHBNoDJ/iwXyHHAQ4DVB71YTrBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYFQgN1Uxj3RF9A/yi2JniPYBtPYW4B7FnAGrEcpA4ja3a0o9ZCCrHHUiGDLZUUJjg4WEdHXfmf5cgtSjL4VvVSrTyOtX+yfo28ladPCOVhZ98Ikx5bwj1khtdt5G2x/ePOVSNtzZonzI5IaYN3fK2vOZnGOzGyYFFP+ZsRHz+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjRkHHFr; arc=none smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781087427; x=1812623427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ko81T1zT05pTNinPNHBNoDJ/iwXyHHAQ4DVB71YTrBY=;
  b=UjRkHHFr/VGAHFeBvriTHltmCwyk56V2EJzmujKGNNmYKuF6oFmUWbUK
   DCx2GsynKwGnDw1ppLmAp8g1541xgZIGb5zo69E6U/VbNeKjBDgrexGjT
   TLD4RexyjXSmnnai2WORQ0AIeta4UFu0ZwlFdRBuCTKXEiEU5A7jhKxi0
   yrr3EaIECZ3/DtL7BEFnOos7z6aZpZu4i0mBDsMnx7uMeQPGbfraQ0t7h
   WV4cMfCx+ELBgPuhdvo0m8Ql8cJGTu5KSf7pZVOS6KkPCguIV6fT0kDD7
   YZAqu+rcNAkioHNJkqPoPj8TLb9zePPoOaAI6ksAUqNnjmF76DTTWfaXK
   Q==;
X-CSE-ConnectionGUID: GcdJGnO9Q3S1iFI2kYU8NQ==
X-CSE-MsgGUID: kAAFabRmS9WNo4Zv+z2Gqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92442948"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="92442948"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:30:26 -0700
X-CSE-ConnectionGUID: Gx4GbpbWTRW3KCpjXhfZMg==
X-CSE-MsgGUID: cq/tkSVGTwmZ0bhTAxYcSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="241708364"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.253])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:30:20 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4E64511F94F;
	Wed, 10 Jun 2026 13:30:17 +0300 (EEST)
Date: Wed, 10 Jun 2026 13:30:17 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and
 exposure for analogue binning
Message-ID: <aik8uVK0Gn-csptp@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-7-sakari.ailus@linux.intel.com>
 <aiZnQgyEBkZH7er0@zed>
 <178091466607.16054.13972332068848565738@freya>
 <CAPY8ntBshAPkN_7Swz4qpbOjhpu5Gfnd5VkZPrgUgUoNrM0pEg@mail.gmail.com>
 <178102372666.1799417.2096397903236324900@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178102372666.1799417.2096397903236324900@freya>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64406-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:jacopo.mondi@ideasonboard.com,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[raspberrypi.com,ideasonboard.com,jjverkuil.nl,vger.kernel.org,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DA336686A4

Hi Jai,

On Tue, Jun 09, 2026 at 10:18:46PM +0530, Jai Luthra wrote:
> > > OPTION 2 (something that struck me today morning discussing with Jacopo):
> > >
> > >     Fix PIXEL_RATE to 182400000 but **adjust the HBLANK values** to go
> > >     lower to compensate, which will diverge from the sensor registers which
> > >     keep MIN_LINE_LENGTH fixed across both binning modes.
> > >
> > >     This will make the driver quite more complicated, but userspace
> > >     expectations of non-negative blankings will be met. And it's likely
> > >     that the sensor is internally doing pre-ADC averaging horizontally as
> > >     well, or so my best guess is.
> > 
> > It is true that the line length configured is sufficient that it could
> > be halved in order to keep the pixel rate the same. That would seem
> > feasible.
> > 
> 
> It is indeed feasible, and imho most likely what the sensor is internally
> doing (I'd be happy to be proven wrong). I've posted a patch separately
> implementing that.

I can't prove you wrong (nor right) but in general the line length in
pixels and frame length in lines registers on the sensor's register
interface really control the sensor's internal operation. These values
aren't divided or multiplied based on other configurations. In this case,
as the sensor appears to be reading out twice as many lines from its pixel
array as you'd expect suggests that on each step two (2x analogue binned)
lines are being read instead of just one, and thus four lines in the pixel
array get read in the same amount of time that normally would be spent
reading just a single line. How it does that, I don't know. Analogue
operation would need more hardware than there apparently is whereas digital
operation would require storing each even (binned) line of image data in
internal SRAM until the previous odd line has been sent out, while some
extra hardware would probably still be needed besides the SRAM. The latter
is my wild guess.

You could ascertain the independence of horizontal and vertical binning by
configuring the sensor to do just horizontal or vertical binning and then
see how it affects the line length in pixels and frame length in lines
limits experimentally. My guess is that it doesn't. This may also not work
at all, the sensor datasheet isn't very clear about this.

-- 
Kind regards,

Sakari Ailus

