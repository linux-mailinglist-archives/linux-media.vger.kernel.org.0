Return-Path: <linux-media+bounces-67184-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j+uHE2+0T2oqnAIAu9opvQ
	(envelope-from <linux-media+bounces-67184-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 16:47:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF53273271A
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 16:47:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Da1byGJv;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67184-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67184-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48B723093A58
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 14:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE193822AF;
	Thu,  9 Jul 2026 14:40:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1AB37C108;
	Thu,  9 Jul 2026 14:40:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608037; cv=none; b=GoJd7+ybEMgx8AyLXvqBgI8MJXPcQ24nahV+BB9ebcCqCPzFTUcucO1t0fHSheo3897jE4bPO3i/8wImDA7Oah9dPWWyt15eidfFSUWVE+0Dm5439/QMqDqNXOunEad5hnkx8WUEv2TdfcuAn5ZR75hm3Wa/3XPOn5tq6GTNVaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608037; c=relaxed/simple;
	bh=wOryu9bOlXkfcGFTqIdYuo6ZOjPMPBW7I48AaDzKrMw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NaVIuJ2O2BKgB2Rl5xKFBNiaCulxQyVkoI6aHF+Cf4dIv9bKL15JQqOrdvFTvYsYGGY5BF2x1UFq9SsXov1r3s26eSJqnkS2zZVHeiTsDTCQ38RybxjlX3yOJpN7kB3cYxrK9WvQuIy6pP4CZEOtMtqmsNrM4sXTMgVg6dxlduk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Da1byGJv; arc=none smtp.client-ip=80.241.56.152
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gwyLS0w62zKvv5;
	Thu, 09 Jul 2026 16:40:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783608032; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Us4i0EClV17VoI3xSHO9uPSPfOz4YLVko1c5vUD12U=;
	b=Da1byGJvIac+rMpvYyoTFrnqzJFLvjp8MY2RnKvfh1WexIp9bZPmMPYL2/1IzzAGoyTin5
	EHmSmyUWIAjlbz+wg0OK7mev1AFxC8YaoXVq0iCFsWfvw9/lOH7X3PjchYwmLpybBSfExw
	TdyUbqZF7ChxJmV9XBvcMbOH40WKaDs9bNu/2aib8NBxnx3tIShtvIkDpnq8g3qVWe1UNd
	EO3e9z3/8+F8mj9hTGz58j/9hbWhFWa/UfQ66myxm+VjF6A8yPEHsSKXsjMTRWZcC17Mop
	HiT54nLb1lI4quEvOyF8JV3rjioEylXUowMXnpe1lJ6P44fQ5W41/3aIqcN7CQ==
Message-ID: <b39f29efd4db9a2e10c6d1943a22b826cc5232f8.camel@mailbox.org>
Subject: Re: [PATCH v2 1/2] drm/drm_crtc: ensure dma_fence_ops remain valid
 during device unbind
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, 
	phasta@kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,  Simona Vetter
 <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  Boris Brezillon
 <boris.brezillon@collabora.com>, Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com
Date: Thu, 09 Jul 2026 16:40:21 +0200
In-Reply-To: <899942cc84af7a82a35b4ca34b486c40327fd543.camel@linaro.org>
References: <20260708-linux-drm_crtc_fix2-v2-0-cf72be75d75a@linaro.org>
			 <20260708-linux-drm_crtc_fix2-v2-1-cf72be75d75a@linaro.org>
		 <1ccfc0b5d1696a8dec4756b675294e7fb41ab5ff.camel@mailbox.org>
	 <899942cc84af7a82a35b4ca34b486c40327fd543.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 95704fdbfc9f316a69c
X-MBO-RS-META: rumx4tzpbxmq6iy6zzabge49b7qs8rfp
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andre.draszik@linaro.org,m:phasta@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,collabora.com];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-67184-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:email,sashiko.dev:url,mailbox.org:from_mime,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF53273271A

