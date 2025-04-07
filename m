Return-Path: <linux-media+bounces-29559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2067A7ED91
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 21:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5186F421E25
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 19:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2AD221D90;
	Mon,  7 Apr 2025 19:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="LlKTXg+d"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334BD1FF5F7;
	Mon,  7 Apr 2025 19:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744054196; cv=none; b=njTLQEswtlFNCHe7A2xdEgI57YZoGgbnFVIAT87gmtqCI1JB6rtYyPh8b4dRuryHD4feL5fM7leWzpLeJp+XDV9GqJfxjIOCycPvcuygfdt+ofC599L+clWGg7KZI4IQU8odoS9OtysEsIcZzNSzXaqP5fOg+CtPm1hQB6lmS20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744054196; c=relaxed/simple;
	bh=QxbJUQj494NJu8ZjgJ05X2q3+gIgGLIBqzCnPxe0YBw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wo84BRp0LV/HOS6qVyIcLVXYQfloMAc/L/tQmgbwfOaVZ+7VYTHL54wEciZHPvMwzShfOReXYD5JAV5coy5j2z0Ur37AZiA1Rb7iW7HTJ48O12EC0xsSCIdslRSuOzxRoDKl5hXw7lQ4OE0xdKaAQ22HnMJj5A/GIsx6c9sBLR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=LlKTXg+d; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=O40M1F4FENumpeawEN/zW0HV0k/GzWMb+PW3MS2kdeI=; b=LlKTXg+dXXhUmVPx2ZyqdR1/3W
	dAq7E8QCV8RWayeTm/0ESqnhvcMKoys7h6YK0dWBvztEzbOpkwm3AM0qSCUES7j+vjOGhGL3CycUG
	j3vwSJC7liLPPL+PFrZE/QAIEuwd7MNC6nvJxxxKqb0G+Z/gVcmBXdF8K1Vy+BbZwNEfMP6zR92Q4
	h84rzZChgAWx8HoKjK5LeuEl3gUTypBP+CaQKau6Wp6yOxulbt/LaaWMGKwCcHqQrWVxQ5vkp2Nwv
	L9scyRvxvqXTkHYamJD+YYB4rRpS6nj6kgYapvIiUcueXenErGHJJjMOKD/Pko5aLZHxlvZBm6R/h
	24ZeZNzQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1u1rrg-000MKL-05;
	Mon, 07 Apr 2025 21:10:36 +0200
Received: from [92.206.190.59] (helo=framework.lan)
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1u1rrf-000OkW-1w;
	Mon, 07 Apr 2025 21:10:35 +0200
Message-ID: <29677b7d5ceb07693d0b530c88a5aa9bde6c04dd.camel@apitzsch.eu>
Subject: Re: [PATCH RESEND 0/4] media: i2c: imx214: Problem with CCS PLL
 calculator
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 07 Apr 2025 21:10:34 +0200
In-Reply-To: <4c62bb9d5575e9075b39500917e09687d37cf7ca.camel@apitzsch.eu>
References: <20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu>
		 <Z87I2xh0HY-YD_tZ@kekkonen.localdomain>
	 <4c62bb9d5575e9075b39500917e09687d37cf7ca.camel@apitzsch.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authenticated-Sender: andre@apitzsch.eu
X-Virus-Scanned: Clear (ClamAV 1.0.7/27601/Mon Apr  7 10:42:24 2025)

Am Montag, dem 10.03.2025 um 23:35 +0100 schrieb Andr=C3=A9 Apitzsch:
> Hi Sakari,
>=20
> Am Montag, dem 10.03.2025 um 11:11 +0000 schrieb Sakari Ailus:
> > Hi Andr=C3=A9,
> >=20
> > On Sat, Mar 08, 2025 at 10:47:54PM +0100, Andr=C3=A9 Apitzsch via B4
> > Relay
> > wrote:
> > > The imx214 driver currently supports only a 24MHz external clock.
> > > But
> > > there are devices, like Qualcomm-MSM8916-based phones, which
> > > cannot
> > > provide this frequency. To make the sensor usable by those
> > > devices,
> > > add
> > > support for 23.88MHz clock.
> > >=20
> > > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > > ---
> > > Andr=C3=A9 Apitzsch (4):
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Calculate link bit=
 rate from clock
