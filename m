Return-Path: <linux-media+bounces-31494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93330AA5DDD
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 13:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45D601BA781D
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 11:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0C9224246;
	Thu,  1 May 2025 11:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lO45Nz0e"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB8B19A;
	Thu,  1 May 2025 11:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746099460; cv=none; b=fC3Zw5BwSgWhQTEJw6pJTLqfEnXr03BdOtTSNbL6aGI89ziI4yjV317rMMnsBXIAlJMSL6AhrHX3FpUYN2/ZMnL4IJXBiE7f87l2+5Ec9gbQtqBlPu+orbio4GTVAk3DJ7FU9xOhbdUNhrF4DQvVCILA01ZBjZ1kz9pGpIFxvYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746099460; c=relaxed/simple;
	bh=yf6ch4SVdzLx//7ZbZ17MFN+texP/kjjiZ1NjD/hHgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkIud1yTHCjuTciq6ksPPgbZrjD6lSa4Jr9JnGmOjPUdT1ipN1FwHDAhFnMiMAysETrVAEWvIY7Ng3ECvtOtZmDnhc6sjtih3xrd5cEzWpQQCQCAiXyEfrflY9tYtJ7bqFG5CrjfVj2rc/TOHt1dGZQECNjgmoxzQou5G/Ra6P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lO45Nz0e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189E9C4CEE3;
	Thu,  1 May 2025 11:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746099459;
	bh=yf6ch4SVdzLx//7ZbZ17MFN+texP/kjjiZ1NjD/hHgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lO45Nz0edje3pqvPF7WTgjmiFAo7pESm74EKg+n061iRLVRwRVp1xhrhIoC+qma9s
	 7kW6uFgcFtzWYZp5OHPPSvpPBAlgjipueWgHw+OylY4769YgzXqS5WmwwFavbcPne6
	 EE/T+y3lN0oYWvYLz+kNe3W0EUiBtjwwQnZ9lBGpKEn4DN6OEdzDDyGZCG0Q8eBEgn
	 YHxVUlFVbw68/Sir2o4h3pd4aolS0Av063VU3smHtan0F40NZ/TIF2tSHdYku7fxxq
	 fommlxF+tPLGp/v7J2qLS4R/gpHCpLyauCRSykUb9GBp9dTJIzXgxbfvtTpaPH/3f7
	 eHu+C5xntUSJg==
Date: Thu, 1 May 2025 13:37:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/5] dt-bindings: media: qcom,sm8550-iris: document
 QCS8300 IRIS accelerator
Message-ID: <20250501-asparagus-hare-of-contentment-aaf3bb@kuoka>
References: <20250501-qcs8300_iris-v7-0-b229d5347990@quicinc.com>
 <20250501-qcs8300_iris-v7-1-b229d5347990@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250501-qcs8300_iris-v7-1-b229d5347990@quicinc.com>

On Thu, May 01, 2025 at 02:16:47AM GMT, Vikash Garodia wrote:
> Document the IRIS video decoder/encoder accelerator found in the QCS8300
> platform. It belongs to same iris v3 family as that of SM8550 but is a
> downscaled version of SM8550. It has 2 frame processing hardware blocks
> while SM8550 has 4. Thereby QCS8300 have fewer capabilities than those
> of SM8550.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
> This patch depends on patch
> https://lore.kernel.org/all/20250417-topic-sm8x50-iris-v10-v7-1-f020cb1d0e98@linaro.org/
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


