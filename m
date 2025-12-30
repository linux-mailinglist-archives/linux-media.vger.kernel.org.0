Return-Path: <linux-media+bounces-49696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D48ECE96BC
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 11:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 826BA30621CB
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3D62E8DE6;
	Tue, 30 Dec 2025 10:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dqNk1Rw/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA78212557;
	Tue, 30 Dec 2025 10:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767090814; cv=none; b=b/XlYdfjWZ8smOUo1odtSJJFtljeA+5+PDCjpXGjps/j+b9hPd3eBHqz30BAbRI/0pqu0g790QnlPVU5zULCGxWy0DxNKku8BwBu9kbMyVTQSjh4m4k8fho/l5CvdmR2adRNASyV9neOYAE9nFF22XR0FjvKYW18UDdFupwJP/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767090814; c=relaxed/simple;
	bh=2M5qqTQPUuHpq7jpnJEUWWC992coczz0E9KoEca4IX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rBHpCRFQa2SIFfJAwgSzAlv4w3WndowhcLflEoB30ycHhzEbtQvBzF3uvQc8g7dzUyqWQsE65l/UU1jfyC3RFnbEVWe6cBLvgSGwbgu4EHL8tpqsCCWfvjW1+uSutQzj5tSdj0gM1NUwbo0uq2CWl0iZEQIjUS9anldT5nAUWXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dqNk1Rw/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC66C4CEFB;
	Tue, 30 Dec 2025 10:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767090813;
	bh=2M5qqTQPUuHpq7jpnJEUWWC992coczz0E9KoEca4IX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dqNk1Rw/twkbYPisETknR1rBaeBHS2dqgB1BJ6irdpbxigfRxy4vuPj5jUPJiGQ5U
	 Khix8UiQyrbuTGVVX/0cvrWrd20/W6T5S54BBWfrLuMjfdRK80uvFfAgjtN6Vfjd2C
	 j7G2M2nzvUq5gXddnDy2kaUmsuBfdVh6rh+yMGPozwvjpP/WGrckFcbZscFgx7dgRM
	 uPKbQl6qUijwePBvcfsSEhY7dY73YTiS0OnGf8spquF3YlIwbD96BjFQb9kHXdMnvM
	 V8PoRsbt4bvQdY6dcHEg+9QTPAQvOdNztjf+POWyFF9iNboK8DPeJV+RfIJpXxFXz5
	 hlwUdaW0JtSvQ==
Message-ID: <002b8748-eee3-4bd8-bdb4-365ea949a969@kernel.org>
Date: Tue, 30 Dec 2025 10:33:28 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] media: iris: gen2: Add sanity check for session
 stop
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <O9VbTIO27YZQtoP7kUJIYBpFFDhMXlbbJR8jyMEolmhNR3bdeVgUurIu8vvs-Fwft5BcsNOje4d3_ofI1hPe8A==@protonmail.internalid>
 <20251229-iris-fixes-v2-5-6dce2063d782@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20251229-iris-fixes-v2-5-6dce2063d782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/12/2025 06:31, Dikshita Agarwal wrote:
> In iris_kill_session, inst->state is set to IRIS_INST_ERROR and
> session_close is executed, which will kfree(inst_hfi_gen2->packet).
> If stop_streaming is called afterward, it will cause a crash.
> 
> Add a NULL check for inst_hfi_gen2->packet before sendling STOP packet
> to firmware to fix that.
> 
> Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 6a772db2ec33fb002d8884753a41dc98b3a8439d..59e41adcce9aadd7c60bb1d369d68a4954f62aef 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -963,6 +963,9 @@ static int iris_hfi_gen2_session_stop(struct iris_inst *inst, u32 plane)
>   	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>   	int ret = 0;
> 
> +	if (!inst_hfi_gen2->packet)
> +		return -EINVAL;
> +
>   	reinit_completion(&inst->completion);
> 
>   	iris_hfi_gen2_packet_session_command(inst,
> 
> --
> 2.34.1
> 

Are you sure this NULL check is concurrency safe ?

i.e. that ->session_stop() and ->session_close() cannot be executed 
concurrently ?

---
bod

