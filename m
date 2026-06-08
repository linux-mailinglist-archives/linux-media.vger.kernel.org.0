Return-Path: <linux-media+bounces-64194-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D2JHDnXOJmp9kwIAu9opvQ
	(envelope-from <linux-media+bounces-64194-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:15:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4AA657082
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:15:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=neLeXoui;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64194-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64194-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F046301830B
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 14:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFF83C4574;
	Mon,  8 Jun 2026 14:07:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9876D3D332B
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 14:07:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927665; cv=none; b=C6s0y3MCa6qSrJt9qq7cJYJF2ee3wuaGS65q2vZ90cwT4HIwmzlMNsECSKaQF+l7lmzLUVCshXQn+BglwFAqGk5ipRGf3MScIxPKHYPp8APnf8sB3/t/CJGZbJwIaBNQLyrK2Wb7sMKwTJzR6vMfqf70yzSIAc+KW9aAuod1u88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927665; c=relaxed/simple;
	bh=h5qV2U4pt4NiIS9ETU9PcYvE4GSviKjh3QPY2dd1HDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1xjQ0+xRIOmez6eoktYGW+1UDsNLiX6deDtVt+e0OCnZ7x8WU0qFN7vS/UcRohmA8VAqtvfylmMd3byQ1KrpdKSH3vG4bhp1DQkdf8IVWkZ8xujeuRIIW0rbU2oSFwkHwZERF2iTHwDcK8YlNJiHeFQ4SOKrsITNT69iubEPO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=neLeXoui; arc=none smtp.client-ip=198.175.65.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780927664; x=1812463664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h5qV2U4pt4NiIS9ETU9PcYvE4GSviKjh3QPY2dd1HDI=;
  b=neLeXouinT9CxbvJ0/kAvWBjtu024MJCbFSuHENLGWq5AaNbh0G1UiGy
   99EWImutKI86WBUnBpBlZFeGE/HD+51fEJ40PtlZ0EZZGEpMU0KaDko6/
   5mr818NmGvNHapAhEzwxhVOz2zqm98acP1UiKN+SVa/HJAtRhvQeS+Dng
   821jbPDz3zVBttscdHEwVgS8eUtY4kV/jOxqonlFn0j5yoHTyjC3rTSP0
   qrSelgffDvhCUEfHPDIaDSW28tWUCsvwnrcGAz1ZeTk7nWVOOwqlEf8mO
   NcJWlphO+2YvxcIT02VEMrWfKztDr5AsM8MgIqViT5djVsjITdI2uLrTK
   Q==;
X-CSE-ConnectionGUID: vMkfnAUlSsCY/7sDq2xYSw==
X-CSE-MsgGUID: wYO7f1trTbqGVxnxtbGW6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="91988211"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="91988211"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 07:07:44 -0700
X-CSE-ConnectionGUID: T274YFZySryC8s0fqWFWRA==
X-CSE-MsgGUID: L+Xi2HdzSDuAcf4NyE0oeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="247425712"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.127])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 07:07:37 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 82DF6121C67;
	Mon, 08 Jun 2026 17:07:34 +0300 (EEST)
Date: Mon, 8 Jun 2026 17:07:34 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
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
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and
 exposure for analogue binning
Message-ID: <aibMpvdVNraURHIE@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-7-sakari.ailus@linux.intel.com>
 <aiZnQgyEBkZH7er0@zed>
 <20260608091026.GB772117@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608091026.GB772117@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64194-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.intel.com:from_mime,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B4AA657082

Hi Laurent, Jacopo,

On Mon, Jun 08, 2026 at 12:10:26PM +0300, Laurent Pinchart wrote:
> On Mon, Jun 08, 2026 at 08:58:46AM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> > 
> > On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> > > When vertical analogue binning is in use, the minimum frame length in
> > > lines decreases to around half of the normal. In relation to the sensor's
> > > output size this means vertical blanking can be negative but that's not an
> > > issue as control values are signed. Remove the workaround for this
> > 
> > Didn't we just discussed two weeks ago in media summit how negative
> > blankings are a bad idea, and of all drivers one could decide to play
> > with imx219 is probably the worse due it's large use base and the fact
> > libcamera doesn't support negative blankings ?
> 
> I also think that negative blanking values are a bad idea, for this
> driver or any other driver. I still haven't seen any compelling
> argument.

Note that the blanking controls haven't expressed blanking in other
configurations than those that do not use binning, either analogue or
digital, or cropping. The fact that negative values would result due to
sensor configuration does not mean the values would be somehow incorrect,
they simply do not reflect actual blanking configuration on the sensor.

In retrospect, we should have always had frame length in lines and line
length in pixels controls instead, or possibly besides the blanking
controls. But as the two blanking controls have been in use for conveying
frame length in lines and line length in pixels, relative to a reference
size, we can't re-purpose them for something else anymore without breaking
pretty much all userspace.

Multiplying the pixel rate and either frame length in lines or line length
in pixels by a constant does not make the blanking controls magically
correct.

I hope the above summarises my position in an understandable way.

I believe removing the rate_factor is necesary if we want to add support
for the Common Raw Sensor Model to the imx219 driver. Otherwise, we'll be
left with a single example driver only, the ov2740, which is an entirely
register list based driver.

-- 
Kind regards,

Sakari Ailus

