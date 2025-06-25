Return-Path: <linux-media+bounces-35879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0184AE87C3
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 17:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 867B55A7B86
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 15:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EA826A0C6;
	Wed, 25 Jun 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ZnAbgVpg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE33D4C92
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864708; cv=none; b=hYC7q5KT+dD4W7GaduMBwiJd2sXoSRdDGx39W61qvQJPgWAjKIKKbkzH3hqF6csRtiS4zw5MTJLKVc8+LSdLZD7nPZcPx8ag1aTJpURFvWtYnadXtlrW3+o17xSRdz/dL2KYvVkaVQMXfLJZNg8kU9QuarYLL6yJ73Xh9uw+NXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864708; c=relaxed/simple;
	bh=AomLc7VZyenNMTzcTz9Y0oKip2/H9m9BPtb5cOLL70k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CiUfyTrbZ7LiOfFaGyld0REOZBh2GZTeUfwrFHDrFRWTsNqdynmb+MV68PpdpebP0+0lHFHvrWEdt3vM6kX2cftwq7PIqhCNq4xke0+CEMtrUdsdaeW/4xTe4UGTO9fi6OP4S68SmuQ7Bxrk/RlwrTzPzrJ7vL0yyzyehqeMN1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ZnAbgVpg; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d20451c016so426778385a.1
        for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1750864705; x=1751469505; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AomLc7VZyenNMTzcTz9Y0oKip2/H9m9BPtb5cOLL70k=;
        b=ZnAbgVpgznTa/iDRV39xN8dn+Mtj+5djjE9RIF1JIsyE4wFID+B3iMhZbFud1porjp
         qvFmwYBCkHYu1LaaHoQWj22T0GrDVqWp0ivUtWpg4zDO5eVhWqPJaoi21VEYFVNnWoXc
         SmsqVNMbZiMUlRs+n3oHcuRHwn6VaAT8eRtMz/9DF0k0Dk86TJvOpAG70Wk2U3/EqnI5
         MA8N4/notFsy/dZ+/m1wvv1RSYwqCG48uhlvpiS7RXcipJ70UAn+NWOm8bSLKBRHoJoJ
         Ay5mFB+BX0g3fK9Ke2i6Ob6zHOV5f8pbe5/bI3wHISTNrCtm9oNmDjyF3VMRTPzMEdNC
         U3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864705; x=1751469505;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AomLc7VZyenNMTzcTz9Y0oKip2/H9m9BPtb5cOLL70k=;
        b=aVJM4k4mWKZQS8/tjAkxn/epJp+CYbIirGU+YOKwCPFpJ9/4xsccwUhtumLYnM9hau
         9CTdBtTdTMt7HldoBBfUjnB6XPfnY/UR9qnT5Gfj9d39SuWTZXD3WqNMaPsafBQI508I
         EcCY0GsM8zcKHSLSWkEB7cfM3Vy00Zf+lysSvqqbuA/ptjgebO3I9DU58ePJywa77tar
         VaRjs5X/DdEYYloCSlj4lAi5cWMLOPnQy9eB3X0zA032Qbxek/szx7Ax7ahG/EpTdHg0
         Ll2KuSWE6bpVhBLpz+S+gnnSu5LQqzAHlCCYlnOi6NTdR4qANP7rPF05HmsCrdjWA2vA
         +t0w==
X-Forwarded-Encrypted: i=1; AJvYcCXOFZb7gh9X4UFIzs4NZLm4etZdXUvyYMyHIVuzgEyGui5OexVet14kfHPUPOTrWcq3J5JmIYg47lz/Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4AE+grg+y92i5vwCAmqAZ+Rv6WmCiwX7jPMqqBG0vt4kDVWa
	QMVc1/60pTd42AmcKM7g/9MeySyx5Sj2nsV4KVPSpv5jebYRmkiB4sziMHc8ENzhGsfEmRBhzTl
	QF7u5
X-Gm-Gg: ASbGncuEg8wWbN/hFSdcELjGD6w0DjUqW5BGehRwhPUfsNqNFj78gDuSmzcoWhyAtqP
	hIKiEhW+cSfeQfWUMRzgZEfk6/S/RyJbBNtP3uC2+RYeXqdlPK+zppvmIaKBU2rGT58F/I/Ipby
	RXKTNVVFDY09lWBT5h/zmmkhqQrlpkZPLEXqXPdwDW863FAwTFKT4VTYlnE40Bor54IIuCT3Yog
	TE32Bpaw+Ayl/VWBVVMSWtQPBOIjh807+79LkvIp62wc7GhbfP2/aSGAOMkKgU8SIV+0mVwRTy6
	io52rRNHWh7PZaUSbeQYZh9z6czZjHGRlh2a5VEw0zhT2eD9E+enPg5Jc6SvvBC5Jtg=
