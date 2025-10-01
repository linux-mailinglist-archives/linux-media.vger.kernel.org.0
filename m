Return-Path: <linux-media+bounces-43471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA41DBB08EE
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 15:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 576D117C001
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 13:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4850C27380A;
	Wed,  1 Oct 2025 13:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="vqC6kgC5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9B32FBE14
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 13:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759326482; cv=none; b=LF8ERdQpl/+Ai3RseFzV2t+iPELFmcHFn+aNJxEnMzh1O05mpbhK6Ulds1ki+pGwdPwcYIzfVrqt+Y7viSaFHgTBx09crQlkJ3XO1RM9Tp2TVds7O9QWBfm/2YK5bicCYhXR75GlCsAWErk37gNwKgPYqohZZTgimZ95AyAa2Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759326482; c=relaxed/simple;
	bh=GwWiPxXWApSuBjTieyfbH0uVPyK1qpzobUKX5yWOe8Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UDmmfmK9Tu3bEnn8MZBLntuh626kW5uANrl/AjxXUsCah2UB0JeeD5qH5yQ2ceoh8hhx3ahxA1ltf1sSm/CVkxAj1WWBvqoM3IU7weMiefkVN8kNDFUpHhKNIsEjEiLPwaVX4I5LPUNTPzahRK3h/uy1wN2BtTCPih14fkwbosk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=vqC6kgC5; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4de1b5a6b7fso50047381cf.2
        for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 06:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759326480; x=1759931280; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GwWiPxXWApSuBjTieyfbH0uVPyK1qpzobUKX5yWOe8Y=;
        b=vqC6kgC5WJx43JKAZUo4OKxI5cD8wS1kM0pPUBM9r6Q7BZOf6e/51l6rEqWVNizAfp
         Opy/HojCfjeeDcRIu8IepjriyXP8iAPuKv2gyWOWRDHrtUHWd2687Ea/GIKY558i8hxB
         LMREcOMXyc4IZJPHGcV1/Jvxb69JX6paLieAr6y+qikWD0lCYg9lzR761XOtYCsFom2j
         zhajVMyuPrlUCqAGr3CfLW9+LwrzSWs6WCKPFf1Cix08AF+y6rI8w8J4z/n3D1YOmZwy
         eAdG8v40dmI5Lp0MUqMIQ0/iRefgEVLZYRSAi5eAQxYHVxeuGGyhUWd2QbBgDkQ+sd+Q
         gJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326480; x=1759931280;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwWiPxXWApSuBjTieyfbH0uVPyK1qpzobUKX5yWOe8Y=;
        b=gwGaknPniZJkqsZqo8bNKGBFvP9NcRxr/YkGzwSvsKkhTYPidBhfQdDowm6Wy3i0yF
         X6ykQm6cApV/VdLQUnhE+gt4xtwS/LdWuCLEWxYtkO7W911Yp1z+00BoKzIgMErWouAT
         Lw2IU73sMunFjuCwRh+MGX+dk2fdkcji1qgYToxDp/NKPKEmO9UnDLzV8o1Zj3RaChH+
         /55NJdsQwQj3VU8cEkKwe0FXWfJGO12jubBdWf58VmDJ4LeGTtZMQU2zVpKPs1Qf9QkQ
         5gypTM2a4nNMNNgqqqNffgFh7gbC1r87rvRPi+aBauMRWeP9wfh/k86iSZghmmrefmZD
         yzvQ==
X-Gm-Message-State: AOJu0YwikoSYRh+U+5XbFtJZ717kfUh5bI6NJcvpi4ST3rl3YgjT/cnR
	I3/OY2M4tiVF/KL8kbCQODsns1a3Vl+B3MEV9pM/uNXFoTru+X9KXdkiRPZ9dMbvhPA=
X-Gm-Gg: ASbGnctJQHdNwEXJOCwzMOv5nPz25qlcXf4GqSQ8SAGnu45pXqbh7t7QOxUvHX+32zK
	8OOn5zV+gaNfqVFs/Jjc3NJSFlqhKm2iuJvZKPMBORrffCtWOqj3hm1xx641hRkPuXlWq6LisyW
	mvC/Qrn/GgDVls4nIf4EB9pfq1TgSXWkX2E0Yd3BYQmtvqNxr6Au6M+6R5W26VjiM+POQMxFxjA
	Z45TxT2qw3WM3GlRJ63srckxnr+ReHDfUckK2/QSaweZ6RUnaRcH9Ac0wtlGkdlISE0PYY84A+n
	TA/B1i30qraJDoUvL/JVCc8UdqHi0+g/cTJ5pbiJuTgzjHkuAkEO2MJ8kemuKG89TovfLOIxau+
	nkXnx3ht/NV7jorJThY677yp4BPVsGOa4tf0Rrjq0PzGekTO5jYXW
