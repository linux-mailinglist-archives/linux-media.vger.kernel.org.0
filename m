Return-Path: <linux-media+bounces-65036-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x7LOGXFYMWqRhQUAu9opvQ
	(envelope-from <linux-media+bounces-65036-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 16:06:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E415169039E
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 16:06:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=LpFOY4j6;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="l abfknG";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65036-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65036-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3472F3094B2B
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 14:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E0A364E84;
	Tue, 16 Jun 2026 14:04:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4A333439A;
	Tue, 16 Jun 2026 14:04:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618667; cv=none; b=XtYDoMjBiPSeGqF5zQM3Vpcp7BXJQP9/Wo1xb0n8tBxJDHk4OKWG3A/E9pRGmgNUbrpcfMwSanVsNp0XQYN4IVnJSijsL0/oQgVwEcAnSP9TfKBJkdB7sQZ3l2M076EWcGeeaDURyIllGVU1Ij4ZuLPEOWa9hZUzVByBVNsvPrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618667; c=relaxed/simple;
	bh=Yc744rPu5zGzedLPm1VjhijvEhXEF0iSnSBImHZGCpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUwakmdlQKP1PtH9OZwURfGVEnnT70ipQc5Yb7FxHC04ywJGQhIDV9uE9aM1WlRwSUvseuNGDYZWw6LDVB/XwZ9jTN630+Li/BZWQVcg+z+DKOkNTbIKI+5BVNLf8lYBdDtmDSRBeBcUtPfAW3DuHeNqNDrZb4y/4Nny18culCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LpFOY4j6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=labfknGt; arc=none smtp.client-ip=202.12.124.157
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1891D7A0068;
	Tue, 16 Jun 2026 10:04:24 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 16 Jun 2026 10:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781618663;
	 x=1781705063; bh=awi1HszaxPwgLDBr3bf3GtsRahxVef9DoqFTjvXMUbs=; b=
	LpFOY4j6A6qml0zbbDDzbuDwt80pTTWVMVz255fwfZu5jFSfsk7A6ifuTa4u+O+c
	RyI023DREe2Px6qqdCE1R1vXlYz1FaZa0pXVd/4oPxlj2OqFBNIAMW5vUBCeJbkQ
	HB2SgpizyHnQ7FN8gh0z/nX3YuJR/0x3kIovKezVXGwhTKiYADwaTmPUNARChvEh
	SsH1mim9GuoyGLTxlE9ki0J3wlOahMjqlswUnbda9PavmJdCmRzDlj9+zvkWsFkD
	6/rcgDwLBDP6ldl1Zq/v9j61rqt0rMnLrZ9j+9loXUiV9LkbN7ChYdOHaqqO49K4
	mEMPLNmChxJOW5J23haq7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781618663; x=
	1781705063; bh=awi1HszaxPwgLDBr3bf3GtsRahxVef9DoqFTjvXMUbs=; b=l
	abfknGtZEdoTgSS4FPOQbBUzgQ8sCPnO+wMxhZHuM3BPJV4BBSAkKQlgJiMjAmNG
	v6/DJ5StCMoZ5V8jcL+iNAxvhwhsjOqo1KXzSbd2Gpv2g39Gcj8KNTIl+H9vjIK6
	HxUlGaYDowWayweiI50FMzTxBFJPgUURKOlhGS9Rs2qmq3wlT86M6Oxy/cjDhQk5
	bX0zB4rwqsOUnfN6WDi1YKoGNSDA3cs1KE+4nxSiX71NkFkQ9aRDQmtk3CuK+GHB
	pWIC80PnL5BOvd3drGhViXmh29ZIQU+iYBVaUz5mVuL25rr/WJaLocFYiLq3MZQt
	RosTCJGV6D4ab5/y/uBsA==
X-ME-Sender: <xms:51cxapBr26aFCmoZ9oUSGH2hDust-FqXm1wMDBWIkzoOkppMTq766Q>
    <xme:51cxakETnK5zdP5icSZXqgthH1sOHv0ZOLSHtA9uLEqtCyOjuJjWrTomC58U44_7Q
    9cVopSz4xCfH2kPHEcg8LgvJ9TjZcwXcP2XSEQDG2-yQxQyREjO-Og>
X-ME-Received: <xmr:51cxapDRUiPOGrUuzGVegtB795xhnuKwofEAW006eBuEGPIA2ia6jhtpxGNz4tSzcc7swsjLdOwyba_D9-bX9YyiB0kv>
X-ME-Proxy-Cause: dmFkZTEND5SNe2LY4j+8YoEvW60HEN07SjPqUNO/KzD8YLKjttaM4STTAQ63L+ILKm8Djz
    MSAXlYpzrO/6WP6enibSpyytmRjibBsx5p4RVPDPTRAohmzFDmLO9veBUmox7lfCOo12YE
    tooy669B3nf5sCcrpu3KeCK7p2gTVghjIZh3feJSjfZIyUX7ofZEyIou8OMBLnWgHXeozQ
    /SReI/fhboe6VI77yzk/De5HJNY+kh8NS1M2V2/vGSvllnm8fLSMvhzjfJMZGLVLX/GF7i
    m/0+7/yMG8isUWZ8jvf08bnQpV8UX5M8cPa+PiScJ8CRsrx24/XqHShtDBcVNf3u7n4CL0
    UJDoMHDmEZN0GI8H6/KTqFor6WUR2BNgE5AFa7zoSSlU7DnuFpOFpUT1U589t+0vH67lHw
    jUN3Gj4vEmtFxMax9UV0eHsDaqnrH8TUo8Dahv+0f+9gqw7OlC/8ALBKSzEQe/ix6xylXU
    udKXTlaG/ZfNBeQyPwTtaDp8ebuoCyRDinIcCJMr6QAmLax7EnyRUkXn0CxTzHNCnui4LX
    ZbMZeWJT4SNfHyi4SMe1yUCNk4o289alRKW7nVd/GEeBLwvtl8XzZ8btfNktnvzqwXcK/x
    fN1Aqg77oG9ZuXmyIaOTTggv0+ShnXGcIw23nKjgcaykx5VwfXvPYOlxR/Iw
X-ME-Proxy: <xmx:51cxaqmbv7PqOizZ0EAiZFgFFtEO_iC_16A-vBzrEtOTIaOP9hYvDw>
    <xmx:51cxavP0WBhgdF9iIDFXzDdX3l7RdJH5Vh5_hwNoj80UQ06agQqjJQ>
    <xmx:51cxav8U-axL2gPI32fORvg9NDowXIVsohyjnEJl_6jBZE9A3IlbYQ>
    <xmx:51cxapFzv38eKzFOxLjiC7lhy4R7JVeTRDrTuF704tdPQs4ZTPFMSw>
    <xmx:51cxake4F2Bd-1HFymgd2WMwg8PK2Ypt0QArZEFq2UjJUJNkvewI7jTR>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 10:04:22 -0400 (EDT)
Date: Tue, 16 Jun 2026 16:04:20 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v5 03/10] media: rcar-csi2: Move
 {enable|disable}_streams() calls
