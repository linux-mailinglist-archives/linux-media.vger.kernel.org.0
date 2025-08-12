Return-Path: <linux-media+bounces-39493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F55B21DA7
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 07:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE0C018888E1
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 05:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD3429BDBC;
	Tue, 12 Aug 2025 05:55:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB20226888;
	Tue, 12 Aug 2025 05:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978099; cv=none; b=fD01+Gqxe+FUvFT9mbD5YiznSUq85fStsuK2dk0Cquj1R4Pu8PHrFzbuSNnOw7ymFRdJFznTL3OAUjdH3Z8YFS+mGICqrjs5VrBE/GDxoFUZaDyIp9zFLDrI8jtRWiK/DDmpNdR2VRX/x694MojQSr2NvjDixkUH1PtyKHDm5Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978099; c=relaxed/simple;
	bh=j3idest7CRZuEjkwsZk8w/55txGeprAL2y9e8xHFrRM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bJyTsIqyQJ9o0pGK4ZeSaS6Lg/mymkQi4V/O2Cpjk8PhRbzsgdayZ+ZnGD2JpIWwKWcDN1CyUGc0LXD1Sazl8b7Obb1lt2Q87hjjYx79/b8Iv08g3z+aWO7UUfO6erOoq7iOMjhiME8n/XS7dkFYsvrWOAK0zbVOScNmsuDOWkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 8C855C3E4DEA;
	Tue, 12 Aug 2025 07:54:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 8C855C3E4DEA
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Heiko Stuebner <heiko@sntech.de>,
  Paul Elder <paul.elder@ideasonboard.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman <megi@xff.cz>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption: resolved
In-Reply-To: <m3zfcet41n.fsf@t19.piap.pl> ("Krzysztof =?utf-8?Q?Ha=C5=82as?=
 =?utf-8?Q?a=22's?= message of
	"Tue, 05 Aug 2025 13:13:08 +0200")
References: <m3h5zbxkc6.fsf@t19.piap.pl> <m38qknx939.fsf@t19.piap.pl>
	<175308758352.3134829.9472501038683860006@localhost>
	<m31pq9y98z.fsf@t19.piap.pl>
	<175326599663.2811177.16620980968274114885@localhost>
	<m3h5z2vw12.fsf@t19.piap.pl>
	<175344176070.2811177.10693943493658922992@localhost>
	<m3qzxyug1s.fsf@t19.piap.pl> <m3cy9futcj.fsf@t19.piap.pl>
	<m34iumujcs.fsf@t19.piap.pl> <m3zfcet41n.fsf@t19.piap.pl>
Sender: khalasa@piap.pl
Date: Tue, 12 Aug 2025 07:54:46 +0200
Message-ID: <m3a545t789.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Stefan et al,

BTW I've added Lucas Stach and Shawn Guo to "Cc" list.

The problem is the CPU core power supply voltage :-)

- while the reference manual specifies the max ISP and MEDIA clocks at
  500 MHz, the datasheets show this requires the "overdrive" mode =3D
  increased CPU power supply voltage. In "normal" mode the ISPs are
  limited to 400 MHz (there are other limits, too).

- I've tried lowering the clock rate after booting the systems (with
  a CCM register write), but it didn't fix the problem. I guess some
  reset logic is affected here, and the (lower) clock rate must be set
  right from the start, in the DT.

- anyway, lowering the frequencies of ISP and MEDIA root clocks fixes
  the ISP2 MI corruption. I'm currently investigating PMIC settings
  (both my Compulab and SolidRun modules use PCA9450C PMICs), so perhaps
  I'll be able to use the higher 500 MHz clocks. It doesn't matter much,
  though.

- the question is if we should lower the clocks in the main imx8mp.dtsi
  DT file, or the overdrive mode should stay there, and the changes
  should be made to the individual board files, or maybe the U-Boot
  configs (PMIC output voltages) should be changed etc.
--=20
Krzysztof "Chris" HaBasa

Sie=C4=87 Badawcza Aukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

