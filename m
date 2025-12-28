Return-Path: <linux-media+bounces-49608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3080CE5225
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 16:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 242C6300B28D
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 15:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5962D0620;
	Sun, 28 Dec 2025 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ic/38eUy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DFB1F1315;
	Sun, 28 Dec 2025 15:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766937076; cv=none; b=hForrHNDkaCa19z20oDUYdRQHFhAmW5P63Cz9KAF1PLVAs7kzwZi936Bt56EfMcItdRiYr2OKAGTLTky38eXrzcodh/cXSF0dtL3IJ6regq+y8qHyXovw3RuqZ2IM3Yntw3GHE3147hs7kJsKyz5wWcGucBho+6jysEKBlbmibQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766937076; c=relaxed/simple;
	bh=X9JnqWDXvjUz3nhdMwOfEksQPP/rNq5Z2GUjkZq1Ixw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uaYj6z5CPTBbBLWF6RY+DYYuid3NL2GtxfPL8deiPCjQ6KrIH0xUAGD/MYg71EvF9aYuPcRMMb8QfE0ktFSsHgx5fGqRJwPWpW+epiWilhz8h+l8lRc5MknvWjVax+/7JHmLLjRl2R2sFIWBuDLNBvxRsaR4Fufz9PkfEDezjoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ic/38eUy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3861EC4CEFB;
	Sun, 28 Dec 2025 15:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766937076;
	bh=X9JnqWDXvjUz3nhdMwOfEksQPP/rNq5Z2GUjkZq1Ixw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ic/38eUywcMNAkBo3HoMhZTSVyhvekqSYToyRzgOacrmGXI3vxve2g9efsLZWsWZU
	 MTL9CCYvKDx3aX0X5zhXDQc03Zg0x0jmoCMv5Xi5l392s8rrBSD6j/WpE3d1fR6gtb
	 r/SzbO44LvlvNmbdw66UsBhkt6LPZB3+Omn5hnYAd4vymFJ8VMILyQyVI/SR3tfSXs
	 li653+CQX2DdpF+ytz1BpQARJ+rUOPPcl0G3fvm0XAzZgPTsZloirq9RDVGsgb7TyP
	 giIKo5Snjf3e58GFP0RAqTQ1XJthBW4dUarrNlQKlEni4j5AJ+qtVs1rPRCftzr/ON
	 EEfNlxVF1yo/A==
Message-ID: <f39015f5-7a39-4b52-91be-a33cace9db50@kernel.org>
Date: Sun, 28 Dec 2025 15:51:11 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] media: iris: gen1: Destroy internal buffers after FW
 releases
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
 <zR1veVJGDhcGl2WebwV83R7GAAec50c76joBMzordjxDeBP1QQWatFtwRPO67URJu0T_GDpC9fXwIgjezUvNcA==@protonmail.internalid>
 <20251224-iris-fixes-v1-3-5f79861700ec@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251224-iris-fixes-v1-3-5f79861700ec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/12/2025 06:27, Dikshita Agarwal wrote:
> After the firmware releases internal buffers, the driver was not
> destroying them. This left stale allocations that were no longer used,
> especially across resolution changes where new buffers are allocated per
> the updated requirements. As a result, memory was wasted until session
> close.
> 
> Destroy internal buffers once the release response is received from the
> firmware.
> 
> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 5087e51daa842515e9d62730680fb237bf274efa..5ff71e25597b61587c674142feb99626e402c893 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -441,6 +441,8 @@ static int iris_hfi_gen1_session_unset_buffers(struct iris_inst *inst, struct ir
>   		goto exit;
> 
>   	ret = iris_wait_for_session_response(inst, false);
> +	if (!ret)
> +		ret = iris_destroy_internal_buffer(inst, buf);
> 
>   exit:
>   	kfree(pkt);
> 
> --
> 2.34.1
> 

Seems resonable.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

