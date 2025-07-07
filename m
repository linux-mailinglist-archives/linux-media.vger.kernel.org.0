Return-Path: <linux-media+bounces-36941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7ADAFAB58
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 07:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE35A189D8F1
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 05:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691D02750F4;
	Mon,  7 Jul 2025 05:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GguYTzG1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08073597A;
	Mon,  7 Jul 2025 05:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751867913; cv=none; b=DCzFx6AR9G2YXBBKBt0ay46XkTRjS6unoqgqE7qfKCPX6JXl4CdiJy80uxmdr1E3h1u/oaIHeXGwBXZ6dyGKM2/SE1qLRB/jJRKukfm6gm6/XCApj0ppM4AnSL6uyzkKddIC6LQ2RJlRFvhTPxnrVSH5nooLqxehkHUlYlWJ6wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751867913; c=relaxed/simple;
	bh=TQ8niipcDW0KwRyOxm4GIOICKfjbN5Jrf98vlsGuva8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mLNjZkvT0ft71f/+M2c3jA9BKolax1SKElrX22QXLmQgbqt4vQI6I6e3eSRF4/LxjJShCFzc0ohWFPKSSBUBwxEx/X42BhOIgxrJrXII2jipX4Hymy0RV0niWiyh6AY+GsySLKffgh4B024/ZaozuTmCWHdggdrOuzen4Fsotek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GguYTzG1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2AEC4CEE3;
	Mon,  7 Jul 2025 05:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751867913;
	bh=TQ8niipcDW0KwRyOxm4GIOICKfjbN5Jrf98vlsGuva8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GguYTzG134RYKZXM25Wg3xyyZ0SGkQcFQhFicvkk9Wk6NlZ2iRmSRYYA0IsaYpOX7
	 a05tNAiAqHcaCiUrUaDkqeiMrvtMMYhmNGIelxS1VCOJ9V9tS86UhZSal95+ZJnmRp
	 ugjbYZ5VWIGsXtkMI2uqC9gv+7O0L+ra09NxxJZLyghLH7Bw7sgg+D5xr2P9oDPgxg
	 fjVwddhuO+gI3em+Ifp6PryOKwaIsdGlDAgkvDoTUIfd8Y/V+BcJE8O1dwJCiOOrxB
	 ZKnCyks35CoQgk16Tc2k/066OwpMhc07x80rjIsjCG/RPDxhziUZr9CSl5pH8VNoGs
	 p5qMffAx7j+oA==
Message-ID: <5762f13d-73b1-4f56-aec7-b42add14ca5e@kernel.org>
Date: Mon, 7 Jul 2025 07:58:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] media: platform: mediatek: add isp_7x camsys
 unit
