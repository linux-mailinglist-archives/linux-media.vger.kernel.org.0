Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C82EC1A26A5
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 18:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729808AbgDHQBg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 12:01:36 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51632 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729747AbgDHQBg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 12:01:36 -0400
Received: by mail-wm1-f68.google.com with SMTP id z7so451501wmk.1;
        Wed, 08 Apr 2020 09:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bgRhZIyjaVy0rMlyDmDPKPQZBxgejQwqSwvwFypmTfA=;
        b=JEyQtK99j+UriBHHASh8TnZWjN8v8kiJjVj9Do6axLln+OFxq9PsE6X6IkUnd1Ever
         GNba5apz6MboLaOAAoHLrUQdJFgH/ojvUDzkdMmpqcLx/nwSzp6u0vuvdKanxUs5G+eB
         3tJs6wEqPx3G6I+d+M4OrQrMSavtMuRYRmQBLdn4q6T8Ox7KTefvIlf2keECoN4uvuC1
         eCsz3hdygGwzwhe61k9PjJMOZwTFmWOry+tHZAp3Akomgz1EnDAlFyy1nfuguyYHHBk+
         3fQhoCoGBZ9I3jXirmisplPyfXZQZLBZRFzBCIeYjVSlTGsKQ94DvdPY5LdAE5DXTu1y
         Vu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bgRhZIyjaVy0rMlyDmDPKPQZBxgejQwqSwvwFypmTfA=;
        b=efs/OotSKGqa3XuqOTQfitoNrt3gr6VTZLFuWYG9Zlu7bMrAW4JKN2bEhwJkdzydBo
         /RB+3a1OA9nM4PAC6Y3QR6qeIefMsCocFRp6E1Zimk0GYxfcsFiYG556HoJR1aUYa/HD
         d+Uy6XPAGY5PMsvYpZXaEjFZ5jJBCAD0lrDuNklwA79H2GrNwDMZseAgCMVnITqPksf5
         qMIp4Zp0GW/yuF2oGFcuLiBp/eqU6R/AolojJ/7aSSXBR+EdoeWxUw2jt0muEUhTagFb
         h7hvoJS6xq5nulISqu3lPRHGx3IreWjvbqozbGnjohI6NEsYv+jKyBY5vpRQUdKG/3zX
         T0qA==
X-Gm-Message-State: AGi0PuZUwLDP58bIliahHOO4vTRye9MBrt+4N1De1xRr9gmPioBpnXOU
        JJGMGZEAw4T7/g52mqX+p5GMXcpb7TQ=
X-Google-Smtp-Source: APiQypI8UbQqGHvMaGEQhmGM18tVLZa+uil7fC2onY+Tbr5QgyJ/Rl4imNFkVAlxAZmbFwyS+92AsQ==
X-Received: by 2002:a1c:9e08:: with SMTP id h8mr5107318wme.183.1586361692602;
        Wed, 08 Apr 2020 09:01:32 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net. [194.152.20.232])
        by smtp.gmail.com with ESMTPSA id t2sm18055177wrs.7.2020.04.08.09.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 09:01:23 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-sunxi@googlegroups.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com,
        Samuel Holland <samuel@sholland.org>, samuel@sholland.org
Subject: Re: [linux-sunxi] [PATCH] media: cedrus: Implement runtime PM
Date:   Wed, 08 Apr 2020 18:01:15 +0200
Message-ID: <9673642.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20200408010232.48432-1-samuel@sholland.org>
References: <20200408010232.48432-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Samuel!

