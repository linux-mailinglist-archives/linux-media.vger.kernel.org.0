Return-Path: <linux-media+bounces-50735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A643D2189F
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 23:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EADF302D5ED
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 22:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BA23AEF4F;
	Wed, 14 Jan 2026 22:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZtbw+tQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E291731ED81;
	Wed, 14 Jan 2026 22:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768429204; cv=none; b=II9NY7gk3u2klkpQq7lWg2ZAcOaS1oYEJ0xnRgku9pfZrYvi0wB5F6jzkb2ll+WD3z81qDGcKz/PlJTaWbK6F8ZVizkkUZciWVE4GMhwnnz6oMP2N+2jee2mfVwGK6G+wC64/+8kU2vX+bBYnhC78v5bGdVD3EjG3ICfPuh2xKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768429204; c=relaxed/simple;
	bh=ED+C9SPEf+F7KF8/53YCnW0dTpILBuJE18W4axrkCeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=neFG7iM6KU5oQlkcFNJDYeHPfZvj1pgQOnXWhSU/fK7O6FQpeyjcd7tOO+v+jdvj1VxCmUSg/I1j1vNfWq0+14v5E4mF1IMeDQBiZ0/M0um7FFSKE1YcvhnWxPmcAi12640hET/ktu4VwN/4A8f4XCNO3or7iSUWQjiSisDoYVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZtbw+tQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161E5C4CEF7;
	Wed, 14 Jan 2026 22:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768429200;
	bh=ED+C9SPEf+F7KF8/53YCnW0dTpILBuJE18W4axrkCeg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YZtbw+tQ0oFba1BsmQjAbZR3XzlRWEiaHrfSj7f/kXne43KFYFwDEeLLHotX3ZAir
	 t3DOxy4vnprAdCzomrIyvonl1LyYjEhYvofivQkD5FcLFHa31OnCeHzgVOn2qdXGKU
	 f8TSueUk3x841JpPV2K9YgFMMf3SH8oE8G2d+H+jy2ZqPCOwmcbYHIfRwOWU3f6ezE
	 AmJVNrqP/KMLWpHFBKWGLZvWdz/8Jgw5WwPJhF1InNm3rUY4vXanjFV+wGG3UwpoYO
	 g2CXDF92ThmurHZxrmFG/omW2E0G5gvZT8PvJZMZfj0u7D1goM9rbkejaTblJP9YOt
	 PlxNn0urx2Acg==
Message-ID: <58561346-37c5-4cf6-b3e0-7da6d1aab405@kernel.org>
Date: Wed, 14 Jan 2026 22:20:06 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: iris: Document difference in size during
 allocation
To: Ricardo Ribalda <ribalda@chromium.org>, Keke Li <keke.li@amlogic.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251223-warnings-6-19-v3-0-e8f56cb204ec@chromium.org>
 <RV-SdR_SZVtiku1mZm8CbXblMWyzjSWMRX6DGu5k3ruLhyyu9vd8NGgkzIA06Mk-gpGo0b4vHb1PkAUk2EI0lg==@protonmail.internalid>
 <20251223-warnings-6-19-v3-1-e8f56cb204ec@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20251223-warnings-6-19-v3-1-e8f56cb204ec@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/12/2025 10:02, Ricardo Ribalda wrote:
> As we get ready for kzalloc checking for invalid sizes, let's add
> documentation for the cases where the size is different but valid.
> 
> This patch fixes this cocci warning:
> ./platform/qcom/iris/iris_hfi_gen2_command.c:1215:9-25: WARNING: casting value returned by memory allocation function to (struct iris_inst *) is useless.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index f9129553209922fda548ca320494ae6ae797854c..c120ea3594fb5d0f40d6b9a7c67ffc28c42109f0 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -1212,5 +1212,10 @@ void iris_hfi_gen2_command_ops_init(struct iris_core *core)
> 
>   struct iris_inst *iris_hfi_gen2_get_instance(void)
>   {
> -	return (struct iris_inst *)kzalloc(sizeof(struct iris_inst_hfi_gen2), GFP_KERNEL);
> +	struct iris_inst_hfi_gen2 *out;
> +
> +	/* The allocation is intentionally larger than struct iris_inst. */
> +	out = kzalloc(sizeof(*out), GFP_KERNEL);
> +
> +	return &out->inst;
>   }
> 
> --
> 2.52.0.358.g0dd7633a29-goog
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

