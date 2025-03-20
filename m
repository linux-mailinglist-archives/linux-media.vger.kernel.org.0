Return-Path: <linux-media+bounces-28519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DE3A6A1EE
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 09:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2D35173588
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 08:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3580B2206A3;
	Thu, 20 Mar 2025 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeL8Bq3Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8842421C17B;
	Thu, 20 Mar 2025 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742461011; cv=none; b=IeqA/3YplF9YZvZQmt/V02PCbLhvx/hzR2nQypiHE1E68gWkwSqNHABcMHrkycSsXOdS5bPMRrWaxEVhphqR9RF91vjHjN1dGHiTsRWwSSMuoWl60FHRbMwE5Dh/eztUcW0eMrUiXsCLfJs032KxK6KZfHh1ZzjIjZ/HO/uimps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742461011; c=relaxed/simple;
	bh=PgKzluOXpywM93OgKoxGMf2b7RfdyPjPkPIRtP7Nye0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVo8l/Wx/C8fW5fXDzKOsUcgdrqqBk3BnmEO9dgpFUg3YS7NLV+7mZEd04R00f9561TrarOZt9iS3g+KoMaio1XI62r5emUWBe6YhvLRGKC99YQxuo4Nhenv6wjeZT7SCRuWDaZ6kjcm8WI33mxfbugK1V3uI73vlfv7YC28mGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeL8Bq3Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F743C4CEDD;
	Thu, 20 Mar 2025 08:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742461011;
	bh=PgKzluOXpywM93OgKoxGMf2b7RfdyPjPkPIRtP7Nye0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oeL8Bq3ZXzj1Al3jIc3KeNKkDUj+eQ+CEbfR4qRpzyGoW3GGz9guwBpuDxpIaXxhG
	 xA+6SoKphlcwbwlmEnGhzwO2cixBiZkpFcD4ppxlQbXkA7NRTQIuoRu+7/WlXuqVHs
	 kX0UIIAuWYuKz6NLNO7LvmiZ+/k1y4v24TyDIDfN/QIA6jDULfdHnq1VLJQRkt/3m8
	 E7jyYPPBlD1kF2xhHrpaXdSzUM+cMF972f9VpgnYp8ifFyR5XWSV7hyJtcqbZLBZwv
	 ya+T3BO8/GO2vllca/BeLB+9uYTGyfgM9MBir2gOlY4ZE/7xGoTuECDCgUCpma465D
	 /5ZraTiqafLnA==
Date: Thu, 20 Mar 2025 09:56:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sumit.garg@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] dt-bindings: media: qcom,sm8550-iris: document
 SA8775p IRIS accelerator
Message-ID: <20250320-rose-trout-of-bliss-dbc0c2@krzk-bin>
References: <20250320-dtbinding-v2-0-8d8eaa4e76cc@quicinc.com>
 <20250320-dtbinding-v2-1-8d8eaa4e76cc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250320-dtbinding-v2-1-8d8eaa4e76cc@quicinc.com>

On Thu, Mar 20, 2025 at 08:24:29AM +0530, Vikash Garodia wrote:
> Document the IRIS video decoder and encoder accelerator found in the
> SA8775p platform. SA8775p and SM8550 are irisv3 with same core and
> bindings, hence SA8775p is made fallback to SM8550.
> QCS8300 is a downscaled version of irisv3 and have different hardware
> capabilities. SM8650 is an irisv3 with different (higher) number of
> reset lines compared to SM8550. QCS8300 is yet to come in future
> posting, while SM8650 is posted as
> https://lore.kernel.org/all/20250305-topic-sm8x50-iris-v10-v2-1-bd65a3fc099e@linaro.org/
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


