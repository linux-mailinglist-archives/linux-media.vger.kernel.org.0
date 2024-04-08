Return-Path: <linux-media+bounces-8811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3248B89B87A
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 09:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 907E7B212BD
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 07:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEF025619;
	Mon,  8 Apr 2024 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="uC4laala"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic303-20.consmr.mail.sg3.yahoo.com (sonic303-20.consmr.mail.sg3.yahoo.com [106.10.242.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738E8219F0
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 07:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.242.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712561605; cv=none; b=iup5morcHpZDKIs3JVeNkwIMVF/lu6o3yYuS4erec+4dmvY0Bv5ViJGGnDkx5hY+JNRwdkc8nII/wmR9QwXVJIQTp4YYHlYjpyT9RXvvJYQtu1w3ZQoRvbqWN+HAdN2Y/PXcFiC3Ed6vBrK4MUm+/wo5/Fl1W0RliiJdrjEl2rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712561605; c=relaxed/simple;
	bh=MJF0R5Ssa0aYmwmc8mzuzJg7YFsweg8wohIO9rXc4GI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Vo4ORfwyt4a5DxuZRYvV9UJ1D0fYI3SpsToczZyRGLBCVuC7ENVEUmcjSaw7ykSpIh+T0/hSdyA84PYpZJPZUchDRMMIMSNkucgtjWZMTelTKb2RtcXZipZrwZ9vIQQz508s2FONPRE8jWebDnXG5MX8HRjemgYpdgD4bcPX/yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=fail smtp.mailfrom=fedoraproject.org; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=uC4laala; arc=none smtp.client-ip=106.10.242.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fedoraproject.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1712561600; bh=MJF0R5Ssa0aYmwmc8mzuzJg7YFsweg8wohIO9rXc4GI=; h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=uC4laalaOYUKSx9SnxilvlTjKUxSXfNQu1DZqCtA5R2cIigOnEfqaMpZfxmtSGHvLamFFieQYlgwSjftSMzaMMzSGArsAAN66cPF2h6oZOwM3x/kSJ/Y/VOvYq1r5SAgakH0zhmkizD/H+KM48z0nJTCpV76Oqc2xNq+vEEcVHiK3I/KQBp+OR3kdd7g90TYyCWJ3mDkrFz2bVARILf81Oj5nsjzcCTOyy5xr7O2i5toJcuscafQ3HB3g/1mLyTfCdsqNZY29rxka+/fLLEcp/XZNVUn6IVySprXAi4lLCg+Y9kuAmsZ3iF2fhnw1TN77F9xBNJqZpcqNVeZWsmxwQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1712561600; bh=zU2AyFtw+TgA+Hi6KXlzmWjr8cPWqSIuhuKI3TWVZly=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=opRhMAlL2+KslklZbY/S57azK/QMlQKbf1Onp8Uwy98m5GD9/32YB7WI/M/krFU9VrP8NUM/NqzDUfTvIGayfJ4xJ2TqsDx2hFDjdIZmn6bQEZ1zYVBbp7BTaiuILvWS4tONxo+pBdenayfYvjFRqMVjSDR+m3+L9PtozUlhwm5kGeJ3I0po8xw4w9BveWXwHZXtodMFJATUP3gQjmfcNGvq8ppIY5YINE/34cauI8ip07zYjjxkwmIcro+x8wq3a/CK4EPTTnVv+6pbENtsZ9jrjAH54FKyocKQ5GHo9dzy2A1eoHLrjo9iNcnFT0w8Ubg7RREV5aR1jdZnuaUHdA==
X-YMail-OSG: BZAMoloVM1l9B2NtPUyVR_HkZFUCJp3OB6YUnoF6DYv53sB25ITyNo3uXBiO3Ch
 H0TLjrbK0bIlrdVm1jvxRcrPZjKozYl.xSzLLPzdZ_XAOMMSVcsFbzm557du0vb0ZQGweSZs7cCC
 Bbgv7omDrcgQJe6DW2Go6jwHqDxXSQk966qYGyWw6FMA9TAzK6_TUvRt1K8ZGzPTmC.3Fl_gyUWa
 x65usPYEWdm6..8Rd5aISZxL7C3PDTUInEuQTaJXilh3p7d4U0FgFSWMVq2a7I4Af94Eaao7MZ1E
 JnIGUjBYBfSATvBL5pRFPZAFB5tmPE._DyJpKBBHrlt4cbWdc_2_yjTZfH_VxSJBKnlHf256k2ex
 Cea0shWxAidzbwNkyQtxA.82YuLn6euwPvGViJ1csH3P7Zd5_tC2HBd_YPkRew9Sg4WGL8RG8XWq
 cI9TGG.K4VsuUFyubdDLpe4AWdOZHdOd3VhlTWANLBPQL3CsVkXyQ845eYSf2euo6fKOJE2UiUES
 .YaOjVzC1Ez0kJN.ozWISJcB3oTsBaJn6hlffTnVauv6qkfCa7bnfT7tPnX18R1HGq2vlMbcnqCu
 do68aydfjfFfrS65YNhA7KqOrOGhLFOdXv5f_hjzRQ2CoWQEqmZzfaiAoaqBhU8K.xu1gEbPVV5o
 yhFzgE2upwkOAqJX6fnHodMxhPtJBJlXnIeprUmduLrE8mKggzvtyzb736Thx0Eg1PNoPEwNpaMf
 aHaFHvuGt27YXU9OXDUA8O1F5CHA2xEZCXEctXgnwbXzEgaoqF8EOIble8WwBYScBJAR1NsKFEZc
 s4aUeQsDMNLZJpY47aRSZ.wJFdVsbPABRIh0FnSxhjA3d1GnITSLj2acnF3DlVJBsph7jTfJlNH1
 oWQolgqrLoa1CPfkFm9yAvOQoopT6tualsU4XKBB2hI0rTVNYaiIdfN73CGxfTSFWO52JKGVT7d7
 jU_33u3K6vNTGr3ArxMD4707zXLlHrV7ccIYzNvwqrvbkRqWhDHGLSGq8Dl6Ctbuw6RtqpOn6URM
 pvPrS2cv13wAYmTT8znZDsoCUwI9ZzIF6bYltLKhyTeQ3wN8YgJtVsLxSf8MGTX7tii1limLi0uV
 r74c4CMoVugYUAkHgT2ONeTBPeq3uesIbZeeiTH3kH5RLZ5y3ImT172gwlogpJ_hJSwBe1k9qUY3
 MNqNOM6lpnFNmAH15GovRBRKoE831JU.jfrc3XzALafLYNlMaGAnXyrD4Ae1hRSQz0eAcl2ReD5V
 aLXU2kEioqllEPgUiyyKV59zvVHqNB68TgwzF8DQAOixBnPlmCjJ5guSdJRMU.kOWMgZf3ki.JLF
 45b2UMpjQVZTfYZqlBdy.xNfbO5q8FYfqrpDXzk9RAp5ikM5muJrqUDd1gxMoJY.wCcXYiw2tBL.
 mJ358N6lsusLX_1X2INd0.h5D09rydlS.FJHX6eUb3QJ1q3D3RRgksgwmz4wJj_BQZSM_4f.9oRU
 V50DVTaeVmLsqMwcXc9FGGUiWRsZFHGKepiAZPs0h.TBrDojImCapivLszTQtOFiQjQfU7F4m2BR
 TbMbYvxhI1DJekQkn0ve7_MuDK2SqnrqfEYyoy12GpPf3Gw8m.vFhmY9RfEYeec60aCsPD4tjljr
 1_1S78EHAoDF18BEEfnmqcPhLEugYlzijvLxGDP_LhQepU35ecc8uwFhf96mkdMmbIPkhY_puXGv
 VCwDWA5CxbQt6F4i84reNTelRqGGBaKODDcGZmdW0OuM0nT.9FiL0b.xlsfELHclKCVtP4FYlHcS
 EiipWsH9rsJ.6p0F62mifaiOR3IsJ6fpB0j5aZ54A2Z0x99TW4DwUCLji.Ho0IC0gi0FSzpQcFtv
 tDRni7S8KY6syJ9JxFCvrBMd6.TDX2MHIAT_UvGDAfvESSkF2E5wbHRpZtxHlUndemWL9Teo0FqA
 WOhkTyrOYAdz34Ab0DNusZVgBlTYhsP5Eo3AtxfyvA6wgJkA.Hl.8w6bIMz0hOguLP93qFXRKrw6
 tqdk7yJi4Axq_BD1JoWMW1RRspYuznu6Pvrp1avnGdBLsRx9J8gWirV7PzJu.OMSl753_1fTChQT
 yt03YDeW0X_TfmG53joT7SPrkXKc4C6yly4M9yTiu.80DK5fPxls_iYv37EBIcxWqHOmejUlm7g.
 DNq2xqOUpFh7yksTLS4O8Xf5nQwoPzMa5MhljTTeDGHhy.h0_5DHERApvNTRMMO2_exdsWAj09q3
 PW9YHxu_vWmFw5q70Ghy6Fm_XXI43yZW1tdTdX__3D6tONSWqhL5QdkRxAZSFws2RETPQfaSECuZ
 wKS8.
X-Sonic-MF: <pjp@fedoraproject.org>
X-Sonic-ID: b40cdae3-0d2c-4da0-893b-a34515a391ca
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.sg3.yahoo.com with HTTP; Mon, 8 Apr 2024 07:33:20 +0000
Date: Mon, 8 Apr 2024 06:42:35 +0000 (UTC)
From: Prasad Pandit <pjp@fedoraproject.org>
Reply-To: Prasad Pandit <pj.pandit@yahoo.in>
To: "yasunari.takiguchi@sony.com" <yasunari.takiguchi@sony.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Message-ID: <61579771.417546.1712558555048@mail.yahoo.com>
In-Reply-To: <1053736519.1517239.1711608272532@mail.yahoo.com>
References: <20240311100407.1271331-1-ppandit@redhat.com> <1813944346.4222082.1710920372587@mail.yahoo.com> <1053736519.1517239.1711608272532@mail.yahoo.com>
Subject: Re: [PATCH] media: cxd2880: Add terminating new line to Kconfig
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.22205 YMailNorrin

>On Thursday, 28 March, 2024 at 12:14:32 pm IST, Prasad Pandit wrote:
>>On Wednesday, 20 March, 2024 at 01:09:32 pm IST, Prasad Pandit wrote:=C2=
=A0
>>>From: Prasad Pandit <pjp@fedoraproject.org>
>>>diff --git a/drivers/media/dvb-frontends/cxd2880/Kconfig b/drivers/media=
/dvb-frontends/cxd2880/Kconfig
>>>index 9d989676e800..94a8e0b936b9 100644
>>>--- a/drivers/media/dvb-frontends/cxd2880/Kconfig
>>>+++ b/drivers/media/dvb-frontends/cxd2880/Kconfig
>>>@@ -5,4 +5,4 @@ config DVB_CXD2880
>>> =C2=A0 =C2=A0depends on DVB_CORE && SPI
>>> =C2=A0 =C2=A0default m if !MEDIA_SUBDRV_AUTOSELECT
>>> =C2=A0 =C2=A0help
>>>-=C2=A0=C2=A0=C2=A0 =C2=A0 Say Y when you want to support this frontend.
>>>\ No newline at end of file
>>>+=C2=A0=C2=A0=C2=A0 =C2=A0 Say Y when you want to support this frontend.
>>>--=20
>>
>>Ping...!
>
>Ping...!

->=C2=A0https://lore.kernel.org/linux-media/20240311100407.1271331-1-ppandi=
t@redhat.com/

Ping...! (just checking)
---
=C2=A0 -Prasad

