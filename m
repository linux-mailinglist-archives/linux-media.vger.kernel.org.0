Return-Path: <linux-media+bounces-42487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 429BFB561AB
	for <lists+linux-media@lfdr.de>; Sat, 13 Sep 2025 16:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F20F8AA470E
	for <lists+linux-media@lfdr.de>; Sat, 13 Sep 2025 14:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A776A182B4;
	Sat, 13 Sep 2025 14:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4/BJusI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DC88460;
	Sat, 13 Sep 2025 14:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757775273; cv=none; b=nwN7NBBkqWrd2XpBlC7LuC36GNr9fqieFY/dMhtgCN7h/ZKeu8kSvjgBvgOUSEvCGfy73nxfg/lzY9aoGciNpnGTkD7dqJzNbmcO7ot/Bvvlgnkd4RJelv5tVq0xRDAGVFooIcnnqWVU0ma04zJpsZtT5H5n5AAJijshGZRMnHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757775273; c=relaxed/simple;
	bh=deph2n7EsQq+rZQVBJI1J9VmYk8+NHBuBRjSCjvpYrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sA+os+UhSD9i2S1RmqJDtT6fBCVUn8hEREAmyF1oWzsBLRuijLgvkeOaQ+56+G7Wv5BPTnq0jerWb8CabiQyzUhLklGv0wBJVbFAfXw5zR/ZwRVyMQ/ub2++LIG+TKH+KYv3MtsPfepbk9oQdHbA/f6B+nLT4WaU098aXD0WupM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4/BJusI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD94C4CEEB;
	Sat, 13 Sep 2025 14:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757775272;
	bh=deph2n7EsQq+rZQVBJI1J9VmYk8+NHBuBRjSCjvpYrc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I4/BJusIJfB3pe8YGxSjg9oW/C9M4REAfsLM2Y8PJg8Q3yZJg3rAPKqiDeEuNM1/D
	 I1TU8l0hH+njdNS0GK9mzJUgxT31dbgKs3xS2VmyybN1DA+z7GGdGbBRaksK2yY1Kx
	 eymbFLKeePLkKeJ98oW47cKo+9F/D4AQouCoO0jaZfsRx4ym+MO+J0CVvcX0XEvAcd
	 2/p7G0TgpXyl1fqkfe9jx3Sop+89zQJUOoaetPdT8CX1NIswz2IgwHY1bewV8a0kK4
	 vD38TMlMLOe+BcB+9pxJwNqKmLEdIxEERzsqekI8bajBPfDthS1g59bYexnWaaZPyS
	 3iQD+G6oQ2mJQ==
Message-ID: <91181e2d-e595-42e7-a782-9ee654682036@kernel.org>
Date: Sat, 13 Sep 2025 15:54:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] firmware: qcom_scm: Introduce PAS context
 initialization helper
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <XZzG2CzCeL2c_o0VF9cgreULVU7nO6oDduio5EO50shVXg90DhDFECfckmvcrvT5ALpQb-UB5y9c-0KOT1VB0w==@protonmail.internalid>
 <20250819165447.4149674-2-mukesh.ojha@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250819165447.4149674-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2025 17:54, Mukesh Ojha wrote:
> Currently, remoteproc and non-remoteproc subsystems use different
> variants of the MDT loader helper API, primarily due to the handling of
> the metadata context. Remoteproc subsystems retain this context until
> authentication and reset, while non-remoteproc subsystems (e.g., video,
> graphics) do not require it.
> 
> Unify the metadata loading process for both remoteproc and
> non-remoteproc subsystems by introducing a dedicated PAS context
> initialization function.
> 
> By introducing qcom_scm_pas_ctx_init(), we can standardize the API usage
> across subsystems and reduce the number of parameters passed to MDT
> loader functions, improving code clarity and maintainability.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/firmware/qcom/qcom_scm.c       | 26 ++++++++++++++++++++++++++
>   include/linux/firmware/qcom/qcom_scm.h | 11 +++++++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 96d5cf40a74c..33187d4f4aef 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -558,6 +558,32 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>   		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
>   }
> 
> +void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
> +			    size_t mem_size, bool save_mdt_ctx)
> +{
> +	struct qcom_scm_pas_ctx *ctx;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return NULL;
> +
> +	ctx->dev = dev;
> +	ctx->peripheral = peripheral;

One things that is confusing here is renaming this variable to peripheral.

It gets initialised from a thing called "pas_id" and then gets sent into 
other functions which name the incoming variable as pas_id.

i.e. you will want to do
-       ret = qcom_mdt_pas_init(pas->dev, pas->firmware, 
rproc->firmware, pas->pas_id,
-                               pas->mem_phys, &pas->pas_metadata);
-       if (ret)
-               goto disable_px_supply;
-
-       ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, 
rproc->firmware, pas->pas_id,
-                                   pas->mem_region, pas->mem_phys, 
pas->mem_size,
-                                   &pas->mem_reloc);
+       ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, 
rproc->firmware,
  -                              pas->mem_region, &pas->dtb_mem_reloc);
++                              pas->pas_id, pas->mem_region, 
&pas->dtb_mem_reloc);

and

-       return __qcom_mdt_load(ctx->dev, fw, firmware, mem_region, 
ctx->mem_phys,
+       return __qcom_mdt_load(ctx->dev, fw, firmware, ctx->peripheral, 
mem_region, ctx->mem_phys,
                                ctx->mem_size, reloc_base);

But it should be ctx->pas_id to be consistent and make it obvious what 
data is being passed.

Can you stick to the established naming convention and stick with pas_id 
here ?

Even if the above fixups on 6.17 aren't right the point is it only adds 
confusion to randomly change variable names for no reason.

Please stick to the established naming convention.

--
bod