X-Google-Smtp-Source: AGHT+IHiblZwtYX3wgFUO/7OpMhacfKleAAxOFFJx1Q7ftMvPB1RMJ+PB8Ib9Ip55aCTEP2Txr59Ow==
X-Received: by 2002:a05:622a:5c88:b0:4de:1d0e:5cd4 with SMTP id d75a77b69052e-4e41c732f0fmr44326791cf.30.1759326479606;
        Wed, 01 Oct 2025 06:47:59 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::5ac? ([2606:6d00:17:ebd3::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-80167b8b79esm110958756d6.38.2025.10.01.06.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:47:58 -0700 (PDT)
Message-ID: <971675c3d0a5f033d9eb68698dd9985a0a122aa9.camel@ndufresne.ca>
Subject: Re: [PATCH 0/2] Add support for QC08C format in iris driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Neil Armstrong <neil.armstrong@linaro.org>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Vikash Garodia	
 <vikash.garodia@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>,
  Bryan O'Donoghue	 <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 01 Oct 2025 09:47:57 -0400
In-Reply-To: <b2538934-bda7-45e1-b368-8dc4d2c6f71b@linaro.org>
References: 
	<20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
	 <b2538934-bda7-45e1-b368-8dc4d2c6f71b@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-8im6X2nzMFe6Gk5DQ8ir"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-8im6X2nzMFe6Gk5DQ8ir
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 01 octobre 2025 =C3=A0 10:39 +0200, Neil Armstrong a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> On 9/19/25 17:47, Dikshita Agarwal wrote:
> > Add support for the QC08C color format in both the encoder and decoder
> > paths of the iris driver. The changes include:
> >=20
> > - Adding QC08C format handling in the driver for both encoding and
> > decoding.
> > - Updating format enumeration to properly return supported formats.
> > - Ensuring the correct HFI format is set for firmware communication.
> > -Making all related changes required for seamless integration of QC08C
> > support.
> >=20
> > The changes have been validated using v4l2-ctl, compliance, and GStream=
er
> > (GST) tests.
> > Both GST and v4l2-ctl tests were performed using the NV12 format, as
> > these clients do not support the QCOM-specific QC08C format, and all
> > tests passed successfully.
>=20
> Sorry but this means you didn't test the full decoding and encoding with =
GST
> and v4l2-ctl using QC08C ?
> So how did you test ?

We've made addition of V4L2/DRM format mapping trivial lately in GStreamer.=
 So
trivial, that my colleague Robert Mader made the changes for you, and this
change is just waiting for someone with the hardware to test.

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8195

With that you can visually test it by rendering through OpenGL or your disp=
lay
controller if supported. This gives option to use glimagesink, waylandsink,=
 and
possibly kmssink, but not sure for the later.

What would need to work harder would be fluster testing. Going through GL w=
ill
mean converting from YUV to RGB back to YUV, which can damage the pictures
slightly, resulting in different MD5.

regards,
Nicolas

>=20
> Thanks,
> Neil
>=20
> >=20
> > During v4l2-ctl testing, a regression was observed when using the NV12
> > color format after adding QC08C support. A fix for this regression has
> > also been posted [1].
> >=20
> > [1]:
> > https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.a=
garwal@oss.qualcomm.com/T/#u
> >=20
> > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > ---
> > Dikshita Agarwal (2):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add support for QC08C=
 format for decoder
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add support for QC08C=
 format for encoder
> >=20
> > =C2=A0 drivers/media/platform/qcom/iris/iris_buffer.c=C2=A0=C2=A0=C2=A0=
=C2=A0 | 17 ++++--
> > =C2=A0 .../platform/qcom/iris/iris_hfi_gen1_command.c=C2=A0=C2=A0=C2=A0=
=C2=A0 | 15 ++++--
> > =C2=A0 .../platform/qcom/iris/iris_hfi_gen2_command.c=C2=A0=C2=A0=C2=A0=
=C2=A0 | 21 +++++++-
> > =C2=A0 .../platform/qcom/iris/iris_hfi_gen2_defines.h=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 +
> > =C2=A0 drivers/media/platform/qcom/iris/iris_instance.h=C2=A0=C2=A0 |=
=C2=A0 7 ++-
> > =C2=A0 .../media/platform/qcom/iris/iris_platform_gen2.c=C2=A0 |=C2=A0 =
1 +
> > =C2=A0 drivers/media/platform/qcom/iris/iris_utils.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 3 +-
> > =C2=A0 drivers/media/platform/qcom/iris/iris_vdec.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 61
> > ++++++++++++++++++----
> > =C2=A0 drivers/media/platform/qcom/iris/iris_venc.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 59 +++++++++++++++++-
> > ---
> > =C2=A0 9 files changed, 152 insertions(+), 33 deletions(-)
> > ---
> > base-commit: 40b7a19f321e65789612ebaca966472055dab48c
> > change-id: 20250918-video-iris-ubwc-enable-87eac6f41fa4
> >=20
> > Best regards,
>=20

--=-8im6X2nzMFe6Gk5DQ8ir
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaN0xDQAKCRDZQZRRKWBy
9MA4AP9Wnbk1p1fA9WS9eZnfnfvuJohBg8nrG8sTKlfaHftc6wEAwGh9enUFIa14
IZhYzQqBaFqyPDvB4BlNfMDrr5KeSAs=
=PwN1
-----END PGP SIGNATURE-----

--=-8im6X2nzMFe6Gk5DQ8ir--

