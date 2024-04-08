Return-Path: <linux-media+bounces-8817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE7989B9A4
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 10:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E06E1C220A7
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 08:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B78A2C197;
	Mon,  8 Apr 2024 08:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="fYbA+ccS"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic303-20.consmr.mail.sg3.yahoo.com (sonic303-20.consmr.mail.sg3.yahoo.com [106.10.242.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B443B29CE8
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.242.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712563379; cv=none; b=PVjHkXIMTNChWYwDxUNYsSPNIZGRpBVD2M4kY5qG43VNmPaKZbdfBaSC8YZ84+t0dnlykJLzTBoCUFjHG79UhJRuJKr0GKrlNpAfXnaMUp+yVObZmHnTz3dJ3+xU0lzZMiPqx7AAwLS5Wwdgn42m7ImMdHAt89HR5QSFz1efUiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712563379; c=relaxed/simple;
	bh=Q2Ra3WSAkikndbhlHZ4B0SPyvH7X8FKD/+csnWX4ZOU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=FrrxQubFljJfg2KfjKnVU4oie06jIXTe4uMtXSvZZV5DLK04h8HM6lUZinMBVbGsvoK7mYGaz3BQgK+ft0CoFNnHuKFqJdJLFsNcHdCSm6qddz1976s3862tRK02h/SwQORV+uYwER7KbDTCjIGebd2FVhqAaF+eMSbm7wqUy9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=fail smtp.mailfrom=fedoraproject.org; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=fYbA+ccS; arc=none smtp.client-ip=106.10.242.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fedoraproject.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1712563374; bh=Q2Ra3WSAkikndbhlHZ4B0SPyvH7X8FKD/+csnWX4ZOU=; h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=fYbA+ccSWwu9TtJsZ8pkiglL/qStscPNE61VEC4hUR7aHKjLbSv4FEyvqkt/3winQkk5VQ+uyo7srEtkAKeCAVa1VG7WSCKn6U9VDQRCcTQSJ3kxujmw/vYw8lhc5dZYe1NwhohkSfzsqk/LvZehaAvigHzgCuW7eMG+V/d9W4DNcBr8tZ0kVK2nJIkSHfA7yP2Wm8iLZ/NJadRieny16hQwheco3CC1BND6YTMYEuI/YEhNqlZq0SzGiJRaXMUAO34WW7KRTwTpVUKdbmiUSDK2L4sRuEoIzPht7pXcoh24uH9UlyZkLGWtDcBPgCyWqc1l1/v63aCSKFsoUpumdw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1712563374; bh=Ch7vwQ01k0GvG6ghN8cVLsEx/WlLGZpDvMhehgzvXUa=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=sEexAz1uhzefBX2xVBYVpHQiZzObM6f2CpvL0UHMAz0On1vQ02rDQrCQ7ueUnuuP34Z6LpBvpW1thpMdwlLs9aWnWPKbxMLNFLOGX+vp6aOWQ3ykX94/lsl5dhZoIKV/KTbrKjSBJ6cnYmxAdsfbudaWi+GnyDhN+oKmKPhNkEAezhoxJT2cmr1trINldr7YkxYKoOkINSEp1mK+hWF2vZWu8OQJjMGWK6UYgTRcgJ9DB5wiKoolYwRf72ebW0/1Kxs23tECPEOagYwSHHZIc7p3au+VFM1t+B527nVlzUis4RrzWdzVbOQ+U2tA7l3LVXkOTfC5r+JUP4r4fy52uw==
X-YMail-OSG: PlF3gosVM1kyf46ZnlI0y_lazX9wlFg07DJP8rzFcFHPymphQZf6Koidx.sSrqb
 ulGvlr3O5z7fO4IIgbMo5kYqlnar7zveCXvWtnSSweM.nZzZ0qVyLAMDQfrd_Y7ojyjHGCXTVH0O
 Pt33yaQCU8wRZHYMsr11UW5k1r08yv6NwV1OkdDHsI9vWuoYoO2.ycmW0kcZx22.vNmrEf_cHtqO
 6mL5wb8KH7eX9LkV7Jjboygf9q0duSekrxaP_j4csB5D7c8Atovmz3yRudSs6aGeFZmeLVzBHEoo
 wfJl4F1Xa70Tlz_iimnBbPbMM.z0K1X4HcMh5KwbFPAWRIeA17RSkEzbCb5lmLK3hBumzhgsjdm.
 CwsiUqqRVDtVpqZf_ICd1Lnx_BIKs2koo6MCN2rbEzdrlTBfDBL0QpS_Jo9EiwbxYIl5HeorvA1F
 rrYLpTUYi1bm.iLibYcbeeBgC_hxeIEZKgTDh45epXFNPJF_3znOMJr.f8_79fbETW8y9cOPXuIn
 qp5JxdU.EBswtz41n1kzMUetppe2ytvD3u6fQTub0j5kQwqq6W4fjzOh_e_HikYDvWS4CdubwYGW
 VYZjLWFr5_gyW.CPq9JwCUZ.HBah07SNuRfGmIya.ccHUFeRA.Bqy0Gg9rNy06dDQXT_9hOrM_JB
 Xg20zXkAnzL0c08ssIDoAmYIgAHjs3qxRn7pT4zGP7xhyP_fl.FwDmUsBbEjXsP9EYDLF8Mv37zK
 wxZ5.iONVUwISprhCAx_o1DK1oqRqmQIoXcaBK4NeF7AO8NZKxrj9Ze._gyiztT6X5pW9ClPvC05
 YfoyneQYvYLfq.BtJaWtvfDJIyTle1YbXI9DKTvaQsQbbrJ4Z2gLytg5SA6EJ_3d2w28DLIlO0IU
 6DNapW7Wn2gV9xFbFGScCkQ1rUCSDSFgbUcjl6DSJC9rS_C640IoZHzIaO1zNY4wJp2BD2vjGQ_o
 vgx7bWBPsMmtqy28WecbccOyydULFyiyhwwOpwusk_.tthth61IN.R6SjgOzczG1_hNdDeU32Ahg
 7rKO6oTR9OSkXV5abYLhZI2trc8EBPImIhwOnl0ygPXVDe0.NIv8TD2SD..hwaaRxMNz4wa2HU71
 bskoHsuuu9jlXkx2YSx649e.mxGcFqhqtN3K6FQ6tWLD17DD5DqItpN2D35obihW6KWn1Gn6.J.1
 GAtChByVC1F6MZ8MQ8KnuJ5Sha.mvpRtM4nh8CAbpFwAQmWUDnvdfyeGeJgN3RnrPLCNb6l.rIJp
 PQTK5k0dH995hXHuZ6faSvp6o2fxCPn0MKQCzbKCYRwcky5KwGA3574l1b..UgeOu3U6H4SaaVof
 VRoiHFufTKWZ.z9uIzW1pP85i_g1aXz3hWTbVw2fbDLNbYO04xChL01Mzcqi7e2L00X.Apa0OE2l
 gcHc_eqtgrK0DcaJTaIGRA2FsSTiqvGkg4jsoAyj9wu5QVF6paBG8b0cN2wV7zHmC50uiPf.MOxo
 7M46kcA_G_TxZaQjJXRY.i4Vawsgc5W0QwExBqjoI7OTGAotwvpQNxyuuroxtAWfY_qA68gxkDvu
 flIfvjh.tvDgnFLWVP1jwi0J57apy_MLT_HdG9hfNoH9XuH7CbpGum7u096uQKkv0N4pmIksJPGo
 ChmvbAgBGbsoQdyVuQyG0h7ZXO6yiH157BwGuQctoXfiLvYJmAslG0sInTGM7kb0TIOILN0pmdW6
 fCf2sjifiGanNCebBk995apEzhdIy6dWJ92JJ4P1CktYcUJhfzQLIXb66gdZHRV.CLA7SCo6pIEQ
 9K1UUcFEuA41ehtbgjhOcEluTClQARy7.6fP2n_8FLvlleEJfLVdq1ZxFlMRdnvL1LOFVzUfSKTZ
 u8xhBZFEYHZ6KNCIMNHf4ISfcuVZPyfL.LuJJqy7Jd_YqLAJFOA6XWTUouXv7MITEo8PobEFZIpz
 R1pA75DxM86jibcqM.bit9L9ZiymuD82QsynQJoZDmuw4aoPC3JfGhZELUKf_BFPDb.F9MXOLwTm
 vqWZX37Ej3C.Bhcq4Zee3pTPWhFuo.8KvhpFXy9ew2T73PzV4YpGAFVm8nysOtJ2BtRhfsEmwviB
 dy81DcJbQbchnJFx1GT27ozoUovpOu6ggOesPZ7HvAQWaCzAnMMH.lLT7kZCkaD3c9V1xiEBchWW
 j.AWu9C0dteXX5cBOOhBhA68PRvGirWx2gil_kLFlepfsXvnGD1t.fFoifU2I7ygNXKwvfQK3xMX
 oPh_Ks3NkotRBVDgtNIiLbpqfHJ6_YWv.5bRMZzlYOTl1IJG1NUaDwToeR4oi2q8NUF_EeQ--
X-Sonic-MF: <pjp@fedoraproject.org>
X-Sonic-ID: f5f61101-025a-45fc-931a-252ffbca5030
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.sg3.yahoo.com with HTTP; Mon, 8 Apr 2024 08:02:54 +0000
Date: Mon, 8 Apr 2024 08:02:53 +0000 (UTC)
From: Prasad Pandit <pjp@fedoraproject.org>
Reply-To: Prasad Pandit <pj.pandit@yahoo.in>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"yasunari.takiguchi@sony.com" <yasunari.takiguchi@sony.com>
Message-ID: <404348560.4112879.1712563373292@mail.yahoo.com>
In-Reply-To: <5ed66f6d-ec4c-46bd-9498-71520d82bb25@moroto.mountain>
References: <20240311100407.1271331-1-ppandit@redhat.com> <5ed66f6d-ec4c-46bd-9498-71520d82bb25@moroto.mountain>
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

Hello Dan,

* Thank you for the review comments, I appreciate it.

>On Monday, 8 April, 2024 at 12:25:10 pm IST, Dan Carpenter wrote:
>It should be on one line, with no blank line afterward.

->=C2=A0https://lore.kernel.org/linux-media/20240311100407.1271331-1-ppandi=
t@redhat.com/

* Blank line? There is no blank line afterward.

>
>This isn't a bug, so don't add a Fixes.

->=C2=A0https://lore.kernel.org/netdev/CAE8KmOx9-BgbOxV6-wDRz2XUasEzp2krqMP=
bVYYZbav+8dCtBw@mail.gmail.com/T/#t

* Some say add it, some say don't add it. IMO there's no harm in having fix=
es tag. Will send a revised patch without fixes if you insist.

* Do we need one without fixes tag?

Thank you.
---
=C2=A0 -Prasad

