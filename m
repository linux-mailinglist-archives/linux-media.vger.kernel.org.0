Return-Path: <linux-media+bounces-44030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B3FBC6FA1
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 02:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B71B73E10CF
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 00:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B3ADF6C;
	Thu,  9 Oct 2025 00:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oyS3McjQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91EB4C81
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 00:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759968652; cv=none; b=aBlC5YBbAU3t1YRxWYQ8lxbC1svqSgU+SUvtdmuHfKVkwrKuKFFnFT/doJNw+ubaf3fidLYYEk1Kivimm7/8TzAcmniLcKAdbi1Bmsd3qfAR164IvnpNAhVNCT7rIyC0JMeT4bipTU7t+LHoZM3TpmNbTHdC6eqQCf4ZWMcILiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759968652; c=relaxed/simple;
	bh=+NpJNfi5TLX6c2dQPOrHEKvQBRW5JoX0643mzmit8a0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cUlud4afM3DdaLiUPk0uVGyRzHUSOag1LvcXp78mgh4+slbAfKVtdmceBGDxzgTSF5BY3BanLVLSQ193POy2Sk9EJPtPb3bGnS3EJMWCp/dnIHOlrGWK0egtBArbyXgHmIGalBmFu7zZvfrla4Q7GPS4yZfgO82rObrTEu6IFZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oyS3McjQ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so717619a12.3
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 17:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759968649; x=1760573449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nqeVt9CA6ZZE5iXwL1K4ytAUwC5/DAyBd/WUJk984Wc=;
        b=oyS3McjQu0OGkm38rp9J+GgPCaRyWcqk/4fjpF5idtkcHi6aTPgp7/8sF+BxmbmZl5
         1jDZLg8dChkqB3LhUMc5m72Cl59cCj92Uq5ibC0fjdhsrc24KcLBeWkEEKMeYENLA3dM
         4pJJCwldYTGvng8+nPvsSj4C5cN1qn/xfUQeKGWGpttp7nPoNi6XOzgh1v/fB2oDX5GA
         eb9J4Go83yirZUa/xtBjqQk56wTtpl6ti+723IeuwhsOuWvYsXNP77CDF3RvHxefUpSz
         PMe0GYFlK4oCago5ApP7nUfd67Lgq5hQ4llhdnL4mU3nA7OPTYT5Y77vFeZbQqdEeIAr
         sBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759968649; x=1760573449;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nqeVt9CA6ZZE5iXwL1K4ytAUwC5/DAyBd/WUJk984Wc=;
        b=ixr3y1+3AiKmP0pjBrp9PyV9R9ddGG7Xls1kDv+g+C9LDs8A2vOarSZkbZLVt5L7yn
         0s7pgOwNpcplGExBFepfeioLkEZ58/XENj53bb34jtYKUIgibdQ6TWjw3zhbrQMSugAr
         MuK8aZahL9jkuElGJh/WJWVwF6YYRNtHLdyID0oVvKfpa27oVILt6cisnzaeI4L5GcBW
         VRuL+g1MatSySG7wqz016LbCxyuDKZ/uU/K8pFZsVbFkLDgI1ACmzBX/yIxishh9uH7W
         R0kob7kntiLqcZh1RZUKOhn9TBVCIdjeLOqF4WqEDFsWIHpb44VVslLZBLslt9x49FNp
         avgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNAOUpwWxjLfIskAqRCzkWsy45Qp06Q4o37Tm9cPLmi4PW7ojmb+VVcnDtbcx4WfyZmw7PhS52RLfb1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu5FPdZGtIFYSw+xZMdpEZkAjxCtr6jENgmgOOsQJSn3Obz1pt
	o1maQ/0JyuuEdtbBoEhRqQIl2GXbr6u903ecN2T3S79rLcTSsu+kL+QUkbPgMuv25Vs=
X-Gm-Gg: ASbGnct2VXvCwjTNn8nR6WVvP9t3Q1uaEo01/7uRBCYUD0PazdvdMUdZ2y0bFA6xy7A
	TCOkXUcDW9Kat54d7PRwofI9T/SDBILyNN/mr1lNGvD/NKVw6NH4q63mGzn8Tfvi+iRQBDAN9MG
	JB4wPUa80q0+y57CwNfSrbwKzz7CSQBoa5my/hyZf65RG2kmJXggeoZcEllbx4h2zPyB30ukRG3
	H+gHBrZxcJ9RC1CxWMeaj8t/ky15GLy/LEVQmgPYFUQpoFcZX40c5BgPq4iqdUebLv8FpDqmJrs
	bh3MjlNocV4iwJqISmUK+y/uLusEfcK0Dnl0WlWwT3lbIbYGhrA3SW/lt5l9mclXwlTcxaiRYRz
	4J5xY6uEi+4avbhFBSC+G5cNcFbOZyirQ/A8rO4jxv0Jh1mCzC4dSBqBhbPydD1yaVQtXLtF9l/
	049jhCFVymdCsidUHN
