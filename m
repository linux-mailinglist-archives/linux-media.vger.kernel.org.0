Return-Path: <linux-media+bounces-44036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E042BC708B
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 02:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B97B934E73E
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 00:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5B31C695;
	Thu,  9 Oct 2025 00:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CObzt0z8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955FA15C0;
	Thu,  9 Oct 2025 00:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759971329; cv=none; b=DlPpqtuLnakqMCFNXz/0Y1t5W/gJP9rbAzOZt0980HetISX22TnzIu7FyRIbUx7wel8XAi+oX5WjdbLtdPsMIDG/oQu1eDRHbl0zD/Ux0uTlRSOGf1XhkKuNbjhW4uTIJbHoFUCZu7OC4m48PlgT/wpZqoojNCre1kd1g0zk4A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759971329; c=relaxed/simple;
	bh=xZBMTktst1tuqtj2pUL0aURR3U0aoYV/Tq9ePvSHt0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6fAHuatuU+dut4V5+H5p1SA9+36pwZya5fKZgAysWdrma09x7ksbx9CKxMj9vqj5C6vxmaf7ixFAmJh1jE7AXiaemDnK3761U+J7bUjb+hsrHcb2kFtgxcMrEHM9ErVIp8yruExWysCbSd1WfsxuO1iKoqjmDj776dfXxQlukw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CObzt0z8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AA2C4CEE7;
	Thu,  9 Oct 2025 00:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759971328;
	bh=xZBMTktst1tuqtj2pUL0aURR3U0aoYV/Tq9ePvSHt0I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CObzt0z8sGzV++fw2e2HkpWUET2VFCHdsQz+XZLpAbKqs3+Ihe3kYwsUhF7I7SrcU
	 NvF1q2ugbfgPp7B/8xXJMIZCIH3DRs+Rty9DXBcn8gJYnb+nGqO3nKO/W4APFYGcKL
	 std8sPZPWyW8LE1fcmA5K7E8bZEu3bYiawR3wFwFQNOvTntO7iK3Q0YLRx4oYU780y
	 ISD/U7yrD1eztiWCVUwXY6UoVnCrLFUxeY9r6lpYjoMK6dXnNtb+EwQ3IWjzBCwJhx
	 BJ7KNo9iweQ6T8brwB60z7ROqDvtcNbWSNf+Rq/+2vuQthp+n+5x2PYw867zXMrYQ7
	 4e27Evh/3QAEw==
Message-ID: <98e6acf8-80d7-4894-b4ce-ce74660722ef@kernel.org>
Date: Thu, 9 Oct 2025 01:55:22 +0100
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
 <d46c0335-99d6-469f-a61f-aca4c851f745@kernel.org>
 <GyrcG3qBN7c5C7ajCs3EV81hWvuaVbg64CpzQ-X3d_p6EauoiKxSoG2aOKE21-j12SWFjNDjV-kVSwYYqVm_lQ==@protonmail.internalid>
 <a0dc93ec-e35c-409b-8dfb-1642c92a9f0c@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <a0dc93ec-e35c-409b-8dfb-1642c92a9f0c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2025 01:47, Krzysztof Kozlowski wrote:
>> Maybe it would be possible to also use an inferred FUNCTION_ID somehow
>> though TBH I think that's a work-around.
> Three months ago I gave you the answer for that - it is inferred by
> index on the list.

But at least as I understand it, you can have multiple SID entries that 
need to map to a FUNCTION_ID which means you need to encode that 
inferred indexing in your driver.

So you can't have the iommu code just know what to do.. it has to be 
driver specific.

The iommu description for this platform basically lacks the data that 
_should_ be there -> FUNCTION_ID.

The rule is that the DT should really describe the hardware right ?

---
bod

