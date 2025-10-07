Return-Path: <linux-media+bounces-43881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 85143BC2D25
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 00:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 523304E618A
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 22:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BB0258EF6;
	Tue,  7 Oct 2025 22:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YpOqehRD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5004B1E3DCD;
	Tue,  7 Oct 2025 22:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759875035; cv=none; b=c6Fl6LzDrI3J8rpTkAnJxYlJKnzcCRvsOPYm+6XlsjA/xgjnSdNcybugSaiEKeGRrT7cko8Q0xITgNj67cuubB0xA82wqbONwJvkKyE2Ta5cGResckyOXowg3BPE5pYIOfS4Ls7vH32nT2i0iN5XRZaWxPj6CMBGmSuKbcbHMGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759875035; c=relaxed/simple;
	bh=QAW7uD6qTbhsNZMM2sAsp3q/WD1SmcNoYl5uJPZlhHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aY/tTwPv8D/4yRXjQgCkiPUG0IcYc1Y6UgUzUrGRelE+zP7e+yB8geVbt1s96k6fa/0a/gPKl2i+Ip0D7oDxOnyJh93PAnSDeE4HsdSXmkqf8t1ZcevLVXfb4LIonmptJ7JY2Ckcb9Aqb4OoJdbhR3UtKtR4ms9FeuMBOGm6SQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YpOqehRD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC07C4CEF1;
	Tue,  7 Oct 2025 22:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759875034;
	bh=QAW7uD6qTbhsNZMM2sAsp3q/WD1SmcNoYl5uJPZlhHc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YpOqehRDJt0iEnS0e24rkpgTxlpSX6raj9a/EwELbkbTKa8Pec9kOTqmwVAL9xh/g
	 4uIcjjGiop958qtSJd9syIHJ/xM+8DYw0GH0yHD/zVq+PrDeTGfZGWXkkgskFq3yql
	 DoqDOpSj0OsYO3+HgOAz22YRp2Y/5q2A1ca7IvU7WjG5hDLwjP9toW2AvM453HNZr4
	 whyUEMQWaNlpohN8OAtjZucimj3mgObQ/Vq5k7wsYRzGedqfNesCrE9juuejVz8E6h
	 7cIlsFlAe/HyurtAjMwmnTp3Eq2hycOzVsdSX18DdxxONqT2W+1MvYk5U8FRodklKv
	 DIrobctswvKwg==
Message-ID: <1481129e-3803-498b-bfe5-003c194f629c@kernel.org>
Date: Tue, 7 Oct 2025 23:10:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod.linux@nxsw.ie>,
 Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <I1DbPl0-zSS8tu3k8v0O-6DQdXnwza-Y3Os6GXsSDbOOhVbi3-F8jfL4q7QdkYo2zLv_s8Hy9v1PI3SiGCuDdQ==@protonmail.internalid>
 <CAO9ioeXqx4MoHNDiM4Pbp_evxEAACP0HhJ+8Fgqhhq60sCThdg@mail.gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <CAO9ioeXqx4MoHNDiM4Pbp_evxEAACP0HhJ+8Fgqhhq60sCThdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2025 20:40, Dmitry Baryshkov wrote:
>> Surely we could do
>>
>>       #iommu-cells = <4>;
> Because #iommu-cells is a part of the apps_smmu: device rather than a
> part ofthe iris/venus/GPU/display/etc.

What's to stop us extending the definition for qcom platforms ?

Rather than jumping through hoops in drivers, we can just encode the 
data in the DT.

---
bod