To: shangyao lin <shangyao.lin@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-9-shangyao.lin@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250707013154.4055874-9-shangyao.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/07/2025 03:31, shangyao lin wrote:
> +static int mtk_cam_create_links(struct mtk_cam_device *cam)
> +{
> +	struct v4l2_subdev *sd;
> +	int ret = 0;
> +
> +	v4l2_device_for_each_subdev(sd, &cam->v4l2_dev) {
> +		if (sd->entity.function == MEDIA_ENT_F_VID_IF_BRIDGE)
> +			ret = config_bridge_pad_links(cam, sd);
> +	}
> +
> +	return ret;
> +}
> +
> +static int mtk_cam_master_register(struct device *dev)
> +{
> +	struct mtk_cam_device *cam_dev = dev_get_drvdata(dev);
> +	struct media_device *media_dev = &cam_dev->media_dev;
> +	int ret;
> +
> +	dev_info(dev, "camsys | start %s\n", __func__);

NAK, nothing improved, you already got comments on that. Provide
detailed changelog next time. And respond to EACH comment acknowledging
that you understood it.

This code still has so many trivial issues and terrible coding style,
including wrong indentation, wrong alignment/wrapping.


> +
> +	media_dev->dev = cam_dev->dev;
> +	strscpy(media_dev->model, dev_driver_string(dev),
> +		sizeof(media_dev->model));
> +	snprintf(media_dev->bus_info, sizeof(media_dev->bus_info),
> +		 "platform:%s", dev_name(dev));
> +	media_dev->hw_revision = 0;
> +	media_dev->ops = &mtk_cam_dev_ops;
> +	media_device_init(media_dev);
> +
> +	cam_dev->v4l2_dev.mdev = media_dev;
> +	ret = v4l2_device_register(cam_dev->dev, &cam_dev->v4l2_dev);
> +	if (ret) {
> +		dev_dbg(dev, "Failed to register V4L2 device: %d\n", ret);
> +		goto fail_media_device_cleanup;
> +	}
> +
> +	ret = media_device_register(media_dev);
> +	if (ret) {
> +		dev_dbg(dev, "Failed to register media device: %d\n",
> +			ret);
> +		goto fail_v4l2_device_unreg;
> +	}
> +
> +	dev_info(dev, "%s success\n", __func__);
> +	return 0;
> +
> +fail_v4l2_device_unreg:
> +	v4l2_device_unregister(&cam_dev->v4l2_dev);
> +
> +fail_media_device_cleanup:
> +	media_device_cleanup(&cam_dev->media_dev);
> +
> +	return ret;
> +}
> +
> +static void mtk_cam_master_unregister(struct device *dev)
> +{
> +	struct mtk_cam_device *cam_dev = dev_get_drvdata(dev);
> +
> +	dev_info(dev, "camsys | start %s\n", __func__);

NAK

> +
> +	media_device_unregister(&cam_dev->media_dev);
> +	v4l2_device_unregister(&cam_dev->v4l2_dev);
> +	media_device_cleanup(&cam_dev->media_dev);
> +}
> +
> +static int mtk_cam_async_add_by_driver(struct device *dev,
> +				       struct platform_driver *drv,
> +				       struct v4l2_async_notifier *notifier)
> +{
> +	struct fwnode_handle *fwnode;
> +	struct device *p;
> +	struct v4l2_async_connection *asc;
> +	int dev_num = 0;
> +
> +	p = platform_find_device_by_driver(NULL, &drv->driver);
> +	while (p) {
> +		dev_info(dev, "camsys | %s add %s\n", __func__, p->kobj.name);
> +
> +		fwnode = dev_fwnode(p);
> +		asc = v4l2_async_nf_add_fwnode(notifier, fwnode,
> +					       struct v4l2_async_connection);
> +		put_device(p);
> +

...

> +
> +	cam_dev->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(cam_dev->base)) {
> +		dev_err(dev, "failed to map register base\n");
> +		return PTR_ERR(cam_dev->base);
> +	}
> +
> +	cam_dev->dev = dev;
> +	dev_set_drvdata(dev, cam_dev);
> +
> +	cam_dev->composer_cnt = 0;
> +	cam_dev->num_seninf_devices = 0;
> +
> +	cam_dev->max_stream_num = MTKCAM_SUBDEV_MAX;
> +	cam_dev->ctxs = devm_kcalloc(dev, cam_dev->max_stream_num,
> +				     sizeof(*cam_dev->ctxs), GFP_KERNEL);
> +	if (!cam_dev->ctxs)
> +		return -ENOMEM;
> +
> +	cam_dev->streaming_ctx = 0;
> +	for (i = 0; i < cam_dev->max_stream_num; i++)
> +		mtk_cam_ctx_init(cam_dev->ctxs + i, cam_dev, i);
> +
> +	cam_dev->running_job_count = 0;
> +	spin_lock_init(&cam_dev->pending_job_lock);
> +	spin_lock_init(&cam_dev->running_job_lock);
> +	INIT_LIST_HEAD(&cam_dev->pending_job_list);
> +	INIT_LIST_HEAD(&cam_dev->running_job_list);
> +
> +	cam_dev->dma_processing_count = 0;
> +	spin_lock_init(&cam_dev->dma_pending_lock);
> +	spin_lock_init(&cam_dev->dma_processing_lock);
> +	INIT_LIST_HEAD(&cam_dev->dma_pending);
> +	INIT_LIST_HEAD(&cam_dev->dma_processing);
> +
> +	mutex_init(&cam_dev->queue_lock);
> +
> +	pm_runtime_enable(dev);
> +
> +	ret = mtk_cam_of_rproc(cam_dev, pdev);
> +	if (ret)
> +		goto fail_destroy_mutex;
> +
> +	ret = register_sub_drivers(dev);
> +	if (ret) {
> +		dev_err(dev, "fail to register_sub_drivers\n");
> +		goto fail_destroy_mutex;
> +	}
> +
> +    cam_dev->clks_pdev = platform_device_register_data(
> +        dev, "clk-mt8188-cam", PLATFORM_DEVID_AUTO, NULL, 0);
> +    if (IS_ERR(cam_dev->clks_pdev)) {
> +        ret = PTR_ERR(cam_dev->clks_pdev);
> +        dev_err(dev, "Failed to register cam clk device: %d\n", ret);
> +        goto fail_unregister_sub_drivers;
> +    }
> +	
> +	/* register mtk_cam as all isp subdev async parent */
> +	cam_dev->notifier.ops = &mtk_cam_async_nf_ops;
> +	v4l2_async_nf_init(&cam_dev->notifier, &cam_dev->v4l2_dev);
> +	ret = mtk_cam_async_subdev_add(dev); /* wait all isp sub drivers */
> +	if (ret) {
> +		dev_err(dev, "%s failed mtk_cam_async_subdev_add\n", __func__);
> +		goto fail_unregister_clks;
> +	}
> +
> +	ret = v4l2_async_nf_register(&cam_dev->notifier);
> +	if (ret) {
> +		dev_err(dev, "%s async_nf_register ret:%d\n", __func__, ret);
> +		v4l2_async_nf_cleanup(&cam_dev->notifier);
> +		goto fail_unregister_clks;
> +	}
> +
> +	dev_info(dev, "camsys | [%s] success\n", __func__);

You already got comments. Nothing improved here.

> +
> +	return 0;
> +
> +fail_unregister_clks:
> +    if (cam_dev->clks_pdev)
> +        platform_device_unregister(cam_dev->clks_pdev);
> +

Best regards,
Krzysztof

