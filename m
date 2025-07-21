Return-Path: <linux-media+bounces-38129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4747CB0BF66
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 10:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C9817AC475
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 08:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95E520F069;
	Mon, 21 Jul 2025 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G7rf+ZOi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18433197A8E;
	Mon, 21 Jul 2025 08:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753087599; cv=none; b=u5AAzrnZ+K03/Ab7w9FYZw4DQ01jvSzfXGzDWxzzOiIINk9cqTlQ5t6II6TbSPabPKb20zewshFGOrQHj84ICs1diK1E9jmVS2o30LDmY14PK/ykemYF2uy0CFK1n+iIokNAFEqbU4Z6NRpO8xBZs1pFboldu6u1uIs/xrQ1EWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753087599; c=relaxed/simple;
	bh=31IBqqE1Ag+vgKp9PT7MGd+rJ3pmoTBb2Ubw46Y8TBI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=UTy3MkCx6yQ845dgq5lYqUZLo/AofUhLD3+CbwmYgIUh3Y9nC/YplwNBiyfP9KbM+ugoiLrAVQODTS4i1p+rO3uEXgHnKf5dC9pO1nyZCbdd80mOhdeRswYGiwKJXa8gNp/ADD3U9hO/OUdLukhjmHQdHJRLKKkQY0dLcgiuWHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G7rf+ZOi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:c17b:e5e2:6e10:a471])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 148A67928;
	Mon, 21 Jul 2025 10:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753087550;
	bh=31IBqqE1Ag+vgKp9PT7MGd+rJ3pmoTBb2Ubw46Y8TBI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=G7rf+ZOicJ8LO6QLyDLra9qXAyetCExNk5XfhboXnO6Wux8h5cwM71UCClYkZhJ9A
	 J1cnNr2zLf+4okgSrH6E7joOjieoZ0QXrlVRXamL+M/ZBSov0qTazvBamyszxGbFSc
	 q3Kj7E6DT48Abz2Nq6M21t4o6ymC7+zbmgYTtKi4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <m38qknx939.fsf@t19.piap.pl>
References: <m3h5zbxkc6.fsf@t19.piap.pl> <m38qknx939.fsf@t19.piap.pl>
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Heiko Stuebner <heiko@sntech.de>, Paul Elder <paul.elder@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Dafna Hirschfeld <dafna@fastmail.com>, Krzysztof =?utf-8?q?Ha=C5=82asa?= <khalasa@piap.pl>
Date: Mon, 21 Jul 2025 10:46:23 +0200
Message-ID: <175308758352.3134829.9472501038683860006@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Hi Krzysztof,

Thanks for your investigations. This is all quite worrisome to say the
least.

Quoting Krzysztof Ha=C5=82asa (2025-07-17 15:03:54)
> > The "reference" (NXP) VVCam driver simply does the operations twice
> > (i.e., reads twice with the first result discarded, and writes twice).
> > This fixes the problem on most accesses, but the problems still persist.
>=20
> It appears the corruptions are quite frequent, though.
> Using "ldp qXX, qYY, [x0]" (2 * 128-bit load pair) I get results like
> this (each data row is a result of a single ldp):
>=20
> addr:  32E21400 32E21404 32E21408 32E2140C 32E21410 32E21414 32E21418 32E=
2141C
> -------------------------------------------------------------------------=
-------
> values 3D000007       20 3C300000   1FA400        0        0        0 3C3=
80000 count 99993097
> values        0       20 3C300000   1FA400        0        0        0 3C3=
80000 count 5930
> values    7E900       20 3C300000   1FA400        0        0        0 3C3=
80000 count 338
> values    FD200       20 3C300000   1FA400        0        0        0 3C3=
80000 count 223
> values 3C380000       20 3C300000   1FA400        0        0        0 3C3=
80000 count 220
> values       40       20 3C300000   1FA400        0        0        0 3C3=
80000 count 192
>=20
> The valid value (in 0x32E21400 register) is 3D000007 only, the rest are
> corruptions: ca. 6 errors per 100k reads. With other registers, 15 errors
> per 100k reads etc.
>=20
> I also got this:
> addr:  32E213F0 32E213F4 32E213F8 32E213FC 32E21400 32E21404 32E21408 32E=
2140C
> -------------------------------------------------------------------------=
-------
> values        0        0        0        0 3D000007       20 3C300000   1=
FA400 count 98638773
> values        0        0        0        0        0       20 3C300000   1=
FA400 count 1330227
> values        0        0        0        0       40       20 3C300000   1=
FA400 count 3721
> values        0        0        0        0 3C380000       20 3C300000   1=
FA400 count 314
> values        0        0        0        0    7E900       20 3C300000   1=
FA400 count 572
> values        0        0        0        0    FD200       20 3C300000   1=
FA400 count 428
> values        0        0        0        0    4C010       20 3C300000   1=
FA400 count 25965
>=20
> which is ca. 14 errors per 1k reads, though maybe it's special -
> non-MI/MI boundary (at 0x32E21400), reserved addresses (0x32E213Fx) etc.
>=20
> > The problems show themselves maybe in 5% or 10% of boots.

How do you detect if the current boot was a "faulty" one?

>=20
> Well, now it appears more like 20%: e.g. in 41 system runs (soft reboots
> only, no power-downs), I got problems 8 times.
>=20
> Obviously I can post the tester source if anyone is interested.

I'd like to have a look there. I'm doing a lot of work on the imx8mp at
the moment. I didn't have too many issues other than the ones caused by
myself. There were however a few start/stop issues that are still on my
list for further investigations. But I didn't observe bigger memory
corruptions. So I think this ties into my earlier question of how you
observe that the device is in a bad state.

I'm mostly using the debix boards right now, so I could test if I can
replicate the behavior there.

Can you also share the kernel you are using?

Best regards,
Stefan

>=20
>=20
> Generally ISP MI register read accesses which can be corrupted are:
> - first 32 bits read in a given transfer, and additionally
> - every 32 bits on a 32-byte boundary (addresses 0x....00, ...20 etc.).
>=20
> This means, in practice, on i.MX8MP only, RKISP1_CIF_MI_CTRL and
> RKISP1_CIF_MI_MP_CB_SIZE_INIT (with the workaround).
>=20
> What is this 32-byte boundary?
>=20
> Writing is a bigger problem, though.
> --=20
> Krzysztof "Chris" Ha=C5=82asa
>=20
> Sie=C4=87 Badawcza =C5=81ukasiewicz
> Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa
>

