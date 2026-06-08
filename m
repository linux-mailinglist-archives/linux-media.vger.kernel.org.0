Return-Path: <linux-media+bounces-64173-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wp9rJiCbJmqEZgIAu9opvQ
	(envelope-from <linux-media+bounces-64173-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 12:36:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3720E6552AC
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 12:36:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=J7dCqElO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64173-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64173-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B3E5310B07F
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 10:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9C238BF70;
	Mon,  8 Jun 2026 10:21:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E392E7F0A
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 10:21:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914092; cv=none; b=bzHGtxuwUGo6sW5T83JNHfFSyOAOlZL9k81H1F0JXprZYndDiXtdPWpZxdYuCIk9/AuMgzM+AOVJr5ZMrI7u7Q2yEjTma8/AgkROYypfb6DOY4fW4+TXbuZ3Bcmg7bxQGFeL+ZpcE04hvcIUUobMQx3lFkLpdKvN96SwUOHOlOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914092; c=relaxed/simple;
	bh=iLidZ+z3fjyJpR+FjwlbBycSIFS8L6grsOIuCjJgCL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=scv5i1TAHW0FFIhfBvqS2VOWowc3fcPbJUGNmeoPSV4mD5qNb33/v/Co2jyQPnVNt9vpxA/Y7Wn/bBY0sx8Sftz9BMZ+sqv4aIe24ZSB1eiw2uqXZHcHv00uReA7HmI6PapyR+COyRaB7zRCuzQrK4m3aLf0jtUeJAiwR8JDDis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7dCqElO; arc=none smtp.client-ip=192.198.163.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780914091; x=1812450091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iLidZ+z3fjyJpR+FjwlbBycSIFS8L6grsOIuCjJgCL0=;
  b=J7dCqElOj82qjEdnZuCus8kxAEjplPWJ6fxLmbfYcnSzx2tnil5gN4z1
   5+AIn2jctTtF333ejkkDjsm3LK935BzHVi6oybRoBDCWKdvDvXd2iTK+Q
   WIcxwNiKsTocdRnjANEv6obEUWYWpQQWkZU9NmAWe+I1oDgaNfBZJi4ip
   RXcOfCeJ8fhCE1dDIhpM+XQKsfR4GOdevepRN7CQRt6J3cI/s8V/bZ9dP
   LmPB2sD3J3LvUjjaHT0U9K3VhfTVOGVqkzp98//zrWoxuFW0xZx2txWFo
   Zsxwz1oGuW49b76M+gXyGp49NAjBt4s8wmvS3eDrJ+8O1bVlEFD/vXzr4
   w==;
X-CSE-ConnectionGUID: Lv3V26ieSEWg+evixDxjuQ==
X-CSE-MsgGUID: /lqRRLkzTfyI98/mECkfug==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81502081"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="81502081"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 03:21:30 -0700
X-CSE-ConnectionGUID: FravWKIdSuib6yq8g3Bf+Q==
X-CSE-MsgGUID: TN+grhX9Q7qzBEWZnjnONQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="241068330"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.127])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 03:21:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BA83611FBC5;
	Mon, 08 Jun 2026 13:21:22 +0300 (EEST)
Date: Mon, 8 Jun 2026 13:21:22 +0300
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
Message-ID: <aiaXotTu4l4ZWzkd@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-5-sakari.ailus@linux.intel.com>
 <20260608073653.GD370380@killaraus.ideasonboard.com>
 <aiZ0a3nGqp6N7GD3@zed>
 <20260608080338.GF370380@killaraus.ideasonboard.com>
 <aiZ56IgNJ2FeXN0o@kekkonen.localdomain>
 <20260608082426.GA380394@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608082426.GA380394@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64173-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,linux.intel.com:from_mime,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3720E6552AC

On Mon, Jun 08, 2026 at 11:24:26AM +0300, Laurent Pinchart wrote:
> On Mon, Jun 08, 2026 at 11:14:32AM +0300, Sakari Ailus wrote:
> > On Mon, Jun 08, 2026 at 11:03:38AM +0300, Laurent Pinchart wrote:
> > > On Mon, Jun 08, 2026 at 09:53:17AM +0200, Jacopo Mondi wrote:
> > > > Hi Laurent
> > > >   sorry if I reply in place of Sakari but I got this fresh
> > > 
> > > Thanks :-)
> > > 
> > > > On Mon, Jun 08, 2026 at 10:36:53AM +0300, Laurent Pinchart wrote:
> > > > > On Mon, Jun 08, 2026 at 12:53:50AM +0300, Sakari Ailus wrote:
> > > > > > The PIXEL_RATE control exists to convey the value to the userspace and has
> > > > > > no configuration that would need to be programmed to the sensor. Make the
> > > > > > control handler ops for the PIXEL_RATE control NULL and avoid a warning
> > > > > > (as well as returning an error) from the driver.
> > > > >
> > > > > I thought the standard way to handle pixel rate being read only was to
> > > > > set the V4L2_CTRL_FLAG_READ_ONLY flag, like we do for e.g.
> > > > > V4L2_CID_LINK_FREQ. Is that not correct ?
> > > > 
> > > > PIXEL_RATE is RO by default
> > > > 
> > > > drivers/media/v4l2-core/v4l2-ctrls-defs.c:      case V4L2_CID_PIXEL_RATE:
> > > > drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *type = V4L2_CTRL_TYPE_INTEGER64;
> > > > drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > drivers/media/v4l2-core/v4l2-ctrls-defs.c-              break;
> > > > 
> > > > The purpose of setting the ctrl_ops member to NULL is to avoid having
> > > > to handle RO controls in the driver implementation of .s_ctrl().
> > > 
> > > Shouldn't the V4L2 control framework avoid .s_ctrl() calls for read-only
> > > controls ? I thought it did already.
> > 
> > The control may be read-only on the UAPI but the driver could still do
> > something about it in its s_ctrl() callback. I don't know if any driver
> > depends on this though.
> 
> It seems to be one of the many areas where control handling should be
> simplified for drivers.
> 
> In any case, the imx219 driver creates the V4L2_CID_LINK_FREQ control
> with a non-NULL ops pointer, sets the V4L2_CTRL_FLAG_READ_ONLY flag, and
> does not handle V4L2_CID_LINK_FREQ in imx219_set_ctrl(). If there's an
> issue for V4L2_CID_PIXEL_RATE there is also an issue for
> V4L2_CID_LINK_FREQ.

The ops should be set to NULL for link_freq as well.

> 
> Maybe the best short term fix would be to drop the dev_info() in the
> default case of the ctrl->id switch in imx219_set_ctrl() ?

Any reason why not to set ops NULL instead?

-- 
Sakari Ailus

