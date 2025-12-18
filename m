Return-Path: <linux-media+bounces-49054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B081CCAD9F
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 09:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD8A43015004
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 08:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4852D330309;
	Thu, 18 Dec 2025 08:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2haBVUp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E7D2F28F6;
	Thu, 18 Dec 2025 08:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045528; cv=none; b=rSBIH6J2JGe3aDkPVwqlLdaSHG445+18FY6WYN3fUbPnFR3KxyFKdMG4d0DacNy8ec57fs0S8f7asU49BBN23U04fDkF14PQe7gh6rc7DsH+Zf+iA33CDOXZkLZSX5Pf+Mn+N+MNOflAt6SaDsZjpeg3HH2HaPNNrww2IOkHvDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045528; c=relaxed/simple;
	bh=tAENq97QY94o/HjY4gGsFkA3IIyZ45d40LPKOlYkGSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X29gN2X8iyyjOuggjq3VY5pGyVeJ2ZyjeLkkakOBV8TWdTSe/HbGFZyDqt7/lT4aVShlPxP9nV+yz3VXqRDsSoui3Vhh7tgN2c5/8agwzL9S9vr+fN6fdINM4MUT4w/LrcC0boJ4s5b6JaZGTaMMtFRllC2/DO7JmwJzqAzcn2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2haBVUp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EEA1C113D0;
	Thu, 18 Dec 2025 08:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766045528;
	bh=tAENq97QY94o/HjY4gGsFkA3IIyZ45d40LPKOlYkGSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D2haBVUpcklAZdhVp5zSqRqqKCadoyZ7oAu0UjFseAz+IdqPh/uGZEyZloFhOvAVt
	 8GUpylf0RUZb51vRAMk0v40c5rbutV4I2Ev5NQ1B6IC+CKYdI6ge8U5uD8pTUa/caG
	 pkJ+CXA+T5nxpRt2AOWGQiLeD1xzpELKkFvgfMDozTzXZbJFuXfrhWpMID+RJdZY5f
	 Vx89JttJuBD/zfrRIDY1gWr/TZSaCpNmFAbC0TUbj/1I6FAhkxglAe+KUSia8xpLfK
	 NAawzCkcwjQ4ZwGSvf7SjT6HrQix8A4RKOCoXgfkA3K7HSPMa1Oz2N1r/3F6qWFjCx
	 zwoCg0Bih0S+A==
Date: Thu, 18 Dec 2025 09:12:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vikram Sharma <quic_vikramsa@quicinc.com>, Kapatrala Syed <akapatra@quicinc.com>, 
	Hariram Purushothaman <hariramp@quicinc.com>, Richard Acayan <mailingradian@gmail.com>, 
	Bryan O'Donoghue <bod@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Depeng Shao <quic_depengs@quicinc.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: dt-bindings: Correct camss VDDA PLL supply
 description
Message-ID: <20251218-fresh-fair-pigeon-aaeca0@quoll>
References: <20251216-docs-camss-fixes-v3-0-c238b6810771@ixit.cz>
 <20251216-docs-camss-fixes-v3-1-c238b6810771@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251216-docs-camss-fixes-v3-1-c238b6810771@ixit.cz>

On Tue, Dec 16, 2025 at 01:24:50PM +0100, David Heidelberg wrote:
> Usually, the supply is around 1.2 V, not 1.8 V. Rather remove mention of
> voltage from the description.

You did not remove the voltage. Anyway, both commits should be squashed.

> 
> Fixes: 849139d46d09 ("media: dt-bindings: media: camss: Fixup vdda regulator descriptions sdm845")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 2 +-
>  Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 2 +-
>  Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> index 019caa2b09c32..4986d18d1a2da 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -130,7 +130,7 @@ properties:
>  
>    vdda-pll-supply:
>      description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      1.2V regulator supply to CSIPHY IP blocks.

"...that supply is a regulator supply" so you still decided to go that
way. Why? I think I could not write this clearer.

Best regards,
Krzysztof


