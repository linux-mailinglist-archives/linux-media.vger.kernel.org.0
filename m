Return-Path: <linux-media+bounces-20901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 807469BC899
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 10:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 385AF1F2257A
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 09:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EBD1CF5EE;
	Tue,  5 Nov 2024 09:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vAAUVxUO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A457918F2F7;
	Tue,  5 Nov 2024 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730797503; cv=none; b=HqbO2fK83OCJj5e4RVmKWiHHNSZtnhnfABLoO8miLC7tx5PtRZJNqNwYWRG9x7avGw7+bYty5AXOrZau0n79esIqzL2R0slzRt/kRhG7AyS0puf+G170N+EXSrJ2YlLwoOTFTy9fH5urpgkIBCAwKcouzm2Pb02s6BrbC1FYXSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730797503; c=relaxed/simple;
	bh=UnwmGlzFhaYNeqG3ngovYpYoNCY9R17OMQumYyjWslw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Htu+slORy7ejdlu9138lJp1b4bHBjaOGmMo9X1rXfy10Wsy/ERA3hUf6yKk6+qACPeKNahQkd8xZyR/vtUsEcbmwXMwcVTNM0pcPnV198s9/lolEsHQBBGd3RIw0UZ8uWyfDPKRgtqqHHZqGq23fV9mymaGhNegMBaM6mmm4nbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vAAUVxUO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E660C4CECF;
	Tue,  5 Nov 2024 09:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730797503;
	bh=UnwmGlzFhaYNeqG3ngovYpYoNCY9R17OMQumYyjWslw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vAAUVxUOMfTvV6MaF23c1TmprwEH5rQs2leIXYBwpH4/W5u8GI5xtMUDYhEwUwyWr
	 f4r6lNMsKUlfphfeH9nFw1QdrdGpoBRLqM97pGmLI1Y3H9sr3XZJo5QJieKJzEaKcC
	 m2AyRAZWXNgmn6aI3UpNE8gYEtzxh3K8/P+RgBJ/luHNxVpEEOOx2dytYY96LXndzV
	 +SJX6Ev65VdWWtst5NMZHg/xrnLG+Ns2ajpQBCUZpN03GVFyZkt1KjXdSkMK0QdiJs
	 AfJtEtDq+PsRQGYg/qdbBNJPqbMIAUMCeJC/HAHukGCP9Cnvrh+UobBmXQtGvFYZK3
	 jTtAT8EnlxFUg==
Date: Tue, 5 Nov 2024 10:04:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 02/15] dt-bindings: media: add description of stm32 csi
Message-ID: <pp3t7we3niohooaiubs5l2grsobzgrcrc5gmt5ea7fmj6sbmpc@nvnviojusrxk>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
 <20241105-csi_dcmipp_mp25-v2-2-b9fc8a7273c2@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-2-b9fc8a7273c2@foss.st.com>

On Tue, Nov 05, 2024 at 08:49:05AM +0100, Alain Volmat wrote:
> Add the stm32 csi controller description.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> v2:
>   - rename into st,stm32mp25-csi.yaml to match compatible
>   - correct port / data-lanes (remove useless lines &
>     use data-lanes 1 and 2 instead of 0 and 1)
>   - correct commit log
> ---
>  .../bindings/media/st,stm32mp25-csi.yaml           | 125 +++++++++++++++++++++
>  1 file changed, 125 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


