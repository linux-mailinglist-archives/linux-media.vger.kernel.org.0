Return-Path: <linux-media+bounces-65172-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fpq8ArDLM2qxGQYAu9opvQ
	(envelope-from <linux-media+bounces-65172-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:42:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1BF69F74A
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:42:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=ZkKtOza6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65172-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65172-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D2D93073920
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 10:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C613EDAB3;
	Thu, 18 Jun 2026 10:40:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912D93783BB
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:40:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779226; cv=none; b=ceW/Tv+icBBaxhcH+nnMIhE7che5n+kgRcSVAMOiuNT0VriOuCwmzIatOxTcd4+76NQT9XQb3tuIpu2utqVIDhYTjnd4exMwsvMxPUZfax6W+C+c4R3PgN1iX+bRLHOxO0kE+xz4WR8alZivEKikCRZRJabCXVJGX1fz1PnQxhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779226; c=relaxed/simple;
	bh=OwcKWPU6mEZsgYgs6LunH9zaHVHp5M2NIvO8gs69LII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2xczOb7RnVpMzxRjpJlzp8YIDdC4nu+D76yJyUvaV8jivogS2VtJao3j+nOdALC6gm/AiLT3MH9B2Owgj5MGtFpsFrOmYVbMkMLpFKs+cfxp4aHBzl0kkJBy/5wuxE5mEx7gKnUduRhvt5+JeKMyRXZWJekMDV1Nk4deCp7MJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkKtOza6; arc=none smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781779225; x=1813315225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OwcKWPU6mEZsgYgs6LunH9zaHVHp5M2NIvO8gs69LII=;
  b=ZkKtOza6ihUyR74sUx+o2gWIgAAe1nuz0Bh3fovykcecMvGeWNbYPMqz
   DDnDpYAL6/A8O0pYglHm8c7b8LN7wIt6guZ8UfqAfGQx3Sdq/v1mqJt3o
   UcHvY4JW5aAk5eXE9nfVV0/yR8YbK2TqBigyM8P8GrqYH4xbYTjtCj3BO
   2BQrCtb3SnwIg7arZraL+2pZcNJnmFCUMzMIkiCw3UmLirSmJovSMjrwZ
   N/n3aAEvZKmQOrxJMPxWsriSnV61hbVYCsbhmGCDydUNoNHYoacw6xhAZ
   CQWvuf3ydOw1qPXfN7uYSDmK4GFC9TnAA9bQsdpzHp1L6FdbI4A5fmyZb
   g==;
X-CSE-ConnectionGUID: p5Tejq+1Q0Koj/zDDLvpUg==
X-CSE-MsgGUID: WEgEdCqMT5yQVxbtXY4Y9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82613035"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="82613035"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 03:40:24 -0700
X-CSE-ConnectionGUID: q1GaPYtPT5WqDQyUEwU2FQ==
X-CSE-MsgGUID: 83JSVugKSoSF5gmg5MOXig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="253441235"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.24])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 03:40:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 57106121C36;
	Thu, 18 Jun 2026 13:40:17 +0300 (EEST)
Date: Thu, 18 Jun 2026 13:40:17 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
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
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 03/10] media: imx219: Account rate_factor in setting
 upper exposure limit
Message-ID: <ajPLEfuiCN9R1ben@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-4-sakari.ailus@linux.intel.com>
 <CAPY8ntDPvDdj6vSVRUsTmC9tXmy8xNATrrbyqDr7DRU1NiiDQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntDPvDdj6vSVRUsTmC9tXmy8xNATrrbyqDr7DRU1NiiDQQ@mail.gmail.com>
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65172-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dave.stevenson@raspberrypi.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email,linux.intel.com:from_mime,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B1BF69F74A

Hi Dave,

On Mon, Jun 08, 2026 at 04:42:44PM +0100, Dave Stevenson wrote:
> Hi Sakari
> 
> On Sun, 7 Jun 2026 at 22:54, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > The rate_factor multiplier is used to multiply a few values in the
> > sensor's timing configuration and the exposure time is one of them. This
> > also needs to be taken into account in exposure time margin: multiply it
> > by rate_factor so that sensor's exposure time margin is respected.
> 
> Testing the 1640x1232 mode with FRM_LENGTH_A set to 0x288 (79.07fps),
> I can write register 0x15a (COARSE_INTEGRATION_TIME_A) with values up
> to and including 0x284 without it affecting the output frame rate, and
> without image corruption.
> With IMX219_EXPOSURE_OFFSET being 4, the current code implements
> exactly those limits, so why do you believe the offset should be
> increased?

I agree with the upper exposure time limit (with FRM_LENGTH_A set to 0x288)
and the margin above but the issue is that the driver only implements
these limits when rate_factor is 1.

The margin is subtracted from the frame length to calculate the upper
exposure limit, but as the frame length in lines an the exposure values are
divided by rate_factor, the margin gets divided, too, resulting the
effective margin of 2.

I tested that setting the exposure value to higher than FRM_LENGTH_A -
margin increases the frame time. This shouldn't be the case i.e. it's a
driver bug.

> 
> To my mind section 5-5 Frame Rate Calculation Formula of the datasheet
> is fairly clear with
> [ In the case of (frame_length_lines - 4 > coarse_integration_time) ]:
> Frame_Length = frame_length_lines
> [ In the case of (frame_length_lines - 4 < coarse_integration_time) ]:
> Frame_Length = coarse_integration_time + 4
> 
> The register FRM_LENGTH_A (0x160) being in units of 2 lines doesn't
> change that calculation.

-- 
Kind regards,

Sakari Ailus

