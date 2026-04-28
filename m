Return-Path: <linux-media+bounces-59898-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CARANpsa8WnadQEAu9opvQ
	(envelope-from <linux-media+bounces-59898-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 22:37:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD0748BD38
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 22:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE7673019775
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 20:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7564A3128DF;
	Tue, 28 Apr 2026 20:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="roqX9cIl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B7630AD05
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 20:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408661; cv=none; b=MiUiFGHPVeVbWXh7uyJZzmIYO6syvo/VkhOM4RtTnSNTGGcOYx5z76aoFSLGMLsFTn2xwTa2bhK70NMIwSwf6LrnJJJbTNNpvr+JNfUxKOnRNRARVdNPtjNv4bgqU3bFY4c9huwqiBKxNZIsijZuIhcRvUsz5CqE/EhhTiYJ/dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408661; c=relaxed/simple;
	bh=Guq5/1eIrgzgZKNWzg02roY/hJxkO1at6tjH3NzZPJI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ErrR8Hy1QfqCfzD3UsdtSAIZbu3OSsrjon5I0pGYb1cyjmEFez9LkoZ1+uD9XshycABx1pX1vVc4MG3iC6wqc4bZak08n5Zfq0/flO0/ERZ26hIW5dLT+2eugXiIzR6/0+YGgVNPvItqF6lGOwlKpB8dcMUnwiodw8lfFzoPUqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=roqX9cIl; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-47c3b830c99so284728b6e.0
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 13:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1777408659; x=1778013459; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4LyvFUNpVpPtERUYyLw1pAadsXQTRCYkfiN9yTor4u0=;
        b=roqX9cIl4T0d0EOH7LBh2eeUH/BLGHtBNPTo29fgZWx/5yy4vYJ4fu2BO6pKxeQELj
         mCnUN0Q5IUUViWU5d2xz1mNs0tfMrVZacs+u5HYR3tbzgfiHDSsdtUOg/T2xVRslBcl/
         j864rgwTc+lau/YL69DJ50ohHMGFCx8D+HMjWoc1pPePvlzfMY10cyY6u9L8lzAlJmLG
         gqR8EWV6HABn5/SHPBIckiJj0RRDYyI/5biJ+UWvDOryp3OVssYFex22V9HCpXe+2o6m
         j18jRO9wZQqKNMsxUgVOU3SLUuS8SZNhEcvY3mr/G/Vfc2HsfCz9B2SwEuypc63l1S82
         oSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408659; x=1778013459;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LyvFUNpVpPtERUYyLw1pAadsXQTRCYkfiN9yTor4u0=;
        b=FW7cj4PmAhWSVtrcponQJwIaX+uzfOkZD6wRwwRVm3A2aHAqG6ITzZH7NwsQqmRe8P
         idDwOU4z5HNxSoYTef+x8+jlj+jjRPPsMDJbo8yoNqno78o+LVzXbn1eSkWnw+fFpbC2
         Mj0Z4QswB5swD1kJy31k9tkGmVwqzdMPa31VWc8XZ/v1SIL8/xfj1zjmXJlG8lP6Rsu1
         r3lX4DIfkiN7R9/iEjvLwCiE9aSlgTuXVA4nGPflfqgmiIjyFGWlCcUT0ifAHmF1uRCP
         vwm8dRChH369DjQQlXASC+lIJfN2w/eWJHRc1XBnh3HbcmZPDbn5jau6LN4ll9QjR7fm
         pqDg==
X-Gm-Message-State: AOJu0Yybmm4W7OaxGclnil+1VCRAQ2BJ6Jj5uoWSj+SM81FBtmziYfKe
	NkayD14p35SHbbS1OwV4OH3n7ovSPB2dTrtmg0xhrizQUVD6S5lplQr3EDYqrhfEWAE=
X-Gm-Gg: AeBDies/d8PW8GWtSkZU+6ka6hrRb9nvCLXIi8JJQvK/2JRQMESDmiFQSgvW04W0qU0
	GOX8t5hR3CYJoQAmcA9BnQR4URUMZUBDwvxcmKaYElt3GaubAcsQnZg40upBfUsR4a5fwYrWJ/2
	u5/oVWiML+WR8fKfvN8JfiDjxT6SMBN6FqOOVOYa9QmvRtqiE3APcQAlLSCaSaLkG6JywhQHkqP
	JolVJL3HbFyiCgwnFUItv4MwTp93cisb9ze2zqddbYGTSVRoIUtYSdKLLcHQepbR/eUKEqV/V4Q
	6AShul2C5nW+n6bJ9uLDO3ToXaqASLrEl3RerRY5CKjdGtfawaQRFX0CGZtYpc+CSGDWYIUfxfY
	yyxd5WW2TnKF7Cppq/+TOhJv60xOX16IHcG9/iAmMBaUyuZ8AEmQcLpLv8EuveE/c7gDWSsWV6h
	JU/H2QJt54NbDEWt3ORUxaKT4mBK/YAH4OURd+2Zs=
X-Received: by 2002:a05:6808:159b:b0:475:be6f:aa with SMTP id 5614622812f47-47c3d9992b7mr647616b6e.19.1777408659317;
        Tue, 28 Apr 2026 13:37:39 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c426fdc44sm37590b6e.3.2026.04.28.13.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:37:37 -0700 (PDT)
Message-ID: <2db848c23398c1995f16e24be9e86dd399a04f4d.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: free working buf in
 vdec_vp9_slice_setup_single()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, 
	p.zabel@pengutronix.de, benjamin.gaignard@collabora.com, 
	xiaoyong.lu@mediatek.com, mingjia.zhang@mediatek.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Date: Tue, 28 Apr 2026 16:37:35 -0400
In-Reply-To: <20260330021110.2733458-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260330021110.2733458-1-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-Ia1WDRCY1/M1Q8YAdi4l"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: ADD0748BD38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-59898-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[isrc.iscas.ac.cn,mediatek.com,kernel.org,gmail.com,collabora.com,ideasonboard.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ndufresne.ca:mid]


--=-Ia1WDRCY1/M1Q8YAdi4l
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 30 mars 2026 =C3=A0 10:11 +0800, Haoxiang Li a =C3=A9crit=C2=A0:
> Add an error path label in vdec_vp9_slice_setup_single()
> and call vdec_vp9_slice_free_working_buffer() to free
> working buffer.
>=20
> Fixes: b0f407c19648 ("media: mediatek: vcodec: add vp9 decoder driver for=
 mt8186")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index cd1935014d76..b3ecb94bebb3 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -1811,14 +1811,16 @@ static int vdec_vp9_slice_setup_single(struct vde=
c_vp9_slice_instance *instance,
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_prob_buffer(instance, vsi);

This function never fails, remove its return value and remove the error cod=
e
below.

> =C2=A0	if (ret)
> -		goto err;
> +		goto alloc_err;
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
> =C2=A0	if (ret)
> -		goto err;
> +		goto alloc_err;

Ack.

cheers,
Nicolas

> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +alloc_err:
> +	vdec_vp9_slice_free_working_buffer(instance);
> =C2=A0err:
> =C2=A0	return ret;
> =C2=A0}

--=-Ia1WDRCY1/M1Q8YAdi4l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafEajwAKCRDZQZRRKWBy
9E2/AQD/nW836XRN6DAd6ZzBlINp0cYn4Gay0RQSq8mQWp4LCwEAwr6VfThlqpT4
WvmFwT4qjEPeQdKleVFr7EXeFiwJUAs=
=cisg
-----END PGP SIGNATURE-----

--=-Ia1WDRCY1/M1Q8YAdi4l--

