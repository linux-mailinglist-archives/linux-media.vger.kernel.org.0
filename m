Return-Path: <linux-media+bounces-64556-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YfhvJ6x4KmqYqAMAu9opvQ
	(envelope-from <linux-media+bounces-64556-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 10:58:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D60267017B
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 10:58:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=LX4zq7Zy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64556-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64556-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AFF7B3007892
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E71326ACC;
	Thu, 11 Jun 2026 08:58:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4C63BA229
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 08:58:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168298; cv=none; b=lfZqrKofWF+U1N7KyPgzLmkmzgkKZOuGbz0RahVUt1qv/3GPcq+/KYTTv+YMjLrdMJ6Ps8fxFDFWWWm0y7c/vSKQM97+D5+s6FORbCpljEftIdKTEco7jOTEKlKt7Fc3Y57Pr+6tN6BhP4auOk/oO56fOjVG+dEI+4Fa2Z0fEHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168298; c=relaxed/simple;
	bh=EbOSkPmwF1nkCqtszdQZqe5t30SNPc8S28YNYpi/qVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkuLRS7Zkw/SOmjsZlAkYpJvdhh3E1ryggA637Zb0TaL0gOO1ym2TlBHKBnOxSAWDp2fbGZe+BBMBjTgGwkOTkVYoI7TuIhsAcUA+bVFVtCpOCTQLH9AFw3BQDTfBRYBuFb0cafnziz2xH+OwL4CPnkTVrR8Qhodq6LbOKbTvDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LX4zq7Zy; arc=none smtp.client-ip=192.198.163.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781168297; x=1812704297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EbOSkPmwF1nkCqtszdQZqe5t30SNPc8S28YNYpi/qVw=;
  b=LX4zq7ZydtGp228MuOXSiNVM3lvRYv6L+lStlWPh1UGs6sDokg5S0D4W
   /CGCuplOPnioZv5B7wHuyCkDaNYS9eOgPkyo8eqwbBoRmQvcvzItChC6M
   sRNeiJ0eI/SdwLw9VJVXNfB8zwGLERByPGKg9zsTwpeFy+7WdhYfvdVQn
   b0v+TZw8ftZRIM3lR5IAyb2kHzui5K1+GSLigaKqLQ8ldt0wATDXiDIeC
   D34QclI5BnhbuSZbmuhVeIYJWQkFWsb5nq+JcTm8ldwod4wsNx1tarb1l
   Ee0ooCsv4Di0BP9y/6jqmYbKp0+TE6TL8uTjgVNSSRFKqA4ZhovW2yyuo
   w==;
X-CSE-ConnectionGUID: kAorSTZ8Txu6Fm8KauLjyg==
X-CSE-MsgGUID: FCHG6cK2TACjAdT3ty0mWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="80992174"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="80992174"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:58:16 -0700
X-CSE-ConnectionGUID: T70CWimvRYmQmlGfbyndFw==
X-CSE-MsgGUID: CRLehBa2Q+ONQLdBErQB/w==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:58:10 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C7E5911FB16;
	Thu, 11 Jun 2026 11:58:06 +0300 (EEST)
Date: Thu, 11 Jun 2026 11:58:06 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
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
Message-ID: <aip4nt7ZGlc3GeGf@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-7-sakari.ailus@linux.intel.com>
 <aiZnQgyEBkZH7er0@zed>
 <178091466607.16054.13972332068848565738@freya>
 <178091757893.16054.4583389270412251379@freya>
 <aikyqqC_BsYI5D2M@kekkonen.localdomain>
 <178108737654.1799417.12257128301401647481@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178108737654.1799417.12257128301401647481@freya>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64556-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:hans@jjverkuil.nl,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[raspberrypi.com,jjverkuil.nl,ideasonboard.com,vger.kernel.org,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:from_mime,vger.kernel.org:from_smtp,kekkonen.localdomain:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D60267017B

Hi Jai,

On Wed, Jun 10, 2026 at 03:59:36PM +0530, Jai Luthra wrote:
> > > > OPTION 1 (as proposed by Sakari):
> > > > 
> > > >     Fix PIXEL_RATE to 182400000 and allow **negative values** for HBLANK
> > > >     and VBLANK controls when using 2x2-special-binning mode.
> > > > 
> > > >     This will break any userspace tools, many libcamera pipelines included,
> > > >     that never expected those control values to be negative (even though
> > > >     the API has always permitted those)
> > 
> > That's a clear bug, but it only becomes apparent when the sign bit is set.
> > 
> 
> Agreed, I'll try to send patches for that in libcamera regardless of what
> we do here.

Thanks, this is much appreciated!

> 
> > > > 
> > > > OPTION 2 (something that struck me today morning discussing with Jacopo):
> > > >     
> > > >     Fix PIXEL_RATE to 182400000 but **adjust the HBLANK values** to go
> > > >     lower to compensate, which will diverge from the sensor registers which
> > > >     keep MIN_LINE_LENGTH fixed across both binning modes.
> > > > 
> > > >     This will make the driver quite more complicated, but userspace
> > > >     expectations of non-negative blankings will be met. And it's likely
> > > >     that the sensor is internally doing pre-ADC averaging horizontally as
> > > >     well, or so my best guess is.
> > > > 
> > > 
> > > Which makes me lean more on OPTION 2 now.
> > > 
> > > In our case above with 2x2-special-binning mode for 1640x1232, the register
> > > values are:
> > > 
> > >     LINE_LENGTH = 3560 pixels
> > >     FRAME_LENGTH = 632 lines
> > > 
> > > 
> > > So OPTION 1 would give us:
> > > 
> > >     HBLANK = 1920, VBLANK = -600
> > > 
> > > When actually the datasheet's "H Binning = Analog" would suggest to me that
> > > reality looks more like:
> > > 
> > >     LINE_LENGTH = 1780 pixels
> > >     FRAME_LENGTH = 1264 lines
> > > 
> > > So OPTION 2 would give us:
> > > 
> > >     HBLANK = 140, VBLANK = 32
> > 
> > This approach has the downsides that 1) it doesn't reflect what the sensor
> > apparently does and 2) you lose one bit of granularity on line length in
> > pixels.
> > 
> 
> I agree with you on 2)
> 
> On 1) though I don't think the sensor's register values are a good
> indicator of what the sensor apparently does.

