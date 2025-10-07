Return-Path: <linux-media+bounces-43850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 587C9BC1C85
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 16:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10C113AE5BC
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 14:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B7A2E1C61;
	Tue,  7 Oct 2025 14:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LCsEOOVW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FE3165F16;
	Tue,  7 Oct 2025 14:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759848282; cv=none; b=AI+w7nGqOUJPs8gz8Shk0LHqB60iYDvJ70bnq0CQ0EjGQDNrdMWEuNsP8ztC7NqWDeiGfkxGmQpRltsbp+8E3K9K0OuDQGwlcz792KURrGxZAjQ3ES/sEW9QZsyriDWgtRoW3cu9atRDcAQlrm2WHKu/sSkiyB8FGTQrbZv/GsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759848282; c=relaxed/simple;
	bh=LwQYuhhiVaegoG9vOuiMz+raxiZiOmxfQCdb3HkNFE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tp8hIDKisVajbBr5R6XncJO5N+s3aclUcXsWX3xialSmlj6UMB8XnW9M8zYokInhl67Tmbc4ZDNzz7D3nuovgf60G/3iGayx+3V5j+DXKZJWj9uvDxKunOrd/8F9cKV0q8411xUwCstbgpxQyIKYWtucLCNH+L6STo3thRFh6oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LCsEOOVW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADB8C4CEF1;
	Tue,  7 Oct 2025 14:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759848282;
	bh=LwQYuhhiVaegoG9vOuiMz+raxiZiOmxfQCdb3HkNFE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LCsEOOVWi8R6gUxoaF9qP0eTMus/R1DsFIgTZ4f/GRkSzh8Xep50Z/bAwilT6rTrQ
	 Dlhed0FlgNCH2kAs0Ga7/eF1WG3H3nEoYZI0iTF6j0EcayN3J8zS5hIZ+QTup2jHPN
	 J60QrAw9RxVXQseRJXoNTKrX7IynUM2XoMUQ68WnjG8ihvJRHm5xvAz0gdPipqqsbz
	 BuPwG7QDUBv1p168BPacbDVYmtv3vl7rZFAU6FEFelCPjXDBbKalLp62vhJV6vE4md
	 DDHN+M7oSY0+az8w+l0wrkmj6P6cCr3nJ2bfSC+yjbSXXKA8k24IvS7TJEz7hE7m+K
	 Flkv9Nv3sPLbw==
Message-ID: <4cb4a92d-2f20-47c7-881e-aadcc6f83aa0@kernel.org>
Date: Tue, 7 Oct 2025 15:44:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Bryan O'Donoghue <bod.linux@nxsw.ie>,
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
 <10a8ccda-4e27-4b06-9a0e-608d6ade5354@nxsw.ie>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <10a8ccda-4e27-4b06-9a0e-608d6ade5354@nxsw.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2025 15:29, Bryan O'Donoghue wrote:
> On 07/10/2025 15:25, Bryan O'Donoghue wrote:
>> Rob suggested using an implicit index for function id
>>
>> https://lore.kernel.org/all/CAL_JsqK9waZK=i+ov0jV- 
>> PonWSfddwHvE94Q+pks4zAEtKc+yg@mail.gmail.com/
>>
>> Couldn't we list the entire set of iommus - then detach - subsequently
>> re-attaching in our platform code with FUNCTION_IDs we keep listed in
>> our drivers ?
>>
>> That way the DT is complete and correct, we have a compliant upstream DT
>> but we also find a way to make the FUNCTION_ID specific setup we need.
> 
> i.e. you can keep the FUNCTION_ID "metadata" in the driver and associate 
> specific iommu indexes with the FUNCTION_ID you want in there.
> 
> That way you could have multiple FUNCTION_ID smmu entries in the DT and 
> just associate the DT indexes locally in drivers/platform/qcom/ 
> iris_metadata_goes_here.c
> 
> ---
> bod

Actually why can't we specify FUNCTION_ID in the iommus = <entries>

Surely we could do

     #iommu-cells = <4>;
     iommus = <&apps_smmu 0x420 0x2 FUNCTION_ID>;

and encode the real data we need directly in the iommus list...

---
bod

