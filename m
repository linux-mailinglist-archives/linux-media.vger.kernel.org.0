Return-Path: <linux-media+bounces-64184-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IrvuJxfIJmr5kQIAu9opvQ
	(envelope-from <linux-media+bounces-64184-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 15:48:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB1F656CAD
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 15:48:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=iSSomlFR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64184-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64184-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F02DA3037BDF
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 13:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF8C37207F;
	Mon,  8 Jun 2026 13:47:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352B63BC69C
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 13:47:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926438; cv=none; b=MXPZdO9nVQK8pydMkbtbPEHWxvdxRXKesmHvwe/DVGcYeJCC+FiuIYI1HYuN+kVQnU8HisnbypN5pTfo3+pdOnr9bdYICQL9/Bvz3lkxptFc9JE9T4pbCJJJLwSAOlqMp65B02vFazc3Q64Pr7DSB3tUKoB1ErGfvVw64QHhPWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926438; c=relaxed/simple;
	bh=PiS45bbpotiWV6Kjw6pTzjCSDA8kAdOj8XEeNHv0M+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPi3iVdOYWc5Qm5ribBw2svw0E6KlJu95kCHBvZtu072se4b+iXlig8UEuhj33aQRFV1pg3cbT9q+/xdHkzTnwNI7bAsZ611i2c1BDOguT7+2AQYrGyUun/lQbWVW5nEnQ0pSfdDepgWjJHSbbuJ9qxwSxjfzdyakxHSpS/f+N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSSomlFR; arc=none smtp.client-ip=198.175.65.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780926434; x=1812462434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PiS45bbpotiWV6Kjw6pTzjCSDA8kAdOj8XEeNHv0M+g=;
  b=iSSomlFRarBitlsF26smVFtIRG5aqMOM0Mk+S5XFB+mnmxo5pFIQOe1d
   ARXBIvjYDVt4JjEDGVq9E7b3y4On2RZx/O8jUy3Aq6vMtuwjh0CFvhp5D
   NOrTAl4mPYlQxWD6KJfY2mrqVOOPteocL+mSLTyMUZsJelOXiSOXKIV8I
   7HqMuucmmtmhGOlGAmXJXPJqm6Wbkp1ES3LA5acJeft3tuYkXkzS27Gai
   6glZfgrALh84hbPpEeGaR0PWXk9ZkznRk29wdyj3j/Hfce+aFOoDpG6nS
   9DD+r6u2ZGLiInUah7G87YaBrBnACSc3/KX6jBCYlTxfsHpXWFd0D+A95
   g==;
X-CSE-ConnectionGUID: qOcsynErTYCgDhx17JwNQA==
X-CSE-MsgGUID: 9b8+x01VTQK3H7tRyuehVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81568836"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="81568836"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 06:47:13 -0700
X-CSE-ConnectionGUID: ZgBoK6tNRMWfcNwLC/JTvw==
X-CSE-MsgGUID: sweBv4jCSjatrcdTAZK7vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="250476103"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.127])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 06:47:06 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1517E121C67;
	Mon, 08 Jun 2026 16:47:03 +0300 (EEST)
Date: Mon, 8 Jun 2026 16:47:03 +0300
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
Subject: Re: [PATCH v5 04/10] media: imx219: Make control handler ops for
 PIXEL_RATE NULL
Message-ID: <aibH1-5PxiHpVdsf@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-5-sakari.ailus@linux.intel.com>
 <20260608073653.GD370380@killaraus.ideasonboard.com>
 <aiZ0a3nGqp6N7GD3@zed>
 <20260608080338.GF370380@killaraus.ideasonboard.com>
 <aiZ56IgNJ2FeXN0o@kekkonen.localdomain>
 <20260608082426.GA380394@killaraus.ideasonboard.com>
 <aiaXotTu4l4ZWzkd@kekkonen.localdomain>
 <20260608102755.GF772117@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608102755.GF772117@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64184-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.intel.com:from_mime,intel.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FB1F656CAD

