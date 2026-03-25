Return-Path: <linux-media+bounces-57078-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJ20D4QNxGk+vgQAu9opvQ
	(envelope-from <linux-media+bounces-57078-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 17:29:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB7332905E
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 17:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3527930EB42E
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F5F3EC2E4;
	Wed, 25 Mar 2026 16:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="h2Y25zyt"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230163EF0DC
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455249; cv=pass; b=JrchHACrlxbaomzFHmKAlALA19XIyPsnIEaKr76lwP/KoBW3vc9r+8oZIfxdPeT0xlJFjq0xkGV8z43GPXLa+XJpnGl+bz5lEBwKIDdby/+sXm6BwMe0XNfmBC/WGPgnII4VzDSZXI9JDlL3CVUv3rnfIVUoKcOVluqQwQ1CFDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455249; c=relaxed/simple;
	bh=ruFDVf8Hn3O677MrfSWUhTReeW9uJTkUlohfsEYxs2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEX1xMXrFCRLAOK1R2CN9BTvPVWXUoLTX19nBzmlnnAmMhVbqSgqHjiyh+HdTJ/NbyaumtymCT9KIi+rseisrZPE03JT47YR/6uIr3Ze9PEnm26/Bec3BjfuJDK4Wtf8nplKHkkVnwYPYGfmdjfYv/V2bXTxJFAogNlt4oK5MBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=h2Y25zyt; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fgsR8353yz49Q3d;
	Wed, 25 Mar 2026 18:13:56 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1774455236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wNeY0/WjbZoT1LPs4bT6dz6A0uPpqsvETEUyxyldq6Q=;
	b=h2Y25zyt2LTkVOfIF4DEADv1OX8RWXGoU93nnrQD4EcDQDj99gZef4LzsvLZSzRy2vJkK/
	32LEsCy0nl8HfQwaTqaP09lbcl1rLu1CstMs4zbnliqHRYBm2bIMsgv9z+FXRbQZzle6Z0
	yZs2pLMYJDOYjY/K2AI88bw3B4+PBImVsRIbmO7PoezDANtVRj9J/22MjHff1ILB0vuav7
	3VCD6r2+ViLhZjwVzB8OJ0EBa5GeiUaN+75B5kPHH0KNTycHe1RK9hCzfhEZ0cw1fLu+C+
	Sldmin6kUKJSt2gNGfLpL3fnvVZ+ETx2elzK4w7QR25/uUZ/b4FA0mc3g0jWxw==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1774455236;
	b=WnrLAgKOyzUatHaBio/8Z/2bK2+7Urhd0J6Zxeo8ueq4fRulgDjxM0iC0CvTjUlfvC69wK
	8dx58Wh7C8+ZEd1S0adcU5RxFzwbRtEHER+gJSRpvCUf+WyKZtMTZcwUr/WogBq9h118lF
	9flReSPzHBVlSdLCJh+23skGSOQyeplSLWfBkd20BfNHz3eCUmOB4lG/wXzTWQhUhfl8KQ
	qUDgq6BjRT7uxzD4ja7ZWgNhcILkrrPHaJJuQL2TzQQmsv1cb0AKGGKCgd4I1mU40yey17
	1fFhkGG6Cb4Lcpob9u4eMO3qQt7T5RJqsAT0m1iUewiK9BTtLl5uxjZEUFxXXQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1774455236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wNeY0/WjbZoT1LPs4bT6dz6A0uPpqsvETEUyxyldq6Q=;
	b=R/k0ia+1QEmOifPCOD/MOSxrXoZjenltJ+VD/qtUFjPhkPdmCTwkLoUyEZlGP2WiGRaszt
	VaBUsUpt9kgl3p66E0hARFPSW4+T1dgrgBdud3eCoXFpqdS+N+5LDvFYFn5Sy0B7SNtZ9H
	Ha2bUessxuo90cxRyra+9im9XE5MEJBP4J9/zpXQm/CG4h3AspNL+bIfhc96O8anslLlfP
	KumrYdBJqSZV8B696u2Dp7yCK4Tepj/iXhjT8mmoKNyxX56iV7wn4Y6d8ikCvtPrCL63jg
	y8vhCeURGHsId6k51+5E9biBqqG6ktSNF+/PtFrQrP9KX2YtS/y64JkCnm0ztQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7B522634C4E;
	Wed, 25 Mar 2026 18:13:55 +0200 (EET)
Date: Wed, 25 Mar 2026 18:13:55 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, David Heidelberg <david@ixit.cz>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 1/1] media: v4l2-subdev: Fail {enable,disable}_streams
 and s_streaming nicely
