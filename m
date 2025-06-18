Return-Path: <linux-media+bounces-35132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 653F8ADE60D
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 10:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FC22161944
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 08:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A11A27F00B;
	Wed, 18 Jun 2025 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kgh05gcO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D653335963;
	Wed, 18 Jun 2025 08:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236530; cv=none; b=VR8z7SeSj8Bk4Srob+ffpcoys7SUB78s5gkGUlMwl8eMwCn8ohm4T5R2oAiKZqSmuWlsVzbk+XkER2P3KsmLqgPwu5zvyFTIp+HKHRJYxvtsX7LZ8qWAGoujr184lArl52wsvAfLAo6xWEiNachX2J0dweJpb2IdgMDCWsdcI6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236530; c=relaxed/simple;
	bh=UQjSzVtLoaHKumyxqYKbKMDxrqyDdXy7ILPUN8aigtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ka6ELEc+LwHiYq6OkWglYYlIvZkBooZE3h9zYPdXil9atXvhn/Pgnk7l08LeTNW169gcNb/neB9/ODqRCn2RSsr34FfCczAv5yD+Jx4N1wXInhgP4ECk9uE8AxIvm4y5tPo0PL0aeFHuFwyDqb6XGLZx8TKTRfEueSnS2qBvTCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kgh05gcO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D66C4CEE7;
	Wed, 18 Jun 2025 08:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750236530;
	bh=UQjSzVtLoaHKumyxqYKbKMDxrqyDdXy7ILPUN8aigtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kgh05gcOApBTVoxIo/EK/tZfUCo0TL+wtYxCMWvxdxxAIowTuuY49AauX1wDXC0rU
	 0VG0mHMxOmqpyIU8ffAQwbtbebP0Opxwqi2fvSu7qfINpEAMXQRpK9a3yGRasKv6Z6
	 bATuduzRAbu6WGz584Cyb1NI/ldGM0s31bufpB1soY54q6rUJ0vWMGWYF2wxhnvx/5
	 agxPPfJ9NaBMnZh4ZLARO/wxQXxC5jUqKawqwJeIv9YKkm7zN1Zjz+0elHWBKHTfEB
	 B5B5GYNsE6O2QdVhWn0qnhETnsrgV62S0XVNoYz55oK2ZuY8nIG1gt4Py8GCM7u495
	 Tal6pTDxGFR2A==
Date: Wed, 18 Jun 2025 10:48:47 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Mats Randgaard <matrandg@cisco.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 0/4] media: Fix CSI2 RGB vs BGR pixel order
Message-ID: <20250618-qualified-moth-of-infinity-cc6b0c@houat>
References: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org>
 <2f0028ac-e94f-4f35-afda-8b53ce231b3f@jjverkuil.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rblgwjjfdwfp2nij"
Content-Disposition: inline
In-Reply-To: <2f0028ac-e94f-4f35-afda-8b53ce231b3f@jjverkuil.nl>


--rblgwjjfdwfp2nij
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/4] media: Fix CSI2 RGB vs BGR pixel order
MIME-Version: 1.0

Hi Hans,

On Mon, Jun 16, 2025 at 10:02:57AM +0200, Hans Verkuil wrote:
> On 12/06/2025 14:53, Maxime Ripard wrote:
> > Here's an(other [1]) attempt at fixing the current mess due to the
> > opposite meaning of what v4l2 and the MIPI-CSI2 spec call "RGB". By v4l2
> > nomenclature, the format CSI calls RGB is actually BGR.
> >=20
> > Unfortunately, a handful of CSI transceivers report through RGB media
> > bus pixel code, which is then understood as V4L2_PIX_FMT_RGB24 by CSI
> > receivers.
> >=20
> > This is made somewhat worse the fact that media bus codes have been made
> > mostly with parallel busses in mind, and thus the order of pixels wasn't
> > clearly defined anywhere.
> >=20
> > So the v4l2 vs CSI mismatch was confusing (but there's nothing we can do
> > about it), but the doc didn't really make an attempt at clearing it up
> > either.
> >=20
> > We did have a convention so far though, that about half the affected
> > drivers were following.=20
> >=20
> > This series improves the doc, adds the missing media bus codes, and
> > converts the transceiver drivers to the rightful media bus format.
> >=20
> > We'll also need that series [2] from Laurent to fix all the affected
> > transceivers.=20
> >=20
> > Let me know what you think,
> > Maxime
> >=20
> > 1: https://lore.kernel.org/r/20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b=
963f3eb@kernel.org
> > 2: https://lore.kernel.org/r/20250611181528.19542-1-laurent.pinchart@id=
easonboard.com
>=20
> This link seems to be wrong. Can you give the correct URL?

Yeah, sorry about that. Laurent sent a series to a bunch of us after
discussing it in private, but I assumed it was public.

Hopefully he'll post it soon :)

Maxime

--rblgwjjfdwfp2nij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFJ9bgAKCRAnX84Zoj2+
doZhAYC7fDzn6bWtwK8cC/heltloOVPu6JB+CeFa7QrnvQ76kwkPNhUbnIKmpNTQ
daQtT0cBfjMhlm0valtlWf/CaTo0b1wQ7mPmfrt407r7jVuCWOnBd7mpx8Wkuo/g
GTQoVzAisQ==
=Fj+o
-----END PGP SIGNATURE-----

--rblgwjjfdwfp2nij--

