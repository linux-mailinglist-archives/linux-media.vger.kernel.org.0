Return-Path: <linux-media+bounces-43746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A60E3BB7E76
	for <lists+linux-media@lfdr.de>; Fri, 03 Oct 2025 20:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61A584A60B0
	for <lists+linux-media@lfdr.de>; Fri,  3 Oct 2025 18:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C062DCBFC;
	Fri,  3 Oct 2025 18:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="A0yJ/qWN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E03B146D45
	for <linux-media@vger.kernel.org>; Fri,  3 Oct 2025 18:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759517034; cv=none; b=rC+N36Pba5Kx4QqBmeX3XDoxzI1enInLQpDqyWc4qefUz+msPizBYKsVtiVWSNuh7KpANtWuJ2+XoXgng5nrJi158UNEtcmdVZRGcnHTDLXxOLISJRpvQHhhbd7bMkm0NhreVLWwzadxA120LxeV/23j9HN4RXBV0Td/iIIU3To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759517034; c=relaxed/simple;
	bh=KuJJ7wPVxagNcyryDtFWOnS+fG9VHmibRREcQW+NV/U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E7aWaVIFJqlVxdGX6drOSO3q1bDtqV2+g2JnUQyGXdnySOod6ThOpdOH5mC80VCngISrFubjImAvgH6gEv9YD3WfrbEMGNBjQnbgSCWLb6htG5HxZKAPOwEizD3Q25BncbVFsxUfUmPfzS6naF9C9ezM2jChcfXaGb2GKUUpQqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=A0yJ/qWN; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4db385e046dso24911201cf.0
        for <linux-media@vger.kernel.org>; Fri, 03 Oct 2025 11:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759517032; x=1760121832; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KuJJ7wPVxagNcyryDtFWOnS+fG9VHmibRREcQW+NV/U=;
        b=A0yJ/qWNbcr7ubEqchnEVLY21gcL9dd7x36XzsQQiWSgFSKBwlflB+mCISesMDLDtI
         ZmB83kmsd3gnF2fOIoABa90Uaa2ysGqlG1xlsF0VWFidow9F2dJwg3RXRmAfQlcLs5pC
         GLUPp400xjkD13uyfPJ3SieF7pFiVXvU9EIUiFhSvZ3RCcOkP5m6a9E5UuCbE9hbOYQ0
         5dvohojuBJQSIMox5cgC7t7PhBoASgS8k29RJFUee6NeT2/Ik49/J68QSwkmvKAKvtR+
         iDgz4iJ36BXUrSqxBMBKxHX2c6nTMYOW+TeXc8TN5nbGSN3Aqgc2sf4PDcV75Vjxu530
         JW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759517032; x=1760121832;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuJJ7wPVxagNcyryDtFWOnS+fG9VHmibRREcQW+NV/U=;
        b=OvEb2IabGcTQpBPbLtcbCfk/ThpGH5uBrpVVoIxBvXsZQip9plLON3Jhq3bjt7nSyH
         9FHOXGNcMa3h/Xd8T4hyPk+3SoyQ71hY+U5IdcBN5eUjkWS40pJIRi4verHDCHVyGpTN
         OSKuEyR8/R6+sOQqiszCW0nwax6M6aDhTtRuEvBPt7hfmHurFJIY/E+FIcwVrpmvdI+M
         m/INtleoD2E2Oqp7U7CAe0yUrV5TmSgd0siCGBqo4uX57LGh8B42loELfAr4UICriJ1S
         6mSPWT/obwMkIiWi/u36X/A2eZ4M5ETkXjoLAc8q3uEGj5TGPOPIP41CfusVGGiwvb1h
         aojA==
X-Gm-Message-State: AOJu0Yw0ttV/J0EdZ690E/2JsBLUm1Drb75sAZYuuDedLij3jU56rgm9
	+9dbUTJImASgPFZUe25UCNsE6A/7l7nbIzzRfU3Dssx002UlSP8bQ8iCT6EFvGcpmWM=
