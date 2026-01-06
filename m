Return-Path: <linux-media+bounces-50043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF47CF9269
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 16:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AD0030AFDC2
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 15:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A46533374B;
	Tue,  6 Jan 2026 15:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="2ISf0AgZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27171230264
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 15:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714123; cv=none; b=bREXjRhUhRDblWKhdDWXuEe5a1bkH+d/Fe61Fvsd9Ub9jpXPCn4FXhGa5xaJQhod83L6P74gczH/mhzvLZ8hR9LoXmCil8wGqNGDSPTK5Dlbge+TcHLTWDC77aN9t9C9hE+FYO4v6uujosGTNxD9scG5WzcdxiMGbpf/ShO4rTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714123; c=relaxed/simple;
	bh=ZyHIVjtaj7HpnU+gARNjSz9uHM0V5SJQC9EL6UP72qc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oxDcGF+OrejlE7xhAXIs10+ij2AUWqAP7Gl3028JdYLSj/aYoVqgP6kiSfGkOv2o4SbwunJV20neQVK4k6pK9eGTJjxYxJWgt6dkun3Ep+3z5Yz1L2kPvcMD5eND2gPnXxm2CCBTlCfCVfa02QsVplAtnz9aAUOv9kd7mKhUOKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=2ISf0AgZ; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2ec756de0so106316285a.3
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 07:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767714119; x=1768318919; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyHIVjtaj7HpnU+gARNjSz9uHM0V5SJQC9EL6UP72qc=;
        b=2ISf0AgZNd2FikmqleZOF7zJfem4Vi+KL+2+nsQkwM5B90xD/+uQ+164j+eFwwZtvw
         6MLj+lcuVuacGSVYbkxhdYchc3iPDi0nkk5LPw+HULpirWhSk4FPDoEEm8fZO181hBb7
         7sypUIcn4N0CiSYjhyt6CGMfTuJnSHjZaBjMfmryqVyzW3ZFA6oAdfBPaVLlkBQsNjh3
         0/h5ygbZchB1f14BD8b5sSmKKnGDf0CX51yXP/dsN91r6rNNJSKvpnXbtlf23IKEyAwB
         HZ8R+wKVfzn3hffBQs9dy7A/nMVAI5+fS7WFpgZQKUr2rauRcxel4ASruXZdLWyi3ADV
         8Hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767714119; x=1768318919;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZyHIVjtaj7HpnU+gARNjSz9uHM0V5SJQC9EL6UP72qc=;
        b=sZVTJk0hUT3Sl6N8269uonhDGInSCyOWxb59whPrKNmF00lGUk24nbd/4O7C74kjKJ
         y5aGimgVaXVWJ9Vdb4ojJLHP7sYTQLbTs0EyPs5CP9jkRijrifX0uke+MfijNDGO4aZz
         jxiLnwtm+wwP55HmUrX4aeWcTRdtHV2tKAtR7LWKbCaZ0bvILIc4vQNbyMJThRLzaBPb
         KjgXGhxDsfQNLwF64hkik9iwfrUgm7k3P48KCwWl58wDTkbQ16nqsJKYZc01cr77x28r
         2svaxmtrOf49ZpYiRH9w3/oBxGbJATde4ftzpdbiejawaa0UjzBrwjdKIhOyQlVcJV9t
         kdNA==
X-Forwarded-Encrypted: i=1; AJvYcCWD6o38W2k+PX05M2U0jaY0QSQ+7r1f0dCt0AV7MGSosDakanJOYNAE2Bn887tpG1bel89aNoG7ooIQwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbJMMt+Ozkz62hskKZIuLaczNTH0R3bEH5FI5FuB9kKTf082/Y
	gCjLYAAaqsoi0A3NEMepOJByFYOgJpBdwLQkZCiaudu1UwAv8RFgnHoKIxaWso2IUh0=
X-Gm-Gg: AY/fxX4XcbWt7PSF4iShM60sd//7oPnVJfG+Pk9RbFmP/lUqCltcfbrzL3hX5n+2R7h
	dXtbKQYvZ0x0D4l4Wx+xaVDDAHBgsrpUa8yyahtl5KcDDF7fd3JFRwm7ljtLdO+rJxrr7qqrwP/
	dzMD1lzFNL1B3KcGVVlDZuQYO2ceWJPnJWSK4wAnSwWRNEBS8v0OGm+69X+ehFUDUmb5E/RprnT
	zRMfjEW2q1D1yJn/J8pl831HjlJeSWWl5SDEzK1zXY0qnSK1+lnWm4VCVvL2lfO9vOxDB0clOxw
	FZD+EPg7UjTUT+oaFB+TRvPbhneHrKfOoprfgA3g3IUHpNwnr98tOaZtu/SyT+ya7aGekqWogiC
	WQv71Fft6NBD7Jb0fz4EJNxn/CQw3eydhCkjynvhJ0XOfr+bDAAV+4+I4wJOfUwdE07d2DUWVOZ
	GmpHiTQGJU6KLCxHIB
