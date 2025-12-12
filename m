Return-Path: <linux-media+bounces-48683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9380DCB7A70
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 03:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBB40302D92F
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 02:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923871A238C;
	Fri, 12 Dec 2025 02:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3ONK9M+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72FCAD24;
	Fri, 12 Dec 2025 02:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765505760; cv=none; b=DA1z1w7EkocWRjzATHKYU13Mb94Jo8eM4bkz6HMDeEitBft6bHZcnVdpn1Yirg6y9ZaUvNO2qSugyHNNeTee3NjbW8hwYsG+ZqfXu3KXX867Xzq3eOTFHKQ13uCf4aT/a+uaTKLwDjqiiheIP+CdwUnzMuHddEk0i1hoAvNjjR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765505760; c=relaxed/simple;
	bh=stIB81eeipJUREm+3QBOT4GGS9SJRH1LC1y24qIMnmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pr152a+WldsxuwvVtmY6c+lD+Vw+WTDbGxytQJ3TFU83J7eXzaUk7fbHwXX7sJ4ifnWSkzyYD3SSqlupw7etzXDA++Zp7B88SyluKLCJGmtYIg7NeLGrdXPheoyjLSKaiUOQTHxysgz3398kF55GsaspNfZ48nuNMGcyVefTQME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3ONK9M+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02553C4CEF7;
	Fri, 12 Dec 2025 02:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765505759;
	bh=stIB81eeipJUREm+3QBOT4GGS9SJRH1LC1y24qIMnmo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z3ONK9M+N327N3vWfT5DkdKPX/dIYvQ2koNFAKJxSUivwemUVzkbEBEobjSSh0P0H
	 F8g7qbCu2ZFfFTgkuKPg6jxTWSDhZds1Tohx4UlxwtyX8LsEj6aJaic+0Q3NpKgfzf
	 oTQlCO0h9gVvIpqb8JMMF8MqBxAO8lh/C+hdMewM8NUoulXDYM9YflZzqqC2ht476n
	 X65c4oaaMnCsXwNJex2fdxnNLz+2LnQgWbevnaJ5u9mV5Cr6TKdbShVOBlxuwDAfTO
	 z6M8tWbXeYvNsDl/OjKTa1aNJZq07WwUSFooG+xqn1PbGZH7Fhrt9uh1zMCekyPTq4
	 hPVs77+D9/b4g==
Message-ID: <784ded76-227c-4968-a9f2-eb97822404bf@kernel.org>
Date: Fri, 12 Dec 2025 02:15:56 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: venus: vdec: fix error state assignment for
 zero bytesused
To: Renjiang Han <renjiang.han@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <ZnqX0ohHNwseFNet2fDemk0YpzeQraqTE3Qsd8r2HhjD-eG8CDMirTjuQ70kKtSs3NkgGOaPrxgChDdVu0wTpQ==@protonmail.internalid>
 <20251211-fix-error-state-v3-1-b429262d151c@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20251211-fix-error-state-v3-1-b429262d151c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2025 09:50, Renjiang Han wrote:
> When hfi_session_flush is issued, all queued buffers are returned to
> the V4L2 driver. Some of these buffers are not processed and have
> bytesused = 0. Currently, the driver marks such buffers as error even
> during drain operations, which can incorrectly flag EOS buffers.
> 
> Only capture buffers with zero payload (and not EOS) should be marked
> with VB2_BUF_STATE_ERROR. The check is performed inside the non-EOS
> branch to ensure correct handling.
> 
> Fixes: 51df3c81ba10b ("media: venus: vdec: Mark flushed buffers with error state")
> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> ---
> The error state assignment in the Venus vdec driver for Qualcomm
> platforms is updated to ensure that VB2_BUF_STATE_ERROR is applied
> only to non-EOS capture buffers with zero bytesused. Ensures false
> error reports do not occur during drain operations.
> ---
> Changes in v3:
> - 1, Update commit message.
> - 2, Move empty line between tags.
> - 3, Update cover letter message.
> - Link to v2: https://lore.kernel.org/r/20251208-fix-error-state-v2-1-255b62ee2eb6@oss.qualcomm.com
> 
> Changes in v2:
> - 1. Update commit message.
> - 2. Add a Fixes tag.
> - Link to v1: https://lore.kernel.org/r/20251126-fix-error-state-v1-1-34f943a8b165@oss.qualcomm.com
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..d0bd2d86a31f9a18cb68b08ba66affdf8fc5092d 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1440,10 +1440,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
>   				inst->drain_active = false;
>   				inst->codec_state = VENUS_DEC_STATE_STOPPED;
>   			}
> +		} else {
> +			if (!bytesused)
> +				state = VB2_BUF_STATE_ERROR;
>   		}
> -
> -		if (!bytesused)
> -			state = VB2_BUF_STATE_ERROR;
>   	} else {
>   		vbuf->sequence = inst->sequence_out++;
>   	}
> 
> ---
> base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
> change-id: 20251126-fix-error-state-24183a8538cd
> 
> Best regards,
> --
> Renjiang Han <renjiang.han@oss.qualcomm.com>
> 

Dikshita, Vikash.

This change makes sense to me. If you are NAKing please do so now.

---
bod