Message-ID: <20260616140420.GA1662668@fsdn.se>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311-rcar-streams-v5-3-3e6c957d7567@ideasonboard.com>
 <20260318205435.GG716464@killaraus.ideasonboard.com>
 <e0ad4d15-2cf9-45a5-9312-fac297119ad4@ideasonboard.com>
 <20260616123419.GD2984510@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260616123419.GD2984510@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65036-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mchehab+huawei@kernel.org,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:from_mime,fsdn.se:mid,messagingengine.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E415169039E

On 2026-06-16 15:34:19 +0300, Laurent Pinchart wrote:
> On Tue, Jun 16, 2026 at 02:20:06PM +0300, Tomi Valkeinen wrote:
> > On 18/03/2026 22:54, Laurent Pinchart wrote:
> > > On Wed, Mar 11, 2026 at 03:53:16PM +0200, Tomi Valkeinen wrote:
> > >> With multiple streams the operation to enable the CSI-2 hardware and to
> > >> call {enable|disable}_streams() on upstream subdev will need to be
> > >> handled separately.
> > >>
> > >> Prepare for that by moving {enable|disable}_streams() calls out from
> > >> rcsi2_start() and rcsi2_stop().
> > >>
> > >> On Gen3, a side effect of this change is that if the sink side devices
> > >> call .enable_streams() on rcar-csi2 multiple times, the second call will
> > >> fail. This is because we always use stream ID 0, so the second call
> > >> would attempt to enable the same stream again, leading to an error. In
> > >> other words, a normal single-stream setup continues to work, but trying
> > >> to use the current driver's custom VC based routing will fail.
> > > 
> > > I assume this gets addressed later in the series.
> > 
> > Yes and no.
> > 
> > The previous patch does the same for rcar-isp, which affects the gen4 
> > custom VC based routing the same was this does for gen3.
> > 
> > At the end of the series we support full multi-stream with the upstream 
> > API. The custom VC based routing is no longer supported, and will 
> > continue to fail.
> > 
> > >>
> > >> On Gen4, this doesn't matter as the rcar-isp behaves in a similar way as
> > >> described above, and thus rcar-csi2 will only get a single
> > >> .enable_streams() call.
> > >>
> > >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > >> ---
> > >>   drivers/media/platform/renesas/rcar-csi2.c | 25 +++++++++++++++----------
> > >>   1 file changed, 15 insertions(+), 10 deletions(-)
> > >>
> > >> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> > >> index 7305cc4a04cb..158fa447e668 100644
> > >> --- a/drivers/media/platform/renesas/rcar-csi2.c
> > >> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> > >> @@ -1822,20 +1822,12 @@ static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
> > >>   		return ret;
> > >>   	}
> > >>   
> > >> -	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
> > >> -					 BIT_ULL(0));
> > >> -	if (ret) {
> > >> -		rcsi2_enter_standby(priv);
> > >> -		return ret;
> > >> -	}
> > >> -
> > >>   	return 0;
> > >>   }
> > >>   
> > >>   static void rcsi2_stop(struct rcar_csi2 *priv)
> > >>   {
> > >>   	rcsi2_enter_standby(priv);
> > >> -	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
> > >>   }
> > >>   
> > >>   static int rcsi2_enable_streams(struct v4l2_subdev *sd,
> > >> @@ -1857,6 +1849,14 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
> > >>   			return ret;
> > >>   	}
> > >>   
> > >> +	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
> > >> +					 BIT_ULL(0));
> > >> +	if (ret) {
> > >> +		if (priv->stream_count == 0)
> > >> +			rcsi2_stop(priv);
> > >> +		return ret;
> > >> +	}
> > >> +
> > >>   	priv->stream_count += 1;
> > >>   
> > >>   	return ret;
> > >> @@ -1867,7 +1867,7 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
> > >>   				 u32 source_pad, u64 source_streams_mask)
> > >>   {
> > >>   	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > >> -	int ret = 0;
> > >> +	int ret;
> > >>   
> > >>   	if (source_streams_mask != 1)
> > >>   		return -EINVAL;
> > >> @@ -1878,9 +1878,14 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
> > >>   	if (priv->stream_count == 1)
> > >>   		rcsi2_stop(priv);
> > >>   
> > >> +	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
> > >> +					  BIT_ULL(0));
> > >> +	if (ret)
> > >> +		return ret;
> > >> +
> > >>   	priv->stream_count -= 1;
> > >>   
> > >> -	return ret;
> > >> +	return 0;
> > >>   }
> > > 
> > > rcsi2_irq_thread() also calls rcsi2_stop(), followed by rcsi2_start().
> > > This is to handle errors reported by the AFIFO_OF, ERRSOTHS and
> > > ERRSOTSYNCHS interrupts. If the source isn't restarted, such an attempt
> > > to recover from errors will likely fail. On the other hand, restarting
> > > the source will likely not lead to great results either.
> > 
> > Indeed. I think for single-stream use cases the behavior should still be 
> > the same, but for multi-stream use, any enabled stream will keep the 
> > csi2 enabled.
> > 
> > This kind of error handling sounds a bit fragile. If a restart helps, 
> > don't we need to restart the whole pipeline, not just from csi2-rx 
> > upwards? Or is it guaranteed that the ISP/CS and VIN will continue working?
> 
> My feeling is that these kind of errors would be best handled in
> userspace.

