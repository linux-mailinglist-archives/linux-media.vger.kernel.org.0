Return-Path: <linux-media+bounces-27158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A303A47BD3
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 12:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 847993A6F98
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 11:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E172622A7F6;
	Thu, 27 Feb 2025 11:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="tvD1Ncvy"
X-Original-To: linux-media@vger.kernel.org
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B5B227E82
	for <linux-media@vger.kernel.org>; Thu, 27 Feb 2025 11:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740655047; cv=none; b=XYFXqCHc6lInqkNr/SK5JXoD916gGQasDRtyDbJJYgSkJlBUJX0PHh21DJuBYmCHi8ScDPEQrQ1kfQML0PmWXQWZTziEJXKWHFQkBvyM8qVDfR2FVnlINQQBkUtnhfZXc71LHiKrATCMb7GZAmsQbHONmxBh7qdwIyO5xT5+Kc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740655047; c=relaxed/simple;
	bh=+1vOICpmGanv7zQa80aQVgtEQmu7zQwBg27CvOEYAFc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=tZAcMW3MgmApD8MkXxIN02lmaXdwAi/0btLcYSNOPnhc+BB/dEjEK0lVe8+FqotWTUima6BczpmLr23KhMD/VVJloPKkWnlMf4MwQZdlDhA0ifkWaYROJnAezQlFxVHwks5rKopjqMlGA6A3NJv2QlbPS+vc7DCMBuQZb3KTDko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=tvD1Ncvy; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1740655031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/2lDeXkEJ2zFt3hYo39omMRDWvJAm1z3XFejqJuo+b0=;
	b=tvD1NcvyUC8jq0+m+Gozq4Z/bqVih/lG3hS2DPcNco84ZZ+SIoD6aFT0++hk7tK8U1ydpo
	wOWJDxjJx40r969JOwHrkoMmkxw/wi+uWnuKVQZshU/nAZ+ID6zmBGuNvKSzeQeBqdz7Vk
	9e252TkSszIkCBs36i6+ikF3yTS8amvKU2bJjg/4JStDRSCdSmYNiQOWByKLbhCyMws326
	CrvzMK09mhDAQKXD0ecC1j+JoPwbTag4IzK13WSlT482w+m+n34pGHtCkgPSLmHUk3WuRk
	+mNqIdiKQ9tlgObwUfGL5KBjc25GL/YD3LXCnxnzY9khQeVnVfpFgi8mmJR6RA==
Content-Type: multipart/signed;
 boundary=6ea8b17535b5903c5a542c2da7dcd7cc3e5f0f3ad9204e7183c8eccf5172;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Thu, 27 Feb 2025 12:16:58 +0100
Message-Id: <D836PGFSE49W.SVV3JJRM1WQE@cknow.org>
Cc: <kernel@collabora.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, "Tim Surber" <me@timsurber.de>,
 "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v10 3/6] media: platform: synopsys: Add support for HDMI
 input driver
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Dmitry Osipenko" <dmitry.osipenko@collabora.com>, "Shreeya Patel"
 <shreeya.patel@collabora.com>, "Heiko Stuebner" <heiko@sntech.de>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Hans Verkuil" <hverkuil@xs4all.nl>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <jose.abreu@synopsys.com>, <nelson.costa@synopsys.com>,
 <shawn.wen@rock-chips.com>, <nicolas.dufresne@collabora.com>, "Sebastian
 Reichel" <sebastian.reichel@collabora.com>
References: <20250225183058.607047-1-dmitry.osipenko@collabora.com>
 <20250225183058.607047-4-dmitry.osipenko@collabora.com>
 <D82H4F6J4V4V.2BLHVUVD3BVX9@cknow.org>
 <f0c3a16e-c4a2-4cd9-9afa-a21a975a45c9@collabora.com>
In-Reply-To: <f0c3a16e-c4a2-4cd9-9afa-a21a975a45c9@collabora.com>
X-Migadu-Flow: FLOW_OUT

--6ea8b17535b5903c5a542c2da7dcd7cc3e5f0f3ad9204e7183c8eccf5172
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Feb 27, 2025 at 6:28 AM CET, Dmitry Osipenko wrote:
> On 2/26/25 18:14, Diederik de Haas wrote:
>>> +config VIDEO_SYNOPSYS_HDMIRX_LOAD_DEFAULT_EDID
>>> +	bool "Load default EDID"
>>> +	depends on VIDEO_SYNOPSYS_HDMIRX
>>> +	help
>>> +	  Preload default EDID (Extended Display Identification Data).
>
>> Thus a more extensive description what this Kconfig item does and why
>> and when I want to enable it or not, seems more useful to me.
>
> Will update and expand the description with more clarification. Thanks
> for suggestion.

Thanks for the explanation. The new description looks *much* better :-)

Cheers,
  Diederik

--6ea8b17535b5903c5a542c2da7dcd7cc3e5f0f3ad9204e7183c8eccf5172
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ8BJsAAKCRDXblvOeH7b
bqZ7AQCBEQEhBUK1iOz9+T8B3Y+OdjGIfIJ6kEU6H7gHbHEHqAEAnKGZTMkUf6+D
c2Kroh+hbwGpguLij0MrCgQAOd7oKQs=
=B/cr
-----END PGP SIGNATURE-----

--6ea8b17535b5903c5a542c2da7dcd7cc3e5f0f3ad9204e7183c8eccf5172--

