Return-Path: <linux-media+bounces-58918-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNc1B8/y4GkZnwAAu9opvQ
	(envelope-from <linux-media+bounces-58918-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:31:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8296040F967
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 880D93048EEB
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 14:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D1D32AABC;
	Thu, 16 Apr 2026 14:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fsuxKiek"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31980217F27
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 14:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349878; cv=none; b=b6Rcg0lU/DUsRIyI5TwgeEkZ55R3i3wgVTDuDKxcT1KpYNBRYlwiBsLMvxCr68BuQ5j80q4CUM8JhCFg9k0+EHhJNpXUsv/PsXwhYQOMmj4327A0esgMMJP5GvMFp19zFXU5/TpZQAvGjRRNG3j/p4PcagW3buGWeP8+pJisILo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349878; c=relaxed/simple;
	bh=ADkjxbgT7XOj4gw5+x8AdSiRM9/+0fi+ecmRvPRlq80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8mJpbYb61sXiZUH4miqw5IGsY1fH47vHtNvzS6i4FVrUhKtMDuCrjEf+wLKM+DUxMTHht2PL126hmNNwC6GITpDkRI6QyzAY1zLC8cYc8mltHP2LNSBALUfmxBSOZSZXWJc+QJ5FEn6bn6moFDVWqtpA6hB//nUrQbmswmHlsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fsuxKiek; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C9788132;
	Thu, 16 Apr 2026 16:29:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776349780;
	bh=ADkjxbgT7XOj4gw5+x8AdSiRM9/+0fi+ecmRvPRlq80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fsuxKiekfaglNk9cwhFtsY2PtneHTBjl/kx3QX4KFN0zzzgyIsEHklnG+21yKsNEz
	 qiCbNG2+BO0tTJMh9i0Hwafok+pc1sLKpAX1FgbHSyLU86vivztqkM+hyTJJqqwOL+
	 8uvHOvUlEfi7HSHiwWNCrORUxaRv5ARqEXH6neXo=
Date: Thu, 16 Apr 2026 17:31:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
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
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
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
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 20/29] media: uapi: Bump the STREAMS bit a little
Message-ID: <20260416143112.GL1775831@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-21-sakari.ailus@linux.intel.com>
 <adjDJdB6rBscZ-lZ@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adjDJdB6rBscZ-lZ@zed>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58918-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,kernel.org,ti.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,intel.com:email]
X-Rspamd-Queue-Id: 8296040F967
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 11:31:06AM +0200, Jacopo Mondi wrote:
> On Wed, Apr 08, 2026 at 06:39:29PM +0300, Sakari Ailus wrote:
> > Bump the V4L2_SUBDEV_CAP_STREAMS by one bit up, order to avoid confusing
> > libcamera with streams that has moved forward from the original libcamera
> > implementation. The bit can presumably be taken into use but only after
> > the other free bits.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Thanks!
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> > ---
> >  include/uapi/linux/v4l2-subdev.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > index 2347e266cf75..6160c3e21436 100644
> > --- a/include/uapi/linux/v4l2-subdev.h
> > +++ b/include/uapi/linux/v4l2-subdev.h
> > @@ -196,8 +196,11 @@ struct v4l2_subdev_capability {
> >  /* The v4l2 sub-device video device node is registered in read-only mode. */
> >  #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
> >
> > +/* Reserved, old STREAMS bit libcamera used before API stabilisation. */
> > +/* #define V4L2_SUBDEV_CAP_STREAMS_PRELIMINARY	0x00000002 */
> 
> This should make sure libcamera versions which support the new flag
> won't match agains older kernel which use the old value!

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Could we delay merging this patch until we work on implementing the new
behaviour in libcamera ?

> > +
> >  /* The v4l2 sub-device supports routing and multiplexed streams. */
> > -#define V4L2_SUBDEV_CAP_STREAMS			0x00000002
> > +#define V4L2_SUBDEV_CAP_STREAMS			0x00000004
> >
> >  /*
> >   * Is the route active? An active route will start when streaming is enabled

-- 
Regards,

Laurent Pinchart

