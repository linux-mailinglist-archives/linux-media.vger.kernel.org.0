Return-Path: <linux-media+bounces-62322-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PJwDcffDWro4QUAu9opvQ
	(envelope-from <linux-media+bounces-62322-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:22:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC07591CAA
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C5D8A31FD9F0
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5715E3ED3BA;
	Wed, 20 May 2026 15:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="B594E8RK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222073033C6
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290813; cv=none; b=BRd3hG6wh3oY81iYti7ncd8dwhZvBEbCIQzbDdOVcKA/udfYcHyVmJJHgkNAYHbCs7eXrVZUbX7Dt5ZeWwbqMor3GHioPcsGvjwZFzZd/NIwnJUdVOHQ7dj6eVsJcSITadbhUSs+nKBdImGc4ZO53P9R8BYZ1W4hrfIeDKj0N4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290813; c=relaxed/simple;
	bh=cWeJRAhkmfTMdjcNX7mK9Zk2C8NhaiuzSgw0sH92OCY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hsw9GzOU5U78XVucUS/1BMUa9FdHNSQAJo5I/eUrN3vP5MWMsFgpZM8pDF/AgQPq5Z4QoY1K4d/D7m6y3vvvY9eNHGZIXDFsfA9ozCV9+s3N7hkukHnWukIwjjoSZ8+q6MJEkSlwsIlOdiyh77tfdwKsYCSTn2yUKTibnf5rv6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=B594E8RK; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-47c918c62b4so3321587b6e.0
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 08:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1779290811; x=1779895611; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cWeJRAhkmfTMdjcNX7mK9Zk2C8NhaiuzSgw0sH92OCY=;
        b=B594E8RKkLMwizB8nDYJe6X7iwecGFpmao4T8NPhaRWHj6b1+Os4DYd83bTiBZ0ON4
         Ao5Q5gNtQfwbOiZBL5uisGhIxM9PYUaIwU3jhkJeRBJJXlqYRM5fGpUK3NjiUZJv1gox
         OovjbIUQeUtJ0UXgTTRZrdSMJCCvcJPenVJnZJuBfiLXA2SljXp6PZ5i0Q/p7jLjvc/b
         k+CJz3qtLh9pU8M5jskUEDJMeai+D8b48fWSQkg9YWbnGNVeqPR+xZY9RS01kM644Mcf
         NzNvL/MHD5Bgfdmyhf56Yv8hqw9juhGA9dpar8XjbKo2o5KBsQ8oHzasf1bKPjPBRE9l
         p7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290811; x=1779895611;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWeJRAhkmfTMdjcNX7mK9Zk2C8NhaiuzSgw0sH92OCY=;
        b=KFr+8zKs3Ie+dtvdA67CpCLaA3+EO7qPO4F8jNcZQUpsNQpVs4PTZlmzx28kxRshE6
         koEO6bykpuuqWRn1fKRRK6rrVw6tEIyUi1dPsVm4aeeox4IO7jQt/9ELYTD02rxhY4lu
         ocVJJkF5zm5l3dCIj42iJfA3/tc+rHMl5foHomUnu1D13PrmvoiglysPpSU0GIBsZMfZ
         frOG+Ge1iijF90BoltKVvB5GomqSURyQQMUYAZsdVmb55QwStfN2hKUu67vyROHbIrAl
         lH+eQLfCD+9CTaxOPL/vvrWwVDoAdBPa1KGLrPj2okTbrep3CwG+3qE20+aIBJELUZ0n
         AHrA==
X-Gm-Message-State: AOJu0Ywrkq158INXS5BDsWU6/gYRFlV+vw30AIAdnEM3FoIdXnoFn4p7
	zewDVm0DSeJOYCaOrsNyOk80UswsENujcgqoGOI+YczpPYC4Ch/HzciDWAgXPwBdf3KPPb0DMsH
	ulbLSzEg=
X-Gm-Gg: Acq92OHYHXRTVdnUx1SRt6Qkls8MaDy14g/C9TY1mOpP1sTJU8JXut0vV0UF6Zn/YPQ
	YBviUrZugPibAtdmesekeIbeBPh6A0Qqtz8tE1gDvc4WXlO+ezO1AHDDub5Q82b056uF2oQpDtU
	lg4WJ6CTcl8Cq3MDuCUIHe62XVtO2y/qu+B6j7jdX8gky7RzXzAHp6etaiXVUgM0wcuOWMti9b0
	YQIIA/cdoefPTZWBB0vy6C003mgVPAnUCjl+BkaDfmDh9oiQB4RewdiaYrOiUkyPEnDGtoDE8hO
	6Xv8x5B94Lqz6snqyDVuPeOiv/rFUdQ1DazlHPtkyxIK4KCkmNCnE4eaUdgmcgA7lvbfLTLSl+u
	PiUQEVZIEVZI4HsffpgRGKAN8lBswdKJ6ilMs4IfGZK4FVoX1YiUBbjLTXSuC+L/7yDBLHUVanY
	twhDeVjfBFlkkpCjF7UCNU2/nbZA+9pNHlC0337JwyXic51eGcCamS4S8KqdW5ICGMfaFH
X-Received: by 2002:a05:6808:4fc8:b0:467:2375:58c9 with SMTP id 5614622812f47-482e5978e89mr15232837b6e.45.1779290810886;
        Wed, 20 May 2026 08:26:50 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-482ee38a5ecsm8416472b6e.7.2026.05.20.08.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:26:49 -0700 (PDT)
Message-ID: <a0f382b4c174251a21e21752e2ae3efc622a600f.camel@ndufresne.ca>
Subject: Re: [ANNOUNCE] libva-v4l2-request: RK3588 VDPU381 VP9 decode (fork)
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Cc: linux-media@vger.kernel.org, Paul Kocialkowski	
 <paul.kocialkowski@bootlin.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Jonas Karlman <jonas@kwiboo.se>, Detlev Casanova
 <detlev.casanova@collabora.com>, Heiko Stuebner	 <heiko@sntech.de>
Date: Wed, 20 May 2026 11:26:47 -0400
In-Reply-To: <20260520144017.69528-1-pavone.lawyer@gmail.com>
References: <20260520144017.69528-1-pavone.lawyer@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-rMn8wAQ6E+4f5jMRn2nH"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bootlin.com,xs4all.nl,kwiboo.se,collabora.com,sntech.de];
	TAGGED_FROM(0.00)[bounces-62322-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2EC07591CAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-rMn8wAQ6E+4f5jMRn2nH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 20 mai 2026 =C3=A0 16:40 +0200, Francesco Saverio Pavone a =C3=
=A9crit=C2=A0:
> Hi Nicolas,
>=20
> Thanks for the candid feedback =E2=80=94 and for the heads-up that the
> direction I picked is the dead end rather than the destination. That
> saves me a lot of investment in a path you and the V4L2 community
> already see as deprecated.
>=20
> Two pointers would help me catch up:
>=20
> 1. The recent Chromium VP9 probabilities work for the V4L2 stateless
> =C2=A0=C2=A0 path =E2=80=94 could you share a commit, a Phabricator/Gerri=
t link, or a
> =C2=A0=C2=A0 tracker ID? I would like to read it, test it on RK3588 RKVDE=
C2
> =C2=A0=C2=A0 (VDPU381 / VDPU346), and see if it covers the same compresse=
d
> =C2=A0=C2=A0 header / interp_filter corner that the libva-v4l2-request fo=
rk was
> =C2=A0=C2=A0 fixing. If there is something useful I can contribute back =
=E2=80=94 test
> =C2=A0=C2=A0 coverage, bug reports, follow-up patches =E2=80=94 I would r=
ather put the
> =C2=A0=C2=A0 effort there than on the libva side.

Sure, the changes is (merged):

https://chromium-review.googlesource.com/c/chromium/src/+/7794420

The story behind it is that the code was owned by ChromeOS team (and assume=
d
ChromeOS specific), and they removed compressed header parsing from the com=
mon
code when the last RK Chromebook went end-of-life. That broke non-chromeboo=
k
users of RK and VSI decoders. This remains quite niche set of users, so it =
took
a bit of time, but its fixed by moving the relevant code into the V4L2 stat=
eless
decoder components. Its also only run when the HW actually needs it now.

As I'me starting to get a glimpse of the latest generation of CPU accessed =
VP9
decoders, I already know that some of the decoder needs to be passed the of=
fsets
to every tiles ahead of time. Information that is aliased inside the compre=
ssed
video data. I don't know yet if its the case for the newer RKVDEC VP9 decod=
ers,
previous generation was decoding tiles in order, one-by-one. There is V4L2
controls spec for that coming soon.

This is of course all supported in GStreamer and LibreELEC fork of FFMPEG.
GStreamer support being fully upstream, and FFMPEG upstreaming happening he=
re:

https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/20847

>=20
> 2. Vulkan Video status. Is there a public roadmap or a working branch
> =C2=A0=C2=A0 for the V4L2-backed Vulkan Video decoder you are pushing? I =
am
> =C2=A0=C2=A0 especially interested in how request_fd / per-frame controls=
 map
> =C2=A0=C2=A0 into the Vulkan Video API, and whether ARM SoCs with statele=
ss
> =C2=A0=C2=A0 decoders are part of the early target set. If there is a pla=
ce to
> =C2=A0=C2=A0 follow the work or contribute, please point me to it.

This is of course a much younger subject, whith less implementation. So far=
 a
quick vibe coded prototype has been made to verify if using V4L2 Stateless =
API
under the hood of a Vulkan Video driver was even possible. I will have to a=
sk
the "author" if he's interested in sharing, though its of low value in term=
 of
code. The VP9 probabilities, along with few bit skip kind of parameters whe=
re
found missing, the AI open coded parser to workaround it.

I really want to spec out these extensions this year, so we can have a non-
parsing Vulkan Video layer as a demonstration instead. Parsing is achievabl=
e,
and the PoC demonstrated it, but doing it correctly requires running a
dependency manager (it is fence base execution) in userspace in case there =
would
be a fence on the bitstream data you need to parse. Quite some work for
something hypothetical, and in the Linux Vulkan echosystem, such as Mesa + =
DRM,
the dependency management has been chosen to happen in the kernel only for
performance reason, and parsing in kernel is a no-go for security reason.

As of where to discuss. Its not all very central and quite per project. On =
the
Mesa side, public discussion have started here:

https://gitlab.freedesktop.org/mesa/mesa/-/work_items/14987

This is about a concurrent PoC, that make use of non-V4L2 drivers. I will
discuss this subject with the Linux Media group in Nice next week. Understa=
nd
that these are discussions, no one on either Linux Media or DRM subsystem h=
ave
committed to this change of direction. The challenge being that on one end,=
 we
have a subsystem expert in low latency dynamic HW rendering pipeline runnin=
g
behind standard APIs, but not really having much clue on the handling of sm=
ooth
playback for variable processing time decoders (about buffering), and on th=
e
other end, its us, Linux Media subsystem, entirely focus on smoothness real=
ly,
and making their own standards and spec, but not particularly focus on late=
ncy,
which happen to be good most of the time though.

>=20
> I will keep the libva-v4l2-request fork running locally for the
> ecosystem that still depends on it (mpv `--hwdec=3Dvaapi-copy`, ffmpeg
> CLI), but I will stop pushing it toward upstream now that the
> direction is clear. The kernel-side fix that got VP9 working on
> RKVDEC2 (the PM runtime teardown cleanup, lore link in the original
> announce) is independent and stays useful for any of the userspace
> paths above.

Thanks for the PM runtime fixes, its in my queue, you should get feedback s=
oon.
You should really give a look at LibreELEC FFMPEG work, and Jonas upstreami=
ng
effort. V4L2 Stateless (also called request) decoder is the active standard=
 on
Linux/ARM at the moment and is meant to be used directly without an abstrac=
tion.
So if you can adopt support for that, you will thin your software layers qu=
ite a
bit. For me, Vulkan Video will slowly take over, specially since they have =
got
ahead of us on the encoder side. Its also a nice commodity when the exact s=
ame
software can run on your PC and your embedded system. Though, there is stil=
l a
lot of work to do, and there is a lot of firmware accessed decoder/encoder =
that
are incompatible by firmware designs, which remain only covered by V4L2 Sta=
teful
driver layer until their vendor decide to offer new type of firmwares.

Nicolas

>=20
> Thanks again,
> Francesco

--=-rMn8wAQ6E+4f5jMRn2nH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCag3StwAKCRDZQZRRKWBy
9CnNAP9GEJsngNSkPyWHS15aHqw6x5QFBOZqi0l9su04tOfoEAD+LtOjqRYlDrFC
XTq5V7HIRR1yvxqfmHPRnHoeRGtJ/gc=
=/tJx
-----END PGP SIGNATURE-----

--=-rMn8wAQ6E+4f5jMRn2nH--

