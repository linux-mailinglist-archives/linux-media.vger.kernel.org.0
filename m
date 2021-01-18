Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E807D2FA84F
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 19:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407437AbhARSGI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 13:06:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407477AbhARSE7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 13:04:59 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2892AC0613D3
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 10:04:15 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 2C1FA1F44837
Subject: Re: [PATCH v6 3/4] media: rockchip: rkisp1: carry ip version
 information
To:     Heiko Stuebner <heiko@sntech.de>, dafna.hirschfeld@collabora.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Cc:     linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
        christoph.muellner@theobroma-systems.com, tfiga@chromium.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
References: <20210118110448.275389-1-heiko@sntech.de>
 <20210118110448.275389-4-heiko@sntech.de>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <cd761d57-ede5-2bde-8170-eae2b95a29c1@collabora.com>
Date:   Mon, 18 Jan 2021 15:04:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210118110448.275389-4-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/18/21 8:04 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The IP block evolved from its rk3288/rk3399 base and the vendor
> designates them with a numerical version. rk3399 for example
> is designated V10 probably meaning V1.0.
> 
> There doesn't seem to be an actual version register we could read that
> information from, so allow the match_data to carry that information
> for future differentiation.
> 
> Also carry that information in the hw_revision field of the media-
> controller API, so that userspace also has access to that.
> 
> The added versions are:
> - V10: at least rk3288 + rk3399
> - V11: seemingly unused as of now, but probably appeared in some soc
> - V12: at least rk3326 + px30
> - V13: at least rk1808
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  Documentation/admin-guide/media/rkisp1.rst    | 16 ++++++++++++++
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 21 +++++++++++--------
>  include/uapi/linux/rkisp1-config.h            | 16 ++++++++++++++
>  3 files changed, 44 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/admin-guide/media/rkisp1.rst b/Documentation/admin-guide/media/rkisp1.rst
> index 2267e4fb475e..ccf418713623 100644
> --- a/Documentation/admin-guide/media/rkisp1.rst
> +++ b/Documentation/admin-guide/media/rkisp1.rst
> @@ -13,6 +13,22 @@ This file documents the driver for the Rockchip ISP1 that is part of RK3288
>  and RK3399 SoCs. The driver is located under drivers/staging/media/rkisp1
>  and uses the Media-Controller API.
>  
> +Revisions
> +=========
> +
> +There exist multiple smaller revisions to this ISP that got introduced in
> +later SoCs. Revisions can be found in the enum :c:type:`rkisp1_cif_isp_version`
> +in the UAPI and the revision of the ISP inside the running SoC can be read
> +in the field hw_revision of struct media_device_info as returned by
> +ioctl MEDIA_IOC_DEVICE_INFO.
> +
> +Versions in use are:
> +
> +- RKISP1_V10: used at least in rk3288 and rk3399
> +- RKISP1_V11: declared in the original vendor code, but not used
> +- RKISP1_V12: used at least in rk3326 and px30
> +- RKISP1_V13: used at least in rk1808
> +
>  Topology
>  ========
>  .. _rkisp1_topology_graph:
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 68da1eed753d..f7e9fd305548 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -104,6 +104,7 @@
>  struct rkisp1_match_data {
>  	const char * const *clks;
>  	unsigned int size;
> +	enum rkisp1_cif_isp_version isp_ver;
>  };
>  
>  /* ----------------------------------------------------------------------------
> @@ -411,15 +412,16 @@ static const char * const rk3399_isp_clks[] = {
>  	"hclk",
>  };
>  
> -static const struct rkisp1_match_data rk3399_isp_clk_data = {
> +static const struct rkisp1_match_data rk3399_isp_match_data = {
>  	.clks = rk3399_isp_clks,
>  	.size = ARRAY_SIZE(rk3399_isp_clks),
> +	.isp_ver = RKISP1_V10,
>  };
>  
>  static const struct of_device_id rkisp1_of_match[] = {
>  	{
>  		.compatible = "rockchip,rk3399-cif-isp",
> -		.data = &rk3399_isp_clk_data,
> +		.data = &rk3399_isp_match_data,
>  	},
>  	{},
>  };
> @@ -457,15 +459,15 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>  
>  static int rkisp1_probe(struct platform_device *pdev)
>  {
> -	const struct rkisp1_match_data *clk_data;
> +	const struct rkisp1_match_data *match_data;
>  	struct device *dev = &pdev->dev;
>  	struct rkisp1_device *rkisp1;
>  	struct v4l2_device *v4l2_dev;
>  	unsigned int i;
>  	int ret, irq;
>  
> -	clk_data = of_device_get_match_data(&pdev->dev);
> -	if (!clk_data)
> +	match_data = of_device_get_match_data(&pdev->dev);
> +	if (!match_data)
>  		return -ENODEV;
>  
>  	rkisp1 = devm_kzalloc(dev, sizeof(*rkisp1), GFP_KERNEL);
> @@ -494,15 +496,16 @@ static int rkisp1_probe(struct platform_device *pdev)
>  
>  	rkisp1->irq = irq;
>  
> -	for (i = 0; i < clk_data->size; i++)
> -		rkisp1->clks[i].id = clk_data->clks[i];
> -	ret = devm_clk_bulk_get(dev, clk_data->size, rkisp1->clks);
> +	for (i = 0; i < match_data->size; i++)
> +		rkisp1->clks[i].id = match_data->clks[i];
> +	ret = devm_clk_bulk_get(dev, match_data->size, rkisp1->clks);
>  	if (ret)
>  		return ret;
> -	rkisp1->clk_size = clk_data->size;
> +	rkisp1->clk_size = match_data->size;
>  
>  	pm_runtime_enable(&pdev->dev);
>  
> +	rkisp1->media_dev.hw_revision = match_data->isp_ver;
>  	strscpy(rkisp1->media_dev.model, RKISP1_DRIVER_NAME,
>  		sizeof(rkisp1->media_dev.model));
>  	rkisp1->media_dev.dev = &pdev->dev;
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index ecfb8f7a6c70..97d7829d8831 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -123,6 +123,22 @@
>  #define RKISP1_CIF_ISP_STAT_AFM           (1U << 2)
>  #define RKISP1_CIF_ISP_STAT_HIST          (1U << 3)
>  
> +
> +/**
> + * enum rkisp1_cif_isp_version - ISP variants
> + *
> + * @RKISP1_V10: used at least in rk3288 and rk3399
> + * @RKISP1_V11: declared in the original vendor code, but not used
> + * @RKISP1_V12: used at least in rk3326 and px30
> + * @RKISP1_V13: used at least in rk1808
> + */
> +enum rkisp1_cif_isp_version {
> +	RKISP1_V10 = 10,
> +	RKISP1_V11,
> +	RKISP1_V12,
> +	RKISP1_V13,
> +};
> +
>  enum rkisp1_cif_isp_histogram_mode {
>  	RKISP1_CIF_ISP_HISTOGRAM_MODE_DISABLE,
>  	RKISP1_CIF_ISP_HISTOGRAM_MODE_RGB_COMBINED,
> 
