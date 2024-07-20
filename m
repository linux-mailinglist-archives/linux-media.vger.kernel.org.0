Return-Path: <linux-media+bounces-15202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50505938100
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 13:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1C37B21461
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 11:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F19127E3A;
	Sat, 20 Jul 2024 11:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b="gS3ykZPi"
X-Original-To: linux-media@vger.kernel.org
Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52A8B646;
	Sat, 20 Jul 2024 11:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721475233; cv=none; b=FZt3EZ+Rl57+nxZ8Fh7MB9Z5AeD3P9a87omfU/3p9L5UjVS45u7LyPQinu3icM6Jc2YMShVCpwYQr2lJEMczRQCBUZNnUESYQqgK1NTvu0X+Al4l+jRnID/iqD6na2e4YvAbIMJRPfSWeCLXVZ8O/lvh9QKmXeBAfDhi40uv+ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721475233; c=relaxed/simple;
	bh=epD57hJgsAYYcQLu8ayhIFh2ElYvhE51OmCmSk8QBeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gz33mdN8b8RO/aUDFeVDFI7e+Yg84Et9VjxoIsk98eewofT2QcfhRYcM+uOyA6eezaQbBWY/hhK1LybPZzS3u11Hh1po98pd6mKrznJJW/aRWKACLLHJ7xcviqpguID29ordNAOviN4V6xQjzEVk8hLN3YNjbYOKAFzOUZktMFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com; spf=pass smtp.mailfrom=yandex.com; dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b=gS3ykZPi; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.com
Received: from mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net [IPv6:2a02:6b8:c14:3483:0:640:1715:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id 5272960DEC;
	Sat, 20 Jul 2024 14:33:46 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id fXJd7fFm4Sw0-N2IjXqhy;
	Sat, 20 Jul 2024 14:33:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1721475225; bh=AOlsoPkReRmqiSS47kGKmnkW038lQcq/Grefo+iL3lA=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=gS3ykZPi8Y2j50cJH7I5GIMRzDa3u2GENm72Ep7ZruK8kYsHBQr3udXF99v9pzs/k
	 B7S+s4Syn4e1nJ5y2nFXAE6FlY/BVk0f/0Qi1sdj5XcWP6GvrP+2Ik0PEXITkpHiVR
	 IFQuuB19kol8f9CY+TCsJZW5EnlpJKsndFWWE/2E=
Authentication-Results: mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.com
Message-ID: <2044f205-60d1-40b3-a7d7-4be7526669a3@yandex.com>
Date: Sat, 20 Jul 2024 13:33:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] media: platform: synopsys: Add support for hdmi
 input driver
