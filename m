Return-Path: <linux-media+bounces-66562-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8wdmN5grSGofnQAAu9opvQ
	(envelope-from <linux-media+bounces-66562-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 23:37:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C13C705EA5
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 23:37:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="maLtpE/P";
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66562-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66562-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17570303010D
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 21:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBB833E344;
	Fri,  3 Jul 2026 21:37:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635BC1D5160
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 21:37:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783114632; cv=none; b=UN04u54BibyBmNqkhcyzwFNyW4mR2u3Ovi7o2J02qZ0axm6HoBsKlPsxdPDDBLk9VyXpiX8W6qVgUkL6t9WYhna2GFTIPfJC+2BxLqWznmTueNLBhV8EmaMFL11o79+P3CiBIcKNaBhldK+PsEivefIGX0P3k8H8rxPWqA/7neE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783114632; c=relaxed/simple;
	bh=efj1g9cCvzKFrvHXcs/7SYrq9x9EJxmJEExler5AL3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PMq8I21I2LDVvFSj6jchGkkitf7SCqb1coJd8BZle6lUD7hI16iDId3rYkJqf852m3i8JHJxcWS55+I9hBSJ356B6zegrxuJi7Ir2dGSciCA9RD4vaHlnw/x2GxgZcmfnC66wfh8CHJn9ZzrjEKMxhOl/YxH4Bnz5ncepOxHXWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=maLtpE/P; arc=none smtp.client-ip=192.198.163.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783114630; x=1814650630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=efj1g9cCvzKFrvHXcs/7SYrq9x9EJxmJEExler5AL3M=;
  b=maLtpE/PK8mUgBd5zRi0baXVSMsEiDA+HVx1W/xFSsvU+zruNn6x/0RE
   xx2C+uNGdB3rnDrxMCXQf4BPGRlqi6Owk5QTt5OAnCPyOJ3OKiBX0pFy+
   hT59e1l//AvA5xtWZEv3n+zQhp9cpJmCRSURooD9fIpu7LvZsK73mhPaq
   VfO4GVwOhSjPOFp6aikovjGeBQ1d7ABKgtyVj30i/zE6CMH3KytP1/bdk
   etcUZALAxYpvNOtPSQEyejHM0E/PChOZ3Bz1uUvAYA11wZ0T56oWXWPnl
   B05yguWHb7BYXnZN2yjXum9ko7znMdIOygT69VDxjAmD4uxMJFC52ViSz
   Q==;
X-CSE-ConnectionGUID: ZYxCyObCQE+YBgNnt3syIQ==
X-CSE-MsgGUID: VwaauOldTMy0l3mOV50bUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="95236600"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="95236600"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 14:37:10 -0700
X-CSE-ConnectionGUID: s1/5GX2jSV+hc1fImxxw0A==
X-CSE-MsgGUID: P8Nvtd/3R7uLXdS6LWEQ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="252722898"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.217])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 14:37:03 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 639EA120443;
	Sat, 04 Jul 2026 00:36:37 +0300 (EEST)
Date: Sat, 4 Jul 2026 00:36:37 +0300
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
Message-ID: <akgrZSnCRYkvAsr8@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-4-sakari.ailus@linux.intel.com>
 <CAPY8ntDPvDdj6vSVRUsTmC9tXmy8xNATrrbyqDr7DRU1NiiDQQ@mail.gmail.com>
 <ajPLEfuiCN9R1ben@kekkonen.localdomain>
 <CAPY8ntAfxvFRgHKYRT=ZLOL7L2A=GLQ-kuhYjhgTob83purBbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntAfxvFRgHKYRT=ZLOL7L2A=GLQ-kuhYjhgTob83purBbQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66562-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,linux.intel.com:from_mime,vger.kernel.org:from_smtp,intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C13C705EA5

HI Dave,

On Thu, Jul 02, 2026 at 06:04:34PM +0100, Dave Stevenson wrote:
> Hi Sakari
> 
> On Thu, 18 Jun 2026 at 11:40, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Dave,
> >
> > On Mon, Jun 08, 2026 at 04:42:44PM +0100, Dave Stevenson wrote:
> > > Hi Sakari
> > >
> > > On Sun, 7 Jun 2026 at 22:54, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > The rate_factor multiplier is used to multiply a few values in the
> > > > sensor's timing configuration and the exposure time is one of them. This
> > > > also needs to be taken into account in exposure time margin: multiply it
> > > > by rate_factor so that sensor's exposure time margin is respected.
> > >
> > > Testing the 1640x1232 mode with FRM_LENGTH_A set to 0x288 (79.07fps),
> > > I can write register 0x15a (COARSE_INTEGRATION_TIME_A) with values up
> > > to and including 0x284 without it affecting the output frame rate, and
> > > without image corruption.
> > > With IMX219_EXPOSURE_OFFSET being 4, the current code implements
> > > exactly those limits, so why do you believe the offset should be
> > > increased?
> >
> > I agree with the upper exposure time limit (with FRM_LENGTH_A set to 0x288)
> > and the margin above but the issue is that the driver only implements
> > these limits when rate_factor is 1.
> >
> > The margin is subtracted from the frame length to calculate the upper
> > exposure limit, but as the frame length in lines an the exposure values are
> > divided by rate_factor, the margin gets divided, too, resulting the
> > effective margin of 2.
> >
> > I tested that setting the exposure value to higher than FRM_LENGTH_A -
> > margin increases the frame time. This shouldn't be the case i.e. it's a
> > driver bug.
> 
> Having had some more time to test experimentally, you've convinced me.
> The delivered frame time does appear to get extended if the raw
> register value in COARSE_INTEGRATION_TIME_A is greater than
> FRM_LENGTH_A - 4, so the exposure control needs to have the margin
> adjusted to account for the rate_factor division.
> 
> For reference, my test setup was to run "rpicam-hello -t 0
> --viewfinder-mode 1640:1232:10 --framerate 10 --shutter 10000" which
> results in FRM_LENGTH_A being 0x1403.
> Set dev_debug for the capture device to 0xb to log the The timestamp
> delta between frames is then 0.09999s
> "i2ctransfer -y -f <bus> w4@0x10 0x01 0x5a 0x13 0xff" to set
> COARSE_INTEGRATION_TIME_A to 4 gives the same delta.
> "i2ctransfer -y -f <bus> w4@0x10 0x01 0x5a 0x14 0x01" which would be
> the max register value with the margin halved gives a delta of
> 0.100028s.
> 
> Why could Sony not just document this?!

Most sensors still have worse documentation. :-(

> 
> I'll double check the behaviour in your v6 and send a R-b tag.

Thank you.

-- 
Kind regards,

Sakari Ailus

