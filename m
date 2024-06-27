Return-Path: <linux-media+bounces-14257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A31F091A85C
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 15:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 600EE2855E4
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 13:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509F01957FD;
	Thu, 27 Jun 2024 13:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="chxmMBze"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FF11946BB;
	Thu, 27 Jun 2024 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719496395; cv=none; b=TH98iKfXGgAOZ708aChznnVyXHilUc089R0nc/ybiOcrcYdtclwWWWvQmGSlvAJI4B8bj9QZRdw12ctKslCKNVRrJmz+peQzcNxImD7GSQAeA331eDcpDaAWPcOCceI/DtjydQtSijlIS41Skdsk7lEKlqUkqbLdOcVATnd//1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719496395; c=relaxed/simple;
	bh=mKgxZFERBkLeUE2nY35u5owDkA0UeUZU/3BEl4SzNH8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IwIAdVBAGkx00QDmjg6dUP7HYsPORkfYhka9MdRoJtFZ7C2rKkVrCY7e9btNK3x40CMtbVk6scAAcwhL2XZodFybeqJXhrgfBem++ZEgx5/bczYXPTJWVM1wGKKvn14TdA0shYXaQOu/iP7Suq9BuoKLc7pfH2GQIgadDInGd6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=chxmMBze; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719496392;
	bh=mKgxZFERBkLeUE2nY35u5owDkA0UeUZU/3BEl4SzNH8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=chxmMBze7QEbuDf1i5ujeX+ucPi5EsGeeQUsojAcsx3/WZjSZ3omK2B1fE1oRS9S0
	 7m35maflibi2jM2C+mZksYjRd6DstbZxkDZhdXCTnYLuMw2zoR/OBq3n3KHqipQlHa
	 YUhTPGRjcFtypvPeW/FBFL+3rKpwceBcKKOMxYNx+t5nVo6XO5QUd/79+av4ONLZVH
	 jomqckRPJAwDMYux7uTMY42nPVsPFt66WGXcX9mQjU+ccDhJtMtjY7F2mDfWn1xBDh
	 k2Y9OICU1wku6HqFtUGOQPQcKceI1SV0D7SNAkI+ItU/ZXIkhWrcEg5xJdCK+ULuye
	 /eQK+R9B3lY0w==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2016E3781188;
	Thu, 27 Jun 2024 13:53:10 +0000 (UTC)
Message-ID: <0fe5ee653af4e7ecdf8a7a605e9e80c91011a53d.camel@collabora.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: rockchip: Add VPU121 support for
 RK3588
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: conor+dt@kernel.org, detlev.casanova@collabora.com, 
	devicetree@vger.kernel.org, ezequiel@vanguardiasur.com.ar, 
	frattaroli.nicolas@gmail.com, heiko@sntech.de, kernel@collabora.com, 
	krzk+dt@kernel.org, linkmauve@linkmauve.fr, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	p.zabel@pengutronix.de, robh@kernel.org, sebastian.reichel@collabora.com, 
	sigmaris@gmail.com
Date: Thu, 27 Jun 2024 09:53:01 -0400
In-Reply-To: <20240627081310.583427-1-liujianfeng1994@gmail.com>
References: <f04e25bf3c09c55049775e8f012cb653cb4682ba.camel@collabora.com>
	 <20240627081310.583427-1-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 27 juin 2024 =C3=A0 16:13 +0800, Jianfeng Liu a =C3=A9crit=C2=A0:
> Hi Nicolas,
>=20
> On Wed, 26 Jun 2024 13:46:03 -0400, Nicolas Dufresne wrote:
> > Just to clarify, since you are right that it won't work well with GStre=
amer. It
> > does work with multiple decoders (it exposes them all), it is simply th=
at it
> > will randomly pick one when decoding, and it may not pick the best one.
>=20
> I have tested rkvdec2 and vpu121 with gstreamer 1.24.2 on rk356x to decod=
e
> a 4K video, and gstreamer always fall with error:
> "v4l2slh264dec0: Failed to configure H264 decoder".
> I guess that's because 1080p vpu is at fdea0000 which is always
> initialized earlier than rkvdec2 at fdf80200, so gstreamer will always
> choose the 1080p decoder.

I've never done any research, but that is plausible.

- Probe happen in address order, since DT are in address order
- Media notes are assigned in probe order
- GStreamer register the element in the same order in its registry
- In adsence of a rank or capabilities to differentiate, the probe order is
maintained.

>=20
> > In the long term, I'd like to stop having to do "like downstream" and e=
xpose
> > them all. I believe the fix is fairly straightforward in GStreamer. We =
need to
> > expose in the generated element the width/height ranges, and for H.264 =
the
> > supported profiles and level. With that, we at least won't randomly fai=
l at
> > decoding 4K, and it should be good enough.
>=20
> Not only gstreamer, chromium also has similar issue. Chromium will only
> check video resolution globally before starting to use one decoder: if
> there is a 4K decoder detected before, it will mark 4K resolution as
> supported. But when decoding videos, it will choose the first decoder
> supporting profile like H264. So chromium may use a 1080p decoder to
> decode a 4K video.
>=20
> Chromium's code about v4l2 is complicated for me. I may create a bug abou=
t
> it. But chrome os doesn't support devices with multi v4l2 decoders like
> rockchip's socs, I don't know if they have the motion to fix it quickly.

That's an interesting bug, which makes its more of less equal to GStreamer
"unimplemented behaviour". Filing a bug is best indeed, ChromeOS team, who
maintains this, is probably unaware as they don't have any SoC with multipl=
e
decoders. Even on PC side, their Chromebooks only ever have a single GPU, I
haven't heard about any eGPU support either.

>=20
> > For RK3588, which is a new SoC, its not a problem to upstream something=
 that
> > does not work with existing userspace. It would only be a regression if=
 we where
> > to enable VDPU121 on RK3399, as now updating linux would cause bugs wit=
h
> > existing userspace.
>=20
> There is an old soc just like RK3399: RK3328, which also has a 1080p
> hantro h264 decoder and a 4K rkvdec h264 decoder. I guess less people car=
e
> about its mainline decoding with gstreamer/chromium so it still has 1080p
> decoder enabled.

What I meant by new/old, is supported mainline or not. But yes, on timeline=
,
there is many older SoC with dual decoders in the Rockchip line.

>=20
> > For users, it would be best if we get this sorted out in GStreamer by t=
he time
> > we have a second decoder. Note that I have some vacation coming up this=
 month,
> > so there might be extra delays. Yet, its logical to merge this (the "wo=
rst"
> > decoder) first, since then randomly picking a better one won't be a reg=
ression.
>=20
> Happy vacation days! I will also take a look at chromium's code to see if
> I can fix it.

Great, let's keep everyone on sync, I'm sure we can come up with something
better then disabling the possibly useful hardware.

Nicolas