Let's say the sensor still behaves as if it is using these values in the
control of its internal timing. And as that's the case, I think we can say
these are in fact used for internal sensor timing -- there's no suggestion
of anything else.

If 4x analogue binning was used for the "special binning" mode, then why
would the sensor vendor have written it's special, instead of just saying
it's "4x analogue binning"?

I tested the effect of setting the horizontal blanking and it seems the
step value appears to be 8, not 1 which is suggested by the driver and not
mentioned in the specification.

So even if you multiply FLL and divide LLP by 2 for the special binning
mode, no information is lost and the sensor configurability remains
unaffected. I still wouldn't do this as it's going to be a perpetual glitch
in a driver meant to be exemplary. An integer type change in libcamera
would be a passing issue, albeit it would inflict some intermediate pain.

In either case I'd fix the HBLANK step before changing the rest.

> 
> For example, FLL being programmed to ~ 1/4th of analogue crop height, while
> LLP being fixed to ~ analogue crop width would suggest the sensor is
> averaging 4 R/Gr/Gb/B pixels vertically in the analogue domain (possibly
> through common FD charge summing) before the ADC reads it out.
> 
> But the table in the datasheet clearly mentions horizontal binning is
> (also) done in the analogue domain. Which makes more sense as well, given
> the output has an average of a 2x2 block of pixels and not a 4x1 block of
> pixels.
> 
> > The advantage still is that it works around the sign bit issue. The new
> > controls still have their proper values but conversion between the two
> > becomes rather complicated. See
> > <URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=metadata&id=366cb25c7d944ef2935668a07471e4576e7088ed>
> > for instance how it looks like without that.
> > 
> 
> I see.. well IMHO even the LLP and FLL controls should try to model what
> the sensor does (if it is known, at least) rather than being just a 1-to-1
> mapping of the sensor registers. Which as Dave and I have mentioned, is not
> the case in many sensors that scale the HMAX register units according to
> some lower frequency clock (so 1 clock cycle => multiple pixels)
> 
> In this particular case it would mean the new controls should scale like:
> 
> FRAME_LENGTH = FLL_REG / 2
> LINE_LENGTH = LLP_REG * 2
> 
> When analogue binning is used. Which should make your code slightly easier,
> even if not re-usable across all sensors.

-- 
Regards,

Sakari Ailus