To: Shreeya Patel <shreeya.patel@collabora.com>, heiko@sntech.de,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <20240719124032.26852-5-shreeya.patel@collabora.com>
Content-Language: en-US
From: Johan Jonker <jbx6244@yandex.com>
In-Reply-To: <20240719124032.26852-5-shreeya.patel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/19/24 14:40, Shreeya Patel wrote:
> Add initial support for the Synopsys DesignWare HDMI RX
> Controller Driver used by Rockchip RK3588. The driver
> supports:
>  - HDMI 1.4b and 2.0 modes (HDMI 4k@60Hz)
>  - RGB888, YUV422, YUV444 and YCC420 pixel formats
>  - CEC
>  - EDID configuration
> 
> The hardware also has Audio and HDCP capabilities, but these are
> not yet supported by the driver.
> 
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
> Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> ---
> 
> Changes in v4 :-
>   - Create a separate config option for selecting the EDID
>     and enable it by default
>   - Improve the comment related to DV timings and move it
>     to the side of hdmirx_get_detected_timings
>   - Add 100ms delay before pulling the HPD high
>   - Do not return the detected timings from VIDIOC_G_DV_TIMINGS
>   - Drop the bus info from hdmirx_querycap
>   - If *num_planes != 0 then return 0 in hdmirx_queue_setup
>   - Set queue->min_queued_buffers to 1
>   - Drop q->allow_cache_hints = 0; as it's always 0 by default
>   - Add a comment for q->dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
>   - Drop .read = vb2_fop_read as it's not supported by driver
>   - Remove redundant edid_init_data_600M
>   - Make HPD low when driver is loaded
>   - Add support for reading AVI Infoframe
>   - Remove msg_len checks from hdmirx_cec_transmit
>   - Add info about the CEC compliance test in the cover letter
>   - Add arbitration lost status
>   - Validate the physical address inside the EDID
> 
> Changes in v3 :-
>   - Use v4l2-common helper functions
> 
> Changes in v2 :-
>   - Fix checkpatch --strict warnings
>   - Rename resets, vo1-grf and HPD node names as per the DT changes
> 
>  drivers/media/platform/Kconfig                |    1 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/synopsys/Kconfig       |    3 +
>  drivers/media/platform/synopsys/Makefile      |    2 +
>  .../media/platform/synopsys/hdmirx/Kconfig    |   27 +
>  .../media/platform/synopsys/hdmirx/Makefile   |    4 +
>  .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2763 +++++++++++++++++
>  .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
>  .../synopsys/hdmirx/snps_hdmirx_cec.c         |  285 ++
>  .../synopsys/hdmirx/snps_hdmirx_cec.h         |   44 +
>  10 files changed, 3524 insertions(+)
>  create mode 100644 drivers/media/platform/synopsys/Kconfig
>  create mode 100644 drivers/media/platform/synopsys/Makefile
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 85d2627776b6..9287faafdce5 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -85,6 +85,7 @@ source "drivers/media/platform/rockchip/Kconfig"
>  source "drivers/media/platform/samsung/Kconfig"
>  source "drivers/media/platform/st/Kconfig"
>  source "drivers/media/platform/sunxi/Kconfig"
> +source "drivers/media/platform/synopsys/Kconfig"
>  source "drivers/media/platform/ti/Kconfig"
>  source "drivers/media/platform/verisilicon/Kconfig"
>  source "drivers/media/platform/via/Kconfig"
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index ace4e34483dd..6fd7db0541c7 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -28,6 +28,7 @@ obj-y += rockchip/
>  obj-y += samsung/
>  obj-y += st/
>  obj-y += sunxi/
> +obj-y += synopsys/
>  obj-y += ti/
>  obj-y += verisilicon/
>  obj-y += via/
> diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
> new file mode 100644
> index 000000000000..4fd521f78425
> --- /dev/null
> +++ b/drivers/media/platform/synopsys/Kconfig
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +source "drivers/media/platform/synopsys/hdmirx/Kconfig"
> diff --git a/drivers/media/platform/synopsys/Makefile b/drivers/media/platform/synopsys/Makefile
> new file mode 100644
> index 000000000000..3b12c574dd67
> --- /dev/null
> +++ b/drivers/media/platform/synopsys/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-y += hdmirx/
> diff --git a/drivers/media/platform/synopsys/hdmirx/Kconfig b/drivers/media/platform/synopsys/hdmirx/Kconfig
> new file mode 100644
> index 000000000000..ab569e59300f
> --- /dev/null
> +++ b/drivers/media/platform/synopsys/hdmirx/Kconfig
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config VIDEO_SYNOPSYS_HDMIRX
> +	tristate "Synopsys DesignWare HDMI Receiver driver"
> +	depends on VIDEO_DEV
> +	depends on ARCH_ROCKCHIP
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select VIDEOBUF2_DMA_CONTIG
> +	select CEC_CORE
> +	select CEC_NOTIFIER
> +	select HDMI
> +	help
> +	  Support for Synopsys HDMI HDMI RX Controller.
> +	  This driver supports HDMI 2.0 version.
> +
> +	  To compile this driver as a module, choose M here. The module
> +	  will be called synopsys_hdmirx.
> +
> +config HDMIRX_LOAD_DEFAULT_EDID
> +	bool "Load default EDID"
> +	depends on VIDEO_SYNOPSYS_HDMIRX
> +	default "y"
> +	help
> +	  Preload the default EDID (Extended Display Identification Data).
> +	  EDID contains information about the capabilities of the display,
> +	  such as supported resolutions, refresh rates, and audio formats.
> diff --git a/drivers/media/platform/synopsys/hdmirx/Makefile b/drivers/media/platform/synopsys/hdmirx/Makefile
> new file mode 100644
> index 000000000000..2fa2d9e25300
> --- /dev/null
> +++ b/drivers/media/platform/synopsys/hdmirx/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +synopsys-hdmirx-objs := snps_hdmirx.o snps_hdmirx_cec.o
> +
> +obj-$(CONFIG_VIDEO_SYNOPSYS_HDMIRX) += synopsys-hdmirx.o
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c

