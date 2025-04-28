Return-Path: <linux-media+bounces-31143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC59A9E981
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A590F7A3F23
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 07:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC571DE8BB;
	Mon, 28 Apr 2025 07:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHMg6fwu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEC53596F;
	Mon, 28 Apr 2025 07:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745825903; cv=none; b=RP7di/cPI+eTqCKWsCHMTCFND1eyeZwTzMAwgnqwaaxz1Eom64Ejj/D7O5EEnL4H7gsvlWQc+vttZF31ET2s3PTW1qygY9JW5a46aUhfxZ8LX1MNvRRXwTX0gNz3bRxmd7iPVxf57W04Z7wcOWS/eqr50kMb5ylllldqabOmjDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745825903; c=relaxed/simple;
	bh=VY0AB8rCEQdpSvuXBsJF3HV1v4GpXOc/HeARcm9R8IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XitFhghDDsXYudHiXNBWSkp0HygYQE5gaVXnHGnDiLMpXDZSHwgluCKMQbKiGdoE3du8JyFqwsaRuf2ikkqDp+o4d9Nt27pFPtGf7zTjptO4dsOhj5qQb+b2eJ63ij7qC9DJQcXpoes1B2i+bmMi4AptaD3IcJxGcjrYHI6bsHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHMg6fwu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7E4C4CEE4;
	Mon, 28 Apr 2025 07:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745825902;
	bh=VY0AB8rCEQdpSvuXBsJF3HV1v4GpXOc/HeARcm9R8IM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHMg6fwuiMQoyjs1xDa0O+wQ6NA2F29HpWvQ+rDBG7djichKEyed0YX3ve7Nt2L2J
	 KFSytths7FrYqakYwd9BbKESNEuYINr/+Jt5CdPrNqOS3zVQeOGxqEi2x/8cejeNew
	 760y4OEJYkCMClqNxwrTaAfTqpIq2BMDxbcXRxEHoq1/MSQ+qAEMx0r9l0USKtarM+
	 gzeUrqvRSDvfalxBST1grFTU/ivq67Z82sYQyQIAsO8nWlxFC26zCvo2Fp/TMM5OpX
	 f7SDgwK/KsNhf6QX4xbAcXza6RU1umVM4wSfMgYnvqVoBtCu9mfSlxuvSie/gw44ek
	 41Y9chvlbyTww==
Date: Mon, 28 Apr 2025 09:38:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, 
	cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC/WIP v2 3/9] media: dt-bindings: Add qcom,sa8775p-camss
Message-ID: <20250428-imperial-manul-of-aurora-ba1755@kuoka>
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
 <20250427070135.884623-4-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250427070135.884623-4-quic_vikramsa@quicinc.com>

On Sun, Apr 27, 2025 at 12:31:29PM GMT, Vikram Sharma wrote:
> Add bindings for qcom,sa8775p-camss to support the camera subsystem
> on SA8775P platform.

Describe the hardware, e.g. why this does not have supplies, why and how
this is different than all other camss.

> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  .../bindings/media/qcom,sa8775p-camss.yaml    | 352 ++++++++++++++++++
>  1 file changed, 352 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> 

With fixes in commit msg:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof


