Return-Path: <linux-media+bounces-61466-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDBjHs6cBGr3LwIAu9opvQ
	(envelope-from <linux-media+bounces-61466-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 17:46:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C83E45366AA
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 17:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1D67313893A
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0233A47278B;
	Wed, 13 May 2026 15:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="jGk1/KDN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C53423168
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684397; cv=none; b=E/WzapNfp/XGyv/qBGAd1Q41RdWC7uTQ9o60XiojUjfFhN2vJcF2Faw9EAadCivon4cJNjSbH/zACPgxktvv/FqZvCi1vQygtZc4vR+LSQ/MhCAeXnGQ37gR33hRjaSUQ1LbWzmV+thzwbgkCi822c8Mdaphe2GDA7sX4AwC/FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684397; c=relaxed/simple;
	bh=MCh3G1DK3t1W18jd6/amvDk6gfriW0rMC8E/INPnzX4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qwa1Qd7DG6TYgh24PU0DfP3JNlUVA98C3ra0Jqq2air0fjxjfHuvKmv0/3BVOu/FTtNspHuS8KmcNSwPqL8W++YDywGg2okvFfv9X0Oymv2ZgVBHM8RqaQU/OVtd0QXOfRq9nOUi67POtK4VnGwsZLIaIdvRyrUl7huPNSXq1C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=jGk1/KDN; arc=none smtp.client-ip=209.85.219.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-8b62ca1d28eso60558826d6.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 07:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778684383; x=1779289183; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wqNT8tWc1rOMBCgaRY0UZrYLQO87JRnAx1JkG3IWR58=;
        b=jGk1/KDNmwNKPbf5sthaTrsjb90bvH1iTT8/5e9Abd4C1cz40bmjU4vICdcW+LqE6X
         U0KnE9QijlzM8ZeyZNLCmV496JX7FAy7Hh/gt7rvm13o8sZIvjf952Ar/ZZ4AdPGrIjc
         Jzf62w/TIYZS8YyTWZnF0VbUfRePk1GoVbYgYdp0wtpqDjUSfClCyf/wzW+GUJ+2sOQ3
         xQMIWjBX3aZRRZQdZ49gazs5BQYamn4bODQOe0FAVQsnZrILcIc8JJLrEI1aN/2V7wzp
         GstLpnhfUO5yRYHb43YIDmInQxPQSVmTVM9pm4KgGmCQiy4nk/+jG3fKBqZjF/EY9k4M
         R6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684383; x=1779289183;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqNT8tWc1rOMBCgaRY0UZrYLQO87JRnAx1JkG3IWR58=;
        b=eYWkTFtFwrqKqHsAmuiwb/BLW5Qt2KcogRp5rR/pRopieHGFOaVYTthBVRAVk2mIx4
         D1j209KDsqBR3cAoRURvOO7tqRnDxlNOlxQdGK9E/716B8ExthFRrmx6z2GtDm+h9yLU
         P+67iowXi61Ek6lppcEBOo43DhS8V3PxBuXR3VUlZsZiC0otwZcFf4vBppkxrQno7Nvg
         CpNITMAJVwjxcoSMLEgt2EIKz0p4YThb0+M90mXHjQlc/wirrfXjSAoSE2YT7Asu3E9H
         HIoG0nmEhVM971D4cIe/GSMxXO3MaaqZueRJATDbtdagB0DmWd/1FIR4rC1sd4xGMiJr
         JFdw==
X-Forwarded-Encrypted: i=1; AFNElJ8MoH5HfnvsBoslujhzK4gkzL2dqiD4gIOswN6MhfcgntrMOYUpCVe3xl0PBsJBDJrDvDLZcTVYKwEx8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzllkTEW1D7hjqrHCb9WnAWmLizeg8DDK/AfKliLAbBsDr7CGaH
	vdrt0W3y6VpUzqu4lzTWPtbTaMowIam0nKN1i/eNIvcrXexbFOin+Vl8YzjfZZlKxe8=
X-Gm-Gg: Acq92OEjUBn81xw+Xp07hY816yz9ggvqJfZKBCs8xqSHX1d7W4cf31seZuZ4kED+ITA
	bThvYAtodszB0zGvOhCEwg+GC94X7wJPt4HmsDWAZm29nV8BEmEGxjqjXx/vYxj28K4qvdd7jHe
	vVqx9qckw0cJjAOGN5nYjhUOWvkHl6rVdxspZam7euXCe7NMCmnsM5nwoBJeNX1UCATxx5axKMx
	Ym7rpn03l6iNGRAwVbH7ZLMaZ9l460m0NUEAKMR+54dzQF7Z57NZ8pOoo3MkicJPnzihchADt8I
	3aG0Q3lNzf3GMFXTKRRDrxZNipkJG2zw1XqOkW8vpOLihjGmjIlarHV+K9BHo9jfrQKQ1im33Au
	X9IgcbOX0H5VdajX111L7027EJXcN/wlJ2aUoNPhWGpPgoETfp+LAqLuAfCh+1knwC1aLC931JU
	Li+I8xKc4yaP4e+QcBv01uypofLlgVKOwtTOrJY/wj/mpyR7QU75QSPEe2ypk+t9ou8nk5
X-Received: by 2002:a05:6214:478b:b0:899:f092:9da with SMTP id 6a1803df08f44-8c7df30e3d9mr50663726d6.28.1778684382892;
        Wed, 13 May 2026 07:59:42 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c3db21d248sm99880436d6.13.2026.05.13.07.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:59:41 -0700 (PDT)
Message-ID: <67cd61cb2dd1988f3ccc93e7eb1eff42014ce830.camel@ndufresne.ca>
Subject: Re: [PATCH] media: vivid: check vb2_is_busy before calling
 vivid_update_format_cap/out
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Linux Media Mailing List
	 <linux-media@vger.kernel.org>
Date: Wed, 13 May 2026 10:59:39 -0400
In-Reply-To: <3016ee7c-9a4f-4fcf-b17f-0dce5bbc9260@kernel.org>
References: <3016ee7c-9a4f-4fcf-b17f-0dce5bbc9260@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-pDwT2Q1H3B2P+iXxI7hj"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: C83E45366AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61466-lists,linux-media=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,xs4all.nl:email,appspotmail.com:email,ndufresne.ca:mid,syzkaller.appspot.com:url,ndufresne-ca.20251104.gappssmtp.com:dkim]
X-Rspamd-Action: no action


--=-pDwT2Q1H3B2P+iXxI7hj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 13 mai 2026 =C3=A0 10:52 +0200, Hans Verkuil a =C3=A9crit=C2=A0=
:
> The vivid_update_format_cap/out() functions must only be called if the
> capture/output queue are not busy. But for several controls that is not
> checked.
>=20
> Only when streaming starts will they be set to 'grabbed' and it is
> impossible to change the control, but between REQBUFS and STREAMON you
> are still allowed to set these controls. Since vivid_update_format_cap/ou=
t
> will change the format, this can cause unexpected results.
>=20
> I suspect that this is the cause of this syzbot bug:
>=20
> https://syzkaller.appspot.com/bug?extid=3Ddac8f5eaa46837e97b89
>=20
> But since we never have reproducers, it is hard to be certain. In any cas=
e,
> these checks are needed regardless.
>=20
> Reported-by: syzbot+dac8f5eaa46837e97b89@syzkaller.appspotmail.com
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> index f94c15ff84f7..e40ff999cad8 100644
> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> @@ -608,18 +608,26 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *c=
trl)
> =C2=A0		tpg_s_vflip(&dev->tpg, dev->sensor_vflip ^ dev->vflip);
> =C2=A0		break;
> =C2=A0	case VIVID_CID_REDUCED_FPS:
> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
> +			return -EBUSY;

