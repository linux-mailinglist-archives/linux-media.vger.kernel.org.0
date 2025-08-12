Return-Path: <linux-media+bounces-39587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB11B227A5
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 15:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CC4217733A
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 12:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA17B260578;
	Tue, 12 Aug 2025 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="rM2CPcxk"
X-Original-To: linux-media@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9821A255C;
	Tue, 12 Aug 2025 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755003365; cv=none; b=gEgqENvc9eXyx5xOh3nVJgsnS0cRFnWt9zS2MlCVW9d2BcfZM7ARydsSt83pZUK1FnQrQEfuJkArPmv+36sS+z80NWIZH3J91A5ugaAAohKhSBYRnh6GVxkE6NbLmz1sg36hNF0KBGkU5v8tXVaYTx3D7F5X8Dt06zPSQQ00g8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755003365; c=relaxed/simple;
	bh=zJKsKHBoLA6OwRJ51uRdMlWZvRldd2N5rE/IXsJEWKM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MWcGQlf1+DnVFhQSYy535O1ezj3j8eEYq8TpLPEwcM0zC0EKR1+Pl04VFrVWBKsyvGGg5f35ervnkZYB3UMWcEzvyHQ+78HEGn+7hgCQGGZAlOL/os8aE4tvrBOlL9GLp1979wqPQzkIKBJ1M+6zBYQeMhMMDRQBYqze1z+BNyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=rM2CPcxk; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1755003359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2/K6Kmzeo0smswqH+INF7WIXwUm2J6GEj868GD/UacY=;
	b=rM2CPcxknPD2SbRacMWMBVPBBCQsqxe9vhib0K7Ko9FjPHBdJCGtjs27Uf4U+77CUquUmP
	rvGUkmHsQAPvPYxkLhE8EzUwvLWl52zW4IZViPkgTusRrjtBQAI6Q+ZvN/RDuSxlRiNbvI
	m2u7o3GV+nJUg17UlbNMTOL/eoV5GhMccl0lqnmlJopNW6whQoYTLsHfTXWQ508wOqr81y
	IVdCP+XPljYFGizwMvtlqGCBa5+QgHQTXVaTeESrk8Ih9u+HrCxvnkuM1B3VfmiBzToWTX
	vZqBHP2hC37Ou5OGWDKd/tmvBJp6MUOTD9R3H0cJG1+qwpl8y9wBOtInoEVSDg==
Content-Type: multipart/signed;
 boundary=5eb61e0f6c0eadb653b8d59c45a8a0be8243b30f21a6b0198e575406c8d8;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 12 Aug 2025 14:55:49 +0200
Message-Id: <DC0GRKB9V014.1J7A2PO1B7U8H@cknow.org>
Cc: "Alex Bee" <knaerzche@gmail.com>, "Nicolas Dufresne"
 <nicolas.dufresne@collabora.com>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Diederik de Haas" <didi.debian@cknow.org>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>,
 "Detlev Casanova" <detlev.casanova@collabora.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <DC0FTXJNW0KB.3I8DLNHJVL21O@cknow.org>
In-Reply-To: <DC0FTXJNW0KB.3I8DLNHJVL21O@cknow.org>
X-Migadu-Flow: FLOW_OUT

--5eb61e0f6c0eadb653b8d59c45a8a0be8243b30f21a6b0198e575406c8d8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi again,

On Tue Aug 12, 2025 at 2:11 PM CEST, Diederik de Haas wrote:
> On Sun Aug 10, 2025 at 11:24 PM CEST, Jonas Karlman wrote:
>> This series add a HEVC backend to the Rockchip Video Decoder driver.
>>
>> Patch 1 add the new HEVC backend.
>> Patch 2-3 add variants support to the driver.
>> Patch 4 add support for a rk3288 variant.
>> Patch 5 add a rk3328 variant to work around hw quirks.
>> Patch 6-7 add device tree node for rk3288.
>
> It looks like I had a previous version of linuxtv-rkvdec-hevc-v2 branch
> locally and that also had this commit:
> - media: rkvdec: Keep decoder clocks gated
>
> Is that one no longer needed/useful/etc ?
>
> And 'chewitt' also had a commit to fix 8/10-bit selection:
> https://github.com/chewitt/linux/commit/4b93b05d2ca608bc23f1d52bcc32df926=
d435c7c
> "WIP: media: rkvdec: fix 8-bit/10-bit format selection"
>
> I haven't tried that one (yet), but did  try an other variant with
> changing the ordering in rkvdec_hevc_decoded_fmts but that didn't work
> in my tests. (Can ofc be PEBKAC)
>
> Would that be useful? I do/did have consistent problems with playing
> 10-bit encoded video files.

nvm about the 10-bit problem. It exists, but it's not restricted to HEVC
as it also exists with with H.264 files.

Cheers,
  Diederik

--5eb61e0f6c0eadb653b8d59c45a8a0be8243b30f21a6b0198e575406c8d8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaJs51wAKCRDXblvOeH7b
bjcHAP9PnLzGZY1YCKcprzz/K1OPRxwql59MG2CCmBYwRNgpggD/cJPqV7R+iPpd
9qCnahBvk5X3jrA0jqxwYVblCkJpgAc=
=bXI1
-----END PGP SIGNATURE-----

--5eb61e0f6c0eadb653b8d59c45a8a0be8243b30f21a6b0198e575406c8d8--

