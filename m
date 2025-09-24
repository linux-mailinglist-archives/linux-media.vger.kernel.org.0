Return-Path: <linux-media+bounces-43064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBEDB9A096
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 15:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0A7B3BE985
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 13:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFBF30214B;
	Wed, 24 Sep 2025 13:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sXEgWnp0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01531A08B8;
	Wed, 24 Sep 2025 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758720706; cv=none; b=ATmcSmtlaafe1+aILIK3FCQrJY4T5p5Yk7X5LZh35Gb+C/gxxgVK48KBaiBCL0PmCHMnSecbikCoyslBgevsIbOO8fBvz3NGPs5Ba1sVpTnkv7gdG+XZNlZfJrwf1OZst/zQbspHHbSnmKxsedDG6/kOIJwhUaNjHuWjilUsAq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758720706; c=relaxed/simple;
	bh=ZOKnwxpWQh1OHKfDLUV6APqobBrxGUmV8WR/2jnfww0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3BRI70XlG8H1+/UUnCsXCp0UHBAydShcVv0LITNIGLhe6599Vb2CcWg4d2n2kUz+zj9HN77FQFvLFmDRC2QMhRIOkjqVF3KSCD/U1M6Xmp1A5FlFOwlglRrqacuPI4Df7sPnziAVqpMCnmcJXvcpmysGp0j4ngreapGABWlDJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sXEgWnp0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41ECC4CEE7;
	Wed, 24 Sep 2025 13:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758720705;
	bh=ZOKnwxpWQh1OHKfDLUV6APqobBrxGUmV8WR/2jnfww0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sXEgWnp03n0sHny4dsfOG61hTDEe57yuSuvR2SnfOCrw2ky+ENlA8T5EJ4lJKtkXt
	 ikP7sP7XjUARxY3oKU3v5zTTereqLu/M9kxEQZufzunMW+xC5S4ZbmyVjITO8wnMMR
	 dIk44Kzaoi3GPnZm1axzUhW1SPSipEr7IqJj6S1HjaVjcvKZNgKT7YwOTWprPh/8qf
	 HJDbwVIlsyHqp3e284Y+TUavgOcBk6djOdG2UB6hPNPx0j3uaL3JyILp+tZgpl4aIy
	 ZjuBxLGbivydSpFkCC1ef4Gq7Leo/Xvd7Z8N36SFfnR+9JwBXWQkvLHbyyRX9UJW+D
	 2ywj0CoTMBvXA==
Message-ID: <908fece9-769b-4f44-86bb-04de7c3d510e@kernel.org>
Date: Wed, 24 Sep 2025 14:31:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: Add support for QC08C format for encoder
To: Markus Elfring <Markus.Elfring@web.de>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>
References: <20250919-video-iris-ubwc-enable-v1-2-000d11edafd8@oss.qualcomm.com>
 <HhukkV5KRQfG3CqKw5RPfKcXmPNHytjLriuOjq8xemsNiQz-Ac6ojfTTZGn5jNTAKnFJsReFXyrrZ0dqa1RmDw==@protonmail.internalid>
 <5c0f6b8e-c3cc-492c-9d94-3b79eaca0628@web.de>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <5c0f6b8e-c3cc-492c-9d94-3b79eaca0628@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/09/2025 13:40, Markus Elfring wrote:
> …
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -171,9 +171,14 @@ static u32 iris_yuv_buffer_size_nv12(struct iris_inst *inst)
>>   static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
>>   {
>>   	u32 y_plane, uv_plane, y_stride, uv_stride;
>> -	struct v4l2_format *f = inst->fmt_dst;
>>   	u32 uv_meta_stride, uv_meta_plane;
>>   	u32 y_meta_stride, y_meta_plane;
>> +	struct v4l2_format *f = NULL;
>> +
>> +	if (inst->domain == DECODER)
>> +		f = inst->fmt_dst;
>> +	else
>> +		f = inst->fmt_src;
> …
> 
> How do you think about to use a source code variant like the following?
> 
> 	struct v4l2_format *f = (inst->domain == DECODER) ? inst->fmt_dst : inst->fmt_src;
> 
> 
> Regards,
> Markus

My personal preference is for if / else as above.

Trying to encourage the Iris people to move away from ternary operators ...

---
bod

