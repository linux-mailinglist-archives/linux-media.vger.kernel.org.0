Return-Path: <linux-media+bounces-36142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E425FAEC06C
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 21:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C142177BD3
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 19:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77342E9ED5;
	Fri, 27 Jun 2025 19:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjXss9uy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8391F8747;
	Fri, 27 Jun 2025 19:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751053910; cv=none; b=Je8//nB760RR4fhd3T2OZeYWUV8iBWKtYJJuSsvJzj4SmLwMZE7vN90Hjd1Tx5+Je4mm476Qq8zZKAw9Ocm7nuL7oxiSSLuR+2w32xI7zcMSAnNwi6K+7c85bFgMLoMfAAkJAP9ywKeJCPt7Hhl3DskkksoDKeGX4uN0YfrF5mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751053910; c=relaxed/simple;
	bh=ozclK3UrisEUDnmjvct5A912u/KtKzDKBjfMBSFGerI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izMxhXNkPvwEByAQgYKYge2w8VJreRLINl7zTS7sShMKSOcMN/QsiMIwOflekR+nLetttKHbhxLdJDkB5rMEr5+ihEE3kM0rwJPCfZXZd2JHTIAjE4E3NE1jnAOP/y7bgKfb+QknTYtPxd3A8LRH8Owyojdk2YDqoxM5YWM14N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjXss9uy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843A2C4CEE3;
	Fri, 27 Jun 2025 19:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751053909;
	bh=ozclK3UrisEUDnmjvct5A912u/KtKzDKBjfMBSFGerI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjXss9uyu/PQxc6p8HC6vJuuZY54bNbkYCe9YUe/r4uqi0igfSJTgae2Huyh7pKQt
	 u9t5iLKHYXbfZGFPyLgiEvcm1n35pgnzNravc8+24Vd82gkMm6Yut2EfASdz+vtVUQ
	 ze8uN+jk+iqEYdkbf9LrJA9CU9BrYT7YSF5s/59Ta6yn+H2YDLWeco0W3iUfWLB1VT
	 +d4UZsPvwYGuDnzRwZPGUuXRcWiI/3kMiLH19f8A27l6TWpzgRLoOheoR4i1e0cC6A
	 R9Ds333mcyG3E6U/JcrfPKuvMRnLtw9J+ikZ1i+F26IGRVb8hJxLeSxMgIpDVgRPe8
	 eDyl400flKzqQ==
Date: Fri, 27 Jun 2025 14:51:48 -0500
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: media: qcom,sm8550-iris: add non_pixel
 and resv_region properties
Message-ID: <20250627195148.GA4062030-robh@kernel.org>
References: <20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com>
 <20250620-video_cb-v1-1-9bcac1c8800c@quicinc.com>
 <a35d3928-8ac6-49ab-8689-16ba69afe197@kernel.org>
 <2bd17ab5-950c-4260-ae7c-9ba9a6441496@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bd17ab5-950c-4260-ae7c-9ba9a6441496@oss.qualcomm.com>

On Fri, Jun 20, 2025 at 07:27:03PM +0200, Konrad Dybcio wrote:
> On 6/20/25 8:39 AM, Krzysztof Kozlowski wrote:
> > On 20/06/2025 08:20, Vikash Garodia wrote:
> >> Existing definition limits the IOVA to an addressable range of 4GiB, and
> >> even within that range, some of the space is used by IO registers,
> >> thereby limiting the available IOVA to even lesser. Video hardware is
> >> designed to emit different stream-ID for pixel and non_pixel buffers,
> >> thereby introduce a non_pixel sub node to handle non_pixel stream-ID.
> >>
> >> With this, both iris and non_pixel device can have IOVA range of 0-4GiB
> >> individually. Certain video usecases like higher video concurrency needs
> >> IOVA higher than 4GiB.
> >>
> >> Add the "resv_region" property, which defines reserved IOVA regions that
> >> are *excluded* from addressable range. Video hardware generates
> >> different stream IDs based on the range of IOVA addresses. Thereby IOVA
> >> addresses for firmware and data buffers need to be non overlapping. For
> >> ex. 0x0-0x25800000 address range is reserved for firmware stream-ID,
> >> while non_pixel (bitstream ) stream-ID can be generated by hardware only
> >> when bitstream buffers IOVA address is from 0x25800000-0xe0000000.
> >>
> >> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> >> ---
> >>  .../bindings/media/qcom,sm8550-iris.yaml           | 35 ++++++++++++++++++++++
> >>  1 file changed, 35 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> >> index c79bf2101812d83b99704f38b7348a9f728dff44..a1e83bae3c36f3a4c58b212ef457905e38091b97 100644
> >> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> >> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> >> @@ -65,10 +65,45 @@ properties:
> >>        - const: core
> >>  
> >>    iommus:
> >> +    minItems: 1
> > 
> > As discussed in other patchset, this needs clear explanation, so
> > imperfect patch won't be used in future discussions as argument to take
> > more of such things.
> > 
> >>      maxItems: 2
> >>  
> >>    dma-coherent: true
> >>  
> >> +  resv_region:
> > 
> > DTS coding style. Anyway, regions go with memory-region bindings. Use that.
> 
> On a tangent, FWIW this is a discussion related to this patchset that
> never got much attention:
> 
> https://lore.kernel.org/linux-devicetree/9439182e-3338-4d57-aa02-b621bc9498a3@oss.qualcomm.com/

Send !patches to devicetree-spec if you want any chance of it being 
seen. If it is not a patch in PW from the firehose that's the 
devicetree list, then I likely never read it. 

But I don't have any clue how iommu-addresses works to give guidance. 
I'd propose something that works for you if you really want some 
discussion.

Rob

