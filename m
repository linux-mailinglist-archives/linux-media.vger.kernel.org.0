Return-Path: <linux-media+bounces-35888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 905C8AE8939
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 18:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75B061890354
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 16:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78052BD590;
	Wed, 25 Jun 2025 16:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="lmVorzt1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC1926A1CF
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 16:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867654; cv=none; b=UzDZ8oB/LXqIpYZxMdq2f8HryMjlTtDKk8/MJlc+OMF7y4Y8TpJL7GtF9nrolAMO2hnvbTtpCOR0yBqS13JG1eMNVNCijLp3TrVq4fKNL2UZ+21MQbODcOuBn4kWZ/MQvHqWOSyAlDUPWGV+uvN1pfgJPslicaiTSvJU3mbc2kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867654; c=relaxed/simple;
	bh=4aKqMWZRuZf3D8YbAhzms7v5tEmL2GTeTZvC9LzT9SA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JMHHHd+7lKIoUqt4CgCcsUNMOkSgU+RK6lubpW+vSP5J9Czhl5OezuXnTBFzuHhKG37mEfmfHE37AYOo8WXAufJko6Or5wM1TCQ6YqYP2PJfH52mqogO3kX+oO7l/yZay91K76wSWTM3ibNR+dzsmVlLqL/SQepw3aXrdC+fwJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=lmVorzt1; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d3f5796755so1940985a.1
        for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 09:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1750867651; x=1751472451; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4aKqMWZRuZf3D8YbAhzms7v5tEmL2GTeTZvC9LzT9SA=;
        b=lmVorzt1lt9t7k3auAjdBIep4a4/HCPuq9WoozjJK3AKRNpsudXGXL1q+ojw8RhjqP
         0UptnXAqyRPeCq0f+x6UqOAu7rAuLVRkUEc2sKYCX2RFMST52Skpzfo85pDCQ8DAg4fa
         mSnvbb2bIiw7Vkw9vdU/sbUQoWLuBPQpBsoz8ksf+JqFNE/M83VpbcBf/BmuB6kgKmFr
         z2J7eESsezx6aEa7N9H5fhWP3wJ5oLyM8BDMx7ubu4Dq/ySTE+D1U7B1yEtQOwdO8+Kk
         uvh92dou6SbEbUV3jSdDXFutktUWNOumIpEoBY3Yt8CTduljbp2rogLz0w9SbQpRqqy0
         WfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867651; x=1751472451;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4aKqMWZRuZf3D8YbAhzms7v5tEmL2GTeTZvC9LzT9SA=;
        b=lmT88zsDnOX6F4ac7Cu4cc4bwu3FCYZ+RW06qfEfUCLAFZKpvQ7mUASbBTSGZ6IhLc
         Ayp2W3cjPkKLf44ZtnSXygiN4IrscxsSPOZZFcBcA9hU8FSbm5Vd+1AjD4P4k5XqZsND
         bYWO66Z2pJ5h5PUab8Ols+MKXszco4JxWBlN8Z+6Qivkex8o4xtMuOuA9Docj360X8XK
         HJgbydku3A+Dp1dV4iShIHGGD4Addg4ERkMxyqGNac6ENj4A0E6Jt64mYyT46UC+nRQk
         4lS9jpXh1YwnCoAT62+c17oG9FJ39Hmf7kzgx2al/RBgjQFbRCgiWvydtx/NDqHqAMHb
         n7AA==
X-Forwarded-Encrypted: i=1; AJvYcCWCLPqw6D3LEDmSANUuYfpb3mNMYP0bcbLEEENJN5sn/alPvKfimbUUTh9liv65oYzYFgSHwNu5+hp6MA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7y0EGgwdHWMWYssUPDgStoHVkbMTpmTnppfaPOYUyotFdmJL2
	0ZaCpk+a6HgCyJHgtAk9dhIUVHeUEcOxjfPFR6TaXDwiPXZB30RK7lMv1G3TmHXzMaY=
X-Gm-Gg: ASbGncvxkDyr9vzvd4m/oFpv5CUWmL5Q126/XYLaqAqOaaEvlvSh1AcHX6klyNIcVIx
	QoLPJm4gH7sm9U+BNabOHL/bBWZ/KWA4JwBRxf0PiaJP1+gHmBAzeIrmurNQ46eCCATVHKNMFEe
	Ifv7AuOh2pnwweXIMXOb4TBeV7gLLjOPOweeXUgOn1NSqR41541E3147502eIi50AXEWdsfg6Es
	OIrGas1O08yxTM7Ir6EiXej6QpaGq2jB1HTRJAWgXyv6ktDjEyulZIRHl9fFSFiIbY1zK8lM1kY
	rZBN2eZutj9NFdSfWjLYsTU1sVUveXPrrFgkeKQTj++KHit2Z5CLBX/Fm3nfh3jhCfE=
X-Google-Smtp-Source: AGHT+IGFBkFVwUzUzG5AEf9ik6sk/hG586aeVd2kg5w8o8AfLwSi9vDR0WrdiAhHHJioVYoteKYdVA==
X-Received: by 2002:a05:620a:810a:b0:7d4:289e:d42b with SMTP id af79cd13be357-7d43ba6f021mr23446485a.8.1750867651019;
        Wed, 25 Jun 2025 09:07:31 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::bad? ([2606:6d00:17:b699::bad])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99fa92bsm628715085a.79.2025.06.25.09.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:07:30 -0700 (PDT)
