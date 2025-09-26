Return-Path: <linux-media+bounces-43250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A889BA3BCF
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 15:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD2461C006DB
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 13:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598862F5A3E;
	Fri, 26 Sep 2025 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="quBLb5EK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E0B2F5A0F;
	Fri, 26 Sep 2025 13:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758891613; cv=none; b=kCKww+GU5GwUxzORZOR6gmz5hfs84kX64bZF8grK/StHevgmODjgX3H9aZGnKy73iys30mlnFdEPvpqXZ3H4IMBg/LAtO1X+dRaj1DqHLDWDyxUXLrbKHk13KRk3lNCathV10Ioi2DC5Di6Ix9ZfSxyTVBYJPeCOmtrc14eI2FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758891613; c=relaxed/simple;
	bh=Seffs2fDaZeiosxkytaTQWPfDVplzS5YGTCllHoiPwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQT6VI1WTwCpJmFn4n888n/bT7E6AVpaxOkDK/RIiBNPhbia8GvH2kl7eF8YqNUtIgxvH5VLzH6wQaZ35W7LisCLWRomnEWczWJYVRhjYfk0PT86UD/ksFN/JF0RxPBRE1H/KJF0rLpVxCOMJd0EpqDhVhGCxOYgYmEJ51tkTrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=quBLb5EK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1619C4CEF4;
	Fri, 26 Sep 2025 13:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758891612;
	bh=Seffs2fDaZeiosxkytaTQWPfDVplzS5YGTCllHoiPwc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=quBLb5EKc3qijWVvbQW6C0IkcaW+7g8ctwyogr5OCK40IHZAmhqNNVFwqc/iH9Ts8
	 wnM8BNECBHD+d04PIgeFj2IpF3rTg8FJqZnsJBnRjFbBJPSKndXC2OqUAPH4+UXCq4
	 eDGE46OdNkTL5XQhM+Fymjdlb6TMXKhp/jWzb1ZHnAdp1+KnPlAydXRfPxokg9lCcu
	 FoNTLu+ASXM2YJTEWT2/nM/am5Qa5Pn4J1Q+0YKtdqqqp8KMtppCc6BOoAWnws2s0G
	 nKkUM6FWgSSsBpI0uiQhRiC7S2lJOgNlRp+6F6Kzpp4Kc0zXoMe4h5gVKusEoKziHi
	 r8NNgHL2+RiSw==
Message-ID: <bee1da42-1108-4d71-a854-e3f76c5a6e96@kernel.org>
Date: Fri, 26 Sep 2025 14:00:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] media: iris: Introduce buffer size calculations for
 vpu4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <NFzYqaeq5sb1dHtVN0YuNSMRZSaP8tEluFULzxY35Ir2qNpfsn1yP5Ptd9zxuuLzyD7oMcyeZR_NK1DgsO0sKQ==@protonmail.internalid>
 <20250925-knp_video-v1-4-e323c0b3c0cd@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250925-knp_video-v1-4-e323c0b3c0cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 00:14, Vikash Garodia wrote:
> +{
> +	u32 dma_opb_wr_tlb_y_size = ((frame_width_coded + 15) >> 4) << 7;
> +	u32 dma_opb_wr_tlb_uv_size = ((frame_width_coded + 15) >> 4) << 7;
> +	u32 dma_opb_wr2_tlb_y_size = ALIGN((2 * 6 * 64 * frame_height_coded / 8), DMA_ALIGNMENT) *
> +					   num_vpp_pipes_enc;
> +	u32 dma_opb_wr2_tlb_uv_size = ALIGN((2 * 6 * 64 * frame_height_coded / 8), DMA_ALIGNMENT) *
> +					    num_vpp_pipes_enc;

I find these calculations pretty nebulous and not very obvious to look at.

A define of some sort with a comment would definitely help other 
programmers reviewing and supporting this code in the future.

(+ 15 >> 4) << 7 - I'm sure it makes sense when you are looking at a 
register spec in front of your eyes but if you don't have that detail 
its pretty hard to say the values are correct.

/*
  * SET_Y_SIZE(x)
  *     - Add 15 because
  *     - Shift 4 to lower nibble because
  *     - Shift the result up 7 because
  */
#define SET_Y_SIZE(x)

---
bod

