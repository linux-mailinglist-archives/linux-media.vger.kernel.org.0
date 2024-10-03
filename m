Return-Path: <linux-media+bounces-19040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD45E98EF2B
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 14:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A18E28451E
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 12:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D0F17C224;
	Thu,  3 Oct 2024 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="YelPOsBE"
X-Original-To: linux-media@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEED1791F4
	for <linux-media@vger.kernel.org>; Thu,  3 Oct 2024 12:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727958232; cv=none; b=lCvTixGp8chElwEC+x0b5TZYdKSjCWa8R4qnhxrDjSP3qegO7m3QRv5wpkqAOpt8qAmmatAXELCiO6306SxG6gGnCH1p0iQ6BMBSIVlZh4ktexhIwGwLTUc2TgZ2Hrg4e38XG144tkncq3UPxci66SHxEBB7hKf1EvXGdrl0y5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727958232; c=relaxed/simple;
	bh=xu0Hjz19FaClSoUstPuOfAViW3LJdJMBb0N/iYDYdLA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DVzXwOYoEFE3SWCwEBqrpBi4ardl0E/UBjXS60ZLj+RFPA1QSjYyVFjBn4gOqvlkNrRhkAn5X2NJPzHYuDyYvQtpAsyMfy7VFBghxTCKr7JBcN96fPhWok7EKHNVzUZlp/xr1NYze2EbX4udZRFckPi4w1RX3U+HXThZ4szretI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=YelPOsBE; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1727958227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SIqwKiUhoG6a2uAv06BzwgNeY0A4xHveg1I2dddHC5k=;
	b=YelPOsBERiXUuI0N7YkwoBcpn+pBfJJqmsv41Pd9al0ZuwRfDkAfeTYUlVW0B6nFTRJ6VB
	jF2aVigkNKahQzjyQzabKPofXDNeb5fsSqSNhulSl7P51hNhVanTnagxXvS10Dy7vmrN0U
	HFGb5hrax1x7MVFNHWXlWXI/0L1jnhYCFp/1GUQy5ER7yr0Gd20PbaLnAXoJQlr9wZtf74
	UpkcvKfNvta4B8QnUn27mo6e3hFd909oawnP7abXcCsWXNkVWy16KEzY/IKoyJA/HFQdnS
	GkR1se40qV8wEKKw9q8U8goyGj1XZqTCIR/6rLy0Jod5O+hqF7ip0u2xLasAdg==
Content-Type: multipart/signed;
 boundary=341152132e471a78ee9810b312ec357e29c650715afc234660476caf54da;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Thu, 03 Oct 2024 14:23:33 +0200
Message-Id: <D4M62CEXA88M.2I1F9N6V18R3N@cknow.org>
Cc: "Alex Bee" <knaerzche@gmail.com>, "Nicolas Dufresne"
 <nicolas.dufresne@collabora.com>, "Benjamin Gaignard"
 <benjamin.gaignard@collabora.com>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, "Dan Carpenter"
 <dan.carpenter@linaro.org>, "Diederik de Haas" <didi.debian@cknow.org>,
 <linux-media@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 00/11] media: rkvdec: Add H.264 High 10 and 4:2:2
 profile support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Jonas Karlman" <jonas@kwiboo.se>, "Sebastian Fricke"
 <sebastian.fricke@collabora.com>, "Ezequiel Garcia"
 <ezequiel@vanguardiasur.com.ar>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>
References: <20240909192522.1076704-1-jonas@kwiboo.se>
In-Reply-To: <20240909192522.1076704-1-jonas@kwiboo.se>
X-Migadu-Flow: FLOW_OUT

--341152132e471a78ee9810b312ec357e29c650715afc234660476caf54da
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Sep 9, 2024 at 9:24 PM CEST, Jonas Karlman wrote:
> This series add H.264 High 10 and 4:2:2 profile support to the Rockchip
> Video Decoder driver.
> ...
> Tested on a ROCK Pi 4 (RK3399) and Rock64 (RK3328):
> ...
>
> Link to v1: https://lore.kernel.org/linux-media/20200701215616.30874-1-jo=
nas@kwiboo.se/
>
> To fully runtime test this series you may need FFmpeg patches from [1]
> and fluster patches from [2], this series is also available at [3].

I have been using this patch set and earlier version stemming all the
way back to 2023-10-29 and with a patched ffmpeg and mpv ([1] but
earlier versions before that) I have been enjoying HW accelerated
playback on my Rock64 (rk3328) :-)

So for the series, feel free to add my

Tested-by: Diederik de Haas <didi.debian@cknow.org>

[1] https://github.com/mpv-player/mpv/pull/14690

Cheers,
  Diederik

> [1] https://github.com/Kwiboo/FFmpeg/commits/v4l2request-2024-v2-rkvdec/
> [2] https://github.com/Kwiboo/fluster/commits/ffmpeg-v4l2request-rkvdec/
> [3] https://github.com/Kwiboo/linux-rockchip/commits/linuxtv-rkvdec-high-=
10-v6/
> [4] https://gist.github.com/Kwiboo/f4ac15576b2c72887ae2bc5d58b5c865
> [5] https://gist.github.com/Kwiboo/459a1c8f1dcb56e45dc7a7a29cc28adf
>
> Regards,
> Jonas
>
> Alex Bee (1):
>   media: rkvdec: h264: Don't hardcode SPS/PPS parameters
>
> Jonas Karlman (10):
>   media: v4l2-common: Add helpers to calculate bytesperline and
>     sizeimage
>   media: v4l2: Add NV15 and NV20 pixel formats
>   media: rkvdec: h264: Use bytesperline and buffer height as virstride
>   media: rkvdec: Extract rkvdec_fill_decoded_pixfmt into helper
>   media: rkvdec: Move rkvdec_reset_decoded_fmt helper
>   media: rkvdec: Extract decoded format enumeration into helper
>   media: rkvdec: Add image format concept
>   media: rkvdec: Add get_image_fmt ops
>   media: rkvdec: h264: Support High 10 and 4:2:2 profiles
>   media: rkvdec: Fix enumerate frame sizes
>
>  .../media/v4l/pixfmt-yuv-planar.rst           | 128 ++++++++++
>  drivers/media/v4l2-core/v4l2-common.c         |  80 +++---
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
>  drivers/staging/media/rkvdec/rkvdec-h264.c    |  64 +++--
>  drivers/staging/media/rkvdec/rkvdec.c         | 239 +++++++++++++-----
>  drivers/staging/media/rkvdec/rkvdec.h         |  18 +-
>  include/uapi/linux/videodev2.h                |   2 +
>  7 files changed, 410 insertions(+), 123 deletions(-)


--341152132e471a78ee9810b312ec357e29c650715afc234660476caf54da
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZv6MygAKCRDXblvOeH7b
btePAP9ToufxZmhr2Lk3H7eoFfXNX6W5vCwP0nFLWmC9+8cVVQD9G8eUte6bu0b+
A2j0SrvAl7VTKvbJcdcY6UFGpsaKLAk=
=yXzH
-----END PGP SIGNATURE-----

--341152132e471a78ee9810b312ec357e29c650715afc234660476caf54da--