Message-ID: <acQJw3vY0W2zTqLl@valkosipuli.retiisi.eu>
References: <20260323105655.743792-1-sakari.ailus@linux.intel.com>
 <20260323111042.GC1514659@killaraus.ideasonboard.com>
 <acEnjvwjW0QNu_1u@kekkonen.localdomain>
 <20260325140735.GA2540687@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325140735.GA2540687@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57078-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,iki.fi:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,valkosipuli.retiisi.eu:mid]
X-Rspamd-Queue-Id: 9EB7332905E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Wed, Mar 25, 2026 at 04:07:35PM +0200, Laurent Pinchart wrote:
> On Mon, Mar 23, 2026 at 01:44:14PM +0200, Sakari Ailus wrote:
> > On Mon, Mar 23, 2026 at 01:10:42PM +0200, Laurent Pinchart wrote:
> > > On Mon, Mar 23, 2026 at 12:56:55PM +0200, Sakari Ailus wrote:
> > > > If a sub-device does not set enable_streams() and disable_streams() pad
> > > > ops while it sets the s_stream() video op to
> > > > v4l2_subdev_s_stream_helper(), enabling or disabling streaming either way
> > > > on the sub-device will result calling v4l2_subdev_s_stream_helper() and
> > > > v4l2_subdev_{enable,disable}_streams() recursively, exhausting the stack.
> > > > Return -ENOIOCTLCMD in this case to handle the situation gracefully.
> > > 
> > > This is not a valid use case, right ? Can we WARN() ?
> > 
> > Partly yes, and partly it requires a driver bug.
> > 
> > The CCS driver soon will differentiate its ops for source (scaler/binner
> > and CSI-2 receiver) sub-device, but only pad ops, not video ops. This means
> > that on non-source sub-devices the s_stream pad op is set to
> > v4l2_subdev_s_stream_helper() while {enable,disable}_streams() pad ops are
> > NULL.
> > 
> > It also takes a bug in the camss driver to trigger this -- it enables
> > streaming on all sub-devices of the pipeline instead of the next upstream
> > sub-device. That bug should be fixed but it's a separate issue.
> 
> Sounds like a candidate for a WARN() then, doesn't it ?

I'll add WARN_ON_ONCE() for using v4l2_subdev_s_straem_helper() without
both {enable,disable}_streams()_ in v3. I came to think also that this
check can be moved to the helper where I think it'll look nicer.

> 
> > > > Reported-by: David Heidelberg <david@ixit.cz>
> > > > Fixes: b62949ddaa52 ("media: subdev: Support single-stream case in v4l2_subdev_enable/disable_streams()")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > > since v1:
> > > > 
> > > > - Better patch description.
> > > > 
> > > >  drivers/media/v4l2-core/v4l2-subdev.c | 16 ++++++++++------
> > > >  1 file changed, 10 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > index 831c69c958b8..f8ea4afc6cbb 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > @@ -2334,11 +2334,13 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
> > > >  
> > > >  	/* Fallback on .s_stream() if .enable_streams() isn't available. */
> > > >  	use_s_stream = !v4l2_subdev_has_op(sd, pad, enable_streams);
> > > > -
> > > > -	if (!use_s_stream)
> > > > +	if (!use_s_stream) {
> > > >  		state = v4l2_subdev_lock_and_get_active_state(sd);
> > > > -	else
> > > > +	} else {
> > > > +		if (!v4l2_subdev_has_op(sd, video, s_stream))
> > > > +			return -ENOIOCTLCMD;
> > > >  		state = NULL;
> > > > +	}
> > > >  
> > > >  	/*
> > > >  	 * Verify that the requested streams exist and that they are not
> > > > @@ -2435,11 +2437,13 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
> > > >  
> > > >  	/* Fallback on .s_stream() if .disable_streams() isn't available. */
> > > >  	use_s_stream = !v4l2_subdev_has_op(sd, pad, disable_streams);
> > > > -
> > > > -	if (!use_s_stream)
> > > > +	if (!use_s_stream) {
> > > >  		state = v4l2_subdev_lock_and_get_active_state(sd);
> > > > -	else
> > > > +	} else {
> > > > +		if (!v4l2_subdev_has_op(sd, video, s_stream))
> > > > +			return -ENOIOCTLCMD;
> > > >  		state = NULL;
> > > > +	}
> > > >  
> > > >  	/*
> > > >  	 * Verify that the requested streams exist and that they are not
> 

-- 
Regards,

Sakari Ailus

