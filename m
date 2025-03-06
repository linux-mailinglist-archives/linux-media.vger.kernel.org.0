Return-Path: <linux-media+bounces-27693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E56F5A546BE
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 10:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A69416EC24
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 09:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB94C20AF64;
	Thu,  6 Mar 2025 09:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="x0KlARKk"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70447209F51;
	Thu,  6 Mar 2025 09:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741254259; cv=none; b=tnFyip3vPl/IXapzIPMTUmPZ8yrQjsiBxynaxzfsy/GpVGOXEkVrN9o4dSJOpHXi2A4iHTIn/3ZIBXhoqD/1M0y5PpR6d9hEM0FIGIzJAm5g4max1unxTHgfqemhbL4l5JGraHekq73dr+AvBVWMycz4nM170M3n76uXrQOW2ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741254259; c=relaxed/simple;
	bh=jcSCTexaWQ24umIDHBo2CI/qbEBSr0EgpMjuTX8NrE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fvAevuuM/aV0e4ZrbYpeT51VEgAXurbl1rcDcR8l+DL/PAlnV0i4IEWTXx0zhTvxc6jyw7ONPjc0C+Q5gzI3pd+A+6sx9D727hq8/JryuWEZPnvUP78ctH5ADpzxjat9cXY52gNUG57vamuB4JbrUx8xqetrtpNpxxFhgf8OFEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=x0KlARKk; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A+AoCpj+mam2Hv7JmuwsRJRor7A216pIOlHe7OyVTl8=; b=x0KlARKkaEwkEYUQAlmMaZ6OaQ
	DWuU+6P0xe9DEu+abQ7xh4VNXtyfY/Ea7IjpIr3fpklDXjFuOG12udhbCwKdck6RB1XCZ1G1/Kf2e
	h64oPx9KJkm/93PVKb3/59Ae8kDAoM0tlhhY3kqMNZ3p5tFlxfdhAqx1ebdW6wG1TGRsIWITGFzHV
	AI3KVKYHQ8x6VNjDwWWT1T1qfPjCbT8PmOCMDuWXZaA2lHHJalSmb2Dw/VsMCp/jyTauklU0GzY3t
	tl6q7ncsda64gfzzZGUIFACAX7gDkEjsosnf/H9W/YUTEcntgYoks2HFpQjtognUBMrhBtwsjYyGV
	9bZvFCJw==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tq7lu-0001tC-By; Thu, 06 Mar 2025 10:44:06 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 jose.abreu@synopsys.com, nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH v14 0/3] Enable HDMI RX controller on RK3588
Date: Thu, 06 Mar 2025 10:44:05 +0100
Message-ID: <14706072.uLZWGnKmhe@diego>
In-Reply-To: <1105cde1-7557-4104-9652-3527f8d9b599@xs4all.nl>
References:
 <20250306072842.287142-1-dmitry.osipenko@collabora.com>
 <2906773.tdWV9SEqCh@diego> <1105cde1-7557-4104-9652-3527f8d9b599@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Hans,

Am Donnerstag, 6. M=C3=A4rz 2025, 10:41:46 MEZ schrieb Hans Verkuil:
> On 06/03/2025 10:26, Heiko St=C3=BCbner wrote:
> > Hi Dmitry,
> >=20
> > Am Donnerstag, 6. M=C3=A4rz 2025, 08:28:39 MEZ schrieb Dmitry Osipenko:
> >> This is a follow up to the v13 of HDMI RX patches [1]. Hans queued the
> >> driver into the media tree. Now the DT patches are left to apply, could
> >> you please take care of this series if it's good to you? Thanks
> >>
> >> [1] https://lore.kernel.org/linux-media/20250304085819.108067-1-dmitry=
=2Eosipenko@collabora.com/
> >=20
> > Linux-Media, has this strange "applied" reporting thing going, so neith=
er
> > the thread reports that nor does https://git.linuxtv.org/ show the comm=
its
> > yet.
> >=20
> > If you see the driver patches appear on https://git.linuxtv.org/ before=
 I do,
> > please ping this thread :-)
>=20
> Patches are merged here first:
>=20
> https://gitlab.freedesktop.org/linux-media/media-committers

aaaah, that was the missing piece of the puzzle.

I remember reading that media also switched to a multi-comitter model,
but didn't realize that this might entail a different host.

So thanks for the pointer.

Heiko


>=20
> That's where all the new code lands.
>=20
> With a two day delay (if I am not mistaken) they will arrive on the
> https://git.linuxtv.org/media.git/ tree.
>=20
> If it is in the media-committers tree, then it is OK to take dts etc.
> patches.
>=20
> Regards,
>=20
> 	Hans
>=20
> >=20
> >=20
> > Thanks a lot
> > Heiko
> >=20
> >=20
> >>
> >> Changelog:
> >>
> >> v14: - Re-enabled LOAD_DEFAULT_EDID=3Dy option in the defconfig and
> >>        added ack from Hans Verkuil fot that patch.
> >>
> >> Sebastian Reichel (2):
> >>   arm64: dts: rockchip: Enable HDMI receiver on rock-5b
> >>   arm64: defconfig: Enable Synopsys HDMI receiver
> >>
> >> Shreeya Patel (1):
> >>   arm64: dts: rockchip: Add device tree support for HDMI RX Controller
> >>
> >>  .../dts/rockchip/rk3588-base-pinctrl.dtsi     | 14 +++++
> >>  .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 57 +++++++++++++++++++
> >>  .../boot/dts/rockchip/rk3588-rock-5b.dts      | 18 ++++++
> >>  arch/arm64/configs/defconfig                  |  2 +
> >>  4 files changed, 91 insertions(+)
> >>
> >>
> >=20
> >=20
> >=20
> >=20
>=20
>=20





