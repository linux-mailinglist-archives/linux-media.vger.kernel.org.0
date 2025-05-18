Return-Path: <linux-media+bounces-32709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFA2ABAEB2
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 10:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67C28179B82
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 08:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C52D13632B;
	Sun, 18 May 2025 08:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="neNrmWTS"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D5C210F5B;
	Sun, 18 May 2025 08:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747555696; cv=none; b=HI5jtbXp6Zep/fY5drH8UrWhfr+gyxYhJ/odeZS7xPOIOepzbHHk3221sY/P8h1ILJ6zmbgVpxutMg0RCI1Ji/+uwNUaUwgt2ZP8Vqf1O9sR1MHYgXZBPhwQStK9O5K0lFZ4eSoMXynetUh7h86hPn6mv6/qM60kbj0dBVB6ULM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747555696; c=relaxed/simple;
	bh=K0mD+exufhKozeZsdWFJfbcoRT8wJYBxrZTXm3HI6iw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nPBSJxSfvGXKB7BTch3DuLTZ185fdu6RSWsFleJDGPHiKfz3n0GLEb7Sk+TS+cE4TnLCvB3pBuArDJcnrQ7IQUb3N5DdzMH222Oh9AEX4jafmcYPXS1IhAf9pY7kzngzD0kzBXPH0LFywqkUUnyFjFFK86uxkgI0b4WdF+Zs5K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=neNrmWTS; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 89F6241086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747555688; bh=vmujWYBKx4CX1NBzrB8MtJnhhIUjsMYZ7XHQeYwWuSY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=neNrmWTSmRNYDG3cu/UFSD1rpH+UyTaqyQ/XkVfh3sZVe/xYk3saKMXGsCLG2FsWX
	 dthvOc/uNamX/hfwiYszJymf1LeRAYAVHjIGYmt/uxTze99dx5PFge919G8ZxZovr8
	 mfkv7Os89omQ0SpbxH0C3rb6mYOFjwbV4UbKa7yBjmXruqbv8L0wP2tZo4Dt/ucPeL
	 DQ29m7TdBEmYprrAehSy8+zSHLTCS2fgLNpJWldSMcRXRJPK7NQVYmTnQZsvPtjmaq
	 TlIH8ZJXm617fcHQhkpSkjaN4QaAI/bF41vbBtBSy9GoKW9En5yKIg0ll38JzTXXTs
	 RJC2bRbhFYD2w==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 89F6241086;
	Sun, 18 May 2025 08:08:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Hanne-Lotta =?utf-8?B?TcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
 mchehab@kernel.org,
 ribalda@chromium.org, hverkuil@xs4all.nl, hljunggr@cisco.com,
 dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
 Jonathan.Cameron@huawei.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, W_Armin@gmx.de, mpearson-lenovo@squebb.ca
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Hanne-Lotta =?utf-8?B?TcOkZW5ww6Q=?=
 =?utf-8?B?w6Q=?=
 <hannelotta@gmail.com>
Subject: Re: [PATCH 2/4] docs: Improve grammar, formatting in Video4Linux
In-Reply-To: <20250517132711.117618-2-hannelotta@gmail.com>
References: <20250517132711.117618-1-hannelotta@gmail.com>
 <20250517132711.117618-2-hannelotta@gmail.com>
Date: Sun, 18 May 2025 02:08:04 -0600
Message-ID: <871psml4t7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for working to improve our documentation!

Hanne-Lotta M=C3=A4enp=C3=A4=C3=A4 <hannelotta@gmail.com> writes:

> Fix typos, punctuation and improve grammar and formatting
> in documentation for Video4Linux (V4L).
>
> Signed-off-by: Hanne-Lotta M=C3=A4enp=C3=A4=C3=A4 <hannelotta@gmail.com>
> ---
>  .../userspace-api/media/v4l/biblio.rst        |  8 ++---
>  .../media/v4l/dev-sliced-vbi.rst              |  4 +--
>  .../media/v4l/ext-ctrls-fm-rx.rst             | 15 ++++------
>  .../media/v4l/ext-ctrls-fm-tx.rst             | 29 +++++++------------
>  .../media/v4l/pixfmt-srggb12p.rst             |  4 +--
>  .../media/v4l/pixfmt-srggb14p.rst             |  2 +-
>  6 files changed, 25 insertions(+), 37 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documenta=
tion/userspace-api/media/v4l/biblio.rst
> index 35674eeae20d..c3f7c466e287 100644
> --- a/Documentation/userspace-api/media/v4l/biblio.rst
> +++ b/Documentation/userspace-api/media/v4l/biblio.rst
> @@ -53,7 +53,7 @@ ISO 13818-1
>=20=20
>  :title:     ITU-T Rec. H.222.0 | ISO/IEC 13818-1 "Information technology=
 --- Generic coding of moving pictures and associated audio information: Sy=
