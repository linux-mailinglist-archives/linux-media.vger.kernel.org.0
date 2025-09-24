Return-Path: <linux-media+bounces-43071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 072D8B9AC4C
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 17:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07BE4189621A
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 15:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7A331283E;
	Wed, 24 Sep 2025 15:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="MH/NzWFm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19D73002A9
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 15:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758729034; cv=none; b=b48sHjsZYKyiXJxqClfRnm75Wn5PFOwzQt3AnhAfz6gtr39GNuWDSkt+v4c53CrJa4IQwzOHunF1YwLU8aIlBejBg1vbONgs/32zT53sH63qyrXHh5H0JfM8cVbsqd8zgsTHBJXs8d3xaSjm8QRPgOjWaO5Js84lIPqEkF9d6Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758729034; c=relaxed/simple;
	bh=3HFVHU2A86JsxNXWuaSgCTlzKZ3pf22FDrMEBP9wlaM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rdqpj9Ojk/gIUX2GEoFzNkgdU5B+l5+CLXwFzWoFMvOjNM7/MAN1mKTb3T2nKq93HWfMvgK1X+MQaF8muPqHAHPtFNd0MO0dXpkjKEVTDAlnm4VJ61z8r6VqkXdHuqHCBeYNXjA5kr5sub6MMdXelnUJvuVYgZi+UcT8mImfa7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=MH/NzWFm; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b3d3f6360cso2911cf.0
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 08:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1758729030; x=1759333830; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wKYKt3wBpNWpKAvLvz/Y9fS8qlda2gni+8GdP2SiBRk=;
        b=MH/NzWFmMK66WDJO0EcpeK4YNLynWzOQlyauaqvCkKb3hlA0JQn91tXAOyzlwp+b+o
         +wo6IafMnp+3aS9zFGtnQKugNM3uebSQZJ/ab30xfp5WBXV2fBzdPTbd2Gn64JC1wJMS
         mtLWtCQxbfwh9gO3CVdTwsorBka/UWYstT1vjOplFKOgKdOV2XHRFJ4dlv7G7/B3msSu
         oLh54+K20hlX3OY4CacgIe6uSMLi77toaBXRIjX9yBgwYA2vnr1cNv+vIjNrHIqZIlAK
         qQNmzgKhITzTwRRweswLiC5EqsUCB01mTUwvzvH1OKnbkcAEZKlqZadqHGJeVIAvewxX
         QPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729030; x=1759333830;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKYKt3wBpNWpKAvLvz/Y9fS8qlda2gni+8GdP2SiBRk=;
        b=sFYnrGY6pBPPCkdgIdAoblut1gxN08SjuSm2TJ0xR5tuYj+NuZCmfUxHQRP3qRcNJD
         rCkAl1NlqZ5JyPLc582jtMx/oa4OJGbvId6Tsf/2UpawGYG21OI5LcUK2+EG4Qt4j1Nt
         F73uztaMXva19Yy7slZEc84OxsOvCNIMdA7BuKbuU8LJsKYjz0d04UEZxBBqLv4mB7dW
         BZHRpo34VAtE3dWjdh7cDHmwjQC0gJYrzUEkLBeutFUx9hhYyYa3m/K+eifxAdMlXLOy
         BeLppenbxzS1ky8NWqyLS5obzRi+L1bkN3iToiJxMMBe4M3r3kqyYIZsB2HIl4ESOXil
         XApA==
X-Forwarded-Encrypted: i=1; AJvYcCXqL8YP6NSqbiIq3cdHk3lXRp/t3OdgCq7lmsjhcyRQ+Kxy0E352y3agsFCWnvC7HKnXxYmcl4yLxMZMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YziJsZAePdeULO7VsN/ZK2SlboUQqLfz71v1Jj8c/sQFbH+KSHh
	GTz29+yzJAmSzAw/+UW6mPDA2BF87hIMVmIdWPp90z/XPODUJWlShB0JD9q1EwM76TI=
