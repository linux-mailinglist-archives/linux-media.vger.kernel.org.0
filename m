Return-Path: <linux-media+bounces-38715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C6BB18199
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 14:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADDA44E652D
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 12:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B819B248191;
	Fri,  1 Aug 2025 12:20:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC1B1C7013;
	Fri,  1 Aug 2025 12:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754050810; cv=none; b=kZrzguRYq/pjFlhR2OEVnmMpV7Zdod+W7JZySN9k8mvpv+47a7NG2pKa5Na3KtikVPQRBwyhabzZLtSqi2eYEiXT7sRSDwsXVNiN3lvfzy+LUWPAs8swj4SnWNkueUSwX1uf4QAvWyHky4R9OqiM8Fo4TCv48Sh4lA1gsAkx4lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754050810; c=relaxed/simple;
	bh=2T5cFFYUwRk8ogWcHxlsJy/whKUCS6eAH0G0oVEzW1U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bdYx8kxdgLmHEggqyPerygkUFd1dZlVXA7Zx15iFa7sEo4C44iAQJWcD+PnO2Qho/0E+jBvc7X2Fk72kUqzpStYLnAz1Be4QEJ5nbKgnVOoMsPX6If/J3v9wrXWsibG6nOV/3eLH0dSG1R9DKZuCZSI4f3vaFZ90tO7WtwuF/g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 8E5C3C3EEAC9;
	Fri,  1 Aug 2025 14:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 8E5C3C3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Heiko Stuebner <heiko@sntech.de>,
  Paul Elder <paul.elder@ideasonboard.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman <megi@xff.cz>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
In-Reply-To: <m3qzxyug1s.fsf@t19.piap.pl> ("Krzysztof =?utf-8?Q?Ha=C5=82as?=
 =?utf-8?Q?a=22's?= message of
	"Wed, 30 Jul 2025 12:30:23 +0200")
References: <m3h5zbxkc6.fsf@t19.piap.pl> <m38qknx939.fsf@t19.piap.pl>
	<175308758352.3134829.9472501038683860006@localhost>
	<m31pq9y98z.fsf@t19.piap.pl>
	<175326599663.2811177.16620980968274114885@localhost>
	<m3h5z2vw12.fsf@t19.piap.pl>
	<175344176070.2811177.10693943493658922992@localhost>
	<m3qzxyug1s.fsf@t19.piap.pl>
Sender: khalasa@piap.pl
Date: Fri, 01 Aug 2025 14:19:56 +0200
Message-ID: <m3cy9futcj.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

reporting from the field :-)

At this point I've something like the following:
- run camera apps in background (so the clocks etc. are up)
- while (analyze_mi -m1 -s10000000 -r -a 0x32E21400 shows errors) {
	change_clock 0x30388A80 3 3 # 50 MHz
        change_clock 0x30388A80 0 3 # 200 MHz - the original settings
}

It all takes a couple of seconds.
I guess I made some minor changes to analyze_mi.c, can post it
if needed.

where change_clock writes directly do the CCM registers
(MEDIA_APB_ROOT_CLK) and sets "PRE" and "POST" dividers (3 and 3 =3D
800 MHz / (3 + 1) / (3 + 1) =3D 50 Mhz and the same for 200 Mhz.

It appears to work. I'm getting (Connection closed =3D reboot):

MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 9,999,999
Register 0x32E21400 mi_ctrl value          0 count 1

MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 16 =3D 50 MHz
MEDIA_APB EN mux 2 pre 0 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 9,999,998
Register 0x32E21400 mi_ctrl value          0 count 1
Register 0x32E21400 mi_ctrl value 0x00010001 count 1

MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 16 =3D 50 MHz
MEDIA_APB EN mux 2 pre 0 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 9,999,988
Register 0x32E21400 mi_ctrl value          0 count 12

MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 16 =3D 50 MHz
MEDIA_APB EN mux 2 pre 0 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 9,999,781
Register 0x32E21400 mi_ctrl value          0 count 206
Register 0x32E21400 mi_ctrl value 0x3C380000 count 3
Register 0x32E21400 mi_ctrl value 0x000FD200 count 5
Register 0x32E21400 mi_ctrl value 0x3C440000 count 3
Register 0x32E21400 mi_ctrl value 0x3C140000 count 2

MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 16 =3D 50 MHz
MEDIA_APB EN mux 2 pre 0 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 9,999,999
Register 0x32E21400 mi_ctrl value          0 count 1

MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 16 =3D 50 MHz
MEDIA_APB EN mux 2 pre 0 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 9,999,752
Register 0x32E21400 mi_ctrl value          0 count 237
Register 0x32E21400 mi_ctrl value 0x3C140000 count 2
Register 0x32E21400 mi_ctrl value 0x000FD200 count 4
Register 0x32E21400 mi_ctrl value 0x3C380000 count 1
Register 0x32E21400 mi_ctrl value 0x3C440000 count 2
Register 0x32E21400 mi_ctrl value 0x3C2C0000 count 2

MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 16 =3D 50 MHz
MEDIA_APB EN mux 2 pre 0 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

