Return-Path: <linux-media+bounces-50367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C903CD0FDA2
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 21:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 405EC3046413
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 20:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9310425D1E9;
	Sun, 11 Jan 2026 20:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2nxf9ay"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BE2244687;
	Sun, 11 Jan 2026 20:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768165134; cv=none; b=Q+bG3Q4mqYNWUgOM4SStx3plIc8LeHaabvbEpmIxHsPNhdBEqWF3RUVPuJDwZJz8tccyJM6u2KVDia4k/n/+aRknoguEm0m9tI8P49VriLv0aN48cJKxcY29ZCQyQr4WGv8MKjrdlBJWW4oBHwKhFA9hbkn/iOTveJWqUrqbB80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768165134; c=relaxed/simple;
	bh=I7BYBfTWV+ZrdQOUpX190/GGNn42UH6XtvpMHQmYu+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rpcpa2ihSrkfyJ0oQ0mTX0wh5lsmJoOV5zvv92dqhvRkQePBMPXrZNlVAwC61zILYVIdUvTroIjNkuAG026hyaj1HyV96spHqK6XUlyjDVDNqvzui9Isd/TIAwRRwCQz26bsGZgD4QbgfayV9LvWAhJQ/E+3IFOoB3/0dpmBfT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2nxf9ay; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454A2C4CEF7;
	Sun, 11 Jan 2026 20:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768165133;
	bh=I7BYBfTWV+ZrdQOUpX190/GGNn42UH6XtvpMHQmYu+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o2nxf9ayDDsNuHZp4o/VYCiEK1krS6c0fZGdYtCXyVqhXq8RlNPd7PHggdwVdN2vR
	 kt7TqHeRAZF2UMVQyBoPc42cIdcYsgR81j9HrsTk8nKFBhfYEat7zSqijVk+V47IZi
	 PKvKHEoHSi6eQtMePzT8LLM/KczJKhwsCuNKMX1c2YLerV5vaEIWGKSE6gy597uSYJ
	 lPieP4I9EXmjGbuoghpuoe4vaWD3UIWbX8Qc7BAQo+CvLd6NTF+uchEqseS0zuyHP8
	 8pvbsIqrMWCBORVAbekB/JOaPXpUzvJ9iptnOw6kzRWbEmeUKTXogn4KUCpliIfsTP
	 GOiVD+1/BEVWw==
Message-ID: <db61a94f-c24f-453b-ba0f-68a1ca55f787@kernel.org>
Date: Sun, 11 Jan 2026 20:58:46 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] soc: qcom: ubwc: add missing include
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <qI842TAdbRfELK9X6o_rrqcG72Pmql8uUc_nFchh5O5-tLvUxCNuyVGA50PkT9yCjJBnR9zi3eancJe2g-WCHQ==@protonmail.internalid>
 <20260110-iris-ubwc-v1-1-dd70494dcd7b@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260110-iris-ubwc-v1-1-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2026 19:37, Dmitry Baryshkov wrote:
> The header has a function which calls pr_err(). Don't require users of
> the header to include <linux/printk.h> and include it here.
> 
> Fixes: 87cfc79dcd60 ("drm/msm/a6xx: Resolve the meaning of UBWC_MODE")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   include/linux/soc/qcom/ubwc.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index 0a4edfe3d96d..f052e241736c 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -8,6 +8,7 @@
>   #define __QCOM_UBWC_H__
> 
>   #include <linux/bits.h>
> +#include <linux/printk.h>
>   #include <linux/types.h>
> 
>   struct qcom_ubwc_cfg_data {
> 
> --
> 2.47.3
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

