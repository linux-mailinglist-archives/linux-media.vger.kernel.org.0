Return-Path: <linux-media+bounces-37069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF7BAFC5E8
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AF6817CF20
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 08:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3CB2BE7A5;
	Tue,  8 Jul 2025 08:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1elsLSu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19772BE038;
	Tue,  8 Jul 2025 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963968; cv=none; b=JAbOysac5+nhiyVD2qUmoMcm8pjW6pYrpHH36fDrN45xNxfCAMTNjvy90cMF7RcyKU/kaQwFWT+T6APVnH/HS0j5XjewpOvMd1c7Z76rBU9QF0zMmQAi3J+FePPMp+FVxU8zJEOy5jHQqcDJAN1Ckvfmk3LpDIAAjLKXU2GjGGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963968; c=relaxed/simple;
	bh=AgF/cWa8tyl4lX11C1ELXJPj6/yeF0Nvjn6w56HxM2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPnMQdd66EZ32SYoiE2ih+iHO1oofCAuHQTPJsCIbrQSXBkFLtiNn50C7veN2ld9me+358orop3S3L3VBLKbt7qL6dyVeKQt1V7REwa6B2R+TE8lrPaYE7oh0LlwcR0ViWSSt87OZzNYXcuDznEmLoPHfvoS0p239/Myz0UEV0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1elsLSu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADF6C4CEED;
	Tue,  8 Jul 2025 08:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751963968;
	bh=AgF/cWa8tyl4lX11C1ELXJPj6/yeF0Nvjn6w56HxM2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1elsLSuTAVqQrj4csDgKcoib/rCgA+uxml22fkkRBDTABgwtDHHkCGH087jr0DMB
	 CON6nvJ/lBgoCgdpXcz8MBqAfSOPEKm9HgkDb8BNyJkboISFMTgQG54ZWCWM1/nIeo
	 qXc/FocCcUTyWjhMMP56VDYnY1azjS+LVwcy/0KM0WjXD4R+hGtQXcjfTYsnlZM3IH
	 dm1cUvymqd++wfoTLvyfs9rQvNqTrGG4lrUuHMF696FG4IBAWDMKgSC0n5Rdt+ihyH
	 82mYO8brI+We01pcfyRzLJywrk2oU7lwdx7KKMofCRbOXwuaWFy+b+U6si7PogTJWH
	 cnhEpuEavWN7A==
Date: Tue, 8 Jul 2025 10:39:25 +0200
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
Subject: Re: [PATCH 1/2] media: dt-bindings: Add Sony IMX728
Message-ID: <20250708-kiwi-of-delightful-wholeness-cc90ea@krzk-bin>
References: <20250625-imx728-on-6-12-v4-v1-0-cfc6e18c3e23@d3embedded.com>
 <20250625-imx728-on-6-12-v4-v1-1-cfc6e18c3e23@d3embedded.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625-imx728-on-6-12-v4-v1-1-cfc6e18c3e23@d3embedded.com>

On Wed, Jun 25, 2025 at 02:20:03PM -0400, Stuart Burtner wrote:
> Add bindings for the Sony IMX728.
> 
> Co-developed-by: Spencer Hill <shill@d3engineering.com>
> Signed-off-by: Spencer Hill <shill@d3engineering.com>
> Co-developed-by: Sebastian LaVine <slavine@d3engineering.com>
> Signed-off-by: Sebastian LaVine <slavine@d3engineering.com>
> Signed-off-by: Stuart Burtner <sburtner@d3embedded.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx728.yaml | 95 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 ++
>  2 files changed, 101 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof


