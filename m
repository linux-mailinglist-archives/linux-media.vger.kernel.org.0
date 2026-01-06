Return-Path: <linux-media+bounces-50046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A4613CF931F
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 16:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 205203053783
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 15:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E3519CCFC;
	Tue,  6 Jan 2026 15:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="boUNaX+/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB72B22578A
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 15:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714974; cv=none; b=K55fmL1B9W0hzf6DQXg/+SyjfzzFJacm+RcasqlLjSGUcolIVW+N1oKqhTbT5rVA2Xx/89X7hAIFQ+SeNeK3L5R+2tib1Hd9rViWbZC9bJvxQgu+V9prAh+XSH5lXtjS98FFDwQUuFFVMiHN0mZHzZWfOs/sysRBWbPnU2Jz6fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714974; c=relaxed/simple;
	bh=JWy3J0zt4DIlNc6L8QadHe8I+XVry0F0Z6dMfHWb2UM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HT6mORqCM8I2u0b6hCVhG0x+cpeCuP/JSAjyOxOJzb2EZ46F/j6AQOX6UHG/whCudvCcGUCdwXuuPQgiGamWevEB3dXgkYZw0TuCCPMLV6XNL6amIvDPztAeTX0gScoRAOclo/UcMpeJSY7LHe2myLDQcHXPAR7vmoUsMg4gngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=boUNaX+/; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c2f74ffd81so103059585a.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 07:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767714971; x=1768319771; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JWy3J0zt4DIlNc6L8QadHe8I+XVry0F0Z6dMfHWb2UM=;
        b=boUNaX+/USxFZnkXQJna820Z9xWEp2TQjwXFBuNhSlTiaRO3sqHV36crohslG0tJuS
         UKi6Hqy9WGOxl8VUhA5qCuI6N1iujWkQ5BcZFvqU4jbfBQA4h579GpjmhS49ZqvvWXPl
         W8wHGMcWz4kuKbc06w5EIhKAigHp0Kb5QLyjhmIsf5Qub985dMIFkvKjni8uf/Jw39FA
         E9LdHhymarXXrmrdalu/oIeaJ3/KhIyXFt+uMmjvPyZdLsSSFFjeIZzB1aIR2MOyQJ/2
         3j+kVInL6U1pARvyaihWfYUuBnp70sxhFR8YT1z9wOmjN30z8c+Rgabtx0jKoNBZaHkM
         oIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767714971; x=1768319771;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWy3J0zt4DIlNc6L8QadHe8I+XVry0F0Z6dMfHWb2UM=;
        b=qD88m15RJC9RqyzRm30XZYGozJVQxLT4F+lNerjuT/FBsjhsy0LvruKnn/tJG9P4WG
         IwK9c/Z4i2PtersqvJopvp5mAoec9PG/rXnAuHVEK3PKfG1thhMxvLiUJvYI9+o0nkeX
         dnX1wqHrS2Y04pPcZJBcaBJVm6uWoy2sCpKUNR+8bH14sYJS5C8u2EKyj/B0HUQb/aTg
         BkQP8Y+yZ/ub+oPIus/tWN4wf5sL/Nz9TtNHPK3lGjZGCTkLTuUv9vsy8715RCWWtqy/
         cflBrcHfxPSqMoAQOSU09BovvIiQdbtB0UoE98FcrWUkhUyLh0eU7MEELuEG1Hjd6VXQ
         6KEA==
X-Forwarded-Encrypted: i=1; AJvYcCVf8KTozMPXjVefzR6dUa6u4r4LrSlj6st2ghsMNrOi3ZyrpTLmHcGRe+vSrY9efxCrPeu/5wE13t9maA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdydc+jOUpI9GvgxIq5W4Pu+do+Aq4m0dAcA7MNB/tx5jSOrE/
	/+BRDnfedxsP/ajZsyWE6PdJIPvUN6UfSo42SIhvoCYC1NLmYahIVw0gbfgViHYdwoDQvxl1UQl
	J/wxb
