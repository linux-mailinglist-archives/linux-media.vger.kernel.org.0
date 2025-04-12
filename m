Return-Path: <linux-media+bounces-30079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDEDA86E96
	for <lists+linux-media@lfdr.de>; Sat, 12 Apr 2025 20:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D5BA8A5B21
	for <lists+linux-media@lfdr.de>; Sat, 12 Apr 2025 18:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B806A20C02E;
	Sat, 12 Apr 2025 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHJYj3GQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15467537E9;
	Sat, 12 Apr 2025 18:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744481056; cv=none; b=I/YKyWQy7ci8F+1PaHN2AUH7oyqg7dMnKQLPH3K5ZvaOOjOfz4XfEUq35NWK6WLiph3VIF1ZXUFoMHeUXYK575xAvIovbpZ7FfcXZM1fpGhxCKjUNvQ2lUWICuEzpLnklGxhU48G+zOms8mCGrUwLTom/YI0JcuQOIRIAAHrklE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744481056; c=relaxed/simple;
	bh=1AuLxzGY9LPRhaoTY6q8rhIM2KkGfgI6Ff0WOXcz//s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoN9De+L/cL8wHwAuJ9nGBXRaf3NQwv0x4jSxRJxPschyyASV+TPCQoIhqQYpnELSo1xb0Wwxw6r/HdlNRV6vam8tpJpJks0uehbVAeOv/ArJbDUEKwmGAHc/9LOIXJHu1mKeBc/4Q4D5QFxRTfvoyfWEq805UYevyEtFEvGCcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHJYj3GQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D236C4CEE8;
	Sat, 12 Apr 2025 18:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744481055;
	bh=1AuLxzGY9LPRhaoTY6q8rhIM2KkGfgI6Ff0WOXcz//s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PHJYj3GQNbgm4xygh+u8S9iVQVfEzlzcigjGe/iVMu2Tu+pjyDwM+UHTyctAKh2zx
	 1c4Nd+Wq6poK/9zA4vnjYJXFIDDgPR59dhic70wm8K60Hj7PPWG+P9gbitMUOq19NL
	 a7Xmb5Tny03fdbLtvJ8fYiOd9ZLf12VYgRVnyw2nTV1ZU7mf7+NAKYBm9dZd+5ceVk
	 yDdonrHRHxXO0dL2tH7s1GQq3Aj3RRGR+8IxJVVh0oBWxZ8cVI6FqOQSrowdL+MBD+
	 KA6m8FmxOE8Znh8NMkI4Xw8lEx5OyxpacrvcP0iIr2CrtcSmHKS5RXeoHNB0p3hFYj
	 PC26ATRx3lFBw==
Date: Sat, 12 Apr 2025 13:04:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: media: convert fsl-vdoa.txt to yaml
 format
Message-ID: <174448105342.1415739.9619142538994119426.robh@kernel.org>
References: <20250411213601.3273670-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411213601.3273670-1-Frank.Li@nxp.com>


On Fri, 11 Apr 2025 17:36:00 -0400, Frank Li wrote:
> Convert fsl-vdoa.txt to yaml format.
> 
> Additional changes:
> - Add irq.h and imx6qdl-clock.h in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/media/fsl,imx6q-vdoa.yaml        | 42 +++++++++++++++++++
>  .../devicetree/bindings/media/fsl-vdoa.txt    | 21 ----------
>  2 files changed, 42 insertions(+), 21 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/fsl-vdoa.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


