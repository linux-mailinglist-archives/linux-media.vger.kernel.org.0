Return-Path: <linux-media+bounces-42724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FBCB84DCC
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 15:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1434F7BA75C
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 13:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D8D30BB9E;
	Thu, 18 Sep 2025 13:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="o9epKl2Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE63A30BF78
	for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 13:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758202296; cv=none; b=kryfaw5WgtIv6jk9bYUDPYvHE38e+kuJwJF/sxFBNLFYFksCuqDsUv2GtG6lfiN+qUHwg18ZKc2MINWEReUVzBFVfTsdteQzPaz3wSJsobUfAnnRtFZdtq3Fzc09+X4pEYJOmZdUuv4+nyPTHYbCCijJFMRqi64lWA9lM79cc+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758202296; c=relaxed/simple;
	bh=qPYv2m3jnaBv4/l/HZ0iG3MFsl4uuoIjun6WjOr6o18=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sF1e9UmhUDPahg3Ll8RM1KyW0ifOT57rCqFhDkI9RCibUdSOJnp5DcwNg0PeOBVtrzwpgUjUJK+pwJloxUYfG6f4Jpw2Prd4u0muWZSJEcJuoZ0Ssmx97b59B3nObgqpERQqYS+6xcBrNN4D3ImZg0Jx6FoJm7pmAqLITFVlG0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=o9epKl2Y; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8117aef2476so99051285a.1
        for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 06:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1758202293; x=1758807093; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qPYv2m3jnaBv4/l/HZ0iG3MFsl4uuoIjun6WjOr6o18=;
        b=o9epKl2YKb7F2al2Yi3aNrsPu3ORw//EycCK8DgCQ1s4chfkcZ/eS+wzVkzChPU1dL
         mPXCN9rRcxXpZyUMIjEmkMTouxl/KU7RZPukLwrvFm2DniLnW3fH90qGqFRZ9i8NM1we
         DRgIMwU+q/TnvoTMR0EqLdbKWdnLNAta4fBbBBTL3a9jwcATJ/mpBY+H6Benv1nLyZ2h
         9mtU/dOYro8vnFAhrVTkjDbw8obXqpXfIk0jJYOLa/A9Ikpx6w4qmVxVQeSHRMgg5Dxr
         dcskw39a1K/YgB6tl9OagxNKK5typ67md/0vDCqBbtBNkC9xu2BidizmkHfpw3gWEEBT
         bjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758202293; x=1758807093;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPYv2m3jnaBv4/l/HZ0iG3MFsl4uuoIjun6WjOr6o18=;
        b=jOKdD2lgvVDvBajW53/HZQ7ye3oQ2KUnnkpDBcYWwI7w/4Y/fEGPJsHybL48iFH6c6
         QQx/Vc85Vs/Ae1IqwqgPPkGW3cfij81W5mw8N6vWBv0Y49WgbSd+Mshg4gbb7L36oMhM
         slr4pLyN/at9i1fTyrxRsqCbAZqRRnYKvhjhWSZ5xqX7n8jN4zZZTvb9K2ieSisHN8t4
         Iq0eKaJEEZVX+Cge0pxCHM6FmeMdpANWoj+EVC5DHby2SFkG2U2+Dn8Db2hjYm+LFlbP
         LqZ1g6pI+f4Ih737Mb5J3iyDHhi5LTjTDGvNd9cMwfspOYWWzpGMRMIZVpiZJ2gv76ob
         fJ6g==
X-Forwarded-Encrypted: i=1; AJvYcCXUxpafS/9fJK43WkVbEGteK6EakOi8WiKNAyAuGVdRxABQnF0txZJgQs9rtoc+T5KM4nHfnAvACiEViw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjBbHqsP91mCQSiKgpG+bxperfUfhbkkaAJOQTjSHqkKcwJJte
	VUMYHaPRYUi19S+nYg5RAvpvk909FOtlHOD+ac/Mg5gRYzqk/JxY8X+8XLY3OEjiG9K8aD8pJgm
	YdoEB
X-Gm-Gg: ASbGncuxm2TZgh/+PtX7kJm60/1FjyEAUqnGpI/z9mBcF1/4Mh7XCGa+QAK0lXM1zpD
	Oz1Ca0t+Y4QU/PYzHwQZS89buzizxPnZP50uE94AOUb+H84uKjDnY4UZT704Yauqvlz0LT8DXfr
	zVTcf7kR5qcG9V1mPxj65eAUmT5Vbunfg12Sut48WFo46sYZuwWc05GdPrvrEMaY6jVpBJxRrgI
	fvsMxnR6/g8dXuEbuBLgRLfhhtQ2P4Vl4iatugeL8IvOIt+4mYIsDdnB5cHeCLLbQnnsa1VGtZM
	eezecV5AOdj8bOHApB/wzlz0SU90fMFexRqg5Qd5oCbm4oP0Ib+jXC2Vr4mHWNdXYBPTl07LRvZ
	KN19BQfw/aFfHKtfx4gPPIj0ypAb16c2xqKxluM+nBUO+6BIlZiN9c8f6gA==
