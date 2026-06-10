Return-Path: <linux-media+bounces-64397-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FMkfIDY0KWpVSQMAu9opvQ
	(envelope-from <linux-media+bounces-64397-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:53:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B40668088
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:53:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=ZgX8pPdr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64397-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64397-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADF8B30905CD
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F343E95A0;
	Wed, 10 Jun 2026 09:47:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3593E833F
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 09:47:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084854; cv=none; b=b7jaZx/ee+bpFU877cTHP48wEh137qr+iSXr6G5yrN/2Xwj/w4cd4TACmTQf5YWwgj7phcAjWySXWID+kxykxd3AoJS6sLFzSqHMkBvM3sUlq55vMs1O7lxLTkDGzlxHXIyKhDRWDSG/qe3ZRYqn6zD0xmfwER8C+l0k3FHxS/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084854; c=relaxed/simple;
	bh=B0oJV+/9gt4gdzEqSQPYTRrI0Yj3hgbIn6llYbN57aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktHe0kX83ZoRdG9x3xngmWYaLyui9hiqqRQQthquOE2UV/7KCmfzvWAl8M6m6gVplYtkebTWq0E8OKvhR43fKd0zZN2Zq4k+twWSRBL3jIIUHbCXdCjRFZ3I697iFkkGd/c03RGxkYWK+Up+YrtksV5WpvlzH9Pgu9uts+19q1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZgX8pPdr; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781084852; x=1812620852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B0oJV+/9gt4gdzEqSQPYTRrI0Yj3hgbIn6llYbN57aI=;
  b=ZgX8pPdrq9d/RJulMeiUrKAPOz9gCd8sLHZPLuHq/zkDytUThLsyBysJ
   oxmVXXrwjDzTUuOoiEIw+Qc7JYHwqbmeih0tkLHImT/ne018JTxcaChy/
   0ucPbr4z4j5LK0hsgSUqGQZdrMXTdxpoobh9B2+MOIyXIuBHNt5r6+M3c
   D4nacsVi9PgLzz1+JlSI08LDw8HsFvJcrZFTookgDf6EEd1AJEtDBr9IH
   l1ywih0iZnsIILyMZYkjqC2PudA74EpC+DlJAMrnWdFrr1zyCQOxpSgIi
   6m6doddjZmCAbBkjlnuXTdWvUVVWl2bL/8napBkJmg4px2g7Wcn06JFwf
   w==;
X-CSE-ConnectionGUID: xqPYMhRCQzSiZQCyS9nyoQ==
X-CSE-MsgGUID: Fuz4TxriTACuG387dWeKAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81876321"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81876321"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 02:47:31 -0700
X-CSE-ConnectionGUID: fWP5hianQgOgOgXvCXiNGg==
X-CSE-MsgGUID: SllalFVTSnm4ahZmLP3yVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="251207284"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.253])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 02:47:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5D00211F94F;
	Wed, 10 Jun 2026 12:47:22 +0300 (EEST)
