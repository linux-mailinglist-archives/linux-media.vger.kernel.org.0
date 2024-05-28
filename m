Return-Path: <linux-media+bounces-12098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34628D1FD2
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 17:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06C25B23D7C
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 15:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366E4171E5C;
	Tue, 28 May 2024 15:09:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3DA171069;
	Tue, 28 May 2024 15:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716908987; cv=none; b=caibsv2ngbKmcoGIlaav69CxnVFMOhUvgs5K6Fg5BH5XJg7Uxi/34QQq64aWc6trirILEaAXY7RmERttsS+f2M93QgQvE/xz4keoAZ/B4JGb+xsEEBH2vQNUwaIgMqA5WfunUGtJvu7mTiXBv4FF2JAjmcZfZp2tPjjcm8KlUVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716908987; c=relaxed/simple;
	bh=x8VOTHJI6P33YJVc/yocUY+0x259oj4FOK9LW0zWiFg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uxc5SPTtlb05xeF35r+vlzhj0y2YK1fLi/vR9lbQQ/OEEzb3386YgneKwTw1HatIYnJAVnH+Z80R3Ti7G+XC+LLjwYNE7L9588nF1jv97/hgSr240npBKUp5cJe3ebADzzT6LIWkA82hoKIRL3BP0LVUrkWzvHyYhuIR/K7dbfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [213.70.33.226] (helo=phil.sntech)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sBySI-0004pm-Ez; Tue, 28 May 2024 17:09:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alex Bee <knaerzche@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] Add VPU support for RK3128
Date: Tue, 28 May 2024 17:09:22 +0200
Message-Id: <171690893336.1899981.5081114224300578276.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
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

[2/3] soc: rockchip: grf: Set RK3128's vpu main clock
      commit: b465223129f951d110e633a305085bd8430d7df0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

