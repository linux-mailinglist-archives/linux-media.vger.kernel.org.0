Return-Path: <linux-media+bounces-2629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0AA8179F8
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 19:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 945911C230F4
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 18:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33CC22574D;
	Mon, 18 Dec 2023 18:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URBjdGQI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A1B1EA87
	for <linux-media@vger.kernel.org>; Mon, 18 Dec 2023 18:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e0d1f9fe6so4275907e87.1
        for <linux-media@vger.kernel.org>; Mon, 18 Dec 2023 10:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702925218; x=1703530018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XjHFU/zL8eFGqgtpo+7MN33nERurBW3Cw3GpVVllJ94=;
        b=URBjdGQIRHZoPAQoJfXjfUNX/M/ac+fBgbLe8WOpjGyt46I/35A3z9JJhS0sy+HJVU
         re5ksaodpDaVFREtDKVuaDLYwlzFnkGKYyuxpQRUDtFWc98UJWC2b6PePyqHldKD3HEc
         krZceRh13dvvEFdPoK6QCqqTUys7fm1pi+OOostEustYyr9m3LFFLM1t59v9SUDmVnGY
         5cJALcG3DeDlJwJXVkJGj0il7xRFHnpTnK3szE17mm9xLAG6YIBS+ES9GMHQ9L4vuXYh
         TF56YWOTfiei1PL7wke35YBfnOfDXhu18RKAvbOlelY66U3NSHqDSoOgxIJf7UyUkEsN
         VY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702925218; x=1703530018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XjHFU/zL8eFGqgtpo+7MN33nERurBW3Cw3GpVVllJ94=;
        b=th36OH6xtQtwYJo5kQrvElso2QLYMNTn5q7pEioGBxe7Q3TFFg+57WXk4jxGAxVFug
         TVer2OoTTmbDbebkqorNaZow+htYKZHJ+jvxlticC9RC3mxDrfp0Bi1EQ0YGAG/sI79x
         HQSIT2CK5+IsLF6FAE8k4fwHxHKCc5ZZbJazII46zB7/FBAfV4+nYbhd4tQyVheydbNs
         G7n1QgTusJPHxotxWm0NSb03AvHCKH4dhEVyt7/cgC3mldBCEChOMaJ95zjxQKRDyLj6
         Foy3iOO9eZvSRSpUZKsH9UT5LHzGwvEpPPjExqNUAdL1t7UzaD0uVaoeMoC3J9ru7hMC
         Npvw==
X-Gm-Message-State: AOJu0YzDfgK2w9igqP242b52mDbYGuigGmF6on52DCKK7iAX4+fzOkEL
	5F0AwWkfLr8vtT8TFj/ZXRd7ig==
X-Google-Smtp-Source: AGHT+IFd2em1XXCTO2vp/DFLO5QwUCxR1oJzetUp1kWdQgUdjLbYBEcVTWDfK8TSEKtsawa92MzC+A==
X-Received: by 2002:a19:9113:0:b0:50e:3ef1:98ee with SMTP id t19-20020a199113000000b0050e3ef198eemr496899lfd.110.1702925217970;
        Mon, 18 Dec 2023 10:46:57 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227? (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id f16-20020a0565123b1000b0050e3364b5aasm532294lfv.207.2023.12.18.10.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 10:46:57 -0800 (PST)
Message-ID: <057c9f67-3ef6-438a-91bf-996c3c45c6d5@linaro.org>
Date: Mon, 18 Dec 2023 20:46:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/34] media: iris: initialize shared queues for host
 and firmware communication
Content-Language: en-GB
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
 bryan.odonoghue@linaro.org
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com
References: <1702899149-21321-1-git-send-email-quic_dikshita@quicinc.com>
 <1702899149-21321-10-git-send-email-quic_dikshita@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1702899149-21321-10-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/12/2023 13:32, Dikshita Agarwal wrote:
