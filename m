Return-Path: <linux-media+bounces-26488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4DFA3DE5E
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71C4416CC3C
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F96A1FDA99;
	Thu, 20 Feb 2025 15:23:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D8F61FCE;
	Thu, 20 Feb 2025 15:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065017; cv=none; b=okxCgWUdYsdc6E5rottsKSQY8a7pMBNzWFyLbb/yu/V26FgczeTfZDrglWVNhpJQrPVFtkm0vLrDzEcv+9j9H0UVTajZdt0GcAlP5k+f6y4HM3p/NzluWwierUQWkT5LDewD42FEBYdd0tcRC5+gQpSnH1T4GC/mV8XjSJUg464=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065017; c=relaxed/simple;
	bh=U68v7cOKxOImHE/lUvUVXUiZlzQLpKd7IKB/KFsKEj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HC1mf08q5zsgGpDdx18R5j46QT9fmT/kuGFkCCO/sUcxrC0z1ypaY0xG8ntOuR8mq5X1edN+zPncrn6kRNPrkxDg1nYWBKZbZy8q8JDdnXvDq2LEG07O19onCdvJqyB3gk/0Rq9PHG19iVhhr3VDeFqdWEKlwpaTRDuwygKxgnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2931C4CED1;
	Thu, 20 Feb 2025 15:23:34 +0000 (UTC)
Message-ID: <e794c047-ab0e-4589-a1d2-0f73b813eacc@xs4all.nl>
Date: Thu, 20 Feb 2025 16:23:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] media: venus: hfi: add a check to handle OOB in
 sfr region
Content-Language: en-US
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250207-venus_oob_2-v4-0-522da0b68b22@quicinc.com>
 <20250207-venus_oob_2-v4-4-522da0b68b22@quicinc.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20250207-venus_oob_2-v4-4-522da0b68b22@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/7/25 09:24, Vikash Garodia wrote:
> sfr->buf_size is in shared memory and can be modified by malicious user.
> OOB write is possible when the size is made higher than actual sfr data
> buffer. Cap the size to allocated size for such cases.
> 
> Cc: stable@vger.kernel.org
> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_venus.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index 6b615270c5dae470c6fad408c9b5bc037883e56e..c3113420d266e61fcab44688580288d7408b50f4 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -1041,18 +1041,23 @@ static void venus_sfr_print(struct venus_hfi_device *hdev)
>  {
>  	struct device *dev = hdev->core->dev;
>  	struct hfi_sfr *sfr = hdev->sfr.kva;
> +	u32 size;
>  	void *p;
>  
>  	if (!sfr)
>  		return;
>  
> -	p = memchr(sfr->data, '\0', sfr->buf_size);
> +	size = sfr->buf_size;

If this is ever 0...

> +	if (size > ALIGNED_SFR_SIZE)
> +		size = ALIGNED_SFR_SIZE;
> +
> +	p = memchr(sfr->data, '\0', size);
>  	/*
>  	 * SFR isn't guaranteed to be NULL terminated since SYS_ERROR indicates
>  	 * that Venus is in the process of crashing.
>  	 */
>  	if (!p)
> -		sfr->data[sfr->buf_size - 1] = '\0';
> +		sfr->data[size - 1] = '\0';

...then this will overwrite memory. It probably can't be 0, but a check or perhaps
just a comment might be good. It looks a bit scary.

Regards,

	Hans

>  
>  	dev_err_ratelimited(dev, "SFR message from FW: %s\n", sfr->data);
>  }
> 


