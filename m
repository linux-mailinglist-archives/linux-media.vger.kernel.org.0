Return-Path: <linux-media+bounces-27719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3AEA54B9B
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 14:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D3417A8F77
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BEB20D519;
	Thu,  6 Mar 2025 13:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="XlRDh/dW"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AAC20B80B;
	Thu,  6 Mar 2025 13:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266579; cv=none; b=KGfuU+CL0VVqXzGSx58NZqi/HU14BCDD9uBmLAcMvbEHIdrHg5isJIkCeBbNElH0/o6K/6BlLT4spG3kiytbSPigwX+N4PE6wulUVKfCAqcqeBWA8GB0uE0xBMrxMbBr51VNnJxbWSCsPICe5YiJSPDYNyXTIBIr/5y/udU88zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266579; c=relaxed/simple;
	bh=yvNDy5o+8gZuKkdtqcqlDd+/DMLt1MmCwIzubU/kfT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EpPaxPBSzjGzQsxDSJJd0sgNB4q7RMri5GV+tL8fplNi1hUf8MVEuHrO6eLr6xzWKfoecxdkaqugNaTRvSkNZmfZr1rgAN5JCNRe7Q0CaWksJd/mqiPK9Wcw+GZMQgECoUH04QWaUXRQFGUg38EZKC7iXEVRtGkIgO4W7sXzSIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=XlRDh/dW; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aheBpoWCxDxaoR9qJYcL/Dnzay/8wT76imGpzNigDC0=; b=XlRDh/dWhjgV67cXZemmhiw1Hm
	F6jT2U+d0EmjtmJkeI2k7bAl50lwQWjKiw+wTprYQz724uUESXUqB3Drq0b94Rs5C7MYiHXnLU9+D
	uIM5Cw5TpClUDsy9kenCjcyLnH2sTa9yXqHnmg64GlpzaaK91QBo+RpvrfoKixnXnFtmyedmkYsxo
	2RseqHuV8SispTkct8IxoiSsCqM/kBC/5stLdX3OynmHpMAQLYav3CPHLgCSKQ36dVrvbJBOg13vm
	ELYMlZJXZLq3ihyE4syXE+V8qHUSA5JJW6a5Y1wWmN1Tc36E7NPCw1v2rZWhgeUYuJjUVxySYZ+LD
	llCHzE4w==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqAye-0003Cs-Tt; Thu, 06 Mar 2025 14:09:29 +0100
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
	Tim Surber <me@timsurber.de>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: Re: (subset) [PATCH v14 0/3] Enable HDMI RX controller on RK3588
Date: Thu,  6 Mar 2025 14:09:24 +0100
Message-ID: <174126656188.656541.9478237014030663436.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250306072842.287142-1-dmitry.osipenko@collabora.com>
References: <20250306072842.287142-1-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 06 Mar 2025 10:28:39 +0300, Dmitry Osipenko wrote:
> This is a follow up to the v13 of HDMI RX patches [1]. Hans queued the
> driver into the media tree. Now the DT patches are left to apply, could
> you please take care of this series if it's good to you? Thanks
> 
> [1] https://lore.kernel.org/linux-media/20250304085819.108067-1-dmitry.osipenko@collabora.com/
> 
> Changelog:
> 
> [...]

Applied, thanks!

[3/3] arm64: defconfig: Enable Synopsys HDMI receiver
      commit: 97d8fe4b7722104b9abdb9cbeb0e884f864c6477

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

