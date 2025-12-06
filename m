Return-Path: <linux-media+bounces-48360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53763CAAF9A
	for <lists+linux-media@lfdr.de>; Sun, 07 Dec 2025 00:57:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0B063064544
	for <lists+linux-media@lfdr.de>; Sat,  6 Dec 2025 23:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998D72DC765;
	Sat,  6 Dec 2025 23:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzpK36ZL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7A4296BBD;
	Sat,  6 Dec 2025 23:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765065397; cv=none; b=QJzo8BDIIqGO0MMxvCiQs3K2EQxvxI/yHNhvSZXB14+DS+Dweh808o3mgKF9tnbg14CLjl3c0E1mZ2SQpCD0eu9qXxG19oYjLIUWAdyRCvTewjXZ23cYDkrnX1WE01W8g4GdKg2pNY+wB6mucQ8Fo50oBVHRMueYpUmgptCYkMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765065397; c=relaxed/simple;
	bh=s/TyOeDY6EYqBlrXN5BR6NnJMBkrTUR1FU2VsfYuvD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NXOpMdIPvyxyw8Z64KH4mAu94G9gjDDgO3vCo8B3OkfpIucOW0tWFIsmriq27Vt83Ul7xDGBr4hncCqUBlixbxmD6WtJbm0VoxUj16U2yevIZ7BLh072Te1CKx7qsYicBJw8/Mn6ZtRbyh4Xj23bqIYI2KnS1gw5wtuqEfTtzE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzpK36ZL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2AAC4CEF5;
	Sat,  6 Dec 2025 23:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765065396;
	bh=s/TyOeDY6EYqBlrXN5BR6NnJMBkrTUR1FU2VsfYuvD0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bzpK36ZLF8FUFN473r2Gyxa5b7dwpZzSatWegNcKA+HwfkpfFBNzagUhwBzQ5lI26
	 DTBbfohduQq4YXM7rBnIFgU84pOJhm6gDhln2l+x3HXAPVaXGyaImqjtIcxIM1gOvF
	 X2G4468qAr/eAGvYMDcBtNikGMz7CqXW3gHlwb61bcONhxeS8Pkb+DL0C4MupKh25p
	 tuXPkIW0Kq7m/ZfChVxY6y6Gqao+MLkPsMS8JbHP65epWGcJQFnX5UEp5kMrOyyZfk
	 fMu+LTiZ0QSvxG1zPRt19yK/f+ljWxAa7TqFViKNiS9D3WBYEnwoHeHZAdGoPX6EiE
	 +AioHp/YMDz2w==
Message-ID: <5516cc69-de15-44df-bfbf-8263e71c919a@kernel.org>
Date: Sat, 6 Dec 2025 23:56:32 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: vdec: fix error state assignment for zero
 bytesused
To: Renjiang Han <renjiang.han@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <3TiW-6pGFzHye29VWlJBXCdsteVQOc5LlAPyURHQMjIMusStSaLFbZE_dWv8B9GPFjM91n17iLSlulpcBpy4ow==@protonmail.internalid>
 <20251126-fix-error-state-v1-1-34f943a8b165@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251126-fix-error-state-v1-1-34f943a8b165@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/11/2025 04:23, Renjiang Han wrote:
> Previously, the check for zero bytesused and the assignment of error
> state was performed outside the V4L2_BUF_FLAG_LAST branch, which could
> incorrectly set the error state during drain operations. 

This deserves more elaboration.

Instead of saying previously - talk about what it currently does and the 
precise circumstances under which it goes wrong. Try to make the 
description as plain and concise as possible.

This patch
> moves the zero-bytesused check inside the 'else' branch, ensuring that
> the error state is only set for non-EOS buffers with zero payload.
> 
> Additionally, the patch keeps the rest of the buffer state handling
> logic unchanged, including handling of HFI_BUFFERFLAG_DATACORRUPT and
> HFI_BUFFERFLAG_DROP_FRAME.

I don't think you need to tell us what's not touched in your commit log.

- Tell us what is wrong directly and plainly.
   Include how the bug you are fixing can come about i.e. under what
   circumstances we would see the error.

- Then tell us how you've fixed it.

- And include a Fixes: tag please.
   Since this is a bug fix you are proposing, it needs to be backported.

> 
> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> ---
> This patch refines the error state assignment logic in the Venus vdec
> driver for Qualcomm platforms. Specifically, it ensures that the buffer
> state is only set to VB2_BUF_STATE_ERROR for non-EOS capture buffers
> with zero bytesused, preventing false error reporting during drain
> operations.
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


