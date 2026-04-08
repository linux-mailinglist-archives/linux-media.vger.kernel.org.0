Return-Path: <linux-media+bounces-58282-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFqvChez1mmFHQgAu9opvQ
	(envelope-from <linux-media+bounces-58282-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 21:57:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B7E3C37F6
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 21:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21F0A303FFD9
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 19:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA11381B1C;
	Wed,  8 Apr 2026 19:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SNPi70Rh"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B9735AC2B;
	Wed,  8 Apr 2026 19:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775678102; cv=none; b=oqhb711aC0MRgX9wtw//csSHGJa4usEqt8doVzGdjPuO3AbSspmaw3c36wt6z/kCI2jWvSeiU5SuXkOBVG16+gsHP8FN698RQKnI/G/SOvaR/yqgEY8iRryZJKvK4sPRyylo4xL5kCvtbQSM54JPoJY948jxJHBvmFz2f6Dxlrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775678102; c=relaxed/simple;
	bh=pZih0j6BR0PvzZ3DCkj9YihQ7AJiMltz0mMUm/CE/7Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N1rgpk5+cmhzNjusZKXbwP/Flso6cdM6pLt184u5RBd+VvMLXIrTbfqfrBvM2xw9uY3Mx9wapetT5S9lBN9dWwYmI6oxtnhvvwH4FQn4Tm6qabGIPGVrTnXZrPpv3LRRaLp537zFBJSGV/FOB66AC5xe1TOr5EFQ/llJvS7G1/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SNPi70Rh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775678099;
	bh=pZih0j6BR0PvzZ3DCkj9YihQ7AJiMltz0mMUm/CE/7Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SNPi70RhHSOrxa89hqTAM6BMadLlwcmOmgU220e+4JmwJ/77Ybd6dCR3Fhovt7uVm
	 M7KND6SHZULNqb95uQLVFYep1ry9r7aQGYIKbxLaHGfcrsoc10lQgYSDvOhb2VwUah
	 zH5glLz71tMYUyICqHcd5L1gWw0C2otThljMpghDEUp8ENo9/wkuEAbYQO2TdX0k3B
	 r0GKkjRvOen3D4KWc197EPrLItqndrm0renO+Tvqn1UXGIZRsCQpy/hsxgXN0myxfR
	 8Lh620iSRD8/LeBgUzdIPbw1Bsh1FTY7P166VGLClsi0G1DPOrbWC3l5dyOYIADzyO
	 p6wPatM0z305A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 718F817E0BA2;
	Wed,  8 Apr 2026 21:54:58 +0200 (CEST)
Message-ID: <eeb378d042735f1d60794770ed0bf1c820030ba3.camel@collabora.com>
Subject: Re: [PATCH v2] media: chips-media: wave5: Move src_buf Removal to
 finish_encode
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Brandon Brnich <b-brnich@ti.com>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, jackson.lee@chipsnmedia.com, 
	nas.chung@chipsnmedia.com
Cc: mchehab@kernel.org
Date: Wed, 08 Apr 2026 15:54:57 -0400
In-Reply-To: <20260320180526.351956-1-b-brnich@ti.com>
References: <20260320180526.351956-1-b-brnich@ti.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-MBsxdO1rfyko11pSA4mg"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58282-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 87B7E3C37F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-MBsxdO1rfyko11pSA4mg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 mars 2026 =C3=A0 13:05 -0500, Brandon Brnich a =C3=A9crit=C2=
=A0:
> During encoder processing, there is a case where the IRQ response could
> return the buffer back to userspace via v4l2_m2m_buf_done call. In this
> time, userspace could queue up this same buffer before start_encode remov=
es
> the index from the ready queue. This would then lead to a case where the
> buffer in the ready queue could be a self loop due to the
> WRITE_ONCE(prev->next, new) call in __list_add.
>=20
> When __list_del is finally called, the loop is already made so nothing
> points back to ready queue list head and pointers are poisoned.
>=20
> A buffer should not be marked as DONE before the buffer is removed from
> m2m ready queue. Move removal entirely to finish_encode.
>=20
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>=20
> V2:
> =C2=A0- Update function to use reported index from encoder
> =C2=A0- Fix reported media CI bot style errors with brackets
>=20
> =C2=A0.../chips-media/wave5/wave5-vpu-enc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 29 +++----------------
> =C2=A01 file changed, 4 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index 7613fcdbafed..c605a91718d8 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -226,13 +226,6 @@ static int start_encode(struct vpu_instance *inst, u=
32 *fail_res)
> =C2=A0	} else {
> =C2=A0		dev_dbg(inst->dev->dev, "%s: wave5_vpu_enc_start_one_frame succes=
s\n",
> =C2=A0			__func__);
> -		/*
> -		 * Remove the source buffer from the ready-queue now and finish
> -		 * it in the videobuf2 framework once the index is returned by the
> -		 * firmware in finish_encode
> -		 */
> -		if (src_buf)
> -			v4l2_m2m_src_buf_remove_by_idx(m2m_ctx, src_buf->vb2_buf.index);
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> @@ -259,27 +252,13 @@ static void wave5_vpu_enc_finish_encode(struct vpu_=
instance *inst)
> =C2=A0		__func__,=C2=A0 enc_output_info.pic_type, enc_output_info.recon_f=
rame_index,
> =C2=A0		enc_output_info.enc_src_idx, enc_output_info.enc_pic_byte, enc_ou=
tput_info.pts);
> =C2=A0
> -	/*
> -	 * The source buffer will not be found in the ready-queue as it has bee=
n
> -	 * dropped after sending of the encode firmware command, locate it in
> -	 * the videobuf2 queue directly
> -	 */
> =C2=A0	if (enc_output_info.enc_src_idx >=3D 0) {
> -		struct vb2_buffer *vb =3D vb2_get_buffer(v4l2_m2m_get_src_vq(m2m_ctx),
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enc_output_info.enc_src_idx);
> -		if (vb->state !=3D VB2_BUF_STATE_ACTIVE)
> -			dev_warn(inst->dev->dev,
> -				 "%s: encoded buffer (%d) was not in ready queue %i.",
> -				 __func__, enc_output_info.enc_src_idx, vb->state);
> -		else
> -			src_buf =3D to_vb2_v4l2_buffer(vb);
> -
> -		if (src_buf) {
> +		src_buf =3D v4l2_m2m_src_buf_remove_by_idx(m2m_ctx, enc_output_info.en=
c_src_idx);
> +		if (!src_buf) {
> +			dev_warn(inst->dev->dev, "%s: no source buffer found\n", __func__);
> +		} else {
> =C2=A0			inst->timestamp =3D src_buf->vb2_buf.timestamp;
> =C2=A0			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
> -		} else {
> -			dev_warn(inst->dev->dev, "%s: no source buffer with index: %d found\n=
",
> -				 __func__, enc_output_info.enc_src_idx);
> =C2=A0		}
> =C2=A0	}
> =C2=A0

--=-MBsxdO1rfyko11pSA4mg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCadaykQAKCRDZQZRRKWBy
9Iw8AQD6oQgkZTfpSuKxl6cTVbjm2owWP+/6GRkpogJbf4DCVgEApS59YkMyJ4NJ
E8R9EeGaAz4dZ/6tCTDA48yt85hZ6QE=
=zDaC
-----END PGP SIGNATURE-----

--=-MBsxdO1rfyko11pSA4mg--