X-Google-Smtp-Source: AGHT+IEZMrFSL2BRRPxtTOKjAWDW7xdTVpOSqOm+sRqPhEGgZKYSOVPXEdh1+K0ZhOlHemb5x0jKfg==
X-Received: by 2002:a05:620a:170f:b0:812:afec:d5b8 with SMTP id af79cd13be357-8311186d1f5mr581762485a.52.1758202292862;
        Thu, 18 Sep 2025 06:31:32 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:aee0::5ac? ([2606:6d00:10:aee0::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4bda8998eafsm14022101cf.31.2025.09.18.06.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 06:31:32 -0700 (PDT)
Message-ID: <3a9f613bfcc560281d7287ca2e411dadcac745b6.camel@ndufresne.ca>
Subject: Re: [PATCH v2 00/12] media: rkvdec: Add support for VDPU381 and
 VDPU383
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Diederik de Haas <didi.debian@cknow.org>, Detlev Casanova
	 <detlev.casanova@collabora.com>, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Date: Thu, 18 Sep 2025 09:31:30 -0400
In-Reply-To: <DCV98UFRGHAS.2DGZOEOVN9WNX@cknow.org>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
	 <DCV98UFRGHAS.2DGZOEOVN9WNX@cknow.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ka8JQHJLRBiB88+7XTFU"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-ka8JQHJLRBiB88+7XTFU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 17 septembre 2025 =C3=A0 19:34 +0200, Diederik de Haas a =C3=A9=
crit=C2=A0:
> Hi Detlev,
>=20
> On Fri Aug 8, 2025 at 10:03 PM CEST, Detlev Casanova wrote:
> > These variants are found respectively in the RK3588 and RK3576 SoCs.
> > This patch only adds support for H264 and H265 in both variants.
>=20
> I tested this on my Rock 5B (rk3588) with (ffmpeg and) mpv on Debian
> Forky with sway and I was quite impressed with the results :-)
>=20
> In my earlier testing I found that the classic BBB video made for a
> really good test video and it played REALLY well. The 1080p version in
> both x264 and 8-bit x265 played without frame drops, although when
> pressing 'I' to show video info over the video it dropped some frames.
> But that never resulted in any visible artifacts.
> On the 2160p version I did see quite a number of dropped frames, but
> didn't notice any visual artifacts. Maybe that it got displayed on a
> 1080p monitor had something to do with it?

Sounds like we have "correctness" with ok performance, so that is enough fo=
r me
to consider the patches. There is few things that are not implemented that =
could
explain lower performance compare to the downstream stuff, such as the lack=
 of
AFBC. It will hopefully come later, giving nice boost when doing GPU stream=
ing.

>=20
> 10-bit encoded x265 files (still) resulted in a completely blue output,
> but I have strong reasons to believe that's due to 'missing pieces' (ie
> NV15 support) in the rest of the display pipeline.

Its still quite early days for NV15 (and its derivatives) upstream of
everything, so I would not block on that. It passes the tests when we read =
back
the pixels from CPU I believe.

>=20
> The displayed video seemed sharper and better then in my other tests.
> I thought I did see an artifact around 5:50 when a big rock almost fell
> on the little animal. Looking further, it appears to be an artifact in
> the original video :-O (I saw it also on my AMD GPU on my amd64 system
> and also when using software decoding).
> The fact I only noticed it when testing this patch set is saying a lot
> ... in a positive way! So I'm happy to provide my

That's it, your video watching experience is now ruined for the rest of you=
r
life :-D

>=20
> Tested-by: Diederik de Haas <didi.debian@cknow.org>=C2=A0 # Rock 5B

thanks a lot for testing,
Nicolas

--=-ka8JQHJLRBiB88+7XTFU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaMwJsgAKCRDZQZRRKWBy
9IXzAQDaymJ1abHUHsMNbl/WYGVN2REm08PxhqTaHUsWwxU6ywEAy2qLFg4QWHSc
KidAMEhUNpEK1hwZcicsIl92zBbgPgY=
=H3qI
-----END PGP SIGNATURE-----

--=-ka8JQHJLRBiB88+7XTFU--

