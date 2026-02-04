Return-Path: <linux-media+bounces-52205-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMmrEvR2g2mFmwMAu9opvQ
	(envelope-from <linux-media+bounces-52205-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 17:42:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C31EA666
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 17:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D090303265C
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 16:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EC33033CD;
	Wed,  4 Feb 2026 16:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bT5kACGX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E3830149F;
	Wed,  4 Feb 2026 16:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770223012; cv=none; b=mdr6QSJLS3/Hj6OK35Q6sQ2cNCsXHeYHaobanr8pu3dapOueavyCwRmSg7FnTm7V9WI7onDmh/rNKkSxyJzPnzzh/n9Nt88cKJV4BLtnnJ+kyL7OkLDNh+EjJ/dpKPBa4DwLF8+LSlXaaS8o8v5FuLmGCl+2dtn+f/LzidpYZiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770223012; c=relaxed/simple;
	bh=tbsPWsjIEplvCYj1UTeTpbUnN9fE9qjeHkB6BN/DecE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=lO2AiffIdvrUPCmvjqXz7L1Rf//vFHpOKVUH+9MSc2Bxb9PiVv+x8lx9lo4kJzSnqMjyDhm2+BjBFmx43mtGRmw2OS3vq/uZb7k/704LvnC4hWlrXi1jLvgpVR5m1oxRN5V8GGL2pfQ6a7dxcaGMV4npFGsXv9pc5frXjRWfm0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bT5kACGX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from thinkpad.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1ECC0593;
	Wed,  4 Feb 2026 17:36:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770222968;
	bh=tbsPWsjIEplvCYj1UTeTpbUnN9fE9qjeHkB6BN/DecE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bT5kACGXu/f/coZk/BKFUWb3wCmO61hgrtqyp3P+1RyJdcX0MUacDG0lGUlEXELdi
	 aHn7t/dv0QO/mHEVJSZ5Tx/EHlUPqE1uVRLblSTUeYVBFyocacw8yudtoUyClALb46
	 Vv+t3Jf0hGFihyWTSKKXy+RqIPqn8SVmNbT0U6uk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260204154004.GB170964@killaraus>
References: <20260204112506.3706049-1-isaac.scott@ideasonboard.com> <20260204112506.3706049-6-isaac.scott@ideasonboard.com> <20260204154004.GB170964@killaraus>
Subject: Re: [PATCH v1 5/6] media: rkisp1: Give buffers back instead of dropping in bypass mode
From: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dafna@fastmail.com, mchehab@kernel.org, heiko@sntech.de, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Wed, 04 Feb 2026 16:36:47 +0000
Message-ID: <177022300744.3835511.13262707370784191079@isaac-ThinkPad-T16-Gen-2>
User-Agent: alot/0.10
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52205-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,fastmail.com,kernel.org,sntech.de,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[isaac.scott@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: B1C31EA666
X-Rspamd-Action: no action

Hi Laurent,

Quoting Laurent Pinchart (2026-02-04 15:40:04)
> On Wed, Feb 04, 2026 at 11:25:05AM +0000, Isaac Scott wrote:
> > In the data mode used for YUV passthrough, falling VSYNC events are used
> > to determine when a buffer is complete. This means there is no 'Frame
> > End' signal.
> >=20
> > Previously, all buffers would be dropped when bypass mode was active.
> > Instead of dropping every frame, we should return the buffer to user
> > space if it is marked as complete by a falling VSYNC signal.
> >=20
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/=
drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > index 867cdddf9f89..2753be39ab33 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > @@ -832,6 +832,11 @@ irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
> >       for (i =3D 0; i < dev_count; ++i) {
> >               struct rkisp1_capture *cap =3D &rkisp1->capture_devs[i];
> > =20
> > +             if (rkisp1->in_bypass) {
> > +                     rkisp1_handle_buffer(cap);
> > +                     continue;
> > +             }
> > +
>=20
> You're completing the buffer if *any* interrupt bit is set, this doesn't
> seem right. At the moment we may not enable interrupts other than the
> one you expect, but that may change later, and this will misbehave.
> You're also not handling the stopping logic, which also seems wrong.
>=20
> Finally, what interrupt bit do you expect to see ? There's no VSYNC
> interrupt in the RKISP1_CIF_MI_MIS register. Are you relying on the fact
> that your platform has a single interrupt line for the three interrupt
> sources (CSI2, ISP and MI), and react to the VSYNC interrupt from the
> ISP interrupt here ? That's not right either, not only will it not work
> on platforms that have three separate interrupt lines, but it will also
> cause rkisp1_handle_buffer() to be called for *any* ISP interrupt.
>=20
> I'm surprised that the frame end interrupt doesn't fire. It's part of
> the MI, not the ISP, so it shouldn't be affected by bypass mode. You
> should investigate that.

You're right, I think I should get a frame end interrupt. I think what
has happened is during development part I was getting no frame end
interrupts, so I made this change, but it actually turned out to be an
inform_size_err if I recall correctly.

Although it may also be incorrect, I have checked whether I actually do
not get a frame end interrupt by dropping this patch, and it seems I do.
(I must have had my FPGA configured to output the wrong width / height
at the time).

I'll drop this in v2 as it doesn't seem necessary.

Thanks very much,
Isaac

>=20
> >               if (!(status & RKISP1_CIF_MI_FRAME(cap)))
> >                       continue;
> >               if (!cap->is_stopping) {
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

