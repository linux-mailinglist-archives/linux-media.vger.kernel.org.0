Return-Path: <linux-media+bounces-30688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6890AA963F7
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 11:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1AF4176088
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 09:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BEB1EF0AA;
	Tue, 22 Apr 2025 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fItYFOUB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189271EFF8E;
	Tue, 22 Apr 2025 09:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745313311; cv=none; b=GcxPLWhZ1SjwsjYHXeKj1APeb0TW0RO2iDKQOmJTm2cCA9Y0+zA+0t0rB1bDB+bn0h4nlu/y4WWgn8Dmat/6UbLbVD5D1GDVGuanWi9ypa82+YEOeNHzv3Fn8IvndQldVfZvLVXaK2mhZlHr73Qfz7lZOgHA8pgfyreFxBseQFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745313311; c=relaxed/simple;
	bh=vFat0su/4X5yP1ZpaEZzgKt0hc7bkHOFHvaRVkfn9OI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJBI3GvtQEXLGYI0gjl4q9pRX3igFtxj8WQue4v4KHV10Y2zG9Mapk5Am8T/o4lk3DhnSYAdb5/lteannaHhu4K5teEm2LdgvdwfdcOWCsJ+qfa5L6bIIWdnQfvE+HnSqtK03rdGEy3HnlfUVbinJeBHfrW60cygekreIb+Dt2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fItYFOUB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88767C4CEE9;
	Tue, 22 Apr 2025 09:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745313310;
	bh=vFat0su/4X5yP1ZpaEZzgKt0hc7bkHOFHvaRVkfn9OI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fItYFOUBxL6mdje/VfZQ1pv1ekKhU7midy//z+ARxoMiwgjYn1OReMDpshtbFL/fC
	 zjKOYiPDZPEg7aWqvZWDoen4KpmsFRXdoorUD8BkdzGff7Qy0zIK6x7+WZObRbiY0X
	 DiB6u/wqYqZtMJxGlOp6z5as4zfjFxphjni2nBfZH2j4L1y9joT/Ox2JpTPVvdC/Hv
	 G6B7+hFSgB3Z0aBw5FQbAtwmIfcPrxZ7jFoFkZXY2kLJRB150ItKgkE0L1BaxsifDJ
	 EEwjF7QIPBmUm6/QvTEmQPJSfogjNb4UJuselZsMCUTp3KglyhiCQ5FmHgHFbr4ma6
	 1xykwWt0EGRzQ==
Date: Tue, 22 Apr 2025 11:15:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org, 
	andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v3 5/6] media: dt-bindings: media: camss: Add
 qcom,qcm2290-camss binding
Message-ID: <20250422-nonchalant-bald-mink-7c2d34@kuoka>
References: <20250418141147.205179-1-loic.poulain@oss.qualcomm.com>
 <20250418141147.205179-6-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250418141147.205179-6-loic.poulain@oss.qualcomm.com>

On Fri, Apr 18, 2025 at 04:11:46PM GMT, Loic Poulain wrote:
> Add bindings for qcom,qcm2290-camss in order to support the camera
> subsystem found in the Qualcomm Robotics RB1 Platform (QRB2210).
> 

Just one subject prefix media. No need for two. See DT submitting
patches.

> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,qcm2290-camss.yaml    | 243 ++++++++++++++++++
>  1 file changed, 243 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
>

...

> +  interconnects:
> +    maxItems: 3
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +      - const: sf_mnoc
> +
> +  iommus:
> +    maxItems: 4
> +
> +  power-domains:
> +    items:
> +      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
> +
> +  vdda-csiphy-1p2-supply:

Why isn't this named vdd-phy-supply like in every other binding?

> +    description:
> +      Phandle to a 1.2V regulator supply to CSI PHYs.
> +
> +  vdda-pll-1p8-supply:

Similar question.

> +    description:
> +      Phandle to 1.8V regulator supply to CAMSS refclk pll block.

Best regards,
Krzysztof


