Return-Path: <linux-media+bounces-26972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C57E6A447DB
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 18:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15D9F163D74
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 17:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D86919E83C;
	Tue, 25 Feb 2025 17:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPq6fe5m"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9543019F117;
	Tue, 25 Feb 2025 17:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740503712; cv=none; b=AWM+58ZK4suJ/0rOaIpR0Pvelct9QrWjcDnYfXzxIPUSUy+RLavZ7PpExg2BDv19uiiH5roB5w+dEzANA477vLIwTRka1xGulCe7CysDKYhQEwKqDpzm7RS01+8c9cG5G4ViKeTjf+f7hyo/Cle7bUhiPvTUA+nXwnjXUFkqmlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740503712; c=relaxed/simple;
	bh=TmJhw1XQJowNzPblNGM0D6qvHxlsRtYFF+ZL1fof74k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6j1hSizKfJ8B1QyN6YmattkuP79KhWY/h5NRsKQ9SO+HJrKqB2ZuVvKHP8nYGHV8j/hKHGNdU3D+Pe6JfghTU3qAF1jn1IZNqwQVCVsRmUA7M0C50PhDLHPWHC8Z11bjG2ggNS11iVn4iLuVeK/fx9InJNFr6/9ZXWOgqCFUlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPq6fe5m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511F1C4CEEA;
	Tue, 25 Feb 2025 17:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740503712;
	bh=TmJhw1XQJowNzPblNGM0D6qvHxlsRtYFF+ZL1fof74k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lPq6fe5myBn8j9khYpUgDVP99mEFRQ9sA4YMS1IQk9kNhB2Pit00/fCQnzwtc7iUA
	 GbTlkpmJSMqqJNd80ODmEi5LGOw2a9GDnfp51vq/1vU4C3zUtLzhdLeoAjKKcfqGlv
	 GnjbJqV7ppfYR/2dnrCeQzzMflMDG/N2naBfRIOc19omqcjM/TbDWxaPnl7hKy+DEG
	 EuaPw+JUUZss8MuXX8ZIVi0LKBnWj/DOMh2mIUdPQsyEQU5dj6CeIDfPlM5PMrz3/B
	 6xMZTaGSbSBLbi/VtH6P/VqSn7zLMC7YfXXo4eGMU7u4X99OatTKxEou9Ocom8gLDk
	 US/8A3WqONteA==
Date: Tue, 25 Feb 2025 11:15:10 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	linux-media@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: document
 SM8650 IRIS accelerator
Message-ID: <174050371025.2715689.10413778229138644951.robh@kernel.org>
References: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
 <20250225-topic-sm8x50-iris-v10-v1-1-128ef05d9665@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-topic-sm8x50-iris-v10-v1-1-128ef05d9665@linaro.org>


On Tue, 25 Feb 2025 10:05:09 +0100, Neil Armstrong wrote:
> Document the IRIS video decoder and encoder accelerator found in the
> SM8650 platform, it requires 2 more reset lines in addition to the
> properties required for the SM8550 platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/media/qcom,sm8550-iris.yaml           | 33 ++++++++++++++++++----
>  1 file changed, 28 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


