Return-Path: <linux-media+bounces-58052-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKSrFP0B0WmNDQcAu9opvQ
	(envelope-from <linux-media+bounces-58052-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 14:20:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9E339B0E1
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 14:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18AAA3019F1A
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2026 12:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DE128643C;
	Sat,  4 Apr 2026 12:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Zs+wMqij";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SF5A3+mw"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620A031D375;
	Sat,  4 Apr 2026 12:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775305151; cv=none; b=HtcBsqvvyhIlibA3SMOBhNRjXVzYuxXcsoPKL7i0xfkBkvDDTrhoRrIzQn7ASof78ea8weZT1SZkZHniN0mgo1rqM95LliUJvMZlvgs5hNxn7hppgzc9Jd0HdHd9Yx1ei0TlYDzqUu/hu9UJ6NxVBFxqvzoMeSEDvL1KTq4ki0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775305151; c=relaxed/simple;
	bh=CUoDV3D4pecN8JpS1jYQXTLdWt27VjZSEFy/TaFLSjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cc1CWe6qWhvD4nMtR15lGvLcRAkqqc0jpoFEBY7AKmOTf1HSK5cvxUbCny/cAa4TMqsWXA/oEU9Q8Z64+xLH2Ke/GCs8+IQOdueQTBvugTgyiyIzD21Jv7cLjbZpxfX5AYS07hUhtOGR2iiwHl5m8y3XlEzM1JaANoMeY2mRNMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Zs+wMqij; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SF5A3+mw; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 40ED17A00F0;
	Sat,  4 Apr 2026 08:19:08 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 04 Apr 2026 08:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775305148;
	 x=1775391548; bh=zzlZkYd5f93opKbHaL40VhxjqUFHsu3Z2dk21eQ1Mjg=; b=
	Zs+wMqijyZj6DKwc2gWs3KhJht1wOkfTF+2HwiqlOCRbjsTBtMzcKecc+9LJlcEr
	Wv51dirJUja3pasIhl9lF3djGbF7YTVPIzznLTRt26PkY7Erwo97AWfFFCB1Gdf8
	31Q5ghQxrjdfDqJb8mkteffFGPGcy02Rgm1ZuUADDn3xtPu1DoYjW9NHzrIZrgV3
	d4VG7SasOeF1nkdSDRTHNjmoToF7/ppLcf0Q6u2Fi0TUQWrPP0hTnDah4Xuyh5+V
	LiAgls2T61SMeSN3Y6TUHjyGQhSMiWsamSYNabruUPINEznczh3S2H2ta7aG+Qcv
	ZXSzeFWYr32HFTgwaUbwuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775305148; x=
	1775391548; bh=zzlZkYd5f93opKbHaL40VhxjqUFHsu3Z2dk21eQ1Mjg=; b=S
	F5A3+mwSsBkYF6WHSz5OFZOjLXVvS6cQzpf0j6QtZJ+Myyx93PYeA8JRipKSfZjp
	tf3pVF0t+TysChlE85DrXuPzBz2gKmCb2CcDphUWQ1Mv1qy0RJCs/N6gfLLoXOhT
	kwT5tugog0dUZgNXLWezV4A7GDiVCAsGDwCx4NxOglHeQb7bZjvn1+J+wknzyX/c
	GsKy7zqCd2KDb74hVMYo6z8s5otnWwpLW8qgZlrvRUeTyekhltAgfmt/5SoyMZr2
	bh+bZzV6Nx97thFR5elvoZDduxokueSia4PtmEobcRLxC0zRoR9qrTE4gyeA6L8U
	h2zgMIloYNtvoZf+UlzVA==
X-ME-Sender: <xms:uwHRaYciZZ5LSvCXSVsk6DfobVWFKbhFiI_284GJckb9pj02qrMm1A>
    <xme:uwHRaWzkVKxtCJCio5iNYZ0syOU1FVN6AiHzQnb6W1X-FvRlLICCiivyuNMkGE3Uz
    aLYzJSfbUxjVW6zirYfchrxZ6aYEom-ojJoSngQIXKEr9RuxUzmSCI_>
X-ME-Received: <xmr:uwHRad-ClFQq0pwf7TbpNMiV9geSVAUNKL_JrzFam82HgTVwzANpasx8jcI9C0AwaHWXO3IkhIX6mCXE1SwMjZMdJFVWUPdeTEKF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepffdtgeefveefgfeutdevveelgfelkeeu
    vdefgefgfeehfeeijeehudelhfejkefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
    lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
    hopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlrghurhgvnhhtrdhpihhn
    tghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepthhomhhird
    hvrghlkhgvihhnvghnodhrvghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdp
    rhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrg
    hkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehl
    ihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehmtghhvghhrggsodhhuhgrfigviheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:uwHRaUwU2ag27fBnakxDZ8B5k13yl31FpC5tQYndKhsqd529JaRHeA>
    <xmx:vAHRaVrE1-bl95s7tBby6umBSMCFnjDhOHYFxmpPMwglT2-hnq5AZA>
    <xmx:vAHRadrtQQwW8m_FdjElottRURoqSviFSw-S--kTm4_nlmA37qv5aQ>
    <xmx:vAHRadCKfFhEJLQm1dJwbL7oYAMZjag1Fsk2OR5CcbALm-Bws7vHvQ>
    <xmx:vAHRaRJeYI8KPXufyx8YtYWakRd6fS3mqrJOfoEp5n4MuD7DqA7RI8HX>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Apr 2026 08:19:07 -0400 (EDT)
Date: Sat, 4 Apr 2026 14:19:06 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v5 03/10] media: rcar-csi2: Move
 {enable|disable}_streams() calls
