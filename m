Return-Path: <linux-media+bounces-14195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F1B918A4C
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 19:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 019562820DE
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 17:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A222919007A;
	Wed, 26 Jun 2024 17:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="K7rO6ztX"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A34218FDBF;
	Wed, 26 Jun 2024 17:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719423972; cv=none; b=GczYcb5YYQaOvxIM+3RCJWi29y8oFG9vwL4jIKLhqNmZJzux+iaToR0H5RXHmanxs+fo5Y6Fh+XR2lmO9Ob0Fov3l83kpaw8WkPYj+bOwPyuqX6aVEUMsVXcNOdyh1HhSqTLcOG11J9dZzkdUXd6/sXJ/PHD8ltW6dfW8GXvgzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719423972; c=relaxed/simple;
	bh=v0Vh4kAkmKCJro2vJe6FJUdsNe+J9F0n0qvBZYaqEMY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pq2FrvaLJl03I8ax2tBrPdbw7Xiso2Rg1eQszWwmiVDjJ5mLSfvjN+nIVoBtKzBapQ1+Jvfrq3ViUXFNZ+QHRolf++xXjzp3Nn/+UiLsVird8Hh8Gcwo6OkKdlHZ2BIdTCt+l8mVW16VlaLhPyGA+rapkMNl9zldMt92e55GTCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=K7rO6ztX; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719423968;
	bh=v0Vh4kAkmKCJro2vJe6FJUdsNe+J9F0n0qvBZYaqEMY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=K7rO6ztXaBSACwy14eiHwe4hrwfzRq5yJy1iqhmvYCDKsiBoSHGcpTQfoZL32bfGs
	 AlaBzTi8sk2IF8OyyAL8Wd6xq24K6CzLDz+/ozJ4gSKYCAhgkAcHqQsrwShLb93nzT
	 /GgSMJnyEMBpAbpQ39/oULIfSMlGdNv3J+S/oqCZGaNfTgSLDIPIZhrXjnWjQKtDUx
	 5QWDM2KjxIus5KQEbw4+dUpDHXBHU65TSQvHg5cVpLOjNq41x9l2qoxQgPM3O85R2d
	 hTrPMYsJUXUNUoURTASSdK1rvxDARVMd/1VZLbCu5MiGMEwfEPmYwUA9qb0ambYCCc
	 7vwcdDloLSu+A==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5CF0A37810CD;
	Wed, 26 Jun 2024 17:46:06 +0000 (UTC)
Message-ID: <f04e25bf3c09c55049775e8f012cb653cb4682ba.camel@collabora.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: rockchip: Add VPU121 support for
 RK3588
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>, sebastian.reichel@collabora.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, 
 ezequiel@vanguardiasur.com.ar, frattaroli.nicolas@gmail.com,
 heiko@sntech.de,  kernel@collabora.com, krzk+dt@kernel.org,
 linkmauve@linkmauve.fr,  linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
 p.zabel@pengutronix.de, robh@kernel.org,  sigmaris@gmail.com,
 detlev.casanova@collabora.com
Date: Wed, 26 Jun 2024 13:46:03 -0400
In-Reply-To: <20240621092234.280171-1-liujianfeng1994@gmail.com>
References: <20240618183816.77597-7-sebastian.reichel@collabora.com>
	 <20240621092234.280171-1-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Jianfeng,

Le vendredi 21 juin 2024 =C3=A0 17:22 +0800, Jianfeng Liu a =C3=A9crit=C2=
=A0:
> Hi Sebastian,
>=20
> Detlev is working on rkvdec2 and gstreamer can't deal with two h264

Just to clarify, since you are right that it won't work well with GStreamer=
. It
does work with multiple decoders (it exposes them all), it is simply that i=
t
will randomly pick one when decoding, and it may not pick the best one.

> stateless decoders. So it's better to disable h264 decoding feature of
> this vpu121, just like what we have done for rk3399. If your multicore
> patch can handle the jpeg enc node at fdb50000 with other VEPU121 nodes
> properly, we can just use compatible string "rockchip,rk3399-vpu" instead
> of "rockchip,rk3568-vpu".

In the long term, I'd like to stop having to do "like downstream" and expos=
e
them all. I believe the fix is fairly straightforward in GStreamer. We need=
 to
expose in the generated element the width/height ranges, and for H.264 the
supported profiles and level. With that, we at least won't randomly fail at
decoding 4K, and it should be good enough.

For RK3588, which is a new SoC, its not a problem to upstream something tha=
t
does not work with existing userspace. It would only be a regression if we =
where
to enable VDPU121 on RK3399, as now updating linux would cause bugs with
existing userspace.

For users, it would be best if we get this sorted out in GStreamer by the t=
ime
we have a second decoder. Note that I have some vacation coming up this mon=
th,
so there might be extra delays. Yet, its logical to merge this (the "worst"
decoder) first, since then randomly picking a better one won't be a regress=
ion.

Nicolas

