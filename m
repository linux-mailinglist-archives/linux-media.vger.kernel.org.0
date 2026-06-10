Return-Path: <linux-media+bounces-64398-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XdxnOjg5KWprSgMAu9opvQ
	(envelope-from <linux-media+bounces-64398-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:15:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE086682A0
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:15:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=XEHQ07ZV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64398-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64398-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0B3630CEF6A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A6C3EC2D1;
	Wed, 10 Jun 2026 10:13:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04633B42ED
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 10:13:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086423; cv=none; b=OjdeaHnF30T8PwZKNZMel/0RP6pYUx3/ormYKosHFMzq3rWh+s4Jq81dowN6WSfaFo0/8X8lXnZ+0Jy8kv2yi/PQd6rNqBc6eWORzQtGrHIMVklmisZq5bIRjxVrZKPrvmJqv4hJUwR+lxvrlRbOAU96tUiir+XEyFAuBC9WKmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086423; c=relaxed/simple;
	bh=+7NZW9uyf5vW17zoxnf2gXf5D5sz8bW3z1SjfkP2eRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMhqF76ka/FVqNhdUxoSi+9U/TmhqQH755BjHLowJsDgHV4M0O/owxvrLsWvUyCBXKRiNVoDTemFLG+OxciuORpVoQTTH244zeSbFDS8Z02hacnkp2ptC0rEmvWkA+/qeLOVd/dVE+Id8WFMEACDnhEslg8DnRS2kBVY9CK7rIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEHQ07ZV; arc=none smtp.client-ip=198.175.65.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781086419; x=1812622419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+7NZW9uyf5vW17zoxnf2gXf5D5sz8bW3z1SjfkP2eRY=;
  b=XEHQ07ZVsZQkj42IaHMNEMW4kTFiPysRXKK/9wSznDlDl9PHPjEkRktd
   33Tl7R/YnebZh+BGDQS8CeDBVBRqWr6NOhRUuWhZGsaGwd8SwKQ4A7hL6
   eWBQCCnKClbrWrhJ2OR4axO7dCOcjKkmxqiszArkSr68WrKAEulmvUsAd
   dDo3xU0sGF29efQctlu4fOJBfThHgjsgnSG3ND65UMmkGPLihEJXMG8Il
   roIgLzd2jXlBYlRhoA85YHkWwyXX+DRw0FDTb94TbuDBsDDhuLtFXOwST
   PI4QwqrWA0DTvwfYQWhh+oqESsDxR+9nIx7/U4DXfKFhVC/tWy5+6nmRo
   Q==;
X-CSE-ConnectionGUID: IW6nDKmwTjeXvoDUTiJK3w==
X-CSE-MsgGUID: prycdwy4Qt+X2LkEiYWrOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85502169"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="85502169"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:13:38 -0700
X-CSE-ConnectionGUID: XBkQ4dDXTwCirLDCqDpaPQ==
X-CSE-MsgGUID: PMm9QkuZSuuqt7SyJ0h7WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="245277707"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.253])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:13:32 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0198D11F94F;
	Wed, 10 Jun 2026 13:13:27 +0300 (EEST)
Date: Wed, 10 Jun 2026 13:13:27 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
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
Message-ID: <aik4xzXNzgb9sFcJ@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-7-sakari.ailus@linux.intel.com>
 <aiZnQgyEBkZH7er0@zed>
 <178091466607.16054.13972332068848565738@freya>
 <CAPY8ntBshAPkN_7Swz4qpbOjhpu5Gfnd5VkZPrgUgUoNrM0pEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntBshAPkN_7Swz4qpbOjhpu5Gfnd5VkZPrgUgUoNrM0pEg@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64398-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dave.stevenson@raspberrypi.com,m:jai.luthra@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,jjverkuil.nl,vger.kernel.org,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EAE086682A0

Hi Dave,

