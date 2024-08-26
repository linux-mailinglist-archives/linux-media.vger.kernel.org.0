Return-Path: <linux-media+bounces-16762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B8895EA1B
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 09:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5E491F21AEF
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 07:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CB112C53B;
	Mon, 26 Aug 2024 07:12:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416EE7710E;
	Mon, 26 Aug 2024 07:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724656362; cv=none; b=r5UFhDPl66h5MtaKQACmXvvSig1C+HNe97k/zYrWhu3M49AC+LSDTCb24JTMFnRKNbF1fx7DJZHlA5kZNsLJJ7CNmNVwUIPU/75sbI4vAwgX/F99ALtuFrIoLeVTQFjVIF5ZrJCmV/4hXCbjw2erEl83eO3foo8JZ+fR7wgZ4tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724656362; c=relaxed/simple;
	bh=s6A0BWQt0/NcJrIVGV+N8MwirGD/lXR6PYIAlThRoco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNKcJQdBll36SvU9jrLPiV5ETlgZLwl2vgtorPyaStA6ZjuZNadzjORjU1sDldlgdrgkUb+PCnyBfTlPXtAV8l/oZNAKWwgC9VfvHIY9sEg4SV6pLKUMyw6K5PIsKYKqxnW0fEFCwfC/bZ9pwCMjZ0zgxm/BTsAL3p8aQnc6bNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267DEC8CDC4;
	Mon, 26 Aug 2024 07:12:39 +0000 (UTC)
Message-ID: <fdaccc25-3745-48db-b01a-46a834e2fe0e@xs4all.nl>
Date: Mon, 26 Aug 2024 09:12:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/10] media: venus: Use flex array for
 hfi_session_release_buffer_pkt
To: Ricardo Ribalda <ribalda@chromium.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240814-cocci-flexarray-v7-0-8a1cc09ae6c4@chromium.org>
 <20240814-cocci-flexarray-v7-1-8a1cc09ae6c4@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240814-cocci-flexarray-v7-1-8a1cc09ae6c4@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2024 13:39, Ricardo Ribalda wrote:
> Replace the old style single element array with a flex array. We do not
> allocate this structure, so the size change should not be an issue.
> 
> This fixes the following cocci warning:
> drivers/media/platform/qcom/venus/hfi_cmds.h:204:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index 20acd412ee7b..42825f07939d 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -227,7 +227,7 @@ struct hfi_session_release_buffer_pkt {
>  	u32 extradata_size;
>  	u32 response_req;
>  	u32 num_buffers;
> -	u32 buffer_info[1];
> +	u32 buffer_info[];
>  };
>  
>  struct hfi_session_release_resources_pkt {
> 

Marked 'Duplicated' in patchwork: Kees Cook already applied a variation of this:

https://lore.kernel.org/lkml/5a9939d7-dd05-4ce8-9231-5ae7af32b09f@linaro.org/T/

Regards,

	Hans

