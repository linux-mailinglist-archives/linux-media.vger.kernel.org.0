Return-Path: <linux-media+bounces-62183-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHjyOq26DGrdlQUAu9opvQ
	(envelope-from <linux-media+bounces-62183-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 21:31:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4825458434C
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 21:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EFB3308AAA3
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 19:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1A93FC5BA;
	Tue, 19 May 2026 19:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="rFDJwXG6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA683B0AEF
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 19:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779218998; cv=none; b=LdggSL1OzY0L0EHGnQKXrszvVFoeK/jcFMXP3C6P129iPkhLzMSxhXIO/8p/ex+GwwCAgIUtiAcas4eE/MW+jUuSnQhAAOg0n3qNBP0EVhfB1rcEaNwSSDQ5NuEUNmIYJkGXrxf6P/MpeNZdrguNF1MR9qpVedt35TAPvi0r32A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779218998; c=relaxed/simple;
	bh=yQW6dRTNt83WyAWAvstLtBGRHv64C6aPVrxUhn4o9HQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eGDceMYLGzP789T4Y2XPD1LqQZUb2j+z0EK8AtSamw2obdLu+H3J5RDqg2fjyuenxcrJhTRpNnBoB944Tj5PUrLhtZgiikbfBE0LtQz0uNcwB9cefTsE8ozb6ajd/IjoqYHRnmuoVHepc4eABgI4yxvxJzlTOTvBwJDvAPV83fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=rFDJwXG6; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50fbd79350dso44905061cf.3
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 12:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1779218995; x=1779823795; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4M86rAxveSyVuv18HzVxsVJr93NM4I0UiJ6QT00XeXE=;
        b=rFDJwXG6grhCNbMtPaQ+2V/gu8UhxiftA9HnlqrFh/T5AvUpiDcMkINHtZ63zeBnrb
         gErHwD8AgnLKyLiGCr5BJbKOYZquKc2gsskV2S6gjxYqkROfZTY+jmQ06PyUC2uwjBt2
         +o9ZX+balz9oEj2AgoEeYRKUAtiaZJD4Qj/VwkMKbE1/JHKddIaGRUiQepzz4g8vEAGE
         /YntkhOIWv2G6P86q3GEuEvP2VBI8EFJl2v8ltlaoYJ5Jrlm/vRe/olZTp/uyuVuM8go
         iU8xFqqZxiwK1NX5Lw7yZP161ELBj9ajS/0OFVuX8YwA2COrbTvbV6W6WlhselhFhCMn
         r3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779218995; x=1779823795;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4M86rAxveSyVuv18HzVxsVJr93NM4I0UiJ6QT00XeXE=;
        b=QTnVyIL368fPUd9Ub5+FMWbua3coTzs8RB92PDE43MD88SBj6ExV12mkhteCXmvNDd
         TdJSfvo6VzLperRVXxTAd1Q/wTfqMTlnS8waONKbydmGzegZRm+gBCDe5QAumZtcni+m
         xvnPQ0jCEH0i9VNzF/ABw4/rVELBFHIenFXYIl0fDFY5P5OOjnel+K2ZqaaqFHY1/Dq4
         LJWT0vYU4MUrOLliNvbv9TUeHb0PDH7J2JcSYDRG6EsqBq+pd2Wcf3WlGZ3UxjWLSnXv
         /iOH3Vg6Cj1fOuWgNaiE1cLTMElzfnJYhvO+kvZbf3fDnnKsrn7P+KdVOWblhJOkYuwc
         mZ0A==
X-Forwarded-Encrypted: i=1; AFNElJ+DQZBJEAkNUNj+KoplgmfoHLIdEoxlcx3/RUS2KXqggjtukThWzf7oiFcpycHiCQCib6+4QUX5a63TaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Y3rjcyDwdAiq7aU5CKAa/J7tBsqh8yJokTwod+eDPBWi0bbJ
	SUDso+o6bcUemxxsiSBN7hHAgTab2S6kXLWWkmbDp06GY6nPP68q7rZw6xmDyloLi6g6yvNqxwN
	UcWLp7XQ=
X-Gm-Gg: Acq92OGnVfQg7JoHPMk5BiVIuM9OuX3MwYKcBd+ZTG/lGFUiF3fenz/nTprb3fBLiBk
	pFTCukbHUPvO+87o8yW/lglcEyiDHg29OKGu115TmRdM/hCPpLB5Gm7KCEop1JucKvxFFSzxMv5
	wF0XbFaGnX3T5Cyze9DQx6FDP9bjs23DJgoTn5Y8qZWtrpCDlAf0vM+kH34zllBiQ/PSLGPnz/6
	rgJ/ebYjkSrGng58MWS7pPFS+Y5iq7YnqwiqB1Idy+VjcCkptLiMufd3X0QwFGG9H8pKJo6BGJe
	7UkPSACqrme6hS+dgKSmLwmnr9RAhwZgeVXkwgUr3z3ATwsfVAthE88tdENKzJRLplup+uQP7xm
	uo2THBFwzyE7juugarA+nV1BwSNFcoYxl11wzbBwVlTgY1N0b8Q93sJiwASuxRASzqPVO5EX164
	qbv+vJC0aRS1B2rU+gPMhazmrDS0IBfByVAFadZ/YPEdua/2wfIIuLDm4oZe5CJu7mWJRe5ujZw
	Gk8WnQ=
X-Received: by 2002:ac8:5cc5:0:b0:50e:601a:217f with SMTP id d75a77b69052e-5165a076dcamr292940961cf.25.1779218995025;
        Tue, 19 May 2026 12:29:55 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5164585cf66sm176781561cf.30.2026.05.19.12.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 12:29:54 -0700 (PDT)
Message-ID: <cdc726553b50cc1b4de91e784fe5d4b2c9c2da4c.camel@ndufresne.ca>
Subject: Re: [PATCH] media: vivid: check vb2_is_busy before calling
 vivid_update_format_cap/out
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Linux Media Mailing List
	 <linux-media@vger.kernel.org>
Date: Tue, 19 May 2026 15:29:53 -0400
In-Reply-To: <655cfcf9-d015-49d3-886b-1c4a38553aab@kernel.org>
References: <3016ee7c-9a4f-4fcf-b17f-0dce5bbc9260@kernel.org>
	 <67cd61cb2dd1988f3ccc93e7eb1eff42014ce830.camel@ndufresne.ca>
	 <655cfcf9-d015-49d3-886b-1c4a38553aab@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-LqCjOrwU93aHz1C2aiDy"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62183-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,syzkaller.appspot.com:url,ndufresne.ca:mid,ndufresne-ca.20251104.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 4825458434C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-LqCjOrwU93aHz1C2aiDy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 19 mai 2026 =C3=A0 15:30 +0200, Hans Verkuil a =C3=A9crit=C2=A0:
> On 13/05/2026 16:59, Nicolas Dufresne wrote:
> > Le mercredi 13 mai 2026 =C3=A0 10:52 +0200, Hans Verkuil a =C3=A9crit=
=C2=A0:
> > > The vivid_update_format_cap/out() functions must only be called if th=
e
> > > capture/output queue are not busy. But for several controls that is n=
ot
> > > checked.
> > >=20
> > > Only when streaming starts will they be set to 'grabbed' and it is
> > > impossible to change the control, but between REQBUFS and STREAMON yo=
u
> > > are still allowed to set these controls. Since vivid_update_format_ca=
p/out
> > > will change the format, this can cause unexpected results.
> > >=20
> > > I suspect that this is the cause of this syzbot bug:
> > >=20
> > > https://syzkaller.appspot.com/bug?extid=3Ddac8f5eaa46837e97b89
> > >=20
> > > But since we never have reproducers, it is hard to be certain. In any=
 case,
> > > these checks are needed regardless.
> > >=20
> > > Reported-by: syzbot+dac8f5eaa46837e97b89@syzkaller.appspotmail.com
> > > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > ---
> > > diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> > > b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> > > index f94c15ff84f7..e40ff999cad8 100644
> > > --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> > > +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> > > @@ -608,18 +608,26 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctr=
l *ctrl)
> > > =C2=A0		tpg_s_vflip(&dev->tpg, dev->sensor_vflip ^ dev->vflip);
> > > =C2=A0		break;
> > > =C2=A0	case VIVID_CID_REDUCED_FPS:
> > > +		if (vb2_is_busy(&dev->vb_vid_cap_q))
> > > +			return -EBUSY;
> >=20
> > It is unclear to me why users need to free all the buffers to enable th=
is
> > feature.=C2=A0 Should that one only be limited to not being streaming ?=
 I believe it
