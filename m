Return-Path: <linux-media+bounces-50651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D348DD1D34D
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 09:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E3503027E2E
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 08:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EAC3793B5;
	Wed, 14 Jan 2026 08:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e856R4uv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4C436B041;
	Wed, 14 Jan 2026 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768379970; cv=none; b=pqlRO6f4TF7ppMN/duG5RuP545e6NcKFEmqbGpmu+rOi9TCweDEtkA2Ywm9t7FItZBwBGrQ9H6f7bdM0hLXZEjNO8yqD+vVXBQVFRPO9BOf22YQTvRBaSmeBLifoXbn3DIs58igI3gjramraeikrE5hsruyhpFCTA3GRZNGpvzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768379970; c=relaxed/simple;
	bh=614IsgCyPrC+LANiDqdeChyqdIK7swwNyY/uFwv4C6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/n9Noym4NJtugI33/zdWb3Ng+QYiLijgSOAztk5Q7ebuFyM0KUxr45/VSB1D1+SUZrrfx3mr8e5MAYXCD8JKpZy3LEv2wN7IYiwlzprkR+h+3DKX5G5aYMGT1152fmji7XsLkUqiNtsvXvbb2EMQIbetHxkshxc+9iNXr9QXNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e856R4uv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29840C4CEF7;
	Wed, 14 Jan 2026 08:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768379970;
	bh=614IsgCyPrC+LANiDqdeChyqdIK7swwNyY/uFwv4C6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e856R4uvDxkboLVICMNt/fAINa0TyYVejMcXnjghiNZ0AQRBaS1ciOdjzAlDXdzGC
	 jGrLM0wujXr3Nr1TYa5mBxXcvIPaN/aze2dsmi28pS2MyKO8JOsqcDt9eAh+td72Nh
	 zhOzPD4uCJdWO2+IPC6mpyQefb2FK5DSlVoA8SvBE/7j+PYlRZjYirwGCIHOY2fp/W
	 2L8ABT3nYa/lPLzzzln1C4gL63ayMpwKeQdWrWSFS6kc4VK+DDtSbpsxNiVfw3cizs
	 VmaslcIlOSg56vTBzarXR0QaSJiNYlUFlybJLisDEZXP28Ud77fc4s32ldn8Tnx2JT
	 nMMmxqSEoLffA==
Date: Wed, 14 Jan 2026 09:39:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com, 
	Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/5] media: dt-bindings: Add CAMSS device for SM8750
Message-ID: <20260114-notorious-bison-of-wholeness-0da70f@quoll>
References: <20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com>
 <20260113-sm8750-camss-v2-1-e5487b98eada@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113-sm8750-camss-v2-1-e5487b98eada@oss.qualcomm.com>

On Tue, Jan 13, 2026 at 02:28:27AM -0800, Hangxiang Ma wrote:
> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm SM8750 platform.
> 
> The SM8750 platform provides:
> 
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 6 x CSIPHY (CSI Physical Layer)
> - 2 x ICP (Image Control Processor)
> - 1 x IPE (Image Processing Engine)
> - 2 x JPEG DMA & Downscaler
> - 2 x JPEG Encoder
> - 1 x OFE (Offline Front End)
> - 5 x RT CDM (Camera Data Mover)
> - 3 x TPG (Test Pattern Generator)
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8750-camss.yaml          | 663 +++++++++++++++++++++

Why are you changing the change IDs?

b4 diff '20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com'
Grabbing thread from lore.kernel.org/all/20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com/t.mbox.gz
Checking for older revisions
Grabbing search results from lore.kernel.org
---
Analyzing 8 messages in the thread
Could not find lower series to compare against.

Look at your v1 b4 data. Now look at this one. This is completely messed
up process, not how you are suppose to use b4.

You make it difficult for us to handle your patch and I do not see
reason why this should be my cost.


Best regards,
Krzysztof


