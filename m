Return-Path: <linux-media+bounces-36050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B38E0AEAAE0
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 01:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23370171419
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 23:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5D5227E95;
	Thu, 26 Jun 2025 23:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6oPoIEJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29551459FA;
	Thu, 26 Jun 2025 23:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750981869; cv=none; b=Sazv9x2G0LAJ3tSBQQqhr3TXVYe2RtZ4n4C5+EmL0dU+hqg6urdOlEO4yca5Gy8r/Cq7rVj82JmyoUW+tswsCcE03dHCXQLNZ0RoHoUmgX1zLBsnHyEIHVBkMnyFS7Nd9mkvwj2PIRYpK2g1+z4WCy5OTr5m7g/1mAQD2DDilMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750981869; c=relaxed/simple;
	bh=dnZDvgvXkqDpB+K8ypkKIzt/PFMZxhfCHTn2OwUAh7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvdi3Y6Cbtsh8CwDWrn+W0FJqljSh8nrOrc8nmtoHdWXNZfUkeGY6emrLklM0Y+ZrKWfMCp4q2HSeF0ZMM0EVCoFN08llb3DPLDJdELVOhPS83HqlNDVp2sonnKxgrMH036i1kU+fVRqVazOliXWW4yhfcEoYJFdDGu7+EA9N9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6oPoIEJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF95C4CEEB;
	Thu, 26 Jun 2025 23:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750981869;
	bh=dnZDvgvXkqDpB+K8ypkKIzt/PFMZxhfCHTn2OwUAh7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n6oPoIEJN7lPnN50dWvOR4aWMLIgsMHNgZ4MNTYcM2DGuLE+IVCXelk6JvZtLL2xZ
	 uNfRZ275pCZ4gJqkyZhipSYZsXybP3beLrj3CB5MRWjLB8ezuq9johbi405kbzsMib
	 UJX4hvp8V1Ejj1mv8MNQHIbsjGskYYasHqpNVeUNJ/GV/FfpPW4s+VUBpsMQHjj5m1
	 h8qO7lu3YY3jPpi14pps9MBMnANN4r+T32Wr2BS2mXNPlS+An1ciU35PEfQa4f03Px
	 ACIVLP6JkJt1hyEeInW4CAPoQiwX8gt+/DukSZYY4njiM04CRdQ9PJ3ZZfBWMmOZR3
	 q2cLNmqFfF9JQ==
Date: Thu, 26 Jun 2025 18:51:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanimir Varbanov <stanimir.varbanov@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH] media: dt-bindings: qcom,venus: Allow OPP specifics
 universally
Message-ID: <175098186786.1427476.5495448668705328963.robh@kernel.org>
References: <20250614-topic-venus_opp-v1-1-5ec6f64f395d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614-topic-venus_opp-v1-1-5ec6f64f395d@oss.qualcomm.com>


On Sat, 14 Jun 2025 22:05:09 +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> All venus hardware has a number of OPPs, so it only makes sense to
> commonize the allowing of operating-points-v2/opp-table. Do so.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml    | 4 ----
>  Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml    | 4 ----
>  Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml | 4 ----
>  Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml    | 4 ----
>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml     | 5 -----
>  Documentation/devicetree/bindings/media/qcom,venus-common.yaml    | 4 ++++
>  6 files changed, 4 insertions(+), 21 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


