Return-Path: <linux-media+bounces-52845-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J1vEzbdkmlvzQEAu9opvQ
	(envelope-from <linux-media+bounces-52845-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 10:02:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9229B141CD5
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 10:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7518300F144
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E12A26ED56;
	Mon, 16 Feb 2026 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dW0rbjm7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF651EDA2B
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232559; cv=none; b=Bf1MHH7zRUVaqlvScze6F59CqP8378KPsaeLbmVs4OPRLmbUcqgUytCSuu0ic3s4/1s8jqH/HilYWAYzFYHA3SbGIvcao+48vg/nXIgHmgAcrknJPRCLe3WgZjEvM1MpZ6Hgg4xwYvjF2eXhPweUZ/7rRz7h4rnl6BwTY62l7jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232559; c=relaxed/simple;
	bh=74rH9qbbtUNAnbsKkVjmR80MePEL/wH+oK1kpH0R+d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOwFByiOS+1hPHEnh57xPKXkd3QaWjX33Dr8nD67IIsJnF3fp/T3EYyZFMeoq4QLfTMFD2A9DCqJFZ0cVkVc+FSffglua8GpPE7LLzbNGaFWqx+9N6Pq7Cy/eqcdhqY9GZtodj2P/claFHcudMMc2HO8rK5G2ejASZ4dm7SDZyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dW0rbjm7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771232558; x=1802768558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=74rH9qbbtUNAnbsKkVjmR80MePEL/wH+oK1kpH0R+d0=;
  b=dW0rbjm7KKmGxc9WaN/CKff/C1Ql0RKz5VyhYwB7RDMB+mTA8DjAKToH
   7EeHeTG2zxMwzjILbffha2+TtJla1xS0q5BiWnyQpmQn+Q+nWKvq/kg2q
   YBidya8+rdWhhWzVkxM3eX6iotgftGY+KGdwKCFXD59vD2MNLHz6g26zW
   RdgAsoel8EUys80acW0IooQGENI2noOuIMHXMg3BWldn/KAXqm3MVUbb5
   QoEUlPF7XPa+ok/g6TtAgBXUeW9eqUIl8jst2RdM18Ml8km+PFk56Zmlq
   lF9KZpaK24Zxb+R7ctYa7ASxaRum25UUpRFXVaTZRq8jhZalxUPaYgErO
   g==;
X-CSE-ConnectionGUID: zDAYNAcESFClP4yU9q1DOw==
X-CSE-MsgGUID: rAHqxEdYRqeqgL7Q8FFtVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="83409136"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="83409136"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 01:02:37 -0800
X-CSE-ConnectionGUID: OH16iJRmSjSVqXua/GfFtw==
X-CSE-MsgGUID: wRKnVeYUSQGhJm3zZxd9Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="218098060"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.203])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 01:02:31 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A916F121D2E;
	Mon, 16 Feb 2026 11:02:51 +0200 (EET)
Date: Mon, 16 Feb 2026 11:02:51 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v2 05/14] media: v4l2-subdev: Refactor returning routes
Message-ID: <aZLdO8k_qDd_3J5a@kekkonen.localdomain>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-6-sakari.ailus@linux.intel.com>
 <81e543df-a188-4c2b-a24a-b599b27b3954@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81e543df-a188-4c2b-a24a-b599b27b3954@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52845-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 9229B141CD5
X-Rspamd-Action: no action

Hi Mirela,

On Sun, Feb 15, 2026 at 04:39:58PM +0200, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 2/11/26 11:09, Sakari Ailus wrote:
> > Refactor returning the routes by adding a new function that essentially
> > does a memcopy and sets the number of the number of the routes in the
> Repetition "The number of the number"

Fixed for v3.

> > routing table.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   drivers/media/v4l2-core/v4l2-subdev.c | 40 +++++++++++++++------------
> >   1 file changed, 22 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index b2105c34478e..8a433d074587 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -629,6 +629,19 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
> >                               v4l2_subdev_get_unlocked_active_state(sd);
> >   }
> > 
> > +static void subdev_copy_fix_routes(struct v4l2_subdev_routing *routing,
> > +                                  const struct v4l2_subdev_route *src,
> > +                                  u32 copy_routes, u32 num_routes)
> > +{
> > +       struct v4l2_subdev_route *routes =
> > +               (struct v4l2_subdev_route *)(uintptr_t)routing->routes;
> > +
> > +       for (u32 i = 0; i < copy_routes; i++)
> > +               routes[i] = src[i];
> > +
> > +       routing->num_routes = num_routes;
> > +}
> 
> The function just copies routes, no fixing, so I agree with Jacopo's
> comment, subdev_copy_routes seems like a better name.
> 
> Clear names for src/dest sound better, and also address the case when
> copy_routes>num_routes, at the calling place it was
> min(state->routing.num_routes, routing->len_routes).

I agree. I'll also change the arguments to just include the routing struct
and the state -- all the callers already use these. How about calling it
copy_routes_state_to_routing()?

-- 
Regards,

Sakari Ailus

