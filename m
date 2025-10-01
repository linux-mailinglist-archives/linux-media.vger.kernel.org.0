Return-Path: <linux-media+bounces-43496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C362EBB0FB3
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 17:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C66A1924CD8
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 15:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C168C30C63A;
	Wed,  1 Oct 2025 15:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYxCXpm3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE641D5CC6;
	Wed,  1 Oct 2025 15:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759331075; cv=none; b=fYDqg1refzppgQiqsR4A9CabHStlaqWigtFfBnDSkIeid6UX7vNb3Mq29jcNxHZo4241pVKb1Vy+IIrgkA6F+LLhbtu5S6hfEfJ8uVKl+g66uK4bwRxJxIg2qzE843h9UUMhNkT41Pj8CUoFbLL0VoQ3Hlk4qM71H5fEeBRYFs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759331075; c=relaxed/simple;
	bh=Wd5lV/NOZPOWVkqkhm8ECQ1DM6r5gc4kGGmJbkHKj7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V/WgynFV06Oka4Rer9juApifioB7J55cvOTMGEFLkXaiK3RRWkFvJEYIP+bHBMFX11AiJjC8RUzOuT2MaMXK4+LebZHDSEZXOWgdTeqTjuTrL8gSUrD0nhOjpISaj5lLDms81IkHuSzAa7f9vTOOmYVwCISpDiNWTVpgoDFXfZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYxCXpm3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8F4C4CEF1;
	Wed,  1 Oct 2025 15:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759331074;
	bh=Wd5lV/NOZPOWVkqkhm8ECQ1DM6r5gc4kGGmJbkHKj7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NYxCXpm3HjnCQk1Zs8G4WdPYzDaetNq1lEyYynRbOHi+Cc2BYuV8YnIGhio+M9MQo
	 KqNwo+6qmVmoquykkaAZSNHOseC3AleZYbE68E76pE+V0CiyvDpEBxadgjManRgugz
	 0Jbgh1T2uBiTBDmDfhA/9E+esNH6rI1O1imijSEjJQGK5nII9L4Vi2v174hhsFQO74
	 Jnw9fQeFDLaLHe4OiY8Tmma4anmIvmacEAkrEXlXfPeizo/OeeXj17mbMPVtEaNAcx
	 q7BoDOD1UynWqGcTLMz7gcTrYTXnknrhi2xLChQaVpHAgVlteFU3/UaKMt70HAzdoy
	 ZQSRMNP+jTJWQ==
Message-ID: <d603c0d3-4dd5-4ea0-8a31-47e6dd03ffd7@kernel.org>
Date: Wed, 1 Oct 2025 16:04:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: iris: Add support for QC08C format for decoder
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
 <OyMR2y907eHs6rnnO6bzy52LY_t8KXKscM-nTPu48x3NCYFU4mza-uz0HqnQlYqPg2JtDB8AhCtGAa26Cbq4PA==@protonmail.internalid>
 <20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
 <27e36fdb-3107-4e7b-b402-fd72ea5c4d61@kernel.org>
 <mL8al4KIcE6PTrBxdJa_2UyBCdazqiqrW-cNH0h4hU0lxL9e1BBoPQwqSqafI_KMAHfhK014iRoKVkQmrds0dw==@protonmail.internalid>
 <5e7f20ee-7960-4a1b-bbf2-b5f5330e1527@linaro.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <5e7f20ee-7960-4a1b-bbf2-b5f5330e1527@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2025 09:36, Neil Armstrong wrote:
> On 9/24/25 15:28, Bryan O'Donoghue wrote:
>> On 19/09/2025 16:47, Dikshita Agarwal wrote:
>>> Introduce handling for the QC08C format in the decoder.
>>> Update format checks and configuration to enable decoding of QC08C
>>> streams.
>>
>> Since QC08C is a Qualcomm specific pixel format, you should detail in your commit log exactly what the packing/ordering of pixels is.
>>
>> In other words tell the reader more about QC08C.
> 
> This has been upstreamed 3y ago for venus, which is the same as iris:
> https://lore.kernel.org/all/20220117155559.234026-1-stanimir.varbanov@linaro.org/
> 
> No need to re-explain it for iris, the format is the same.
> 
> Neil
Yeah no, at a minimum the explanation of NV12 + UBWC should appear in 
the commit log for this format.

thx
---
bod