On Mon, Jun 08, 2026 at 01:27:55PM +0300, Laurent Pinchart wrote:
> On Mon, Jun 08, 2026 at 01:21:22PM +0300, Sakari Ailus wrote:
> > On Mon, Jun 08, 2026 at 11:24:26AM +0300, Laurent Pinchart wrote:
> > > On Mon, Jun 08, 2026 at 11:14:32AM +0300, Sakari Ailus wrote:
> > > > On Mon, Jun 08, 2026 at 11:03:38AM +0300, Laurent Pinchart wrote:
> > > > > On Mon, Jun 08, 2026 at 09:53:17AM +0200, Jacopo Mondi wrote:
> > > > > > Hi Laurent
> > > > > >   sorry if I reply in place of Sakari but I got this fresh
> > > > > 
> > > > > Thanks :-)
> > > > > 
> > > > > > On Mon, Jun 08, 2026 at 10:36:53AM +0300, Laurent Pinchart wrote:
> > > > > > > On Mon, Jun 08, 2026 at 12:53:50AM +0300, Sakari Ailus wrote:
> > > > > > > > The PIXEL_RATE control exists to convey the value to the userspace and has
> > > > > > > > no configuration that would need to be programmed to the sensor. Make the
> > > > > > > > control handler ops for the PIXEL_RATE control NULL and avoid a warning
> > > > > > > > (as well as returning an error) from the driver.
> > > > > > >
> > > > > > > I thought the standard way to handle pixel rate being read only was to
> > > > > > > set the V4L2_CTRL_FLAG_READ_ONLY flag, like we do for e.g.
> > > > > > > V4L2_CID_LINK_FREQ. Is that not correct ?
> > > > > > 
> > > > > > PIXEL_RATE is RO by default
> > > > > > 
> > > > > > drivers/media/v4l2-core/v4l2-ctrls-defs.c:      case V4L2_CID_PIXEL_RATE:
> > > > > > drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *type = V4L2_CTRL_TYPE_INTEGER64;
> > > > > > drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > > > drivers/media/v4l2-core/v4l2-ctrls-defs.c-              break;
> > > > > > 
> > > > > > The purpose of setting the ctrl_ops member to NULL is to avoid having
> > > > > > to handle RO controls in the driver implementation of .s_ctrl().
> > > > > 
> > > > > Shouldn't the V4L2 control framework avoid .s_ctrl() calls for read-only
> > > > > controls ? I thought it did already.
> > > > 
> > > > The control may be read-only on the UAPI but the driver could still do
> > > > something about it in its s_ctrl() callback. I don't know if any driver
> > > > depends on this though.
> > > 
> > > It seems to be one of the many areas where control handling should be
> > > simplified for drivers.
> > > 
> > > In any case, the imx219 driver creates the V4L2_CID_LINK_FREQ control
> > > with a non-NULL ops pointer, sets the V4L2_CTRL_FLAG_READ_ONLY flag, and
> > > does not handle V4L2_CID_LINK_FREQ in imx219_set_ctrl(). If there's an
> > > issue for V4L2_CID_PIXEL_RATE there is also an issue for
> > > V4L2_CID_LINK_FREQ.
> > 
> > The ops should be set to NULL for link_freq as well.
> > 
> > > Maybe the best short term fix would be to drop the dev_info() in the
> > > default case of the ctrl->id switch in imx219_set_ctrl() ?
> > 
> > Any reason why not to set ops NULL instead?
> 
> Because that seems to be a hack. Drivers shouldn't have to set a NULL
> ops pointer for read-only controls, when there's already a read-only
> flag. I'd like to simplify the code on the driver side and handle this
> in the control framework, not adding yet another arcane rule that most
> driver authors will not be aware of.

I don't think I'd necessarily call it a hack.

The control may be changeable, but not by the user. If the driver is just
setting the value without going through the control framework, control
events will be omitted.

-- 
Sakari Ailus

