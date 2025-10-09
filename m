Return-Path: <linux-media+bounces-44034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E188BC7064
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 02:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4508E189CDFA
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 00:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7927C18DB0D;
	Thu,  9 Oct 2025 00:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWX8yGNx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDB41991D4;
	Thu,  9 Oct 2025 00:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759970647; cv=none; b=XbVmq4fZef0/FoJL5lEhV/zTHkTOhTBmo9zXIDXJofEqrx0DyQpTe1Vr8QrFePpj1JxrHZhZaxkwrfbkBz+K483FUTn/j03R3iCNLCWsIZc2q6Pe7Qh6oZkLgRAPzLpga85SeXKAvAxXO6b3w7M7SyVXHsDY73OKU0YULPG6Ej4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759970647; c=relaxed/simple;
	bh=DyOQYsEqbxD2W84UpTYywGgxao4ChbPyR11lNQhFhYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t3GPZf3PZhK2nqimhLrnpQ2jcdsyN+dB+0HSUZPt0knQyxgQIeFqtgXCv5+pCo2X+KWRoJKar3ZynEq5O32yQr9ERt7jTxKtLAYIDge0+jDL37KnLU8gSy6uoX0CRDnkCk9xhUpFD7kIe0E+p9du6jdMgvc1Rz+CKtZhyqwlEak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWX8yGNx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568CBC4CEE7;
	Thu,  9 Oct 2025 00:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759970643;
	bh=DyOQYsEqbxD2W84UpTYywGgxao4ChbPyR11lNQhFhYY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BWX8yGNxmZQFO7G5+sG0RKNPIvfO74cyzkuVfSamNlMo1sNJRy20v45Q5Ekx9i1e7
	 UW0TTzpN3rvvH7+myu1bl5FIzVuN9lzSP0cFTbAU35miJCd059Q7iR4/u4DH2b7sGe
	 N3HiggarHal9UGHZfrLYa2IflvicKc8+vUXaC9riWWf/o+h9ZrelM0cpt20O3K5uHD
	 JvfVc39efz5q1YmwbbXOsYCgY2gK/8UaUQBlJVvpde8FZNtFavy09iwzVgp2pWd/kU
	 B8F1fm2Pn871GGV5mAbjkw0nTo/ezWpvcXrZU4yIfDSqqup3KuLiZKi4DliQOJli08
	 gOynJiaRVzTGA==
Message-ID: <d46c0335-99d6-469f-a61f-aca4c851f745@kernel.org>
Date: Thu, 9 Oct 2025 01:43:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
 Bryan O'Donoghue <bod.linux@nxsw.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
 <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
 <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
 <2hh3zkdwgqbdurpr4tibr3gjat6arwl3dd3gxakdaagafwjdrm@aj5em4tbsjen>
 <Ujyoj3HGLVFhS2b0XzcYAMjSiCAuO-lSJ8PMEQLOaaX83tk_0D5zjrL0VDyZAmD3i4zLB3ElKSZBltISb5jJHA==@protonmail.internalid>
 <4a32bbec-2baf-4210-a7c1-1ddcd45d30c8@oss.qualcomm.com>
 <SuwJuCIcLVJwN3YeN1il6tB9wO9OH6bYcnbRpxpuI9Dl7piYLN-hVdnyv0Mal6N-W5pi2aCZI8MxHZDEkoE63A==@protonmail.internalid>
 <4d87d1ca-55b2-426e-aa73-e3fd8c6fe7bd@kernel.org>
 <10a8ccda-4e27-4b06-9a0e-608d6ade5354@nxsw.ie>
 <4cb4a92d-2f20-47c7-881e-aadcc6f83aa0@kernel.org>
 <1516f21e-aee3-42cf-b75e-61142dc9578d@oss.qualcomm.com>
 <9bae595a-597e-46e6-8eb2-44424fe21db6@linaro.org>
 <MMSKAu89Ew7StAeFBV442KfKNzmqbTSQ-maFG35Jr9d8PkUV2L4sx44R2DRevXA8mC45vkA398l2mvVzarZwew==@protonmail.internalid>
 <bcfbf35b-69ed-4f39-8312-6a53123cd898@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <bcfbf35b-69ed-4f39-8312-6a53123cd898@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2025 01:32, Krzysztof Kozlowski wrote:
>>> Since it is the smmu device property , this suggestion expects all the
>>> devices, not just video, to define additional argument. Does this look
>>> valid?
>> If it is legitimate meta-data for the SMMU setup then why_shouldn't_ it
>> go into the DT ?
>>
> We talked about this two or three months ago. I don't understand why you
> just ignored that entire part and come with new binding just to not
> touch iommu code. List of entries in iommu must have strict order, just
> like for every other list, and you should rely on that.

I don't know if you mean me here.

Just to clarify my point is; the FUNCTION_ID is just as legitimate as 
the SID to specify in the DT.

It shouldn't be in driver platform data. It perfectly valid to add 
another field to the iommu and then modify the iommu code to parse that 
additional field we have added.

There has been some suggestion of an inferred index, I'm not sure how 
that could really work.

The right thing to do is:

- Add FUNCTION_ID to the iommu entries
- Modify the iommu code to consume that data.

Maybe it would be possible to also use an inferred FUNCTION_ID somehow 
though TBH I think that's a work-around.

We need both SID and FUNCTION_ID one is as legitimate as the other when 
setting up the entries because for example - a BSD based on this DT 
would need exactly this same information.

---
bod

