Return-Path: <linux-media+bounces-63492-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4jG8EefGH2onpwAAu9opvQ
	(envelope-from <linux-media+bounces-63492-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 08:17:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAF7634978
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 08:17:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ewDjUAsE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63492-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63492-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA11630DFEEB
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 06:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789663F58E9;
	Wed,  3 Jun 2026 06:14:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74A83845BC
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 06:14:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780467291; cv=none; b=XL6vTLbfGKJ2T0cO8aafJDI6eLKw0bHe4vzpzCkqfXE61J2tXSJCI5Hit/FK4NlHqTZj3QaBI1BVRWNECb2F8pRU3PN+mAVPuTkPcNUghK8e3AkY2c3bDa6FL2L5p9N/SxJA1MudQZ84gz9PMcTElVCZ7iibr3YUapTYn46mKlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780467291; c=relaxed/simple;
	bh=5vczJaQf2cdI22X9D3ELdN6bszptUQPQwGgfYoPOC9c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lqR8xUVnoESRV61jYAdb5CP1MM+pWW12t11/ExLum/XG+Qms2Di5WOCt6oATkOem9EpmWlsfTiKF6Lvu2S8b4YGnTHPQqLD77G4FPtjOkW+3PmQVLRT1SbyBSR+oNwsbhJV9VjwnDjzEEkti6+nCVon7TJSrAdNlVCHsjovkWEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ewDjUAsE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94FDF1F00893;
	Wed,  3 Jun 2026 06:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780467289;
	bh=lUp2yww1OghkhCmnkZOmOxBOqLfKic5po/vddagHWoY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ewDjUAsEq0NZDMjdvyj0gSBLlNYngMhOPSSy/A2uT0lYVuJ+qQOjtaV3jCuvf3Gdj
	 vkVi683ART6+b19x8dq9S6u52EWdMVjZr6bsvM9QiH3LAheOIQopWjcZC8D4HZXVcJ
	 OQMjAQhY/DjU+sWm9dXerCNhXZCgo3QgBSoBo2BolHFTEF7zmehKaZ3wjnsxTFIoPi
	 KlRq4auNwOiGW+fyDFsIglSPeRadWIr9yZXSq4ma7zhk+muopck0U6cpVDwr/Z6swg
	 tS0xilQ5pQIBdB5aPcbCoPJSTlpCiN0asuIbHpTTBpaClZiWsHo7ISDNEfOoSwf0yC
	 bMl+RXn9BggVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: qcom: camss: vfe-17x: silence wm-done IRQ on
 unmapped WMs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260603054238.562902-3-github.com@herrie.org>
References: <20260603054238.562902-3-github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 06:14:49 +0000
Message-Id: <20260603061449.94FDF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63492-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,herrie.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smtp.kernel.org:mid,vger.kernel.org:from_smtp,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADAF7634978

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Moving the `wm_output_map` validation outside the `output_lock` sp=
inlock introduces a TOCTOU race condition against stream stopping, leading =
to Use-After-Free and double vb2 buffer completions.

Pre-existing issues:
- [High] Pre-existing bug in `vfe_buf_done` where an out-of-bounds line poi=
nter is computed locklessly and later dereferenced.
--

commit 98cdb54eb2a601721b4658e4c2704449a2aa63dd
Author: Herman van Hazendonk <github.com@herrie.org>

media: qcom: camss: vfe-17x: silence wm-done IRQ on unmapped WMs

This commit aims to silence a rate-limited error message when handling
Write Master IRQs for unmapped indices. It moves the check for VFE_LINE_NONE
outside of the output_lock spinlock, intending to return early and avoid log
spam.

> vfe_isr_wm_done() handles the per-write-master "frame complete" IRQ.
> On VFE 1.7x configurations where a Write Master is allocated to a
> secondary purpose (e.g. statistics or DMI buffers) it is not mapped
> to any output line, so vfe->wm_output_map[wm] is VFE_LINE_NONE.
>=20
> Today the function takes the output spinlock first and only then
> checks for VFE_LINE_NONE, emitting a rate-limited "Received wm done
> for unmapped index" error each time. The error is harmless but it
> spams dmesg when a stats path is configured.
>=20
> Move the VFE_LINE_NONE test in front of the spinlock and return
> silently: an unmapped WM simply has nothing to deliver to userspace.
> While at it, hoist the wm_output_map[] dereference into a local for
> readability.
>=20
> No functional change for mapped Write Masters.
>=20
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/=
media/platform/qcom/camss/camss-vfe-17x.c
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -507,21 +507,36 @@ static void vfe_isr_reg_update(struct vfe_device *v=
fe, enum vfe_line_id line_id)
>   */
>  static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
>  {
> -	struct vfe_line *line =3D &vfe->line[vfe->wm_output_map[wm]];

[Severity: High]
This isn't a bug introduced by this patch, but a similar pattern exists in
vfe_buf_done() in drivers/media/platform/qcom/camss/camss-vfe.c:

drivers/media/platform/qcom/camss/camss-vfe.c:vfe_buf_done()
	struct vfe_line *line =3D &vfe->line[vfe->wm_output_map[wm]];
	...
	spin_lock_irqsave(&vfe->output_lock, flags);

	if (vfe->wm_output_map[wm] =3D=3D VFE_LINE_NONE) {
        ...

If wm_output_map[wm] is initially VFE_LINE_NONE (-1), line is assigned an
out-of-bounds pointer locklessly. If a concurrent thread maps the WM to a
valid index before vfe_buf_done() acquires output_lock, the internal check
passes. The function will then pass the stale, out-of-bounds line pointer
to ops->vfe_wm_update(), which dereferences it. Should this also be updated
to prevent reading from an out-of-bounds pointer?

> +	struct vfe_line *line;
>  	struct camss_buffer *ready_buf;
>  	struct vfe_output *output;
>  	unsigned long flags;
> +	int wm_output;
>  	u32 index;
>  	u64 ts =3D ktime_get_ns();
> =20
> +	/*
> +	 * Some VFE modes route data to secondary WMs that aren't mapped
> +	 * to output lines. Silently ignore their IRQs.
> +	 *
> +	 * vfe->wm_output_map[wm] is written from the stream stop/start
> +	 * paths under output_lock held as a mutex; this ISR runs in
> +	 * atomic context and cannot take it. Snapshot the value once
> +	 * with READ_ONCE() so the check below and the array index that
> +	 * follows operate on the same value: otherwise a concurrent
> +	 * write of VFE_LINE_NONE (-1) between the two loads would let
> +	 * the function pass the check and then dereference
> +	 * &vfe->line[-1].
> +	 */
> +	wm_output =3D READ_ONCE(vfe->wm_output_map[wm]);
> +	if (wm_output =3D=3D VFE_LINE_NONE)
> +		return;
> +
> +	line =3D &vfe->line[wm_output];
> +
>  	spin_lock_irqsave(&vfe->output_lock, flags);
> =20
> -	if (vfe->wm_output_map[wm] =3D=3D VFE_LINE_NONE) {
> -		dev_err_ratelimited(vfe->camss->dev,
> -				    "Received wm done for unmapped index\n");
> -		goto out_unlock;
> -	}
> -	output =3D &vfe->line[vfe->wm_output_map[wm]].output;
> +	output =3D &line->output;

[Severity: High]
Does moving this check outside the output_lock introduce a race condition w=
ith
stream stopping?

The new comment mentions the ISR runs in atomic context and cannot take the
lock, but the ISR proceeds to acquire output_lock immediately after this ch=
eck.

If the ISR locklessly reads a valid wm_output here, but stalls before acqui=
ring
the output_lock:

CPU1
vfe_isr_wm_done()
   wm_output =3D READ_ONCE(vfe->wm_output_map[wm]);

CPU2 (stream teardown)
vfe_put_output()
   spin_lock_irqsave(&vfe->output_lock, flags);
   vfe->wm_output_map[wm] =3D VFE_LINE_NONE;
   vfe_flush_buffers(vfe, &line->output);
   spin_unlock_irqrestore(&vfe->output_lock, flags);

CPU1
   spin_lock_irqsave(&vfe->output_lock, flags);
   output =3D &line->output;
   ready_buf =3D output->buf[0];

vfe_flush_buffers() completes all buffers via vb2_buffer_done() but leaves
output->buf[0] non-NULL. When CPU1 resumes and acquires the lock, it will no
longer re-verify wm_output_map. It then modifies the already completed buff=
er
(ready_buf->vb.vb2_buf.timestamp =3D ts) and double-completes it via
vb2_buffer_done(), which would corrupt the vb2 state.

>  	ready_buf =3D output->buf[0];
>  	if (!ready_buf) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603054238.5629=
02-1-github.com@herrie.org?part=3D2

