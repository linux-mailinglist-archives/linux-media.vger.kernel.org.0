Return-Path: <linux-media+bounces-11170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6278C04BD
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 21:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10E0B285B7B
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 19:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895B4130A5B;
	Wed,  8 May 2024 19:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJ5vKu5V"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D356E1DFC5;
	Wed,  8 May 2024 19:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715195428; cv=none; b=SueTpz6e5uq0pZV3iC9RXj+mI/IYpYRPvks/ObpTWrSVWp82Nol9lZsVv7P6mkR1+E2nlA/Mzu/kr2jLmBGImbyDfLMzDI67TpoQYEJLnEVaTFeRa0aNRPLRC8TyogAfm7lxs2KJy6y1dYwmJQi3NSrxhQAw6f//Ijl/MVba6Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715195428; c=relaxed/simple;
	bh=8X6+44daOTVhYsmsLkXUJSkQDo/m4CLnbDr06hibE2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xv300LiUFT1oyN5xJk8kSs5WcRNnatCzMKKZ7fgVjMiF7Kd1KaeSmHz1VRBKCkYJughGBQuTzZqEVbb0GasU7cZZ8Aqa6qA8Q/TL310mmCuU4l20fjAOYnpAoE6as43UyYMVW22yus9lWvorD3B6Weq0AORnWOlDWlkUKPkvPi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJ5vKu5V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FFCC113CC;
	Wed,  8 May 2024 19:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715195427;
	bh=8X6+44daOTVhYsmsLkXUJSkQDo/m4CLnbDr06hibE2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hJ5vKu5V89xWFWP1uYZlLrERK6CfxhPrCY6a8jb/ySjrZpqFudFLNPgiHXJNwT0Vz
	 jNNAgxaY722wbJG58KXTBXYeaE9qCJa5MBu4cHlnEZVyiZJRxBcEsNPGbtSylESxro
	 7IYzzLEACMQIlfR13GffPC2zgaGBcES3tE7JUXokXFDc5Q87AUCEppAl68YAiWwQA2
	 rUKh1AakYlWWOHHva2U4Mm31oZYoA3D7aFvUhPxMKCGzH1HEJnFgaJBTLzQu1P6e23
	 MLL2+Y958qtYm8LI1ZcYA6C2S1aG3+vjWDYCxq6j0dsOrAXeNfU4Z373ZncS/wHAbH
	 0L2Waj4d4EsVw==
Date: Wed, 8 May 2024 14:10:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Shijie Qin <shijie.qin@nxp.com>, Ming Qian <ming.qian@nxp.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Zhou Peng <eagle.zhou@nxp.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Jeff LaBundy <jeff@labundy.com>,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] dt-bindings: Use full path to other schemas
Message-ID: <171519542260.2430941.15049314403040181204.robh@kernel.org>
References: <20240505084618.135705-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240505084618.135705-1-krzysztof.kozlowski@linaro.org>


On Sun, 05 May 2024 10:46:18 +0200, Krzysztof Kozlowski wrote:
> When referencing other schema, it is preferred to use an absolute path
> (/schemas/....), which allows also an seamless move of particular schema
> out of Linux kernel to dtschema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Rob, maybe you can take it directly? Should apply cleanly on your tree.
> ---
>  Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 2 +-
>  Documentation/devicetree/bindings/media/amphion,vpu.yaml    | 2 +-
>  Documentation/devicetree/bindings/mtd/mtd.yaml              | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 

Applied, thanks!


