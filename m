Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA10645A0FB
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 12:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233564AbhKWLMU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 06:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbhKWLMU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 06:12:20 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47CCEC061574;
        Tue, 23 Nov 2021 03:09:12 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 289601F454F9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637665746; bh=NuYVgYcm/5QmTwPPl+jnnTdg3Amocx5TpmqHRzUvEcg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LSqSWvdz2ir1uJRRRP+MYhzzqSCvQZXUIBGUzi1rgAsuwV6O1MxSQ8YhOI51oH/dp
         H6HzqaI4iRClnWmQhWz6yBILvWHnjD1XuG0EKeHg1L/go7KulSSW9x82lw6wv0PR5S
         eDjKRYx8ohBfs2Q55Mr18weoiX70ePI50Ll/OGLSWQlV7LMzcwCsBEFiHpHDv4n8dr
         gvfHlQ8ysV5xX0Nnxf7fp4FdFkmA3ftpCeqf2f+xhJGxdyGdDacAsL65jeVuuSqbE5
         T2CzggMgSeNlZh9480EWQJbSyKQutbEpimE2LUk+2F0bnWe4bU7aldi3NXvPjDQ96D
         pLUQPB/xWapxg==
Subject: Re: [PATCH 1/7] media: hantro: add support for reset lines
To:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@vanguardiasur.com.ar, nicolas.dufresne@collabora.com,
        mchehab@kernel.org, robh+dt@kernel.org, mripard@kernel.org,
        wens@csie.org, p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
References: <20211122184702.768341-1-jernej.skrabec@gmail.com>
 <20211122184702.768341-2-jernej.skrabec@gmail.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <08e80e9e-f646-72e4-e4d4-f8e6310228f1@collabora.com>
Date:   Tue, 23 Nov 2021 12:09:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211122184702.768341-2-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jernej,

Thanks for the patch.

W dniu 22.11.2021 o 19:46, Jernej Skrabec pisze:
> Some SoCs like Allwinner H6 use reset lines for resetting Hantro G2. Add
> support for them.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>   drivers/staging/media/hantro/hantro.h     |  3 +++
>   drivers/staging/media/hantro/hantro_drv.c | 15 ++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index 7da23f7f207a..33eb3e092cc1 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -16,6 +16,7 @@
>   #include <linux/videodev2.h>
>   #include <linux/wait.h>
>   #include <linux/clk.h>
> +#include <linux/reset.h>
>   
>   #include <media/v4l2-ctrls.h>
>   #include <media/v4l2-device.h>
> @@ -171,6 +172,7 @@ hantro_vdev_to_func(struct video_device *vdev)
>    * @dev:		Pointer to device for convenient logging using
>    *			dev_ macros.
>    * @clocks:		Array of clock handles.
> + * @resets:		Array of reset handles.
>    * @reg_bases:		Mapped addresses of VPU registers.
>    * @enc_base:		Mapped address of VPU encoder register for convenience.
>    * @dec_base:		Mapped address of VPU decoder register for convenience.
> @@ -190,6 +192,7 @@ struct hantro_dev {
>   	struct platform_device *pdev;
>   	struct device *dev;
>   	struct clk_bulk_data *clocks;
> +	struct reset_control *resets;
>   	void __iomem **reg_bases;
>   	void __iomem *enc_base;
>   	void __iomem *dec_base;
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index ab2467998d29..8c3de31f51b3 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -905,6 +905,10 @@ static int hantro_probe(struct platform_device *pdev)
>   			return PTR_ERR(vpu->clocks[0].clk);
>   	}
>   
> +	vpu->resets = devm_reset_control_array_get(&pdev->dev, false, true);
> +	if (IS_ERR(vpu->resets))
> +		return PTR_ERR(vpu->resets);
> +
>   	num_bases = vpu->variant->num_regs ?: 1;
>   	vpu->reg_bases = devm_kcalloc(&pdev->dev, num_bases,
>   				      sizeof(*vpu->reg_bases), GFP_KERNEL);
> @@ -978,10 +982,16 @@ static int hantro_probe(struct platform_device *pdev)
>   	pm_runtime_use_autosuspend(vpu->dev);
>   	pm_runtime_enable(vpu->dev);
>   
> +	ret = reset_control_deassert(vpu->resets);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to deassert resets\n");
> +		return ret;
> +	}
> +
>   	ret = clk_bulk_prepare(vpu->variant->num_clocks, vpu->clocks);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Failed to prepare clocks\n");
> -		return ret;
> +		goto err_rst_assert;

Before your patch is applied if clk_bulk_prepare() fails, we
simply return on the spot. After the patch is applied not only
do you...

>   	}
>   
>   	ret = v4l2_device_register(&pdev->dev, &vpu->v4l2_dev);
> @@ -1037,6 +1047,8 @@ static int hantro_probe(struct platform_device *pdev)
>   	v4l2_device_unregister(&vpu->v4l2_dev);
>   err_clk_unprepare:
>   	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
> +err_rst_assert:
> +	reset_control_assert(vpu->resets);

...revert the effect of reset_control_deassert(), you also...

>   	pm_runtime_dont_use_autosuspend(vpu->dev);
>   	pm_runtime_disable(vpu->dev);

... do pm_*() stuff. Is there any reason why this is needed?

Andrzej

>   	return ret;
> @@ -1055,6 +1067,7 @@ static int hantro_remove(struct platform_device *pdev)
>   	v4l2_m2m_release(vpu->m2m_dev);
>   	v4l2_device_unregister(&vpu->v4l2_dev);
>   	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
> +	reset_control_assert(vpu->resets);
>   	pm_runtime_dont_use_autosuspend(vpu->dev);
>   	pm_runtime_disable(vpu->dev);
>   	return 0;
> 

