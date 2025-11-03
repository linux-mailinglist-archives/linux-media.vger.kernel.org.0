Return-Path: <linux-media+bounces-46225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F975C2D22C
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 17:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 180C2188C9FA
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 16:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262E43161B5;
	Mon,  3 Nov 2025 16:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="JOglvw1u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A077A313285
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 16:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762187207; cv=none; b=GhQ1nGe39IJW9jzfGWFhvRPkc+w2V40ivgVDisGLLumgel5aMydzbeAVlOkV4bLIO7wEW1dnMTGpJDi0lEcrviWKNTK+/3GZ25YZDjqgaAyMkOqfXyp6i/sWpz9cMdHheUup+A/0/uRm6jASFK5lAJNHWCbmQaKen6iPuHu/Qf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762187207; c=relaxed/simple;
	bh=ri1pC6TiLza8xmohJNUIG9tgBb8YF50YzTYN5M6/xB0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OOE2eFclnJ5/R/OECcYef3Vbt7Cp7fir3WrsUb6FA25Y383qWztFPD8DAn+KyiF5sgNaOILKt8YLvmnKNOcvmmzJzZYbCXQ76n7qjudkkW9j0xhp2wKIDugzrbnnateVcOuV5zlrnfBQhjbnFWaj78OMeEno3UNYb6YANcWd+UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=JOglvw1u; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8a84ba42abbso536278485a.3
        for <linux-media@vger.kernel.org>; Mon, 03 Nov 2025 08:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1762187204; x=1762792004; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ri1pC6TiLza8xmohJNUIG9tgBb8YF50YzTYN5M6/xB0=;
        b=JOglvw1uGCM+7nCYKQdBbNjSw5Umo5k8op1oLEz6/AUyvW6Z1sm+r9+HgdTyf78fL4
         XtHLRv5HA6QJ601Y1oqxAja7wmBb8jcqqv4Q48wDHU/5SAa1QEPnd/An2T6eF3Sa91ha
         OZAyMxsyUE+nOd2Ck/OHcVlSsEXkHgD31e7A3z9moljPspJeRcLWEQE9m5acmfbHVZTT
         GlqP0z3oQ3HjQXUSsIj5rMK7nzMDHPJjfj4VUSBldg4rfap9v8Zbn0QgjSHDHT1KRNz1
         VlzRa6v73GWFA3xOj/5mwGY1SIqCUa7xsDa6teZJZZievt+pbaVZPP6pbqTo05CCOZ0c
         ltfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762187204; x=1762792004;
        h=mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ri1pC6TiLza8xmohJNUIG9tgBb8YF50YzTYN5M6/xB0=;
        b=Xr2nAjFmaFi1mz445enCo4UhkWm++fLkFtyWj74oIjhEWqcGsuuGaaN+OYxZ/MqEys
         kHARnpj2z4nNtw1TzbjhQqDcHxj5bpVi1KzXC/zNOv28jv4T9Y9B9iuXCAgoBCUHcTrV
         NYXhlNTLDKCtc67fkgnjQrAaQtJ4CCk465P4YEc2arldy5vUDV84kJlE/7S9NrcmYyvK
         pL6uiuUfNME0D0VhYok9n64IWQm4Q44njVPTW0qLTWFzzp4YSHEp1LxVvfusCW6aVy8r
         kOPJISVTa+xbe1Ohqvo5LSAbXPXYdLgWWMZbiXNlidsMz5T8VUUIJ1NYMfrfr1S4pcsi
         qHrw==
X-Forwarded-Encrypted: i=1; AJvYcCULI3QoTWN1oiebOYLlQbrUDZQ23kTEjXUacpSQCWlVmXbUZcnW64D4Xz9O7ofPE9OVSZ1jm+cgtgWv3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmMvtYb6dERoPD8rvORlYw9k3QP55UI6LKCUwqapSh+2olBG3r
	cejPJmy2dm/g4tELE73ujtS53cSpQ1t5/Hub5YxnyrPxzct06Bw+i28J23xBcomn3XIScTiDjKi
	JI6YI
X-Gm-Gg: ASbGnctjZtVvGhYIrQEywwLSsG4bNs+xYOBcwUTCpH8GGdZadGaHnWhpstzHGh6uQYA
	8P960UCPQICr7cZDTpjxGMwsSqEVbHUNGPI59WvTGLcDHau/jX0LDKt3NpmlbNO6yHb/ozA6GSE
	31ddYdjpFkQNhmAR4+uouQoie/md6vpHdtNkS5aRcIIJGxCwn0GD5RG5ZOnu/vkqPi6Fxno2e0u
	c8PkmHA1Z+WmW2Ky7F40L3Ro2y60mB0kigAn6H7gW8ils5DKuFUodeyPO2X7A6N3Ty6lCQ+RyHv
	YY17Ytai3Cxk29ITlgaMT7qqSGxAYZv0+65FPW5QcnrKL2yKUuehHde1C1rNBpTsn8UaGBf32Iy
	90lFhhe2lYVg3OLoB7q6EJ6DX5Ir7X1on9m8k54E4iXv4jnzR4i5oNoe1YUJRbcPhb0rQHsLpv0
	c/jApOy1LRJLsKkC/XmPTGOZUfewQ=