X-Google-Smtp-Source: AGHT+IGg70TPGKRd/tr15GduJQXkawesCJFQO+gd2fA01MBhKIN+M3ng3LABPsHTxDPMFvdxVKcFaw==
X-Received: by 2002:a05:620a:4249:b0:7d0:a1da:3a3c with SMTP id af79cd13be357-7d429710462mr375643685a.3.1750864705372;
        Wed, 25 Jun 2025 08:18:25 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::bad? ([2606:6d00:17:b699::bad])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f999e9a3sm623012685a.3.2025.06.25.08.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:18:24 -0700 (PDT)
Message-ID: <10609f72ceb27db9245b8cadde5bcfddf49fffff.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/3] Add media jobs framework
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, 	jacopo.mondi@ideasonboard.com
Date: Wed, 25 Jun 2025 11:18:23 -0400
In-Reply-To: <20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com>
References: <20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-cEA3VPWEAnN16ccM2+cm"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-cEA3VPWEAnN16ccM2+cm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 24 juin 2025 =C3=A0 08:59 +0100, Daniel Scally a =C3=A9crit=C2=A0:
> Hello all
>=20
> This series adds a new API to the media controller framework, which
> I'm calling "media jobs". The framework is intended to facilitate
> communication between separate drivers which need to work together
> to fully operate a media pipeline. For example, the need for the
> framework arose when writing support for the ISP in the RZ/V2H; the
> ISP is fed by a DMA engine which is not part of the same IP block,
> and so is driven by its own driver (though sharing a media graph).
> The ISP driver needs to be able to communicate with the DMA engine
> driver to instruct it to push the next frame. Because the DMA engine
> might be different on a different platform that used the ISP, direct
> calls into functions exported by the DMA engine driver wouldn't be
> scalable, and so this driver agnostic route was adopted. The
> framework allows drivers to define the steps that need to be taken
> (for example writing configuration data, reading statistics data,
> writing buffer addresses and triggering data transmission) to complete
> a "job" (of which the only current example is the processing of a
> frame of data through the pipeline, though I expect that other use
> cases could become apparent too) and to then schedule them into a
> work queue once driver definable dependencies have been met. The
> dependencies might, for example, be the queuing of buffers to V4L2
> capture / output devices.
>=20
> The framework allows precise definition of the ordering of the steps
> regardless of the order in which the drivers populate the jobs. Steps
> can be flagged as being placed at a particular position from the front
> or back of the queue (I.E. last, or third from last) or as requiring
> no particular order. This would allow the construction of a job like:
>=20
> Step 0 (ISP Driver): Program the hardware with parameters
> Step 1 to N-1 (Both drivers): Program the hardware with buffers
> Step N (DMA Engine Driver): Send a frame of data to the ISP
> ... ISP processes data ...
> Step N + 1 (ISP Driver): Read out statistics data from the last frame
>=20
> The mali-c55 ISP driver and the DMA engine feeding it on the RZ/V2H
> (called the rzv2h-ivc driver) both use the framework, and will be
> posted shortly after this series with references back to it. I will
> reply to this message with links to those series for convenience.
>=20
> The first patch in this set is not strictly part of the framework,
> but also facilitates multiple drivers with V4L2 Video Devices
> sharing a single media graph. We have a requirement to delay the
> start of streaming until all of a pipeline's video devices have had
> their .start_streaming() operations called; these new entity ops
> provide a mechanism through which each driver can inform the other
> that the last video device in the pipeline has now been started.
>=20
> Thanks
> Dan
>=20
> - Link to v1: https://lore.kernel.org/r/20250519140403.443915-1-dan.scall=
y@ideasonboard.com

That's nice to have a link, but do you mind to summarize that changes you
made from v1 ? I remember challenging the naming, and the fact jobs and req=
uest
next to each other are extremely confusing. It felt rather important discus=
sion
to have, yet this cover later does say anything, and I don't remember seein=
g
any reply.

Nicolas

>=20
> ---
> Daniel Scally (3):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: mc: entity: Add pipeline_started/st=
opped ops
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: mc: Add media jobs framework
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: Documentation: Add documentation fo=
r media jobs
>=20
> =C2=A0Documentation/driver-api/media/mc-core.rst | 169 ++++++++++++
> =C2=A0drivers/media/mc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
2 +-
> =C2=A0drivers/media/mc/mc-entity.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 46 ++++
> =C2=A0drivers/media/mc/mc-jobs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 428 +++++++++++=
++++++++++++++++++
> =C2=A0include/media/media-entity.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 24 ++
> =C2=A0include/media/media-jobs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 317 +++++++++++=
++++++++++
> =C2=A06 files changed, 985 insertions(+), 1 deletion(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250623-media-jobs-6f3f9963063c
>=20
> Best regards,

--=-cEA3VPWEAnN16ccM2+cm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaFwTPwAKCRDZQZRRKWBy
9DksAP4749NltKUNGK8ke9ydbfYyfyp3k5DYeQJZnP2mKtv55wEAg1BxcjVDnWVR
fwIk/xWhXnjGm0TmYJTjFZCyh2Z68Qk=
=LGXL
-----END PGP SIGNATURE-----

--=-cEA3VPWEAnN16ccM2+cm--

