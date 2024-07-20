Return-Path: <linux-media+bounces-15205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3208C938323
	for <lists+linux-media@lfdr.de>; Sun, 21 Jul 2024 01:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A178B210A0
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 23:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C5612EBE1;
	Sat, 20 Jul 2024 23:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="clw3iwTg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BED433C8;
	Sat, 20 Jul 2024 23:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.18.73.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721519039; cv=none; b=SdmBf4fEHWKfm361ziXMAyXs6ppNEBDChd+PJ3bWHwB9NagfhLChkrv4XNX4HTyNUm2RfnH9E5Aogn26Za5psvjq3vMQNV0e+Mq7j902fzPB6D/Z5FqE9EKpSDZ20GcOBRT6w5VGx5ki7PQB0K7p3cIUo5a6duWvDp7GUTOP/IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721519039; c=relaxed/simple;
	bh=eCCoq+iFGBdKMNtNhXy98Ipl/9Pr/k/UK5aTemSxdWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pk68YtwQaMYEuMEA5dWArAfr6TgDXeh5gslFw/I4vlNaOylrODmIAlM0g/3na+fuWVzMawMjKELvDCUVyoKuv1how/+f8uQ34JGNBseJqm89nxH8LO+kClecsQc2mt/Bo2RfhVIstBdmcFGAGBneuf8etXqP8hxfe7jcJ/TFv3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=clw3iwTg; arc=none smtp.client-ip=37.18.73.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6ECBB100005;
	Sun, 21 Jul 2024 02:43:45 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6ECBB100005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1721519025;
	bh=g24+UhvGrnOWMz/mhUcWCb3PyHRvlOlSwGOnoi3HCN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=clw3iwTgpEimcsMVGG/rjJ76pzjT0LDO9hzKUC1FKhcdjUWs1lqh+vJ/PpOk5hCrr
	 9aSd845zoz1PjHcvhkhQ4/zgK3HZjd/bXK8fHA08TIpdecooxrGyyR7hp92wzpZQg9
	 5M6tQcm1B1hrgEWIN9YBxCYG2yKNHkr+9ZhbQ2xPcVjzencYJGqVI/ZhNyT/VKqN1s
	 mHd9IbnJg70Ac/B4mb29SiB2JNzFyqmAHBsfJLsifGsy0nwQe/C1EgslN8+R6/fgJv
	 SsGyDucqo5G7YosN4QpftPO73mH2SjOOEsqE6adlB0sTcboCotQQQ2Pg3K5mu32C+R
	 E8EbZ2jFw+cNg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun, 21 Jul 2024 02:43:44 +0300 (MSK)
Received: from [192.168.1.143] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 21 Jul 2024 02:43:44 +0300
Message-ID: <0d67019e-dac5-489c-a42a-dab5028c1bce@salutedevices.com>
Date: Sun, 21 Jul 2024 02:43:44 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] media: platform: synopsys: Add support for hdmi
 input driver
To: Shreeya Patel <shreeya.patel@collabora.com>, <heiko@sntech.de>,
	<mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<p.zabel@pengutronix.de>, <jose.abreu@synopsys.com>,
	<nelson.costa@synopsys.com>, <shawn.wen@rock-chips.com>,
	<nicolas.dufresne@collabora.com>, <hverkuil@xs4all.nl>,
	<hverkuil-cisco@xs4all.nl>
CC: <kernel@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <20240719124032.26852-5-shreeya.patel@collabora.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240719124032.26852-5-shreeya.patel@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186632 [Jul 20 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/20 20:49:00 #26110273
X-KSMG-AntiVirus-Status: Clean, skipped

Hello everybody

On 7/19/24 15:40, Shreeya Patel wrote:
> Add initial support for the Synopsys DesignWare HDMI RX
> Controller Driver used by Rockchip RK3588. The driver
> supports:
>   - HDMI 1.4b and 2.0 modes (HDMI 4k@60Hz)
>   - RGB888, YUV422, YUV444 and YCC420 pixel formats
>   - CEC
>   - EDID configuration
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
>    - Create a separate config option for selecting the EDID
>      and enable it by default
>    - Improve the comment related to DV timings and move it
>      to the side of hdmirx_get_detected_timings
>    - Add 100ms delay before pulling the HPD high
>    - Do not return the detected timings from VIDIOC_G_DV_TIMINGS
>    - Drop the bus info from hdmirx_querycap
>    - If *num_planes != 0 then return 0 in hdmirx_queue_setup
>    - Set queue->min_queued_buffers to 1
>    - Drop q->allow_cache_hints = 0; as it's always 0 by default
>    - Add a comment for q->dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
>    - Drop .read = vb2_fop_read as it's not supported by driver
>    - Remove redundant edid_init_data_600M
>    - Make HPD low when driver is loaded
>    - Add support for reading AVI Infoframe
>    - Remove msg_len checks from hdmirx_cec_transmit
>    - Add info about the CEC compliance test in the cover letter
>    - Add arbitration lost status
>    - Validate the physical address inside the EDID
> 
> Changes in v3 :-
>    - Use v4l2-common helper functions
> 
> Changes in v2 :-
>    - Fix checkpatch --strict warnings
>    - Rename resets, vo1-grf and HPD node names as per the DT changes
> 
>   drivers/media/platform/Kconfig                |    1 +
>   drivers/media/platform/Makefile               |    1 +
>   drivers/media/platform/synopsys/Kconfig       |    3 +
>   drivers/media/platform/synopsys/Makefile      |    2 +
>   .../media/platform/synopsys/hdmirx/Kconfig    |   27 +
>   .../media/platform/synopsys/hdmirx/Makefile   |    4 +
>   .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2763 +++++++++++++++++
>   .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
>   .../synopsys/hdmirx/snps_hdmirx_cec.c         |  285 ++
>   .../synopsys/hdmirx/snps_hdmirx_cec.h         |   44 +
>   10 files changed, 3524 insertions(+)
>   create mode 100644 drivers/media/platform/synopsys/Kconfig
>   create mode 100644 drivers/media/platform/synopsys/Makefile
>   create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
>   create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
>   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
>   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c
>   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h
> 
...
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> new file mode 100644
> index 000000000000..1dfecf256393
> --- /dev/null
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -0,0 +1,2763 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*

...

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


AFAIK there's no unified opinion on droping mutex_destroy.
Is it so accepted in media subsystem or should we used devm_mutex_init?


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

...

-- 
Best regards
George

