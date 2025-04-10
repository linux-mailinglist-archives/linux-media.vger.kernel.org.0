Return-Path: <linux-media+bounces-29869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A17A839E5
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE68219E3523
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC9C204F60;
	Thu, 10 Apr 2025 06:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqEnuwia"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3251CA84;
	Thu, 10 Apr 2025 06:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267857; cv=none; b=QfTFml2tv7/Jtgy373DJVBdF1GS+kNRQuIW9sgX3IqAY5qKw97CUnAC3D4N6VsriEmKjco/2MuyPjGGNGgt0DYRSkp1DmT9DDQitoO13eqjjQ/OfgJOfisdNODbPzmjuEaLHVHRXNFU+YhntlvzlhYvHZKVBtLXN6V4mWdC35Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267857; c=relaxed/simple;
	bh=oVVypfIZykbJEQUFj6tpG/UltoN/4XMwbZYbd2kQ7kI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mj6yagRU5mUPSRVfUuec8z2+xq9GZkuEL1gzP909xPQ9k8/qtelOOg0s+gtt3EpqhcFgmk6IMUEubSZ06NTc8Caw9cooViFcx2N0Pc9TP0K24y64yGV3+qbpUezFOTjooGgtINZIv1cC7dYHJHl7r0PjuPxyp1nWLxXmKGB6k5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqEnuwia; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140FBC4CEDD;
	Thu, 10 Apr 2025 06:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744267857;
	bh=oVVypfIZykbJEQUFj6tpG/UltoN/4XMwbZYbd2kQ7kI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gqEnuwiaej19DrqZe+DtruKMOvFDBPrz1QRZkGnfR90J82xJFUK/V19L5osLCbaP+
	 8J8881p+fwLJIpI6i7PeJ0ICDTnWhsaikSxkITW+wgsCG1vLtfEFCBSks8iIXcOVGj
	 SvSqJvpID3Fh8JNzSgvKzFeBfgXVpA3qeZ/aAnnQ1PPtZVyYd8XmrNH/79BHrGM24l
	 QaCUtSkXya7xNbjO+/Yh7dmQSjzoRAsqb3VEKiMExDrMEI1rxKJBCI8BKtzrsFgKvi
	 MqT2Og637tuyWSzGO1UAaTWJMydMFn42WSciFXVtXS3iiWRXWWs4tt+XlJF0dl/TaQ
	 6pkfMcPXOZClA==
Date: Thu, 10 Apr 2025 08:50:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] media: dt-bindings: Document Tegra186 and
 Tegra194 cec
Message-ID: <20250410-hallowed-poised-copperhead-eedc4d@shite>
References: <20250409-tegra-cec-v3-0-91640131dfa2@gmail.com>
 <20250409-tegra-cec-v3-1-91640131dfa2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250409-tegra-cec-v3-1-91640131dfa2@gmail.com>

On Wed, Apr 09, 2025 at 05:57:22PM GMT, Aaron Kling wrote:
> These are already used in device trees, so describe them here. As the
> driver only declares up through Tegra210, these must use a fallback
> compatible of tegra210-cec.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  .../bindings/media/cec/nvidia,tegra114-cec.yaml           | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
> index a6b73498bc217a2e884e31af91e9d8845c9b1d76..3637fe2dfbd0dbb1baf265d7c128954df8faf740 100644
> --- a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
> +++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
> @@ -14,10 +14,17 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - nvidia,tegra114-cec
> -      - nvidia,tegra124-cec
> -      - nvidia,tegra210-cec
> +    oneOf:
> +      - items:

That's just enum. Drop items and de-indent by two.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