> > will only affect the HDMI DV Timings and the frame internal in params r=
ight ?
>=20
> The problem is that vivid_update_format_cap() resets the format, as you e=
xpect
> when changing input or standard, or timing.
>=20
> This control implies a new timing, so that's why vivid_update_format_cap
> is called. And that requires the is_busy check.

I did check again, and the timing is only changed if !vb2_is_busy(). That
matched my first impression that the vivid_update_format_cap() just copy ov=
er
the same information without actually changing it.

>=20
> It could be implemented differently, but then this control shouldn't use
> vivid_update_format_cap().

It would be much more elegant to separate the changes from each other yes. =
At
separate between what affects the v4l2_fmt (memory allocation) and what doe=
sn't.
Also because its very error prone to trust vivid_update_format_cap() to not=
 have
any side effects.
>=20
> It's something for another time, for now I want to be consistent in alway=
s
> checking vb2_is_busy before vivid_update_format_cap can be called.

Please add some sort of comment, so future visitors knows this code is
illogically tied together.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Nicolas

>=20
> Regards,
>=20
> 	Hans
>=20
> >=20
> > > =C2=A0		dev->reduced_fps =3D ctrl->val;
> > > =C2=A0		vivid_update_format_cap(dev, true);
> > > =C2=A0		break;
> > > =C2=A0	case VIVID_CID_HAS_CROP_CAP:
> > > +		if (vb2_is_busy(&dev->vb_vid_cap_q))
> > > +			return -EBUSY;
> > > =C2=A0		dev->has_crop_cap =3D ctrl->val;
> > > =C2=A0		vivid_update_format_cap(dev, true);
> > > =C2=A0		break;
> > > =C2=A0	case VIVID_CID_HAS_COMPOSE_CAP:
> > > +		if (vb2_is_busy(&dev->vb_vid_cap_q))
> > > +			return -EBUSY;
> > > =C2=A0		dev->has_compose_cap =3D ctrl->val;
> > > =C2=A0		vivid_update_format_cap(dev, true);
> > > =C2=A0		break;
> > > =C2=A0	case VIVID_CID_HAS_SCALER_CAP:
> > > +		if (vb2_is_busy(&dev->vb_vid_cap_q))
> > > +			return -EBUSY;
> > > =C2=A0		dev->has_scaler_cap =3D ctrl->val;
> > > =C2=A0		vivid_update_format_cap(dev, true);
> > > =C2=A0		break;
> > > @@ -1116,14 +1124,20 @@ static int vivid_vid_out_s_ctrl(struct v4l2_c=
trl
> > > *ctrl)
> > >=20
> > > =C2=A0	switch (ctrl->id) {
> > > =C2=A0	case VIVID_CID_HAS_CROP_OUT:
> > > +		if (vb2_is_busy(&dev->vb_vid_out_q))
> > > +			return -EBUSY;
> > > =C2=A0		dev->has_crop_out =3D ctrl->val;
> > > =C2=A0		vivid_update_format_out(dev);
> > > =C2=A0		break;
> > > =C2=A0	case VIVID_CID_HAS_COMPOSE_OUT:
> > > +		if (vb2_is_busy(&dev->vb_vid_out_q))
> > > +			return -EBUSY;
> > > =C2=A0		dev->has_compose_out =3D ctrl->val;
> > > =C2=A0		vivid_update_format_out(dev);
> > > =C2=A0		break;
> > > =C2=A0	case VIVID_CID_HAS_SCALER_OUT:
> > > +		if (vb2_is_busy(&dev->vb_vid_out_q))
> > > +			return -EBUSY;
> > > =C2=A0		dev->has_scaler_out =3D ctrl->val;
> > > =C2=A0		vivid_update_format_out(dev);
> > > =C2=A0		break;

--=-LqCjOrwU93aHz1C2aiDy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCagy6MQAKCRDZQZRRKWBy
9AqVAQDP1uxdJgoSuo/QsLzlY3mLAAfhnwg/pJJaLEXAU9Tq2wD9Hx1QNcGiD0a2
82EK/NCG+A8rH2hf82FJxKoFHIiNow8=
=6+1T
-----END PGP SIGNATURE-----

--=-LqCjOrwU93aHz1C2aiDy--

