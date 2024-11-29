Return-Path: <linux-media+bounces-22292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 160DC9DC0B2
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 09:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F7FC16360C
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 08:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D065C16C69F;
	Fri, 29 Nov 2024 08:46:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFC7146A7B;
	Fri, 29 Nov 2024 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732869989; cv=none; b=jogwpbIac36Tb5z8BZDgq37oamekLKEierBqu15C7BgwvetNGmZOmeqrmVbLpc4UoGgmoQJPoJ2yFmdR1WCzbFCd8a51IBYQ0aZ+0JWAAoD9oqHaqiWZWqzXprWtDUrWJqUj5KSTWfoYycm9fO1W6zgAl0FEr/17eiMu0tgCayQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732869989; c=relaxed/simple;
	bh=xsaYMMmqbqT5Zc3kKJCWvJdCVSJDb+qslvrWPNqjdo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SY4qpx4RxiB7rkPCQU5/gjf+M2h0ffcD6JMUAi8K/So1jCJnYq4PDFPF5UV2s001rV8jRIjZeYf13A+jDHwJm09rCukX91ESv9n044NswVTuPJ+NU6xI+ZOsL1Uffw+V0kKFIcuWLuI8wBSriMEKMC7easpgE9A96C0DRR8iAhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86189C4CECF;
	Fri, 29 Nov 2024 08:46:25 +0000 (UTC)
Message-ID: <43f81daa-ce1a-4668-9d6a-8469abc4439e@xs4all.nl>
Date: Fri, 29 Nov 2024 09:46:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/28] media: iris: implement iris v4l2 file ops
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241120-qcom-video-iris-v6-0-a8cf6704e992@quicinc.com>
 <20241120-qcom-video-iris-v6-3-a8cf6704e992@quicinc.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241120-qcom-video-iris-v6-3-a8cf6704e992@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/11/2024 15:45, Dikshita Agarwal wrote:
