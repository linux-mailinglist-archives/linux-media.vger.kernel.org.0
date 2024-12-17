Return-Path: <linux-media+bounces-23548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E649F454F
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 08:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D45618892CB
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 07:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F341D5179;
	Tue, 17 Dec 2024 07:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzaWEVm1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE6B13D244;
	Tue, 17 Dec 2024 07:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734421257; cv=none; b=jGBXqiHknY7S0LQkIm2KC2vZaNFzDi4RVJ5/+L4zoms1B+6hCP+06NBnypmdOu5xj62oN9zjXi+YHAJIODgp8kbXd6o2bVBKcKlodVPg1xAAhgVVaHBDp4MHDRG1eOw9BcXTTrT1BJTtiGexZD6JBFwGyoR7hzZw36wXpjOyc5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734421257; c=relaxed/simple;
	bh=qh5Rv3ZXcyqgzSC7cezcMXk4bK1CN2n8Om3V6cn9Eqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CprsFjxsa8W+43oYrB83WPBsSmkPZpi8rtHuTLn7yOGFHWRnmmGOeMX8zbAXJ69t87lvgeheOF/rqG8/0TnQPCCgK6kuC4Hu/jl2MCwGbYeD5bDESL3c7e2FKS6D3Aiperye2lmmNGh9nsR4VNs0h4yT8jVK9YP8PDZgVO5MCjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzaWEVm1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8690DC4CED3;
	Tue, 17 Dec 2024 07:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734421256;
	bh=qh5Rv3ZXcyqgzSC7cezcMXk4bK1CN2n8Om3V6cn9Eqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XzaWEVm17jBCCgA6EawOmJaL13vCmwwYoDM8LchPQZRPjXJsEdki1DPL0LaVTOKOL
	 33lDiZl1cKjx/bvh8FTAuDG3IeAeyGJRXBP3HQYavNdwioH3e3/WwbNSfAKqerMer9
	 4AIbhD7o5TdQu3Ks7hBxOILpteYBgK3bufnSVx+xpQtef8O3vn0tl7PrbGL01CsReQ
	 /myqOsnKL2oIsxlKamz1YdFgT0g7dh9naLeA0wssLMpuQqS/2PmbV/qY483BZTLk9/
	 V06T6WZPxiVtU6WwGQY4tNzpw+JY/0bt5UnEb5pwhiCBeSXYr+OwVimrckSE4YkyT4
	 S5eInycqMSSig==
Date: Tue, 17 Dec 2024 08:40:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: media: imx219: Describe sensor address
 using the reg property
Message-ID: <6djxfcuroxlth2th3tpuesauhdnowatzgnyhesewjfz32v6gbz@q2dj7jsxiqlw>
References: <20241217024206.1700170-1-david@ixit.cz>
 <20241217024206.1700170-2-david@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217024206.1700170-2-david@ixit.cz>

On Mon, Dec 16, 2024 at 09:41:51PM -0500, David Heidelberg wrote:
> Use the reg property instead of text in the description.
> Drop useless description of reg property.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml

You are using non-standard tools to generate patches. See checkpatch
warnings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


