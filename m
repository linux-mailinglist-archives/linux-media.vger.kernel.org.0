Return-Path: <linux-media+bounces-46273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCEBC30748
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 11:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59A1C188483D
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 10:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25DB316191;
	Tue,  4 Nov 2025 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOUVxZVC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41992314D39;
	Tue,  4 Nov 2025 10:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762251469; cv=none; b=aV4WteDyB+Hn9kIRUuC5O3OWzgEH/ZNJ4nApHRl4JDWbbZ2Nb/VblLpG3Q4tHysaGJI6XbdIyiFsrpuyDYDFa37p4/wr8n7ifX2QwTC0aK5qwVbRk9lWNfMSqkvdrmyjFUbPdt0/kee7nN2RYZ9dSO9qr1dLYqwVcSTyg+9+5rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762251469; c=relaxed/simple;
	bh=ttNLsP/20T6FcakaJaUuep8SMlcvj039YD36vOMH/OE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=psAVpwycW5cPqIRdI6iCIi1VzgWcXJ4bfW1PYUjC0Xdf3CTM7O1QHniuR/E778XugZ+CsI3iBgpTmNfnKNFBtkvrk23TB37XNOehB2eZdKBWz8MHFN6O4qpNnlo1PJUTty71N6Lm9fMcAXQcQp5+UfVjHPg49EqiGBhDmdowdco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOUVxZVC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1734C4CEF7;
	Tue,  4 Nov 2025 10:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762251468;
	bh=ttNLsP/20T6FcakaJaUuep8SMlcvj039YD36vOMH/OE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bOUVxZVCGq1qstUWv52ljXAE8NzkRiAHmZuBindnrfln8DMwf4QoIlm32A81MaE2f
	 OOSpIt9AQl2kFeatpJbtsuoUiERqpsGlMDQeRtLJi4DvSmp5zXUKgN6SgNjo+s+ux9
	 jkNVtbanCYm/OOK28O66fu8vCZMXbwR7GtM8FUmhDgBLwvdWm5yZUVuClN/h5Bn31+
	 6v3bhcQ2wc/Me0zQfpIEShUWtjbrpqy+tYapPZEh/c2js//IkKLy7iq+5yWv8SQ8wr
	 gZlplwsAJImxosGgPhcz2Vs6lfP56lgialaxq3xkYK4QVdbpe9HmPhGrWAhU9E7HXK
	 SVtkypQ4klcBQ==
Message-ID: <d6004442-fba0-4896-95e1-04a0c6b1dd7b@kernel.org>
Date: Tue, 4 Nov 2025 10:17:45 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Refine internal buffer reconfiguration logic
 for resolution change
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
References: <fvBCdCb-T9Aph_ehFVcrbBvq0WKOiNeL6BBlMNHABJCm52zzKRfEc5UpSLKfUqgzIYpKyJ1faCTYq111P2LAVg==@protonmail.internalid>
 <20251103-iris-seek-fix-v1-1-6db5f5e17722@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251103-iris-seek-fix-v1-1-6db5f5e17722@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/11/2025 11:05, Dikshita Agarwal wrote:
> Improve the condition used to determine when input internal buffers need
> to be reconfigured during streamon on the capture port. Previously, the
> check relied on the INPUT_PAUSE sub-state, which was also being set
> during seek operations. This led to input buffers being queued multiple
> times to the firmware, causing session errors due to duplicate buffer
> submissions.
> 
> This change introduces a more accurate check using the FIRST_IPSC and
> DRC sub-states to ensure that input buffer reconfiguration is triggered
> only during resolution change scenarios, such as streamoff/on on the
> capture port. This avoids duplicate buffer queuing during seek
> operations.
> 
> Fixes: c1f8b2cc72ec ("media: iris: handle streamoff/on from client in dynamic resolution change")
> Reported-by: Val Packett <val@packett.cool>
> Closes: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4700
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_common.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
> index 9fc663bdaf3fc989fe1273b4d4280a87f68de85d..21e176ce49ac2d2d26cf4fc25c1e5bca0abe501f 100644
> --- a/drivers/media/platform/qcom/iris/iris_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_common.c
> @@ -90,13 +90,15 @@ int iris_process_streamon_input(struct iris_inst *inst)
> 
>   int iris_process_streamon_output(struct iris_inst *inst)
>   {
> +	bool drain_active = false, drc_active = false, first_ipsc = false;
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> -	bool drain_active = false, drc_active = false;
>   	enum iris_inst_sub_state clear_sub_state = 0;
>   	int ret = 0;
> 
>   	iris_scale_power(inst);
> 
> +	first_ipsc = inst->sub_state & IRIS_INST_SUB_FIRST_IPSC;
> +
>   	drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
>   		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
> 
> @@ -108,7 +110,8 @@ int iris_process_streamon_output(struct iris_inst *inst)
>   	else if (drain_active)
>   		clear_sub_state = IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAST;
> 
> -	if (inst->domain == DECODER && inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
> +	 /* Input internal buffer reconfiguration required incase of resolution change */
> +	if (first_ipsc || drc_active) {
>   		ret = iris_alloc_and_queue_input_int_bufs(inst);
>   		if (ret)
>   			return ret;
> 
> ---
> base-commit: 163917839c0eea3bdfe3620f27f617a55fd76302
> change-id: 20251103-iris-seek-fix-7a25af22fa52
> 
> Best regards,
> --
> Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 

This is breaking in CI

https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/commit/3d6c2dff61e37bd36eeb677c061ebcf64945060a

---
bod

