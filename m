Return-Path: <linux-media+bounces-16003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB8994C51F
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 21:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF9111C21B3F
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 19:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205381552EB;
	Thu,  8 Aug 2024 19:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=s.l-h@gmx.de header.b="InKSD8e9"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5986433AD;
	Thu,  8 Aug 2024 19:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723144871; cv=none; b=P9G8R05g8S60/M8jXC99miI5g5tMEnwHLeuovlBSgWjPTnUtckLsJ2MzOqT/K+Utuv+lccSnOc2rrRSAO5hsR/be4P66RbFH3SKVuouI3AroLaFPH4FYbaOYCVXY1vhxkWnRXiLH1DORm09NvPZllhE3GSvhFZFlPkPbLxHxKW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723144871; c=relaxed/simple;
	bh=FBIdDfRz/1/v4RHrXXW8YIzG8p9Kb3+Sd2s3aWpBPC8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cJx+EzakjjcWhWHiQsSbSjClLI1ukN2Vfk6j9PKqGN0En4vvmCKDd9us+8CVIMFoFbhh0Si28to3e9B1cH7PK/quBu8s/svpeuHIkDmdpc5maFkNFHiUjVEXfovXESKGF6A7cLXGO4kJ9cMX5tK09Gbaf6d08JcYrGaaQRfRlXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=s.l-h@gmx.de header.b=InKSD8e9; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1723144859; x=1723749659; i=s.l-h@gmx.de;
	bh=na4ANOg2jDC6V2Sw9P++2Hs2hdz3i+hVjDxirc3MTdA=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=InKSD8e91MjwXe0WrRrdtir5PV92scxZ/tvJSYq2I45mJ9+EjO7G/b8LieL4GsbW
	 cVZxnwWU0lQHE1IuEttqJAxLxKH7H6wUauxHu3VSW/2URLOxazgpKpKEAmHoLidtS
	 WJG99JSmA6L2btGbPTjMpTSCQG0ZEUR2FkEbxL4RvsNZpu18NsLf7AWazSVcmFmej
	 6O2WKVOuIKocUSUa/VpZu/QghGczI113rK+wgzYMT7oxmEYZ8bUWdlGSo4E6gLHNs
	 9c/Lijo3pZiwAFoHVHGNqQzWEfBjgL0kDCapjae8xf7MqVdSNk6yWDX+m9C6hro3m
	 CNaJSZE6vNPLoIfdNw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mir ([94.31.83.155]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbivG-1s4ioe3kC6-00c2zN; Thu, 08
 Aug 2024 21:20:58 +0200
Date: Thu, 8 Aug 2024 21:20:55 +0200
From: Stefan Lippers-Hollmann <s.l-h@gmx.de>
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "media: dvb-usb: Fix unexpected infinite loop in
 dvb_usb_read_remote_control()"
Message-ID: <20240808212055.77ae25d5@mir>
In-Reply-To: <20240808084757.18084-1-sean@mess.org>
References: <20240808084757.18084-1-sean@mess.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yjoQwqCzLA643OiTNu4RR5Uv8QLZ38nwK+qNj2G9A0BGdV/7Zqg
 FHh+5hUPtAYQ5XpCC4GLxni1yI7rvrMpuZjofRYGwEeQGN3NfJM+lf1+2oMGsKCPV+YixPS
 o4XWX9e8rt5rZEaCXeA+QsSlFnfCdoOsmYTfEDLobxk+ySzUMjCGPq20YTGzStcDjpznqTc
 3Sta/9+dj3xr2N+IsCE1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mr6z68OpiEQ=;R3jYLKgsyCh72DG1h10/lB7vIX5
 I2WRb5c4okCm8t9qna7/ZteCPENni03xSxnNh9MsP81cmLhF9Z9R40wLp/IybjIMGvjiYSLIg
 BHESo0X6gHuK8EtTU/m5YEFuIoU1MVk9llhtoh/jQLjP8ujYxZMIIYiyGaDC+iIv1IdO9UDBi
 Bvc2zSFM8mi0LhZ+qDsN4hywPMDxtC13ue3r7VY4CN/np9IBYn1k4IlBYai0nspjqto+YrdNt
 JyPkDbRhJNaeS+TgaFapDFASleKhbDICmz2lbEKZwNKbru816WnOPwdlIPP6V1ouueZnWchmx
 wA/n19+Zltp3IlqUMIFo5HirNUojWsVsIQCA7BL2pCnpAWBIp+si3iV2XVQZMkLDoeJkJ6jzm
 YsajDubcN0B85/NLv7lvMCwXG2tvChkHXASjZSVIb2Q5NEa5b2VJmivzXA834FZlZZWp8mKT0
 PIWfmqH8zJlRi7nQn/8o4Ow+Q10R0xhC3HlWplNzx9slU2jV02S0ZH/TfCqQjJ3NM3+vDke4k
 3vLGuZjUi3rZJzJJ3OR1jN3+UAw2ItLtEPpVk8h7awnYE7T/wP1HJTNOkCMXO6vWd6i5o8ilo
 h4r2X1n6RllBXWIxIq6QM/56QgDMvX3tKelEhkBLnvTfF1HheAkYsSAg8Cx3wk36Ig6ZiXkwS
 uy930pO4EAljcABMpyvAzjd4tye1KBwAb+3a+juEowvroyK1MhTkFBAAyEwVPG4xrKPi8QYxD
 M74a3l2WCEXOWkJt+Mf4NcfGOYpzpXStB3yRcXBy5DSw/c1q0/+CpA9S3jTVJ+2guUh78grgZ
 lTvijVy8CDjjaBni8vtwxGjQ==

Hi

On 2024-08-08, Sean Young wrote:
> This reverts commit 2052138b7da52ad5ccaf74f736d00f39a1c9198c.
>
> This breaks the TeVii s480 dual DVB-S2 S660. The device has a bulk in
> endpoint but no corresponding out endpoint, so the device does not pass
> the "has both receive and send bulk endpoint" test.
>
> Seemingly this device does not use dvb_usb_generic_rw() so I have tried
> removing the generic_bulk_ctrl_endpoint entry, but this resulted in
> different problems.
>
> As we have no explanation yet, revert.

Tested-by: Stefan Lippers-Hollmann <s.l-h@gmx.de>

I can confirm that this revert is working on my TeVii s480, both
frontends are working and no error messages from ds3000_writereg
anymore.

$ dmesg | grep -i -e dvb -e dw2102 -e ds3000 -e ts2020
[    1.701918] usb 4-1: Product: DVBS2BOX
[    1.719977] usb 6-1: Product: DVBS2BOX
[    4.443254] dvb-usb: found a 'TeVii S660 USB' in cold state, will try t=
o load a firmware
[    4.445002] dvb-usb: downloading firmware from file 'dvb-usb-s660.fw'
[    4.445006] dw2102: start downloading DW210X firmware
[    4.616595] dvb-usb: found a 'TeVii S660 USB' in warm state.
[    4.616654] dvb-usb: will pass the complete MPEG2 transport stream to t=
he software demuxer.
[    4.617080] dvbdev: DVB: registering new adapter (TeVii S660 USB)
[    4.850800] dvb-usb: MAC address: 00:18:bd:XX:XX:XX
[    4.850931] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' r=
egistered.
[    4.859527] DS3000 chip version: 0.192 attached.
[    4.920936] ts2020 9-0060: Montage Technology TS2020 successfully ident=
ified
[    4.921577] dw2102: Attached ds3000+ts2020!
[    4.921599] usb 4-1: DVB: registering adapter 0 frontend 0 (Montage Tec=
hnology DS3000)...
[    4.921608] dvbdev: dvb_create_media_entity: media entity 'Montage Tech=
nology DS3000' registered.
[    4.948752] rc rc1: lirc_dev: driver dw2102 registered at minor =3D 1, =
scancode receiver, no transmitter
[    4.948875] dvb-usb: schedule remote query interval to 150 msecs.
[    4.948879] dvb-usb: TeVii S660 USB successfully initialized and connec=
ted.
[    4.948937] dvb-usb: found a 'TeVii S660 USB' in cold state, will try t=
o load a firmware
[    4.948979] dvb-usb: downloading firmware from file 'dvb-usb-s660.fw'
[    4.948981] dw2102: start downloading DW210X firmware
[    5.104581] dvb-usb: found a 'TeVii S660 USB' in warm state.
[    5.104663] dvb-usb: will pass the complete MPEG2 transport stream to t=
he software demuxer.
[    5.105030] dvbdev: DVB: registering new adapter (TeVii S660 USB)
[    5.351019] dvb-usb: MAC address: 00:18:bd:XX:XX:XX
[    5.351265] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' r=
egistered.
[    5.354757] DS3000 chip version: 0.192 attached.
[    5.392646] ts2020 10-0060: Montage Technology TS2020 successfully iden=
tified
[    5.393030] dw2102: Attached ds3000+ts2020!
[    5.393038] usb 6-1: DVB: registering adapter 1 frontend 0 (Montage Tec=
hnology DS3000)...
[    5.393048] dvbdev: dvb_create_media_entity: media entity 'Montage Tech=
nology DS3000' registered.
[    5.394468] rc rc2: lirc_dev: driver dw2102 registered at minor =3D 2, =
scancode receiver, no transmitter
[    5.394697] dvb-usb: schedule remote query interval to 150 msecs.
[    5.394704] dvb-usb: TeVii S660 USB successfully initialized and connec=
ted.
[    5.394764] usbcore: registered new interface driver dw2102
[    8.741397] ds3000_firmware_ondemand: Waiting for firmware upload (dvb-=
fe-ds3000.fw)...
[    8.741712] ds3000_firmware_ondemand: Waiting for firmware upload(2)...
[    9.304511] ds3000_firmware_ondemand: Waiting for firmware upload (dvb-=
fe-ds3000.fw)...
[    9.304551] ds3000_firmware_ondemand: Waiting for firmware upload(2)...
[    9.913428] ds3000_firmware_ondemand: Waiting for firmware upload (dvb-=
fe-ds3000.fw)...
[    9.913454] ds3000_firmware_ondemand: Waiting for firmware upload(2)...

Thanks a lot, if there's any other testing to be done, I'll always be
available. Hoping that these two cards remain working for quite a while
to come, as there doesn't seem to be any replacements on the market (let
alone for reasonable prices).

Regards
	Stefan Lippers-Hollmann