I agree this should be handled in user-space. But since we have (or at 
least did not when this was added) no way to signal to user-space that 
an error have occurred and that action is needed this at least solved 
the error reported by the user.

If we think this is should be dropped and somehow signal user-space that 
action is needed that is OK for me. But then please remove all of it.

> 
> > Did this work earlier with the custom VC based routing?
> 
> That I don't know.

It did. At least for the only way I had to create the error condition by 
"hot plugging" the CVBS input IIRC.

> 
> > > Error handling was introduced in
> > > 
> > > commit 4ab44ff0841b9a825f9875623d24809d29e37a10
> > > Author: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > Date:   Thu Apr 11 16:30:58 2019 -0400
> > > 
> > >      media: rcar-csi2: restart CSI-2 link if error is detected
> > > 
> > >      Restart the CSI-2 link if the CSI-2 receiver detects an error during
> > >      reception. The driver did nothing when a link error happened and the
> > >      data flow simply stopped without the user knowing why.
> > > 
> > >      Change the driver to try and recover from errors by restarting the link
> > >      and informing the user that something is not right. For obvious reasons
> > >      it's not possible to recover from all errors (video source disconnected
> > >      for example) but in such cases the user is at least informed of the
> > >      error and the same behavior of the stopped data flow is retained.
> > > 
> > > Niklas, do you recall anything about the errors you saw ?
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