stems"
>=20=20
> -:author:    International Telecommunication Union (http://www.itu.ch), I=
nternational Organisation for Standardisation (http://www.iso.ch)
> +:author:    International Telecommunication Union (http://www.itu.ch), I=
nternational Organization for Standardization (http://www.iso.ch)

Please do not "fix" the use of either British or American spellings;
both are explicitly just fine for kernel docs.

>  .. _mpeg2part2:
>=20=20
> @@ -63,7 +63,7 @@ ISO 13818-2
>=20=20
>  :title:     ITU-T Rec. H.262 | ISO/IEC 13818-2 "Information technology -=
-- Generic coding of moving pictures and associated audio information: Vide=
o"
>=20=20
> -:author:    International Telecommunication Union (http://www.itu.ch), I=
nternational Organisation for Standardisation (http://www.iso.ch)
> +:author:    International Telecommunication Union (http://www.itu.ch), I=
nternational Organization for Standardization (http://www.iso.ch)
>=20=20
>  .. _itu470:
>=20=20
> @@ -131,7 +131,7 @@ ITU H.265/HEVC
>=20=20
>  :title:     ITU-T Rec. H.265 | ISO/IEC 23008-2 "High Efficiency Video Co=
ding"
>=20=20
> -:author:    International Telecommunication Union (http://www.itu.ch), I=
nternational Organisation for Standardisation (http://www.iso.ch)
> +:author:    International Telecommunication Union (http://www.itu.ch), I=
nternational Organization for Standardization (http://www.iso.ch)
>=20=20
>  .. _jfif:
>=20=20
> @@ -150,7 +150,7 @@ ITU-T.81
>  =3D=3D=3D=3D=3D=3D=3D=3D
>=20=20
>=20=20
> -:title:     ITU-T Recommendation T.81 "Information Technology --- Digita=
l Compression and Coding of Continous-Tone Still Images --- Requirements an=
d Guidelines"
> +:title:     ITU-T Recommendation T.81 "Information Technology --- Digita=
l Compression and Coding of Continuous-Tone Still Images --- Requirements a=
nd Guidelines"
>=20=20
>  :author:    International Telecommunication Union (http://www.itu.int)
>=20=20
> diff --git a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst b/D=
ocumentation/userspace-api/media/v4l/dev-sliced-vbi.rst
> index 42cdb0a9f786..96e0e85a822c 100644
> --- a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
> @@ -48,7 +48,7 @@ capabilities, and they may support :ref:`control` ioctl=
s.
>  The :ref:`video standard <standard>` ioctls provide information vital
>  to program a sliced VBI device, therefore must be supported.
>=20=20
> -.. _sliced-vbi-format-negotitation:
> +.. _sliced-vbi-format-negotiation:
>=20=20
>  Sliced VBI Format Negotiation
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> @@ -377,7 +377,7 @@ Sliced VBI Data in MPEG Streams
>=20=20
>  If a device can produce an MPEG output stream, it may be capable of
>  providing
> -:ref:`negotiated sliced VBI services <sliced-vbi-format-negotitation>`
> +:ref:`negotiated sliced VBI services <sliced-vbi-format-negotiation>`
>  as data embedded in the MPEG stream. Users or applications control this
>  sliced VBI data insertion with the
>  :ref:`V4L2_CID_MPEG_STREAM_VBI_FMT <v4l2-mpeg-stream-vbi-fmt>`
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst b/=
Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
> index b6cfc0e823d2..565157709911 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
> @@ -35,7 +35,7 @@ FM_RX Control IDs
>      description of the correct character encoding for Programme Service
>      name strings. Also from RDS specification, PS is usually a single
>      eight character text. However, it is also possible to find receivers
> -    which can scroll strings sized as 8 x N characters. So, this control
> +    which can scroll strings sized as 8 x N characters. Therefore this c=
ontrol

This kind of change just seems like churn that isn't really improving
the content?

>      must be configured with steps of 8 characters. The result is it must
>      always contain a string with size multiple of 8.
>=20=20
> @@ -49,7 +49,7 @@ FM_RX Control IDs
>      Radio Text strings depends on which RDS Block is being used to
>      transmit it, either 32 (2A block) or 64 (2B block). However, it is
>      also possible to find receivers which can scroll strings sized as 32
> -    x N or 64 x N characters. So, this control must be configured with
> +    x N or 64 x N characters. Therefore this control must be configured =
with
>      steps of 32 or 64 characters. The result is it must always contain a
>      string with size multiple of 32 or 64.
>=20=20
> @@ -64,17 +64,12 @@ FM_RX Control IDs
>      broadcasts speech. If the transmitter doesn't make this distinction,
>      then it will be set.
>=20=20
> -``V4L2_CID_TUNE_DEEMPHASIS``
> -    (enum)
> -
> -enum v4l2_deemphasis -
> +``V4L2_CID_TUNE_DEEMPHASIS (enum)``
>      Configures the de-emphasis value for reception. A de-emphasis filter
>      is applied to the broadcast to accentuate the high audio
>      frequencies. Depending on the region, a time constant of either 50
> -    or 75 useconds is used. The enum v4l2_deemphasis defines possible
> -    values for de-emphasis. Here they are:
> -
> -
> +    or 75 microseconds is used. The enum v4l2_deemphasis defines possible
> +    values for de-emphasis. They are:
>=20=20
>  .. flat-table::
>      :header-rows:  0
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst b/=
Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
> index 04c997c9a4c3..aa509039bd27 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
> @@ -41,7 +41,7 @@ FM_TX Control IDs
>      description of the correct character encoding for Programme Service
>      name strings. Also from RDS specification, PS is usually a single
>      eight character text. However, it is also possible to find receivers
> -    which can scroll strings sized as 8 x N characters. So, this control
> +    which can scroll strings sized as 8 x N characters. Therefore this c=
ontrol
>      must be configured with steps of 8 characters. The result is it must
>      always contain a string with size multiple of 8.
>=20=20
> @@ -55,7 +55,7 @@ FM_TX Control IDs
>      E of :ref:`iec62106`. The length of Radio Text strings depends on
>      which RDS Block is being used to transmit it, either 32 (2A block)
>      or 64 (2B block). However, it is also possible to find receivers
> -    which can scroll strings sized as 32 x N or 64 x N characters. So,
> +    which can scroll strings sized as 32 x N or 64 x N characters. There=
fore
>      this control must be configured with steps of 32 or 64 characters.
>      The result is it must always contain a string with size multiple of
>      32 or 64.
> @@ -94,8 +94,8 @@ FM_TX Control IDs
>=20=20
>  ``V4L2_CID_RDS_TX_ALT_FREQS (__u32 array)``
>      The alternate frequencies in kHz units. The RDS standard allows for
> -    up to 25 frequencies to be defined. Drivers may support fewer
> -    frequencies so check the array size.
> +    up to 25 frequencies to be defined. Because drivers may support fewer
> +    frequencies, check the array size.

Here too, I'm not sure I see the value in this kind of change.

Thanks,

jon

