Return-Path: <linux-media+bounces-49530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1D5CDD8AE
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 09:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AF303024E75
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 08:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B20314B71;
	Thu, 25 Dec 2025 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9s3prX2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D91F12D1F1;
	Thu, 25 Dec 2025 08:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766652696; cv=none; b=uoHBTtw4Jq+5BuRpi0EhO6N202Ae61/9MIkdBksQOfIBh1MdqRIrefVXG8e72TTQIBiUYAjhdwxCUOVuDR2FuVMpwIqpcRtWtOMszmW0sB+wclItKiK3sv5mYU9DFvrRwoWjO883XdB2777Av9bgKHKRcSCTsO+G/hNK25mMQo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766652696; c=relaxed/simple;
	bh=3UV4DtutfPyO75iOBUcWmz9SnLWXZ0xwAtq1YipeqCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uo7Ek8uq3cBJGP66Wpi8BxpjfGcB07Uo87CTBEGZt2vKJoWeHKpSKq+dphIiOTvUYk8UwOjsbU0m8y4Pf0hlh0IQXOSPvdQZZepELh/Tu1MNRFxMwJwOKd4SgxPJE7+nOKbEyAj6OugAdYxugyhlUnsFaFmZ91tcqvII2jr08uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9s3prX2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43261C4CEF1;
	Thu, 25 Dec 2025 08:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766652695;
	bh=3UV4DtutfPyO75iOBUcWmz9SnLWXZ0xwAtq1YipeqCg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p9s3prX2epwxMJRGpl7QSklTcZ7sYzjbwMB0EqyRkU3+bGtM1ffL9Fvr0lrJQz4PH
	 tP+3wFY1OyEjrEADLVgCSpJw4+DytdfpfXqnCrPcQoGVpeFAVFn8hIzr5zDLMcfBZe
	 Ykv+asTK9qrXm4lvzRFCIF/ZPTt1WL2q0ICDTLBTnkxnJBqlBYDsxL3mlQVaAs4fo0
	 gN54jLtmtVdGYqNowe+1aneqtSnceqAx9XazeiVQir3A/sg1+8b9XWR1mtt+PeZ1cu
	 WZsIZat9YsKurAM08v4WulB9B7yHIu83kHHw71YZMmqVaWh9KubzK+ef6zZB08/sW+
	 jOw6DWXtaJhCg==
Message-ID: <5bead89d-ede4-489a-b421-d38f1e7c91b7@kernel.org>
Date: Thu, 25 Dec 2025 08:51:29 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] media: iris: Skip resolution set on first IPSC
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
 <20251224-iris-fixes-v1-2-5f79861700ec@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20251224-iris-fixes-v1-2-5f79861700ec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/12/2025 06:27, Dikshita Agarwal wrote:
> The resolution property is not supposed to be set during reconfig.
> Existing iris_drc_pending(inst) check is insufficient, as it doesn't
> cover the first port setting change.
> 
> Extend the conditional check to also skip resolution setting when
> the instance is in IRIS_INST_SUB_FIRST_IPSC.
> 
> Fixes: caf205548769 ("media: iris: Avoid updating frame size to firmware during reconfig")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 52da7ef7bab08fb1cb2ac804ccc6e3c7f9677890..5087e51daa842515e9d62730680fb237bf274efa 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -733,7 +733,7 @@ static int iris_hfi_gen1_set_resolution(struct iris_inst *inst, u32 plane)
>   	struct hfi_framesize fs;
>   	int ret;
>   
> -	if (!iris_drc_pending(inst)) {
> +	if (!iris_drc_pending(inst) && !(inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)) {
>   		fs.buffer_type = HFI_BUFFER_INPUT;
>   		fs.width = inst->fmt_src->fmt.pix_mp.width;
>   		fs.height = inst->fmt_src->fmt.pix_mp.height;
> 

Take this on trust I guess.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

---
bod

