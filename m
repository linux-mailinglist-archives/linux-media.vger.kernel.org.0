Return-Path: <linux-media+bounces-13446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B92F90B367
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 17:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F2B1283E36
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 15:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F2914D71E;
	Mon, 17 Jun 2024 14:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="zZVu2wrR"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E109F14431B;
	Mon, 17 Jun 2024 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718634056; cv=none; b=BnZJzRPWlqYraTPbpRFZiMM8ebm3Scpr41NrtvkMG9w1+Iz8fepVAvs2dSaxodGMO925kxHotSwxY0m6B77TSUWxY1VeIPkl+9cR1mQPwa7PFyauJZ9MOCznbXipjtQ2+Iim0rP4AVCxGbxLoJ1bxOWa5PeGZG5ah3NOnMpn2mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718634056; c=relaxed/simple;
	bh=rT3ErQ2RhcAZ0GHggMJ+9CGK3rDjead7zGL+WSoRczk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z2TNdbUeDReY4VufQb2Hk6riu6+oE40CnLRn2LSV/s7WAu0Ck6KfCIp+ddwP5fGhx+Yq6BB+7dWW/q3OlrjUCCCTlp1bCKASBsuZ7+XLE79AZDHFatHcd2/Z070YxTrQHnbyC89ZNpQAzIeX3Iqmz4PJP7kGn0Je/ROBHO1JYQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=zZVu2wrR; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718634053;
	bh=rT3ErQ2RhcAZ0GHggMJ+9CGK3rDjead7zGL+WSoRczk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=zZVu2wrRhDGF7owXlJY7ZeerZt0jB6uitzJ7hnqS6WDkqB0SQQtd9a8StGbkhXXOb
	 kUmu1/nQtNGLTGwT3JZ0M981NXyFkt0uo/gHNnwDRl34Q7kyl7Vlj0B+nAqJnZS517
	 4iKOBzU3Kj9na0sdGX9xupHMTgdWXeWm7CTA3gKz50WK4N9Tge+poxSVorkIqD1S/x
	 liSLRzhsO2H+lWF0vMmB+b69TPWWmpUz6b1qw2eL9carxstil4oCL71uVkVaq1l0IL
	 Qu+HtskIXNfTbDlv2PZyhZqR9QtmwI5TFgBO5JnI8qnbtc17H00G7FMEdJ5RqwNDV7
	 VLO1DJo0Kd0gA==