It is unclear to me why users need to free all the buffers to enable this
feature.  Should that one only be limited to not being streaming ? I believ=
e it
will only affect the HDMI DV Timings and the frame internal in params right=
 ?

> =C2=A0		dev->reduced_fps =3D ctrl->val;
> =C2=A0		vivid_update_format_cap(dev, true);
> =C2=A0		break;
> =C2=A0	case VIVID_CID_HAS_CROP_CAP:
> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
> +			return -EBUSY;
> =C2=A0		dev->has_crop_cap =3D ctrl->val;
> =C2=A0		vivid_update_format_cap(dev, true);
> =C2=A0		break;
> =C2=A0	case VIVID_CID_HAS_COMPOSE_CAP:
> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
> +			return -EBUSY;
> =C2=A0		dev->has_compose_cap =3D ctrl->val;
> =C2=A0		vivid_update_format_cap(dev, true);
> =C2=A0		break;
> =C2=A0	case VIVID_CID_HAS_SCALER_CAP:
> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
> +			return -EBUSY;
> =C2=A0		dev->has_scaler_cap =3D ctrl->val;
> =C2=A0		vivid_update_format_cap(dev, true);
> =C2=A0		break;
> @@ -1116,14 +1124,20 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl
> *ctrl)
>=20
> =C2=A0	switch (ctrl->id) {
> =C2=A0	case VIVID_CID_HAS_CROP_OUT:
> +		if (vb2_is_busy(&dev->vb_vid_out_q))
> +			return -EBUSY;
> =C2=A0		dev->has_crop_out =3D ctrl->val;
> =C2=A0		vivid_update_format_out(dev);
> =C2=A0		break;
> =C2=A0	case VIVID_CID_HAS_COMPOSE_OUT:
> +		if (vb2_is_busy(&dev->vb_vid_out_q))
> +			return -EBUSY;
> =C2=A0		dev->has_compose_out =3D ctrl->val;
> =C2=A0		vivid_update_format_out(dev);
> =C2=A0		break;
> =C2=A0	case VIVID_CID_HAS_SCALER_OUT:
> +		if (vb2_is_busy(&dev->vb_vid_out_q))
> +			return -EBUSY;
> =C2=A0		dev->has_scaler_out =3D ctrl->val;
> =C2=A0		vivid_update_format_out(dev);
> =C2=A0		break;

--=-pDwT2Q1H3B2P+iXxI7hj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCagSR2wAKCRDZQZRRKWBy
9LybAP9zoViVQa+Js3RjkRAUoTgnNbvmV2vkoMipZJEOMWxQpgD/ZPBxy3a32Q3/
4FZr+NdWemykc+z2ZRa3QpwXEBTQGQg=
=xfOt
-----END PGP SIGNATURE-----

--=-pDwT2Q1H3B2P+iXxI7hj--

