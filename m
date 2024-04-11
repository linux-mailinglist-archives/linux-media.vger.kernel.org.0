Return-Path: <linux-media+bounces-9117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 468958A16B5
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 16:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFFDC1F22D13
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 14:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E3214EC71;
	Thu, 11 Apr 2024 14:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koYu8r5E"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6022614D70A;
	Thu, 11 Apr 2024 14:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712844372; cv=none; b=hWNNgcQTy0V4tcFvapN2P3QZ4Z7TlnmzR3GTR1+519L6qpspXCiGd4pKMCZmd8SUkxHyHO5M3ZPehhz9C7m4PIZf/GjN/Ks5XrHzcqBqWdUHts0Ch+IDlEtIK9KQl5UheOuIpNwoOMo2ZKXT3Ul8ZTA1FeSHSmMX1gzGQT4ujjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712844372; c=relaxed/simple;
	bh=d6e46jWnDxZRYyl+CFbOQVmEbwHLtW1MhnFOZwpQzwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvR9cxR/x3TR5DyNzS2jxpmy4e10keIK5jr6T9kZcr4fJTXFTwTjjnwqFhgxdvKUrfQRU42FpY4z4yzZHiwylg3Xz+6WqrNt1OeXL9bvvnOORTMliEcnKzWL12uqzZC6vad8ox74WjbIqcYAe8f0CKr03v8F5qxxyJ2aAeo1CfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koYu8r5E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42F5C4AF0A;
	Thu, 11 Apr 2024 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712844371;
	bh=d6e46jWnDxZRYyl+CFbOQVmEbwHLtW1MhnFOZwpQzwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=koYu8r5Eg3RLMZlDh92Cwd4y/NSQj73VMtMyxs3qQHFW/XV47CE/QArglKAJ2qrRc
	 QDjqqjNW2fbTm6YAaB2uiPU7YOOuNovhDx8aZVjjTTf2fYq0WAO9lniMn6WfUAkybi
	 VwQ1iuB/gNTn1H7AcARD3lIyUz0WiZKbp/UCdtwknKf5ml3kBi/Z5T799MKccWePyV
	 XPzGaHWbDNskLJ/IB9UYoXVdhBjmqENGkNRxINZIju9PmXz7cHwSXuuVXddD7uRIvk
	 smhZjk6kkpG0+3c52ZRmeoWBMuVIhbocGdC9+rvbxZ3oCQ3LQKEaW9nt5VU7fUpNt4
	 5y8Xt7UowDY7Q==
Date: Thu, 11 Apr 2024 09:06:09 -0500
From: Rob Herring <robh@kernel.org>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH] media: dt-bindings: media: add access-controllers to
 STM32MP25 video codecs
Message-ID: <171284436693.3504816.3115362318052404070.robh@kernel.org>
References: <20240410144222.714172-1-hugues.fruchet@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410144222.714172-1-hugues.fruchet@foss.st.com>


On Wed, 10 Apr 2024 16:42:22 +0200, Hugues Fruchet wrote:
> access-controllers is an optional property that allows a peripheral to
> refer to one or more domain access controller(s).
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> ---
>  .../devicetree/bindings/media/st,stm32mp25-video-codec.yaml   | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