Dne sreda, 08. april 2020 ob 03:02:32 CEST je Samuel Holland napisal(a):
> This allows the VE clocks and PLL_VE to be disabled most of the time.
> 
> Since the device is stateless, each frame gets a separate runtime PM
> reference. Enable autosuspend so the PM callbacks are not run before and
> after every frame.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> I tested this with v4l2-request-test. I don't have the setup to do
> anything more complicated at the moment.
> 
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |   7 ++
>  .../staging/media/sunxi/cedrus/cedrus_hw.c    | 115 ++++++++++++------
>  .../staging/media/sunxi/cedrus/cedrus_hw.h    |   3 +
>  3 files changed, 88 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c
> b/drivers/staging/media/sunxi/cedrus/cedrus.c index
> 3fad5edccd17..9aa1fc8a6c26 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -16,6 +16,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/pm.h>
> 
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ioctl.h>
> @@ -474,6 +475,11 @@ static int cedrus_remove(struct platform_device *pdev)
>  	return 0;
>  }
> 
> +static const struct dev_pm_ops cedrus_dev_pm_ops = {
> +	SET_RUNTIME_PM_OPS(cedrus_hw_suspend,
> +			   cedrus_hw_resume, NULL)
> +};
> +
>  static const struct cedrus_variant sun4i_a10_cedrus_variant = {
>  	.mod_rate	= 320000000,
>  };
> @@ -559,6 +565,7 @@ static struct platform_driver cedrus_driver = {
>  	.driver		= {
>  		.name		= CEDRUS_NAME,
>  		.of_match_table	= of_match_ptr(cedrus_dt_match),
> +		.pm		= &cedrus_dev_pm_ops,
>  	},
>  };
>  module_platform_driver(cedrus_driver);
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c index
> daf5f244f93b..b84814d5afe4 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -19,6 +19,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/interrupt.h>
>  #include <linux/clk.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/soc/sunxi/sunxi_sram.h>
> @@ -63,6 +64,8 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx, enum
> cedrus_codec codec) if (ctx->src_fmt.width > 2048)
>  		reg |= VE_MODE_PIC_WIDTH_MORE_2048;
> 
> +	pm_runtime_get_sync(ctx->dev->dev);
> +
>  	cedrus_write(ctx->dev, VE_MODE, reg);
> 
>  	return 0;
> @@ -71,6 +74,9 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx, enum
> cedrus_codec codec) void cedrus_engine_disable(struct cedrus_dev *dev)
>  {
>  	cedrus_write(dev, VE_MODE, VE_MODE_DISABLED);
> +
> +	pm_runtime_mark_last_busy(dev->dev);
> +	pm_runtime_put_autosuspend(dev->dev);
>  }
> 
>  void cedrus_dst_format_set(struct cedrus_dev *dev,
> @@ -134,12 +140,72 @@ static irqreturn_t cedrus_irq(int irq, void *data)
>  	else
>  		state = VB2_BUF_STATE_DONE;
> 
> +	cedrus_engine_disable(dev);
> +
>  	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx-
>fh.m2m_ctx,
>  					 state);
> 
>  	return IRQ_HANDLED;
>  }
> 
> +int cedrus_hw_resume(struct device *d)
> +{
> +	struct cedrus_dev *dev = dev_get_drvdata(d);
> +	int ret;
> +
> +	ret = clk_prepare_enable(dev->ahb_clk);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to enable AHB clock\n");
> +
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(dev->mod_clk);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to enable MOD clock\n");
> +
> +		goto err_ahb_clk;
> +	}
> +
> +	ret = clk_prepare_enable(dev->ram_clk);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to enable RAM clock\n");
> +
> +		goto err_mod_clk;
> +	}
> +
> +	ret = reset_control_reset(dev->rstc);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to apply reset\n");
> +
> +		goto err_ram_clk;
> +	}

Reset above causes problem. When format is set in cedrus_s_fmt_vid_cap() a 
function is called, which sets few registers in HW. Of course, there is no 
guarantee that someone will start decoding immediately after capture format is 
set. So, if the driver puts VPU to sleep in the mean time, reset will clear 
those registers and decoded video will be in different format than expected. It 
could be even argued that registers should not be set in that function and 
that this is design issue or bug in driver.

Anyway, I made a runtime PM support long time ago, but never do anything 
besides running few tests:
https://github.com/jernejsk/linux-1/commit/
d245b7fa2a26e519ff675a255c45230575a4a848

It takes a bit different approach. Power is enabled in start streaming and 
disabled in stop streaming. This is simpler approach and doesn't need 
autosuspend functionality. I also moved call to a function which sets format 
in HW registers to start streaming handler, so it's guaranteed to be set at 
the beginning.