Received: from arisu.localnet (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6E94637812FD;
	Mon, 17 Jun 2024 14:20:50 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: alchark@gmail.com, andy.yan@rock-chips.com, conor+dt@kernel.org,
 cristian.ciocaltea@collabora.com, devicetree@vger.kernel.org,
 didi.debian@cknow.org, dsimic@manjaro.org, gregkh@linuxfoundation.org,
 heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 mchehab@kernel.org, robh@kernel.org, sebastian.reichel@collabora.com
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Mon, 17 Jun 2024 10:20:23 -0400
Message-ID: <4116468.VLH7GnMWUR@arisu>
Organization: Collabora
In-Reply-To: <f295f41ef1c9ee920ac3ac8e70ccf672ba7c9648.camel@ndufresne.ca>
References:
 <20240615015734.1612108-2-detlev.casanova@collabora.com>
 <20240617094735.27928-1-liujianfeng1994@gmail.com>
 <f295f41ef1c9ee920ac3ac8e70ccf672ba7c9648.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart10749034.NyiUUSuA9g";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart10749034.NyiUUSuA9g
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Mon, 17 Jun 2024 10:20:23 -0400
Message-ID: <4116468.VLH7GnMWUR@arisu>
Organization: Collabora
MIME-Version: 1.0

On Monday, June 17, 2024 10:04:59 A.M. EDT Nicolas Dufresne wrote:
> Hi,
>=20
> Le lundi 17 juin 2024 =E0 17:47 +0800, Jianfeng Liu a =E9crit :
> > Hi Detlev,
> >=20
> > Thanks a lot for your work! I try to use rkvdec2 with chromium but it
> > can't play h264 video. Here is the log of chromium:
> >=20
> > [5799:5873:0617/171224.850061:VERBOSE2:video_decoder_pipeline.cc(473)]
> > Initialize(): config: codec: h264, profile: h264 high, level: not
> > available, alpha_mode: is_opaque, coded size: [1920,1080], visible rect:
> > [0,0,1920,1080], natural size: [1920,1080], has extra data: true,
> > encryption scheme: Unencrypted, rotation: 0=B0, flipped: 0, color space:
> > {primaries:BT709, transfer:BT709, matrix:BT709, range:LIMITED}
> > [5799:5886:0617/171224.850915:VERBOSE2:v4l2_video_decoder.cc(182)]
> > V4L2VideoDecoder():
> > [5799:5886:0617/171224.851218:VERBOSE1:v4l2_device.cc(128)] Open(): No
> > devices supporting H264 for type: 0
> > [5799:5886:0617/171224.851346:VERBOSE4:v4l2_queue.cc(1069)] This queue
> > does  support requests.: No such file or directory (2)
> This one indicates that V4L2_BUF_CAP_SUPPORTS_REQUESTS might be missing in
> the REQBUFS implementation. I suspect GStreamer simply assumes this today
> for driver exposing stateless formats (which is fair, its not a compliance
> test, and we don't have a codec compliance yet).

There is a src_vq->supports_requests =3D true; Do I also need to set a flag=
 on=20
the device caps ?

> I'd suggest to check and fix this one, and retry, might only be noise, mi=
ght
> be the main cause, we cannot tell.
>=20
> > [5799:5886:0617/171224.851426:VERBOSE1:v4l2_video_decoder.cc(476)]
> > InitializeBackend(): Using a stateless API for profile: h264 high and
> > fourcc: S264
> > [5799:5886:0617/171224.851687:VERBOSE1:v4l2_video_decoder.cc(598)]
> > SetupInputFormat(): Input (OUTPUT queue) Fourcc: S264
> > [5799:5886:0617/171224.851797:VERBOSE1:v4l2_video_decoder.cc(636)]
> > AllocateInputBuffers(): Requesting: 17 OUTPUT buffers of type
> > V4L2_MEMORY_MMAP
> > [5799:5886:0617/171224.867687:VERBOSE1:v4l2_queue.cc(1511)] Streamon():
> > (OUTPUT_MPLANE) VIDIOC_STREAMON failed: Invalid argument (22)
> > [5799:5886:0617/171224.867902:VERBOSE1:v4l2_video_decoder.cc(937)]
> > StartStreamV4L2Queue(): Failed to streamon V4L2 queue.
> > [5799:5886:0617/171224.868009:VERBOSE1:v4l2_video_decoder.cc(1377)]
> > SetState(): Error occurred, stopping queues.
> > [5799:5886:0617/171224.868105:ERROR:v4l2_video_decoder.cc(120)]
> > StartStreamV4L2Queue failed at
> > Decode@media/gpu/v4l2/v4l2_video_decoder.cc:915
> > [5799:5886:0617/171224.871898:WARNING:v4l2_video_decoder_backend_statel=
es
> > s.cc(126)] There is/are 0 pending CAPTURE queue buffers pending dequeui=
ng.
> > This might be fine or a problem depending on the destruction semantics
> > (of theclient code.
> >=20
> > Here is the chromium code failed when calling VIDIOC_STREAMON:
> > https://github.com/chromium/chromium/blob/125.0.6422.60/media/gpu/v4l2/=
v4l
> > 2_queue.cc#L1508
> >=20
> > I'm running chromium v125.0.6422.60 and I can decode 1080p h264 with
> > hantro g1 decoder on rk3588.
>=20
> Are you using minigbm ? Because if you do, we don't have minigbm code for
> this driver (and have no plan to do so, since we don't aim for ChromeOS
> support).
>=20
> Nicolas
>=20
> > Best regards,
> > Jianfeng


--nextPart10749034.NyiUUSuA9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEonF9IvGrXNkDg+CX5EFKUk4x7bYFAmZwRicACgkQ5EFKUk4x
7bYICgf9HGR2mStaG71gFFNr6E9cHZX99Rfy5S0F2pILlta1bauHn+MrGEvOL9zt
r57kN7jzxcGrM2hPequqd4YF85OFHns2Z8tbAz74UqqG1PlPHdfWrLpfBoDph2dD
Pg9F/f1sDDy8k6IsHn/Rd/qH4RL96V2qSaqfKI/qH1xbxLls5p8JNvH12mBEVv/O
4m4OfP/tM2BRQS0nK0UseYKJ3nL4coqKsWtstbVAgtCA8OW1NsJ7VNb6kfWtt/dY
kb7hz+eqwpqoA+IW8gz+5yVfKoXYzfnMaK03GLSWphlxRrHo3FcM1Tcolm9vEMMH
Y3IX6BEAtv8CJn5gpKCIcWyg+/Nt1g==
=5zKt
-----END PGP SIGNATURE-----

--nextPart10749034.NyiUUSuA9g--