On Mon, Jun 08, 2026 at 07:06:03PM +0100, Dave Stevenson wrote:
> Hi Jai, Jacopo, Sakari, and Laurent
> 
> On Mon, 8 Jun 2026 at 11:31, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> >
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
> 
> I'll agree that I don't like the concept of negative blanking as it is
> very counter-intuitive.
> 
> However libcamera *does* appear to support negative blanking through
> the Pi pipeline handler.
> Running with mainline Pi5 CFE driver, mainline libcamera, and imx219
> with this patch series. If I ask for 1640x1232 at 79.07fps then
> libcamera is setting V4L2_CID_VBLANK to -584 and giving me 79.07fps.
> The code could do with an audit though as I do see some uint32_t
> variables kicking around, so it could be more luck than judgement
> (hmm, I see a value of 4294966712 being set).

Thank you for testing this. Unfortunately it still seems other pipeline
handlers have issues with this as Jai mentioned.

> 
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
> 
> We did previously ask Sony for more information on the special binning
> mode, but there wasn't anything more to be had. imx219 is now at least
> 12 years old (we started working with it in 2014), so those who knew
> about it in Sony have generally moved on.
> 
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
> 
> A model needs to describe the functional behaviour, even if it isn't
> how the hardware actually implements it.
> 
> If the new model can't describe imx219 with a change of pixel clock
> when binning, is it going to cope with the Starvis 2 sensors (eg
> imx415, imx662 and imx678) where the HMAX register is in units related
> to the input clock rather than pixel clock? Perhaps it can, but one of
> those probably ought to be converted to prove the point (imx415 is in
> mainline and fairly easily available).

I think we need new controls for this purpose. It's not a problem to have
multiple ways to configure a sensor if this is because of hardware reasons
IMO. The UAPI still needs to allow configuring the sensor accurately so I'd
like to avoid e.g. unit conversion for this purpose.

I really wonder why Sony has made such register API changes on their new
sensors.

> 
> A second case that needs to be considered by this generic model: there
> are a bunch of sensors (imx378, imx477, imx519, and imx708 to name 4)
> that have an exposure multiplication factor to allow for very long
> exposure times / very low frame rates. How would that get represented?
> The register is CIT_LSHIFT with permitted values from 0 (for off) to 7
> (*128). "exposure time = COARSE_INTEG_TIME * 2^CIT_LSHIFT", and
> likewise frame_length_lines gets multiplied by that value.

I'd add a new control for the exponent.

> 
> Is there a proposal on how to handle eg ov5647 where the PLL
> configuration is changed between some of the modes for both pixel
> clock and link frequency?

The fact that most register list based drivers use the same PLL
configuration for pretty much everything is probably because it's such a
pain to implement anything else using register lists. :-)

E.g. the CCS driver has supported this for more than 10 years now but
documentation is scarce. Laurent brought this up recently in fact. The CCS
driver expects the user to first pick a link frequency and then configure
the rest the usual way. I'd do the same in other drivers, too.

> Or imx290 which changes link frequency for the modes, although it does
> keep a common pixel clock? (I've never come up with a good reason for
> the change in link frequency, just that the datasheet does it that
> way).

It does have an effect on which precise frame rates are achievable.

> 
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
> 
> Will it actually break that much?
> As much as I conceptually don't like negative values, as above the Pi
> pipeline handlers in libcamera seem to just work.
> Anyone using the sensor in a raw capacity and just setting a
> precomputed value is going to break, but that's going to be the case
> with any of the proposed changes.
> 
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
> 
> It is true that the line length configured is sufficient that it could
> be halved in order to keep the pixel rate the same. That would seem
> feasible.
> 
> > Of course, there are other options to just leave this highly used sensor
> > alone, or support embedded data and internal pads without mandating the new
> > FRAME_LENGTH and LINE_LENGTH controls. But I personally would leave that as
> > a last resort.
> 
> Is there a dependency stopping the embedded data and internal pads
> patches being merged without the common raw sensor model?

One of the main reasons why the internal pad flag patch isn't in yet is
that we want to avoid its use without a clearly defined semantics -- which
is defined by the Common Raw Sensor Model.

-- 
Kind regards,

Sakari Ailus