X-Google-Smtp-Source: AGHT+IEcPQu/d3ZxrGPE3fTVd6s5KBDE/uPgAxO+8YlkcXC3pZrWzpe9zN32/G2VY+n+7l9susSC/w==
X-Received: by 2002:a05:6402:90c:b0:634:cb54:810e with SMTP id 4fb4d7f45d1cf-639d5c57aa7mr4407819a12.31.1759968649066;
        Wed, 08 Oct 2025 17:10:49 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f30d9963sm1119645a12.15.2025.10.08.17.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 17:10:48 -0700 (PDT)
Message-ID: <9bae595a-597e-46e6-8eb2-44424fe21db6@linaro.org>
Date: Thu, 9 Oct 2025 01:10:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Bryan O'Donoghue <bod.linux@nxsw.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <4cb4a92d-2f20-47c7-881e-aadcc6f83aa0@kernel.org>
 <1516f21e-aee3-42cf-b75e-61142dc9578d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <1516f21e-aee3-42cf-b75e-61142dc9578d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/10/2025 19:03, Charan Teja Kalla wrote:
>>>> Couldn't we list the entire set of iommus - then detach - subsequently
>>>> re-attaching in our platform code with FUNCTION_IDs we keep listed in
>>>> our drivers ?
>>>>
> TMK, there is no api exist to detach a device once it is attached to
> smmu. We used to have one but removed[1], not sure how well it will be
> received to introduce it again.
> 
> There is other problem exist attaching the entire set of iommus in the
> first place: Usually writes to SMR registers are protected through
> emulation by hyp. Thus adding the sids of protected/non-protected
> usecases in the same iommu set will not allowed by the
> hypervisors(eg:gunyah), as all will end up in using the same context
> bank, thus there can be failure to attach to smmu in the first place.
> 
> 
> [1]
> https://lore.kernel.org/all/20230110025408.667767-1- 
> baolu.lu@linux.intel.com/
> 
>>>> That way the DT is complete and correct, we have a compliant upstream DT
>>>> but we also find a way to make the FUNCTION_ID specific setup we need.
>>> i.e. you can keep the FUNCTION_ID "metadata" in the driver and
>>> associate specific iommu indexes with the FUNCTION_ID you want in there.
>>>
>>> That way you could have multiple FUNCTION_ID smmu entries in the DT
>>> and just associate the DT indexes locally in drivers/platform/qcom/
>>> iris_metadata_goes_here.c
>>>
>>> ---
>>> bod
>> Actually why can't we specify FUNCTION_ID in the iommus = <entries>
>>
>> Surely we could do
>>
>>      #iommu-cells = <4>;
>>      iommus = <&apps_smmu 0x420 0x2 FUNCTION_ID>;
>>
>> and encode the real data we need directly in the iommus list...
>>
> Since it is the smmu device property , this suggestion expects all the
> devices, not just video, to define additional argument. Does this look
> valid?

If it is legitimate meta-data for the SMMU setup then why _shouldn't_ it 
go into the DT ?

We've basically identified that the smmu entries - for qcom platforms 
should encode the FUNCTION_ID. Rather than shy away from fixing the DT 
we should work back from the principle "DT should represent the 
hardware" and then if necessary update the upstream descriptions to capture.

Surely then we can teach the mapping routines to consume the 
FUNCTION_ID. Rob suggested an implied FUNCTION_ID based on index.

I think we need to have something like:

#1
iommus = <&apps_smmu 0x420 0x2 FUNCTION_ID0>,
          <&apps_smmu 0x424 0x2 FUNCTION_ID0>,
          <&apps_smmu 0x428 0x2 FUNCTION_ID1>;

or with implied indexes..

#2
/* implied FUNCTION_ID0 */
iommus = <&apps_smmu 0x420 0x2>,
          <&apps_smmu 0x424 0x2>;

/* implied FUNCTION_ID1 */
iommus =  <&apps_smmu 0x428 0x2>;

Either way the DT should not contain fake devices or fake sub-nodes and 
IMO should contain either explicitly with another field or implicitly 
with an index the FUNCTION_IDs in the DT itself - the FUNCTION_ID.

For devices that don't currently require the FUNCTION_ID parameter the 
FUNCTION_ID is the APPS so you could infer that by the absence of 
FUNCTION_ID for older platforms and require FUNCTION_ID for new 
platforms #1 or again infer it via an implied index if you have multiple 
iommus = <> per #2.

---
bod