> Implement open, close and poll ops.
> 
> Open:
> Configure the vb2 queue and v4l2 file handler. Allocate a video instance
> and add the instance to core instance list.
> 
> Close:
> Free the instance and remove it from core instance list.
> 
> Poll:
> Wait for an event on vb2 src and vb2 dst queues.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/media/platform/qcom/iris/Kconfig           |   1 +
>  drivers/media/platform/qcom/iris/Makefile          |   5 +-
>  drivers/media/platform/qcom/iris/iris_core.h       |   2 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |  13 ++
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  12 ++
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  22 +++
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  11 ++
>  drivers/media/platform/qcom/iris/iris_instance.h   |  31 +++++
>  .../platform/qcom/iris/iris_platform_common.h      |   1 +
>  .../platform/qcom/iris/iris_platform_sm8550.c      |   2 +
>  drivers/media/platform/qcom/iris/iris_probe.c      |   3 +
>  drivers/media/platform/qcom/iris/iris_vidc.c       | 147 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vidc.h       |  15 +++
>  13 files changed, 264 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> index 34a2f81c5db3..8debddec87a5 100644
> --- a/drivers/media/platform/qcom/iris/Kconfig
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -2,6 +2,7 @@ config VIDEO_QCOM_IRIS
>          tristate "Qualcomm iris V4L2 decoder driver"
>          depends on VIDEO_DEV
>          depends on ARCH_QCOM || COMPILE_TEST
> +        select V4L2_MEM2MEM_DEV
>          help
>            This is a V4L2 driver for Qualcomm iris video accelerator
>            hardware. It accelerates decoding operations on various
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 7e701361492e..6de584090a3a 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -1,4 +1,7 @@
> -iris-objs += iris_platform_sm8550.o \
> +iris-objs += iris_hfi_gen1_command.o \
> +             iris_hfi_gen2_command.o \
> +             iris_platform_sm8550.o \
>               iris_probe.o \
> +             iris_vidc.o \
>  
>  obj-$(CONFIG_VIDEO_QCOM_IRIS) += iris.o
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 27bc2ca71e1b..aebb4eba7e15 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -25,6 +25,7 @@ struct icc_info {
>   * @irq: iris irq
>   * @v4l2_dev: a holder for v4l2 device structure
>   * @vdev_dec: iris video device structure for decoder
> + * @iris_v4l2_file_ops: iris v4l2 file ops
>   * @icc_tbl: table of iris interconnects
>   * @icc_count: count of iris interconnects
>   * @pmdomain_tbl: table of iris power domains
> @@ -41,6 +42,7 @@ struct iris_core {
>  	int					irq;
>  	struct v4l2_device			v4l2_dev;
>  	struct video_device			*vdev_dec;
> +	const struct v4l2_file_operations	*iris_v4l2_file_ops;
>  	struct icc_bulk_data			*icc_tbl;
>  	u32					icc_count;
>  	struct dev_pm_domain_list		*pmdomain_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
> new file mode 100644
> index 000000000000..5d05be7470e0
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __IRIS_HFI_GEN1_H__
> +#define __IRIS_HFI_GEN1_H__
> +
> +struct iris_inst;
> +
> +struct iris_inst *iris_hfi_gen1_get_instance(void);
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> new file mode 100644
> index 000000000000..20c68f4ffb72
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_hfi_gen1.h"
> +#include "iris_instance.h"
> +
> +struct iris_inst *iris_hfi_gen1_get_instance(void)
> +{
> +	return kzalloc(sizeof(struct iris_inst), GFP_KERNEL);
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
> new file mode 100644
> index 000000000000..c159ed7f64f9
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __IRIS_HFI_GEN2_H__
> +#define __IRIS_HFI_GEN2_H__
> +
> +#include "iris_instance.h"
> +
> +/**
> + * struct iris_inst_hfi_gen2 - holds per video instance parameters for hfi_gen2
> + *
> + * @inst: pointer to iris_instance structure
> + */
> +struct iris_inst_hfi_gen2 {
> +	struct iris_inst		inst;
> +};
> +
> +struct iris_inst *iris_hfi_gen2_get_instance(void);
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> new file mode 100644
> index 000000000000..3ee33c8befae
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_hfi_gen2.h"
> +
> +struct iris_inst *iris_hfi_gen2_get_instance(void)
> +{
> +	return kzalloc(sizeof(struct iris_inst_hfi_gen2), GFP_KERNEL);
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> new file mode 100644
> index 000000000000..527a270f12d4
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __IRIS_INSTANCE_H__
> +#define __IRIS_INSTANCE_H__
> +
> +#include "iris_core.h"
> +
> +/**
> + * struct iris_inst - holds per video instance parameters
> + *
> + * @core: pointer to core structure
> + * @ctx_q_lock: lock to serialize queues related ioctls
> + * @lock: lock to seralise forward and reverse threads
> + * @fh: reference of v4l2 file handler
> + * @m2m_dev:	a reference to m2m device structure
> + * @m2m_ctx:	a reference to m2m context structure
> + */
> +
> +struct iris_inst {
> +	struct iris_core		*core;
> +	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
> +	struct mutex			lock; /* lock to serialize forward and reverse threads */
> +	struct v4l2_fh			fh;
> +	struct v4l2_m2m_dev		*m2m_dev;
> +	struct v4l2_m2m_ctx		*m2m_ctx;
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 31c53dad8136..f82081ea135f 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -20,6 +20,7 @@ struct platform_clk_data {
>  };
>  
>  struct iris_platform_data {
> +	struct iris_inst *(*get_instance)(void);
>  	const struct icc_info *icc_tbl;
>  	unsigned int icc_tbl_size;
>  	const char * const *pmdomain_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> index 3dd91523d783..dba8d3c22ce5 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "iris_core.h"
> +#include "iris_hfi_gen2.h"
>  #include "iris_platform_common.h"
>  
>  static const struct icc_info sm8550_icc_table[] = {
> @@ -24,6 +25,7 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  };
>  
>  struct iris_platform_data sm8550_data = {
> +	.get_instance = iris_hfi_gen2_get_instance,
>  	.icc_tbl = sm8550_icc_table,
>  	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>  	.clk_rst_tbl = sm8550_clk_reset_table,
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 911e3bc1b434..ce16d894c809 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -11,6 +11,7 @@
>  #include <linux/reset.h>
>  
>  #include "iris_core.h"
> +#include "iris_vidc.h"
>  
>  static int iris_init_icc(struct iris_core *core)
>  {
> @@ -139,6 +140,7 @@ static int iris_register_video_device(struct iris_core *core)
>  
>  	strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
>  	vdev->release = video_device_release;
> +	vdev->fops = core->iris_v4l2_file_ops;
>  	vdev->vfl_dir = VFL_DIR_M2M;
>  	vdev->v4l2_dev = &core->v4l2_dev;
>  	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
> @@ -192,6 +194,7 @@ static int iris_probe(struct platform_device *pdev)
>  
>  	core->iris_platform_data = of_device_get_match_data(core->dev);
>  
> +	iris_init_ops(core);
>  	ret = iris_init_resources(core);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> new file mode 100644
> index 000000000000..e91d661c6280
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -0,0 +1,147 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "iris_vidc.h"
> +#include "iris_instance.h"
> +#include "iris_platform_common.h"
> +
> +#define IRIS_DRV_NAME "iris_driver"
> +#define IRIS_BUS_NAME "platform:iris_icc"
> +#define STEP_WIDTH 1
> +#define STEP_HEIGHT 1
> +
> +static void iris_v4l2_fh_init(struct iris_inst *inst)
> +{
> +	v4l2_fh_init(&inst->fh, inst->core->vdev_dec);
> +	v4l2_fh_add(&inst->fh);
> +}
> +
> +static void iris_v4l2_fh_deinit(struct iris_inst *inst)
> +{
> +	v4l2_fh_del(&inst->fh);
> +	v4l2_fh_exit(&inst->fh);
> +}
> +
> +static inline struct iris_inst *iris_get_inst(struct file *filp, void *fh)
> +{
> +	return container_of(filp->private_data, struct iris_inst, fh);
> +}
> +
> +static void iris_m2m_device_run(void *priv)
> +{
> +}
> +
> +static void iris_m2m_job_abort(void *priv)
> +{
> +	struct iris_inst *inst = priv;
> +	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
> +
> +	v4l2_m2m_job_finish(inst->m2m_dev, m2m_ctx);
> +}
> +
> +static const struct v4l2_m2m_ops iris_m2m_ops = {
> +	.device_run = iris_m2m_device_run,
> +	.job_abort = iris_m2m_job_abort,
> +};
> +
> +static int
> +iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
> +{
> +	struct iris_inst *inst = priv;
> +	int ret;
> +
> +	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	src_vq->drv_priv = inst;
> +	src_vq->dev = inst->core->dev;
> +	src_vq->lock = &inst->ctx_q_lock;
> +	ret = vb2_queue_init(src_vq);
> +	if (ret)
> +		return ret;
> +
> +	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dst_vq->drv_priv = inst;
> +	dst_vq->dev = inst->core->dev;
> +	dst_vq->lock = &inst->ctx_q_lock;
> +
> +	return vb2_queue_init(dst_vq);
> +}
> +
> +int iris_open(struct file *filp)
> +{
> +	struct iris_core *core = video_drvdata(filp);
> +	struct iris_inst *inst;
> +	int ret;
> +
> +	inst = core->iris_platform_data->get_instance();
> +	if (!inst)
> +		return -ENOMEM;
> +
> +	inst->core = core;
> +
> +	mutex_init(&inst->ctx_q_lock);
> +
> +	iris_v4l2_fh_init(inst);
> +
> +	inst->m2m_dev = v4l2_m2m_init(&iris_m2m_ops);
> +	if (IS_ERR_OR_NULL(inst->m2m_dev)) {
> +		ret = -EINVAL;
> +		goto fail_v4l2_fh_deinit;
> +	}
> +
> +	inst->m2m_ctx = v4l2_m2m_ctx_init(inst->m2m_dev, inst, iris_m2m_queue_init);
> +	if (IS_ERR_OR_NULL(inst->m2m_ctx)) {
> +		ret = -EINVAL;
> +		goto fail_m2m_release;
> +	}
> +
> +	inst->fh.m2m_ctx = inst->m2m_ctx;
> +	filp->private_data = &inst->fh;
> +
> +	return 0;
> +
> +fail_m2m_release:
> +	v4l2_m2m_release(inst->m2m_dev);
> +fail_v4l2_fh_deinit:
> +	iris_v4l2_fh_deinit(inst);
> +	mutex_destroy(&inst->ctx_q_lock);
> +	kfree(inst);
> +
> +	return ret;
> +}
> +
> +int iris_close(struct file *filp)
> +{
> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
> +
> +	v4l2_m2m_ctx_release(inst->m2m_ctx);
> +	v4l2_m2m_release(inst->m2m_dev);
> +	iris_v4l2_fh_deinit(inst);
> +	mutex_destroy(&inst->ctx_q_lock);
> +	kfree(inst);
> +	filp->private_data = NULL;
> +
> +	return 0;
> +}
> +
> +static struct v4l2_file_operations iris_v4l2_file_ops = {
> +	.owner                          = THIS_MODULE,
> +	.open                           = iris_open,
> +	.release                        = iris_close,
> +	.unlocked_ioctl                 = video_ioctl2,
> +	.poll                           = v4l2_m2m_fop_poll,
> +	.mmap                           = v4l2_m2m_fop_mmap,
> +};
> +
> +void iris_init_ops(struct iris_core *core)
> +{
> +	core->iris_v4l2_file_ops = &iris_v4l2_file_ops;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.h b/drivers/media/platform/qcom/iris/iris_vidc.h
> new file mode 100644
> index 000000000000..a26054ff55b5
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __IRIS_VIDC_H__
> +#define __IRIS_VIDC_H__
> +
> +struct iris_core;
> +
> +void iris_init_ops(struct iris_core *core);
> +int iris_open(struct file *filp);
> +int iris_close(struct file *filp);
> +
> +#endif
> 