Message-ID: <20260404121906.GC1525575@ragnatech.se>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311-rcar-streams-v5-3-3e6c957d7567@ideasonboard.com>
 <20260318205435.GG716464@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318205435.GG716464@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-58052-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9E9E339B0E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

On 2026-03-18 22:54:35 +0200, Laurent Pinchart wrote:
> On Wed, Mar 11, 2026 at 03:53:16PM +0200, Tomi Valkeinen wrote:
> > With multiple streams the operation to enable the CSI-2 hardware and to
> > call {enable|disable}_streams() on upstream subdev will need to be
> > handled separately.
> > 
> > Prepare for that by moving {enable|disable}_streams() calls out from
> > rcsi2_start() and rcsi2_stop().
> > 
> > On Gen3, a side effect of this change is that if the sink side devices
> > call .enable_streams() on rcar-csi2 multiple times, the second call will
> > fail. This is because we always use stream ID 0, so the second call
> > would attempt to enable the same stream again, leading to an error. In
> > other words, a normal single-stream setup continues to work, but trying
> > to use the current driver's custom VC based routing will fail.
> 
> I assume this gets addressed later in the series.
> 
> > 
> > On Gen4, this doesn't matter as the rcar-isp behaves in a similar way as
> > described above, and thus rcar-csi2 will only get a single
> > .enable_streams() call.
> > 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/rcar-csi2.c | 25 +++++++++++++++----------
> >  1 file changed, 15 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> > index 7305cc4a04cb..158fa447e668 100644
> > --- a/drivers/media/platform/renesas/rcar-csi2.c
> > +++ b/drivers/media/platform/renesas/rcar-csi2.c
> > @@ -1822,20 +1822,12 @@ static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
> >  		return ret;
> >  	}
> >  
> > -	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
> > -					 BIT_ULL(0));
> > -	if (ret) {
> > -		rcsi2_enter_standby(priv);
> > -		return ret;
> > -	}
> > -
> >  	return 0;
> >  }
> >  
> >  static void rcsi2_stop(struct rcar_csi2 *priv)
> >  {
> >  	rcsi2_enter_standby(priv);
> > -	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
> >  }
> >  
> >  static int rcsi2_enable_streams(struct v4l2_subdev *sd,
> > @@ -1857,6 +1849,14 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
> >  			return ret;
> >  	}
> >  
> > +	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
> > +					 BIT_ULL(0));
> > +	if (ret) {
> > +		if (priv->stream_count == 0)
> > +			rcsi2_stop(priv);
> > +		return ret;
> > +	}
> > +
> >  	priv->stream_count += 1;
> >  
> >  	return ret;
> > @@ -1867,7 +1867,7 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
> >  				 u32 source_pad, u64 source_streams_mask)
> >  {
> >  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > -	int ret = 0;
> > +	int ret;
> >  
> >  	if (source_streams_mask != 1)
> >  		return -EINVAL;
> > @@ -1878,9 +1878,14 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
> >  	if (priv->stream_count == 1)
> >  		rcsi2_stop(priv);
> >  
> > +	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
> > +					  BIT_ULL(0));
> > +	if (ret)
> > +		return ret;
> > +
> >  	priv->stream_count -= 1;
> >  
> > -	return ret;
> > +	return 0;
> >  }
> 
> rcsi2_irq_thread() also calls rcsi2_stop(), followed by rcsi2_start().
> This is to handle errors reported by the AFIFO_OF, ERRSOTHS and
> ERRSOTSYNCHS interrupts. If the source isn't restarted, such an attempt
> to recover from errors will likely fail. On the other hand, restarting
> the source will likely not lead to great results either.
> 
> Error handling was introduced in
> 
> commit 4ab44ff0841b9a825f9875623d24809d29e37a10
> Author: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Date:   Thu Apr 11 16:30:58 2019 -0400
> 
>     media: rcar-csi2: restart CSI-2 link if error is detected
> 
>     Restart the CSI-2 link if the CSI-2 receiver detects an error during
>     reception. The driver did nothing when a link error happened and the
>     data flow simply stopped without the user knowing why.
> 
>     Change the driver to try and recover from errors by restarting the link
>     and informing the user that something is not right. For obvious reasons
>     it's not possible to recover from all errors (video source disconnected
>     for example) but in such cases the user is at least informed of the
>     error and the same behavior of the stopped data flow is retained.
> 
> Niklas, do you recall anything about the errors you saw ?

IIRC, the spark for the work was a user report where the wish was to 
handle detectable errors somehow instead of just silently fail. The 
first try was this commit where the driver tries to recover. However as 
you point out it might not be the optimal solution.

Instead I proposed a way to signal to user-space that there where a link 
error and let it deal with it [1]. As seen on the date from that work it 
kind of stalled. I still plan to resume that work once all the cleanups 
of the R-Car VIN pipeline are done.

1.  https://lore.kernel.org/linux-renesas-soc/20211108160220.767586-1-niklas.soderlund%2Brenesas@ragnatech.se/

> 
> >  
> >  static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> > 
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

