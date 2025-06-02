Return-Path: <linux-media+bounces-33875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6730BACAA5F
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 10:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A5763A814E
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 08:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3801CAA6D;
	Mon,  2 Jun 2025 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKDEh6kP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1420F1DA3D;
	Mon,  2 Jun 2025 08:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748851599; cv=none; b=RCPbdXHoVelzQSPqF0zeY+2PpFNp8sZsVY/uQfq7VbRAjENeCHFAXP223IBpBbMywfOawViB1UmnDG5OJ+S7B4iFLXRO0oaEfhH3Rip6J0a9NKHxqI/+fvegCXNZIfQCFXpwM7+s1NO17cFXxfGaOQVoXf8XxuqcjOMidAFz/Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748851599; c=relaxed/simple;
	bh=81Z8tfMpTp2khfenMkoE2E+0eYtAYi/kqrmmE7OdeQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elUNt4/ZjQ57aJU5ShvARGw4dzHWSHL/ORQvrh+omL0iy5OGYDE8j8NdtbNN+ZQsiMcSqWAVj8R5g+wNmRl09LklBCxWUtqv+2A51A7eTxeN5I5Iyb32Es3QlnHvEQHEzKLQy98U+mmf5Dx/IagUnuBeEDuNeKGbzxFS39PlQ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKDEh6kP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDFA9C4CEEB;
	Mon,  2 Jun 2025 08:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748851598;
	bh=81Z8tfMpTp2khfenMkoE2E+0eYtAYi/kqrmmE7OdeQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UKDEh6kP29qdlvJxnqq3WTbQO98e+8xmT6t+esgASeJxq8Zzpopv968q7KWpRrSIB
	 01SEWfxh4st59s9dMjG7jDoJo15LclVKEx/pIe3Xhy96FM8HFFfRz3nmvFdYJs3J3f
	 4gQaCHyrb0hOinI0EAXdvuD+2CgfH5JAnb6x0bIUnBPqv2INeKX0jUCujccJWbmrCt
	 y88y1+xQG36zb2cveIBn0qIrOAf3hfSFnM5VWt/g6m4HmTqIWTAojXkqDEic6+NBhj
	 Agcogl+1NbXxLemdYKwlnQ7bn7wEZZ0hY4vTuMGcKCrQIJd8QbJk6zDUrC0s16+xI6
	 c6aTxIQ4hTvag==
Date: Mon, 2 Jun 2025 10:06:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Knecht <vincent.knecht@mailoo.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 3/4] media: dt-bindings: Add qcom,msm8939-camss
Message-ID: <20250602-urban-spiffy-gharial-6bed7c@kuoka>
References: <20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org>
 <20250530-camss-8x39-vbif-v3-3-fc91d15bb5d6@mailoo.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-camss-8x39-vbif-v3-3-fc91d15bb5d6@mailoo.org>

On Fri, May 30, 2025 at 11:00:06AM GMT, Vincent Knecht wrote:
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: ispif
> +      - const: vfe0
> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: VFE GDSC - Video Front End, Global Distributed Switch Controller.

Wrap according to Linux coding style, so at 80.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


