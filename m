Return-Path: <linux-media+bounces-39582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F67B226BB
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 14:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F86A507B1C
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 12:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10B01E3DDE;
	Tue, 12 Aug 2025 12:28:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D631C4A10;
	Tue, 12 Aug 2025 12:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755001696; cv=none; b=ayNy+yb0eLJCgXOvj0LHdwmbkzn/43+mT2D1xklY9XyZID29g0HdxJ4BVkt9gNBSAKm3iFa2hcX4u8JsHGRY2296xuht1A5TGBNNJfmqfRT3f9sBnrryRbjWcV13kshjpkoOZgf0kbz+nh2WXT7Y+tA9uqbwHZR/mZMB2t/6Rv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755001696; c=relaxed/simple;
	bh=aCapHEFzP/x+8RzVAPXuctN9CS/vBYFU8mNYPoidw4M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DJFTw1iT4doAmv7GE7wxpq9//xPHlFZMgoC8P5TYH8DWP0PrbbnhE0B13M9C4JmDrl6X4KTBqJHfZwXG8eZOIt2TOQklY2kDzwS50onfxVLL8fJHRAZdLP5gTTw58eTnhPF4E+7PoXUAxIUeYUgcqt3UZHpdcTHHxMK07ASRSiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 2EB4CC3E4DE9;
	Tue, 12 Aug 2025 14:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 2EB4CC3E4DE9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,  Dafna Hirschfeld
 <dafna@fastmail.com>,  Heiko Stuebner <heiko@sntech.de>,  Paul Elder
 <paul.elder@ideasonboard.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman <megi@xff.cz>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption: resolved
In-Reply-To: <20250812103243.GK30054@pendragon.ideasonboard.com> (Laurent
	Pinchart's message of "Tue, 12 Aug 2025 13:32:43 +0300")
References: <175308758352.3134829.9472501038683860006@localhost>
	<m31pq9y98z.fsf@t19.piap.pl>
	<175326599663.2811177.16620980968274114885@localhost>
	<m3h5z2vw12.fsf@t19.piap.pl>
	<175344176070.2811177.10693943493658922992@localhost>
	<m3qzxyug1s.fsf@t19.piap.pl> <m3cy9futcj.fsf@t19.piap.pl>
	<m34iumujcs.fsf@t19.piap.pl> <m3zfcet41n.fsf@t19.piap.pl>
	<m3a545t789.fsf@t19.piap.pl>
	<20250812103243.GK30054@pendragon.ideasonboard.com>
Sender: khalasa@piap.pl
Date: Tue, 12 Aug 2025 14:28:07 +0200
Message-ID: <m3zfc4sp0o.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

>> - anyway, lowering the frequencies of ISP and MEDIA root clocks fixes
>>   the ISP2 MI corruption. I'm currently investigating PMIC settings
>>   (both my Compulab and SolidRun modules use PCA9450C PMICs), so perhaps
>>   I'll be able to use the higher 500 MHz clocks. It doesn't matter much,
>>   though.

Well, apparently my Compulab UCM module provides overdrive power. At
least the PMIC driver says so (in /sys pseudofiles). I guess SolidRun
won't be different.

1. At least two different designs are affected (Compulab and SolidRun),
2. the PCA9450C is THE i.MX8MP PMIC, most probably connected to the CPU
   exactly as in the datasheet (at least WRT VDD_SOC power lines),
3. NXP people experienced the problem on their (which ones?) boards, too

Well... They specify (IMX8MPIEC =3D the datasheet):

"Two instances of 4-lane MIPI CSI interface and HDR ISP
=E2=80=A2 For single Camera, MIPI CSI 1 can support up to 400/500 MHz pixel
  clock in the Nominal/Overdrive mode.
=E2=80=A2 For single Camera, MIPI CSI 2 can support up to 277 MHz pixel clo=
ck.
=E2=80=A2 For dual Camera, both MIPI CSI can support up to 266 MHz pixel cl=
ock.
=E2=80=A2 2x ISP supporting 375 Mpixel/s aggregate performance and up to
  3-exposure HDR processing.
    =E2=80=A2When one camera is used, support up to 12MP@30fps or 4kp45
    =E2=80=A2When two cameras are used, each supports up to 1080p80"

So, while ISP clock is not exactly pixel clock, perhaps they mean that
the ISP clock is to be limited as well.

ISP2 at 400 MHz (single camera) works for me (with a 1080p60 12-bit
IMX462 sensor), but I haven't tested in extreme conditions etc.

> I think it would make sense to lower the default clock frequencies, and
> provide an overlay to enable overdrive mode.
>
> It's also interesting that the issue only affected the second ISP, as
> the first one should also be limited to 400 MHz in normal mode.

Right. Maybe it's not the overdrive mode after all. I will do more tests
soon.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