> > > frequency
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Prepare for variab=
le clock frequency
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Read clock frequen=
cy from device tree
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Add support for 23=
.88MHz clock
> > >=20
> > > =C2=A0drivers/media/i2c/imx214.c | 188
> > > +++++++++++++++++++++++++++++++++++----------
> > > =C2=A01 file changed, 146 insertions(+), 42 deletions(-)
> >=20
> > Thanks for the patches.
> >=20
> > Do you think the driver could use the CCS PLL calculator? The PLL
> > appears to be compliant. The AR0234 driver will do the same. (The
> > sensor might just work with the CCS driver, too, but that's another
> > discussion.)
> >=20
> Using the CCS PLL calculator seems quite complicated compared to
> switching to the CCS driver. That's why I looked at the later first.
> But for it to work, quirks already need to be applied in
> ccs_power_on(), to disable writing to COMPRESSION_MODE, and in
> ccs_identify_module(), to change the MODULE_MANUFACTURER_ID register.
>=20
> I'll check if CCS PLL calculator could be used.
>=20
> Best regards,
> Andr=C3=A9

Hi Sakari,

the CCS PLL calculator seems to work (up to one problem) and to be a
more elegant way forward.
The problem is, that the pixel rate is too small by a factor of 10 and
I cannot figure out why. Any help would be appreciated.

My devices uses a clock-frequency of 24000000 and a link-frequency of
600000000. There are four data lanes.
The calculator returns a pixel rate of 480.000.000. The expected value
is 4800.000.000.

You can find the PLL input parameters in [1] and the generated debug
output below.

Best regards,
Andr=C3=A9

[1] https://github.com/a-andre/linux/blob/58e10a814985f700579847ac7c99468a6=
5cb55bb/drivers/media/i2c/imx214.c#L1116-L1196

$ dmesg | grep imx
[   17.851215] imx214 4-0010: vt_lanes: 4
[   17.851245] imx214 4-0010: op_lanes: 4
[   17.851254] imx214 4-0010: binning: 1x1
[   17.851262] imx214 4-0010: min / max op_pre_pll_clk_div: 1 / 15
[   17.851272] imx214 4-0010: pre-pll check: min / max op_pre_pll_clk_div: =
1 / 15
[   17.851281] imx214 4-0010: mul 50 / div 1
[   17.851290] imx214 4-0010: pll_op check: min / max op_pre_pll_clk_div: 1=
 / 15
[   17.851300] imx214 4-0010: op_pre_pll_clk_div 1
[   17.851308] imx214 4-0010: more_mul_max: max_op_pll_multiplier check: 24
[   17.851317] imx214 4-0010: more_mul_max: max_pll_op_clk_freq_hz check: 1
[   17.851325] imx214 4-0010: more_mul_max: max_op_sys_clk_div check: 1
[   17.851333] imx214 4-0010: more_mul_max: min_pll_multiplier check: 1
[   17.851341] imx214 4-0010: more_mul_min: min_op_pll_op_clk_freq_hz check=
: 1
[   17.851349] imx214 4-0010: more_mul_min: min_op_pll_multiplier check: 1
[   17.851357] imx214 4-0010: more_mul_factor: 1
[   17.851365] imx214 4-0010: more_mul_factor: min_op_sys_clk_div: 1
[   17.851373] imx214 4-0010: final more_mul: 1
[   17.851381] imx214 4-0010: op_sys_clk_div: 1
[   17.851389] imx214 4-0010: op_pix_clk_div: 10
[   17.851398] imx214 4-0010: min_vt_div: 10
[   17.851406] imx214 4-0010: min_vt_div: max_vt_pix_clk_freq_hz: 10
[   17.851414] imx214 4-0010: min_vt_div: min_vt_clk_div: 10
[   17.851422] imx214 4-0010: max_vt_div: 40
[   17.851486] imx214 4-0010: max_vt_div: min_vt_pix_clk_freq_hz: 40
[   17.851502] imx214 4-0010: min_sys_div: 2
[   17.851510] imx214 4-0010: min_sys_div: max_vt_pix_clk_div: 2
[   17.851518] imx214 4-0010: min_sys_div: max_pll_op_clk_freq_hz: 2
[   17.851526] imx214 4-0010: min_sys_div: one or even: 2
[   17.851534] imx214 4-0010: max_sys_div: 4
[   17.851541] imx214 4-0010: max_sys_div: min_vt_pix_clk_div: 4
[   17.851549] imx214 4-0010: max_sys_div: min_vt_pix_clk_freq_hz: 4
[   17.851557] imx214 4-0010: pix_div 3 too small or too big (5--10)
[   17.851568] imx214 4-0010: ext_clk_freq_hz		24000000
[   17.851578] imx214 4-0010: vt_pre_pll_clk_div		1
[   17.851587] imx214 4-0010: vt_pll_multiplier		50
[   17.851595] imx214 4-0010: vt_pll_ip_clk_freq_hz	24000000
[   17.851603] imx214 4-0010: vt_pll_op_clk_freq_hz	1200000000
[   17.851612] imx214 4-0010: vt_sys_clk_div		2
[   17.851620] imx214 4-0010: vt_pix_clk_div		5
[   17.851629] imx214 4-0010: vt_sys_clk_freq_hz	600000000
[   17.851637] imx214 4-0010: vt_pix_clk_freq_hz	120000000
[   17.851645] imx214 4-0010: op_sys_clk_div		1
[   17.851653] imx214 4-0010: op_pix_clk_div		10
[   17.851661] imx214 4-0010: op_sys_clk_freq_hz	1200000000
[   17.851669] imx214 4-0010: op_pix_clk_freq_hz	120000000
[   17.851677] imx214 4-0010: pixel rate in pixel array:	480000000
[   17.851685] imx214 4-0010: pixel rate on CSI-2 bus:	480000000
[   17.851694] imx214 4-0010: flags lane-speed
[   17.869313] imx214 4-0010: vt_lanes: 4
[   17.869342] imx214 4-0010: op_lanes: 4
[   17.869352] imx214 4-0010: binning: 1x1
[   17.869361] imx214 4-0010: min / max op_pre_pll_clk_div: 1 / 15
[   17.869372] imx214 4-0010: pre-pll check: min / max op_pre_pll_clk_div: =
1 / 15
[   17.869382] imx214 4-0010: mul 50 / div 1
[   17.869391] imx214 4-0010: pll_op check: min / max op_pre_pll_clk_div: 1=
 / 15