Note that some registers are only set in start streaming handler. With your 
approach, if first frame is submitted too late, asserting and de-asserting 
reset line could reset those registers.

Best regards,
Jernej

> +
> +	return 0;
> +
> +err_ram_clk:
> +	clk_disable_unprepare(dev->ram_clk);
> +err_mod_clk:
> +	clk_disable_unprepare(dev->mod_clk);
> +err_ahb_clk:
> +	clk_disable_unprepare(dev->ahb_clk);
> +
> +	return ret;
> +}
> +
> +int cedrus_hw_suspend(struct device *d)
> +{
> +	struct cedrus_dev *dev = dev_get_drvdata(d);
> +
> +	reset_control_assert(dev->rstc);
> +
> +	clk_disable_unprepare(dev->ram_clk);
> +	clk_disable_unprepare(dev->mod_clk);
> +	clk_disable_unprepare(dev->ahb_clk);
> +
> +	return 0;
> +}
> +
>  int cedrus_hw_probe(struct cedrus_dev *dev)
>  {
>  	const struct cedrus_variant *variant;
> @@ -236,42 +302,19 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
>  		goto err_sram;
>  	}
> 
> -	ret = clk_prepare_enable(dev->ahb_clk);
> -	if (ret) {
> -		dev_err(dev->dev, "Failed to enable AHB clock\n");
> -
> -		goto err_sram;
> -	}
> -
> -	ret = clk_prepare_enable(dev->mod_clk);
> -	if (ret) {
> -		dev_err(dev->dev, "Failed to enable MOD clock\n");
> -
> -		goto err_ahb_clk;
> -	}
> -
> -	ret = clk_prepare_enable(dev->ram_clk);
> -	if (ret) {
> -		dev_err(dev->dev, "Failed to enable RAM clock\n");
> -
> -		goto err_mod_clk;
> -	}
> -
> -	ret = reset_control_reset(dev->rstc);
> -	if (ret) {
> -		dev_err(dev->dev, "Failed to apply reset\n");
> -
> -		goto err_ram_clk;
> +	pm_runtime_set_autosuspend_delay(dev->dev, 1000);
> +	pm_runtime_use_autosuspend(dev->dev);
> +	pm_runtime_enable(dev->dev);
> +	if (!pm_runtime_enabled(dev->dev)) {
> +		ret = cedrus_hw_resume(dev->dev);
> +		if (ret)
> +			goto err_pm;
>  	}
> 
>  	return 0;
> 
> -err_ram_clk:
> -	clk_disable_unprepare(dev->ram_clk);
> -err_mod_clk:
> -	clk_disable_unprepare(dev->mod_clk);
> -err_ahb_clk:
> -	clk_disable_unprepare(dev->ahb_clk);
> +err_pm:
> +	pm_runtime_disable(dev->dev);
>  err_sram:
>  	sunxi_sram_release(dev->dev);
>  err_mem:
> @@ -282,11 +325,9 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
> 
>  void cedrus_hw_remove(struct cedrus_dev *dev)
>  {
> -	reset_control_assert(dev->rstc);
> -
> -	clk_disable_unprepare(dev->ram_clk);
> -	clk_disable_unprepare(dev->mod_clk);
> -	clk_disable_unprepare(dev->ahb_clk);
> +	pm_runtime_disable(dev->dev);
> +	if (!pm_runtime_status_suspended(dev->dev))
> +		cedrus_hw_suspend(dev->dev);
> 
>  	sunxi_sram_release(dev->dev);
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h index
> 604ff932fbf5..17822b470a1e 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> @@ -22,6 +22,9 @@ void cedrus_engine_disable(struct cedrus_dev *dev);
>  void cedrus_dst_format_set(struct cedrus_dev *dev,
>  			   struct v4l2_pix_format *fmt);
> 
> +int cedrus_hw_resume(struct device *dev);
> +int cedrus_hw_suspend(struct device *dev);
> +
>  int cedrus_hw_probe(struct cedrus_dev *dev);
>  void cedrus_hw_remove(struct cedrus_dev *dev);




