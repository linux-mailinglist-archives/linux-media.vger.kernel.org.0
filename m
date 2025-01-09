Return-Path: <linux-media+bounces-24509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF76A07610
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 13:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 628533A2199
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 12:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A67217F3F;
	Thu,  9 Jan 2025 12:48:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3BD802;
	Thu,  9 Jan 2025 12:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736426883; cv=none; b=nSIwPmvnXOoCNkr8nLS2RAldr8CaxjPpFzC5ms3E05Rg/qpjlX6FX+wlEeFleHqME35iO0XA0n8sjIrB0pGv65oq2P3iFucsfhbCDsmGPSk9jlkE4yuLOi5AS34+lRGXzmlL1TC+H3w+Mv2sCovv0LdeLFNgSssUYx3l57V/9Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736426883; c=relaxed/simple;
	bh=pHCPXxMO1ZAftyO4EaX4lIDMPY971ttf/cvNdYhLp/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RG9hi175O2/L33Pnv7ktAsDn3YtmkS1H8AYObXFZd1psTrioxWlWp3Vtvi7EYBRKTHI1/OWPG4/d2kFRBwxw0awhfKRGUD8Ru08iTfX/1Ygy8tudjEFvYxUn2es+0zqQrg0idGCSvpm5ytqmJ6x5F2hWoH5RC8dJi4NArKuVOD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9934DC4CED2;
	Thu,  9 Jan 2025 12:48:00 +0000 (UTC)
Message-ID: <c1b5dcba-b476-47be-a270-a100efef8ff6@xs4all.nl>
Date: Thu, 9 Jan 2025 13:47:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] media: iris: fix memory leak and improve driver
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Joel Stanley <joel@jms.id.au>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com
References: <20250109-iris-driver-fixes-v1-0-789a0f5dd7ee@quicinc.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20250109-iris-driver-fixes-v1-0-789a0f5dd7ee@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

The iris v3 series (https://patchwork.linuxtv.org/project/linux-media/list/?series=13467)
plus these two patches on top passed the media-ci tests.

If there are no further comments, then I plan to merge this for 6.14
tomorrow afternoon.

Regards,

	Hans

On 09/01/2025 12:26, Dikshita Agarwal wrote:
> This series fixes a memory leak and improves the representation of 
> dma mask to set upper bound of DMA address space.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
> Dikshita Agarwal (2):
>       media: iris: represent dma_mask in more readable form
>       media: iris: fix memory leak while freeing queue memory
> 
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c       | 8 +++++---
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c | 3 ++-
>  drivers/media/platform/qcom/iris/iris_platform_sm8550.c | 3 ++-
>  3 files changed, 9 insertions(+), 5 deletions(-)
> ---
> base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
> change-id: 20250108-iris-driver-fixes-d79c0ecc100d
> prerequisite-message-id: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
> prerequisite-patch-id: bfa9c88ec537e21017d5c9da3ad30d885d2eb132
> prerequisite-patch-id: bf37c5c6dc78b857caf6b544f6eb4000dee5dbaa
> prerequisite-patch-id: 4d3c8665de2faf0ad912943e3a9c9b4ca76bfd7f
> prerequisite-patch-id: 327454576fb8440c8521917a6582e4839b6088c3
> prerequisite-patch-id: fc523bc1a4f188e1924ebc18885c4dcd9b375e89
> prerequisite-patch-id: 1f837af2ed6c4925884b45e75828ff5b8ff057f0
> prerequisite-patch-id: 18c77c70db79b933a13df15f98f681a931156aea
> prerequisite-patch-id: 40168197cad291efe92bd5bf78e039475ed10ae8
> prerequisite-patch-id: b164fd80f4dcfb46b314377e8a595ce654418578
> prerequisite-patch-id: 271bf0ca62c46ff9b14db3c23196112c2f59256d
> prerequisite-patch-id: 67b096b9d1362eacfad13470c20e8eca833bf53d
> prerequisite-patch-id: 5c433b5a1407fda64de411ccdc723dc664319037
> prerequisite-patch-id: 8011d3230e717a0af3c6084b786612ff57bc770a
> prerequisite-patch-id: 6d6f8da843afa6d7159730838ab2ac6e800e9246
> prerequisite-patch-id: aa428f34e6695451780ff6b1bf8bc2dfb95c7071
> prerequisite-patch-id: c95c03b5085eaecafafcabf4d700247b3b00bd87
> prerequisite-patch-id: e41b4e7438a3fe56ba75501a417dba49365ed393
> prerequisite-patch-id: ff1531525f124cf59596b8ca80a58f31b85763d0
> prerequisite-patch-id: f20122e51eeb3691706b7d0f63628a84efc11b34
> prerequisite-patch-id: e397711e5044a5e830f7f46d3683b6c234c23dda
> prerequisite-patch-id: 99ad3fb3466a939438edf93e1591008a51004540
> prerequisite-patch-id: f96d6202f4ba4194b9a185243e0659d2bb8ec6e0
> prerequisite-patch-id: 71b8db4f106aa9322575573174c63d8d9eab20a1
> prerequisite-patch-id: 532f7998ec08c4cc01c69dcfd050ad854d8bdbad
> prerequisite-patch-id: cc80eabbf33df03053869cd47912efbd2c67d19a
> prerequisite-patch-id: 837959096e4fb7aa2b9d5afbd847aa0a4399ea87
> prerequisite-patch-id: f78814e6508d3439e1d77d82af471b839e03d1ec
> prerequisite-patch-id: 5a664eca073472e80da8f257cb030740e009737e
> 
> Best regards,