X-Google-Smtp-Source: AGHT+IGOjr7+Fr5tWYcAPd24+dhrl2pCBfmz4dMnYF307/sgHCL4jktrKPsJUTO8WaP3DJTmPx3M7w==
X-Received: by 2002:a05:620a:4623:b0:892:a186:6b4f with SMTP id af79cd13be357-8c37ebb50fdmr482415285a.77.1767714118936;
        Tue, 06 Jan 2026 07:41:58 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f540650sm187549385a.47.2026.01.06.07.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:41:58 -0800 (PST)
Message-ID: <f4eef909a0f9b787dd4720fe005de0c4e41f5c5a.camel@ndufresne.ca>
Subject: Re: [PATCH 1/4] media: dw100: Implement V4L2 requests support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Stefan Klug
	 <stefan.klug@ideasonboard.com>
Cc: Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, Hans Verkuil	
 <hans@jjverkuil.nl>
Date: Tue, 06 Jan 2026 10:41:56 -0500
In-Reply-To: <20260106145354.GB26157@pendragon.ideasonboard.com>
References: 
	<20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
	 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-1-65af34d04fd8@ideasonboard.com>
	 <40dfd12b585681d8edf9641967160c086cc120c3.camel@ndufresne.ca>
	 <20260106003302.GJ10026@pendragon.ideasonboard.com>
	 <176770897731.12184.12302111059048415045@localhost>
	 <20260106145354.GB26157@pendragon.ideasonboard.com>
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
	protocol="application/pgp-signature"; boundary="=-w6Qd9dvsJZkBofCWsLKx"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-w6Qd9dvsJZkBofCWsLKx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Le mardi 06 janvier 2026 =C3=A0 16:53 +0200, Laurent Pinchart a =C3=A9crit=
=C2=A0:
> CC'ing Hans Verkuil for two questions below.
> >=20

[...]

> > The docs say "a buffer that was never queued to the driver but is
> > associated with a queued request was canceled..." So to my understandin=
g
> > the only purpose of this function is to mark all controls in the reques=
t
> > as being handled, so that the request can be finished.
>=20
> That doesn't explain why it should be done twice per request. Hans,
> could you clarify this ?

I explained it in another thread, it is only called if device_run() is not =
going
to be called, so only once. vb2 does not have access to the the control han=
dler,
so it can't call the v4l2_ctrl_request_complete() fonction directly.

>=20
[...]

> > Nicolas, if I go you right you mean that one might be tempted to do
> >=20
> > v4l2_ctrl_request_setup()
> > v4l2_m2m_buf_done(src)
> > v4l2_m2m_buf_done(dst)
> > v4l2_ctrl_request_complete()
> >=20
> > which feels natural from the names of the functions, but the
> > v4l2_m2m_buf_done(src) might complete the request if it has no
> > associated controls and therefore the later v4l2_ctrl_request_complete(=
)
> > would fail...
> >=20
> > I see that the usage of v4l2_m2m_buf_done_and_job_finish() is more
> > compact and will use that in v2. For the sake of understanding: The onl=
y
> > functional issue with my code is that v4l2_m2m_buf_done(src_buf) is
> > called before v4l2_m2m_buf_done(dest_buf), right?
>=20
> Is that an issue, why would the destination buffer need to be completed
> first ?

The VB2 media_request_object is being removed from the request once the OUT=
PUT
(src) buffer is marked done. If this was the last media_request_object, the
request will move to completed state, which will signal its FD.

If you do that before you mark the CAPTURE (dst) buffer as done, an applica=
tion
that uses non blocking IOs may endup calling DQBUF(dst) too soon, which wil=
l
return EBUSY. Since we really want the request FD to be used as the only
synchronisation point, we made the rule that the request FD must be signall=
ed
last. Since its error prone, and its not illegal to synchronise on the devi=
ce
read/write/pri state, we made a condensed helper for it.

Alternatively, the manual request completion is being added for cases this
implicit request completion does not work, or when it makes everything too
complicated to adhere to this rule. This is the case for dual-stage video
decoders (MTK/RPi).

Nicolas


[...]

--=-w6Qd9dvsJZkBofCWsLKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV0tRAAKCRDZQZRRKWBy
9I2cAP40X1kizGKniAJpnsxW2HVfKMWON8DejJHlAutRKMtHtQEA9121yKIa29+0
ZM9e4HsunUX7z6c6rzdYPCcV1KvYeAg=
=PX6j
-----END PGP SIGNATURE-----

--=-w6Qd9dvsJZkBofCWsLKx--