[..]

For FTRACE it is needed that all functions start with the same function prefix.

> +static bool tx_5v_power_present(struct snps_hdmirx_dev *hdmirx_dev)

> +static bool signal_not_lock(struct snps_hdmirx_dev *hdmirx_dev)

> +static bool port_no_link(struct snps_hdmirx_dev *hdmirx_dev)

> +static int wait_reg_bit_status(struct snps_hdmirx_dev *hdmirx_dev, u32 reg,
> +			       u32 bit_mask, u32 expect_val, bool is_grf,
> +			       u32 ms)

> +static void return_all_buffers(struct hdmirx_stream *stream,
> +			       enum vb2_buffer_state state)

> +static void process_signal_change(struct snps_hdmirx_dev *hdmirx_dev)

> +static void avpunit_0_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
> +				  int status, bool *handled)

> +static void avpunit_1_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
> +				  int status, bool *handled)

> +static void mainunit_0_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
> +				   int status, bool *handled)

> +static void mainunit_2_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
> +				   int status, bool *handled)

> +static void pkt_2_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
> +			      int status, bool *handled)

> +static void scdc_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
> +			     int status, bool *handled)

> +static void dma_idle_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
> +				 bool *handled)

> +static void line_flag_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
> +				  bool *handled)

[..]

> +static int hdmirx_setup_irq(struct snps_hdmirx_dev *hdmirx_dev,
> +			    struct platform_device *pdev)
> +{
> +	struct device *dev = hdmirx_dev->dev;
> +	int ret, irq;
> +
> +	irq = platform_get_irq_byname(pdev, "hdmi");
> +	if (irq < 0) {
> +		dev_err_probe(dev, irq, "failed to get hdmi irq\n");
> +		return irq;
> +	}
> +
> +	irq_set_status_flags(irq, IRQ_NOAUTOEN);
> +
> +	hdmirx_dev->hdmi_irq = irq;
> +	ret = devm_request_irq(dev, irq, hdmirx_hdmi_irq_handler, 0,
> +			       "rk_hdmirx-hdmi", hdmirx_dev);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to request hdmi irq\n");
> +		return ret;
> +	}
> +
> +	irq = platform_get_irq_byname(pdev, "dma");
> +	if (irq < 0) {
> +		dev_err_probe(dev, irq, "failed to get dma irq\n");
> +		return irq;
> +	}
> +
> +	irq_set_status_flags(irq, IRQ_NOAUTOEN);
> +
> +	hdmirx_dev->dma_irq = irq;
> +	ret = devm_request_threaded_irq(dev, irq, NULL, hdmirx_dma_irq_handler,
> +					IRQF_ONESHOT, "rk_hdmirx-dma",
> +					hdmirx_dev);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to request dma irq\n");
> +		return ret;
> +	}
> +
> +	irq = gpiod_to_irq(hdmirx_dev->detect_5v_gpio);
> +	if (irq < 0) {
> +		dev_err_probe(dev, irq, "failed to get hdmirx-5v irq\n");
> +		return irq;
> +	}
> +
> +	irq_set_status_flags(irq, IRQ_NOAUTOEN);
> +
> +	hdmirx_dev->det_irq = irq;
> +	ret = devm_request_irq(dev, irq, hdmirx_5v_det_irq_handler,
> +			       IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
> +			       "rk_hdmirx-5v", hdmirx_dev);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to request hdmirx-5v irq\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int hdmirx_register_cec(struct snps_hdmirx_dev *hdmirx_dev,
> +			       struct platform_device *pdev)
> +{
> +	struct device *dev = hdmirx_dev->dev;
> +	struct hdmirx_cec_data cec_data;
> +	int irq;
> +
> +	irq = platform_get_irq_byname(pdev, "cec");
> +	if (irq < 0) {
> +		dev_err_probe(dev, irq, "failed to get cec irq\n");
> +		return irq;
> +	}
> +
> +	hdmirx_dev->cec_notifier = cec_notifier_conn_register(dev, NULL, NULL);
> +	if (!hdmirx_dev->cec_notifier)
> +		return -EINVAL;
> +
> +	cec_data.hdmirx = hdmirx_dev;
> +	cec_data.dev = hdmirx_dev->dev;
> +	cec_data.ops = &hdmirx_cec_ops;
> +	cec_data.irq = irq;
> +
> +	hdmirx_dev->cec = snps_hdmirx_cec_register(&cec_data);
> +	if (!hdmirx_dev->cec) {
> +		cec_notifier_conn_unregister(hdmirx_dev->cec_notifier);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int hdmirx_probe(struct platform_device *pdev)
> +{
> +	struct snps_hdmirx_dev *hdmirx_dev;
> +	struct device *dev = &pdev->dev;
> +	struct v4l2_ctrl_handler *hdl;
> +	struct hdmirx_stream *stream;
> +	struct v4l2_device *v4l2_dev;
> +	int ret;
> +
> +	hdmirx_dev = devm_kzalloc(dev, sizeof(*hdmirx_dev), GFP_KERNEL);
> +	if (!hdmirx_dev)
> +		return -ENOMEM;
> +
> +	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		return ret;
> +
> +	hdmirx_dev->dev = dev;
> +	dev_set_drvdata(dev, hdmirx_dev);
> +
> +	ret = hdmirx_parse_dt(hdmirx_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = hdmirx_setup_irq(hdmirx_dev, pdev);
> +	if (ret)
> +		return ret;
> +
> +	hdmirx_dev->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(hdmirx_dev->regs))
> +		return dev_err_probe(dev, PTR_ERR(hdmirx_dev->regs),
> +				     "failed to remap regs resource\n");
> +
> +	mutex_init(&hdmirx_dev->stream_lock);
> +	mutex_init(&hdmirx_dev->work_lock);
> +	spin_lock_init(&hdmirx_dev->rst_lock);
> +
> +	init_completion(&hdmirx_dev->cr_write_done);
> +	init_completion(&hdmirx_dev->timer_base_lock);
> +	init_completion(&hdmirx_dev->avi_pkt_rcv);
> +
> +	INIT_WORK(&hdmirx_dev->work_wdt_config, hdmirx_work_wdt_config);
> +	INIT_DELAYED_WORK(&hdmirx_dev->delayed_work_hotplug,
> +			  hdmirx_delayed_work_hotplug);
> +	INIT_DELAYED_WORK(&hdmirx_dev->delayed_work_res_change,
> +			  hdmirx_delayed_work_res_change);
> +	INIT_DELAYED_WORK(&hdmirx_dev->delayed_work_heartbeat,
> +			  hdmirx_delayed_work_heartbeat);
> +
> +	hdmirx_dev->cur_fmt_fourcc = V4L2_PIX_FMT_BGR24;
> +	hdmirx_dev->timings = cea640x480;
> +
> +	hdmirx_enable(dev);
> +	hdmirx_init(hdmirx_dev);
> +
> +	v4l2_dev = &hdmirx_dev->v4l2_dev;
> +	strscpy(v4l2_dev->name, dev_name(dev), sizeof(v4l2_dev->name));
> +
> +	hdl = &hdmirx_dev->hdl;
> +	v4l2_ctrl_handler_init(hdl, 1);
> +
> +	hdmirx_dev->detect_tx_5v_ctrl = v4l2_ctrl_new_std(hdl, NULL,
> +							  V4L2_CID_DV_RX_POWER_PRESENT,
> +							  0, 1, 0, 0);
> +
> +	hdmirx_dev->rgb_range = v4l2_ctrl_new_std_menu(hdl, 0,
> +						       V4L2_CID_DV_RX_RGB_RANGE,
> +						       V4L2_DV_RGB_RANGE_FULL, 0,
> +						       V4L2_DV_RGB_RANGE_AUTO);
> +
> +	hdmirx_dev->rgb_range->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	if (hdl->error) {
> +		dev_err(dev, "v4l2 ctrl handler init failed\n");
> +		ret = hdl->error;
> +		goto err_pm;
> +	}
> +	hdmirx_dev->v4l2_dev.ctrl_handler = hdl;
> +
> +	ret = v4l2_device_register(dev, &hdmirx_dev->v4l2_dev);
> +	if (ret < 0) {
> +		dev_err(dev, "register v4l2 device failed\n");
> +		goto err_hdl;
> +	}
> +
> +	stream = &hdmirx_dev->stream;
> +	stream->hdmirx_dev = hdmirx_dev;
> +	ret = hdmirx_register_stream_vdev(stream);
> +	if (ret < 0) {
> +		dev_err(dev, "register video device failed\n");
> +		goto err_unreg_v4l2_dev;
> +	}
> +
> +	ret = hdmirx_register_cec(hdmirx_dev, pdev);
> +	if (ret)
> +		goto err_unreg_video_dev;
> +
> +	hdmirx_load_default_edid(hdmirx_dev);
> +
> +	hdmirx_enable_irq(dev);
> +
> +	return 0;
> +
> +err_unreg_video_dev:
> +	video_unregister_device(&hdmirx_dev->stream.vdev);
> +err_unreg_v4l2_dev:
> +	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
> +err_hdl:
> +	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
> +err_pm:
> +	hdmirx_disable(dev);
> +
> +	return ret;
> +}
> +
> +static void hdmirx_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
> +
> +	snps_hdmirx_cec_unregister(hdmirx_dev->cec);
> +	cec_notifier_conn_unregister(hdmirx_dev->cec_notifier);
> +
> +	hdmirx_disable_irq(dev);
> +
> +	video_unregister_device(&hdmirx_dev->stream.vdev);
> +	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
> +	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
> +
> +	hdmirx_disable(dev);
> +
> +	reset_control_bulk_assert(HDMIRX_NUM_RST, hdmirx_dev->resets);
> +
> +	of_reserved_mem_device_release(dev);
> +}
> +
> +static const struct of_device_id hdmirx_id[] = {
> +	{ .compatible = "rockchip,rk3588-hdmirx-ctrler" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, hdmirx_id);
> +
> +static struct platform_driver hdmirx_driver = {
> +	.probe = hdmirx_probe,
> +	.remove = hdmirx_remove,
> +	.driver = {
> +		.name = "snps_hdmirx",
> +		.of_match_table = hdmirx_id,
> +		.pm = &snps_hdmirx_pm_ops,
> +	}
> +};
> +module_platform_driver(hdmirx_driver);
> +
> +MODULE_DESCRIPTION("Rockchip HDMI Receiver Driver");

While the file is called snps_hdmirx.c and the driver name is "snps_hdmirx" the module description calls it a Rockchip driver.
This patch serie somewhat hints at the use of multiple SoCs and possible multiple brands then a more clear separation between common snps and Rockchip (rk3588) SoC specific is needed?

Johan

> +MODULE_AUTHOR("Dingxian Wen <shawn.wen@rock-chips.com>");
> +MODULE_AUTHOR("Shreeya Patel <shreeya.patel@collabora.com>");
> +MODULE_LICENSE("GPL");