X-Gm-Gg: ASbGncvPSyF/41spJalDnhtYzKWYIR+WGqLZGE7Y/z8s07S1hRb0tofw6/h2p5ig462
	c1huusaPbBbLkWTHtwrqOUStJ98LYAe1f0JM24utKGOW5y21YFueG1qi32O6XhEM9X2FGDB2oec
	sI9wrdf9snOh3XcSM5O0Wv6RuLVbR1IeBkR0zi5CXoEYhXU4Y4NCP7YerD5ByBMDVlJJJwU5oUb
	uNb2o8cp9HOQwsvrfnXYnsPCbu6sr487UjRSpRC0Gd3+TXzWV3kKUbdmK9nLwhjgE5ohBXWtq9a
	kO8V5XD7RiyIn36PJzzXUw4gSQGW/qdcMEZMoVv2XFfpKLAgHsbE35jjw0dcHrtX33/46d+hisx
	VI3TMDpJfWAo3MSsoiSkKOpe4X+0rXoWyQCeELsA5eBjm73FSfpQezBdndEiBzYwQkWvAEtAcA3
	wiiw==
X-Google-Smtp-Source: AGHT+IEDlpFweYYZYgSWaGoyFOuU/0LvqNP2116tlq90/2vF46MndprjZ3cScKJFz7EmEJI0QMDqjA==
X-Received: by 2002:a05:622a:5144:b0:4ce:f3ce:e9da with SMTP id d75a77b69052e-4e576a29decmr64079041cf.16.1759517032239;
        Fri, 03 Oct 2025 11:43:52 -0700 (PDT)
Received: from [192.168.42.140] (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55c9e79ffsm50039171cf.29.2025.10.03.11.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 11:43:51 -0700 (PDT)
Message-ID: <cfaa1ceabae30fa18b5b4136e1eb58aec4fcf045.camel@ndufresne.ca>
Subject: Re: [PATCH 0/3] media: allegro: fixes and improvements
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Matthias Fend <matthias.fend@emfend.at>, Michael Tretter	
 <m.tretter@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 03 Oct 2025 14:43:49 -0400
In-Reply-To: <20250901-allegro-dvt-fixes-v1-0-4e4d493836ef@emfend.at>
References: <20250901-allegro-dvt-fixes-v1-0-4e4d493836ef@emfend.at>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7CZOag6us981g1lPWt9e"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-7CZOag6us981g1lPWt9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathias,

Le lundi 01 septembre 2025 =C3=A0 17:13 +0200, Matthias Fend a =C3=A9crit=
=C2=A0:
> Several fixes and improvements for the Allegro DVT video IP encoder.
> These relate to race conditions that occur when multiple streams are used
> simultaneously.
> The problems could be reproduced on a ZCU-104 eval board with VCU firmwar=
e
> version 2019.2 on various kernel versions (6.4, 6.12 and 6.16).
> It is highly likely that these problems can also occur with other firmwar=
e
> versions.
>=20
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
> Matthias Fend (3):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: allegro: print warning if channel c=
reation timeout occurs
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: allegro: process all pending status=
 mbox messages
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: allegro: fix race conditions in cha=
nnel handling
>=20
> =C2=A0drivers/media/platform/allegro-dvt/allegro-core.c | 114 +++++++++++=
++++++----
> -
> =C2=A01 file changed, 91 insertions(+), 23 deletions(-)
> ---
> base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0

For future submission, base your code on current media-commiters/next not o=
n
current Linus RC (this one is rc-4 I believe).

regards,
Nicolas

> change-id: 20250901-allegro-dvt-fixes-932f2c97063e
>=20
> Best regards,

--=-7CZOag6us981g1lPWt9e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaOAZZQAKCRDZQZRRKWBy
9EacAQCm0ei0RG1X/oXU/A+sx+JDaat1yQ0RhRBh5z5a5nJUDgEA37Yvc+InVtUH
UdhAsnH2C0eb9azkaZvFGRMlW/+o/ws=
=cFmb
-----END PGP SIGNATURE-----

--=-7CZOag6us981g1lPWt9e--