On Thu, 2026-07-09 at 15:19 +0100, Andr=C3=A9 Draszik wrote:
> Hi Philipp,
>=20
> On Thu, 2026-07-09 at 14:32 +0200, Philipp Stanner wrote:
> > +Cc Danilo (who is currently concerned with drm_device life times)
> >=20
> > On Wed, 2026-07-08 at 16:22 +0100, Andr=C3=A9 Draszik wrote:
> > >=20
> >=20
> > [=E2=80=A6]
> >=20
> > > Link: https://sashiko.dev/#/patchset/20260618-linux-drm_crtc_fix2-v1-=
1-c03e77b36f34@linaro.org?part=3D1
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > I am tempted to think that this also needs a Fixes and needs to be
> > backported into stable kernels, doesn't it? Especially if the BUG_ON
> > disappears in stable kernels.
>=20
> Good point, thanks. I forgot to add this in and will try to find a reason=
able
> commit to relate to.
>=20
> >=20
> > > ---
> > > =C2=A0drivers/gpu/drm/drm_crtc.c | 6 ++++++
> > > =C2=A01 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> > > index 63ead8ba6756..d55f1377ec36 100644
> > > --- a/drivers/gpu/drm/drm_crtc.c
> > > +++ b/drivers/gpu/drm/drm_crtc.c
> > > @@ -501,6 +501,12 @@ void drm_crtc_cleanup(struct drm_crtc *crtc)
> > > =C2=A0{
> > > =C2=A0	struct drm_device *dev =3D crtc->dev;
> > > =C2=A0
> > > +	/* Ensure our dma_fence_ops remain valid for an RCU grace period af=
ter
> > > +	 * the fence is signaled. This is necessary because our dma_fence_o=
ps
> > > +	 * dereference crtc->dev.
> > > +	 */
> > > +	synchronize_rcu();
> >=20
> > nit:
> > I guess this is the only place where one can reasonably put the
> > synchronize_rcu(). But I would hint at the RCU delay in the function's
> > docu.
>=20
> Unfortunately, this still looks like an incomplete fix -
> https://sashiko.dev/#/patchset/20260618-linux-drm_crtc_fix2-v1-1-c03e77b3=
6f34@linaro.org?part=3D1
>=20
> My next version will simply copy the relevant strings into a custom
>=20
> struct drm_crtc_fence {
> 	struct dma_fence base;
> 	char driver_name[32];
> 	char timeline_name[32];
> };
>=20
> or similar as part of drm_crtc_create_fence() and just use those as part
> of the dma_fence_ops. That approach should avoid all race conditions and
> corner cases with RCU.


Now wait a second. I don't see how your struct solves any issue that is
not already solved.

static const char *drm_crtc_fence_get_driver_name(struct dma_fence *fence)
{
	struct drm_crtc *crtc =3D fence_to_crtc(fence);

	return crtc->dev->driver->name;
}

static const char *drm_crtc_fence_get_timeline_name(struct dma_fence *fence=
)
{
	struct drm_crtc *crtc =3D fence_to_crtc(fence);

	return crtc->timeline_name;
}


The issue here seems to be that=20
a) the crtc is made invalid in drm_crtc_cleanup() (memset(0))
b) the drm_dev can disappear after drm_crtc_cleanup()

Both issues stem from the fact that the fence callbacks can keep
running into the driver.

It is true that the fence, being refcounted, can stay alive, but none
of the callbacks be invoked anymore, and your grace period wait
fullfill.

It is a strict dma_fence requirement that a fence issuer / producer
signals all its fences before unload.


The embedded spinlock issue is a separate problem. I think that should
not stall your work here and can be addressed in a separate patch.

Note that the embedded spinlock issue is a known one, and it is very
much related to the fence-decoupling work related to the ops pointer
that Christian has been carrying out. So it can be expected to be a
problem in wide parts of DRM.


Regards
P.

