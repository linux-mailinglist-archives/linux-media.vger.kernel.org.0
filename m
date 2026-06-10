Return-Path: <linux-media+bounces-64385-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gs1cHG4hKWqtRAMAu9opvQ
	(envelope-from <linux-media+bounces-64385-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:33:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E407266735F
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:33:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=kZ6Gg5GT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64385-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64385-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D247D3070DF9
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFF63A782B;
	Wed, 10 Jun 2026 08:27:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23DA3A7195
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 08:27:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080051; cv=none; b=kH53rpfvZsA6CCqOISjJfb7L3y2qr1cBkXYH4BPlYY8K5tN01LXPaMhlowUeQCfr35pO8KFq7WD/nkjYvYKCg2hp2PdXtGLxs/xHb61ib4cYXwOHtdtthxUtjexqME6aPlvAf/qDmlPb/sDWijRTAlG6oMQ66+5QuMOPy3ihtaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080051; c=relaxed/simple;
	bh=El9TeD9PBhjE29tsqUlIa8RQS80ay2fShvMWed+FtpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMmeGZ0RYtiKyYrChy/XRZSmtKyIWCJ5TWoGsUjkh+PZLCU01MOac4irtXfqLPpZyGM1xkzq/8eGcl1HHcBswoSANnNp9PL8+GozYmwWeXB+kUBRyqDlL+FNgsZUYZchT8p0AjuqRQpHela/GJzwVyBCt72Y0APewjcAYbg/ADA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZ6Gg5GT; arc=none smtp.client-ip=192.198.163.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781080050; x=1812616050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=El9TeD9PBhjE29tsqUlIa8RQS80ay2fShvMWed+FtpI=;
  b=kZ6Gg5GTPsNCadTbb4nMetNxaoV+5G+zoov9+46DlV/4Yypkihm5X4nN
   k0gZyHBRLfx5zI7r2LzILUCKl3Etc9vk1MkJZ08fodnDJh04v7/AQqa4T
   V7zuM7WQW8KWTc2ZujqBlvvhwEO5iXJsO0cG7qQw6RkWtOm/N5mrQuWen
   Yzi4nvBlmXyF/R17KeCxna/Gxb7gcb7rH34cesWfJjE1sKxW+guzdj5f6
   qQhwFCgID6ojtrp44IHfDb1O18vstx4+M90pEFDj4Gqk0U/36k0hXFOcA
   mJUL6PHAQkKmioPhnFCJsg05F4VCFG5M2BLIU/LFTH9HeOqoEBxWl4cMK
   g==;
X-CSE-ConnectionGUID: KCjqeJIvTj6mmMcGr2zZXw==
X-CSE-MsgGUID: PyIVcIySRcavCSOqz19x2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="93255106"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="93255106"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 01:27:29 -0700
X-CSE-ConnectionGUID: Uwm1K+yzRaO/MQ0XfELTNQ==
X-CSE-MsgGUID: 6MB50+GFS6KrlKF48lh8cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="250042489"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 01:27:22 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EC216121C50;
	Wed, 10 Jun 2026 11:27:18 +0300 (EEST)
Date: Wed, 10 Jun 2026 11:27:18 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
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
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
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
Message-ID: <aikf5r1urSvVP1Jv@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-7-sakari.ailus@linux.intel.com>
 <aiZnQgyEBkZH7er0@zed>
 <20260608091026.GB772117@killaraus.ideasonboard.com>
 <aibMpvdVNraURHIE@kekkonen.localdomain>
 <178093582619.19620.15016359616261234139@freya>
 <20260608215213.GC944266@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608215213.GC944266@killaraus.ideasonboard.com>
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64385-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:jai.luthra@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux.intel.com:from_mime,kekkonen.localdomain:mid,linuxtv.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E407266735F

Hi Laurent,

On Tue, Jun 09, 2026 at 12:52:13AM +0300, Laurent Pinchart wrote:
> On Mon, Jun 08, 2026 at 09:53:46PM +0530, Jai Luthra wrote:
> > Quoting Sakari Ailus (2026-06-08 19:37:34)
> > > On Mon, Jun 08, 2026 at 12:10:26PM +0300, Laurent Pinchart wrote:
> > > > On Mon, Jun 08, 2026 at 08:58:46AM +0200, Jacopo Mondi wrote:
> > > > > Hi Sakari
> > > > > 
> > > > > On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> > > > > > When vertical analogue binning is in use, the minimum frame length in
> > > > > > lines decreases to around half of the normal. In relation to the sensor's
> > > > > > output size this means vertical blanking can be negative but that's not an
> > > > > > issue as control values are signed. Remove the workaround for this
> > > > > 
> > > > > Didn't we just discussed two weeks ago in media summit how negative
> > > > > blankings are a bad idea, and of all drivers one could decide to play
> > > > > with imx219 is probably the worse due it's large use base and the fact
> > > > > libcamera doesn't support negative blankings ?
> > > > 
> > > > I also think that negative blanking values are a bad idea, for this
> > > > driver or any other driver. I still haven't seen any compelling
> > > > argument.
> > > 
> > > Note that the blanking controls haven't expressed blanking in other
> > > configurations than those that do not use binning, either analogue or
> > > digital, or cropping. The fact that negative values would result due to
> > > sensor configuration does not mean the values would be somehow incorrect,
> > > they simply do not reflect actual blanking configuration on the sensor.
> > 
> > I agree.. although what is the actual blanking configuration on the sensor
> > in this case?
> > 
> > I've been banging my head for a while to figure it out (my best guess in
> > the sibling thread)
> > 
> > > In retrospect, we should have always had frame length in lines and line
> > > length in pixels controls instead, or possibly besides the blanking
> > > controls. But as the two blanking controls have been in use for conveying
> > > frame length in lines and line length in pixels, relative to a reference
> > > size,
> 
> What's the reference size ? The controls are documented as
> 
> ``V4L2_CID_VBLANK (integer)``
>     Vertical blanking. The idle period after every frame during which no
>     image data is produced. The unit of vertical blanking is a line.
>     Every line has length of the image width plus horizontal blanking at
>     the pixel rate defined by ``V4L2_CID_PIXEL_RATE`` control in the
>     same sub-device.
> 
> ``V4L2_CID_HBLANK (integer)``
>     Horizontal blanking. The idle period after every line of image data
>     during which no image data is produced. The unit of horizontal
>     blanking is pixels.
> 
> This is compatible with usage of the output size as a reference. And
> doing so wouldn't require negative blanking, would it ?

That's not true: the reference of the blanking values in fact is the
analogue crop rectangle, not the output size or anything else. However, I
believe we need to take the established usage on UAPI as a fact which is
why I wrote this
<URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=metadata&id=5b470f2ed717705b51f4a799722dffb34a37f10a>.

I haven't posted it to the list yet.

-- 
Regards,

Sakari Ailus

