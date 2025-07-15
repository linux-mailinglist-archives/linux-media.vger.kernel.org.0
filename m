Return-Path: <linux-media+bounces-37724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D297B04F79
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 05:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B81273B2983
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 03:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70012D1F68;
	Tue, 15 Jul 2025 03:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgLhBWlZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4323E22083;
	Tue, 15 Jul 2025 03:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752551247; cv=none; b=Zlyy8v+gcORVabX1UQQFQE4twme0N9KLY314mDEpuSOryArn5uQc7KKYtWIAQ1F6XXpKs+ojt7F5SxQPMfhmvBhCbmY3VGZpSGGqFEMqhzPPjScZBVVd770qbdMx07G0YR3vWFjdHKTY+HoHokIjbT1BZhtlE+hHEgjnnsF2JAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752551247; c=relaxed/simple;
	bh=12yOS5w3zvP7gRZYvJwK3Olm8xl1UxeySSyPh3qCq0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXmnMYQmLp3awChJzK/aAW6D3O9oQQOEqb8WRxCRxnJCd+a/F2+owwQhLjIFChzpR2SBGiHBqXO2mLg/lX7n1h5fo+4ct3IOQb1szzEtOwiPhS3pwpmqY6mGUh7KCb7j/jxyG3O8KXQOUOaNXvji7b9or0kL/PAYBA8364c0lAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgLhBWlZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96D2C4CEE3;
	Tue, 15 Jul 2025 03:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752551246;
	bh=12yOS5w3zvP7gRZYvJwK3Olm8xl1UxeySSyPh3qCq0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgLhBWlZ2Mauehpu8aGzF9KrmtJoSurEm8hH2749q20I71P40MH0aPd/WfsQhYz6N
	 +G/YTFIuA3n8eLcLCCahDqqRuuVuNS57Op6cc63aLSR2h9e1poed9vzmfjpGfB5+0V
	 YbGk7le0pFjUfR+Z98zX+QYEHL4IITqH5lr4JhxdZHujOLur/MDcu0PqmIVoMiE38p
	 fn6c08VISRiUbo36RksMMtq01q44GRaSziX4ubdWgkpSBP2AERljiam43mw9o1nueD
	 aPoCF2PSnSRQ8mVP2NikcGARYWGyR0w6tCZnhaArAxjfwp/MWg7unRzXu5GXkA3p56
	 pHCTFhMnlr/Lw==
Date: Mon, 14 Jul 2025 22:47:25 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: dt-bindings: qcom,sm8550-iris: Add SM8750
 video codec
Message-ID: <20250715034725.GA1691-robh@kernel.org>
References: <20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org>
 <20250714-sm8750-iris-v1-1-3006293a5bc7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714-sm8750-iris-v1-1-3006293a5bc7@linaro.org>

On Mon, Jul 14, 2025 at 03:41:16PM +0200, Krzysztof Kozlowski wrote:
> Add binding for Qualcom SM8750 Iris video codec, which comes with
> significantly different powering up sequence than previous SM8650, thus
> different clocks and resets.  For consistency keep existing clock and
> clock-names naming, so the list shares common part.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/media/qcom,sm8750-iris.yaml           | 186 +++++++++++++++++++++
>  1 file changed, 186 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e767ebae7c4022d406d61a7bf606b8d878d8632e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
> @@ -0,0 +1,186 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8750-iris.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8750 SpC Iris video encoder and decoder

SpC? Or SoC...

With that defined or fixed,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


