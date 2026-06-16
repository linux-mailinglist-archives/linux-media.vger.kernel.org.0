Return-Path: <linux-media+bounces-65010-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8a6qBjdEMWrbfgUAu9opvQ
	(envelope-from <linux-media+bounces-65010-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 14:40:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D574B68F6F3
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 14:40:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=E2yVxo42;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65010-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65010-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AAD43252D98
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 12:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32501361DAE;
	Tue, 16 Jun 2026 12:35:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFEF3655E7;
	Tue, 16 Jun 2026 12:35:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613330; cv=none; b=KtDdnAjVl54OUKQTQ+t80Q0CVHyqgReBGwi3v+lKVpXDsJ44QGHgxC/zCIWEDaa6YXrldMgAT4Da+E8VD6XhUNFi4ZCQ1h8dMEe014gAZ6H5ogCWv70RviqPzkzCLZPFzwsohqPbPIVnuGaP0nEVoBAMAp4rnxySvPvUzg5uLu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613330; c=relaxed/simple;
	bh=RYLIqNBdvCgEZwg8Nx8bX+w7fFoQzuxayJSY7iegh8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XF5uZp7qyPkxWXpUXPRfwUXTKZHB0/TRK/Puu4+5q1Hvmk5JvNsv/hEPghU6Nro1XvbvEkutC5WllvjY30q9jLUZU6D++LJwNoo4cK1WbD2Y9CrxGYsMMB++Ol3BslU9NSVdYHaORQ4/xRcYKf5gXkBIvQXG/0sGsqGYrTqOI1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E2yVxo42; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53F371E6;
	Tue, 16 Jun 2026 14:34:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781613286;
	bh=RYLIqNBdvCgEZwg8Nx8bX+w7fFoQzuxayJSY7iegh8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E2yVxo42TJNUuC8juqMjzZgyAT4krIjWrRm0mMDQJc3Se76eBZPj6Um8ANBsM5Dpl
	 OBOcXTNml2Q+B3d1YLjDq7IMUDEotTCl6GGLeOQpga6cw487G7d93nnTaokYhLn1AJ
	 xjLwA+ef+CxCRwqhv8X4ckAtQVZFhOAwAirYXk4s=
Date: Tue, 16 Jun 2026 15:35:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v5 03/10] media: rcar-csi2: Move
 {enable|disable}_streams() calls
