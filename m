Return-Path: <linux-media+bounces-28934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ED5A74E34
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A4413B4597
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 16:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291FB1D89EF;
	Fri, 28 Mar 2025 16:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1tIPmXK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B7E1D5CEA;
	Fri, 28 Mar 2025 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743177919; cv=none; b=uoSspX94WqLYQAfuu1cP6DTRy9geWSFSMzk7auGaOWZN0pb1U4qEHlTagwrx+0VYbZVschsN3LhLVTdUxirFgiz4+6m6o5ghmEwrqkf74Ipf8yMHkbKeT1pH2IXBOKviyqH5ADwzfeDXzXm6n4i+jYcfJd5Nb+hgkYfT202kPko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743177919; c=relaxed/simple;
	bh=CFlANhU+ZE+m5Gtmb3FvNU2l5+7whEjcuRm7eK23lZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A9bsAKz/AHFhmTjuD+FaujiXddU8jmqFzW2k6xTl+BA64ouWTtXu+URmFjtLn+g32d9Tw7hcHZyC0kg19PdMm5ytS5PJviMJKnmTqc5+IYfrGPvwZqhOTGNBJiYJBuRh5xEwasrnOZougtS4AkBkiWg9Maf4fw1dQ27NEougTkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1tIPmXK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E63AFC4CEEA;
	Fri, 28 Mar 2025 16:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743177919;
	bh=CFlANhU+ZE+m5Gtmb3FvNU2l5+7whEjcuRm7eK23lZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O1tIPmXKLxKU3dOMxDp6NvmX366uzlAobN5549P4aZiD5h4dLx653XRQWEzUATa3W
	 9orAO1+/3xS8BIPKuaWObXzyZL9swStVx4b108ixyUNnLJkdKDx+i67tZR97nDzU7I
	 noC8Cs8aF+f1iVdcI9SghsfxwKY2hTLilWMGV0P8E2xk9YPLY4RiyH1oBCGjSbXfNe
	 kvZcdJPbFbs4TUU31O6W6WI2rhnKbgRMpu4jIjIcDqqepR84v1Q+3YY7TbDsCM7vmB
	 pXFwkmVnNdgl/lXU11C3TGIBq+9uOP2MHMS74SqC68X1tOv79P6c8o9cGeXRh+PnO5
	 Pyj85lHTrbwwg==
Message-ID: <47a2cfb1-314d-407d-a7ca-2d616b4c6d0a@kernel.org>
Date: Fri, 28 Mar 2025 16:05:14 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: Fix probe error handling
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
 stanimir.k.varbanov@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 bryan.odonoghue@linaro.org
References: <riuofNmnHEZYFpNAkKYNZAEin3vihrkFlhukRCsZ_HfO7ZpmXiKVG9N-ICxJKdufFrlmf-DhDoUdjI2EBANAKA==@protonmail.internalid>
 <20250327125304.1090805-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20250327125304.1090805-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 12:53, Loic Poulain wrote:
> Video device registering has been moved earlier in the probe function,
> but the new order has not been propagated to error handling. This means
> we can end with unreleased resources on error (e.g dangling video device
> on missing firmware probe aborting).
> 
> Fixes: 08b1cf474b7f7 ("media: venus: core, venc, vdec: Fix probe dependency error")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/core.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index c4438e4b2d9b..103afda799ed 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -438,7 +438,7 @@ static int venus_probe(struct platform_device *pdev)
> 
>   	ret = v4l2_device_register(dev, &core->v4l2_dev);
>   	if (ret)
> -		goto err_core_deinit;
> +		goto err_hfi_destroy;
> 
>   	platform_set_drvdata(pdev, core);
> 
> @@ -476,24 +476,24 @@ static int venus_probe(struct platform_device *pdev)
> 
>   	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC);
>   	if (ret)
> -		goto err_venus_shutdown;
> +		goto err_core_deinit;
> 
>   	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_ENC);
>   	if (ret)
> -		goto err_venus_shutdown;
> +		goto err_core_deinit;
> 
>   	ret = pm_runtime_put_sync(dev);
>   	if (ret) {
>   		pm_runtime_get_noresume(dev);
> -		goto err_dev_unregister;
> +		goto err_core_deinit;
>   	}
> 
>   	venus_dbgfs_init(core);
> 
>   	return 0;
> 
> -err_dev_unregister:
> -	v4l2_device_unregister(&core->v4l2_dev);
> +err_core_deinit:
> +	hfi_core_deinit(core, false);
>   err_venus_shutdown:
>   	venus_shutdown(core);
>   err_firmware_deinit:
> @@ -506,9 +506,9 @@ static int venus_probe(struct platform_device *pdev)
>   	pm_runtime_put_noidle(dev);
>   	pm_runtime_disable(dev);
>   	pm_runtime_set_suspended(dev);
> +	v4l2_device_unregister(&core->v4l2_dev);
> +err_hfi_destroy:
>   	hfi_destroy(core);
> -err_core_deinit:
> -	hfi_core_deinit(core, false);
>   err_core_put:
>   	if (core->pm_ops->core_put)
>   		core->pm_ops->core_put(core);
> --
> 2.34.1
> 
> 
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

