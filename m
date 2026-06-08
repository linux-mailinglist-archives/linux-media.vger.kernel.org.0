Return-Path: <linux-media+bounces-64256-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HzQTBvk6J2qVtgIAu9opvQ
	(envelope-from <linux-media+bounces-64256-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 23:58:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6536D65AD29
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 23:58:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=KVEW05PH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64256-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64256-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D0873031004
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 21:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270003B19B7;
	Mon,  8 Jun 2026 21:52:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDE73B14D2
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 21:52:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955538; cv=none; b=kDQZduXMEPIFyZBDBMsdxEsvnNsCAEsd3Oo4n5mFx/dqvz7Y2DZ2eUH+7aolQnO7K73TlfSFTsFl+RHj1tPMLwqAfqQ9H+Kvx59M7XbpMBlVojExEmYfv2PNtWlp/UzS6AvpeFW2SbcI0rwdZGvrvgL47OSRQWrhgVp2xLAVrPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955538; c=relaxed/simple;
	bh=t67853bHKpWnNvFI0e7UBcuVI3UfKCQN5149lfMds54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpulJM6ekN4dhw8Zykefge1teklVxrKb2PIvQt9MXKYUYoNKg7BMFYgActxP3z+/s1Vgf6+f1f7t15lqFcc1NBsz9fvgL2QTdyEYiObQF3AKx4e8xx+F7PprcArKRbrILdrABzbwQsHQd24c7iIQYFvoU4XVzS4SMaZUTFVuh0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KVEW05PH; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE1688F;
	Mon,  8 Jun 2026 23:51:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780955506;
	bh=t67853bHKpWnNvFI0e7UBcuVI3UfKCQN5149lfMds54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVEW05PHgpIxVcu+hpG1F+5AOfQra4t6S/Z6tZxEi7LVIp0zXKy8cxrvkQPb87eQS
	 zdh5dV7E7phyVBrq6iW6i6CHSI8ZgAGWUuGpqIa4ZKY3MAgng3on9Yq84C+sQqilSH
	 dahJ4B8nwtI5fh65ClnRYW/j9DanjyJvLCYTyjQ4=
Date: Tue, 9 Jun 2026 00:52:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu , Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and
 exposure for analogue binning
Message-ID: <20260608215213.GC944266@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-7-sakari.ailus@linux.intel.com>
 <aiZnQgyEBkZH7er0@zed>
 <20260608091026.GB772117@killaraus.ideasonboard.com>
 <aibMpvdVNraURHIE@kekkonen.localdomain>
 <178093582619.19620.15016359616261234139@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178093582619.19620.15016359616261234139@freya>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64256-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,kernel.org,ti.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:from_mime,killaraus.ideasonboard.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6536D65AD29

On Mon, Jun 08, 2026 at 09:53:46PM +0530, Jai Luthra wrote:
> Quoting Sakari Ailus (2026-06-08 19:37:34)
> > On Mon, Jun 08, 2026 at 12:10:26PM +0300, Laurent Pinchart wrote:
> > > On Mon, Jun 08, 2026 at 08:58:46AM +0200, Jacopo Mondi wrote:
> > > > Hi Sakari
> > > > 
> > > > On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> > > > > When vertical analogue binning is in use, the minimum frame length in
> > > > > lines decreases to around half of the normal. In relation to the sensor's
> > > > > output size this means vertical blanking can be negative but that's not an
> > > > > issue as control values are signed. Remove the workaround for this
> > > > 
> > > > Didn't we just discussed two weeks ago in media summit how negative
> > > > blankings are a bad idea, and of all drivers one could decide to play
> > > > with imx219 is probably the worse due it's large use base and the fact
> > > > libcamera doesn't support negative blankings ?
> > > 
> > > I also think that negative blanking values are a bad idea, for this
> > > driver or any other driver. I still haven't seen any compelling
> > > argument.
> > 
> > Note that the blanking controls haven't expressed blanking in other
> > configurations than those that do not use binning, either analogue or
> > digital, or cropping. The fact that negative values would result due to
> > sensor configuration does not mean the values would be somehow incorrect,
> > they simply do not reflect actual blanking configuration on the sensor.
> 
> I agree.. although what is the actual blanking configuration on the sensor
> in this case?
> 
> I've been banging my head for a while to figure it out (my best guess in
> the sibling thread)
> 
> > In retrospect, we should have always had frame length in lines and line
> > length in pixels controls instead, or possibly besides the blanking
> > controls. But as the two blanking controls have been in use for conveying
> > frame length in lines and line length in pixels, relative to a reference
> > size,

What's the reference size ? The controls are documented as

``V4L2_CID_VBLANK (integer)``
    Vertical blanking. The idle period after every frame during which no
    image data is produced. The unit of vertical blanking is a line.
    Every line has length of the image width plus horizontal blanking at
    the pixel rate defined by ``V4L2_CID_PIXEL_RATE`` control in the
    same sub-device.

``V4L2_CID_HBLANK (integer)``
    Horizontal blanking. The idle period after every line of image data
    during which no image data is produced. The unit of horizontal
    blanking is pixels.

This is compatible with usage of the output size as a reference. And
doing so wouldn't require negative blanking, would it ?

> > we can't re-purpose them for something else anymore without breaking
> > pretty much all userspace.
> > 
> > Multiplying the pixel rate and either frame length in lines or line length
> > in pixels by a constant does not make the blanking controls magically
> > correct.

The multiplication of the pixel rate may be the core of the issue. It's
getting late, I'll try to look at that tomorrow.

> Sure.. but the sensor must be reading out pixels along with non-negative
> blanking internally. If that happens to not match the register values, do
> you object to multiplying LLP or FLL with a constant?
> 
> Also what do you think of sensors like IMX678/IMX283 where the HTOT (LLP)
> register is not in units of pixels at all?
> 
> > I hope the above summarises my position in an understandable way.
> > 
> > I believe removing the rate_factor is necesary if we want to add support
> > for the Common Raw Sensor Model to the imx219 driver. Otherwise, we'll be
> > left with a single example driver only, the ov2740, which is an entirely
> > register list based driver.
> 
> Agreed.

-- 
Regards,

Laurent Pinchart

