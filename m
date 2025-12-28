Return-Path: <linux-media+bounces-49609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4B1CE5255
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 16:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D78E03029C7A
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 15:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2512E2D47E6;
	Sun, 28 Dec 2025 15:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VHlYLtV7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BD91EA7F4;
	Sun, 28 Dec 2025 15:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766937222; cv=none; b=oILN69XVovfvaMpz19PESy3iv+M5/1bfDD/gKk3Bfyt2CjsWm6ncq8nKKlmAGg/hqnO1glOEOZAKBSw9BGn9sPMiqziTUmabdKr1xnw/OiDl3EJec6j3wNb5XCCXIKyW37Mc5kz3DKjb3OVqTWqwlFiaNjbRdbYEGc6iwuZOH6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766937222; c=relaxed/simple;
	bh=j2awahrFpurpw0Vup+/QWSwURVtxPw4n2RBnALYIH3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RMZ6El3j2dg9C9zn9miOEAht9uAJfemGbuHBFLuR9OEM1QMIhD0fxtao1vfoydIIDzcjSJg/f1UD7St55N8GuOGxaB7GaN5sgo8BW1pOMpFWjm6GCeHtrk2szA0ZC7uQF/EyiQcAeEWnurJZqhxg2QcZr8522rqpCbG3SmraFbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VHlYLtV7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AF4C4CEFB;
	Sun, 28 Dec 2025 15:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766937222;
	bh=j2awahrFpurpw0Vup+/QWSwURVtxPw4n2RBnALYIH3s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VHlYLtV7MxM1xqHmtznKvlF3davomVdrbQY1DTakQFH9GXDDMflviztrV/HB5n03C
	 qxcC5T2OTwV7R4PKnSy5034ZPjz2JJRZxyGyc6e06S9zvKRW6971tgWqUqvLkc22br
	 IrC5dgJsDwHyV0fp8bxY0CXuf0hvY2+AIyZrZgpZcFn6TY6fOde+4ysFfGdaWOA6JN
	 6VaOc4EVp1GEDn7L12Y8BLX843U9uu3mAw0hfazjNeJuf/E6yToeyrE6rOdqJM6M+4
	 h0fgJLO6Mjwul/371zd2Zg2mMSo6m0HpNb9DExjNGGIMjByzcA8v5Du8Ek+Rf3p/yc
	 XGuDNFskdPBdA==
Message-ID: <29e3582c-1405-4081-a39f-7d23af9e17af@kernel.org>
Date: Sun, 28 Dec 2025 15:53:38 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] Revert "media: iris: Add sanity check for stop
 streaming"
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
 <L9dRhKXlm751N5hAiG19hg3OE1socxMq-nNE7RExm-55uOWPaAwVmEwryRvAwVFAu3Chgks5R4Wu2annIZ4T2Q==@protonmail.internalid>
 <20251224-iris-fixes-v1-4-5f79861700ec@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251224-iris-fixes-v1-4-5f79861700ec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/12/2025 06:27, Dikshita Agarwal wrote:
> Revert the check that skipped stop_streaming when the instance was in
> IRIS_INST_ERROR, as it caused multiple regressions:
> 
> 1. Buffers were not returned to vb2 when the instance was already in
>     error state, triggering warnings in the vb2 core because buffer
>     completion was skipped.
> 
> 2. If a session failed early (e.g. unsupported configuration), the
>     instance transitioned to IRIS_INST_ERROR. When userspace attempted
>     to stop streaming for cleanup, stop_streaming was skipped due to the
>     added check, preventing proper teardown and leaving the firmware
>     in an inconsistent state.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vb2.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index db8768d8a8f61c9ceb04e423d0a769d35114e20e..139b821f7952feb33b21a7045aef9e8a4782aa3c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>   		return;
> 
>   	mutex_lock(&inst->lock);
> -	if (inst->state == IRIS_INST_ERROR)
> -		goto exit;
> 
>   	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>   	    !V4L2_TYPE_IS_CAPTURE(q->type))
> @@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>   		goto exit;
> 
>   exit:
> -	if (ret) {
> -		iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
> +	iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
> +	if (ret)
>   		iris_inst_change_state(inst, IRIS_INST_ERROR);
> -	}
> +
>   	mutex_unlock(&inst->lock);
>   }
> 
> 
> --
> 2.34.1
> 

A revert like this should very obliviously have a Fixes:

---
bod

