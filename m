Return-Path: <linux-media+bounces-17002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2453E9624D1
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 12:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5750E1C23DC5
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 10:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A413F16B720;
	Wed, 28 Aug 2024 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="cbGAVQgi"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0D786250;
	Wed, 28 Aug 2024 10:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724840699; cv=none; b=VSCsT2RjIcpRUr9Xu0WeeV8KYXcASEn2pRRFZjhf53qP4brCBYBHyJ5UPcXpOOLPQ/G/iY3s/GfMaJY8JeD3Bdqn9iJ91bhyUSFoCpJhRYa0ZQIThLBFqchu/aya/vD1DR9wHdVVCGMoxD4l+DqJm0+QXD8gAhVBKDtmVljmrKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724840699; c=relaxed/simple;
	bh=Z/qi/c2IvKeKwiaZ6NfQJSNqZ1JgRS36svZzHMTZmzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZT4/5QRaJPIhaWpXk7E5qtzpVPEVl3PXBxQBuPv3H5G9FZgDWpjzkQzgb4VmKWxRFQdx4KR1Wxn7GPZMLQs4OPbMmqm/zzE3Hj5QzCAvXBCx1AwZ+6h+c85v1qw2X91sat/1miSf0riTV2PcBCbMoaGs8z3ANvAd0BJa6EsZuiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=cbGAVQgi; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=O/BM3QttQXByMfJAW9hhalkO4P+GBm0Hu1hMTokbCmQ=; b=cbGAVQgiJ1ZEIKB3qtK8gJt2D0
	K0B+fmIIgbVMsPHk2AkGQinZ714LfcnupGLNHLlbQU81I56ABT7VN4HbS5dGcogBZTLbi/AP2mdM+
	vwSrA/TO5K+uhaYoS4tWPLXN8WicPn94alWf97Pv2L2tJVj6joZ2LMr+sUeOxKPHAj9vlFN1kLrzK
	R1JLB9fYSl60fZd93OvgvwiXBUQwIG4taL1+CSe62ewrCAuH58XugaDtDHufM9Gdcu2e2Mr9IxSvd
	v3rgbkxnC3NieMNMTjbOzTbm7r24Fv3YPKFrHqIVRh5pB1F/WfXmEgIyUTtY9xOFr4BjUQgZjFuaQ
	40IGlfVg==;
Received: from i5e8616cd.versanet.de ([94.134.22.205] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sjFrB-0004Up-BN; Wed, 28 Aug 2024 12:24:53 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Alex Bee <knaerzche@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH 0/3] Add VPU support for RK3128
Date: Wed, 28 Aug 2024 12:24:49 +0200
Message-ID: <172484065905.1479647.10986779548768332833.b4-ty@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240523185633.71355-1-knaerzche@gmail.com>
References: <20240523185633.71355-1-knaerzche@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 23 May 2024 20:56:30 +0200, Alex Bee wrote:
> Similar to most Rockchip SoCs RK312x have hantro G1 based decoder and a
> hantro H1 based encoder with attached iommu.
> 
> The existing drivers can be used as-is.
> 
> Fluster scores:
>   - FFmpeg:
>     - H.264: 127/135
>     - VP8:    59/61
>   - GStreamer:
>     - H.264: 129/135
>     - VP8:    59/61
> 
> [...]

Applied, thanks!

[3/3] ARM: dts: rockchip: Add vpu nodes for RK3128
      commit: fc5aa1ba77c78c17d2c1ddb94e7aca3f4f32efcf

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

