Return-Path: <linux-media+bounces-49610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED56CE5261
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 16:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0593F300F8A0
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 15:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E074E2D4B40;
	Sun, 28 Dec 2025 15:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZfbKYwIt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3CC2D3ECF;
	Sun, 28 Dec 2025 15:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766937307; cv=none; b=HxnoEggma0Bu/AxXhJl2FdDKyt2Qmo4ZWhIK0lY/iUPzgwNs7V0zQeF1q9ZHwttpdBRKTzDO9zhOfNtA9rUaWyDWCOBa7Xo0KF1EK7z5qgJd9Kj8twpcUWDWetweHUQlIV7wVUMQaDJgxDcT1pbKFUhuU/nXwdtC3Y/odgeoXC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766937307; c=relaxed/simple;
	bh=RVhVYNe4HLnYu3SXv6psX9huMD9oykqCFbvAYGZvb8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uk/c+luUoJBmSddrlAlGsucjJKT0SOwY2PeUknZXGvp+U5zfrz2gg8GNSN3eZUBuYMcf98CgHbgtEePgSI/kc4bDzgtt0pGNHg/Vzx3ro97200HEEmrp/WgxIp9Bc+QXs2ltc98FT2DRbVvG+5/4H1qpch6j0IFBsm9nf3iz9nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZfbKYwIt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E5EC4CEFB;
	Sun, 28 Dec 2025 15:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766937306;
	bh=RVhVYNe4HLnYu3SXv6psX9huMD9oykqCFbvAYGZvb8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZfbKYwItChsGLpE7VdLeGKh/S7TL13OUjVBfD4CT1HTyTVeCLVyJWGqT713yjCTR2
	 R2PiHPE9bvB1rDV1vTr9oW5wi5+pjeyDPVwd/tKuraoqoOA5Ezel9huY700bYWdtBF
	 Zxobs3TxHSVQHt5aoYmjmvAZtsZO9z2djY2XXzDgamCcEDPYuYvFjlVkQ2JsYBiShk
	 6LAoOXKDr7S0jfe51n9rpoNBeVkdmwKg6dE+ZioJwRPKkKcWAfTx4ZULUgWGFaVuDM
	 meu/Uj1td/SdyF6R0D+MYBdzSRa9wcAAh/vvLsoPoEYma/MHULi13MdiEsBCGDhtit
	 fJk5qX08TbKHQ==
Message-ID: <b2b48188-1283-4a19-a6b1-9154609f22e6@kernel.org>
Date: Sun, 28 Dec 2025 15:55:02 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] media: iris: gen2: Add sanity check for session stop
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
 <Q-o-NbtrkuHq6JVnZdrzAP2vtM8D_RDPSMQNDLQMZhXgOPk4XJDbKa29kt2uelNZ7_mSdoshpl7LpdSQ5GLBYg==@protonmail.internalid>
 <20251224-iris-fixes-v1-5-5f79861700ec@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251224-iris-fixes-v1-5-5f79861700ec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/12/2025 06:27, Dikshita Agarwal wrote:
> In iris_kill_session, inst->state is set to IRIS_INST_ERROR and
> session_close is executed, which will kfree(inst_hfi_gen2->packet).
> If stop_streaming is called afterward, it will cause a crash.
> 
> Add a NULL check for inst_hfi_gen2->packet before sendling STOP packet
> to firmware to fix that.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 6a772db2ec33fb002d8884753a41dc98b3a8439d..59e41adcce9aadd7c60bb1d369d68a4954f62aef 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -963,6 +963,9 @@ static int iris_hfi_gen2_session_stop(struct iris_inst *inst, u32 plane)
>   	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>   	int ret = 0;
> 
> +	if (!inst_hfi_gen2->packet)
> +		return -EINVAL;
> +
>   	reinit_completion(&inst->completion);
> 
>   	iris_hfi_gen2_packet_session_command(inst,
> 
> --
> 2.34.1
> 

Most of these patches need Fixes: please add.

---
bod

