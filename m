Return-Path: <linux-media+bounces-27691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA36A5463E
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 10:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93564171E17
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 09:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DCB209F25;
	Thu,  6 Mar 2025 09:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="t33nFIPn"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789161A83ED;
	Thu,  6 Mar 2025 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741253190; cv=none; b=mw9UNac/SwWTvm+y5xo3SSmITgwHM7c8+tpi4Z/m1cvMsPx1nYgja0biMLvZP7ikO+XkwP7vrXOV0e2zVE8JyL6/MLCjRMONojWu6gE6OfBwDU7v50rjyvdhrv5EPj0CqzijDmGwFadlPX5so83PKRXxJDdiztiD1Umbv3iuwyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741253190; c=relaxed/simple;
	bh=UkYBMSyVx9mB9EYLj4kAZNlJQpO9fE0jrQdWxZo0isk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LLmWl9PQzXFnn4mqRHGXpOr28wki+ef7WjrfPCZ1TR45DYyJ6dpW3fEt9AvCoFrGhdn4EIAEyD4MqF/QuzGtekA/xrDNl9kGzqOZaxx6Yjum16Vz3pEPW5lS6F+kttGKT/qIth7lAhKvWGj7ru8+44TlNRoJCcmagTIS0kBQAV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=t33nFIPn; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=i03ZXI+7609AAGbV95Aop1hWrPoWoth/Ke5U6QVdYNo=; b=t33nFIPnkd+ZsGPfSAax83vcuK
	yRvYE8KeWFPLsLOG9s059CaYk2lNnlVKO82ARaVr7jvgD2QOiYhf72h1/UWswpkIxewsM3+LQ6DH0
	RGEUDqsQIcGOxwHtsVVZgbu659VQTG4L7PRCWGsDhxxY2s5IloBkwDPCjRe2CW0UST+aPP9oR/tpK
	iXECCMrImzkqkHXJQQ/UYavW5NUKD2BA+OY9EjxVc1ZypOH6P8ythIU1FLrsV6KvNMMtUGY5j2LDk
	h6K2RmpKE19tOhyOTsZq0M41IcoWW0QspVpMW61TghH8b6HB06IGT6BYRK5vj3TrnecozDAdxdPWa
	/nj2qnzA==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tq7Ub-0001kw-KD; Thu, 06 Mar 2025 10:26:13 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 jose.abreu@synopsys.com, nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH v14 0/3] Enable HDMI RX controller on RK3588
Date: Thu, 06 Mar 2025 10:26:07 +0100
Message-ID: <2906773.tdWV9SEqCh@diego>
In-Reply-To: <20250306072842.287142-1-dmitry.osipenko@collabora.com>
References: <20250306072842.287142-1-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Dmitry,

Am Donnerstag, 6. M=C3=A4rz 2025, 08:28:39 MEZ schrieb Dmitry Osipenko:
> This is a follow up to the v13 of HDMI RX patches [1]. Hans queued the
> driver into the media tree. Now the DT patches are left to apply, could
> you please take care of this series if it's good to you? Thanks
>=20
> [1] https://lore.kernel.org/linux-media/20250304085819.108067-1-dmitry.os=
ipenko@collabora.com/

Linux-Media, has this strange "applied" reporting thing going, so neither
the thread reports that nor does https://git.linuxtv.org/ show the commits
yet.

If you see the driver patches appear on https://git.linuxtv.org/ before I d=
o,
please ping this thread :-)


Thanks a lot
Heiko


>=20
> Changelog:
>=20
> v14: - Re-enabled LOAD_DEFAULT_EDID=3Dy option in the defconfig and
>        added ack from Hans Verkuil fot that patch.
>=20
> Sebastian Reichel (2):
>   arm64: dts: rockchip: Enable HDMI receiver on rock-5b
>   arm64: defconfig: Enable Synopsys HDMI receiver
>=20
> Shreeya Patel (1):
>   arm64: dts: rockchip: Add device tree support for HDMI RX Controller
>=20
>  .../dts/rockchip/rk3588-base-pinctrl.dtsi     | 14 +++++
>  .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 57 +++++++++++++++++++
>  .../boot/dts/rockchip/rk3588-rock-5b.dts      | 18 ++++++
>  arch/arm64/configs/defconfig                  |  2 +
>  4 files changed, 91 insertions(+)
>=20
>=20





