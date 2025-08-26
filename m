Return-Path: <linux-media+bounces-41094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C0DB375B3
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 01:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBE9F5E5482
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 23:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85C73093C0;
	Tue, 26 Aug 2025 23:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vk5n5MEX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4554523D2BF;
	Tue, 26 Aug 2025 23:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756252257; cv=none; b=SB2s/EGimE9ZG9IjG1ut5Y4E/bJZ1vhNla6p16nkPWoEVg4YFQ2o0yeYqyEWStKvmczgb7XYlhEjUP47nNpFGq493BYvr4/VvwJdbRsowY465eurx6Og3MbwRD9tT1idx3NTPzAZbENL9De+6VF/YMyI32tHC6flrgybsZ6Fhds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756252257; c=relaxed/simple;
	bh=lmPIQHj97yNIhaJJlqQ3GFTleKcI3fD/V55DcCosUko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CifG1asv83CmFueuT8J3MtOixw7/6DGC39u0pUV5THgMBJyZBQppdfXGT5wMTTursFKyAw+SEG6OXHDImmB2nDEnA6/J3QGX2pyns379YleGw9VMm4N2xYij1c3/ls1s5H+uOlv87gUm2N752bNcB8rG0P7UFx9IPbx2iLUiTXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vk5n5MEX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2D5C4CEF1;
	Tue, 26 Aug 2025 23:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756252256;
	bh=lmPIQHj97yNIhaJJlqQ3GFTleKcI3fD/V55DcCosUko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vk5n5MEXq8hdXCt0OCvzmjK2+0f8EpjvbOxmlYU9r+Tczu7L8ig0isJ0PD0Q8jSw5
	 I9OsVM/gAVfmv1zvouq1KDeYY+bbKr3cuv84xPQZIRmOKo0+932cmLXyXDgxi3XIRG
	 DL+2XLb7L8U1xNsD123FZs2loXlUZygdko4qPFErM7k5aJyxi7520QLmNdnCEPsXjK
	 8PMd1RsXY6MeWqjTCM1GM+q5Z36WiJOL0ZYPcQ6ip+EbbEGXHyUGl2CXbGYuhPIj2l
	 JSr+0Dd6NfOEP0oJ2GXdu9EmDdJiHpdmkgudbCMGnmKcCCqs4Gw7pqfyW3Dxv7keQ6
	 6+5vutDGnb4xQ==
Date: Tue, 26 Aug 2025 18:50:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-media@vger.kernel.org,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH] media: dt-bindings: qcom,sm8550-iris: Do not reference
 legacy venus properties
Message-ID: <175625225420.764544.3673891026777851561.robh@kernel.org>
References: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>


On Sat, 23 Aug 2025 17:53:50 +0200, Krzysztof Kozlowski wrote:
> The Qualcomm SoC Iris video codec is an evolution of previous Venus and
> it comes with its own Iris Linux drivers.  These new drivers were
> accepted under condition they actually improve state of afairs, instead
> of duplicating old, legacy solutions.
> 
> Unfortunately binding still references common parts of Venus without
> actual need and benefit.  For example Iris does not use fake
> "video-firmware" device node (fake because there is no actual device
> underlying it and it was added only to work around some Linux issues
> with IOMMU mappings).
> 
> Stop referencing venus-common schema in the new Qualcomm Iris bindings
> and move all necessary properties, except unused "video-firmware" (no
> driver usage, no DTS).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/media/qcom,sm8550-iris.yaml | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


