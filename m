Return-Path: <linux-media+bounces-1261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F22F57FB7B3
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9D93282D4C
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AEF51C3A;
	Tue, 28 Nov 2023 10:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164434F8BB;
	Tue, 28 Nov 2023 10:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D24C433C8;
	Tue, 28 Nov 2023 10:26:24 +0000 (UTC)
Message-ID: <cf444351-4305-450d-9b3a-a02a310543c7@xs4all.nl>
Date: Tue, 28 Nov 2023 11:26:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/55] media: qcom: venus: Stop abusing of
 min_buffers_needed field
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, matt.ranostay@konsulko.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
 <20231127165454.166373-17-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20231127165454.166373-17-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2023 17:54, Benjamin Gaignard wrote:
> 'min_buffers_needed' is suppose to be used to indicate the number
> of buffers needed by DMA engine to start streaming.
> venus driver doesn't use DMA engine and just want to specify
> the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
> That 'min_reqbufs_allocation' field purpose so use it.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com> (maintainer:QUALCOMM VENUS VIDEO ACCELERATOR DRIVER)
> CC: Vikash Garodia <quic_vgarodia@quicinc.com> (maintainer:QUALCOMM VENUS VIDEO ACCELERATOR DRIVER)
> CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org> (reviewer:QUALCOMM VENUS VIDEO ACCELERATOR DRIVER)
> CC: Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
> CC: Bjorn Andersson <andersson@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
> CC: Konrad Dybcio <konrad.dybcio@linaro.org> (maintainer:ARM/QUALCOMM SUPPORT)
> CC: linux-arm-msm@vger.kernel.org
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 4 ++--
>  drivers/media/platform/qcom/venus/venc.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index dbf305cec120..16b8d0dde10d 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1641,7 +1641,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>  	src_vq->drv_priv = inst;
>  	src_vq->buf_struct_size = sizeof(struct venus_buffer);
>  	src_vq->allow_zero_bytesused = 1;
> -	src_vq->min_buffers_needed = 0;
> +	src_vq->min_reqbufs_allocation = 0;

Just drop this.

>  	src_vq->dev = inst->core->dev;
>  	src_vq->lock = &inst->ctx_q_lock;
>  	ret = vb2_queue_init(src_vq);
> @@ -1656,7 +1656,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>  	dst_vq->drv_priv = inst;
>  	dst_vq->buf_struct_size = sizeof(struct venus_buffer);
>  	dst_vq->allow_zero_bytesused = 1;
> -	dst_vq->min_buffers_needed = 0;
> +	dst_vq->min_reqbufs_allocation = 0;
>  	dst_vq->dev = inst->core->dev;
>  	dst_vq->lock = &inst->ctx_q_lock;
>  	return vb2_queue_init(dst_vq);
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 44b13696cf82..e399d01c208c 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1398,7 +1398,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>  	src_vq->drv_priv = inst;
>  	src_vq->buf_struct_size = sizeof(struct venus_buffer);
>  	src_vq->allow_zero_bytesused = 1;
> -	src_vq->min_buffers_needed = 1;
> +	src_vq->min_reqbufs_allocation = 1;

So for platform drivers like this it is going to be more difficult to
determine which meaning min_buffers_needed had: is at least one queued
buffer needed before you can start streaming, or is this for a minimum
buffer allocation?

In the case of m2m devices using the v4l2-mem2mem framework it is almost
certainly the minimum buffer allocation since the m2m framework already
checks that there are input and output buffers queued (__v4l2_m2m_try_queue).

So just delete the src_vq->min_buffers_needed = 1; line, and there is
no need to set min_reqbufs_allocation.

>  	src_vq->dev = inst->core->dev;
>  	src_vq->lock = &inst->ctx_q_lock;
>  	if (inst->core->res->hfi_version == HFI_VERSION_1XX)
> @@ -1415,7 +1415,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>  	dst_vq->drv_priv = inst;
>  	dst_vq->buf_struct_size = sizeof(struct venus_buffer);
>  	dst_vq->allow_zero_bytesused = 1;
> -	dst_vq->min_buffers_needed = 1;
> +	dst_vq->min_reqbufs_allocation = 1;
>  	dst_vq->dev = inst->core->dev;
>  	dst_vq->lock = &inst->ctx_q_lock;
>  	return vb2_queue_init(dst_vq);

Ditto.

Regards,

	Hans