Date: Wed, 10 Jun 2026 12:47:22 +0300
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
Message-ID: <aikyqqC_BsYI5D2M@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-7-sakari.ailus@linux.intel.com>
 <aiZnQgyEBkZH7er0@zed>
 <178091466607.16054.13972332068848565738@freya>
 <178091757893.16054.4583389270412251379@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178091757893.16054.4583389270412251379@freya>
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
	TAGGED_FROM(0.00)[bounces-64397-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5B40668088

Hi Jai,

On Mon, Jun 08, 2026 at 04:49:38PM +0530, Jai Luthra wrote:
> Quoting Jai Luthra (2026-06-08 16:01:06)
> > Hi Jacopo, Sakari,
> > ++ Dave, Hans and Laurent,
> > 
> > Quoting Jacopo Mondi (2026-06-08 12:28:46)
> > > Hi Sakari
> > > 
> > > On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> > > > When vertical analogue binning is in use, the minimum frame length in
> > > > lines decreases to around half of the normal. In relation to the sensor's
> > > > output size this means vertical blanking can be negative but that's not an
> > > > issue as control values are signed. Remove the workaround for this
> > > 
> > > Didn't we just discussed two weeks ago in media summit how negative
> > > blankings are a bad idea, and of all drivers one could decide to play
> > > with imx219 is probably the worse due it's large use base and the fact
> > > libcamera doesn't support negative blankings ?
> > > 
> > > Have I missed something ?
> > > 
> > 
> > I think it would be helpful if I write down clearly how this sensor
> > operates (to the best of my knowledge) so we can decide on the correct
> > fix:
> > 
> > --------------------
> > 
> > IMX219 sensor has an active resolution of 3280x2464.
> > 
> > The driver currently programs the sensor VT pixel clock as fixed for a
> > given lane configuration.
> > 
> > In 2-lane mode it reads 182.4 MPixel/second:
> > 
> >     #define IMX219_PIXEL_RATE           182400000
> > 
> > And the framerate is given by:
> > 
> >     PIXEL_RATE / (FRAME_LENGTH * LINE_LENGTH)
> > 
> > where FRAME_LENGTH and LINE_LENGTH are registers that include the active
> > height and width along with blankings.
> > 
> > There are restrictions on the minimum of the LINE_LENGTH register and
> > minimum vertical blanking (32), which cap the framerate for the full resolution
> > mode.
> > 
> >     MIN_LINE_LENGTH: 0xd78 => 3448 pixels
> >     MIN_FRAME_LENGTH: ACTIVE_HEIGHT + MIN_VBLANK (32) = 2464 + 32
> >                            => 2496 lines
> > 
> > The maximum frame rate is
> > 
> >     182400000/(2496*3448) => ~ 21.2 frames/second
> > 
> > --------------------
> > 
> > A user might want to stream a lower resolution with the full field-of-view,
> > let's take 1640x1232 (which is exactly 1/2 of active area) as an example.
> > 
> > The sensor hardware can achieve this using two different binning modes:
> > 
> >     2x2-binning (regval: 0x1)
> >     2x2-analog-(special)-binning (regval: 0x3)
> > 
> > The sensor pipeline looks like:
> > 
> > active pixel array ->
> >     analogue crop (none) ->
> >         2x2 binning and ADC readout ->
> >                 output to CSI-2 bus
> > 
> > The mode names suggest that binning can happen either before or after ADC,
> > but the datasheet is not very clear about the process. We can infer
> > some details though. See below..
> > 
> > --------------------
> > 
> > With the "normal" 2x2-binning mode the sensor allows programming
> > FRAME_LENGTH to a lower value. The driver still uses the min blanking of 32
> > lines, but the height is now 1232, half of the 2464 before.
> > 
> >     MIN_LINE_LENGTH: 0xd78 => 3448 pixels
> >     MIN_FRAME_LENGTH: READOUT_HEIGHT + MIN_VBLANK = 1232 + 32
> >                            => 1264 lines
> > 
> > The maximum frame rate is
> > 
> >     182400000/(1264*3448) => ~ 41.8 frames/second
> > 
> > --------------------
> > 
> > With the "special" 2x2-binning mode, the datasheet notes that FRAME_LENGTH
> > register should be in units of 2 Lines instead of 1 Line. This means
> > cutting it down by half once more:
> > 
> >     MIN_FRAME_LENGTH: (READOUT_HEIGHT + MIN_VBLANK)/2 = (1232 + 32)/2
> >                            => 632 lines
> > 
> > While there is a slightly higher minimum enforced for the line length:
> > 
> >     MIN_LINE_LENGTH: 0xde8 => 3560 pixels
> > 
> > The maximum frame rate is
> > 
> >     182400000/(632*3560) => ~ 81.0 frames/second
> > 
> > ===================
> > 
> > Through the minimum allowed values of the FRAME_LENGTH and LINE_LENGTH
> > registers and maximum possible framerate, I think it is safe to say that:
> > 
> >     2x2-binning => Readout half the pixels (do vertical averaging in the
> >                                             analogue domain, before ADC
> >                                             reads out the voltages)
> > 
> >     2x2-special-binning => Readout a quarter of the pixels (???)
> > 
> > FRAME_LENGTH being 1/4th of normal would seem to suggest that it is a 4x1
> > binning (combining 4 lines instead of blocks of 2x2).. which does not make
> > sense to me.
> > 
> > My best guess is that in 2x2-special-binning mode the sensor does *both
> > horizontal and vertical* averaging in the analogue domain, before the ADC
> > reads out the voltages.
> > 
> > A higher minimum LINE_LENGTH value for this mode is the best "hard"
> > evidence I have for this guess unfortunately, as the datasheet is quite
> > lacking on this topic.
> > 
> 
> Found another evidence for this, see "Table 16 Mode Example" in the
> datasheet.
> 
> It mentions "H Binning = Analog" for x2 binning mode (with ~4x the FPS)
> And "H Binning = Digital" for x4 binning mode
> 
> It doesn't mention a ~2x FPS mode, which I assume is the normal 2x2-binning
> mode, where I again assume that horizontal binning is done digitally.

Most likely 4x vertical binning uses a combination of analogue and digital
binning. The type of the binning in general doesn't matter much, apart from
affecting the minimum line length in pixels and frame length in lines
values.

> 
> 
> > ====================
> > 
> > The APIs before Sakari's series expose HBLANK and VBLANK controls instead
> > of the actual FRAME_LENGTH/LINE_LENGTH registers to the userspace.
> > 
> > The minimum value of FRAME_LENGTH is 632 when we are streaming 1640x1232,
> > so the sensor registers would suggest that we have a *negative vertical
> > blanking*. Which as Jacopo and Laurent both point out, does not make any
> > conceptual sense whatsoever.
> > 
> > What the driver does today to avoid these negative values is to double the
> > PIXEL_RATE control value to 364800000 when using 2x2-special-binning mode
> > (and thus userspace has no idea the FRAME_LENGTH/VBLANK is in units of
> >  2xLines)
> > 
> > As Sakari pointed out, that does not make any sense either. The sensor PLL
> > values are completely unchanged, so the pixel readout must still be
> > happening at the same rate. Moreover, the new raw sensor model will expose
> > FRAME_LENGTH and LINE_LENGTH directly to userspace, and this hack of
> > doubling the PIXEL_RATE breaks those calculations.
> > 
> > ===================
> > 
> > If we want to support the new raw sensor model (that mandates the new
> > FRAME_LENGTH and LINE_LENGTH controls) for this sensor we have to
> > fix the PIXEL_RATE for sure. I see two options going forward:
> > 
> > OPTION 1 (as proposed by Sakari):
> > 
> >     Fix PIXEL_RATE to 182400000 and allow **negative values** for HBLANK
> >     and VBLANK controls when using 2x2-special-binning mode.
> > 
> >     This will break any userspace tools, many libcamera pipelines included,
> >     that never expected those control values to be negative (even though
> >     the API has always permitted those)

That's a clear bug, but it only becomes apparent when the sign bit is set.

> > 
> > OPTION 2 (something that struck me today morning discussing with Jacopo):
> >     
> >     Fix PIXEL_RATE to 182400000 but **adjust the HBLANK values** to go
> >     lower to compensate, which will diverge from the sensor registers which
> >     keep MIN_LINE_LENGTH fixed across both binning modes.
> > 
> >     This will make the driver quite more complicated, but userspace
> >     expectations of non-negative blankings will be met. And it's likely
> >     that the sensor is internally doing pre-ADC averaging horizontally as
> >     well, or so my best guess is.
> > 
> 
> Which makes me lean more on OPTION 2 now.
> 
> In our case above with 2x2-special-binning mode for 1640x1232, the register
> values are:
> 
>     LINE_LENGTH = 3560 pixels
>     FRAME_LENGTH = 632 lines
> 
> 
> So OPTION 1 would give us:
> 
>     HBLANK = 1920, VBLANK = -600
> 
> When actually the datasheet's "H Binning = Analog" would suggest to me that
> reality looks more like:
> 
>     LINE_LENGTH = 1780 pixels
>     FRAME_LENGTH = 1264 lines
> 
> So OPTION 2 would give us:
> 
>     HBLANK = 140, VBLANK = 32

This approach has the downsides that 1) it doesn't reflect what the sensor
apparently does and 2) you lose one bit of granularity on line length in
pixels.

The advantage still is that it works around the sign bit issue. The new
controls still have their proper values but conversion between the two
becomes rather complicated. See
<URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=metadata&id=366cb25c7d944ef2935668a07471e4576e7088ed>
for instance how it looks like without that.

> 
> > Of course, there are other options to just leave this highly used sensor
> > alone, or support embedded data and internal pads without mandating the new
> > FRAME_LENGTH and LINE_LENGTH controls. But I personally would leave that as
> > a last resort.

I agree. Especially because of its wide user base, it'd be really nice to
convert the imx219 to the Common Raw Sensor Model.

-- 
Regards,

Sakari Ailus