X-Gm-Gg: ASbGncuFEL3tZmhBbp417Zpe6VhhYog7MJpTr7QdZ8MEIOQcEdiEdk30CVeSY4zbLWL
	LNzV6al3/A3WkkROx450QarhH8T7Ve7snuun4KY2x4gFRFRoI9jKPmHX4l6eUVdCQbfuSiAc6Z0
	5ab9HGhwxFhBm9TochOR9qEWA6w/s3GYYjGFzdg5b0cYgbQ92tbFSb2XIe6AZYE/EJ3VZE/TkT5
	g0djfVedRw/GbKI2ohOiORVNH1I5vmYv5YnU+d8GTwn5xWNzrfuICiljp85Fw8IH65FISvrzs7a
	YaHz8Z5osn8Tt2Ewct4c9r4HwmBrGbId01bCQEQHLamZhq6szWnGbNiD4lYSraQsqauixnVhHzC
	8mJFxdaI7QnUbUUuAjtY9sfUaIiLW
X-Google-Smtp-Source: AGHT+IHFDw/Eg5JWh7qPZieLyWp9NXunBGjbJijvunF0rhToS+dVyRBZ8XDISKVOXGkGM4owfaf9Vw==
X-Received: by 2002:ac8:7d8e:0:b0:4cf:b74b:e1af with SMTP id d75a77b69052e-4da4c1aeacfmr3705331cf.63.1758729030340;
        Wed, 24 Sep 2025 08:50:30 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::5ac? ([2606:6d00:17:ebd3::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-79351f713a5sm109494106d6.44.2025.09.24.08.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:50:29 -0700 (PDT)
Message-ID: <b3c3a9b47a2075f6a0acc1ee501f885d4997679e.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] media: iris: Add support for QC08C format for
 decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Markus Elfring <Markus.Elfring@web.de>, Dikshita Agarwal
	 <dikshita.agarwal@oss.qualcomm.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia	
 <vikash.garodia@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 11:50:28 -0400
In-Reply-To: <ce08ae79-8f7e-4a37-85b9-d86c10567881@web.de>
References: 
	<20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
	 <ce08ae79-8f7e-4a37-85b9-d86c10567881@web.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-BGkOL5lJ8hoFaStaZV+n"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-BGkOL5lJ8hoFaStaZV+n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 24 septembre 2025 =C3=A0 14:32 +0200, Markus Elfring a =C3=A9cr=
it=C2=A0:
> =E2=80=A6
> > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > @@ -261,7 +261,10 @@ int iris_get_buffer_size(struct iris_inst *inst,
> > =C2=A0		case BUF_INPUT:
> > =C2=A0			return iris_dec_bitstream_buffer_size(inst);
> > =C2=A0		case BUF_OUTPUT:
> > -			return iris_yuv_buffer_size_nv12(inst);
> > +			if (inst->fmt_dst->fmt.pix_mp.pixelformat =3D=3D
> > V4L2_PIX_FMT_QC08C)
> > +				return iris_yuv_buffer_size_qc08c(inst);
> > +			else
> > +				return iris_yuv_buffer_size_nv12(inst);
> =E2=80=A6
>=20
> How do you think about to use a source code variant like the following?
>=20
> 			return (inst->fmt_dst->fmt.pix_mp.pixelformat =3D=3D
> V4L2_PIX_FMT_QC08C)
> 				? iris_yuv_buffer_size_qc08c(inst)
> 				: iris_yuv_buffer_size_nv12(inst);

Please don't, this is less readable and have no explained technical advanta=
ges.

Nicolas

>=20
>=20
> Regards,
> Markus

--=-BGkOL5lJ8hoFaStaZV+n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaNQTRAAKCRDZQZRRKWBy
9M4hAP4xMwFl82DVj9T4UD6n+w1SjuDmzrNmUl3WHwoFFThJMAD/de71Hs2BOyqL
rqF9js4QRLUpv4wRTLhyGSuePA0+EQ0=
=v93q
-----END PGP SIGNATURE-----

--=-BGkOL5lJ8hoFaStaZV+n--

