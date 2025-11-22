Return-Path: <linux-media+bounces-47615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 742BCC7D3D0
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 17:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 89E734E4FAC
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 16:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF36E28D83F;
	Sat, 22 Nov 2025 16:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ub/VKTxl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275541DF755;
	Sat, 22 Nov 2025 16:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763828225; cv=none; b=NCM4EA9isBKjPa/vJJpRkMrb7oLJNEDdOatfvJOceLIeifnamU7ymXxy+X7H1ll4RlRfVGFPW5ttuvc1kqVAnWZ0C4s04WXdHoJqAFqWOROrpRKSpqJXarFD8lr4jAdojI+0WgWcJ+q3Sk0c8w1aj0oatLKHsQ0xya8/Ud2APr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763828225; c=relaxed/simple;
	bh=Jl5QOHm4dlknrlqq9uEeExy8mu6Zpdxhj8VTMXIz6Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K+TubqudYEnttn2261fcXFEPMAiLZWR0fqKgyV9ygs+nPlqzlYmYwIj/8TY4pz0hDNzYorSX0Mi+vxsNDWruaOTNECE9FHU2XPiZD9zGcOcyosdbARJRgY3FwDj4eub7zhB/b7Aj9rL7QgHSdOtLk0vkg71r6Tq+ECvyJocWhoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ub/VKTxl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6620C113D0;
	Sat, 22 Nov 2025 16:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763828224;
	bh=Jl5QOHm4dlknrlqq9uEeExy8mu6Zpdxhj8VTMXIz6Kk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ub/VKTxl50oYz7DjtO+G5wLp1CuF1AWMAH2vpwq4CQayed9wfcbdHGTQdRe0RX4ZD
	 qFqLs6hr59NBUZ/OKfiFSw4q0h3VH8VL92pETaot/DApdVp6qWKXCXvprvwxBIFE+L
	 JGUImv3Qj6nU75d6ur1Xl/dSTTouHNz8KRbs0fltJSocTBWGeFJBv38qoxIxkuugYY
	 sEkqgGF31pttK1GiJfPc7PkjZb0JFMkcjFa0Q0gAoDqJb4Ei2dwomy1Vs8wNmYGo0h
	 5KLsaZPULIurLMX7sbm379bvQ91yGaffOmI/PHk/msb/hwbB6fAxcbnEXfW/joXyAt
	 Let2DWEcTUvKQ==
Message-ID: <e352c37c-90f6-4f52-8c24-baeae2883bf9@kernel.org>
Date: Sat, 22 Nov 2025 16:17:00 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <3FJhEomSdQ2CUrDJZaWiNVmSKYmUGylmoUUZc_15p0xnLmG_gydDxIyJDrUnemnatDXNOtQAqbWytjZ-xZAJ_w==@protonmail.internalid>
 <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2025 18:43, Jorge Ramirez-Ortiz wrote:
> The Venus encoder and decoder video devices currently report the same
> bus_info string ("platform:qcom-venus").
> 
> Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
> parent device name. With this change v4l2-ctl will display two separate
> logical devices
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 5 +++++
>   drivers/media/platform/qcom/venus/venc.c | 5 +++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 4a6641fdffcf..63f6ae1ff6ac 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -433,9 +433,14 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
>   static int
>   vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>   {
> +	struct venus_inst *inst = to_inst(file);
> +	struct venus_core *core = inst->core;
> +
>   	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
>   	strscpy(cap->card, "Qualcomm Venus video decoder", sizeof(cap->card));
>   	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "platform:%s:dec", dev_name(core->dev));
> 
>   	return 0;
>   }
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index b478b982a80d..520689f5533d 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -144,9 +144,14 @@ static int venc_v4l2_to_hfi(int id, int value)
>   static int
>   venc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>   {
> +	struct venus_inst *inst = to_inst(file);
> +	struct venus_core *core = inst->core;
> +
>   	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
>   	strscpy(cap->card, "Qualcomm Venus video encoder", sizeof(cap->card));
>   	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "platform:%s:enc", dev_name(core->dev));
> 
>   	return 0;
>   }
> --
> 2.43.0
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

