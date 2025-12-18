Return-Path: <linux-media+bounces-49053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBEDCCAD06
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 09:14:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01BAA30AD683
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 08:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6A72EC558;
	Thu, 18 Dec 2025 08:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7lIiraF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA77128371;
	Thu, 18 Dec 2025 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045413; cv=none; b=Y/xVTrQX2Besu9V55qyyw0fhy70boAkvuGLQSeg5Lr1QKDqMMqKUqvhVN875T+VBlaiu83ywgI5/oXMj7hjN2rMlDtgEqfMfC+ZIsjhvC90aWAY7el863ncVKkh2qU4DBp4lyItzkrAy4dns9wgU1d/6kXSe8a20s7CUdyD4II8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045413; c=relaxed/simple;
	bh=1kawf6/eHWUgOrQBkscyWGShgWyUf9Rvwpy3U+sycYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bp54sLc+afz/B/T1ncnhq5002XjyvOYF+DmdbU92aS9tvG2bHtlm2cwAwOJelQ5eJRhpqlowrJAReGvUzON3oGWlmKlaXCaWeCssjnvqlJdQijFfbQ5z2/oDryhTUoSwfX3Vm5omBp92A0XzKfaSKyrLT6RvVXCJy+cIGG/4QZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7lIiraF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5826C4CEFB;
	Thu, 18 Dec 2025 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766045412;
	bh=1kawf6/eHWUgOrQBkscyWGShgWyUf9Rvwpy3U+sycYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E7lIiraFORtkaLk8lIRzlpyJUqtjWxCeECGyL1TuDB2kfAunHquRAnH4923U1NUEv
	 UiTZaRSLkuzVAR0Dmr2DNnfAUFCu3uWIWgLETNWfFD2a9ZB+pEtGPxzeLK/NyO8Mbm
	 xnbe3xayRrF6uAIQxqWaAKCzldu0qpIhpIEqJ5x7y4HYkWSFHLR3tv/74WGtbTfgkr
	 KOahoWan1lEKmBkl1FB+KE7OS5VyJweyQP8BjQiUX7+cfAcoO8yLUdsvC6dYX2pbzM
	 dNhhdQPwRlAlPXPpJdgmDBN3GTd1chqWahTfTMEFZrLTYCcXkRYkdsa8+yxkzwEr6O
	 9o7NNP/gnKdow==
Date: Thu, 18 Dec 2025 09:10:09 +0100
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
Subject: Re: [PATCH v3 2/2] media: dt-bindings: Update camss VDDA PHY supply
 description
Message-ID: <20251218-amigurumi-adder-of-snow-76e343@quoll>
References: <20251216-docs-camss-fixes-v3-0-c238b6810771@ixit.cz>
 <20251216-docs-camss-fixes-v3-2-c238b6810771@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251216-docs-camss-fixes-v3-2-c238b6810771@ixit.cz>

On Tue, Dec 16, 2025 at 01:24:51PM +0100, David Heidelberg wrote:
> Usually, the supply is around 0.875 - 0.88 V. Include the information
> same as is already done for more recent camss dt-bindings.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 2 +-
>  Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 2 +-
>  Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml   | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> index 4986d18d1a2da..5c47a2cf220fb 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -126,7 +126,7 @@ properties:
>  
>    vdda-phy-supply:
>      description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V regulator supply to CSIPHY IP blocks.

As I said, this is just a supply, not a "regulator supply". I gave you
justification for this. This is completely unimportant but I just wonder
why even that direct instruction has to be ignored.

Best regards,
Krzysztof