[   17.869400] imx214 4-0010: op_pre_pll_clk_div 1
[   17.869409] imx214 4-0010: more_mul_max: max_op_pll_multiplier check: 24
[   17.869417] imx214 4-0010: more_mul_max: max_pll_op_clk_freq_hz check: 1
[   17.869426] imx214 4-0010: more_mul_max: max_op_sys_clk_div check: 1
[   17.869435] imx214 4-0010: more_mul_max: min_pll_multiplier check: 1
[   17.869443] imx214 4-0010: more_mul_min: min_op_pll_op_clk_freq_hz check=
: 1
[   17.869451] imx214 4-0010: more_mul_min: min_op_pll_multiplier check: 1
[   17.869460] imx214 4-0010: more_mul_factor: 1
[   17.869468] imx214 4-0010: more_mul_factor: min_op_sys_clk_div: 1
[   17.869476] imx214 4-0010: final more_mul: 1
[   17.869483] imx214 4-0010: op_sys_clk_div: 1
[   17.869491] imx214 4-0010: op_pix_clk_div: 10
[   17.869501] imx214 4-0010: min_vt_div: 10
[   17.869509] imx214 4-0010: min_vt_div: max_vt_pix_clk_freq_hz: 10
[   17.869517] imx214 4-0010: min_vt_div: min_vt_clk_div: 10
[   17.869525] imx214 4-0010: max_vt_div: 40
[   17.869533] imx214 4-0010: max_vt_div: min_vt_pix_clk_freq_hz: 40
[   17.869541] imx214 4-0010: min_sys_div: 2
[   17.869549] imx214 4-0010: min_sys_div: max_vt_pix_clk_div: 2
[   17.869557] imx214 4-0010: min_sys_div: max_pll_op_clk_freq_hz: 2
[   17.869565] imx214 4-0010: min_sys_div: one or even: 2
[   17.869572] imx214 4-0010: max_sys_div: 4
[   17.869580] imx214 4-0010: max_sys_div: min_vt_pix_clk_div: 4
[   17.869588] imx214 4-0010: max_sys_div: min_vt_pix_clk_freq_hz: 4
[   17.869596] imx214 4-0010: pix_div 3 too small or too big (5--10)
[   17.869607] imx214 4-0010: ext_clk_freq_hz		24000000
[   17.869616] imx214 4-0010: vt_pre_pll_clk_div		1
[   17.869624] imx214 4-0010: vt_pll_multiplier		50
[   17.869633] imx214 4-0010: vt_pll_ip_clk_freq_hz	24000000
[   17.869642] imx214 4-0010: vt_pll_op_clk_freq_hz	1200000000
[   17.869651] imx214 4-0010: vt_sys_clk_div		2
[   17.869659] imx214 4-0010: vt_pix_clk_div		5
[   17.869667] imx214 4-0010: vt_sys_clk_freq_hz	600000000
[   17.869675] imx214 4-0010: vt_pix_clk_freq_hz	120000000
[   17.869684] imx214 4-0010: op_sys_clk_div		1
[   17.869692] imx214 4-0010: op_pix_clk_div		10
[   17.869699] imx214 4-0010: op_sys_clk_freq_hz	1200000000
[   17.869707] imx214 4-0010: op_pix_clk_freq_hz	120000000
[   17.869716] imx214 4-0010: pixel rate in pixel array:	480000000
[   17.869724] imx214 4-0010: pixel rate on CSI-2 bus:	480000000
[   17.869732] imx214 4-0010: flags lane-speed

