Return-Path: <linux-media+bounces-38020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 847B5B08DD4
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 15:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ABC91881F73
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 13:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366192D4B47;
	Thu, 17 Jul 2025 13:04:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2281E98E3;
	Thu, 17 Jul 2025 13:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752757440; cv=none; b=tv03HGMyUu9OLfhN4UkCELcsBeGDwNS23AUipQWsac+VHKjxrFXKbD1jvPuwetaFxWVpv6TH4r/QOOQK7vNv32kd/Ks5Iw8rdFqo6s4DObwpKGZPgABpx5a4ueC5k4W2EfWdo2rHij0WG5BftPUgo5w0rCWSySmnRdIh0+1ZyTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752757440; c=relaxed/simple;
	bh=69+jr+td0r9nPobh9wlhyGLwT8vVC8h4h5QfHXkRgcg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lS8oVyFI8gUUMYDj4cAT1+5cBr99AqvR5R7s+7xjafDW6Vlt/CTsvqSIaBAx8cVU5U1w5jesis44tFLBBABFkoa0uPknfjpaO3Rq6HGkz7QnqBDeqnaxPFMtCdHeivOAHeu5h0A1Gpqi47PUh5wneBFgviErnpE+BqfngrOcuh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id B1AF0C3E4DEE;
	Thu, 17 Jul 2025 15:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl B1AF0C3E4DEE
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Dafna Hirschfeld <dafna@fastmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,  Heiko Stuebner
 <heiko@sntech.de>,  Paul Elder <paul.elder@ideasonboard.com>,  Jacopo
 Mondi <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman <megi@xff.cz>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
In-Reply-To: <m3h5zbxkc6.fsf@t19.piap.pl> ("Krzysztof =?utf-8?Q?Ha=C5=82as?=
 =?utf-8?Q?a=22's?= message of
	"Thu, 17 Jul 2025 11:00:57 +0200")
References: <m3h5zbxkc6.fsf@t19.piap.pl>
Sender: khalasa@piap.pl
Date: Thu, 17 Jul 2025 15:03:54 +0200
Message-ID: <m38qknx939.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> The "reference" (NXP) VVCam driver simply does the operations twice
> (i.e., reads twice with the first result discarded, and writes twice).
> This fixes the problem on most accesses, but the problems still persist.

It appears the corruptions are quite frequent, though.
Using "ldp qXX, qYY, [x0]" (2 * 128-bit load pair) I get results like
this (each data row is a result of a single ldp):

addr:  32E21400 32E21404 32E21408 32E2140C 32E21410 32E21414 32E21418 32E21=
41C
---------------------------------------------------------------------------=
-----
values 3D000007       20 3C300000   1FA400        0        0        0 3C380=
000 count 99993097
values        0       20 3C300000   1FA400        0        0        0 3C380=
000 count 5930
values    7E900       20 3C300000   1FA400        0        0        0 3C380=
000 count 338
values    FD200       20 3C300000   1FA400        0        0        0 3C380=
000 count 223
values 3C380000       20 3C300000   1FA400        0        0        0 3C380=
000 count 220
values       40       20 3C300000   1FA400        0        0        0 3C380=
000 count 192

The valid value (in 0x32E21400 register) is 3D000007 only, the rest are
corruptions: ca. 6 errors per 100k reads. With other registers, 15 errors
per 100k reads etc.

I also got this:
addr:  32E213F0 32E213F4 32E213F8 32E213FC 32E21400 32E21404 32E21408 32E21=
40C
---------------------------------------------------------------------------=
-----
values        0        0        0        0 3D000007       20 3C300000   1FA=
400 count 98638773
values        0        0        0        0        0       20 3C300000   1FA=
400 count 1330227
values        0        0        0        0       40       20 3C300000   1FA=
400 count 3721
values        0        0        0        0 3C380000       20 3C300000   1FA=
400 count 314
values        0        0        0        0    7E900       20 3C300000   1FA=
400 count 572
values        0        0        0        0    FD200       20 3C300000   1FA=
400 count 428
values        0        0        0        0    4C010       20 3C300000   1FA=
400 count 25965

which is ca. 14 errors per 1k reads, though maybe it's special -
non-MI/MI boundary (at 0x32E21400), reserved addresses (0x32E213Fx) etc.

> The problems show themselves maybe in 5% or 10% of boots.

Well, now it appears more like 20%: e.g. in 41 system runs (soft reboots
only, no power-downs), I got problems 8 times.

Obviously I can post the tester source if anyone is interested.


Generally ISP MI register read accesses which can be corrupted are:
- first 32 bits read in a given transfer, and additionally
- every 32 bits on a 32-byte boundary (addresses 0x....00, ...20 etc.).

This means, in practice, on i.MX8MP only, RKISP1_CIF_MI_CTRL and
RKISP1_CIF_MI_MP_CB_SIZE_INIT (with the workaround).

What is this 32-byte boundary?

Writing is a bigger problem, though.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

