Return-Path: <linux-media+bounces-41317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1521FB3B6B0
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 11:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66D261C84A10
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 09:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EC12F3C2C;
	Fri, 29 Aug 2025 09:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/aZtrQI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F282F39D4;
	Fri, 29 Aug 2025 09:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756458314; cv=none; b=VdRGq/qh9TnbtiUbJBZEa2titalBBbXxkJElbgkddrlY/n3ttI21hxw0hbNU3pUiCqdSmlrhRXpkiCAAgDLs9a87BsNYdbuq9GXNLDkH/gcY3hxoGT6f0d7zbkDwHuQbYMH/hOM86O14+lNlGfb7U6ZzhxiDPvZ7bj8iXeUZFcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756458314; c=relaxed/simple;
	bh=NqP+Lu0s6zMq+mXI8sKUzNzHzDIZFi7M4YhenC0/UME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KCXAOiq9jr+u3QfMxAOnNDObk2jvH9ac/+ehlUc+Q555Xh3REG7jbjhv56Kj3rknnbjTAkKgLh/YCp0DN5W3uB8vpOU3E1AOME9TzU5zZHbVOdNPpZDsfpAtTHePbj0A9KU+uPYm/8LvKGfFICL1DkWKNujyDGVdjemmzm60hZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/aZtrQI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8A0C4CEF0;
	Fri, 29 Aug 2025 09:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756458314;
	bh=NqP+Lu0s6zMq+mXI8sKUzNzHzDIZFi7M4YhenC0/UME=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O/aZtrQIrK+pjFscVOTtr0zXLtW3sVgAwQKVyh/R4vDZIg8NcUxEMp+RFKF6k/2kR
	 yo4O3GYfHeB6VYvr+FM+PJiLvb4EhF+zCsadI3RYCxMF6rjgIIiJur0ndvcyGZnCS6
	 cLd864PWBnaPYvVPHN1odrYVLkGAzDyeaLYD03hApQ0Ft26UEyy7+I6gyFa1uTzvnM
	 nCgF8rsAw5UVSIxR6sVvrmQBd7mq+Qt0tN1YNxkPxOlD3OvSfu5OJGA/dDi4nVeiwt
	 wGr4g1NxYhXMV3HXnHpPstcXGScCrmVBXVLYP673kxBTXdc24OoxL+VEl7I0qXu3Ww
	 kUxe/i2pf0PjQ==
Message-ID: <9210ea3a-970b-4cf3-8ab5-35952a9c5cf6@kernel.org>
Date: Fri, 29 Aug 2025 10:05:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 24/26] media: iris: Allocate and queue internal buffers
 for encoder video device
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
 <RkFtovt6YeFZgD2napWwptCOf-5LP3ZqNbmfbDB-Z__cCvrJA5DfFRVU1IxihkEayS3ksQp8AzL1dE9Kd7r_2Q==@protonmail.internalid>
 <20250825-iris-video-encoder-v4-24-84aa2bc0a46b@quicinc.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250825-iris-video-encoder-v4-24-84aa2bc0a46b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/08/2025 08:00, Dikshita Agarwal wrote:
> +static inline
> +u32 size_enc_single_pipe(u32 rc_type, u32 bitbin_size, u32 num_vpp_pipes,
> +			 u32 frame_width, u32 frame_height, u32 lcu_size)
> +{
> +	u32 size_aligned_height = ALIGN((frame_height), lcu_size);
> +	u32 size_aligned_width = ALIGN((frame_width), lcu_size);
> +	u32 size_single_pipe_eval = 0, sao_bin_buffer_size = 0;
> +	u32 padded_bin_sz;
> +
> +	if ((size_aligned_width * size_aligned_height) > (3840 * 2160))
> +		size_single_pipe_eval = (bitbin_size / num_vpp_pipes);
> +	else if (num_vpp_pipes > 2)
> +		size_single_pipe_eval = bitbin_size / 2;
> +	else
> +		size_single_pipe_eval = bitbin_size;
> +
> +	sao_bin_buffer_size = (64 * ((((frame_width) + 32) * ((frame_height) + 32)) >> 10)) + 384;
> +	padded_bin_sz = ALIGN(size_single_pipe_eval, 256);
> +	size_single_pipe_eval = sao_bin_buffer_size + padded_bin_sz;
> +
> +	return ALIGN(size_single_pipe_eval, 256);
> +}

Applying your full series, this function is unused and causes a warning 
in CI.

Assuming tests pass for me, I'll be dropping this function in the PR and 
you can resubmit it if/when you find a use for it.

---
bod

