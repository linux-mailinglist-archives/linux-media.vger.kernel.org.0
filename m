Return-Path: <linux-media+bounces-44553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CC5BDD8B1
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 10:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DA77188391B
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 08:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FB63191BE;
	Wed, 15 Oct 2025 08:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZ6KrkpD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966862C029C;
	Wed, 15 Oct 2025 08:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760518433; cv=none; b=QTL0QSNtcwmPCMpa4mEacIoKeGwwNuMhFBQAh9uo+aBclywxja3pr12hpSs7EdDnXOPH0+winnjNdMF5KNBRoj+9rH2CzQzbQ4Rfxr9E2wTOyAvPNxhQDUrUf1b0FCFyANQ57XdcrUSxYiqnYv9WBmyEwwLimrLBhuMobdq/aDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760518433; c=relaxed/simple;
	bh=T4kD6tOFtFdY6vlKgJ1miqQqOPCztWGCphZnD5Xj3ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TXoWEorT2Sg7Pl65DylRfUvqhbnr3UCJqjkVrWO7WjZe8dzjFFbYxqRR8TXn+Lmj9dz7SR4rZPx8BZodr27yOsD35lzSkmfs0yer+ZLVmX1VOywDqoWzgiCGn8K9fK3VaKNmLJghgkpWlmqQaOxM2j3hngmbrAKIWA1H454WWLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZ6KrkpD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89070C4CEF8;
	Wed, 15 Oct 2025 08:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760518433;
	bh=T4kD6tOFtFdY6vlKgJ1miqQqOPCztWGCphZnD5Xj3ow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AZ6KrkpDMBgPbjRDGNgoWUTTG1BoLKc76qXKWn/FocVqmjQ0bhJt80Up760+Ye9T9
	 Yaz2VvMeR5g/w/Zse7FczGCo6yIpN18TM6rIlC3WesfcMXGcFXuA6tp4rokA7sgh7M
	 rhz2orCXrs9/Tc2iF/arMhhQMqRHsnxshKzjLeuUOILGRYfxfb5acNBrNzXL2f/k7C
	 eoVCt1qHxP4JHWHKf7JC089Qnp+qDjcKW/cb0gvpRrXZqK2R2PBXn6sbSIfq5MZiMN
	 ji0ombktQcZdWekTYW+JvX0h/EHpcBN2mOABLViOR7sc9amMu6v8iDU4Wl7rgeg3gl
	 XKs80yi5H8xEg==
Message-ID: <796770d1-024e-4967-a96a-b7f32b28ca64@kernel.org>
Date: Wed, 15 Oct 2025 09:53:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Charan Teja Kalla <charan.kalla@oss.qualcomm.com>, joro@8bytes.org,
 will@kernel.org, saravanak@google.com, conor+dt@kernel.org, robh@kernel.org,
 mchehab@kernel.org, krzk+dt@kernel.org, abhinav.kumar@linux.dev,
 vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 bjorn.andersson@oss.qualcomm.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <nzqte4glwtpjs5bhkxz43yhdufelxvqvzmg5tepudxwetimir3@bvlw5csjizsh>
 <9d3eeb9f-b8ea-48e5-a1d9-0865f63ef991@arm.com>
 <fhb4woejzh3r6v5dxvdiopnsbuwstucfuuzbiymxg4wrxrjc7t@dt3z3utq6lwd>
 <8d88cd9d-16e8-43f9-8eb3-89862da1d0c1@arm.com>
 <hOs24ZavnUyKYyNwBWwRpYnrsefzBfp95yuy9zyp1ByxR9_3VacGX1Yntt8pCE4w3gllPwvevs1AZqghmwKoFg==@protonmail.internalid>
 <zcgn4xw2xghyna2eysavujbzbiydyki7p7upzzv7one5mdyjy6@sj7f75kc4vwu>
 <fb767586-a376-48eb-97b4-bf33061642b9@kernel.org>
 <a4WDx80rJP1GnGNEK0OOD5lh-m-MiAvireXdpiM9ETLKZ084sBJ2UthU_QqRbU_nwD4XtsdiyEqQ0AhxguzJ6g==@protonmail.internalid>
 <6gx74wxie4wcabq27wo5y7v36uuurez4jxlzanroepqazdlgtw@sdtv2ld47d3q>
 <fa3c1732-328d-46a2-8514-2e7f9ca6c63f@kernel.org>
 <aE5RMDRfrr2wxUAqjjsBMcodNQxLsUT_Soi_LXMJXYcfmmeBSHnPM3e5JUPOb89tSfeI1jQbt9LfLCOXFBZFSA==@protonmail.internalid>
 <mwthowuei7pcqp2b4hg5c45n47iakclkioumc6diyznhnldfv5@wloeoys224bg>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <mwthowuei7pcqp2b4hg5c45n47iakclkioumc6diyznhnldfv5@wloeoys224bg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/10/2025 23:18, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 09:49:17PM +0100, Bryan O'Donoghue wrote:
>> On 14/10/2025 19:35, Dmitry Baryshkov wrote:
>>>> Each function id can be associated with a device and a compat string
>>>> associated with it.
>>> So, which part of the hardware is described by the -cb device? What does
>>> it mean_here_?
>>
>> The non-pixel path video encoder, the tz video encoder...
>>
>> What's not clear about that ?
> 
> Where do you have pixel encoders in the fastrpc device node?
> 
> --
> With best wishes
> Dmitry

Haha, no sorry I didn't mean to suggest that at all.

I mean do something _like_ that, for these FUNCION_IDs.

We could replicate that for a new iris add for say Glymur or Kanaapali.

Sub-nodes of the main iris device. They have a real purpose in that the 
'device' requirement is full range IOVA for the SID and implicit 
identification of the FUNCTION_ID with the compat string

iris-video@0xdeadbeef {
	video@0 {
		reg = <0>;  /* FUNCTION_ID HLOS could also go here */
		compat = "qcom,glymur-iris";

		iommus = <&apps_smmu 0x1940 0x0000>;
	};

	video@1 {
		reg = <1>;
		compat = "qcom,glymur-iris-non-pixel";
		iommus = <&apps_smmu 0x1947 0x0000>;
	};
};

The reg property could also be the function_id

video@FUNC_ID_HLOS {
	reg = <FUNC_ID_HLOS>;
	...
};

There's no need for a new iommu specific property to help us fixup 
sm8550 iommu definition.

As I say if that error wasn't already in sm8550, we wouldn't be trying 
to solve the problem this way.

So lets solve the problem for Glymur and Kanaapali and then backport 
upstream if we can or downstream if we can't.

What we need are new devices what we will do with the data in 
iommu-map-masked is make new devices. We are mapping data - iommu SID to 
device and implicit FUNCTION_ID to a device.

So we should be declaring devices, instead of burying the data in a new 
property that is not obvious what it does or why it exists.

Robin has suggested devices, we have two real bits of hardware data to 
go with those devices...

---
bod

