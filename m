Return-Path: <linux-media+bounces-43849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF13BC1BD2
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 16:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB2D73E0D5A
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 14:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2572E0B6A;
	Tue,  7 Oct 2025 14:29:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D741C374EA;
	Tue,  7 Oct 2025 14:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759847360; cv=none; b=MMlfwCHSz3e0PZQuRZw0UCzqf3FxIByw8wuQCY/ky5zZLHey66QIyqVthuzUjUz1q+oNAvLBabWMTn/p40/52XcRL4NjjzOy5rqRgJxS5+YwQCIuBAM0YUS14kobtC17K/g+m19ufF5pYQVJWCVCZ4biAXMz6bnFcgR/kKSe548=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759847360; c=relaxed/simple;
	bh=9zdzdiSbReLiHjOrB2FVlA5yCnyfiEyGSkl/V8mRsKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSQ24dPZZGDHXBvFT4pN/+Cgq2ANZ+dOxPwKMzUF/d/a0QZKaa/R5x/Si/3j2q8vTkh08jQcikFXsduJPopo25blgTHHAlWmoaziUZzzMMx0hiKCGxlKc3J6d1PtitY5IgTcC7V6p4A67E0sdXY42jOaxPdnesqL6+UEJgGL3JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFFAC4CEF9;
	Tue,  7 Oct 2025 14:29:16 +0000 (UTC)
Message-ID: <10a8ccda-4e27-4b06-9a0e-608d6ade5354@nxsw.ie>
Date: Tue, 7 Oct 2025 15:29:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Bryan O'Donoghue <bod@kernel.org>,
 Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
 <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
 <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
 <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
 <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
 <2hh3zkdwgqbdurpr4tibr3gjat6arwl3dd3gxakdaagafwjdrm@aj5em4tbsjen>
 <Ujyoj3HGLVFhS2b0XzcYAMjSiCAuO-lSJ8PMEQLOaaX83tk_0D5zjrL0VDyZAmD3i4zLB3ElKSZBltISb5jJHA==@protonmail.internalid>
 <4a32bbec-2baf-4210-a7c1-1ddcd45d30c8@oss.qualcomm.com>
 <SuwJuCIcLVJwN3YeN1il6tB9wO9OH6bYcnbRpxpuI9Dl7piYLN-hVdnyv0Mal6N-W5pi2aCZI8MxHZDEkoE63A==@protonmail.internalid>
 <4d87d1ca-55b2-426e-aa73-e3fd8c6fe7bd@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <4d87d1ca-55b2-426e-aa73-e3fd8c6fe7bd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2025 15:25, Bryan O'Donoghue wrote:
> Rob suggested using an implicit index for function id
> 
> https://lore.kernel.org/all/CAL_JsqK9waZK=i+ov0jV- 
> PonWSfddwHvE94Q+pks4zAEtKc+yg@mail.gmail.com/
> 
> Couldn't we list the entire set of iommus - then detach - subsequently
> re-attaching in our platform code with FUNCTION_IDs we keep listed in
> our drivers ?
> 
> That way the DT is complete and correct, we have a compliant upstream DT
> but we also find a way to make the FUNCTION_ID specific setup we need.

i.e. you can keep the FUNCTION_ID "metadata" in the driver and associate 
specific iommu indexes with the FUNCTION_ID you want in there.

That way you could have multiple FUNCTION_ID smmu entries in the DT and 
just associate the DT indexes locally in 
drivers/platform/qcom/iris_metadata_goes_here.c

---
bod

