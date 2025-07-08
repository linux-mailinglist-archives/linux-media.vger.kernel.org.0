Return-Path: <linux-media+bounces-37068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E94BFAFC5DA
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45BF517B424
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 08:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBE42BE053;
	Tue,  8 Jul 2025 08:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nPCyrBfb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1D929E0F4;
	Tue,  8 Jul 2025 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963870; cv=none; b=l/2fPzMCWlfKN2xopjvDf+vEtsWUu46OTyaXlXseVBk/zrMu5KNhxLRVmnFDoUzeZlGsIIffKygxLQwcrF3uZFiYy8U19gEiAZVxoQLOixoy4v66N4DBGMtqr5xscyOkSPCrjZsi3QzDsY3wP21TkLvxtVnYE/eC0Is8Sa4xZJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963870; c=relaxed/simple;
	bh=paqPxHEdzhlttb29VSY2z8qUYi4dbUOpAoAFZ9cfki8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfFa3gDQaOiao6kwnKmZe96vLDY3prsQ8347zxmBzM6lmAyk0VSAGYA2H/8DwjWaAqm4/tojtMKF2x9wFS9LNi8aJzUp+X8Q5nKWrzM2Eq6otHgTw2HsjbVoyHc0oqFWL/HkPnVBzxbVEDaWGKM1S4uSTuBIpVEiptB6UV4gxXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nPCyrBfb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF175C4CEED;
	Tue,  8 Jul 2025 08:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751963870;
	bh=paqPxHEdzhlttb29VSY2z8qUYi4dbUOpAoAFZ9cfki8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nPCyrBfbyFocXcBr2vfBUH8EPiTc/v9Uw0Kj171Ef8kfs0hITcljpMhh569e2qyqe
	 QN6ERv57n0PHWoY3kIi+WCa+GLZ8jqhKXMcb7hcHYamam6f+gOFyT/Lwyr9P5RIPXk
	 ZM3QT2vMxKv6dx4myo0VfUm3ZCNN5nl4IWoijqHWPKb+JAiTsCbaY+gTxJbJCJETGj
	 SO6K+G8D/DXuvdYQJrdX29xumEnMuUeRB+qlDU8Xd1SCRqWzr5Ge/NMpzAALw4Bniu
	 cYC6IDKzynBFlAgdlVTN8LI4f9oCymvmQpArbCEYoVAZd68dxAsX140UQBJeusE+EY
	 T0oe6AZCQsyqQ==
Date: Tue, 8 Jul 2025 10:37:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stuart Burtner <sburtner@d3embedded.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Spencer Hill <shill@d3engineering.com>, Sebastian LaVine <slavine@d3engineering.com>
Subject: Re: [PATCH 0/2] media: i2c: Add driver for Sony IMX728
Message-ID: <20250708-evasive-elephant-of-justice-ce6f5b@krzk-bin>
References: <20250625-imx728-on-6-12-v4-v1-0-cfc6e18c3e23@d3embedded.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625-imx728-on-6-12-v4-v1-0-cfc6e18c3e23@d3embedded.com>

On Wed, Jun 25, 2025 at 02:20:02PM -0400, Stuart Burtner wrote:
> Hello! My name is Stuart Burtner.  I will be continuing the work done by Sebastian & Spencer
> on this driver. I will finish this patch series and maintain this driver moving forward.
> 
> This series adds a V4L2 sensor driver for the Sony IMX728, and related
> devicetree overlays.
> 
> v3 [0] -> v4:

So that's v4, but yout patchset subject says v1.

Please version your patches correctly, e.g. use b4 or
git format-patch -vX

> - Drop set_fps() function because it doesn't actually change FPS
> - Use "guard" instead of mutex_lock()
> - Fix error checking on imx728->reset_gpio
> - Fix attribution of Spencer Hill as Co-Author
> - Fix maintainer entry for Stuart
> - Clean up documentation for gpios, per notes from Krzysztof Kozlowski

Cleanup? I asked for changes in the ABI What exactly happened?

> - Removed defconfig modifications
> 
> [0]: https://lore.kernel.org/all/20250212195656.69528-1-slavine@d3embedded.com/

That's also v1.

Confusing.

Best regards,
Krzysztof


