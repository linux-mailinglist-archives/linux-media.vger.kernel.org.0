Return-Path: <linux-media+bounces-27860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4117A57C64
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 18:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6431A3AE643
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 17:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195E71E5210;
	Sat,  8 Mar 2025 17:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="C3VJXB6P"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCCA1EFF97;
	Sat,  8 Mar 2025 17:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741455143; cv=none; b=lKnjp+YTc4BKcXLWO4y+S8VZOGfeUerHx6Q/C5wsZAg/npJIlOrFthl4U5ac4vqGJf6DXSmMX44DpjaowxlwySNvYz11afxtYD4eHSAN+E4fYQvzi8igbwwXGw6NIJcCQGx8LNmX40XnRDjGJOoMXxnG2unjNGv6y9hJ+TNs2z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741455143; c=relaxed/simple;
	bh=Ejell1jUTwtu8ehvW0UvQBYUmz+N+whhR8xZ2dLX6fI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cm5UMm/ZUdTrQa8oLxUtaIdUOl9ghmggMJQ/SzoOKkIpmqSRlhYnhlJ62EbcIlLqEX6NsfwdJECe/tPwF5ZlQUV+tyUJyPiaQxigI9JnVpMyoDtiP9y22DNbueXX5VlEFUVPpJ6vgJcu3dBR0uEQymQlYTa6Ez3UzINJFbBfn4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=C3VJXB6P; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PEknRCWMpHK0UW+iEMqVJYA9kV64BctTgAx66EMrNC8=; b=C3VJXB6PZRX1H7lLljsk5lziF/
	Sr1VL77NZwPNyBR9V20meLb98J7MSJ/Oxe2HljbpsCNRY4oYqDJmi2nTc2zPAGgJlhusqAQlENPW9
	W4inf8XnsX1A1U7MAubyfkbtTqrP+Fy+E4yGGCl2+faZh6B5fKA5rlj7AgTK3K4top8qahcw9WzWd
	hRO6DjexK/QTBtl4zKBpRAdALAuV60e0NyQJ/37ty5J91PhRXhjm3rQ+CSw5tP/vqsnqRoZ2NrrOq
	AFFIFTbZ4fmh2qQ5/uEyFEFNGaIQqQt4au85xs/OGb7dJxzczl0DKouVznuw7HSQXVIM3DtucORdT
	NNNriVoA==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqy1z-0004Tx-Ty; Sat, 08 Mar 2025 18:32:11 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Shreeya Patel <shreeya.patel@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Tim Surber <me@timsurber.de>
Subject: Re: [PATCH v15 0/2] Enable HDMI RX controller on RK3588
Date: Sat,  8 Mar 2025 18:32:04 +0100
Message-ID: <174145503573.101861.17692576758577260840.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250307091857.646581-1-dmitry.osipenko@collabora.com>
References: <20250307091857.646581-1-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 07 Mar 2025 12:18:55 +0300, Dmitry Osipenko wrote:
> This patchset adds HDMIRX controller node to RK3588 DTSI and enables
> it on Rock 5b board.
> 
> Changelog:
> 
> v15: - Removed duplicated HDMIRX pinctrl definitions
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Add device tree support for HDMI RX Controller
      commit: 0327238991ba2d1de25e1116b1c064f433e45b8d
[2/2] arm64: dts: rockchip: Enable HDMI receiver on rock-5b
      commit: c62d8fdb27391ee72bfdf53328463813997844f1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

