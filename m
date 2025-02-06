Return-Path: <linux-media+bounces-25705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0829A2A38A
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 09:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6D2516856D
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 08:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDB0214231;
	Thu,  6 Feb 2025 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="XvnhSuSY"
X-Original-To: linux-media@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890412253FC
	for <linux-media@vger.kernel.org>; Thu,  6 Feb 2025 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738831793; cv=none; b=r3eVUwIKaYlAIWhajR8oicS/vgwjgsIFEohMzFOAk/KO4Wui1U1bIghuRvchDakpnooOZ0B4IvkhnY52CubzB8cUJSi4tGFGodbzRWqTqNzZG7YXTjkOeDdGwZp0oQdKskr952y24sT1pDt7keMv+Ax7k1AbTANBLSm6przASCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738831793; c=relaxed/simple;
	bh=jPsZI5mGjV5SQeDpUeZhPHMKEgxep0dBQJt2kniVRtM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MIolRllBBeUVI/sT9ypfzLCNKfCqYVnc0gO4ab2mO75v6N+BD+7dMP+1L5javhOTV+Z7+F4q2I0yPoHGZl6KTz6BOZI7/JdMY8DrcsMhoNBgj4k2+gIrPEBpdx+13Lu/G+j7xeJ1hbhFlaWGU7ZQSKeC225uIsIF+Ye375OZAfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=XvnhSuSY; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 69956240027
	for <linux-media@vger.kernel.org>; Thu,  6 Feb 2025 09:49:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1738831784; bh=jPsZI5mGjV5SQeDpUeZhPHMKEgxep0dBQJt2kniVRtM=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=XvnhSuSYP3uxhXGn95VrOxPpqGPwqmUkY75ZNofPQYZuTrj22hNekG8OrQ7uMmHTS
	 6N8mS2odtbKmtu+srTLPagVb/4ttB/F7USNiPfPwmdj3ITZFe4Z+ljziYicHLrK95f
	 CDYDbJZM5fsCxrukh2Pvn+Yw0Q49P1fPw94O29bJNlZvEZwrEzv3UvEfHGw7a8z3X5
	 En7t/uPA40U4kLCiRGivC16gaTBqwwjqEK7moy3dblkR3d7DZ5+D1blFBUrrelQZ5J
	 80QSfyDxZ8AaisIDyyVTh3QfQlMvw+tl4KLDmY2Ft5ZsC2NyWxZfc1/hcQzFp7AzAq
	 K0xB7xwhCYacQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YpW4k32JTz9rxF;
	Thu,  6 Feb 2025 09:49:42 +0100 (CET)
Message-ID: <1f4b4e707762c0926c0acece18cb9cc3ecc242bc.camel@posteo.de>
Subject: Re: [PATCH] media: nxp: imx8-isi: check return value of
 media_pad_remote_pad_first()
From: Martin Kepplinger <martink@posteo.de>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 shawnguo@kernel.org,  s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 06 Feb 2025 08:49:37 +0000
In-Reply-To: <20250205172957.182362-1-martink@posteo.de>
References: <20250205172957.182362-1-martink@posteo.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Am Mittwoch, dem 05.02.2025 um 17:29 +0000 schrieb Martin Kepplinger-
Novakovi=C4=87:
> media_pad_remote_pad_first() return NULL if "no enabled link has been
> found".
> Check for that.
>=20
> backstory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> While trying to get a (Y10 grey) sensor working on imx8mp (v6.12.12
> now and
> I know the hardware works on an ancient nxp-kernel),
> I tried to enable the sensor link, set formats and stream:
>=20

btw, that's roughly the
driver:=C2=A0https://github.com/VC-MIPI-modules/vc_mipi_nxp/tree/master/src
that might need additions to with recent mainline kernels. Will the
sensor be the reason for the link not being found here?

                         martin