> Shared queues are used for communication between driver and firmware.
> There are 3 types of queues:
> Command queue - driver to write any command to firmware.
> Message queue - firmware to send any response to driver.
> Debug queue - firmware to write debug message.
> 
> Above queues are initialized and configured to firmware during probe.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/vcodec/iris/Makefile   |  2 ++
>   .../media/platform/qcom/vcodec/iris/iris_core.h    | 11 ++++++++
>   .../media/platform/qcom/vcodec/iris/iris_probe.c   | 31 ++++++++++++++++++++++
>   3 files changed, 44 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/vcodec/iris/Makefile b/drivers/media/platform/qcom/vcodec/iris/Makefile
> index 12a74de..59798e5d 100644
> --- a/drivers/media/platform/qcom/vcodec/iris/Makefile
> +++ b/drivers/media/platform/qcom/vcodec/iris/Makefile
> @@ -1,3 +1,5 @@
> +iris-objs += ../hfi_queue.o
> +
>   iris-objs += iris_probe.o \
>                resources.o \
>                iris_state.o
> diff --git a/drivers/media/platform/qcom/vcodec/iris/iris_core.h b/drivers/media/platform/qcom/vcodec/iris/iris_core.h
> index 56a5b7d..77124f9 100644
> --- a/drivers/media/platform/qcom/vcodec/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/vcodec/iris/iris_core.h
> @@ -9,6 +9,7 @@
>   #include <linux/types.h>
>   #include <media/v4l2-device.h>
>   
> +#include "../hfi_queue.h"
>   #include "iris_state.h"
>   
>   /**
> @@ -30,6 +31,11 @@
>    * @reset_tbl: table of iris reset clocks
>    * @reset_count: count of iris reset clocks
>    * @state: current state of core
> + * @iface_q_table: Interface queue table memory
> + * @command_queue: shared interface queue to send commands to firmware
> + * @message_queue: shared interface queue to receive responses from firmware
> + * @debug_queue: shared interface queue to receive debug info from firmware
> + * @sfr: SFR register memory
>    */
>   
>   struct iris_core {
> @@ -49,6 +55,11 @@ struct iris_core {
>   	struct reset_info			*reset_tbl;
>   	u32					reset_count;
>   	enum iris_core_state			state;
> +	struct mem_desc				iface_q_table;
> +	struct iface_q_info			command_queue;
> +	struct iface_q_info			message_queue;
> +	struct iface_q_info			debug_queue;
> +	struct mem_desc				sfr;
>   };
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/vcodec/iris/iris_probe.c b/drivers/media/platform/qcom/vcodec/iris/iris_probe.c
> index 7bb9c92..fd349a3 100644
> --- a/drivers/media/platform/qcom/vcodec/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/vcodec/iris/iris_probe.c
> @@ -7,6 +7,7 @@
>   #include <linux/of_device.h>
>   #include <linux/platform_device.h>
>   
> +#include "../hfi_queue.h"
>   #include "iris_core.h"
>   #include "resources.h"
>   
> @@ -50,6 +51,10 @@ static void iris_remove(struct platform_device *pdev)
>   	if (!core)
>   		return;
>   
> +	hfi_queue_deinit(core->dev, &core->iface_q_table, &core->sfr,
> +			 &core->command_queue, &core->message_queue,
> +			 &core->debug_queue);
> +
>   	video_unregister_device(core->vdev_dec);
>   
>   	v4l2_device_unregister(&core->v4l2_dev);
> @@ -59,6 +64,7 @@ static int iris_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct iris_core *core;
> +	u64 dma_mask;
>   	int ret;
>   
>   	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> @@ -91,8 +97,33 @@ static int iris_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, core);
>   
> +	/*
> +	 * Specify the max value of address space, which can be used
> +	 * for buffer transactions.
> +	 */
> +	dma_mask = DMA_BIT_MASK(32);
> +	dma_mask &= ~BIT(29);
> +
> +	ret = dma_set_mask_and_coherent(dev, dma_mask);
> +	if (ret)
> +		goto err_vdev_unreg;
> +
> +	dma_set_max_seg_size(&pdev->dev, (unsigned int)DMA_BIT_MASK(32));
> +	dma_set_seg_boundary(&pdev->dev, (unsigned long)DMA_BIT_MASK(64));

This isn't related to queues.

> +
> +	ret = hfi_queue_init(core->dev, &core->iface_q_table, &core->sfr,
> +			     &core->command_queue, &core->message_queue,
> +			     &core->debug_queue, core);
> +	if (ret) {
> +		dev_err_probe(core->dev, ret,
> +			      "%s: interface queues init failed\n", __func__);
> +		goto err_vdev_unreg;
> +	}
> +
>   	return ret;
>   
> +err_vdev_unreg:
> +	iris_unregister_video_device(core);
>   err_v4l2_unreg:
>   	v4l2_device_unregister(&core->v4l2_dev);
>   

-- 
With best wishes
Dmitry