Message-ID: <20260616123518.GE2984510@killaraus.ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311-rcar-streams-v5-3-3e6c957d7567@ideasonboard.com>
 <20260318205435.GG716464@killaraus.ideasonboard.com>
 <20260404121906.GC1525575@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260404121906.GC1525575@ragnatech.se>
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
	TAGGED_FROM(0.00)[bounces-65010-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:tomi.valkeinen+renesas@ideasonboard.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mchehab+huawei@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,killaraus.ideasonboard.com:mid,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D574B68F6F3

On Sat, Apr 04, 2026 at 02:19:06PM +0200, Niklas Söderlund wrote:
> On 2026-03-18 22:54:35 +0200, Laurent Pinchart wrote:
> > On Wed, Mar 11, 2026 at 03:53:16PM +0200, Tomi Valkeinen wrote:
> > > With multiple streams the operation to enable the CSI-2 hardware and to
> > > call {enable|disable}_streams() on upstream subdev will need to be
> > > handled separately.
> > > 
> > > Prepare for that by moving {enable|disable}_streams() calls out from
> > > rcsi2_start() and rcsi2_stop().
> > > 
> > > On Gen3, a side effect of this change is that if the sink side devices
> > > call .enable_streams() on rcar-csi2 multiple times, the second call will
> > > fail. This is because we always use stream ID 0, so the second call
> > > would attempt to enable the same stream again, leading to an error. In
> > > other words, a normal single-stream setup continues to work, but trying
> > > to use the current driver's custom VC based routing will fail.
> > 
> > I assume this gets addressed later in the series.
> > 
> > > 
> > > On Gen4, this doesn't matter as the rcar-isp behaves in a similar way as
> > > described above, and thus rcar-csi2 will only get a single
> > > .enable_streams() call.
> > > 
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > ---
> > >  drivers/media/platform/renesas/rcar-csi2.c | 25 +++++++++++++++----------
> > >  1 file changed, 15 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> > > index 7305cc4a04cb..158fa447e668 100644
> > > --- a/drivers/media/platform/renesas/rcar-csi2.c
> > > +++ b/drivers/media/platform/renesas/rcar-csi2.c
> > > @@ -1822,20 +1822,12 @@ static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
> > >  		return ret;
> > >  	}
> > >  
> > > -	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
> > > -					 BIT_ULL(0));
> > > -	if (ret) {
> > > -		rcsi2_enter_standby(priv);
> > > -		return ret;
> > > -	}
> > > -
> > >  	return 0;
> > >  }
> > >  
> > >  static void rcsi2_stop(struct rcar_csi2 *priv)
> > >  {
> > >  	rcsi2_enter_standby(priv);
> > > -	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
> > >  }
> > >  
> > >  static int rcsi2_enable_streams(struct v4l2_subdev *sd,
> > > @@ -1857,6 +1849,14 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
> > >  			return ret;
> > >  	}
> > >  
> > > +	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
> > > +					 BIT_ULL(0));
> > > +	if (ret) {
> > > +		if (priv->stream_count == 0)
> > > +			rcsi2_stop(priv);
> > > +		return ret;
> > > +	}
> > > +
> > >  	priv->stream_count += 1;
> > >  
> > >  	return ret;
> > > @@ -1867,7 +1867,7 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
> > >  				 u32 source_pad, u64 source_streams_mask)
> > >  {
> > >  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > > -	int ret = 0;
> > > +	int ret;
> > >  
> > >  	if (source_streams_mask != 1)
> > >  		return -EINVAL;
> > > @@ -1878,9 +1878,14 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
> > >  	if (priv->stream_count == 1)
> > >  		rcsi2_stop(priv);
> > >  
> > > +	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
> > > +					  BIT_ULL(0));
> > > +	if (ret)
> > > +		return ret;
> > > +
> > >  	priv->stream_count -= 1;
> > >  
> > > -	return ret;
> > > +	return 0;
> > >  }
> > 
> > rcsi2_irq_thread() also calls rcsi2_stop(), followed by rcsi2_start().
> > This is to handle errors reported by the AFIFO_OF, ERRSOTHS and
> > ERRSOTSYNCHS interrupts. If the source isn't restarted, such an attempt
> > to recover from errors will likely fail. On the other hand, restarting
> > the source will likely not lead to great results either.
> > 
> > Error handling was introduced in
> > 
> > commit 4ab44ff0841b9a825f9875623d24809d29e37a10
> > Author: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Date:   Thu Apr 11 16:30:58 2019 -0400
> > 
> >     media: rcar-csi2: restart CSI-2 link if error is detected
> > 
> >     Restart the CSI-2 link if the CSI-2 receiver detects an error during
> >     reception. The driver did nothing when a link error happened and the
> >     data flow simply stopped without the user knowing why.
> > 
> >     Change the driver to try and recover from errors by restarting the link
> >     and informing the user that something is not right. For obvious reasons
> >     it's not possible to recover from all errors (video source disconnected
> >     for example) but in such cases the user is at least informed of the
> >     error and the same behavior of the stopped data flow is retained.
> > 
> > Niklas, do you recall anything about the errors you saw ?
> 
> IIRC, the spark for the work was a user report where the wish was to 
> handle detectable errors somehow instead of just silently fail. The 
> first try was this commit where the driver tries to recover. However as 
> you point out it might not be the optimal solution.
> 
> Instead I proposed a way to signal to user-space that there where a link 
> error and let it deal with it [1]. As seen on the date from that work it 
> kind of stalled. I still plan to resume that work once all the cleanups 
> of the R-Car VIN pipeline are done.

Handling it in userspace seems a good idea to me.

> 1.  https://lore.kernel.org/linux-renesas-soc/20211108160220.767586-1-niklas.soderlund%2Brenesas@ragnatech.se/
> 
> > >  
> > >  static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> > > 

-- 
Regards,

Laurent Pinchart