X-Gm-Gg: AY/fxX5RfTWGR3xa6DnSPHYyL20zcNu1iBZRoYHr3Eq8EvpbOHnV7udtBMUBJIaRgTX
	gqRi4CATWHqyM1kdMRJJfeqkGsN9AI0k/uW6e0N5WFOqNZ7IjDn3jUXesCXnZitX3VGkrKf52ed
	PQ7U4tKOg2oJ1wAl2cS40johyRk6MIRWiasTvbPhgCFoH4CWA/PlS/aYF/MjsyqFxIh+FIi3pva
	mm9yy4VFU3EGbiFVTLqeyKxnyb38QbjCKXQIV4xg527XVIJtVFJLcbG950lXnl+7nQsuZioZU6r
	5WDEsMknJs9C0TcZVsEYyGxtNZZ4XOOAxE0vsB6NdGYW94QGODjEDenktrK42L1PTHY4DsxmOt+
	aCoI7ZJFTRbYi79PwsSltJUf06ql5snCZWkh0qnc6Vmii0EQ8fZtEcQhcSCW4uNpr1XL+pBpCw3
	NshZcOrOA7be39OlJL
X-Google-Smtp-Source: AGHT+IFcJDnJW/Z0dC+HeS6Kko6LXBzoNKTMAqBHPfJPQt5lkEswSkCPkEH16jRQPqojEkS3QsGDOA==
X-Received: by 2002:a05:620a:2801:b0:8b2:f35c:16df with SMTP id af79cd13be357-8c37ebee315mr448710885a.79.1767714971505;
        Tue, 06 Jan 2026 07:56:11 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51b732sm184928185a.25.2026.01.06.07.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:56:10 -0800 (PST)
Message-ID: <c4f20e7f67f40b13469ea2504f0990ddbce59708.camel@ndufresne.ca>
Subject: Re: [PATCH 1/4] media: dw100: Implement V4L2 requests support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>, Xavier Roumegue	
 <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sebastian Andrzej Siewior	 <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt	 <rostedt@goodmis.org>,
 linux-media@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, Hans Verkuil	 <hans@jjverkuil.nl>
Date: Tue, 06 Jan 2026 10:56:09 -0500
In-Reply-To: <20260106154517.GD26157@pendragon.ideasonboard.com>
References: 
	<20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
	 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-1-65af34d04fd8@ideasonboard.com>
	 <40dfd12b585681d8edf9641967160c086cc120c3.camel@ndufresne.ca>
	 <20260106003302.GJ10026@pendragon.ideasonboard.com>
	 <176770897731.12184.12302111059048415045@localhost>
	 <20260106145354.GB26157@pendragon.ideasonboard.com>
	 <f4eef909a0f9b787dd4720fe005de0c4e41f5c5a.camel@ndufresne.ca>
	 <20260106154517.GD26157@pendragon.ideasonboard.com>
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
	protocol="application/pgp-signature"; boundary="=-0n+5qroluuyyHlNQ2ext"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-0n+5qroluuyyHlNQ2ext
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 06 janvier 2026 =C3=A0 17:45 +0200, Laurent Pinchart a =C3=A9crit=
=C2=A0:
> > I explained it in another thread, it is only called if device_run() is =
not going
> > to be called, so only once. vb2 does not have access to the the control=
 handler,
> > so it can't call the v4l2_ctrl_request_complete() fonction directly.
>=20
> But the function is called per queue. If a buffer has been queued on
> both the capture and the output queue for a request, won't the operation
> be called twice with the same request ?

Only the OUTPUT queues allow for requests at the moment.

Nicolas

--=-0n+5qroluuyyHlNQ2ext
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV0wmQAKCRDZQZRRKWBy
9Jn7AQDeyY4kjtpnZZG7JwEnqTOs+lyxO60lExoeWpE5drqSugD9HD7kzWveYVB0
UnBGGCZ6tW977jr9M+F4FcuB09TOmwk=
=F7kE
-----END PGP SIGNATURE-----

--=-0n+5qroluuyyHlNQ2ext--