X-Google-Smtp-Source: AGHT+IGo+1nHt4hA+rMpctcv5igz2khIOZWWFpxri8Yq0OMwWP0jR7SoG/VbgcJkzE55CjXujnk+gA==
X-Received: by 2002:a05:620a:17a9:b0:8a3:3571:14b4 with SMTP id af79cd13be357-8ab991a57d7mr1583796885a.12.1762187204167;
        Mon, 03 Nov 2025 08:26:44 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:ebd3::c41? ([2606:6d00:17:ebd3::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b0f5413f43sm16634785a.8.2025.11.03.08.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 08:26:42 -0800 (PST)
Message-ID: <382e94e1b932938fffd92ead86cf057b4623417c.camel@ndufresne.ca>
Subject: Re: i.MX8MP Hantro G2 HEVC decoding problems
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, linux-media
	 <linux-media@vger.kernel.org>
Date: Mon, 03 Nov 2025 11:26:41 -0500
In-Reply-To: <m31pmfp6j3.fsf@t19.piap.pl>
References: <m31pmfp6j3.fsf@t19.piap.pl>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-0rlX/lceaaTWD49uCo3m"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-0rlX/lceaaTWD49uCo3m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Le lundi 03 novembre 2025 =C3=A0 14:52 +0100, Krzysztof Ha=C5=82asa a =C3=
=A9crit=C2=A0:
> Hi,
>=20
> I'm trying to decode H.265 full HD RTP stream on an i.MX8MP CPU. Should
> I expect it to work, or is there something missing?
>=20
> Small streams (640x360 etc.) are decoded. With 1080p, the board panics
> or does something similar.

If its size related, always make sure you have enough CMA for this type of
system. Though lower description seems to indicated its not the issue.

>=20
> Generally Hantro G2 doesn't finish decoding some frame. I have a test
> video - it can probably choke on random frames, including P-frames
> (this is I/P-frame only stream, produced by the H2 counterpart).
>=20
> The details are foggy at this point, but I'm receiving interrupts:
>=20
> # dmesg | grep irq
> ...
> [=C2=A0=C2=A0 75.002276] hantro_g2_irq: 0x1100 masked 0x1000 <<< status r=
egisters,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shows decoding=
 complete
>=20
> [=C2=A0=C2=A0 75.143611] hantro_g2_irq: 0x2101 masked 0x0 <<< this is the=
 problem
>=20
> What could that mean? DEC_E is probably "ERROR", lack of bit 12 is "not
> ready", but why do I get this and what does bit 13 possibly mean?

BUS Error, typically an AXI errors. See pending patch below:

>=20
> #define G2_REG_INTERRUPT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 G2_SWREG(1)
> #define G2_REG_INTERRUPT_DEC_RDY_INT=C2=A0=C2=A0=C2=A0 BIT(12)
> #define G2_REG_INTERRUPT_DEC_ABORT_E=C2=A0=C2=A0=C2=A0 BIT(5)
> #define G2_REG_INTERRUPT_DEC_IRQ_DIS=C2=A0=C2=A0=C2=A0 BIT(4)
> #define G2_REG_INTERRUPT_DEC_E=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(0)
>=20
> ... then the condition doesn't seem to improve:
> [=C2=A0=C2=A0 95.198362] hantro_watchdog:126: frame processing timed out!
> [=C2=A0=C2=A0 95.323410] imx-pgc imx-pgc-domain.8: failed to power down A=
DB400
>=20
> and it can randomly panic, show an SError, or do nothing of the sort.

In queue for the next kernel release, we have a rewrite of the IRQ handler:

https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/19c286=
b755072a22a063052f530a6b1fac8a1f63

The important take away for this chip is that it does not always stop on er=
rors.
It can also raise a dry IRQ (I don't have explanation, only happen on IMX8
boards). The new handler properly check if the hardware is still running, w=
hich
avoid programming over a live IP. The G2 has fancy internal clock gating, s=
o
doing so can lead to CPU hang if the register you set is hooked to a gated
portion of the IP. At least this is my mental model of it.

And there is an important bug fix for missing references, without that, you=
 get
thousands of error IRQs while the IP is fetch from address 0x0 and its
surrounding. This large burst of IRQ, combine with multiple memory related
erratas of IMX8 boards cause random other things to fall appart.

https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/47825b=
1646a6a9eca0f90baa3d4f98947c2add96

>=20
> How do I even start debugging such stuff?
>=20
> H.264 doesn't have this problem.

The Hantro G1 driver is a lot more robust indeed, it has been deployed on
ChromeOS for many years (though that chips is a bit obsolete now). HEVC was
contributed later on, I don't think it have had that many users. It has bee=
n
mostly tested with reliable media, though it can also fails there if you se=
ek to
a GOPs with CRA keyframes and RASL (skippable) leading frames, and your
userspace does not pre-emptively skip these (GStreamer, which I'll fix soon=
).

I'm sure we will find more things to harden around this driver, so your fee=
dback
is all very appreciated.

regards,
Nicolas

--=-0rlX/lceaaTWD49uCo3m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQjXwQAKCRDZQZRRKWBy
9N75AQCrQChkXGIsiO5tNoivtLiq2h35Cb/vubxcGQDYUS/t2QEAjTp4IM0hqYw3
pL1ZYboBFr4qDbA2os8oQtSjkfO9wA4=
=ySxf
-----END PGP SIGNATURE-----

--=-0rlX/lceaaTWD49uCo3m--

