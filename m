Return-Path: <linux-media+bounces-43848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EB2BC1B80
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 16:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DD0A19A44EE
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 14:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899162E0B5F;
	Tue,  7 Oct 2025 14:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9DLaP/z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D2C189BB0;
	Tue,  7 Oct 2025 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759847135; cv=none; b=njevpisSHdxvCaScQMjXA/M4IDBkoGTSg58QtV6dGujMqe/CD6DFm4R2xQeGFkwM6jiSX5EHazlRxlA3Q2pWhwyuecMJ8mPhJ46Px41TmUpt9X/tvYRu33y1IN3btjEOKJ5JZUtMRNmNQsugP2sWaxbfbC4V5l/RhqPZwJsm9Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759847135; c=relaxed/simple;
	bh=MPMxpOSE6OzsmAXqv7ooiDkQUYAGQfGXpkT9hMjKexg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zy7679elpKcDyxqYF3raqRcgx6zZjOeHogm8ZbDaR4iRpXTn/99vH4A09vdD81vIYgvgunOAxGWH5G6V4IBQSBmVu++Nv9EQDb7HhJhvOZ05TxNDnjRAsyLJC66h9KcozZwjHypfTbiLiQwjhMQClOgzK581yA3s86EDZEfUPns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9DLaP/z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEE8C4CEF1;
	Tue,  7 Oct 2025 14:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759847134;
	bh=MPMxpOSE6OzsmAXqv7ooiDkQUYAGQfGXpkT9hMjKexg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A9DLaP/z42vpJj8nK5oelwNydW9EkYNlFNm2h7ca4FdwZzbQt6gwz+43EFh09Aov1
	 9MiTC3ysWrx9NPFlUETQL9dsRM9CCX47KYQFElnPuvHiKTceiOHbxwKKa0oJWkUCyB
	 /URI/tBlO7shL6sg1NGXTp1V/978ogYnqyaYoCH0qIvK+TcFunjpb0Vu38nTAZc9af
	 pdSldnoEGYRwoUQL9Qe/1Fnr7bkmBQVdbbB2QxaLDD/c1s4V6qvg2mQk1alNYQTsmF
	 FyQHeQHFOjQARBPrUJ1OTk3Q9EAnZwAxPLzZYXzxgBFO0d6fSfGQt1v3Qvdg+VN8/X
	 rMB7kExaV+Oqw==
Message-ID: <4d87d1ca-55b2-426e-aa73-e3fd8c6fe7bd@kernel.org>
Date: Tue, 7 Oct 2025 15:25:29 +0100
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
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <4a32bbec-2baf-4210-a7c1-1ddcd45d30c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2025 15:11, Charan Teja Kalla wrote:
> a) Keep iommus max items as 2, which is unchanged.
> b) Repeat the same sid for both entries, i.e.,
>           iommus = <&apps_smmu 0x1940 0x0000>,
>                  - <&apps_smmu 0x1947 0x0000>;
> 	        + <&apps_smmu 0x1940 0x0000>;
> 
> and then create the new device as a platform device independent of dt.
> RFC for this is posted[1].

If you are going to bury iommu data into the platform code in the 
driver, why do you need to modify this array at all ?

The upstream DT should describe what is correct for the APSS - Linux.

There's nothing to stop having an exotic set of platform code in drivers 
to setup SMMU entries for non-APSS system agents though.

Seems a shame though - in the ideal the DT should describe the whole 
hardware and the FUNCTION_ID would be included into the iommu entries.

Rob suggested using an implicit index for function id

https://lore.kernel.org/all/CAL_JsqK9waZK=i+ov0jV-PonWSfddwHvE94Q+pks4zAEtKc+yg@mail.gmail.com/

Couldn't we list the entire set of iommus - then detach - subsequently 
re-attaching in our platform code with FUNCTION_IDs we keep listed in 
our drivers ?

That way the DT is complete and correct, we have a compliant upstream DT 
but we also find a way to make the FUNCTION_ID specific setup we need.

---
bod

