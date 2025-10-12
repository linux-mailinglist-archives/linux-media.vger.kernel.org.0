Return-Path: <linux-media+bounces-44215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF81BD0C28
	for <lists+linux-media@lfdr.de>; Sun, 12 Oct 2025 22:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5F1E1894D21
	for <lists+linux-media@lfdr.de>; Sun, 12 Oct 2025 20:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2B0235072;
	Sun, 12 Oct 2025 20:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTI0f5z3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D712214204;
	Sun, 12 Oct 2025 20:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760301892; cv=none; b=U76TIyd+BT1YcRlJDSfc0XnoKQjmZEWCp+tt76j1XZnWzU45luPPwdoW1HvRMCtighlXzAlnYp9oE+rxCcEgbh3hu1PISFDmT6UYGL+hL69PMWu5QE2KwF0dDKVU0NA2fHc6IauMfQHoxtMoKrW8mXTJNz8nlutUzgf5mTn+iaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760301892; c=relaxed/simple;
	bh=d/vNpme0tbgody0yNnwPtQwOUw1cH14ElX7Rodm/NMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtId9uB0/V0KBKqJ6DQfZr/EM5g1/URkuFiIhEJ75Z6ImDgdenswC6S/SvWPimK1y9TM8nfJKGIWXBqMcEV+K8u9LPf/yfImHoMmSR0GP7DVOxD/rRyzuD0SFNOrgDlBVWgofdQ6Kf+sXrh8gKXhXRFbapbmAne8Cal/U/4gjT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTI0f5z3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EE8C4CEE7;
	Sun, 12 Oct 2025 20:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760301891;
	bh=d/vNpme0tbgody0yNnwPtQwOUw1cH14ElX7Rodm/NMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FTI0f5z3Z1KfTrV0mm2jA5mdCci0eZSQitoS7vCVOkW2zr+18VyfzI079X5F/fmEJ
	 mTt8DX+wBehsQkOKzp3I4oUT0dcZRTNdwAhOpKpN6wNJWR3ou1L9PL3JnJ9ygqU+cd
	 0yt1xZUG0cYl2SpVd4Ld6nOTbPtlEHUG39qyAOB/OaskKxIoxk95EPFMBkZqOm29SA
	 9h9mizSuAPsAZPF5iK+3+EjkNiu8wnJSfcOdXbocgCLSmLifOIV6CXD2bGzjFP5Sja
	 xsMkYUm3Q3kfeHqfV/A3KzeBrjOPCM2/vYE7EiumsBNHmbCuPHQXRw8Ph2K3LIsr/K
	 5vAz2pILFsKTg==
Message-ID: <3c1eb276-abde-4af4-ab39-c934c30aa447@kernel.org>
Date: Sun, 12 Oct 2025 21:44:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, saravanak@google.com,
 conor+dt@kernel.org, robh@kernel.org, mchehab@kernel.org,
 krzk+dt@kernel.org, abhinav.kumar@linux.dev,
 vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 bjorn.andersson@oss.qualcomm.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
 <aec0f40a-8346-4194-8b18-1022fe3366bb@arm.com>
 <0d0560cc-9757-4c7b-8de4-170148d99481@oss.qualcomm.com>
 <ead7cf8b-fbc4-4242-a9da-b313dded1abc@arm.com>
 <nzqte4glwtpjs5bhkxz43yhdufelxvqvzmg5tepudxwetimir3@bvlw5csjizsh>
 <9d3eeb9f-b8ea-48e5-a1d9-0865f63ef991@arm.com>
 <fhb4woejzh3r6v5dxvdiopnsbuwstucfuuzbiymxg4wrxrjc7t@dt3z3utq6lwd>
 <0zcQcB2YYWH_ufElq3ptqtLsGDsxvMEAkHCt_jYaSpwV597VFc22pFWzyMz0rSY-DKqWCQgOCiKpsIRNA0Fisw==@protonmail.internalid>
 <c863f6a7-b117-4444-ae6d-1d525b572be2@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <c863f6a7-b117-4444-ae6d-1d525b572be2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2025 20:53, Charan Teja Kalla wrote:
> I don't want to dilute what Dmitry is saying here, but the below is what
> i can make out of Robin comments, please CMIW:
> 
> iommu {
> 	#iommu-cells = <2>;
> }
> 
> video {
>     iommu = <iommu sid1 mask1>, <iommu sid2 mask2>;
>     #iommu-map-cells = 2; /* does it look weird to define here, even if
> it is SMMU property? */
>     iommu-map = <0 smmu sid3 mask3>,
> 	       <0 smmu sid4 mask4>;
> };


This whole iommu-map thing is a wrong direction, its a workaround.

It stems from here:

1. Vikash posted a series adding a platform device
  
https://lore.kernel.org/linux-media/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/

    The two objectives of this are

    a. Allow Linux, the APPS as qcom calls it,@ EL1 or EL2
       to setup iommu entries for function_ids that are
       not the APPS @ EL1/EL2.
       For example the APPS running in TEE or one of the
       various co-processors - like say the Compute DSP cDSP.

    b. Allowing for each device to have a full IOVA range.

2. Krzysztof queried about changing _existing_ entries e.g.
  
https://lore.kernel.org/linux-media/6fd3fa34-69e1-484f-ad6f-8caa852f1a6c@kernel.org/

    The point about ABI breakage.

3. This proposal to introduce iommu-map as a workaround
    Gets the FUNCTION_ID APPS v cDSP v TZ into the DT

    So it solves 1/a I'm not sure it solves 1/b

    However if you were designing from scratch you wouldn't
    have a motivation to assign this additional property.

    The motivation is to not break the ABI I think.

4. Robin said

    "And if you want individual StreamIDs for logical functions to be
     attachable to distinct contexts then those functions absolutely
     must be visible to the IOMMU layer and the SMMU driver as
     independent devices"

5. If you think about this, its actually the right long term solution

    - Individual devices means something like:

      video-codec@aa00000 {
          /* Any SID mapping to S1_VIDEO_HLOS belongs here */
          compatible = "qcom,sm8550-iris";
          iommus = <&apps_smmu 0x1947 0x0000>;
      };

      video-codec-non-pixel {
          /* Any SID mapping to S1_VIDEO_HLOS_P belongs here */
          compatible = "qcom,sm8550-iris-non-pixel";
          iommus = <&apps_smmu 0x1940 0x0000>;
      };

    - Or do something like that above again in platform code.

6. We should on introduction of a new SoC

    - Fix the iommus = <> for "qcom,newsoc-iris" to contain
      only what is pertinent to S1_VIDEO_HLOS

    - Make new devices in the DT for each FUNCTION_ID

    - Then look at how - if - that fix can be brought back to Lemans

My problem with introducing the iommu-map is that it bakes into the 
video codec definitions a fixup which then gets carried forward.

But the right thing to do is individual devices so, let's do that and 
worry about how to back-port that fix to older SoCs once done.

---
bod