Message-ID: <ba48d78044c8954ea0878ce74b53405ecf9140af.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/3] Add media jobs framework
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dan Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, 	jacopo.mondi@ideasonboard.com
Date: Wed, 25 Jun 2025 12:07:28 -0400
In-Reply-To: <94826966-05e2-4944-bc81-72ef261d2af2@ideasonboard.com>
References: <20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com>
	 <10609f72ceb27db9245b8cadde5bcfddf49fffff.camel@ndufresne.ca>
	 <94826966-05e2-4944-bc81-72ef261d2af2@ideasonboard.com>
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
	protocol="application/pgp-signature"; boundary="=-I/Uv6fr5v8dzcaMePi5C"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-I/Uv6fr5v8dzcaMePi5C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Le mercredi 25 juin 2025 =C3=A0 16:40 +0100, Dan Scally a =C3=A9crit=C2=A0:
> Hi Nicolas - thanks for commenting

[...]

>=20
> > >=20
> > > - Link to v1: https://lore.kernel.org/r/20250519140403.443915-1-dan.s=
cally@ideasonboard.com
> > That's nice to have a link, but do you mind to summarize that changes y=
ou
> > made from v1 ? I remember challenging the naming, and the fact jobs and=
 request
> > next to each other are extremely confusing. It felt rather important di=
scussion
> > to have, yet this cover later does say anything, and I don't remember s=
eeing
> > any reply.
>=20
> I only replied yesterday. Sorry to be late - I didn't see your message fo=
r some reason until I was=20
> getting ready to post this revision; on the naming I think that just "Med=
ia Scheduler" to me feels=20
> like it begs the question "What's being scheduled?" but I'm not sure what=
 other word to use if not=20
> job...I don't really have strong feelings about it though - just Media Sc=
heduler is fine by me if we=20
> can't come up with anything better.

Thanks for the reply, I was getting a bit annoyed by the silence
around the high level of the framework. Glad its accidental, My thinking is
the a scheduler runs jobs (or slice) and this is pretty much the case throu=
gh
the kernel. So a "job" framework, can only be a scheduler. Of course, its a=
n
highly specialized one.

Note that M2M framework on the V4L2 side is also a multi-plexing scheduler,
and it runs jobs despite not having a job object :-(. Its too simple, limit=
ed
to one video node, and there is no way to carry over any state for when you
must run more then one job at the time. We can't even consider having a job
that depends on another ...

So basically. its the best example of what not to do, and why I care about
your work. There is an increasing amount of multi-stage, multi-core, with
pre/post-processor CODEC, which will need multiple video nodes. So your
scheduler framework seem to be the direction forward.

> I took a look at the DRM scheduler and I agree that there's a lot of para=
llels - I don't _think_ it=20
> would be usable as-is but perhaps it would be easier to adapt than to add=
 a new piece of code (or it=20
> might turn out we can just use it after all); I'm going to spend more tim=
e investigating that and=20
> see where it leads - thanks for pointing it out.

After further discussion with the DRM folks, using theirs directly is likel=
y unpractical and
difficult. But they suggested that we may want to look at a way to make the=
 synchronization
compatible. Notably by adopting (or supporting) the kernel side dma fence a=
s a way to signal
completion or failure. Once you get to that, let me know your ideas.

best,
Nicolas

>=20
>=20
> Thanks
>=20
> Dan
>=20
> > Nicolas
> >=20
> > > ---
> > > Daniel Scally (3):
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: mc: entity: Add pipeline_=
started/stopped ops
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: mc: Add media jobs framew=
ork
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: Documentation: Add docume=
ntation for media jobs
> > >=20
> > > =C2=A0=C2=A0Documentation/driver-api/media/mc-core.rst | 169 ++++++++=
++++
> > > =C2=A0=C2=A0drivers/media/mc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +-
> > > =C2=A0=C2=A0drivers/media/mc/mc-entity.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 46 ++++
> > > =C2=A0=C2=A0drivers/media/mc/mc-jobs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 428 ++=
+++++++++++++++++++++++++++
> > > =C2=A0=C2=A0include/media/media-entity.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 24 ++
> > > =C2=A0=C2=A0include/media/media-jobs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 317 ++=
+++++++++++++++++++
> > > =C2=A0=C2=A06 files changed, 985 insertions(+), 1 deletion(-)
> > > ---
> > > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > > change-id: 20250623-media-jobs-6f3f9963063c
> > >=20
> > > Best regards,

--=-I/Uv6fr5v8dzcaMePi5C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaFwewAAKCRDZQZRRKWBy
9KJZAP9aXWT8SggXGC4zdatXA8Fn7mSI6QHJ3OIH6LGj/L0uMwEA+tVbyDxQuAOd
ryUbj6mahkdbLJl8fs0hHwzeO717lQ0=
=Gep9
-----END PGP SIGNATURE-----

--=-I/Uv6fr5v8dzcaMePi5C--

