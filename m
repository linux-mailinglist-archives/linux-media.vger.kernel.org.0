Return-Path: <linux-media+bounces-56385-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOW6OlJivGmLxwIAu9opvQ
	(envelope-from <linux-media+bounces-56385-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:53:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 505CE2D2667
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 276C2317898F
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7CE3FBEC0;
	Thu, 19 Mar 2026 20:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="EBHGMJQK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56043FBEBD
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 20:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773953402; cv=none; b=OhvmRmXHcvP6Lmp0eVAHcumDZIVgjyfHE5ViazgVA1y6plNVQ0hUf5YcAFMz9ImLq9qjEZX5UcGxBnTQt8gHzMAfgQ2UPpzXWCDYHIurSD+zAzpt4r/fHfA5ylyKHar9FrhMOwJ5LJyTatc0OvVoMYOU9lejL251ulYpXWpeLXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773953402; c=relaxed/simple;
	bh=l305ltgLMdtMBCZvuBvAjIK8atGZ3/0+tZ1sV2Pj/ek=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jMKI3lxzas+gY9b6+LW8EW7qWBaZK6Q6/IuSvDj3vPbio4K0DQ+ua26iSfBGr3G+t7hLNSl40TmtyP6UeuybQ3uKtPFhzZa0Ekh5Smeoj4ToqGwXcCbj9/Dn6zwivZdwHCKHnFKUozvOmF9Crs43XvUQwET/kBZIrOb0FHLPfoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=EBHGMJQK; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50905b779dfso14919261cf.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 13:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773953397; x=1774558197; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P0AE6ezNpya7RR7FjT2PYnGrtSfyWo+dZi1jY1xEvZs=;
        b=EBHGMJQKs8iBsbhiIYaRgnG98gYO9DT/cWz/Umi9SbvzWfaSAinsJFGCCY5Of/kOD/
         ZaD+p+Lj+j9hVi9BDyzjeK1a8BtNqvFKJbQv92fbiU9I7/36o4NPfJhi9DQoiYPxuxXh
         Fe9YKDB6V4X9uXgFQQMn0B9oz9ArK/bZdD1hqHUWMRvFSI7JqI0qj+I91VEEqJ3yVLzA
         nvDrjNBGzk4b0lVYy7FqczTvZY1Jutl62ooqwEK3z4rzbL5hebRrYn4QylhCTbVoWmCK
         GcwC7eWOHrIJQa+FwH7895mHBzvwBbjtj1PnncGtWCfRPkaGC2pRxbovD2td1WBdzBd9
         1Dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773953397; x=1774558197;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0AE6ezNpya7RR7FjT2PYnGrtSfyWo+dZi1jY1xEvZs=;
        b=SL5/dxtrewA5fDFTlW/e7xjsgepHOBE/FLhfx8PHJ5WoH06vH/ggjXtPNo5LuCBOg5
         +cV3MF/stHbCNHaWNxIHQGbjBySjCyDmC8gKKp2/HNJvucQTU8OFWfNCmfe6Z3NtFMgy
         VyoVnjHm1rGIbZRltwQUn8oqqKck5spf6OLVs5i1YTYctBek5ODZeaetH/ZHnU38yFHj
         KS19J4bmC2t/G4Y6585yxxtTf8rNYg1IphzmQAHMRaY0t1zUh0YEa8N7nLPTowvs4xqH
         ohllrW1j9+fZhrn4Xjua/EbJI6w+YzKRzFJt/OE7AU6/UnYEa87dtR4o/LOGvaGU4oiC
         0bhg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ6uOvSNuF21pokPQuD3NV6n+fMiF8PHSRxbEXn1N0LmkHWLlfx0L/NDelld3gk5uMeyFNMHUXyd34jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF8+j67Ya3Zt9JQug9BCKn2WyW3+WZ51PDNpC242BFxAXD9SSk
	9VAPJ27+APjAOtgAdaELZe2o12LvOzBnVf6X1JENhei+h6It/tH8rdQWHpxuJTwjK7A=
X-Gm-Gg: ATEYQzyukLIlSK/2C4dxBDLBNgCd/8F+us6Ce8W07tiwn+LLaUOGuNWzlqhtPtUn49+
	RQ0lHnblJw8yZxU032JYZtIcoYFTVquZyqRumc4JIcCwy7x4Zjz5/qzJHO1xM3G+dZzso4Z1z9I
	hb3yN5sJ0fxoGKpExDgaLjpkdI7PVORLldJNVeX19sRPbXbexWExp3+zm0Rj5tpq3Bl0r4MufHU
	31l5Qhf5ReBHB+dDZpYawHhJ5Xr0gE0FPQ97y0k0pZqbiLGMGef3kyc33zvhiNhbUJ1osAEGZsh
	hi/wVlNjfOUbLgsJmhNloCNXY0TrZCYzF68XWKp64WF4TbwI8dhjXNIRMAFoCGAXBJl/kQCfKUb
	NzAXy4XLL6Ngn8zOFEwbQfvVtxKOYJxvLqLflM5FZHymrxBSoxmdjAKKFXjJY0rWwcDi7B6iWFL
	HOSVrPzC8eyN5PbcX6NHbfZmKgT38R
X-Received: by 2002:ac8:7f43:0:b0:509:481:536d with SMTP id d75a77b69052e-50b3753b698mr10051231cf.59.1773953397275;
        Thu, 19 Mar 2026 13:49:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36d0671csm5413341cf.10.2026.03.19.13.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:49:56 -0700 (PDT)
Message-ID: <ffe1c9db59092ac196e9ad1fdbebe73b75d3fcb4.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Fix race between m2m job_abort and
 device_run
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 19 Mar 2026 16:49:55 -0400
In-Reply-To: <20260306065951.837-1-ming.qian@oss.nxp.com>
References: <20260306065951.837-1-ming.qian@oss.nxp.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-NtmVNV443a/7/iP6AJJn"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,collabora.com,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-56385-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ndufresne.ca:mid,nxp.com:email,ndufresne-ca.20230601.gappssmtp.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 505CE2D2667
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-NtmVNV443a/7/iP6AJJn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 06 mars 2026 =C3=A0 14:59 +0800, ming.qian@oss.nxp.com a =C3=A9=
crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> Fix kernel panic caused by race condition where v4l2_m2m_ctx_release()
> frees m2m_ctx while v4l2_m2m_try_run() is about to call device_run
> with the same context.
>=20
> Race sequence:
> =C2=A0 v4l2_m2m_try_run():=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 v4l2_m2m_ctx_release():
> =C2=A0=C2=A0=C2=A0 lock/unlock=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m=
_cancel_job()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job_abort()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 v4l2_m2m_job_finish()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(m2m_ctx)=C2=A0 <-=
 frees ctx
> =C2=A0=C2=A0=C2=A0 device_run()=C2=A0 <- use-after-free crash at 0x538
>=20
> Crash trace:
> =C2=A0 Unable to handle kernel read from unreadable memory at virtual add=
ress
> =C2=A0 0000000000000538
> =C2=A0 v4l2_m2m_try_run+0x78/0x138
> =C2=A0 v4l2_m2m_device_run_work+0x14/0x20
>=20
> The amphion vpu driver does not rely on the m2m framework's device_run
> callback to perform encode/decode operations.
>=20
> Fix the race by preventing m2m framework job scheduling entirely:
> - Add job_ready callback returning 0 (no jobs ready for m2m framework)
> - Remove job_abort callback to avoid the race condition
>=20
> Fixes: 3cd084519c6f ("media: amphion: add vpu v4l2 m2m support")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Ok, I guess that also reduce the overhead of scheduling jobs too.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/amphion/vpu_v4l2.c | 9 +++------
> =C2=A01 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/pl=
atform/amphion/vpu_v4l2.c
> index 64fc88d89ccc..7cccc994fc50 100644
> --- a/drivers/media/platform/amphion/vpu_v4l2.c
> +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> @@ -447,17 +447,14 @@ static void vpu_m2m_device_run(void *priv)
> =C2=A0{
> =C2=A0}
> =C2=A0
> -static void vpu_m2m_job_abort(void *priv)
> +static int vpu_m2m_job_ready(void *priv)
> =C2=A0{
> -	struct vpu_inst *inst =3D priv;
> -	struct v4l2_m2m_ctx *m2m_ctx =3D inst->fh.m2m_ctx;
> -
> -	v4l2_m2m_job_finish(m2m_ctx->m2m_dev, m2m_ctx);
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static const struct v4l2_m2m_ops vpu_m2m_ops =3D {
> =C2=A0	.device_run =3D vpu_m2m_device_run,
> -	.job_abort =3D vpu_m2m_job_abort
> +	.job_ready =3D vpu_m2m_job_ready,
> =C2=A0};
> =C2=A0
> =C2=A0static int vpu_vb2_queue_setup(struct vb2_queue *vq,
>=20
> base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
> prerequisite-patch-id: 0000000000000000000000000000000000000000

Not sure why this line ...

Nicolas

--=-NtmVNV443a/7/iP6AJJn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxhcwAKCRDZQZRRKWBy
9HjYAP0S0YE21EwzVQU1/zKYJbvHM7WGRp6aud37nxGkL7LXVAD/QVLAcoFXLtH9
khW4FVX+kR4xvQStun2japJcuFbnQg0=
=Af7N
-----END PGP SIGNATURE-----

--=-NtmVNV443a/7/iP6AJJn--

